Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6917674CA74
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E5A10E135;
	Mon, 10 Jul 2023 03:24:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2110.outbound.protection.outlook.com [40.107.117.110])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51CC310E139
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MGE5F6oSsCYoAZsW5Mxia5nDoVMkL8Upz1vBnP2lFQv6QoGlSqxYPpjC9Oi7rSNXzu6fdTQcMQBaAjKO/ba88+WttNUqYRC+7GLFTCio7K5UCV457LnSoGi1GUpEHYzDJEqE0S7H/DAF/y+CxBeb9MVR92Vos8NiydUaryPgBaDF6ti0CjxhXCZ+3Itf54g+O4hYwjUSwu6lWZxcGM1MXq5PGR9MBQDV6hbftTGJjjFrdpfXfLNWbH7w5VePTgiPduIwy6jpH7fVf1thuDuuQUB282Jqjp4nFdxa6TDQGjHtXUchIJ9XRp4N45/AVbNMZxz27ikktet4CSADieJqKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gK9FuGMKcBBbyuDk4sJW5vpeLpB47BAwKFQje1KuYEc=;
 b=GwMCjgfXE5IMqT7VT6gpmqaRoo5oNK0jr1wWmKHBsiyLuNzeukPFgM/TvEcq8sVeOe33XyZWTYivaO3T3xtrMEvMUeVsEVEqWDHd/B00mW4kmtwx8533bSer7HGWZf+gCK19yVrr8HX5ll7oZ88/ujdLssSXvmFCnKxDXau32brQ7yudM2wFpAhbsgjMCpGRKZWFFhKp27QsuV340BPoZ45ei7tqJxSbD8q1Adc4IavtYW4SqVFoNwvj3UpHIl8xpjb89Dl/sFHNHmGSIIb7P3oxl38dPp5boPnFc1zm7/Dj/P7oRZPXM3N8zoK5h6+fzD0CUnttArVRcsdyImbgtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gK9FuGMKcBBbyuDk4sJW5vpeLpB47BAwKFQje1KuYEc=;
 b=VgblIRppIet+1bXdVbPWrxXzcE3smOU28Wnlhu6Y8ZoqnJEkPrG/Hmz/saTA5Nii0kshXU/Jio5MeE78HQZVL4MCbkowRJNYQSwhaQlskE8YtNSAO+XIdtChPDWdHMKUC8T2KClHQNx+g05hm7YmVl5HGsmiOJe0sAvLvvQMql93srYk8t93CRK8yPxmby14pq5hUK/6c9gik9T+E02JRLmnmE7I+jpdYmTP+e256vglevWQOlluIFL4DkH/0OCHgFnJNh/wYMghG3zzYG5J4aXnNeniFjX+3hgXP/6wIdEW5E0oa4owcMRxgNw8jQWq+OwcK8txvJGV2Yz+s9HfCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYSPR06MB6472.apcprd06.prod.outlook.com (2603:1096:400:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:39 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:39 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 13/19] drm/tegra: dpaux: Fix incorrect return value of
 platform_get_irq
Date: Mon, 10 Jul 2023 11:23:49 +0800
Message-Id: <20230710032355.72914-13-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYSPR06MB6472:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc6072d-1b4f-4173-4900-08db80f5319d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xHdabf4w8W1sAhciEG8ip8bya0k+LVscXQaQlH/V/PR+5R/xUZhdMfKjfiepr7Wx1uHw1611iBxOFhyYQE1peTxx1Krrt8Yq982cRod/KpnbVkP0Vw2+fX5tXVVL05jAxAXgKZpH2JrS55bpNKFRue1/GxUpHNKoYJBKxpOxmQyclTfcAF1u55vYr9R+5z4/bYpBHPHYTZiB1wh+KAcAI6py82OPIMzZmQenNcLmLE8IKf2T7FEgQMClB/jG0qRGwQ4J4utfAgG3FfKMRDEqUoh3Xv/c/Tq7ok3I1vj3eVgQsjXBvE2swkFToLSJoi2Iy/6e7/Q7Ed0MjnMoXGYUR1IAFMbD7pgueO9CPK9m5h+qfPbW8KTH9oQwjk21oMRqNQTHtTAE17qkxF34EHfwQ71cSs95QfApV97gnVlbclhC2JUXGCaQxupU0FNB6wqBUGAxjzMn0H7GvDK1uRT0y5g3NQXfqXPaN7UoKIaiZNaKiW5zlNa6PbdXvSPEotjdP2jXqGOMFWhHHRdo4l/dx8/qrjtKoNMM2HSZCZoxCSXPh5NPyODmGlGy2rMlEV5Fd0dgeu8lN4rGVsyWGpKnSRj0cCChIhqfcM3e0ZhS7mj1RqQl4Tp6PbIQxXQpd3nE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(186003)(6506007)(26005)(1076003)(2616005)(6512007)(83380400001)(4744005)(41300700001)(4326008)(2906002)(66556008)(316002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(54906003)(36756003)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qKap0KcjueWj0OZ9xBDDiolsE0PiKFV7k4HXu2NiszOYcp2Jdd4rfl2trfSJ?=
 =?us-ascii?Q?RlpYClqaYtZvSFjtskAL8LpV70leGQjK9LEV+r/CaAX99qegkrEqkRuFgoQB?=
 =?us-ascii?Q?HCmvM8rShs8BX+0oNHSxtwsnwUthQ235b8p3Jbq2U3y8QCEdtPAWsLEQeucz?=
 =?us-ascii?Q?K5GK7VYYFPXdzs7b6PLhchn9+NMtyK8qB+jcBuXEedpBjPF3R9aEi1rFrfCP?=
 =?us-ascii?Q?ZeVwpqCSktMVc6wRYViJ3ya3eMor1zjY72EZSLwqfqoQhT2q/3gbhdRNNsIt?=
 =?us-ascii?Q?UYM89G+fbFlcMCFSzTyva2oZ6hu4raYLNrdqgMhx36A/1W9m/NuN6v+qkcbO?=
 =?us-ascii?Q?hFI6LMKDsPRKJFbZ7YqOaUHAHvn1U0kktBtKCJuezBp3+Hh2NGuQXjpxXndv?=
 =?us-ascii?Q?CD9Hj+5UmJ/FAb+ofqxo6+Rdi6k7217X3C30H0nfS0FYvq7MSSBvTkPSSbyk?=
 =?us-ascii?Q?fzCutwtQTkPsktaChc8TtNKXjG577WE9JGpzinlQMKPd27PnX6hiN8CPjuib?=
 =?us-ascii?Q?g8IPEqV2xF3bI8eLlzMKE6Bap0lJE/bla2XqiJJBgUoRuJkEikfA+bml4lXF?=
 =?us-ascii?Q?oZlL08PsGsfFVC2IUqeW1TtslqC+RxCL/SO7gSi1I5K6yhuG2q54rcBhAlox?=
 =?us-ascii?Q?AFo4UXRYVkyPBySwC4jGTiBz+xXc3jd8WzSyHgKi8G60al76Kssbl4THIkHA?=
 =?us-ascii?Q?GQvUr8Sv6anP0RQdaLr/s+CmVrJvfcQW7zdyiXttHMCXYIPMSplJKoPofwZj?=
 =?us-ascii?Q?3X65KYQLQCY171WpWM4rtyG+4ffrmIVhF7LgHg663aHz/jNRTCKHOpyHMhw3?=
 =?us-ascii?Q?QaLBf6sh2b+WeIhjKLDbi6uX3KB/5wUveyrP36Nhgc4nv6UohOnpSCD1XiFd?=
 =?us-ascii?Q?Kp9+AReK51ua9gj4I6Nifc9MEsAGGkuF2D8uUlcqoS8aAG7PGim5Tn4+23Ml?=
 =?us-ascii?Q?wJKhBcf245ZNo/vK8Gtd1gDiINj8qt9HKnjdd0y+CYazQLVM9Ob2Jg+/ZsW0?=
 =?us-ascii?Q?XdcfE2j2HKqPo6v2Brw6BMzFPXIJQWeQONJ4IWj4Vo+4A3mHxkt5qyJjksxj?=
 =?us-ascii?Q?CHsWrdY/21AgWzQVQNqpsanTIfW+2cTLflD9RwoXigLemRiyWAY5LF0E8qmj?=
 =?us-ascii?Q?bZQdL7DH8SLlbIHRMp8gZSeEKOTaV+Ay7foIa7Ki2Ea60DN3ZSa9JIetpMds?=
 =?us-ascii?Q?7AvWZ9/qQJdFPzpXfiksm4aPxu3sf69wFrjJJbFQV5ApckI0yfe5YdKDCxEw?=
 =?us-ascii?Q?+nAHz/H8JeDsAb+fy3CORbpyxONffEUagd4m5C/cPh1GGX+MkitbH0JmHcxr?=
 =?us-ascii?Q?MiDw1hA2ypWa1v+m5M/xuIjDhhaCPuauYed8qt0WqCVg1fTi9js9KsuCyIIS?=
 =?us-ascii?Q?Vn1T2xzBQq7aRS0uzF+l7VE7v/7idt3bLCJl+XwxOoTGgSctCLECA7+dyhr/?=
 =?us-ascii?Q?Ns1ZeD9IZ/oVi658CebbG3T7hRXhrPym+PY2YbwF0ag8ilaP6ZvT4W3JTfz5?=
 =?us-ascii?Q?IW/nkoKmnqK/lOF2pBErNzy7eOwJEdFujrTEBOdwJ4hVVpXuLuXUxZ3DjLSl?=
 =?us-ascii?Q?v2lYLSZS9pSDUbwviv613V4fNxPVcWspu7oL/LSh?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc6072d-1b4f-4173-4900-08db80f5319d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:39.2916 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 75KM/uAo4k0vng/f8Z3ft+9v+nqCylhQ5IDCl4stZ2r6SXX/q5zmgxSsD2Wk3OHkPCfqcodLgOJ23B80CGO5og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB6472
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <treding@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When platform_get_irq fails, we should return dpaux->irq
instead of -ENXIO.

Fixes: 6b6b604215c6 ("drm/tegra: Add eDP support")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 4699def04190..f120897ce4b3 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -466,7 +466,7 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 
 	dpaux->irq = platform_get_irq(pdev, 0);
 	if (dpaux->irq < 0)
-		return -ENXIO;
+		return dpaux->irq;
 
 	if (!pdev->dev.pm_domain) {
 		dpaux->rst = devm_reset_control_get(&pdev->dev, "dpaux");
-- 
2.39.0

