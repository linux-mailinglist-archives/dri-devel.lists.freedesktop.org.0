Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7367D275623
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 12:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1736E971;
	Wed, 23 Sep 2020 10:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771A66E946;
 Wed, 23 Sep 2020 10:22:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3A254B290;
 Wed, 23 Sep 2020 10:22:53 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
 heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com, laurentiu.palcu@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Subject: [PATCH v3 15/22] drm/tegra: Introduce GEM object functions
Date: Wed, 23 Sep 2020 12:21:52 +0200
Message-Id: <20200923102159.24084-16-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923102159.24084-1-tzimmermann@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
MIME-Version: 1.0
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in tegra.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/drm.c | 4 ----
 drivers/gpu/drm/tegra/gem.c | 8 ++++++++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index ba9d1c3e7cac..f0f581cd345e 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -858,12 +858,8 @@ static struct drm_driver tegra_drm_driver = {
 	.debugfs_init = tegra_debugfs_init,
 #endif
 
-	.gem_free_object_unlocked = tegra_bo_free_object,
-	.gem_vm_ops = &tegra_bo_vm_ops,
-
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = tegra_gem_prime_export,
 	.gem_prime_import = tegra_gem_prime_import,
 
 	.dumb_create = tegra_bo_dumb_create,
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index a2bac20ff19d..794ec2456934 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -230,6 +230,12 @@ static int tegra_bo_iommu_unmap(struct tegra_drm *tegra, struct tegra_bo *bo)
 	return 0;
 }
 
+static const struct drm_gem_object_funcs tegra_gem_object_funcs = {
+	.free = tegra_bo_free_object,
+	.export = tegra_gem_prime_export,
+	.vm_ops = &tegra_bo_vm_ops,
+};
+
 static struct tegra_bo *tegra_bo_alloc_object(struct drm_device *drm,
 					      size_t size)
 {
@@ -240,6 +246,8 @@ static struct tegra_bo *tegra_bo_alloc_object(struct drm_device *drm,
 	if (!bo)
 		return ERR_PTR(-ENOMEM);
 
+	bo->gem.funcs = &tegra_gem_object_funcs;
+
 	host1x_bo_init(&bo->base, &tegra_bo_ops);
 	size = round_up(size, PAGE_SIZE);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
