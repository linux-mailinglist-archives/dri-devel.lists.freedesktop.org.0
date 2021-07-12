Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBEB3C65EA
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 00:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59BCE89ED6;
	Mon, 12 Jul 2021 22:06:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062.outbound.protection.outlook.com [40.107.244.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C18289E19;
 Mon, 12 Jul 2021 22:06:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IhlQt17JzObsepQnSsLZAmKtBZr6zeg24LT37N17Ln6z/WTEYrJXqTNyzKBXRsTKZXiX8nPGmmjYDbjidiRQDuhsLBQjpbmwMXkV4T/bhoow/PnURPKw1UpYWw/Zm989I2qMbc5FQCATJndmgo7nQz7V43t/YjWNYiaKMaliI76jzQd8FEL0WuiWGwUxKtide4CHSAEF6RksNyMlIAiVshlKmAD2UISdQ3fAHgD5HruCVlFLIgR4dUFCJgeuOAuEY5n6Ymig+mvXPHdrZfmhTGJj7+7aMEIBtkXL3dvEFrXtzYtOfECNoplu32/Od4Pp+ThrbStyAJbEVwpBeKZPOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arXv5Pb4dAHs+mwx9rnnvrnJxXODLNnqdB+wWqNI1wY=;
 b=H4pYi204oXcgUisSDhDzaoZVqLv5MBfABd18MdknO25OLOXoFOHlHeuUenVpYQVtWbIH5KbmObC010h7ZjRfGuTR/pXjty17oOVM/I8bU7RxYG2TMggLb3b50iMgDROSNoo86L0oG/rAcXwiQxTKusszeCIEYQ7EzHqwNCWzlr09jsQJtxatbK1a1X76/WC1lbBeLR6tAWR1u+Traw6szvjd++qVgUZwNh+vw3oHyQhuZ5YEbQjgQHwa/++laZOAs3e3guoI0XE0+auIjE2HD/RcQcJ6oYga4X8Agp6iglT2LkFJxrmRZrWSWBXtzQ582nm2lbCitwN1x64znjtEkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=arXv5Pb4dAHs+mwx9rnnvrnJxXODLNnqdB+wWqNI1wY=;
 b=kLnKhXco0GfPPD+Zr9RQkS/Qlfloa6MKYK/cVSXWi6F4Tr4yfJCPgHowk8jP7j/59vIELT1SOgxFflMQAbkeTvvQeJoXOam1QDLuaKkt/gsh0uJAw61mNyUslKo2fFNMNpR/g/KtwFC+HsMUmiLMR1WiK716IIbNbmbKCcTPTOg=
Received: from DM3PR12CA0065.namprd12.prod.outlook.com (2603:10b6:0:56::33) by
 BN8PR12MB2979.namprd12.prod.outlook.com (2603:10b6:408:66::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.25; Mon, 12 Jul 2021 22:06:51 +0000
Received: from DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
 (2603:10b6:0:56:cafe::17) by DM3PR12CA0065.outlook.office365.com
 (2603:10b6:0:56::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.19 via Frontend
 Transport; Mon, 12 Jul 2021 22:06:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT023.mail.protection.outlook.com (10.13.173.96) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4308.20 via Frontend Transport; Mon, 12 Jul 2021 22:06:51 +0000
Received: from Harpoon.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Mon, 12 Jul
 2021 17:06:50 -0500
From: Felix Kuehling <Felix.Kuehling@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 1/1] drm/ttm: Fix COW check
Date: Mon, 12 Jul 2021 18:06:36 -0400
Message-ID: <20210712220636.475675-1-Felix.Kuehling@amd.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6964e19a-0c43-4406-e842-08d9458159ec
X-MS-TrafficTypeDiagnostic: BN8PR12MB2979:
X-Microsoft-Antispam-PRVS: <BN8PR12MB2979C63E7ED0B54A191B264F92159@BN8PR12MB2979.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:361;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 67myN1Gt1Sn8JTbbC88blYhEqiQKk2lsRSvO5BIxHRQp9tYfZz2je1ILKDE+i1LaHr6T+oVUOxOBZZ8GEI8tVOkmHDL9tdm5rxKEvR5nWjCCcudrRQiW2Fr2hRHocok0ul+uI408sRcTmH3opCWqrZnmui+qA3BwOS8IK/snTNPi5cR8qO9g4a6p6/aMd1dz1pb2pEN24iZJ95SU88kGkCgUBNqSJZwXuWHc4W3cyFkbks6YwueENRC8rFL7a6EwbctkOou7bt5so0/opzdwOyj+ydjtjIXBCZMwGG5W9CDxW3OFFdhkCqCcjFfWUxaPl+zt0hKFMQuTQwIs8l9QuS0bwLIdYvA3RVcBWi6ua4NB8ZN3R9edC3xJk36mUQprcIAE2K9oUK1L3zd/lPVXO+bL7C22KZoQNFytqKifgeE73oWt2uELoIC3H5BWToFDsdFOe5IHU4bh/u2ulbKsUcWs73AdR+ThZXkmvqbNTcKMLJ0zA9KZgpCfHkgGf1UAdDfLMTQ1r7hcUCWZ9XFegJVgfdkFKk9MQcjE9OS6l9rrmprhvKg/VF+NJMM0S4yyXU2uVEOWn/l1gtOwaF9z6CQWyHoLhmLMZJzYrEF8NfkeyU5f9458rIZ3r5DqaWgK3S1ewFzUDW5DdJDNKsqH4n4XVeHwhe8HXmNcD1RqK3Zs9AoAmDBWMg+2Eh+ZImzz8650BKqXxX8Car9RDFDfb/2oZ8XWt56OETt7JMteM/E=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(396003)(39860400002)(136003)(376002)(46966006)(36840700001)(426003)(70586007)(82740400003)(450100002)(186003)(81166007)(36860700001)(336012)(5660300002)(8936002)(2906002)(6666004)(2616005)(478600001)(70206006)(82310400003)(110136005)(7696005)(47076005)(1076003)(356005)(83380400001)(8676002)(36756003)(16526019)(86362001)(4326008)(26005)(54906003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2021 22:06:51.0362 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6964e19a-0c43-4406-e842-08d9458159ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT023.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB2979
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
Cc: Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

KFD Thunk maps invisible VRAM BOs with PROT_NONE, MAP_PRIVATE.
is_cow_mapping returns true for these mappings. Add a check for
vm_flags & VM_WRITE to avoid mmap failures on private read-only or
PROT_NONE mappings.

v2: protect against mprotect making a mapping writable after the fact
v3: update driver-specific vm_operations_structs

Fixes: f91142c62161 ("drm/ttm: nuke VM_MIXEDMAP on BO mappings v3")
Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c  |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_gem.c    |  3 ++-
 drivers/gpu/drm/radeon/radeon_gem.c      |  3 ++-
 drivers/gpu/drm/ttm/ttm_bo_vm.c          | 14 +++++++++++++-
 drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c |  1 +
 include/drm/ttm/ttm_bo_api.h             |  4 ++++
 6 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
index b3404c43a911..1aa750a6a5d2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
@@ -79,7 +79,8 @@ static const struct vm_operations_struct amdgpu_gem_vm_ops = {
 	.fault = amdgpu_gem_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
+	.access = ttm_bo_vm_access,
+	.mprotect = ttm_bo_vm_mprotect
 };
 
 static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 5b27845075a1..164ea564bb7a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -70,7 +70,8 @@ static const struct vm_operations_struct nouveau_ttm_vm_ops = {
 	.fault = nouveau_ttm_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
+	.access = ttm_bo_vm_access,
+	.mprotect = ttm_bo_vm_mprotect
 };
 
 void
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index 458f92a70887..c19ad07eb7b5 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -77,7 +77,8 @@ static const struct vm_operations_struct radeon_gem_vm_ops = {
 	.fault = radeon_gem_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
-	.access = ttm_bo_vm_access
+	.access = ttm_bo_vm_access,
+	.mprotect = ttm_bo_vm_mprotect
 };
 
 static void radeon_gem_object_free(struct drm_gem_object *gobj)
diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index f56be5bc0861..fb325bad5db6 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -542,17 +542,29 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 }
 EXPORT_SYMBOL(ttm_bo_vm_access);
 
+int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
+		       unsigned long end, unsigned long newflags)
+{
+	/* Enforce no COW since would have really strange behavior with it. */
+	if (is_cow_mapping(newflags) && (newflags & VM_WRITE))
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL(ttm_bo_vm_mprotect);
+
 static const struct vm_operations_struct ttm_bo_vm_ops = {
 	.fault = ttm_bo_vm_fault,
 	.open = ttm_bo_vm_open,
 	.close = ttm_bo_vm_close,
 	.access = ttm_bo_vm_access,
+	.mprotect = ttm_bo_vm_mprotect,
 };
 
 int ttm_bo_mmap_obj(struct vm_area_struct *vma, struct ttm_buffer_object *bo)
 {
 	/* Enforce no COW since would have really strange behavior with it. */
-	if (is_cow_mapping(vma->vm_flags))
+	if (is_cow_mapping(vma->vm_flags) && (vma->vm_flags & VM_WRITE))
 		return -EINVAL;
 
 	ttm_bo_get(bo);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
index e6b1f98ec99f..e4bf7dc99320 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_glue.c
@@ -61,6 +61,7 @@ int vmw_mmap(struct file *filp, struct vm_area_struct *vma)
 		.fault = vmw_bo_vm_fault,
 		.open = ttm_bo_vm_open,
 		.close = ttm_bo_vm_close,
+		.mprotect = ttm_bo_vm_mprotect,
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 		.huge_fault = vmw_bo_vm_huge_fault,
 #endif
diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
index f681bbdbc698..40eb95875355 100644
--- a/include/drm/ttm/ttm_bo_api.h
+++ b/include/drm/ttm/ttm_bo_api.h
@@ -605,6 +605,10 @@ void ttm_bo_vm_close(struct vm_area_struct *vma);
 
 int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		     void *buf, int len, int write);
+
+int ttm_bo_vm_mprotect(struct vm_area_struct *vma, unsigned long start,
+		       unsigned long end, unsigned long newflags);
+
 bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);
 
 vm_fault_t ttm_bo_vm_dummy_page(struct vm_fault *vmf, pgprot_t prot);
-- 
2.32.0

