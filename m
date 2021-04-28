Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FD0936DB01
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBEE26EB7C;
	Wed, 28 Apr 2021 15:13:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBB96EB68;
 Wed, 28 Apr 2021 15:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XE+cHfmXKX7vww9G+py3rHn0Ib/DeeA1yQwkREsSWMqbgLxsS+C0tphZzBZ6lmfaZ/X5Tn4mud7uWWPAN16Lyu5dwAAnyie7w9qJTjYmKSNZbotP28nQDwm+WcrQYWXveLxEepZJDNm/0ihOsy0z/ptva0cFKqYrsneRBLl8Cpsl4B7byQt0AqsxQAOZfNxABKnHRBxPz6WNHBX2h8Ca38KgcIRkqZgCQZEF+IsfMcafSfc7p9BIfCuIvTZy6wnDIV+1M3PUlHHDwUjvdtwNCFSFlQD9YRvNvRJN774wJ+TtnOufuo+W7QNsyX8mv1m7uMjaorNSIcgsghM5K/6NEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3YplCOTsOWVEPBM0hbZ9GublLwFAwkekCPXORZYxoI=;
 b=fIE3XsP01OG3w/ikvyV7Ph1rps9OgVPWulcPr8KbHLwFDKrfGQ7o3GwFJSL2Bh77imBhCUwBPX6XUyu1jsBSG5i4A3GJ98bxNfHHL2hIibU8tfOFinlfZGjKGOAaqr3OiVLtSAu6Hpnzaa8XMJeFM+fLmklRLw5GLM1pfzb1jvt4FVqP+LVqpVz7mmOro+SRvD/CSS6+O0KATSy6uD0dPyNLIGCvfcQJCkQvtFPdH0c3gIQBuCBdB9i6mLZ9/1IfQtrl7nkm5kC3DVHZXCk0vT0bFFg+kxs0NnJ4LZcjKBMjl6egXBfsPiBy8FSD9Xt+7ZjZWynvYs32NePlrY/7Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3YplCOTsOWVEPBM0hbZ9GublLwFAwkekCPXORZYxoI=;
 b=NwG0H3rEz/3kUb21CT+AtPRE5p8ALskS/ca1f3ueE8kmyyMdNyfhziumVzTaG0PtjKBK3Sg2VFCp4aUY1yFow0eF04dNk8dC6jSZ6H+JkStUaHAC4WsSq+Afpe8W8Bc7aGHUfXvaU8qn0PLGB6j3qCb4CJV6ciTqL8gMx0aUzec=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2749.namprd12.prod.outlook.com (2603:10b6:805:6d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.22; Wed, 28 Apr
 2021 15:13:04 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:13:04 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 18/27] drm/sched: Expose drm_sched_entity_kill_jobs
Date: Wed, 28 Apr 2021 11:11:58 -0400
Message-Id: <20210428151207.1212258-19-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:13:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 74a03a83-73e7-4550-6a4d-08d90a581f3a
X-MS-TrafficTypeDiagnostic: SN6PR12MB2749:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB2749ADD6332C8BDB610BC076EA409@SN6PR12MB2749.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:83;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oyeokwACEEb6kYJgJffPwFT0HVC7SzZV/XFCJZXXs66KcELWOq4z+PYmoBhAhTu81vOXSqsCV9Y21rcGs3iw0cYiQvMgoM8167BkMmpffmhfbO/0vahae4wdJBKOE7oWYonUeE6JcCVYlRDJO6HYp9fYnAiTwdtVRnOaZSAKU1kmdACM+mGFnV0Q75jw6ct8LyBV88K8Jsi9s7ur0cmv41JsYzNh2yrfZ8wWy11lEhizmlRb8iPQ8ZOhv9MAlo3MPSJix/xo0PGJNTIIUdlMvQx+d2yTuC85hxFKBrYLN1rowhOjAYJVxgrjvFQ4TAR4b0nStEKWl3zNKwqIpSmlBqTv1ONLIh2rQBzgRhVvQValSQHUchIV55W3MS80UDK8AHl3AFlSsxsL0DRGtOwpn1f38oexFDHU3A5he2XNBJ6H+6+QXVw7AovxCMJMhm58iwI+ad+dDz7i6hroGkWPjQ34cEwjG1r6a7OvgvcOFjtmxc3cOB+rVDu4uBUziCekkSd+CMIE4x6CkQagywC3v8+agDHVKnF4crLJjk3rVLnuIC5VWGWNv/XrvPXOf0MxZkiTFLcVyvxGPYK5j2I/MOWKhlvIQTf7TLWTx118Wn0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(366004)(16526019)(6666004)(6512007)(2616005)(1076003)(2906002)(6636002)(66556008)(186003)(86362001)(5660300002)(8936002)(83380400001)(6486002)(478600001)(44832011)(38100700002)(66946007)(52116002)(6506007)(66476007)(8676002)(4326008)(36756003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?vR3MRUO9FSYjh55ZIaebNLDKLjRUdudpps6nyfy3N+BO0SidzKShVPOAT4qs?=
 =?us-ascii?Q?A6gULmZBb9cfGIrGDiv6IvTXbgW45vbXzNK2rr24sk3tgSc7kKpNY6yGF+2p?=
 =?us-ascii?Q?MHVOSqmENvOMb4XpA+m9kgby9D0XHim65QTwD1gCtFwdee6oCrDyk2HtyaQi?=
 =?us-ascii?Q?7uE57FgK4MkxkuO6z51yu2mnFPNH4XZyOM59RrNAMbeoFrAg0TnyPtGKtQzX?=
 =?us-ascii?Q?rMLHRlZUJsdx/XN37IrZqr9ybnoUHsruF+vx0gOCSIP/OBXuZ/vcQijEVL/G?=
 =?us-ascii?Q?B1pQRvzK0B0FiK0zAG5vyIRgLR5olvOqSt92P9ARLGJTmwCd8KlNg/J0G8m3?=
 =?us-ascii?Q?pz+D9h2mPFeZhEkcCanivj//NdkRhCLNJkfgdX0Npj4iRneYhx2etR35z15o?=
 =?us-ascii?Q?GZosjxhoQ2+Yrm9UiIW5C9HcDIHVtkJM+9GndjuBBiiio6emkRjlWo7pCxVS?=
 =?us-ascii?Q?RgYEuwqUNwBFYKd+RqRg2l0korBxGxpxpry7h96WBRjSaM1xq1lol3vLhn4V?=
 =?us-ascii?Q?zbxHIYo5yWgmH9P7VLgTG+l/SKzw+fuV8cjBNGendzIJJkai3lvN4xumjDKB?=
 =?us-ascii?Q?GWwqfBSCLjKB0aybWWnqHR6XQ/D3ObYTlbB15ILAorM5JD5saA/2Qh/QqL67?=
 =?us-ascii?Q?+vETC3vLrRLk+krdWoyXUexnIHYp//BkNbxKGHHkDjKXsecGQCBIR5Pl1Hnn?=
 =?us-ascii?Q?V0YOK5MiWNvm9TevqmsTmTvJECdYmINvwrmVzIrQYPtvUQ92jY1NB5a9Ph18?=
 =?us-ascii?Q?dDD34a7a/OFgpiHKy5C4M04j3Qd0OzzPJkjSXSLS7whizCDXF4uRLGIYoFh9?=
 =?us-ascii?Q?bS40K8d/GAcqcAN7ifg/xiZNUkjcDYtVphi+KY0RQXqSJsDc10XZwuzL1QZh?=
 =?us-ascii?Q?ihoDRcyiNPovUo3bTJ4jBMBOya8EXL9TuTMuo9ZUf/mF4UXkQY1IGKnIdgQe?=
 =?us-ascii?Q?hZ5HS8wmsfXCMkUb3O6iI4mdx+qA59ouVNoT5DYcLhC/L8qTEECDaOI1ABb2?=
 =?us-ascii?Q?WQ+0c2Vy2vPqrEPby/h0T6Nf89hLXZlczjytrwGNoa4UMakoMQUCdYPErnOp?=
 =?us-ascii?Q?mywUDXar0EeFn8rnPwJpDd3NIN+A2vXEfI9tG+/9SQt3rE0bztGzC/rBX88V?=
 =?us-ascii?Q?USt18CJVthYAAiBMl27Gyco7corWRwUsOIbuJWtGRRLZZVJpSxm2ns3e0iGv?=
 =?us-ascii?Q?/PfelFsoeNl9qVsNw5ZrxrEIDPFxgD0c6U3f0J0VzUL0HTC8MKuF/sDEIGTz?=
 =?us-ascii?Q?uQBVqzuXqeRErEbrvObwA+hxWrCvANKrC1phgZUkRxGOxicc7+p826xh+Zan?=
 =?us-ascii?Q?BdXOc+RpaGmR75/UqJeDSAIvTgld9IcPaZ1F5AxezeAy0YNryncdEWejLCx3?=
 =?us-ascii?Q?aR7/E1zGxgDph52T0vO/frALQoAX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74a03a83-73e7-4550-6a4d-08d90a581f3a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:13:04.7997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IoLXhihCyaR7tl77E5y300I92pfiL3P6qjPrsSC508aX/Ul616d6Vyn0QoyGWXE4zh+xJFbO6RPTgG5j7AGSNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2749
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Will be used to complete all schedulte fences on device
remove

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 3 ++-
 include/drm/gpu_scheduler.h              | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index cb58f692dad9..9ff4bfd8f548 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -219,7 +219,7 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
  * Makes sure that all remaining jobs in an entity are killed before it is
  * destroyed.
  */
-static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
+void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *job;
 	int r;
@@ -249,6 +249,7 @@ static void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity)
 			DRM_ERROR("fence add callback failed (%d)\n", r);
 	}
 }
+EXPORT_SYMBOL(drm_sched_entity_kill_jobs);
 
 /**
  * drm_sched_entity_cleanup - Destroy a context entity
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index f888b5e9583a..9601d5b966ba 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -339,6 +339,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty);
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
+void drm_sched_entity_kill_jobs(struct drm_sched_entity *entity);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
 void drm_sched_entity_select_rq(struct drm_sched_entity *entity);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
