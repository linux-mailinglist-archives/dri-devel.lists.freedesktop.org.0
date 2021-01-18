Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2CC12FAC1F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jan 2021 22:02:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1825D6E5BB;
	Mon, 18 Jan 2021 21:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2085.outbound.protection.outlook.com [40.107.220.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 707306E5B4;
 Mon, 18 Jan 2021 21:02:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kh/tm237gPkJ/fUenhVmIZFpEaG6zBLT9zb3oC1GG38I/gKkG2txAZKFLbz2g4NHmtBS3x4LypUDi05OvETOExdGFxrOVQ0zdSwwEE3Ova42c43gQxEv1rQkuYmGqfjeqHWXr6/1Sr/PnVtbotjE1lfaRwkfdjD5FzAnC/leDZzxKzLiBw1fGyR+rQGi+HnIcfXKgR8drNXq2Gj4cWR51IvT5jf3tyrDi17RlPF75T6ZZvwdmR0Id2r+qaDo1NXdOuCBaNCQ/SEXALngzKvJ34yQ/gdLGiOnoit0KuJKTcL99StTPrzLNyFZBUKvYKZ2VD3vk8wBNN1tWJX4Zh8uKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+r4VsynykAXVhAXMWzkWfYRx8xc119kunjkr3AZ3Rg=;
 b=LqJ4o/vF2Rh+H6JgaRZ1g2Evv6XxuXL2F+OJOYDYMlgOkeafsJRCvF5IV8HIB4uZOcQ/IEQ99kSk8HuzCvlM6VOiqysU5bmIEzCU9A6UXQIJPN+i3qG2Cj1bhSz/gJJBvJh6QwrVKMTnrVkvGSYiMBfjhavqA7IxliZKskFiF+xrJ1T7tPVOJXkxw9/wRXd6LY0v/n/K4Cn42uquhP6b2gD6VQNm28v396Dmx5aFdkviLryfPCpcgOQ+dEzxRdWYmb1lyggJ+NT5mu6EEbeCk5/LbMcPJQ8VbHfwddG74lr+q22YbMir2PQvbMLGKh4IPnullHutn+7oGPyRJmBhHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X+r4VsynykAXVhAXMWzkWfYRx8xc119kunjkr3AZ3Rg=;
 b=TUQNSWXL0IxfQ0FGOTryPFlw8QDfsw6ghXHkJp57KQsG9bh6f39LQmvx/1r5EbYMekuWmcro0InaWL7IGfNcVxdPFSK/BzEpEjBRbp5NYR0E2/7le2ek6HrW9/kx+olt1cnND7J5zuy8YZiuJD3zdl9+0gcD3ax+b6gcKMdQO1A=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4767.namprd12.prod.outlook.com (2603:10b6:805:e5::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3763.10; Mon, 18 Jan
 2021 21:02:35 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::5d30:b29d:5f5b:6921%5]) with mapi id 15.20.3763.014; Mon, 18 Jan 2021
 21:02:35 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 ckoenig.leichtzumerken@gmail.com, daniel.vetter@ffwll.ch, robh@kernel.org,
 l.stach@pengutronix.de, yuq825@gmail.com, eric@anholt.net
Subject: [PATCH v4 08/14] drm/amdgpu: Fix a bunch of sdma code crash post
 device unplug
Date: Mon, 18 Jan 2021 16:01:17 -0500
Message-Id: <1611003683-3534-9-git-send-email-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
References: <1611003683-3534-1-git-send-email-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:84d3:21cc:478c:efa7]
X-ClientProxiedBy: YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00::33) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from ubuntu-1604-test.hitronhub.home
 (2607:fea8:3edf:49b0:84d3:21cc:478c:efa7) by
 YTXPR0101CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3763.9 via Frontend Transport; Mon, 18 Jan 2021 21:02:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f05136ca-1d2b-46c1-2763-08d8bbf4611a
X-MS-TrafficTypeDiagnostic: SN6PR12MB4767:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB4767BE4AC9563E66BFFEBFB4EAA40@SN6PR12MB4767.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:346;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LIrW+crzhdtkmpwuu1PHBmzD3dCx60Wg0gvquIDwYtFd0i1Xwr7ds/eHMv8U61j4rqlLdjEZWUaVgmN2P3zHinZL7rrWPTZA0rVHvqGSNLJ5reBvjl4Zbj0jPlNrbg0JRIvHqhPAivtretLORo5hG/kUm7iXnzKaPih/q4YTtbqe3rPCxxaHmB4oMwut5RSZGiaIJA0Y69N2i/0IZ4Ui3lMGFu4Jix3+0lhbURPiRciKzDR6U8cqvD+uGXIf6zAUIVvDduJF4NqcDVDnrdRXNz7qoAPl2UP/XtGvC6dvA24/CTy7QyyNGgBpR2FJuMQsUiNcD1dY+UnXYjIjFD36Ls05c6GcgLALzaKISilP1UBPfIDFDBaclwC1DMNmR7AKffSJF/oae0VTBF6udimNFA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(86362001)(66946007)(6666004)(83380400001)(44832011)(8936002)(66556008)(316002)(6512007)(6486002)(36756003)(2616005)(66476007)(6506007)(4326008)(478600001)(5660300002)(7416002)(2906002)(52116002)(16526019)(8676002)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?k1/PSckwlMx47+46ivmw9OecHgNq8eox2PGwN6Tz/eyUCjTh5S9gOCmpQbjT?=
 =?us-ascii?Q?9L+CoTpbVe69GlKn38wzdeZHAtQOGA7Gq57rS5dqT26eH+nRwupu5zl+eBCQ?=
 =?us-ascii?Q?mQYig6O3Wsxk+0yEBmantUIJXM49DZM45BhYe2BV/0BnOBU04ibEsu56bsdJ?=
 =?us-ascii?Q?tmrHnfZ/Dk4j0Y+Em+8Jyu3Lut1v3kxPeMMcF3hAyU2SX/NEnk2/Ih/sxCuO?=
 =?us-ascii?Q?STbrM5Jg3oSgCHPqUESg6qT/MzKHx5vYOipTYY1UXRlu3AuZX9MoebL+xW3B?=
 =?us-ascii?Q?mKrwADsfHW0VlW4z6jcmr3uK91fjVeNf/y0WvWMpIXvAZh+soMfjC4rWNlgB?=
 =?us-ascii?Q?UtOZ2EBvmkEqbEMhSiLrsU0JE20sueIFzGRadx/EW98752u/KgPNjKCJuofN?=
 =?us-ascii?Q?Sty6IxQQ1loCb/P/quvVcqeaxJiWgYxCOZcmwwJvgWfXB8Pdsv66cJ0R1tPP?=
 =?us-ascii?Q?68osSwU2VrPzaxS3nzncl6TDDpe7IqQzPrStCERDCOeBjq48Dkg7yEIJ+VEs?=
 =?us-ascii?Q?VciJMqdKts9Fgtm5qdp73Z8bsROyFG/n8khEUlSGDnVb+E6fScV8pRTwWkqQ?=
 =?us-ascii?Q?OD2YxRpxvs2LU3xKvyouKW19t6mGQ0i6ZUHUPV6LtVxsE9vva+EQRZpNiUzb?=
 =?us-ascii?Q?zDvCEOzO7tMohXJdy1xMQC/4Ocd3kxVZ5kFxlhheIUvIRoe3X8EN7MmMAe4w?=
 =?us-ascii?Q?HnaWEQS4i/jnQb/0pwlI0tqYqLQ9hIWEodp3u76ER75eaBZfkX9/AXO0X4Nf?=
 =?us-ascii?Q?6c8eU4UXriVjNGu5XmKIBlniiJxjKOU8S60SOoSTDpfXGCCLEVVX31K/Q90A?=
 =?us-ascii?Q?jsZgUy2qNRCDWgMYi9wtCjpxpubtw9eLxlmHU4rfubOImJHSLIYtV0vogWFt?=
 =?us-ascii?Q?8TuZaR+IuzVX2/HTD66h+kcynpNeXE7qPVQKYzyTLUQMzHwc4A0TTcYZoRWP?=
 =?us-ascii?Q?p8U/qETuCDPf/GpniS49rnMZanbJ+Xh7LQDj2XUCha9avLWsoRD48zniXODb?=
 =?us-ascii?Q?CI7oyIkI23lL5ke/gl14xrbTZebv0o6L0SfWYZ0WmC9lPsi9QXijFT/RVKmd?=
 =?us-ascii?Q?Vi19oOeBsb5Xd3Jf+zSlTbwgwXZTDMpIifdbP2GVHaUR3GU4kOcK5a1/fTGf?=
 =?us-ascii?Q?LzMVewCRBxmb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f05136ca-1d2b-46c1-2763-08d8bbf4611a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2021 21:02:35.0692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YWojah+DMRDdvfL+r5fsRk6kGezEqydO6K33/nlCb+36yFMpz1g3fdAxmWOC/WvcGlasAXBvAgy0cMOH6/hGGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4767
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
Cc: Alexander.Deucher@amd.com, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We can't allocate and submit IBs post device unplug.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
index ad91c0c..5096351 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
@@ -31,6 +31,7 @@
 #include <linux/dma-buf.h>
 
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 #include "amdgpu_amdkfd.h"
@@ -1604,7 +1605,10 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 	struct amdgpu_vm_update_params params;
 	enum amdgpu_sync_mode sync_mode;
 	uint64_t pfn;
-	int r;
+	int r, idx;
+
+	if (!drm_dev_enter(&adev->ddev, &idx))
+		return -ENOENT;
 
 	memset(&params, 0, sizeof(params));
 	params.adev = adev;
@@ -1647,6 +1651,8 @@ static int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
 	if (r)
 		goto error_unlock;
 
+
+	drm_dev_exit(idx);
 	do {
 		uint64_t tmp, num_entries, addr;
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
