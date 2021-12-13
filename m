Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45346472581
	for <lists+dri-devel@lfdr.de>; Mon, 13 Dec 2021 10:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D7110E733;
	Mon, 13 Dec 2021 09:44:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2109.outbound.protection.outlook.com [40.107.255.109])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DF1910E733
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Dec 2021 09:44:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJA0bcHhRSZ5FGdRPDUEf+LWm5eMhOsNz8T/IxfpI05wEnJZRTa7ZAymBgvZ6bixD4pywDTEsj4ac4APYCa5lrtuXBK2Yivh/0c6aPgnZRTPwAwGzKNuCAv7VWmieovsh1BcW4xGowHDjwMddjYsQKNYLnJeeSHhs3TsRqEoLm1zWDj4z7DHQHkeCP63oyMzZHS+FA2RXW9VvHhZLtrzTdiKPfUFdI6QLe6GvYpARH+pwCKs4Tdn+azD2kP0E7s1UZg2fhusTb3YywD4IqQxWxgJ3N4jmhCgvvqtFYXBHXxxo+qnHy34sobE/RoJWvDtYKGFDO7Azf3eF7LtY7vr8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MkESgjVgETZNv8A78M/+7t4S638Il2orjfyHX+T9VXY=;
 b=gCpp139ToTSU5TnsWszx72RFmbiEMZycoadJkN21dU3kt2UD0/rX4gR4ox7pY4zsbo66w1jZN5cs+r9WDX/9A0lPkTpYuuOUquK2P4jWDxkopLr7qdAHB1R7TVb7ZJ6KmhrBSR4sqQctDNPCX7N0hZULEiYb6CsA8KT3p8u7JexdaqMBX/vk4dcjQhHbDKlSmaSjmlPsnOHLEcaIgl6bn88c5rJoaYCMqPOAEBJqTdNK7heXli26mWznNhSAOXFr997ismoodrZd4N+yYtM5bkXR5DH0qCDcfAXTKgbgZW28rIk3t78TmhhRQRNn/FVQFD8g3mV/Dn0XPUBC8HqiUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MkESgjVgETZNv8A78M/+7t4S638Il2orjfyHX+T9VXY=;
 b=QAfEUxzGH6tz5BRA0HeXZqV0ibT7WB9Zah/lEB9DAChnfWXd3vVT/UsJZIRmF+BrAq5wcoXSq8sW4WjFxUW6g//OXlbyp6dV9z7Wh6EPVbn2e2oOv7LEaf/pMI4rdFO4iiN3ycvjgavPNlu3VpN2eKQ6UzX18PPHZSkW0TzyXz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3050.apcprd06.prod.outlook.com (2603:1096:100:39::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.16; Mon, 13 Dec
 2021 09:43:59 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::a0cf:a0e2:ee48:a396%4]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 09:43:59 +0000
From: Qing Wang <wangqing@vivo.com>
To: Linus Walleij <linus.walleij@linaro.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] gpu: drm: mcde: add missing of_node_put before return
Date: Mon, 13 Dec 2021 01:43:49 -0800
Message-Id: <1639388629-63851-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR03CA0052.apcprd03.prod.outlook.com
 (2603:1096:202:17::22) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58dcdb05-fec0-42f3-35ec-08d9be1d1655
X-MS-TrafficTypeDiagnostic: SL2PR06MB3050:EE_
X-Microsoft-Antispam-PRVS: <SL2PR06MB3050A78226423FBF13F69019BD749@SL2PR06MB3050.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xTjsg3tGgakfVDt9aXCVL9VL7pXR5ZWCWdAzfD6/97YzqclUIOTkUSXnq5wezbceINj3p2m0BDmcg/vt36RLTq2+mecS1+OUZn4a0HucjDyU1ZHMvzLPyt4iRADElT0zzAwA/qBFJWL3fEjrz2u+F59XOhBBKIbTkzAMt3cNm+4IrwYDnEIeIk5Vs+ZhWEHpw9SMehLzmBkpYTHiGTznTkt/RHdpnxmsWiES8hYMRgCA9V7vNVe0UktHE597cFObK5Trw1vVR1+s12rs6CbJ8fIv1Rsw0wtxjHvR+LpV1mi4ejKip+HVawPPb9pHzKxJw0WNJfIbcBAKZ3I1H2UXwEvL7h67z4/n7npz7yZW7m9HNB88LAOCqTCrEQecZqx2cs+7TvxtxY3SV7mniHOlXtxcK1imSOB4ifezlNKCrgzRPs67c6DY9SzUWRIK0DmZLmqA1zZ0XHKkRCbHIADXEJ/4As5tU01RgS5KDgu1kpPTf3qgRSa/levetEkGz5/pcPza15ICK+J2lUkjigEh4NpDvpv49x7qn79tR88trHeLQHQ9ef83FOgjVR9ReVr1IxdaANo3Yph8jd3OdOuZVMJdGdBfMVE/9IM/8f93ROnfdgf5rOTdo56O3cH+zBWwMGp+gWc+555hhaoK3/LpHJg+W82cZXaZZ8QBhl/7xg8vHYB8y9zKrVbdzHZmagsVrHurIDNgSMVHJzvvUlMS1mb6F7ptko6giKhoIctNLaI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3082.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(83380400001)(52116002)(6506007)(110136005)(2906002)(316002)(508600001)(26005)(186003)(66946007)(36756003)(107886003)(66476007)(2616005)(66556008)(8936002)(6512007)(8676002)(4326008)(5660300002)(6486002)(38100700002)(4744005)(38350700002)(6666004)(473944003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vCzlEpgNb6aZmXbIwXRUeMpzLq4NL1zXi610OrgykVK+etmVmwamB7qZu3b+?=
 =?us-ascii?Q?TDxhzaVqEfteCNd26JKDJYev1byEH6zoZ68uHz8LgcI8m1EA/PsMIsLjea5O?=
 =?us-ascii?Q?h2XSjTG6AXhuF4DkdwJbCPPnLKhJkI2sdI8Jk6S33ghZPgtXNZxgnrJnbpy5?=
 =?us-ascii?Q?zqu2QbRFDjWqzMXw4SWz8JhcP2REod8iQ5gg/CXdMwxsKYDwTzv47lSeBBi4?=
 =?us-ascii?Q?Iv9+6bh4UejDixXD2b4O3zrFxI37l1eaChqNdEQsBb8Jm4ZSOuvPx48Kp7FT?=
 =?us-ascii?Q?YpLXP/T4KuMznuzAFGtCQcfPGu8BF65P/1bghnikqRITzyCEmZN2xBiRvY/k?=
 =?us-ascii?Q?btaKpbmOF0Tz6dLhfTxmKW0GqfFau0C42bK+/W3qhn22QQhwOOabVKQsmA5A?=
 =?us-ascii?Q?2cmZpT5MvlZJKH1Gx2dkjt0xDo0yw9KzaDcWejS6p4+5/ckohCISQC7jOU8F?=
 =?us-ascii?Q?QihuWSb9py9g8rlxZ6rsN8eCJaJJ+06RJJrikT8zOxB6/115791txYra9fBy?=
 =?us-ascii?Q?Xw4ucFMuZP/h7/3b2SijOUYYFCHT8UDci8jzMHbL/ibc/Qd43gvLqECbCDcY?=
 =?us-ascii?Q?4DzFNoW4o3lv97meYTL179flKyw65zVIO84h00dD5FDrVwzBstiEjRMIkdKb?=
 =?us-ascii?Q?FPlRZXIU0+Xqf+3Q+RwIiFhLfHQ6RPcmefNqH/E2ydWnmZEZ8Zqy0QtVfMDV?=
 =?us-ascii?Q?pbopD1lKPrVzIPF1r1QBeZNL1d3eYWv0dGOAn0Ks9CYD9lq9cC4u1ZJ0h5DA?=
 =?us-ascii?Q?sePeiIf+XjjaqDMe2Q6qgDXEZ1/PTrCUclBjtkujScC805NwCBpMlDbTGVcT?=
 =?us-ascii?Q?/LOZVPJ2MPrasrcjY5XM3iW65cP9fsGg60dZvLTzt0bMpNvBvETJQEG5JM8O?=
 =?us-ascii?Q?LaMJozXXlKKHm3KzUacAlsR2w6XbLR5fXd/Kbxllk9ROoQEy3fdR39GR7GZZ?=
 =?us-ascii?Q?9gA/l0uip3w1M+pFtICI/Z5NLdC1VZqUASchA8p9+SAKADJRdSMejwWJdare?=
 =?us-ascii?Q?o2QM05XUw0cqBvf3eKc5NX1gOEGUP9W9j0v6qB4eV+dfwcInGdgKPAMeEp/e?=
 =?us-ascii?Q?siRHyQ76tNjGWR3SPrKV2OtsgLBAax4IP5ud2jcUrVvfe3YZ9Dcpfwv9kl8l?=
 =?us-ascii?Q?UitvDjKjA6cuDLLEcfGucL5TEvfCJPJBwD1JGaDrfxJ30G2OE42SQAR0+EOA?=
 =?us-ascii?Q?KTbjq0LFsL2vLU68JHUyxaZlctGdyd1lYNYeTbuApPV1mHKyU4iW2AbQt2vl?=
 =?us-ascii?Q?LRD5TE2nikdpqaGwjlDbo4pJjpKgkMJg71xxuK3egXSnoERTPis8eLa7pI9L?=
 =?us-ascii?Q?ubS+4YTm3c8mej28S2xuZA3EqNoawVdlImQbJOOzTW/bxI6nNfI+BPIF5TkT?=
 =?us-ascii?Q?f1nimAJEmUPC7APSidpzIOFq36J65mqbNJfBq/8wu0CH3RIxh8UZF8xNO/lx?=
 =?us-ascii?Q?ZXvP7Cj6exjw6pB52BCoXK/2+7PLF+rNaQQ/udpuLkgjqKjqJCEx+zBr94rj?=
 =?us-ascii?Q?OrEbXU2bUWDDu9MY/v3afQy3f80SK3QUfCSlX+cBMuM0oYJRtbA08JyN0nIh?=
 =?us-ascii?Q?zF6+FYhEmb9dkPICaTXac7tOhgIrcf+8Dg4A8gNAGKlyRi1u+o28MaIq/pw5?=
 =?us-ascii?Q?JWQ4HMtp50nMTrdq36cJ/Ug=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58dcdb05-fec0-42f3-35ec-08d9be1d1655
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 09:43:58.9876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wvp5dsQ+Xozzr54MLrdqzXPA8qfAbUojjcAp9y6zj4NP8/5Ifpo3/zBir0HsTf3x3kzZ9kksB4G+huC/SiiFbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3050
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
Cc: Wang Qing <wangqing@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Wang Qing <wangqing@vivo.com>

Fix following coccicheck warning:
WARNING: Function "for_each_available_child_of_node" 
should have of_node_put() before return.

Early exits from for_each_available_child_of_node should decrement the
node reference counter.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/gpu/drm/mcde/mcde_dsi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mcde/mcde_dsi.c b/drivers/gpu/drm/mcde/mcde_dsi.c
index 5651734ce..cac1bde
--- a/drivers/gpu/drm/mcde/mcde_dsi.c
+++ b/drivers/gpu/drm/mcde/mcde_dsi.c
@@ -1110,6 +1110,7 @@ static int mcde_dsi_bind(struct device *dev, struct device *master,
 
 			bridge = of_drm_find_bridge(child);
 			if (!bridge) {
+				of_node_put(child);
 				dev_err(dev, "failed to find bridge\n");
 				return -EINVAL;
 			}
-- 
2.7.4

