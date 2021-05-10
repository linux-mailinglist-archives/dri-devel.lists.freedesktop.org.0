Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6C379429
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:37:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B221A6E8BE;
	Mon, 10 May 2021 16:37:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2089.outbound.protection.outlook.com [40.107.101.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48A56E8B6;
 Mon, 10 May 2021 16:37:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CrjU57sG6/H847qVMEAtqh9wPXUaWlPoOOJtZdDWsaZvOKL4LkzR0p6TWkbCSXi/rFxb4umcxzbokMZX7rK5QVR4ffIQ7tydSWyiiwU8UWESQvjdMYtMpoKEF3AseuMJQ++FjDEdBT3h88HTTh2NDbO7vwwGSwn57ugbwBPfXMh3eH5J4WvzVH8M5yDOXl0s7Im9sT+Vl8Et9Ed/BY/cRB6Nn3DjkgnoUBgLFAXXiVhXV8oJCWNZp2mIi/On+GNI2zkaN5yAACXDe+v+4+DJWcuYMLSpVYRtafvnXW0hZaAhtfDdV00V24loRcx3BrhlEozfXBGKBNF8tL+LvM295A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AZGyPcKDSup40OWapnZWYHJum+sOEaVRemzO6xhrCs=;
 b=LQl7rV4xnC1ITkJRWIf9WGHlNslWcnmqd5FgMTv4EbCHg9m6yPYcNoR8Jc+KuxYNRE78eqHWvSrYk1n2VMbwdgFh8x84dd62YYRtR/LDxMvlM+digwkNIO/H87yKoKLYhLhWKXB2QLjCDRXrzZDJCoUnok+/PhRnmFAk8SgE9vQBLDP+ck/yS9iJ4pQ4pMO/d5W0y+EFdf/V7OUU7Gon+GPBIfLZh0MxOBObBmjo3pfHHV1CmqYy4sk6DZWRl+son27Uxmg2c1aChiH283H4EG4jNy4dedfoLm1Td2lRpYsqcyUCXBp2CONbrccquxicu0/H8Ogp5rSChwAWET4t2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AZGyPcKDSup40OWapnZWYHJum+sOEaVRemzO6xhrCs=;
 b=ndkXorKJAdpo4wp8qGD5Xcrnxy5yhhUn7WKwsDzFUxva0Bpx9fGpb3mDjdOJSUgO4lkEpA4aV++/OBHiOo3+EqdH7w5tp1b7FSa5/hNHkPPpIp3SLIt9D7hBvm9127WELtkwY4vxuosoOPpQwOCjOuPQQNuh/LUGibbDbvLj7Bc=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB4717.namprd12.prod.outlook.com (2603:10b6:805:e2::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24; Mon, 10 May
 2021 16:37:04 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4108.031; Mon, 10 May 2021
 16:37:04 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v6 13/16] drm/amdgpu: Fix hang on device removal.
Date: Mon, 10 May 2021 12:36:22 -0400
Message-Id: <20210510163625.407105-14-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
References: <20210510163625.407105-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3]
X-ClientProxiedBy: YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::25) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:6a5:47b8:e610:f6a3) by
 YT2PR01CA0020.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.31 via Frontend Transport; Mon, 10 May 2021 16:37:03 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e811cac2-a2d1-488d-db3f-08d913d1d803
X-MS-TrafficTypeDiagnostic: SN6PR12MB4717:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB471706E04B302A24C8D76F53EA549@SN6PR12MB4717.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ah4hYblDMYbeXyWe3XSF0vET7g1uAs8i04g+4mHAFZ4GufMiD9yQ4sAWowvp1eLDFHiIJkEeNCkCSxBSQsO7+iIFfELdfFw9wZfctsyvDGLmoG9NFuUHiJr53xXSymMqWQEsYe1YMXabuuwlsdjcMy+FuSx7DJzJ+b/oiywjgpBXqIH67RtQ5bQJ0G4IMDQZLU4hlzRLh7ZFwSbdYfjg/z9eXFxoF9OYWpFD1u432e7ach8mlXuw+WymJEfONWAT9gqxcJF5FqgRqgzVef84/Yj9zRj6TWdmEwPsxNg60rnnWdoJnG4Nq4T2rY9ZNMcjDfX3m495kFyn364J0fc5X9fiL0q5nZnyW3foQ/+QSXRkVbo0YcQnMDaesmNruvhVFp/xiPsBRQBfB4arKspi9B7dANsHSJvqHJa2Xso77jekmZZR5pczGInGhXp7mRhgEAfCtkc5I/DXvf61j6R9+PGTJtlIOtC7A0JfEJqNpxTbsWeDN/JQpp2cTkPt0mD7AdA3stV3rvKc66+6baYXBP0oZhivoWyFSMy+jindwPx6wrkTCQeKEvmu7OZ70JvQS19YUSwFHIeYF0sWFoHTEgy0MEagpdA8uhb0J3e6hyw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(6486002)(44832011)(83380400001)(5660300002)(2616005)(8676002)(1076003)(86362001)(6506007)(478600001)(186003)(16526019)(8936002)(6512007)(6666004)(38100700002)(36756003)(52116002)(2906002)(316002)(4326008)(66946007)(6636002)(66476007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?egRm+9vCKocacMLv3KPgPm0o7UjWGS1TbKhW0BbvS5Cg0sf/NeqwMufghgdB?=
 =?us-ascii?Q?j+JQ2xB7yMqvdGdgaaHBe0yt6in0NyhfpYZg72Y8cMeUUzuHtraYS32/QwAa?=
 =?us-ascii?Q?Ch/XWSa6K8ChifK0fZBMhkXBdjjUABEifCBx1Ypp5ivj7UyfY3UnW8gpJbsx?=
 =?us-ascii?Q?2TnYwsdkHmgMWnMhYNsZmljjma+gtrrzmEnWpHbYpVXGgmfn+mHqQhKLQ1GU?=
 =?us-ascii?Q?RG5Me+vA3myPHxg3Hxk606vvF9bB7mjhoS2mtHPR+3yyEwkYFZubMwXdGnBN?=
 =?us-ascii?Q?I66Esg7pSfibaK6KD5oi3LI2kOz7kwtYWEUkjTw3dbLdvpsXrxmoEd4a4+1L?=
 =?us-ascii?Q?rJfGLvdjsXQncs8dLeQt7UttmPlup3TNJEbv5bjQHwyReOcljYZOnmUVoukF?=
 =?us-ascii?Q?JxYvRyOe4LRH5YWef7+OTQ3aTMg6/GpTvrFLkp7jgMxX8+2I5KLPAFpcz7nb?=
 =?us-ascii?Q?ZGdoO8Pr3FXyPvCV59K9Wk/x0oPkYs2Ltg/rxTgo7bx25ngH7rVLElPPT9sD?=
 =?us-ascii?Q?iBEF+bREwoPtIbkN70LHLA2XUrXtFoAxeJ6tznVArSDzIApw7U3EL/O10Q8H?=
 =?us-ascii?Q?zNwUKoakI8d5tr6bCsna6XpQNlpOmAZxN/WGcBeryzqQckOvzlj6yrDiRTBX?=
 =?us-ascii?Q?PaPJicCOQFMMXzro6ABVhns4OgGvk5lkXVib9ziYfgHmCiKlUCRVRoey0qXH?=
 =?us-ascii?Q?MfbAW44NG5gMRNMwAPsVcKy49gmWnhDubFv8x+l+l2dX9VhDkiWH6Gn2TGap?=
 =?us-ascii?Q?k0oUEuQMHGaFap4weFeenB9oTyMsDB18YZethAGc3TgDmvBPUF/V51z49nP7?=
 =?us-ascii?Q?4AXRqH2A/wEjIikcy3pjEFhcCRM6CXBq76mOhRen3Cjw6E4cgdsDp6WlLhw8?=
 =?us-ascii?Q?ivZ6jJViC6SETRokDGaQi6WESHZEK+QdlrXWXdgMbeU4OFksMYVxMqjcKdqL?=
 =?us-ascii?Q?R9/1Fhw2WvSSBPGta7snuHZNFyoPl9p6911H8CXFm6FB3OpmvjeNgXgMUEHq?=
 =?us-ascii?Q?jYL48ta2sZkkTC2q0PC6hVjSjT/IQ4NmiIPrCBghAC8aWiHmr3LVJ2QpiepY?=
 =?us-ascii?Q?Bm5VTLFzbwP+rwZ7oRMFZm31XpWQfxdkg+xX/lWSliV0MmyGEcKLRIUmPsEd?=
 =?us-ascii?Q?HqM+anRJi5yjQdT6CBNI3z9B2J+Ne+8uFAJmhhE1HBQPHdT378JRdRAiboN5?=
 =?us-ascii?Q?UpJiWxGO65j2UHFpc3XTf5o8TBilzHXygs5Se/zHi6TNqJh4o5jAjRNyofBi?=
 =?us-ascii?Q?dvMNus6urg2zVT2t+qfGxSibKw68v+hsCFTr0u2O4czfIriqah5A0spt/bcg?=
 =?us-ascii?Q?abTOnHN4jqL5Cmq9D1JTz+0X1M8/dQWcooBYK69+Ky7VjZsNlHFfp9IvFgEf?=
 =?us-ascii?Q?6hQwug7rKny8A8YM6ZJsKrszoLb4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e811cac2-a2d1-488d-db3f-08d913d1d803
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2021 16:37:04.4129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JKVk545nufP9ikbyr/rONDQiActZ68yHORm7npuzg3y3kd+q1QY7m0z3CeDgs8JZFXKywPDtd+9HLwlOgE2AA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4717
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If removing while commands in flight you cannot wait to flush the
HW fences on a ring since the device is gone.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index 1ffb36bd0b19..fa03702ecbfb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -36,6 +36,7 @@
 #include <linux/firmware.h>
 #include <linux/pm_runtime.h>
 
+#include <drm/drm_drv.h>
 #include "amdgpu.h"
 #include "amdgpu_trace.h"
 
@@ -525,8 +526,7 @@ int amdgpu_fence_driver_init(struct amdgpu_device *adev)
  */
 void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
 {
-	unsigned i, j;
-	int r;
+	int i, r;
 
 	for (i = 0; i < AMDGPU_MAX_RINGS; i++) {
 		struct amdgpu_ring *ring = adev->rings[i];
@@ -535,11 +535,15 @@ void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
 			continue;
 		if (!ring->no_scheduler)
 			drm_sched_fini(&ring->sched);
-		r = amdgpu_fence_wait_empty(ring);
-		if (r) {
-			/* no need to trigger GPU reset as we are unloading */
+		/* You can't wait for HW to signal if it's gone */
+		if (!drm_dev_is_unplugged(&adev->ddev))
+			r = amdgpu_fence_wait_empty(ring);
+		else
+			r = -ENODEV;
+		/* no need to trigger GPU reset as we are unloading */
+		if (r)
 			amdgpu_fence_driver_force_completion(ring);
-		}
+
 		if (ring->fence_drv.irq_src)
 			amdgpu_irq_put(adev, ring->fence_drv.irq_src,
 				       ring->fence_drv.irq_type);
-- 
2.25.1

