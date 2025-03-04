Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C05A4EF08
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 22:06:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1773B10E6B5;
	Tue,  4 Mar 2025 21:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eKVimhi/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B718896EC
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Mar 2025 21:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741122361;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6KWLJdJ5fiIb930pUJLqgFqnld1vEloL0BCIsYX5tKU=;
 b=eKVimhi/4eGOhdH4VSlGPFw5W8DJcAiuW9N84zGy4cxDgfdai8A0F/gJ8lXZyO/WJB8pPO
 tUa/4DqAD0End6mElm3a4U6dC6tsSXTYkwAhqM/Et0sYbK1Dx4FGKyiWeQzc453wkxpupq
 NO8p+aPupM+Lj7baFklDJ8dh5DbqQzk=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-104-8p-Y_gSbPemwfxF2TVQ7pw-1; Tue,
 04 Mar 2025 16:05:56 -0500
X-MC-Unique: 8p-Y_gSbPemwfxF2TVQ7pw-1
X-Mimecast-MFC-AGG-ID: 8p-Y_gSbPemwfxF2TVQ7pw_1741122350
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 20205196E078; Tue,  4 Mar 2025 21:05:49 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.107])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 863E5180035F; Tue,  4 Mar 2025 21:05:40 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Subject: [PATCH v5 0/7] drm: Move to using devm_platform_ioremap_resource
Date: Tue, 04 Mar 2025 16:05:30 -0500
Message-Id: <20250304-mem-fixes-v1-0-fb3dab8d901f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABprx2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDYwMT3dzUXN20zIrUYl1jk5Q0c8MUQ4skSwsloPqColSwBFB5tFKZqVJ
 sbS0AVVYK2l8AAAA=
X-Change-ID: 20250304-mem-fixes-34df71d18b98
To: Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>, 
 Xinwei Kong <kong.kongxinwei@hisilicon.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>, 
 Marek Vasut <marex@denx.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-doc@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741122340; l=4017;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=tTzktltTbp+f/YuZQWlOZqnNOLQ0oDxFl3zFfOzmDuE=;
 b=tLxkFhbjw7T7MpPQYdS80+nQqIVDddH0gSbIMbiohOArqEncZj1ftcdpm/JGZ6GFdJ1dhbNll
 zZTUamGjMv5C/C0Xon0mjVY0BqUtVSB/5VCcFwcg+kMfQBGgVc0MkWq
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

Start replacing the below occurences with the newer API:
- (devm_)platform_get_resource + devm_ioremap_resource
- (devm_)platform_get_resource + (devm_)ioremap
- platform_get_resource_byname + devm_ioremap
Move all these occurences to uses devm_platform_ioremap_resource
instead.

This is v5 of the series.

Changes in v5:
- Some patches already merged, leave them out.
- Handle return properly. The new API returns a error pointers
and not NULL. While this is taken care of in most drivers in
the series, the sprd and sti needed changes. Thanks to Dan
for pointing this out with his fix:
https://lore.kernel.org/dri-devel/a952e2b4-d4b8-49ac-abd9-9967c50f4a80@stanley.mountain/

Changes in v4:
- Address vc4 driver compilation error

Changes in v3:
- Keep the old snippet of documentation and add further
clarification (Thomas)
- change in vc4 driver for the a resource is not needed.
Add a comment to clarify why that is left behind (Maxime)

Changes in v2:
- Fix compilation errors

Used Coccinelle to make the code changes.Semantic patch:

//First Case
//rule s/platform_get_resource + devm_ioremap_resource/devm_platform_ioremap_resource
@rule_1@
identifier res;
expression ioremap_res;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
-ioremap_res = devm_ioremap_resource(...);
+ioremap_res = devm_platform_ioremap_resource(pdev,0);

//Second case
//rule s/(devm_)platform_get_resource + (devm_)ioremap/devm_platform_ioremap_resource.
@rule_2@
identifier res;
expression ioremap;
identifier pdev;
@@
-struct resource *res;
...
-res = platform_get_resource(pdev,...);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource(pdev,0);

//Third case
//rule s/(devm_)platform_get_resource_byname + (devm_)ioremap/devm_platform_ioremap_resource_byname.
@rule_3@
identifier res;
expression ioremap;
identifier pdev;
constant mem;
expression name;
@@
-struct resource *res;
<+...
-res = platform_get_resource_byname(pdev,mem,name);
<...
-if (!res) {
-...
-}
...>
-ioremap = devm_ioremap(...);
+ioremap = devm_platform_ioremap_resource_byname(pdev,name);
...+>

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Anusha Srivatsa (7):
      drm/fsl-dcu: move to devm_platform_ioremap_resource() usage
      drm/hisilicon: move to devm_platform_ioremap_resource() usage
      drm/mxsfb: move to devm_platform_ioremap_resource() usage
      drm/sprd: move to devm_platform_ioremap_resource() usage
      drm/sti: move to devm_platform_ioremap_resource() usage
      drm/tegra: move to devm_platform_ioremap_resource() usage
      Documentation: Update the todo

 Documentation/gpu/todo.rst                      | 13 +++++++------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c       |  4 +---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c    |  4 +---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c |  4 +---
 drivers/gpu/drm/mxsfb/lcdif_drv.c               |  4 +---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c               |  4 +---
 drivers/gpu/drm/sprd/sprd_dpu.c                 | 13 +++----------
 drivers/gpu/drm/sprd/sprd_dsi.c                 | 13 +++----------
 drivers/gpu/drm/sti/sti_compositor.c            | 14 +++-----------
 drivers/gpu/drm/sti/sti_dvo.c                   | 14 +++-----------
 drivers/gpu/drm/sti/sti_hda.c                   | 13 +++----------
 drivers/gpu/drm/sti/sti_hdmi.c                  | 15 +++------------
 drivers/gpu/drm/sti/sti_hqvdp.c                 | 14 +++-----------
 drivers/gpu/drm/sti/sti_tvout.c                 | 14 +++-----------
 drivers/gpu/drm/sti/sti_vtg.c                   | 14 +++-----------
 drivers/gpu/drm/tegra/dsi.c                     |  4 +---
 16 files changed, 40 insertions(+), 121 deletions(-)
---
base-commit: 0670c2f56e45b3f4541985a9ebe06d04308e43b0
change-id: 20250304-mem-fixes-34df71d18b98

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

