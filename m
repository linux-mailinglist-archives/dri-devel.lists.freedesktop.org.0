Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E77EDAF8A18
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:54:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3BD910E970;
	Fri,  4 Jul 2025 07:54:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ANywNl7u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED81110E96A
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jul 2025 07:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751615657; x=1783151657;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3RwMRyp8fXMT0ekrMhYvr10mmIyqSJ+HSm2qdURO4ps=;
 b=ANywNl7uwpP0P1eRwYiGLBserPZHuwXpw3iaUwh41z5RLB9gMUg64L7P
 vQtHlE7WZ1+WcZkpvveSKMyzD7/HI3LPvFhQ2hrege88yod70W0D8PCBv
 J+gQnopGJ00q4m0XJVSsnAgb0GDXQuWW3WbOr37IhUtjaeCtgzvzyl37z
 d9faa4H0TCQ7jStH74TvOsirm7VjjdDymTDGtWyrONf97VYquMQdNMn51
 ggIQL+Qh8KtLp+0Fv8lIupLCPNytXDiS62Oap9Il6SN6qJTTtq1yRbxrP
 L1t+usIDvD7+CUaun7I7YT3WyhuKU06s5T3ZDSrmjbWMPj6h3Q0BLaytd w==;
X-CSE-ConnectionGUID: VEgnyqhcQ9eZxVGN1aPlHg==
X-CSE-MsgGUID: Pu0C3g+pRGane0zcYLcYRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="76494562"
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="76494562"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:16 -0700
X-CSE-ConnectionGUID: r9sUPqNERrOEdYYEoEP/WQ==
X-CSE-MsgGUID: EDcc4uMETdWK9rdj/PE7rw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,286,1744095600"; d="scan'208";a="158924217"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 svinhufvud.fi.intel.com) ([10.245.244.244])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 00:54:14 -0700
Received: from svinhufvud.lan (localhost [IPv6:::1])
 by svinhufvud.fi.intel.com (Postfix) with ESMTP id 1857244433;
 Fri,  4 Jul 2025 10:54:12 +0300 (EEST)
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 19/80] drm/panfrost: Remove redundant
 pm_runtime_mark_last_busy() calls
Date: Fri,  4 Jul 2025 10:54:11 +0300
Message-Id: <20250704075411.3218059-1-sakari.ailus@linux.intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
References: <20250704075225.3212486-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pm_runtime_put_autosuspend(), pm_runtime_put_sync_autosuspend(),
pm_runtime_autosuspend() and pm_request_autosuspend() now include a call
to pm_runtime_mark_last_busy(). Remove the now-reduntant explicit call to
pm_runtime_mark_last_busy().

Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
---
The cover letter of the set can be found here
<URL:https://lore.kernel.org/linux-pm/20250704075225.3212486-1-sakari.ailus@linux.intel.com>.

In brief, this patch depends on PM runtime patches adding marking the last
busy timestamp in autosuspend related functions. The patches are here, on
rc2:

        git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git \
                pm-runtime-6.17-rc1

 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 563f16bae543..0dd62e8b2fa7 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -203,7 +203,6 @@ static int panfrost_perfcnt_disable_locked(struct panfrost_device *pfdev,
 	panfrost_mmu_as_put(pfdev, perfcnt->mapping->mmu);
 	panfrost_gem_mapping_put(perfcnt->mapping);
 	perfcnt->mapping = NULL;
-	pm_runtime_mark_last_busy(pfdev->dev);
 	pm_runtime_put_autosuspend(pfdev->dev);
 
 	return 0;
@@ -279,7 +278,6 @@ void panfrost_perfcnt_close(struct drm_file *file_priv)
 	if (perfcnt->user == pfile)
 		panfrost_perfcnt_disable_locked(pfdev, file_priv);
 	mutex_unlock(&perfcnt->lock);
-	pm_runtime_mark_last_busy(pfdev->dev);
 	pm_runtime_put_autosuspend(pfdev->dev);
 }
 
-- 
2.39.5

