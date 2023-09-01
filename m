Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D62D790422
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E42110E7FC;
	Fri,  1 Sep 2023 23:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE8110E7F4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:26 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-68a3e271491so1916371b3a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611745; x=1694216545;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=B9XoCDC9hhqnTfSWxv39xNaYsVGjr9sqIdwDF3cygwY=;
 b=c2zxao8XwitATPGJUuKH7q6uBRHXh0k54mGys26f4x2as5+yAIeHm28T7YQlRnBJxN
 ba7ks5BaBiqQV4AUN5YokkJIsth2CETpsbhx3Ir1WQQgFKwqYPedw7gmZrVld+DYVBFm
 WUluSb21I6HsGgywWZlBqXISdjzdbmhPONBGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611745; x=1694216545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B9XoCDC9hhqnTfSWxv39xNaYsVGjr9sqIdwDF3cygwY=;
 b=iPFFXI0P34/n5MLv00pBCA3VGceApDVE0GPY/Z3RqFDte7JbAcxV/BDvYU+RHZ7q/b
 fk+fZULe2SRFr2NcZzY8mCoj3CDl2+LJxMY6OkdNHe8DyN82XstltqM4gX/GfHU+Qlbq
 rKFJlfKx7wbAa/l/BwYcEoEKj69u1DxLQv2FzGN/OI0sUTfY5rGFtD0pSeeHQQG6g+tc
 L6m1kJ099OQiOOPvqERmqD8LLNXyax0UwPdEF6VEygp8jvvYzXF8F/8CdJq3A+4h5uMY
 tYg9H51hldeMD9zwM9m4WQ7huvm6RFtNlxsFd0nAHOlh3KPuHjjYV1LSj0ZhYedpHYGx
 rGkA==
X-Gm-Message-State: AOJu0YwM62CZo6ssN0hQRWH/9pDjD6TyA84iOcnAgbMB38+j5mYY0sUQ
 RVbZYiUhZejhZjHRibv0qQHXOoiMt/mZ8Srw9Km2de3/
X-Google-Smtp-Source: AGHT+IF3gOcPwfPrD/s0fytOUG/vRSOI4D+jnCuIcvxglrqeHeLMaTT6rOOv/A4qBfa/r+8zKOWj4g==
X-Received: by 2002:a05:6a00:1916:b0:68b:fb93:5b4e with SMTP id
 y22-20020a056a00191600b0068bfb935b4emr4542619pfi.26.1693611745505; 
 Fri, 01 Sep 2023 16:42:25 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:24 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 00/15] drm: non-drm-misc drivers call
 drm_atomic_helper_shutdown() at the right times
Date: Fri,  1 Sep 2023 16:41:11 -0700
Message-ID: <20230901234202.566951-1-dianders@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
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
Cc: geert+renesas@glider.be, nouveau@lists.freedesktop.org, Victor.Zhao@amd.com,
 edmund.j.dea@intel.com, linux-kernel@vger.kernel.org, paul@crapouillou.net,
 linux-tegra@vger.kernel.org, mdaenzer@redhat.com, YiPeng.Chai@amd.com,
 laurent.pinchart@ideasonboard.com, alim.akhtar@samsung.com,
 anitha.chrisanthus@intel.com, linux@armlinux.org.uk, steven.price@arm.com,
 mario.limonciello@amd.com, linux-samsung-soc@vger.kernel.org, rfoss@kernel.org,
 kherbst@redhat.com, abrodkin@synopsys.com, kyungmin.park@samsung.com,
 amd-gfx@lists.freedesktop.org, jonathanh@nvidia.com, matthias.bgg@gmail.com,
 bskeggs@redhat.com, sam@ravnborg.org, srinivasan.shanmugam@amd.com,
 orsonzhai@gmail.com, liviu.dudau@arm.com, linux-mips@vger.kernel.org,
 linux-imx@nxp.com, chunkuang.hu@kernel.org, lijo.lazar@amd.com,
 kernel@pengutronix.de, mperttunen@nvidia.com, Bokun.Zhang@amd.com,
 Sascha Hauer <s.hauer@pengutronix.de>, shiwu.zhang@amd.com, le.ma@amd.com,
 linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, laurentiu.palcu@oss.nxp.com,
 biju.das.jz@bp.renesas.com, James.Zhu@amd.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 tzimmermann@suse.de, Xinhui.Pan@amd.com, sw0312.kim@samsung.com,
 Douglas Anderson <dianders@chromium.org>, linux-renesas-soc@vger.kernel.org,
 krzysztof.kozlowski@linaro.org, kieran.bingham+renesas@ideasonboard.com,
 zhang.lyra@gmail.com, alexander.deucher@amd.com, thierry.reding@gmail.com,
 shawnguo@kernel.org, christian.koenig@amd.com, Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


NOTE: in order to avoid email sending limits on the cover letter, I've
split this patch series in two. Patches that target drm-misc and ones
that don't. The cover letter of the two is identical other than this note.

This patch series came about after a _long_ discussion between me and
Maxime Ripard in response to a different patch I sent out [1]. As part
of that discussion, we realized that it would be good if DRM drivers
consistently called drm_atomic_helper_shutdown() properly at shutdown
and driver remove time as it's documented that they should do. The
eventual goal of this would be to enable removing some hacky code from
panel drivers where they had to hook into shutdown themselves because
the DRM driver wasn't calling them.

It turns out that quite a lot of drivers seemed to be missing
drm_atomic_helper_shutdown() in one or both places that it was
supposed to be. This patch series attempts to fix all the drivers that
I was able to identify.

NOTE: fixing this wasn't exactly cookie cutter. Each driver has its
own unique way of setting itself up and tearing itself down. Some
drivers also use the component model, which adds extra fun. I've made
my best guess at solving this and I've run a bunch of compile tests
(specifically, allmodconfig for amd64, arm64, and powerpc). That being
said, these code changes are not totally trivial and I've done zero
real testing on them. Making these patches was also a little mind
numbing and I'm certain my eyes glazed over at several points when
writing them. What I'm trying to say is to please double-check that I
didn't do anything too silly, like cast your driver's drvdata to the
wrong type. Even better, test these patches!

I've organized this series like this:
1. One patch for all simple cases of just needing a call at shutdown
   time for drivers that go through drm-misc.
2. A separate patch for "drm/vc4", even though it goes through
   drm-misc, since I wanted to leave an extra note for that one.
3. Patches for drivers that just needed a call at shutdown time for
   drivers that _don't_ go through drm-misc.
4. Patches for the few drivers that had the call at shutdown time but
   lacked it at remove time.
5. One patch for all simple cases of needing a call at shutdown and
   remove (or unbind) time for drivers that go through drm-misc.
6. A separate patch for "drm/hisilicon/kirin", even though it goes
   through drm-misc, since I wanted to leave an extra note for that
   one.
7. Patches for drivers that needed a call at shutdown and remove (or
   unbind) time for drivers that _don't_ go through drm-misc.

I've labeled this patch series as RFT (request for testing) to help
call attention to the fact that I didn't personally test any of these
patches.

If you're a maintainer of one of these drivers and you think that the
patch for your driver looks fabulous, you've tested it, and you'd like
to land it right away then please do. For non-drm-misc drivers there
are no dependencies here. Some of the drm-misc drivers depend on the
first patch, AKA ("drm/atomic-helper: drm_atomic_helper_shutdown(NULL)
should be a noop"). I've tried to call this out but it also should be
obvious once you know to look for it.

I'd like to call out a few drivers that I _didn't_ fix in this series
and why. If any of these drivers should be fixed then please yell.
- DRM driers backed by usb_driver (like gud, gm12u320, udl): I didn't
  add the call to drm_atomic_helper_shutdown() at shutdown time
  because there's no ".shutdown" callback for them USB drivers. Given
  that USB is hotpluggable, I'm assuming that they are robust against
  this and the special shutdown callback isn't needed.
- ofdrm and simpledrm: These didn't have drm_atomic_helper_shutdown()
  in either shutdown or remove, but I didn't add it. I think that's OK
  since they're sorta special and not really directly controlling
  hardware power sequencing.
- virtio, vkms, vmwgfx, xen: I believe these are all virtual (thus
  they wouldn't directly drive a panel) and adding the shutdown
  didn't look straightforward, so I skipped them.

I've let each patch in the series get CCed straight from
get_maintainer. That means not everyone will have received every patch
but everyone should be on the cover letter. I know some people dislike
this but when touching this many drivers there's not much
choice. dri-devel and lkml have been CCed and lore/lei exist, so
hopefully that's enough for folks. I'm happy to add people to the
whole series for future posts.

[1] https://lore.kernel.org/lkml/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid


Douglas Anderson (15):
  drm/armada: Call drm_atomic_helper_shutdown() at shutdown time
  drm/imx/dcss: Call drm_atomic_helper_shutdown() at shutdown time
  drm/ingenic: Call drm_atomic_helper_shutdown() at shutdown time
  drm/kmb: Call drm_atomic_helper_shutdown() at shutdown time
  drm/mediatek: Call drm_atomic_helper_shutdown() at shutdown time
  drm/nouveau: Call drm_atomic_helper_shutdown() or equiv at shutdown
    time
  drm/tegra: Call drm_atomic_helper_shutdown() at shutdown time
  drm/arcpgu: Call drm_atomic_helper_shutdown() at shutdown time
  drm/amdgpu: Call drm_atomic_helper_shutdown() at shutdown time
  drm/sprd: Call drm_atomic_helper_shutdown() at remove time
  drm/exynos: Call drm_atomic_helper_shutdown() at shutdown/unbind time
  drm/gma500: Call drm_helper_force_disable_all() at shutdown/remove
    time
  drm/imx/ipuv3: Call drm_atomic_helper_shutdown() at shutdown/unbind
    time
  drm/radeon: Call drm_helper_force_disable_all() at shutdown/remove
    time
  drm/renesas/shmobile: Call drm_helper_force_disable_all() at
    shutdown/remove time

 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    | 10 +++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  2 +
 drivers/gpu/drm/armada/armada_drv.c           |  8 +++
 drivers/gpu/drm/exynos/exynos_drm_drv.c       | 11 ++++
 drivers/gpu/drm/gma500/psb_drv.c              |  8 +++
 drivers/gpu/drm/imx/dcss/dcss-drv.c           |  8 +++
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  7 ++
 drivers/gpu/drm/imx/dcss/dcss-kms.h           |  1 +
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      | 11 ++++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     | 66 ++++++++++++-------
 drivers/gpu/drm/kmb/kmb_drv.c                 |  6 ++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  9 +++
 drivers/gpu/drm/nouveau/nouveau_display.c     |  9 +++
 drivers/gpu/drm/nouveau/nouveau_display.h     |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c         | 13 ++++
 drivers/gpu/drm/nouveau/nouveau_drv.h         |  1 +
 drivers/gpu/drm/nouveau/nouveau_platform.c    |  6 ++
 drivers/gpu/drm/radeon/radeon_drv.c           |  7 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 10 +++
 drivers/gpu/drm/sprd/sprd_drm.c               |  4 +-
 drivers/gpu/drm/tegra/drm.c                   |  6 ++
 drivers/gpu/drm/tiny/arcpgu.c                 |  6 ++
 23 files changed, 187 insertions(+), 24 deletions(-)

-- 
2.42.0.283.g2d96d420d3-goog

