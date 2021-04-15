Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F48935FF61
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 03:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D57996E9B8;
	Thu, 15 Apr 2021 01:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680075.outbound.protection.outlook.com [40.107.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 360C06E9A1;
 Thu, 15 Apr 2021 01:24:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MPPEgMddE91cL++sLox0wqDMNOgX3Qp6agmFmE8HhuFMWNZ9wD81OTkj2bNar1sgNEqzv4K45XhsQQfMqFF+67iZQO/0ptk90nvCIBQW2rADWyo4eFLrjYPFmH5ogqZFCbA7UGGz3Q8PTwtbjGKkq9Ior9ghlbOR4aNkymeq5Lxb1fIRAlH9XleSaR1zrHzYTzq/U9vY73T+nfPwN1FqSc8Ne5LkB6HPO0JhwuN6yNQzphao222AwxPW5OeJp4VtnzY931oOsaXvV3vMnW4KyzZppHIVSUlu41qrRPfRD2FzRWkRisaBCmgkhNHhuQj3PKdodqTkSjdrzUDdav6U4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziSr8hfG7qQpTZJeX4jWoE0xMFORJX5nx8K0iPNb6Tg=;
 b=mTsI8Xp6+cueClyPnB3KKC+JOaYbBV3EGOIvdRw8B1YiKVEHM6HVX6x+fxzBeBFpUNPuwB37CM3IqvXJcR+/odGHDAQLh4kzpTQCDKll/NVCEl9OUHfCkY7HLk5DtSQtrzz7/fTWHlJ8+ki08pNnO2MKfTLNDL1mXEOI+wwCzfM11rcpice4othGtFb+0sCHiFtfqLM0gxecEbYAjaiSh3ug76/vxvLbYq8F1Udy8mnY+q2cMO6o54UtJ9rkE+wCH0w9+3UFl3mUn4moClYTt0v63sP2TAcuUXfnTDZ5D61c4NtlQrp3pli3Z+rfdvzhAd8QL62KZltuft58ccO/QA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ziSr8hfG7qQpTZJeX4jWoE0xMFORJX5nx8K0iPNb6Tg=;
 b=uCmDA8QYBgHV08g4u11Djng0mEWRXb1rny50jWi6py/e7QDrSKn1z7pedCnhs9a496fffNoDqtHwOPnMgv0nnJyqXElZjabRfev7qCm+83vIMNXf4Jngh9ii1gQdXQBpP6irVXFvz/ojK3yagUs74csyt7fjj7IUGHu7m7PkxC8=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB4797.namprd12.prod.outlook.com (2603:10b6:208:a4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 01:24:01 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::70f5:99ed:65a1:c033%7]) with mapi id 15.20.3933.040; Thu, 15 Apr 2021
 01:24:01 +0000
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/34] drm/amdgpu: Enable retry faults unconditionally on
 Aldebaran
Date: Wed, 14 Apr 2021 21:23:15 -0400
Message-Id: <20210415012337.1755-13-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210415012337.1755-1-Felix.Kuehling@amd.com>
References: <20210415012337.1755-1-Felix.Kuehling@amd.com>
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::48) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from Harpoon.amd.com (165.204.55.251) by
 YTOPR0101CA0035.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:15::48) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.21 via Frontend
 Transport; Thu, 15 Apr 2021 01:24:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 201779aa-4596-48e2-bad5-08d8ffad25fe
X-MS-TrafficTypeDiagnostic: MN2PR12MB4797:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB479701ACB72D6FA564DC3684924D9@MN2PR12MB4797.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MJAcysX95CXuCm+yt5OY+x6ERGYtJ1wiIdbfzolJ0zQHwJ1lzQhafWybni2ewbT1Wa0Jp436S/QeSULtm/wCxoTml+Q0p8gpRZLNiWy6+ZDg57ySZ64EW2aS0dNG4VrCJCFFtnV0SitCg4elBXZmdAnr3QVaaAmMRbbruarZB4BlFmVnqpmzEGTVLbv2wUtwdYdQfE5vGLaGKdC20gWhSR3URShrdrn03vHmJjZ1VbNHZnj/64Yf2IO49WUyIaB8S5x2wLIharHrqiZs5MAIJUmpcGhI+KA1zFCAUGTOikS00Y0uNU60sFuolw712IIsQuwuhRJe3m65spzkP5K0Tz2hizLuTtdvrmhT4Wy7mjCH1N2ya1iI9J7Ef4fKM9NypOlsfDXDuoMZPmyaMgZgaNrgonnLpqKt20iJuU2i+jJNOB6tpGdMCNPpk9xlVMgdcmFaiCEfzzO2HHFPSbvROccFcJbOeOQQxgY0PXrcgDKVFX/K+uUIM/mpl/HlRT3oT96DOf/0SbMXE7fmHTym+T7IkTZaFudILQEi1qhyln/NAEbuR2vXRW1NGuOmNnHrrn0rWiljBjRozHkPiOPAZMXa1lmeiq49AxpABuW4ZPh+3Sq1u7f48TDOe9z4Y0XtZ8zM5p9JUiBv0wGEkAlXHAdFZdIpHNpetwIzvYGn1Hc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(39860400002)(136003)(346002)(376002)(86362001)(66476007)(54906003)(66946007)(2906002)(38350700002)(186003)(36756003)(16526019)(450100002)(38100700002)(5660300002)(83380400001)(66556008)(4326008)(52116002)(7696005)(478600001)(6486002)(8936002)(2616005)(8676002)(1076003)(6666004)(956004)(26005)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?a8iwez6B+JwnuDzJHw1czhvmwzluUkb6Ys0vKPbFHlkkNl5YWm+meHlpyCej?=
 =?us-ascii?Q?Od8faE7RFF3/tTMrxKYmcZT4wnf0urz0hBScbYNONCdPPecCEp1qmzW8+/C6?=
 =?us-ascii?Q?LI4jOgDdhebP2cV3zB6OOPZe6lUQFLvyYqLC8ov9BYcpRssOfmOBRi3g22sO?=
 =?us-ascii?Q?B1IBkXq75wem9wYw3DvISp7K8LC1cNbPhFF47E6mFFPoFAsB/eMr999XsVnb?=
 =?us-ascii?Q?7x2iwu3AWLN17veU4PHKSzVKTFEokg+L70fkIHwltxQRJB3rZZ3nQ1eNqc1L?=
 =?us-ascii?Q?A5Qa2AT1MdWpHDZ1gzqxuEaTxLb8JhAQwrfa+2wI5tf4MUNtlK8r1eSuq7eM?=
 =?us-ascii?Q?Y6gFMuRN71t/rnV0etQP5wG9RYHB/Gh/4fz2QQBzA9XUnXkdhVQ/QUUVFKyz?=
 =?us-ascii?Q?Vk73pqTNW/yT4DnIgMk3G+BRazz8MTpcI+uM/Vr6m3Z+uoz0fZnMIt/+xsGM?=
 =?us-ascii?Q?+g+7rfTDzQOfSnZojCillWVtwiKSQ2OgejDIBgRGYdBkdtbOZVnJ+VxubOa2?=
 =?us-ascii?Q?vU7UCGJWrIvrKtkog9/E6AzhzyVI0uXE7ASJvbsmSMDY5MCiwDiDRLi6O5ed?=
 =?us-ascii?Q?zdwmv8isgi+DQ5hYOW5Dt7grp8D37GsHVhV32Tx20fHpvynayRtB/Zytq11F?=
 =?us-ascii?Q?ldfZttXL6zw2WU92zwK3frN1FubZBVsWOv6WoYcoxgl+LNIT62v+54uMe3Uz?=
 =?us-ascii?Q?gQBnw1kel68oMzPbB7gOvGSdpoyp5LGglQK3q3qTCgMBgA45/XWPTZ7YZAll?=
 =?us-ascii?Q?V6aKryIu6ER0wfAQu/M6DbQ9/amxVip2uoFPivbx04H+eWtxveYD3nMbchnJ?=
 =?us-ascii?Q?wHRsW5HjxxhhIK4KuD7U62JiJvR5u4IRO3ql3kjvt+fS0mAPnO56/DvL8cm6?=
 =?us-ascii?Q?kP5ERE9f3jRN+RdbpLWjbtXzWWfvbo0FKQHW7ohLvrHfAOhvRuYfqf/kwA4L?=
 =?us-ascii?Q?owgi/2up4xz+ACN5rMOBdv8qQ3dDgLaz3+rK87oyO768LPT1mlQ5Znm7Cfn3?=
 =?us-ascii?Q?Dbg3u4M3f1jaJbYfLF76wForTA4Wky1SnNWDfsxMckAYW6EC2PfKCGK8OJwX?=
 =?us-ascii?Q?/UB+7hG76CP7h3CCTChO7E/z2dCe9M1wkn+tZgrI4bDil3t2Is8ckwBPwRGd?=
 =?us-ascii?Q?V0DBXR5FidFva2nTXUT+L27Uf5k7WdVtQ6oYQp5ahJm23JEfZ5RFB4CaAlHc?=
 =?us-ascii?Q?LeYQwmWpGJZF+xmFZA42XBYk8AqRbV+bNySDO+UgLHKBjBQH0mK6XqlgNkRH?=
 =?us-ascii?Q?54ZHIyy/mxI+52RTatxgYUTt2E3tf+jh5Adfx5UTYciAQXH/d2MysrG4DluB?=
 =?us-ascii?Q?0aEEz/0ANuqtGj8Iv1nsRBdW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201779aa-4596-48e2-bad5-08d8ffad25fe
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 01:24:00.6354 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1P9/yBNFakZgHzDrEaD5FPzgi6DCxiqEFYQ9Z/NSu0CSq4NSInwjnn8iWnf6qevAOMYtjtG5iHHkY6N1c94/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4797
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
index f0f7025bf322..1596d41ef223 100644
--- a/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/gfxhub_v1_0.c
@@ -291,10 +291,14 @@ static void gfxhub_v1_0_setup_vmid_config(struct amdgpu_device *adev)
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
index 585b6bdccae1..df09b0a829de 100644
--- a/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
+++ b/drivers/gpu/drm/amd/amdgpu/mmhub_v1_7.c
@@ -297,10 +297,12 @@ static void mmhub_v1_7_setup_vmid_config(struct amdgpu_device *adev)
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
