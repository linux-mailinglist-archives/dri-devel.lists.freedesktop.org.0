Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 287A936DAE9
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DA976EB63;
	Wed, 28 Apr 2021 15:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AAA96EB5C;
 Wed, 28 Apr 2021 15:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRylbx4FZsCIMxuXtd4x04jFt+g5IoNmyPHgfzCKkPk/oIzvLyY7eYJ9LhxOWlZjiJTvJHTixdj40MNx4/VgDpoXB/O+y3ANfKZpbAWAcVlPjOAyE1glOw54gfsQ9PzREz6B0VZLDlJZ0PBfYtdxB9drlbm42AvJEy6FAhkJ1+LV0VcfSE3VZFlO6M/RmJrRcjExoTNJAzSTcMaW4xVfJTkkA4BUuXuoM/0xS6P/T3SSR369yxxSsPAh8Ykj/0M5gqS+In7Z2H2KeQt/12cIUk5NLRxbIFhURcJNfNv2GqdvTd/7cpCwoAKX/m2u8SOr2bOk9hnMwnZcajoxuRNlNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3LsJnLfLNgqHUkpZWzjeMUTXKNbI8XQw2ZNffTNCTA=;
 b=MO60gR7qp9Wi+4/oTsRU7HAzRVdCRA80+IvFx7MifhoNZd/ZNr/0+L/2G3rXPgtqCHfmNGY5FPd/a5IbqjQmwiFCfrBnsMfpyg2McvqqQu5uiLPVV0jNOq+XE7QpZ3GOpbE6HDJMz6rVgUmaw6cr66KmIYUjqh/qslwFcGyxelF2lb8DBHwAFfND0jKblvziT7RblnQLTMV75rxlQo/6bekO6pEo04CmoTsxNDxGNGMqytFjYukgvpIbaTvDh0tQW+JGjvbRdpy97s8YMv6W6C+HVkFHOshURYYriQWm7KSvkYwVPoKGaxxZSPvWxY6dAZ/Hg/X/tLn7wjEqFw1jXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N3LsJnLfLNgqHUkpZWzjeMUTXKNbI8XQw2ZNffTNCTA=;
 b=mKsmiYMIEWNxg4t7ddUGIJsYZSHXXjBm0TQu/Re75gLyxeQgiHt3xGAObu5nCgr/ZGCDnV3iHCsZPtQG/sY4mooezd75oU/r4QzLLxFL08BVA0f5KE3j3NzY5xPDrQ/3eta4koNHYumb6thPigOmdJc741Cpcs1AWTu0pjdm98E=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:44 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:44 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 07/27] drm/amdgpu: Remap all page faults to per process
 dummy page.
Date: Wed, 28 Apr 2021 11:11:47 -0400
Message-Id: <20210428151207.1212258-8-andrey.grodzovsky@amd.com>
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
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e32ad548-e286-41a0-3358-08d90a581305
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44628B600C041A812D009B6CEA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +xmhb3TqYTTAaFfVm0n7jpoiUJus30VhzEveXyEwB+1Z4vpR1BGjPWoBV53BGJ+YOcROkxhv6aSVafXF0hUlwDVRcsSTJkrcp+eCwHNGBTqPYtUPOrProL191xQE4YXXKKUb1/TDqhtuNwgwVmu99biLZvxwXupYoamZHfQoUnj0mQuZUrjIymLTbJiMNfaO6Hqb86bT8SXvDIFhHgnsYII/LYhv5GuHo+rOrXjbkBuKO9vOyQZj6iIRL9NQ8AYj5CT6kxeWzaJMWTMUENRIQxpRqG9PBP6F8HdHP0sqBcJclnv2LOM4BFw9HSqk1PDud1K4hNFe3J5iqoEftJsMELNDh2NGpz7lANXTcniaL6yfl74/ASWR0w8veQmZkt2PLYKE6EyHCQV9dMfJ1MSTQYvbvFpnnQq3vFXwKtRExj0M+8ICII3IUR3tLwPyl0XvuRpNpSBJvwzP2WS9PYyaKGUN23Qr10pdZErEmBaEwIXo1fGdNgSJc8rOUKq/kPMJaDsQC5jeKpayh9t4HZab/nuIFyoE7xOQHQRZo0LodkRRs1PR5UjY/1AzNrW6ZioVyb+yg99/shxK604iTj7SC0prxls0XY0ZnXtwotGvGZ8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(478600001)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?bhfXW+15GrViQlPo3AXP/TVqzoHGPl0P2iBsTCOvpylA1qH8+aKN/zDr1HCq?=
 =?us-ascii?Q?aR87ZXic2Yp1O4D2l/oVR7BJ4mrbWGn0wTf6sanRW5gvMNPz2IJgp/hildqt?=
 =?us-ascii?Q?65/Y25tbaFJageU30yYd2o8rTDeXJ05PpeXRAW31Kfig+J7jGSTzCy7kYpYk?=
 =?us-ascii?Q?aZc21b5cea9viS9qlulQUrEmsxUlQvB7mB0vdwDFi1NWLkj35yulan1PkQng?=
 =?us-ascii?Q?cbmoYByTg/bQispDQ/xrYL5UeXDkRPbTSw4Z4/YtZa5orRVBGPYTUjyfn3Xb?=
 =?us-ascii?Q?dKSQD0sKi/75oos3OJWG14SRyRgHkTB4ioO9BbxxrTWtN7NVGpJWtkuDLv7b?=
 =?us-ascii?Q?SWv41fn9whTGA2/NIZ9a95mBqyAWjcFMf2xnrnZvBc+LMt6NFSoIQU0VZJTj?=
 =?us-ascii?Q?/3DLbR0KKMUxo7ltSlkMzEgWvPl6IPggC1D35AK9YC/pZihoSDVwWwVHJh2f?=
 =?us-ascii?Q?EFYs4M1k4qGHiEtAe6AF3tY/sm/wqiqt4BujC+fa7oBvG4fSN14jeyhJBzq1?=
 =?us-ascii?Q?LQ/zSbHsfGMbk9G21ZS9W1r21FWzrh11l9pKlbXLiFMF1lc0hCAYIxee103f?=
 =?us-ascii?Q?K6Ucqn+t6jWzhWsy/7ppd7BC7lqH0M3nnB+OLaK6P/tpEymXZInuLPdltDzS?=
 =?us-ascii?Q?plDfp5w/K5/VKgf3pHHvxaYEFQPJvay/WHuxm6JGuRQVjbmb7ybGfrEvsOdg?=
 =?us-ascii?Q?AkZPck1zwQ1Asqc4BjTtrpydBUVuOTyDGy9hdkwg66uT7bXrhH7YEmKLreu5?=
 =?us-ascii?Q?Pq4EjpE6UrNB8SGyaotCgfut7e/nLG+MgUzaN0g19uzGC2izjJAgcsn3eCwW?=
 =?us-ascii?Q?0I35pvL0AxHJr6AELTIcVf5J3krseSljExPpK5y5GtPlrOP4lRTeBHtZlhaM?=
 =?us-ascii?Q?JvSga5Xi/cb4+1lIX9ufJoYRiYZw2vrwfCxdx0DzIbQ50rav2IpvciXzoSbP?=
 =?us-ascii?Q?yveV2vLkbFxlMudoVpH2UyXi4psTW2eHA20trs57sr1m5hIsXrc/qaumfmtO?=
 =?us-ascii?Q?Av5dnt57FN1bcXtKy8jYNvzOqb9jRmk0In3ZyMM0tC+zvnH4VoZORptB2IDT?=
 =?us-ascii?Q?pGrLyS6hDdOXg5qyCVhQZOKG7LvHsklT3nwCGjrMmAdNxF49YNAVILtJIOiF?=
 =?us-ascii?Q?3GzCRgBvpv5tqv7atKXy1hNjWmydEZFbrQYfRTI3cG4EMTSKKmfZLvBw4qBG?=
 =?us-ascii?Q?4Y5l5+LnI4OxaXjHkegPLEMfLI5D1LI8+bzW33B4nPQQh5MVVg+/f0cov7Mb?=
 =?us-ascii?Q?TLPUWn3JbzSMJghJ+P0k5ryoNo2ndpGGa0MorN/12wtnS7nbDB2mC8QpZofI?=
 =?us-ascii?Q?iaqL6JFCeZiqzaqScqtd2uDoo3No0SJRUoF8ibvND5TypshqToRh5KvH6Gcu?=
 =?us-ascii?Q?S9cp8z5IZsHkKsChxdVO1vuGeyUM?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e32ad548-e286-41a0-3358-08d90a581305
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:44.4072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6r37xdO2rL+BZJkpPhGWiiPupUuNl/csV1uJsnLtuFwob04oJ+V9KDjsshDSVOeJVa1WR/yHU21lfaj3UUcvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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

On device removal reroute all CPU mappings to dummy page
per drm_file instance or imported GEM object.

v4:
Update for modified ttm_bo_vm_dummy_page

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
index a785acc09f20..93163b220e46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
@@ -49,6 +49,7 @@
 
 #include <drm/drm_debugfs.h>
 #include <drm/amdgpu_drm.h>
+#include <drm/drm_drv.h>
 
 #include "amdgpu.h"
 #include "amdgpu_object.h"
@@ -1982,18 +1983,28 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
