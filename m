Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7350537C01A
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B3BC6EC1E;
	Wed, 12 May 2021 14:27:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D036EC1C;
 Wed, 12 May 2021 14:27:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Al+MD/yUii9sgCr+WqTDUSva3TJENFoIdlCDKmAhC4wJKo1lFhFk7uaOOIaKKZu8KCCffPbwtB+t5LVZRPYdLxh5uqFl42E/oPrEstdHGlCNgE/scx5tmY4dEDzDcxAIYGkpoertr7zysexi2ZOJ9Un2MMnXH8VscC286uHnyNyLeY5Mbof+JvVpsZNCy1m4SMknt1vjnPXVWvxqDE2NzHC+Vc+wjZsJa9nI6rVI3jnHf/C8CkgT3+u3O8TDZHl6gmwRCWUlqZqYqerj8dj+3U5Oz9KjBrcFdzsS2Bp+Mztqb6WUv7RDOygmpIppPKaKJcGn/wYAI0EwI0OTA02UTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AZGyPcKDSup40OWapnZWYHJum+sOEaVRemzO6xhrCs=;
 b=XCopPD0T3zndcAwmLyQjDiBulcMCKGh3nd+eqBbk40Oxj/8fm9jYVeUUjskMixJeoQd/YBACTfVEf7agzzR3iVnIt80X6PiV84Pt/Ge0kW+K6+qOlWeRZltRRRqG6EW7XMkOR2E54rofW0dJ8b9Zo5nkKKfwHiUEywgOvIo1mgQt5EE9C7JLVOfl0+HBNLRER0xViUGm4GU0dsL+1jdo864GKZcu83MUtQG/EUOQflqueGfAa6XqlQFK67mvR5swLTzbyHpksscyHEO8SwZv+0ZTpnrxTVOpsjwoNUmc7sJn+j2K5tPO3MZMGQ32RuzW1aWKDgT5ghvW/VC1iroA/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9AZGyPcKDSup40OWapnZWYHJum+sOEaVRemzO6xhrCs=;
 b=cVfJUYrhZUrhI7/bpuEeT4MQqwdsNUYFKOSYgTbptxizTLPkffwHuhnBQcLf+ZNzGuKgjtQ+lK0Y4UxfsSSe166AjE/7+nopDdYveqGYuXqDceCgCS9OaRebuF0XbUoIRU0FVPfF8i9L2+5FEhe7ck94O1UI3K4wD7wH72l1c5c=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 14:27:36 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:36 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 12/16] drm/amdgpu: Fix hang on device removal.
Date: Wed, 12 May 2021 10:26:44 -0400
Message-Id: <20210512142648.666476-13-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [2607:fea8:3edf:49b0:7576:4f76:97d8:1487]
X-ClientProxiedBy: YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::45) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7576:4f76:97d8:1487) by
 YTOPR0101CA0032.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.30 via Frontend
 Transport; Wed, 12 May 2021 14:27:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6ecd6c91-2c03-4633-2824-08d9155216f4
X-MS-TrafficTypeDiagnostic: SN6PR12MB2845:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB28450F64721EBBE7E1C3882DEA529@SN6PR12MB2845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LMM2BcB1boHQI6oPuGTSTPtATz0rpQBmEBbb2Z0ZTOJ/G0CelHp6khTk7jIh+yTdtGniONnNGujTCYWqZPGUSnoM4q+i5P/2b/m4cic4qSesk+nvYoKNCshokOjTP1q6/l00NAdfi8beN999e3XkqCXVlYJ+SG34Fp5563rpD9KsdPkQlG96L7mEpbuiQHTouv8JHREu/aHCq9ULlr6gDxjhp3BdwcHgn5+oZB8IDAW+yrwTm90qd3QVx5sN6qitEE5KFWfHRS1LAgOEsT/JpHL942vnsioASdTF/vRh4ebDFCXitLf7WyxVV5GYByx4ovhDdaXMmk2yOh/9Gz3uThvmQPkfOw5jWP62pzjHSh8BCj8AJcwTVhpJwf19e4u/sPZwjLSrZUSNZafMOGqM6nMB8smvnlzKC54LO9H1JJSWqExcV4afxmHzd9q/y3TaQv/7FH7JObrdFBDn78gcdPUEpfv/TDOyO7lhEge6EfhoRrgEsvTjxng4RjHXwoaVZueIINwAttYyIw0tLIJ2P5wIGR4FJJ/6cFoS2Z20cNr1+rJILnQv2nK9lDloFxVl7bWalmOWxLzmYYcenW8bjcbZw3nHhMwq2yw/Ziuh7Uw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(6486002)(8676002)(316002)(6512007)(16526019)(6636002)(478600001)(1076003)(186003)(4326008)(44832011)(2906002)(6506007)(8936002)(5660300002)(2616005)(38100700002)(36756003)(86362001)(6666004)(66476007)(66946007)(66556008)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?SMnLgxxK8HjKnvv2Ec5ufYHHScQZ82VNJFsftwb+3xGUAqtOzmgfaPn/uImf?=
 =?us-ascii?Q?XV7XzpuA1qkgrKg2ht98kYvGZiHmdbpGsQNr4xJ2j+P+ckXKC8GnVMdLFd2x?=
 =?us-ascii?Q?mBH5Ml7FCuqvNV/r0hiGgjgU2oROosgLKcRvBjx9eIbJJmXXpkiAAIX26u6T?=
 =?us-ascii?Q?qQE/DSuZe7fDHPMzs9qTQhU00aBUqh4ywnKbUfP+Pfn//ySO1LPEsafj3hQf?=
 =?us-ascii?Q?q0A1nFfgPecu3smPF+1/zZeOqTzIiuRenCcMOkByGsimafzwCg04DZjj0A6a?=
 =?us-ascii?Q?CqjD7BpvZCbbzESYzad6JR9TBAWqvd1SLuczodysAyVxmvOQj0HDAHHWxwLJ?=
 =?us-ascii?Q?MVj3OPgNHQKBbMqQKPDJ7pRtI4/+AYu8FIa3i3lGfrUk30lIxEy6B894LhGe?=
 =?us-ascii?Q?DC+8ZyWPjY5pk3PwsDAvzc8NDxnKfYMOLg/o6Zqoj6KBxKJ5dGEYQk4KLCIx?=
 =?us-ascii?Q?vs4gMG0qSpUPbfK7JL59XxJJR96TRpXPsf146b4UZ/hUMkfSAkZanR51nW6n?=
 =?us-ascii?Q?eMvZ5Wxwc399MRQp0PO+fNzRyra0W2Poejcir5EWuF54yFy+p9s3elfrw+U3?=
 =?us-ascii?Q?rQl9OEGipAzAQ2+YGV+lH6Q3ivWibCp1G7KXrEIfqLMwQ39qe5kFfk7+9BDZ?=
 =?us-ascii?Q?SrqaAIDtUSuqZFiBTSTLRG4rq3EcaD5d2HlPbQxCStHvj14A41s5GkO3kbtR?=
 =?us-ascii?Q?Z8OxV8uY7psIedBDEadgdV4Olp3pbLqvNoVElMWNH/KIvOrd200xcmi6pY8g?=
 =?us-ascii?Q?VccRM0eJjzg03I9Bua5QLEpZyEZspWf5gclnqXDMh7htlM7W9dRtNyMVrpHX?=
 =?us-ascii?Q?p5g7fiCK5/ZnwXVGsA8aKgZyyz8lhzRuNIVDCrIFYwB5TrnrlhGQw/h+f848?=
 =?us-ascii?Q?ne+TfT8iFOJE7Ve8PFJacHqJ9T8DTjzE2ve2x/EdHWznnSiWwAcAIBqkjaBt?=
 =?us-ascii?Q?bUfghRsP//e6WEGzDx/Q5BzP0v/ZM6Eb2iQ7kjksHeezdvxpqks+1aOA2p0m?=
 =?us-ascii?Q?ciWCiKc9PKrb3xeu263gZNtTMCqODxEU9+5kP1Hx8Y+8bH3mS8MVT9C14ooj?=
 =?us-ascii?Q?l3hvUKhsiSXIrNlhMxgFZNBHzaidJxEBlQAKQkedQoH4CcrZ8N/n3YVoDvo9?=
 =?us-ascii?Q?f3YFd9qliMp/AeCtevD09Z1eQWTB1L6rH46alrsJTxnTLApXrndLXhXWeMD+?=
 =?us-ascii?Q?PXiz71AqWPOWRhIDI3IkG0ay/BeVBLlLRJD+0Kzr6RQy0UGQToYN5q25ylPu?=
 =?us-ascii?Q?Xpuwa9EeiyvDdmW4oaBEFXoHNw/RsfCUYHjOVMWCdFt3y+tEdWHHMKUxMNhN?=
 =?us-ascii?Q?FGFsgH7UXqodxZF/XalkdfGye7uG97CwPPG6gHheDJLGLidtMnbi4SgzRDWU?=
 =?us-ascii?Q?I3rZsX3/Sjv9nlYziGp1RoIDsUae?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ecd6c91-2c03-4633-2824-08d9155216f4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:36.7696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ZJOFopSndo3JaLcVl2DwttKLFuCc20VJsTougAJxhQ8bSbokMC9KaORUqnZuAI9TuRkOWAAMS2FhSNb9Ys9Xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2845
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

