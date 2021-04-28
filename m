Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500D736DAF3
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDDC26EB6F;
	Wed, 28 Apr 2021 15:13:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306466EB5C;
 Wed, 28 Apr 2021 15:12:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jESc0j2bvIBWccAOa8/9GT7yJwBcjBe+ikhvSX6TOcLEWyGVBtHGeL9rwp+/6PnUDxIZmDZmg9TaQoZdNoRL3H60jDoDYfHaqHu1E9/baAcyymTy8Ui3dkVBh3EEMjebUF1DJe2KFNTIBmtcb3rQvPfAhZD6KvrFlBw2DAbZygCoRMWXSPMJ6CDnQpidT9HepDOxF2A45vSpOnK2JNPs1tOgC0LSFyNhryFGehulfo3+zt0mgnFLP8tHRay+8nbblLOi39icoh8lZb5to1KqeF/Z0LkbGN055HnQYtfxcJHgVAbUgwkjHaMUDhwqklkIKSBxUm6lDPx1CqKdlo/1RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY/Bg/klW6ajdNMlph32TuucSwu+zbFtbneLFpZ8Rpc=;
 b=XPuWTD9sgk0iy/TCm6klCznam4IdMo+IxX3CvUE1WVQYu7EkWZoNJ2VFbSyPuMY/gRBThd3kGa+oWiqZzhMYZsYk+PlP+ir2c7+HRMV/WMGPMa1+242A5L6qzgy56veJZS7ZHGrhBIXVpc6QZ2mXLCh4MJkYbUA53Zz+8NcexWgf22/DSU1bwLNxM0P1ukkaZhqnvfgt6od43ThZqtQeDqROzwi3exxoDQxb7HrV9jNyXQZB0JvD3tm0wLyrtxtXL3WLJ1lye84AxMgglohfhSWaiEK33IdniAkRB9CQ7Zz91WL4S9xad+FWzZHnG/WsUri7K6cpyFt9iWu151ci+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aY/Bg/klW6ajdNMlph32TuucSwu+zbFtbneLFpZ8Rpc=;
 b=eHbam1YOy2r/7KgIG72od9n2cTzYPbq5AmWvNWrMIoCdMtarh91uNBIIp4nJZzvbJkbf+oxjIcZk55pwcRjNxJia5Nz7ZyXPnfwOg6989jf/tjWmpFF5w5cG8fQ/mS/Hhmbq6IsoATTxvUSce0NCub9kK4uwgnWEoA++It88gY4=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:58 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:58 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 14/27] drm/amdgpu: Fix hang on device removal.
Date: Wed, 28 Apr 2021 11:11:54 -0400
Message-Id: <20210428151207.1212258-15-andrey.grodzovsky@amd.com>
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
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57ebeb21-f18c-42e2-b645-08d90a581b24
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB4462DBC3C79428139ECC4C58EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VVxJ+qGOJB6vPA1w+p9+wvYechNnrVfvySsTrYJhZ9ftclQ+jv8KiNYUQlJw5/etYw7NHwCRF1srCyH/rGqSSsnvEnaPF0zP88G85xHHOvw3hRIf9zKhMbe393WgUfI9IO9GqjeJ9tJ8VO6agAc9X8UqSlFVXDrjIZDvR9Mt5NuGypmujV4Jc8fO5mRnHrFeXPUj/kItDtes+LuybBFFrxLZ+omo2cFz4eX7aiJix7Q5Yge3uxXdoPd9d8l+JTayGkUXOJbm0mMFsWRroC2kl+z4k0sup3FnWLSjtu7NB/tFo94YOpL0v5i76LBnz8cWtYTIpD71PRMYtgNPip8mbDtibYg5AKdKzzmGvWGcwYkAgYQRvq/wG6zcJPwJVsNecqfqQNwMzWKrt0AH3Mua0YrRainYdwRDLw6SluwdinY0loNXh5DJUejvqorASrXWzbwGHPFtxZfJi3N8CAX4L4JJivKHjVf2iq+jJ7VLikpfcU+pFiFeEhz4eP62e2qAMJ80V2OPeAQUqvGeZganTLfBmLcdvUakVHh17RKOlaGGUMMCiyBi+yUV4vKSH6tAFJLafW6YrtWjJgtOnyzzbq8xrqDoqINB2qzidt09meo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(478600001)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?A1sF5VFQRZwc5usIiwiraRcnS++XDKQ0LlkJsAj7+/HQJAWzhBE+n+h/i/LU?=
 =?us-ascii?Q?hSiKvrmTx1XE/Z7Jafj0lBrTy0A0s42DiLru+W1y1+yov5jLyOoKfZLeefBz?=
 =?us-ascii?Q?uO4MuD2O8d4JuaRsPHt+01QwevkX6mgMceK8nrLQbzb0gZ74Nrk+uOlK8r4Y?=
 =?us-ascii?Q?3e4QbNmQHlyHcLmvkVUyIaFJkL1VeZ/aHFsXHaOBLUcUlTu+bl4izoMoNMeP?=
 =?us-ascii?Q?llKbZY9/2sicblHNxzvA0JGBfhminY7Pox720f9paIOPts3/j+ZVz+efSZpA?=
 =?us-ascii?Q?bP1eg4SsPDQmv29K/NwxK28UuH+wK6DVRm8xn2G5bHaAiXejiQd9JTWTTNFC?=
 =?us-ascii?Q?ox9inTnvg/tcA18xjmcsVFK5KWcGSy9Bt2kOfsD6vQmr2ezdsAA8onRsPtAH?=
 =?us-ascii?Q?knOew/zzPHCyw2S9IwHjvWOzEvmRO0rvRYPxHB5SG+UK4zH9W5aW/6vh636q?=
 =?us-ascii?Q?1acat2iFcMIss2eMZAwplIqVAvwsuX59kyKWDqKNOjYbj6kjHlSVpgKiBdMY?=
 =?us-ascii?Q?Cq52ckeKo28YyOit/BL27ZEnr637KW2WVQgB+t7lZaNRlpwbHIwXjoqUujfY?=
 =?us-ascii?Q?XJ3efrSzR4W00wkTfHMG5pdtBF+7qRUWbHPWcQpcYfZnbcBzGA+77AV7hwEX?=
 =?us-ascii?Q?sCbaHS7gPYzcHTtfIFChPFtyZlT9TpfNm2ET9CsP2z4Fa3eUGOMj42W74OyL?=
 =?us-ascii?Q?wcrVFU3rqmuQzajRRokzzG+ZXf/sXIdvtxHuOvJ2ONqVWSt+ydbcjuE0JcFA?=
 =?us-ascii?Q?Kv6SeHZhcSKpROee2934c7YHh8f0NPa1shfjmNMZnWD0qiCodSpZRGMzhDBC?=
 =?us-ascii?Q?69fl1p1NODCOVzIh1jpYvT7UmDpI2VibH1z/t30VBbeaRjUneedcDX2ty7ke?=
 =?us-ascii?Q?ZZyrlqoSusg7PuQkL9AxC4Y6F9j/snGk5JEeOnEdonbqC4Cpdnlhv81ES0CE?=
 =?us-ascii?Q?2/Z7xA+lj6rIMiH3gDCE1zRGYSVXLhFdrRCLkE4SzP2liuYlkIp2+JkdhHr2?=
 =?us-ascii?Q?X/x6WEtfY5loz+3iEflBz2Udg/8znotAccvBaC9udHZrT8XQ9So21h03ppwj?=
 =?us-ascii?Q?3gJP78e7iOxgupuSmXILxMUIwsG8pvRX3cB3OGWVJosYbKDRNLwKp+mT2bls?=
 =?us-ascii?Q?ymTociSK+wn/PTyuXq8rZyFqVW+l8uzzyKy4AY5idsPzdZHMOXYnINruPOh4?=
 =?us-ascii?Q?IXI5PdOA4n4EwN6GK8KCsH9DIeAbs1ryWY6X+sOL+t9z7WoY6no1jtIJ8Xwn?=
 =?us-ascii?Q?92qaMDKwqysj9qsBS2GafkDmg0JrcDnR0tmzUVtRfAvgNgd1aA31uLp47YsD?=
 =?us-ascii?Q?maDIhvSNi5m7QzflBoca+OvctGgapAWQnA25VifKqtWqJsbia8JbXafDr2t/?=
 =?us-ascii?Q?yKw7VbyS5tZhbcuonWHwe++uYSRF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ebeb21-f18c-42e2-b645-08d90a581b24
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:57.9565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jJglMBp7i02MvmXmvjIsorQPWpMSQEni2Gk68rQuUP2dGNRvlkT0BUEleiZXYKtzuiAqF8Id4/SR+HmPBjCO+g==
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

If removing while commands in flight you cannot wait to flush the
HW fences on a ring since the device is gone.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
index fd9282637549..2670201e78d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
@@ -37,6 +37,7 @@
 #include <linux/pm_runtime.h>
 
 #include <drm/drm_debugfs.h>
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
@@ -539,11 +539,15 @@ void amdgpu_fence_driver_fini_hw(struct amdgpu_device *adev)
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
