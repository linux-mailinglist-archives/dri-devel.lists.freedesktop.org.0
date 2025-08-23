Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D08CEB32B46
	for <lists+dri-devel@lfdr.de>; Sat, 23 Aug 2025 19:26:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FBF310E064;
	Sat, 23 Aug 2025 17:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TTC5pZJD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB8810E064;
 Sat, 23 Aug 2025 17:26:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B538A60052;
 Sat, 23 Aug 2025 17:26:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18379C4CEE7;
 Sat, 23 Aug 2025 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1755969967;
 bh=e1kmgWmlUGhFZL70rqdb+2JREf9OJYL5d+iZpZNb2vM=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=TTC5pZJDI26xgoHqxvRFFbFXr07KuV9XbPSJOEjVwjNSW30us2VRp9O5SrEWZHMoi
 s0rFQRZOpOtkqP9FG5aktzfttBIUgG9pUYWX21CQcpU2H8Fw5MSOOOvAAUiLlMKujv
 AAw7U2ywyFcDuiPPpemwooPTjV57NIFe1odfkhEwrByJUEjpHbQnp8OlrNiRjk6mO4
 /diXdENdBLJO74+WDlNEfVIh1xe+TZ9jGkXMzvCI0gM4OxVMo0cxBmMqhpUz4+HCFi
 fNkpGAx42uBODdAfQ2PqagdEQzoaigSzwJZGZWr+Y2QR7j1GrXSXrgnLPOcyAKRCq2
 Fh86NMGaz9cfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 03EBCCA0FE1;
 Sat, 23 Aug 2025 17:26:07 +0000 (UTC)
From: Aaron Kling via B4 Relay <devnull+webgeek1234.gmail.com@kernel.org>
Date: Sat, 23 Aug 2025 12:26:05 -0500
Subject: [PATCH v2] drm/nouveau: Support reclocking on gp10b
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250823-gp10b-reclock-v2-1-90a1974a54e3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAKz5qWgC/3XMSw6DIBSF4a2YOy4NjyCmo+7DOEB6wZuqGGhMG
 8PeS513+J/kfAdkTIQZbs0BCXfKFNca8tKAm+wakNGjNkguNe+kZGETfGQJ3RzdkxkzetVyrm3
 XQv1sCT29T68fak+UXzF9Tn4Xv/WftAsmmB65QuuVUdrew2Jpvrq4wFBK+QKjMOw3qgAAAA==
X-Change-ID: 20250822-gp10b-reclock-77bf36005a86
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 nouveau@lists.freedesktop.org, Aaron Kling <webgeek1234@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755969966; l=7837;
 i=webgeek1234@gmail.com; s=20250217; h=from:subject:message-id;
 bh=ORTgFAySW5YP39GAofc6irg3iux8MdjoBE9G2yJqggw=;
 b=p1rdWeJJgvZVq/cL66hpKKp/8N8spJmWxoJfDY06sn3iyJ/s5z8109b7Et7gJSudb5u8AuuFX
 pD+rjAfUN6DAhH8J+sTPV1mJudOyNbcHwttPfaJxPHKH9Z1YRAT1tP3
X-Developer-Key: i=webgeek1234@gmail.com; a=ed25519;
 pk=TQwd6q26txw7bkK7B8qtI/kcAohZc7bHHGSD7domdrU=
X-Endpoint-Received: by B4 Relay for webgeek1234@gmail.com/20250217 with
 auth_id=342
X-Original-From: Aaron Kling <webgeek1234@gmail.com>
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
Reply-To: webgeek1234@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Aaron Kling <webgeek1234@gmail.com>

Starting with Tegra186, gpu clock handling is done by the bpmp and there
is little to be done by the kernel. The only thing necessary for
reclocking is to set the gpcclk to the desired rate and the bpmp handles
the rest. The pstate list is based on the downstream driver generates.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
---
Changes in v2:
- Fix missing static as reported by kernel ci
- Link to v1: https://lore.kernel.org/r/20250822-gp10b-reclock-v1-1-5b03eaf3735a@gmail.com
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h |   1 +
 drivers/gpu/drm/nouveau/nvkm/engine/device/base.c |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild    |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c   | 180 ++++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h   |  16 ++
 5 files changed, 199 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h
index d5d8877064a71581d8e9e92f30a3e28551dabf17..6a09d397c651aa94718aff3d1937162df39cc2ae 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/clk.h
@@ -134,4 +134,5 @@ int gf100_clk_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct
 int gk104_clk_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_clk **);
 int gk20a_clk_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_clk **);
 int gm20b_clk_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_clk **);
+int gp10b_clk_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_clk **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 3375a59ebf1a4af73daf4c029605a10a7721c725..2517b65d8faad9947244707f540eb281ad7652e4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -2280,6 +2280,7 @@ nv13b_chipset = {
 	.acr      = { 0x00000001, gp10b_acr_new },
 	.bar      = { 0x00000001, gm20b_bar_new },
 	.bus      = { 0x00000001, gf100_bus_new },
+	.clk      = { 0x00000001, gp10b_clk_new },
 	.fault    = { 0x00000001, gp10b_fault_new },
 	.fb       = { 0x00000001, gp10b_fb_new },
 	.fuse     = { 0x00000001, gm107_fuse_new },
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild
index dcecd499d8dffae3b81276ed67bb8649dfa3efd1..9fe394740f568909de71a8c420cc8b6d8dc2235f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/Kbuild
@@ -10,6 +10,7 @@ nvkm-y += nvkm/subdev/clk/gf100.o
 nvkm-y += nvkm/subdev/clk/gk104.o
 nvkm-y += nvkm/subdev/clk/gk20a.o
 nvkm-y += nvkm/subdev/clk/gm20b.o
+nvkm-y += nvkm/subdev/clk/gp10b.o
 
 nvkm-y += nvkm/subdev/clk/pllnv04.o
 nvkm-y += nvkm/subdev/clk/pllgt215.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c
new file mode 100644
index 0000000000000000000000000000000000000000..a0be53ffeb4479e4c229bd6bde86bb6bdb082b56
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: MIT
+#include <subdev/clk.h>
+#include <subdev/timer.h>
+#include <core/device.h>
+#include <core/tegra.h>
+
+#include "priv.h"
+#include "gk20a.h"
+#include "gp10b.h"
+
+static int
+gp10b_clk_init(struct nvkm_clk *base)
+{
+	struct gp10b_clk *clk = gp10b_clk(base);
+	struct nvkm_subdev *subdev = &clk->base.subdev;
+	int ret;
+
+	/* Start with the highest frequency, matching the BPMP default */
+	base->func->calc(base, &base->func->pstates[base->func->nr_pstates - 1].base);
+	ret = base->func->prog(base);
+	if (ret) {
+		nvkm_error(subdev, "cannot initialize clock\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int
+gp10b_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
+{
+	struct gp10b_clk *clk = gp10b_clk(base);
+	struct nvkm_subdev *subdev = &clk->base.subdev;
+
+	switch (src) {
+	case nv_clk_src_gpc:
+		return clk_get_rate(clk->clk) / GK20A_CLK_GPC_MDIV;
+	default:
+		nvkm_error(subdev, "invalid clock source %d\n", src);
+		return -EINVAL;
+	}
+}
+
+static int
+gp10b_clk_calc(struct nvkm_clk *base, struct nvkm_cstate *cstate)
+{
+	struct gp10b_clk *clk = gp10b_clk(base);
+	u32 target_rate = cstate->domain[nv_clk_src_gpc] * GK20A_CLK_GPC_MDIV;
+
+	clk->new_rate = clk_round_rate(clk->clk, target_rate) / GK20A_CLK_GPC_MDIV;
+
+	return 0;
+}
+
+static int
+gp10b_clk_prog(struct nvkm_clk *base)
+{
+	struct gp10b_clk *clk = gp10b_clk(base);
+	int ret;
+
+	ret = clk_set_rate(clk->clk, clk->new_rate * GK20A_CLK_GPC_MDIV);
+	if (ret < 0)
+		return ret;
+
+	clk->rate = clk_get_rate(clk->clk) / GK20A_CLK_GPC_MDIV;
+
+	return 0;
+}
+
+static struct nvkm_pstate
+gp10b_pstates[] = {
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 114750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 216750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 318750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 420750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 522750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 624750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 726750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 828750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 930750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 1032750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 1134750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 1236750,
+		},
+	},
+	{
+		.base = {
+			.domain[nv_clk_src_gpc] = 1300500,
+		},
+	},
+};
+
+static const struct nvkm_clk_func
+gp10b_clk = {
+	.init = gp10b_clk_init,
+	.read = gp10b_clk_read,
+	.calc = gp10b_clk_calc,
+	.prog = gp10b_clk_prog,
+	.tidy = gk20a_clk_tidy,
+	.pstates = gp10b_pstates,
+	.nr_pstates = ARRAY_SIZE(gp10b_pstates),
+	.domains = {
+		{ nv_clk_src_gpc, 0xff, 0, "core", GK20A_CLK_GPC_MDIV },
+		{ nv_clk_src_max }
+	}
+};
+
+int
+gp10b_clk_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
+	      struct nvkm_clk **pclk)
+{
+	struct nvkm_device_tegra *tdev = device->func->tegra(device);
+	const struct nvkm_clk_func *func = &gp10b_clk;
+	struct gp10b_clk *clk;
+	int ret, i;
+
+	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return -ENOMEM;
+	*pclk = &clk->base;
+	clk->clk = tdev->clk;
+
+	/* Finish initializing the pstates */
+	for (i = 0; i < func->nr_pstates; i++) {
+		INIT_LIST_HEAD(&func->pstates[i].list);
+		func->pstates[i].pstate = i + 1;
+	}
+
+	ret = nvkm_clk_ctor(func, device, type, inst, true, &clk->base);
+	if (ret)
+		return ret;
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h
new file mode 100644
index 0000000000000000000000000000000000000000..2f65a921a426e3f6339a31e964397f6eefa50250
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/gp10b.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_CLK_GP10B_H__
+#define __NVKM_CLK_GP10B_H__
+
+struct gp10b_clk {
+	/* currently applied parameters */
+	struct nvkm_clk base;
+	struct clk *clk;
+	u32 rate;
+
+	/* new parameters to apply */
+	u32 new_rate;
+};
+#define gp10b_clk(p) container_of((p), struct gp10b_clk, base)
+
+#endif

---
base-commit: c17b750b3ad9f45f2b6f7e6f7f4679844244f0b9
change-id: 20250822-gp10b-reclock-77bf36005a86

Best regards,
-- 
Aaron Kling <webgeek1234@gmail.com>


