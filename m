Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1BA350DAE
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 06:23:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05BE6EC32;
	Thu,  1 Apr 2021 04:22:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2087.outbound.protection.outlook.com [40.107.220.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FEA6EC1D;
 Thu,  1 Apr 2021 04:22:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zz+6H3ivueiepBaDuilG/YrMxVhqZZZZJ43j2iYlIH61OsmcOs5EdCwlF4BH6mmIOn7bDFaR1S5HsAYGODyJ9xl02uWjASc8shjIffTPlo4YCAdEtusfVIizOHUlWl9OTNLKKZ5gd506xqFslZN7KM6xZ5FsnWP316VnNRNOdKf8v72J+qA9tKvRzqShRR76ECbP06GjTVKfmugpTL+Nsd3QRKKS38rD9EN/GgAhO5+zlP9Lc5dk1CM65lbbvtnSehhsId/9h14NzdFmIXFEQigz4s2xjhQFQmEgrOtwfkWJm801N03/Dw7TNJXwWkG8Go2wPj9ft/+E41SwhVwT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjrwrW4zOztW2p7w6qx2C5fIoD0U1x11CPhnAnbvj70=;
 b=bsX6tQkkfNyLRRV4qm+WpEueYBEwQuPjsEbelEs99RbOPO2C2TJI49ePQgVHb83CeClLU6UulP+ott2OxrGqiDGScTk246CtFeHZ0/qd5cx8ZL/yJUWT++Oo3VGdU9SdZEcJ9nigH/UtGV5dHQN/35QplgppooCc+pZOJ/hRl8PunX3ppoWs4h7bG1fG3QhmbOPBhrEwJVYhFTNwIn9Ims+/H3ZKQrHvh1neLabh74OamaqwYlojE48Ytwwi1jAMoNCJeUOf3xAfCIMd/UvPamsC93X3PE80akfyQqIlQAOkemSsZztIBYHcFRyVwpVznUOLUhWdSrusG/Ya9iZFLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjrwrW4zOztW2p7w6qx2C5fIoD0U1x11CPhnAnbvj70=;
 b=WATrk+HcgmxdYO4lM5PSWJKTEwOIBvBoORdLA2arwvK4Dx+pUIiJeTrybPAx+aC2dJArEQOjQ6CMBIwUNwjRxR9MN8hLD7IKBs3SjbbIUW0dLoRs4/yEW2/qaZ3L3H5R/W9VJhlPTztLBKbVDJrft5IN03f7KqmY38Ja3sv/Mww=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by BL0PR12MB4916.namprd12.prod.outlook.com (2603:10b6:208:1ce::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.29; Thu, 1 Apr
 2021 04:22:52 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.039; Thu, 1 Apr 2021
 04:22:52 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 11/34] drm/amdgpu: Enable retry faults unconditionally on
 Aldebaran
Date: Thu,  1 Apr 2021 00:22:05 -0400
Message-Id: <20210401042228.1423-12-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210401042228.1423-1-Felix.Kuehling@amd.com>
References: <20210401042228.1423-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::27) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YT1PR01CA0088.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.32 via Frontend Transport; Thu, 1 Apr 2021 04:22:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63e5851e-7924-4045-b168-08d8f4c5d0a6
X-MS-TrafficTypeDiagnostic: BL0PR12MB4916:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB49163E925E58C25C08E97145927B9@BL0PR12MB4916.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJKXfNlkieU59E+HqLrpupq4urKhS9FjqrviPAQEu019j+EronLGGzjw2h26SJwa9RuOjcgLfzTth35pqzzl9HqnG6mCgWpam2IqmMVKPhOqhtmmou4C3UkAtML6yYgJzGWVv7lLLzDj4sqemCVldOVPWHtocHbLVJZuqGMPqsGWUGY8J6fDBUP2ntdS2wU/OtWZArWXLnpGtuZg+F6YGfl+cr4ZySrMr/9+3tnlHJhQCCbnb7S9xP4dDOOIXO+EqTrS/YeBXFKOAh7+c6zH7BAuk8TJtqna3ybHxYlseonjFvKF2wN/xUmzWi3oRPTh4FQiFk2CqKsBXGV5HTSjQmqX/eik53Nc4Y2RE3WL6zXR+peDUwKB3NTJ1LCVfeE7a1df4TermtmY6dshrGL0a7cdJZzxfKyXCewREwRXTInxexEb1jhpyOw6Z1dV+qo9dc++fnrS90Wi6githIXD6g57UpXv4aOY63yIFyBSNvVjfK8SQ1Cldq5+4T+f46dinUTAzyyJfP19hUbCkfW72iIo1jCO7Z56zbWftPG6Jce3o3zQukZnDXw7WPcpHgPkXvPSidj+Ig3vmYke+YWYuEI1Cz6hopeMWKLCboSfhc9wqJEHQCHSFUVlU+VvEU0Yh29oN9VdziF8dNobUe4Rt1PgcB0Lk+iZB/taZ7i5YhE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(396003)(39850400004)(5660300002)(478600001)(36756003)(16526019)(186003)(1076003)(316002)(6486002)(66946007)(54906003)(956004)(66556008)(26005)(83380400001)(8676002)(8936002)(450100002)(38100700001)(4326008)(52116002)(7696005)(2616005)(2906002)(66476007)(6666004)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?Jcq3s16K7mozpoiMgEkuQW5WmuL/wvR8uB1sVibQQbA9190vlIR9nIux3Pbm?=
 =?us-ascii?Q?gB4Mpcv47/JX58wTXVh8nueO2qzO/hjxVD0Ae7QZPABvnejix1me+SV99yik?=
 =?us-ascii?Q?IVJdlf2Y2+8JBldKiP/bJRV1tO0763abyKekQrtCOIqmvPaCKTNmlRjXFhzz?=
 =?us-ascii?Q?3aQeUmGV/6AqgBO4ATWoznv5YynnPAbBsxKpxS86SB7U6ujv3qvDfjAErMMa?=
 =?us-ascii?Q?0FPDsPd49LX/d1ej9s43wwCx2yEHnGgCar30gdDr8EUK8+RI0bzZlg0xYuyM?=
 =?us-ascii?Q?45EoORrHBdaBDsxsWb8IGxR0bhqhkAx7ZedF1I7poVdLZwB5bRDAfx8txj7L?=
 =?us-ascii?Q?HIaKKyy+jA16ndtqLblqGcROL/2IT9sAGbGXoFAWDO9I9GjwU+ISlwu+Emd+?=
 =?us-ascii?Q?leF8dzrmoawETJP35omtffDwAE2wtPmfkcqZqpYooFG+IEzSDuwH0PVdzB0t?=
 =?us-ascii?Q?FTlSzrOiXvdqPCSp+t4qegIW57S87OYOR6Aki4EdkFiShm2UFiidcgbbyIDs?=
 =?us-ascii?Q?BXmGlBjYfhDjF0yB297++rSoSrCCThEAeoqY/LRJzHSqX6mDKg7CDfJZkF5/?=
 =?us-ascii?Q?MfHHdKahe1Q25kXLnN79hqktH+8h746htStpe/oDkiLpCnj1aS6Gk+EyL/Tq?=
 =?us-ascii?Q?0cF8SCptF+euOV0XDT49VARm99DBtPy5cnmgrrXiYcwQL2LGQ4STuDOSVA4j?=
 =?us-ascii?Q?uLudomRDY0jBoA1YMMiLsqALzSHldCXAmRVK6r+x1VLwcDdSmDGXBK2sSIoI?=
 =?us-ascii?Q?TwPBIU5qSno+ywv5pw/E28NM4zOKjUB5ECWFKlNCxyB/wLDeuJsYP4EVRUTe?=
 =?us-ascii?Q?/I0CjgztTd8DjyBLO2vA2fqewGiB7oFDmYTWKjP6yuAu+OxiBXadFtg8tLVp?=
 =?us-ascii?Q?objW4tei3ueqWHFJPcT/J67zl1Xo2cI5gaESmp5hD9yS6BYz9JkKyJuWLNpC?=
 =?us-ascii?Q?Uu/0ZnZhmLFSOV5CXoSqcv2ATuzcC1Fu4vMM5oTjLBtf0dJJVHhRNa8owDPD?=
 =?us-ascii?Q?2Ct/k1zbSAPCzSK8CzSqlr79a5pCoKXLgfF/Wrp/ci7XPMrMgdJ+nqz5hwBA?=
 =?us-ascii?Q?DEuME+mAJsY7qmLjoG/m6dNYzv/lxrsDELixFlFYsgd8sfsn/sOLGHTLDEK6?=
 =?us-ascii?Q?t4vrcoMaBpuwi+pXft3TxkP4DjVci5yEPWo571ERTJaFd77bMVwUASIhoyTO?=
 =?us-ascii?Q?ZRWfMX1/7dcPnEMWPOLbe6+oVO19s3IMWRi6o8sdMaZWG9MLz5sl8+dZzWwD?=
 =?us-ascii?Q?RHCUmbIHT4lMwZg7KacvpIZaYXRylAIYbEmZIWB7a1YJFhXWi2UcMb9EyHFg?=
 =?us-ascii?Q?nkfHEbjB0m9obVAL4ZLoXfUk?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63e5851e-7924-4045-b168-08d8f4c5d0a6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 04:22:52.4651 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jC1CMtH1SbZWl6s7BDz7lql/rhyb7V2RIwnPNp1shDJKTRFLynjwlAmbBMdMSkYhZSiOD2W72Rfu+kc4PL53iw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4916
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is needed to allow per-process XNACK mode selection in the SQ when
booting with XNACK off by default.

Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Philip Yang <Philip.Yang@amd.com>
Tested-by: Alex Sierra <alex.sierra@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c  | 3 ++-
 drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c | 8 ++++++--
 drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c  | 6 ++++--
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 4bcc03c4c6c5..09f88874bf56 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -640,7 +640,8 @@ module_param_named(mes, amdgpu_mes, int, 0444);
 
 /**
  * DOC: noretry (int)
- * Disable retry faults in the GPU memory controller.
+ * Disable XNACK retry in the SQ by default on GFXv9 hardware. On ASICs that
+ * do not support per-process XNACK this also disables retry page faults.
  * (0 = retry enabled, 1 = retry disabled, -1 auto (default))
  */
 MODULE_PARM_DESC(noretry,
diff --git a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
index 5bb9856bd8a9..f2fb2cac5c77 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
@@ -292,10 +292,14 @@ static void gfxhub_v1_0_setup_vmid_config(struct amdgpu_device *adev)
 		tmp = REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
 				    PAGE_TABLE_BLOCK_SIZE,
 				    block_size);
-		/* Send no-retry XNACK on fault to suppress VM fault storm. */
+		/* Send no-retry XNACK on fault to suppress VM fault storm.
+		 * On Aldebaran, XNACK can be enabled in the SQ per-process.
+		 * Retry faults need to be enabled for that to work.
+		 */
 		tmp = REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
 				    RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
-				    !adev->gmc.noretry);
+				    !adev->gmc.noretry ||
+				    adev->asic_type == CHIP_ALDEBARAN);
 		WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_CNTL,
 				    i * hub->ctx_distance, tmp);
 		WREG32_SOC15_OFFSET(GC, 0, mmVM_CONTEXT1_PAGE_TABLE_START_ADDR_LO32,
diff --git a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
index 29d7f50912ee..b9d789a9e49e 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
@@ -298,10 +298,12 @@ static void mmhub_v1_7_setup_vmid_config(struct amdgpu_device *adev)
 		tmp = REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
 				    PAGE_TABLE_BLOCK_SIZE,
 				    block_size);
-		/* Send no-retry XNACK on fault to suppress VM fault storm. */
+		/* On Aldebaran, XNACK can be enabled in the SQ per-process.
+		 * Retry faults need to be enabled for that to work.
+		 */
 		tmp = REG_SET_FIELD(tmp, VM_CONTEXT1_CNTL,
 				    RETRY_PERMISSION_OR_INVALID_PAGE_FAULT,
-				    !adev->gmc.noretry);
+				    1);
 		WREG32_SOC15_OFFSET(MMHUB, 0, regVM_CONTEXT1_CNTL,
 				    i * hub->ctx_distance, tmp);
 		WREG32_SOC15_OFFSET(MMHUB, 0, regVM_CONTEXT1_PAGE_TABLE_START_ADDR_LO32,
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
