Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A72237BFFF
	for <lists+dri-devel@lfdr.de>; Wed, 12 May 2021 16:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAD76EC12;
	Wed, 12 May 2021 14:27:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2086.outbound.protection.outlook.com [40.107.237.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE08D6EC0C;
 Wed, 12 May 2021 14:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SpNDX9420W8P1KRsWpRaOfmCxf4mLm4PL9PeO1OKVRM3yiznowwyIgzRdC7ys4m1tykbbGDNgyEHxzf9ePyRggWncnxLxI2VKP3XePpOLhr6EASbYOVLSOiHIOxMEqgaiO1MXSFnDorLtjk+LBKRk/G+7SYyk0M/dObbFGBirWw0UfNlSrVJh20Gu9s4Tz/y9P8FR61MVEL0iEaAM42oylFoIvi4TicRKr05TWTdJA08IJN6JAc+R16HXG5fIDXjN8/U3d/VFqRIU2RKNauWqEHFLRmt4jc7zgc9OVScEryjdxwCy7wJe7uta5Mughzt1BgVFAAcn9qYRGrXeWF7DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImiQhpPoXfItMc84rz4U+sl7ukQBW3gycLm8/fXkr9o=;
 b=gWTzaIXAJ31jbrWawfH1P/KCJs9mhHnqIIS0Dw+Q1nJ4JNcqJhh5Vn8CnZqqUNwpihQbojvYDH7gEzV0ldovc7zZmzuau26CjS3JpAm/zuQ86qAvWkOEONPc2gcWPp3nx1FTepclH1jdO5MNjHKpbtPKWI9IpLfrZziKKyIwrrBELKnGEn7K3GzNmwBbFVSbpRF2jFzSTGPFYZPvgWtUEgjc1LUsEQ+/ZO6fu4Zu0A+2fp68RWl1TxWHAz2JVlk/TjNFHGn8zw909sd4N0koaEZT/dkR5LBPSppWtwG9mggti5sazE2RLrykIZTGgubnMvuw7/evnVpSE9ipvGhVrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImiQhpPoXfItMc84rz4U+sl7ukQBW3gycLm8/fXkr9o=;
 b=x8z4WG+qWMtdNnH/khw7DZxsDYMTaE9m5Hl05qGM+1+QgNG6Lsrrp2s26o3QjusmJrtld/g5iqMtbV6PLNnhbOfBnO/KbR5zwQo+CLN8+ni8F9ng72i+xURnrV74UStwJSuouHaGSjdNmr6jycpujzMT1nbOJN+xKCtGIzSmM8k=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SN6PR12MB2845.namprd12.prod.outlook.com (2603:10b6:805:75::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 12 May
 2021 14:27:21 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4129.026; Wed, 12 May 2021
 14:27:21 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v7 06/16] drm/amdgpu: Remap all page faults to per process
 dummy page.
Date: Wed, 12 May 2021 10:26:38 -0400
Message-Id: <20210512142648.666476-7-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
References: <20210512142648.666476-1-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Transport; Wed, 12 May 2021 14:27:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4f0ef048-18cd-4925-9568-08d915520dd4
X-MS-TrafficTypeDiagnostic: SN6PR12MB2845:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN6PR12MB28454F2A7C57765FE5C62B0DEA529@SN6PR12MB2845.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w6+Kysu0z59GAH1eWP+zeLVLHVStGr0KRMW4OWeORaHz/JJIXMluUbNXL0Udsr3d4ZOjwNr9fr/e9CdNBFrM4npUk7yF1fxNvYOtKImJZahveSiK1hqdgZlR6MtBeExDdtSWLSsd4DjJ9oYsG5ayZICu2hFrwHgZRMeLJKtxE1gP8zy5EMV8BAjbhOqZX2PLUrU/EXUVCtQbwakEH+Y8Iwhy0LKUrmvPoLJVi2HjvTaCRx1g7qNLwBSAG7yhIC5WSME5P2+309D99g46TxVSpmd61ln9HH+j5pTDGh2cnwGSEqjyADyQFxbTeDBpse7lOUX8zOe3ZlCp/hupZ3+Lxc3GVp+PWKYg4lZ1dZg9O+GxCHPILwO+zVJ7FYD3sJbCEcS1mUWTRFpYZbJgrrjI0ANDOncPOd2GeuUQVg2ZkR77jC+bb9ts/6R3GjRUIvDprt81R/2ZroahydZJo/X9zNlx8MXV+jESHh+cxR+PiIBo4TXZWwGwD2jYWB23S21JmfzHz38LJ5IrTsa/77ydV0/HZryf5XZ9KJZaRZowyrv6sN4CzTDR/ZuU8W6s5UQvn5H0gNDZI4X+ldmUgrFsdXldSagAz/yPEDiPmK0fpHo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(6486002)(8676002)(54906003)(316002)(6512007)(16526019)(6636002)(478600001)(1076003)(186003)(4326008)(44832011)(2906002)(6506007)(8936002)(5660300002)(2616005)(38100700002)(66574015)(36756003)(86362001)(6666004)(66476007)(66946007)(66556008)(83380400001)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1ArSGNabXFLWHZFakd2K1JEamNkMFdzU2VIZ2o1dHl0eS94aE5zakRHNnhz?=
 =?utf-8?B?S1NEeUtTQm96WFdLejgvTVZyLy82NHhORGNaWG5oMFMxY2xvM24rR3hTNG5v?=
 =?utf-8?B?WFd1dFMva0tiMGlJVDNWVldOd3hSWmhwUXZUK1dLTGxuQWFVclpEeXFrNFF2?=
 =?utf-8?B?cGJZVThNdi9BdnVnVFFSV0dUWXI0aElPUjZmVlgxN25kSEp1cWdPaENDa204?=
 =?utf-8?B?WDRuajZ1OW5wWkdaSDIrMzhKWDhicmxEa2tZdldFMmJDZndZZVdFOXdyVERq?=
 =?utf-8?B?akQ2cnRjYmpJakZsVmJzNUdDL0lpSE9iaGg5R3pjUlo1MXM1Q2RBbERxZDV0?=
 =?utf-8?B?OTdPZ1dCc01LMHk5cGFkb2Y4KzQ3V1BWUDc1alhjaFp2R1UzVkJUTHlkR3Vk?=
 =?utf-8?B?ZTFKRG9vRlczVlJLUVlleUFHdFgzWTh6S1dPT3cvWEpqRXpveC83ZGQ3b0hn?=
 =?utf-8?B?em0zajJ2TWN0OVVJSFlBSUgzQVRvdXRQMFFNSCtOa3UydzZvbmkxNFFwUEZC?=
 =?utf-8?B?aHBXQjNiR2VhZ1RyTDMrSmg4bEJaQjN2NklFNksvayt3RVNhRGJHUWw1am9U?=
 =?utf-8?B?NHI2MkZTUnJBSCs4U3VYYnkwdW80N3ZOR3NPWDVZdkNodWxnZU9QTlNKVHdO?=
 =?utf-8?B?TDRENUFnTjQ1N3pQSUM0TDVlZ2tWRi9XdWV4Mi9XcEVWaUJaMFh6ZXptb01x?=
 =?utf-8?B?UURjVmtVNUVTQTQ0b1RFU3d1TUt2S0R6ZUVoS2dBRUNQeGVNR3ZvbktEWXd0?=
 =?utf-8?B?WlZpUlNTZFkwN0Y2U3dLbUlTK2Q5WUtlM0ROYlpRV0t2VkJ5SEpWNTRhTXBr?=
 =?utf-8?B?VWFRR25zdFhMQnNJRmo1ZHNPUGtRZkRNUXRWdHVrSUJlMlczRDZ1K24vWG9W?=
 =?utf-8?B?L3NvVTN6MVJZVnFrRHA3ajhmTGhPY3BiRW5zdFVKcGlaRWZGM1ZCb1l3UVM1?=
 =?utf-8?B?YVBuYXZsT3FuWjdUVmlVbklXOGhURmhtNDA2NEl4cjlQL2dhb0NTS01LOFZY?=
 =?utf-8?B?Y2RVakhjY2V1MWtFU3lJMFJPbnhka0cxT1M2Rk83Qkpha3BuUmNKTjdVdmpS?=
 =?utf-8?B?VkF0bUYvcUVEYlV1RkpYa2VHVHY4NE1objQrUkRFS0xUeXpLVGNUeDhjVmU2?=
 =?utf-8?B?ME8yYUZJZGprRExsQnBscmNJUTROUlpDMFpMSDhUcjNCMitYU1hzUkp3Wlpk?=
 =?utf-8?B?L05NQ1pEc0xNT2dCQjc4SndwSnlxU0VkTk9ickdNaGtHT3VUY1RZVTcyNXpz?=
 =?utf-8?B?ancyRjkweUVIUjFQZS82NnhCS01nZDhYOVpGMytiYnA0dUpydzY2YkE0Nmlo?=
 =?utf-8?B?eE5HWVkvS01LcmhzV053TzRyS0w5N0ZPNWxrNFd1ZERUWDYrRVJvQ1I1UG1l?=
 =?utf-8?B?VDdTRUZ2WFBlejlvcFNueWp6OExvb25NbS9zR0t6K3RDSmQycGY4NGVKemhP?=
 =?utf-8?B?Uzl4Rmowb281YjNSNUpMT0duWjBLc24wY2Uzd0UvS2szOThvZnozWEVML3p3?=
 =?utf-8?B?blNhMWFoeEdJSkdtVU5OTHJFVDhJL1Vrd1Nvbnk4NmliRGUzSXpteUloUkd0?=
 =?utf-8?B?N3dQQUpycXYrbEtoZmFQbTBkOXk3UVY5M3FKNlBTMjV2M0g5RVNSdk8vY21i?=
 =?utf-8?B?Q0pBQmRGSHgwelBaK212L1FZYlcxSHljZ0JQM0N1ZE9nR09BL1ZlQjYyVWFF?=
 =?utf-8?B?SHM1clorUjhjQ3QrTUhXQzZRSmNCMjVONXBFR2FMZ3RGMEtQcmk0ckZoa2Jk?=
 =?utf-8?B?UlRkeFdtRllSSmlSZHMrNmpXWkQzdDBiVEdZZ0xnZktZTWVScnZ5THVld0M4?=
 =?utf-8?B?MzI1cDVVV2VVVENoWGVzQTF2NGxyOXQyUHlGRC9qNFZVd1FHVi9DZklzelFr?=
 =?utf-8?Q?8ezZXNQEBrJCD?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f0ef048-18cd-4925-9568-08d915520dd4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2021 14:27:21.4732 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZL1LntA3e3ALoedGO+5LZMq9jWQ7a09q2F+oWuGY77O3DbeMwwK1UXrzv+CHEhV4EU8uxcRRx2G0gJ9VkVzF+w==
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
 Alexander.Deucher@amd.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On device removal reroute all CPU mappings to dummy page
per drm_file instance or imported GEM object.

v4:
Update for modified ttm_bo_vm_dummy_page

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index 8c7ec09eb1a4..0d54e70278ca 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -48,6 +48,7 @@
 #include <drm/ttm/ttm_placement.h>
 
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_object.h"
@@ -1905,18 +1906,28 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
 static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
 {
 	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
+	struct drm_device *ddev = bo->base.dev;
 	vm_fault_t ret;
+	int idx;
 
 	ret = ttm_bo_vm_reserve(bo, vmf);
 	if (ret)
 		return ret;
 
-	ret = amdgpu_bo_fault_reserve_notify(bo);
-	if (ret)
-		goto unlock;
+	if (drm_dev_enter(ddev, &idx)) {
+		ret = amdgpu_bo_fault_reserve_notify(bo);
+		if (ret) {
+			drm_dev_exit(idx);
+			goto unlock;
+		}
 
-	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
-				       TTM_BO_VM_NUM_PREFAULT, 1);
+		 ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
+						TTM_BO_VM_NUM_PREFAULT, 1);
+
+		 drm_dev_exit(idx);
+	} else {
+		ret = ttm_bo_vm_dummy_page(vmf, vmf->vma->vm_page_prot);
+	}
 	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
 		return ret;
 
-- 
2.25.1

