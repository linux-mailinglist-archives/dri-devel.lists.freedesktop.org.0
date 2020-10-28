Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF38A29E5F3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 09:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEE986E878;
	Thu, 29 Oct 2020 08:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD54B6E0BE;
 Wed, 28 Oct 2020 19:15:36 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f99c3430000>; Wed, 28 Oct 2020 12:15:15 -0700
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 28 Oct
 2020 19:15:31 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.175)
 by HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 28 Oct 2020 19:15:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5MgJIdloNxkhWo+hCpXoNK03GMMp1MLb/0cAJnBBnyidIl+zPsE3MbrCrRTaZYzwKLYh00y+Kx2iu4nfqkTX7L0epVAYUqeaHt6+pwjq0EMoytqfacrMQriE0lqtrHR+woAmWTjg34N3+1v2VJHeDBGkwJ97XijnBgcMAgzzmqxd7g2mWsT5vZd911MeWZjZ962NkfpvceiiBGXvk894uJ3xf1nhwfxRJZc4sHTPyb633uYKo8potRC7j/cM4LlE2r4oLRYg7DBVHKwGx13B4cDDsVWXIAPSKK8MtgmtsgjPFC45oDkYSBfmCrq08TjcXN42oiwILmyGOCu/pQmKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRYQYUBPMBHSusDby/16vgnibx5Nz6OpNdQwJfLF/WY=;
 b=IYFx0nQKYyeX22gjMBu97KheJ/oxtDhS8X9mosb02qaaAYcPtnigPeehbrWacyfN2QozFFr/b8zxvStyUixU4SihRbh8DcpmBNQQXgurAeqrcNbsHfsp0ijkphuRmgLnJLlwA7PHyAfd1fduN+Q71KsTxCiWhAeJ++sg+Au91PCh1xw1sGvuDHPKgiAaIP++5804nyTusG605Ktsy3Lwplqqmh4WhF62k38wkyJ4LL57dd3/vCluU22KBVvI51h20sT6/bNojg3wBlrSVJ6OF0OjgPzzb2Ph4auqXYcW1RYNh9R7/SDWBvhmMyXgPpbUGf2lx2h08avaKS0c438KvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB4388.namprd12.prod.outlook.com (2603:10b6:5:2a9::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18; Wed, 28 Oct
 2020 19:15:28 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::cdbe:f274:ad65:9a78%7]) with mapi id 15.20.3499.027; Wed, 28 Oct 2020
 19:15:28 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>, "Jani
 Nikula" <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, VMware Graphics
 <linux-graphics-maintainer@vmware.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Christoph Hellwig <hch@lst.de>, Roland
 Scheidegger <sroland@vmware.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm: Remove SCATTERLIST_MAX_SEGMENT
Date: Wed, 28 Oct 2020 16:15:26 -0300
Message-ID: <0-v1-44733fccd781+13d-rm_scatterlist_max_jgg@nvidia.com>
X-ClientProxiedBy: MN2PR10CA0014.namprd10.prod.outlook.com
 (2603:10b6:208:120::27) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (156.34.48.30) by
 MN2PR10CA0014.namprd10.prod.outlook.com (2603:10b6:208:120::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.18 via Frontend
 Transport; Wed, 28 Oct 2020 19:15:27 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1kXqus-00Azeq-LU; Wed, 28 Oct 2020 16:15:26 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1603912515; bh=qGGA2I6MzC4WbxPfBkrRlimA53XwpsXQM3WGAGbqdM8=;
 h=ARC-Seal:ARC-Message-Signature:ARC-Authentication-Results:From:To:
 CC:Subject:Date:Message-ID:Content-Transfer-Encoding:Content-Type:
 X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType;
 b=TmhNofmjnTwcxYMbj8olIbd5QPqlkHp8pmcDZILk5PAwS97NLIKTzZwqIdz/FlcMU
 +5isAUWhh0MAXF/VV9nlRQmjhAGRgf7PYmaTSlCvh5PtMngIy6C1Oqu6c/6/IGnw3f
 w0xHzecVikDLS9VFVKHzGBHecqs+MWv6gtWzFEQ6cuo2BuP6E1AvPIUckUfGBwHfDi
 vbCb4tPVtSkWV/7hbDiWweJIE+Wn/ujrvr7WHhX/XPYn1GR0Cl49qX4ItOE3cw7gKq
 I9IGtxuPb338rYyJQ7otV3IegAzpcxbH29UeUd6E4V2MybveKi1narXBMd6vNPYMUX
 kWnSU5Vtx5j5w==
X-Mailman-Approved-At: Thu, 29 Oct 2020 08:12:48 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Hellstrom <thellstrom@vmware.com>, Qian Cai <cai@lca.pw>, Gerd
 Hoffmann <kraxel@redhat.com>, "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since commit 9a40401cfa13 ("lib/scatterlist: Do not limit max_segment to
PAGE_ALIGNED values") the max_segment input to sg_alloc_table_from_pages()
does not have to be any special value. The new algorithm will always
create something less than what the user provides. Thus eliminate this
confusing constant.

- vmwgfx should use the HW capability, not mix in the OS page size for
  calling dma_set_max_seg_size()

- i915 uses i915_sg_segment_size() both for sg_alloc_table_from_pages
  and for some open coded sgl construction. This doesn't change the value
  since rounddown(size, UINT_MAX) == SCATTERLIST_MAX_SEGMENT

- drm_prime_pages_to_sg uses it as a default if max_segment is zero,
  UINT_MAX is fine to use directly.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Thomas Hellstrom <thellstrom@vmware.com>
Cc: Qian Cai <cai@lca.pw>
Cc: "Ursulin, Tvrtko" <tvrtko.ursulin@intel.com>
Suggested-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/drm_prime.c             | 4 ++--
 drivers/gpu/drm/i915/i915_scatterlist.h | 2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 3 +--
 include/linux/scatterlist.h             | 6 ------
 tools/testing/scatterlist/main.c        | 2 +-
 5 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d6808f678db541..c3693e5e8b74b0 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -816,8 +816,8 @@ struct sg_table *drm_prime_pages_to_sg(struct drm_device *dev,
 
 	if (dev)
 		max_segment = dma_max_mapping_size(dev->dev);
-	if (max_segment == 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
-		max_segment = SCATTERLIST_MAX_SEGMENT;
+	if (max_segment == 0)
+		max_segment = UINT_MAX;
 	sge = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
 					  nr_pages << PAGE_SHIFT,
 					  max_segment,
diff --git a/drivers/gpu/drm/i915/i915_scatterlist.h b/drivers/gpu/drm/i915/i915_scatterlist.h
index b7b59328cb76ab..883dd8d09d6bf2 100644
--- a/drivers/gpu/drm/i915/i915_scatterlist.h
+++ b/drivers/gpu/drm/i915/i915_scatterlist.h
@@ -112,7 +112,7 @@ static inline unsigned int i915_sg_segment_size(void)
 	unsigned int size = swiotlb_max_segment();
 
 	if (size == 0)
-		return SCATTERLIST_MAX_SEGMENT;
+		size = UINT_MAX;
 
 	size = rounddown(size, PAGE_SIZE);
 	/* swiotlb_max_segment_size can return 1 byte when it means one page. */
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
index 31e3e5c9f36223..c1817f1a3006e0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
@@ -792,8 +792,7 @@ static int vmw_driver_load(struct drm_device *dev, unsigned long chipset)
 	if (unlikely(ret != 0))
 		goto out_err0;
 
-	dma_set_max_seg_size(dev->dev, min_t(unsigned int, U32_MAX & PAGE_MASK,
-					     SCATTERLIST_MAX_SEGMENT));
+	dma_set_max_seg_size(dev->dev, U32_MAX);
 
 	if (dev_priv->capabilities & SVGA_CAP_GMR2) {
 		DRM_INFO("Max GMR ids is %u\n",
diff --git a/include/linux/scatterlist.h b/include/linux/scatterlist.h
index 36c47e7e66a203..6f70572b2938be 100644
--- a/include/linux/scatterlist.h
+++ b/include/linux/scatterlist.h
@@ -18,12 +18,6 @@ struct scatterlist {
 #endif
 };
 
-/*
- * Since the above length field is an unsigned int, below we define the maximum
- * length in bytes that can be stored in one scatterlist entry.
- */
-#define SCATTERLIST_MAX_SEGMENT (UINT_MAX & PAGE_MASK)
-
 /*
  * These macros should be used after a dma_map_sg call has been done
  * to get bus addresses of each of the SG entries and their lengths.
diff --git a/tools/testing/scatterlist/main.c b/tools/testing/scatterlist/main.c
index b2c7e9f7b8d3dc..d264bf853034bd 100644
--- a/tools/testing/scatterlist/main.c
+++ b/tools/testing/scatterlist/main.c
@@ -50,7 +50,7 @@ static void fail(struct test *test, struct sg_table *st, const char *cond)
 
 int main(void)
 {
-	const unsigned int sgmax = SCATTERLIST_MAX_SEGMENT;
+	const unsigned int sgmax = UINT_MAX;
 	struct test *test, tests[] = {
 		{ -EINVAL, 1, pfn(0), PAGE_SIZE, PAGE_SIZE + 1, 1 },
 		{ -EINVAL, 1, pfn(0), PAGE_SIZE, 0, 1 },
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
