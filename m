Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 294BF604B79
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 17:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2E2510F281;
	Wed, 19 Oct 2022 15:31:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEB6810F283;
 Wed, 19 Oct 2022 15:31:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CJgmFMIx/9jN+XWpuTpV4H/S+61wiTolbJB02iCrMacRn4MdDwKrwObDcAG776w5f2RKOoR0+8YhRaV7bQOH+atRkkqg13wz+erV7bWphSh03mtmvyYfezdk7s4lYKhspuwZ/qytylZ7BzlSaSZRwqz6flqcAAiyeHWx1pn+TbFiODyXAylaiDUg8jjQJCwOTseyp9kRwyAqC1BPdtn1MUx8auzkruAxXjpsNFpjhAEBN/O96lhUIa4GmCLAMSI05n8jlLwywTL+W+HaQl/7CczmbqumdMQuLDIO3qHyoeZKc6wkZyiqQbZZdIZArj9C5ke1ur20OxfATPSt/WIZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IOVKGMu3ZjZYcHWM79xuhocGWIPPkIMN0BVn/0VGkrs=;
 b=MFDdJcvZjbIkSxMg1zsxfmZm4jYGJnKRlyTku9ETBvDqqCa44siIMn5av5S0WQPNqV+lfnYEyn9rRCnR8Nzg6TOL1/5qtgGZQpI+NBbVlaECE/+2vuLCPi9+ohTo2T8TMBk9X9rLdYXGGJbsr6CqsHPAJeupcKpZYAhuBpjNXfc6MMJpsVasifYYgQZLrxIHP3vrdSnVa63QsFZKaOI6xGFBCbbAexJBzHI92GpjgaRqySLOn+oQQWfZffkHbG/PL0CqL0bPzpiBag9kVQ6lRxhKNjlRAtdq9k4csvg1FSGeZtsXvZZAlibtBKf3MvMX1PeMMCpi/0ojD7H85v+wvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IOVKGMu3ZjZYcHWM79xuhocGWIPPkIMN0BVn/0VGkrs=;
 b=J1E/UbhSj9LIMTXpbJelKbSbEd/Zit+zOxLEb4pUdbJhWgPqsBzy6BAmYC0g1g7IFfY/9nGB4Ts5hu47W+7N3tPI5rigeWOSHQTsjkzC7MuSMlk/0efyVKEKlUChy5eUqZVY+W18j0KQjwaXP+41+R3H18b7TnADKrhImMameZY=
Received: from BN0PR04CA0154.namprd04.prod.outlook.com (2603:10b6:408:eb::9)
 by CY8PR12MB7219.namprd12.prod.outlook.com (2603:10b6:930:59::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Wed, 19 Oct
 2022 15:31:27 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:eb:cafe::29) by BN0PR04CA0154.outlook.office365.com
 (2603:10b6:408:eb::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34 via Frontend
 Transport; Wed, 19 Oct 2022 15:31:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5746.16 via Frontend Transport; Wed, 19 Oct 2022 15:31:27 +0000
Received: from amar-X570-AORUS-ELITE.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 19 Oct 2022 10:31:11 -0500
From: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 6/6] =?UTF-8?q?drm/vmwgfx:=20fix=E2=80=99s=20on=20ttm=5Fre?=
 =?UTF-8?q?source=20rework=20to=20use=20size=5Ft=20type?=
Date: Wed, 19 Oct 2022 20:57:36 +0530
Message-ID: <20221019152736.654451-6-Amaranath.Somalapuram@amd.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
References: <20221019152736.654451-1-Amaranath.Somalapuram@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT033:EE_|CY8PR12MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: cb8e17f3-d294-42e1-7430-08dab1e6fd52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z3BdmAKPH+aSmEuqMXg190ISvQVFqhorco1NII2i1yxWJQOPfGkyvOAsLpLR3GziDpZTHrDvmecPazk4dlJn86wH21uYFTOnjew6jGZ2psUoJI+74V9ygUpNamhBtvH8gs8iJYA/hyzWCOCHNJh/JnBWNNvbN5afFVgigsrAmL5Dv3I8Gjh9up2f45RP5NynbEFxRgJ5RTnRbuRuj0NTHt6RpetwlxPM+FUR5C/PQazHLvmLE+2z4phtFu2K5DIxnpVrpPdNvtpGv3xzA6CEY1vpOWWoVT6FrN6veOUowEn3zVN8JWRox5zxHNgUaFzzcVDXUICIU0br0IMyNg4PBFKPcpVf2clgqxI/cz4ODRpUvCpxZkNVfYtWH0U87vmDf99vbB6M8WSrYSYbmmrI/R6Kk6YJkm+OCh6IxzFpp8d4Ds50HIDtpMKUJjBiPRJp68yXxAOdxo1qT1VC5FNL0ZyQ9IfGssZVvbXTKxRY3kFvMICc2bprT2t5SsGAyaPLFCdMzdxF12LuafSAjsaEaA/zD7NL4XHvEidcWIzjDeiytbd/zugL4CVJ1VZcZVwEu+sIo1V0XDod3HRtwl2z32ubwB7fsaKWUYzMd8GnzbT1XYci5yB1pHq9R8KWwct0D/32sR5+Lea7mMOFkap6lXzZwIjG51cXvMiFvUg7ii19+Fq+6khgfAjz36oRj2CRJHaWf5Ar7tmkR8t6agEAcXk6TA/RtNcRDF1FWWQiXRyvMwffFItkWz8cTg9L9LbWn5BMa23HXmJSMi3ylvKqN6bpcUswOA7PKgQDdQbOs2SqRpIfwY6bd9byb4LkZ2bZ
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(346002)(396003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(40480700001)(5660300002)(81166007)(356005)(82740400003)(36860700001)(82310400005)(86362001)(336012)(36756003)(40460700003)(83380400001)(426003)(47076005)(186003)(2616005)(16526019)(1076003)(26005)(478600001)(7696005)(6666004)(450100002)(4326008)(70586007)(70206006)(110136005)(54906003)(41300700001)(316002)(8936002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2022 15:31:27.6667 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb8e17f3-d294-42e1-7430-08dab1e6fd52
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7219
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
Cc: alexander.deucher@amd.com, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, arunpravin.paneerselvam@amd.com,
 christian.koenig@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the ttm_resource from num_pages to size_t size.

Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_blit.c          | 4 ++--
 drivers/gpu/drm/vmwgfx/vmwgfx_bo.c            | 6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c       | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c       | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c | 6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c           | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c    | 6 +++---
 7 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
index 09fe20e918f9..c52c7bf1485b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
@@ -483,8 +483,8 @@ int vmw_bo_cpu_blit(struct ttm_buffer_object *dst,
 	d.src_addr = NULL;
 	d.dst_pages = dst->ttm->pages;
 	d.src_pages = src->ttm->pages;
-	d.dst_num_pages = dst->resource->num_pages;
-	d.src_num_pages = src->resource->num_pages;
+	d.dst_num_pages = PFN_UP(dst->resource->size);
+	d.src_num_pages = PFN_UP(src->resource->size);
 	d.dst_prot = ttm_io_prot(dst, dst->resource, PAGE_KERNEL);
 	d.src_prot = ttm_io_prot(src, src->resource, PAGE_KERNEL);
 	d.diff = diff;
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
index 822251aaab0a..134a13a50861 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
@@ -194,7 +194,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	int ret = 0;
 
 	place = vmw_vram_placement.placement[0];
-	place.lpfn = bo->resource->num_pages;
+	place.lpfn = PFN_UP(bo->resource->size);
 	placement.num_placement = 1;
 	placement.placement = &place;
 	placement.num_busy_placement = 1;
@@ -211,7 +211,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
 	 * that situation.
 	 */
 	if (bo->resource->mem_type == TTM_PL_VRAM &&
-	    bo->resource->start < bo->resource->num_pages &&
+	    bo->resource->start < PFN_UP(bo->resource->size) &&
 	    bo->resource->start > 0 &&
 	    buf->base.pin_count == 0) {
 		ctx.interruptible = false;
@@ -352,7 +352,7 @@ void *vmw_bo_map_and_cache(struct vmw_buffer_object *vbo)
 	if (virtual)
 		return virtual;
 
-	ret = ttm_bo_kmap(bo, 0, bo->resource->num_pages, &vbo->map);
+	ret = ttm_bo_kmap(bo, 0, PFN_UP(bo->resource->size), &vbo->map);
 	if (ret)
 		DRM_ERROR("Buffer object map failed: %d.\n", ret);
 
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
index 79b30dc9d825..c5ed49241f9d 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
@@ -427,7 +427,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
 	 * Do a page by page copy of COTables. This eliminates slow vmap()s.
 	 * This should really be a TTM utility.
 	 */
-	for (i = 0; i < old_bo->resource->num_pages; ++i) {
+	for (i = 0; i < PFN_UP(old_bo->resource->size); ++i) {
 		bool dummy;
 
 		ret = ttm_bo_kmap(old_bo, i, 1, &old_map);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
index f085dbd4736d..2fb53aa57a56 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
@@ -1047,7 +1047,7 @@ static int vmw_query_bo_switch_prepare(struct vmw_private *dev_priv,
 
 	if (unlikely(new_query_bo != sw_context->cur_query_bo)) {
 
-		if (unlikely(new_query_bo->base.resource->num_pages > 4)) {
+		if (unlikely(PFN_UP(new_query_bo->base.resource->size) > 4)) {
 			VMW_DEBUG_USER("Query buffer too large.\n");
 			return -EINVAL;
 		}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
index 60e3cc537f36..abd5e3323ebf 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
@@ -71,7 +71,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 	spin_lock(&gman->lock);
 
 	if (gman->max_gmr_pages > 0) {
-		gman->used_gmr_pages += (*res)->num_pages;
+		gman->used_gmr_pages += PFN_UP((*res)->size);
 		/*
 		 * Because the graphics memory is a soft limit we can try to
 		 * expand it instead of letting the userspace apps crash.
@@ -114,7 +114,7 @@ static int vmw_gmrid_man_get_node(struct ttm_resource_manager *man,
 	return 0;
 
 nospace:
-	gman->used_gmr_pages -= (*res)->num_pages;
+	gman->used_gmr_pages -= PFN_UP((*res)->size);
 	spin_unlock(&gman->lock);
 	ida_free(&gman->gmr_ida, id);
 	ttm_resource_fini(man, *res);
@@ -129,7 +129,7 @@ static void vmw_gmrid_man_put_node(struct ttm_resource_manager *man,
 
 	ida_free(&gman->gmr_ida, res->start);
 	spin_lock(&gman->lock);
-	gman->used_gmr_pages -= res->num_pages;
+	gman->used_gmr_pages -= PFN_UP(res->size);
 	spin_unlock(&gman->lock);
 	ttm_resource_fini(man, res);
 	kfree(res);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 214829c32ed8..46c2642b3ec5 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -587,7 +587,7 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
 
 			cm_bo = vcp->cursor_mob[cursor_mob_idx];
 
-			if (cm_bo->resource->num_pages * PAGE_SIZE < size) {
+			if (cm_bo->resource->size < size) {
 				ret = -EINVAL;
 				goto error_bo_unmap;
 			}
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
index 7bc99b1279f7..f41f041559f4 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
@@ -230,7 +230,7 @@ void vmw_bo_dirty_unmap(struct vmw_buffer_object *vbo,
 int vmw_bo_dirty_add(struct vmw_buffer_object *vbo)
 {
 	struct vmw_bo_dirty *dirty = vbo->dirty;
-	pgoff_t num_pages = vbo->base.resource->num_pages;
+	pgoff_t num_pages = PFN_UP(vbo->base.resource->size);
 	size_t size;
 	int ret;
 
@@ -395,7 +395,7 @@ vm_fault_t vmw_bo_vm_mkwrite(struct vm_fault *vmf)
 		return ret;
 
 	page_offset = vmf->pgoff - drm_vma_node_start(&bo->base.vma_node);
-	if (unlikely(page_offset >= bo->resource->num_pages)) {
+	if (unlikely(page_offset >= PFN_UP(bo->resource->size))) {
 		ret = VM_FAULT_SIGBUS;
 		goto out_unlock;
 	}
@@ -438,7 +438,7 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
 
 		page_offset = vmf->pgoff -
 			drm_vma_node_start(&bo->base.vma_node);
-		if (page_offset >= bo->resource->num_pages ||
+		if (page_offset >= PFN_UP(bo->resource->size) ||
 		    vmw_resources_clean(vbo, page_offset,
 					page_offset + PAGE_SIZE,
 					&allowed_prefault)) {
-- 
2.32.0

