Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02757A9D13
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 21:28:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A0BC10E5EF;
	Thu, 21 Sep 2023 19:28:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0307510E5EC
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 19:28:15 +0000 (UTC)
Received: by mail-pg1-x52c.google.com with SMTP id
 41be03b00d2f7-578af21ff50so953260a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Sep 2023 12:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695324495; x=1695929295;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TaaYKX/WzN2yAJiXuwCzXo10Y+Z2eYCI0rB7JbtaKbk=;
 b=YFxhyTZHuJzCYbtJKMhKmI43jPtDWfqrmT/BKKfX2SUmtdi7RuYkvTm3DJmMt0u46c
 XRDf5vMv66daoCh5wMWKhu7KW7rItja6WRPrTRh5UDxxj+7qTWjPO6od+HIUn04l2wyR
 NiuQxlFUCnDvOqVN5+kxSYQJ6QYEV1l/HZQBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695324495; x=1695929295;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TaaYKX/WzN2yAJiXuwCzXo10Y+Z2eYCI0rB7JbtaKbk=;
 b=DjMCJ4CHWyIAUVNEAwhV2DsTY296rys+JCuiUMtQoLwG9sHkkwfyFheinz+/I+7P6t
 8/BLu7FP2biBU94WrZ4G4q0VPB1vmaR+ZtzULTjetsk4OMn/JAlNdXckroN7CAXBM1k+
 u6AUo/ug+K8hlMCR4Kqzh2/7EO/XZ5FSJnXoIpFbiMrYrFHKpB1Q8EHL4ML1fqLFT95l
 I6/bfnA6232jYvkMJ4BnGdrk55PhVYG8E+EH4gTSfzrR2QJ1nE7vpTRI/V3sKNjC8qtQ
 hwjPyJJZn0oTaaWxXNS7HSQ1Skab90UaPb40mpcM2w1njBjYa/enzV34Gay8FId7+VBg
 E1eA==
X-Gm-Message-State: AOJu0YziEWzq2Z+OHDqUKqEzai/LX5CfCr8nJGb/nM8Ypjt11DAMqJnJ
 yDxlhzjGqYkLMLsS72KmWOTNdlcMphKBC4V0Rrhr4EJE
X-Google-Smtp-Source: AGHT+IEMW+st7pK1ERCOwxwoalcSvIpW84hrr+4hW9zDszK+PkTuQiJ5+HlDQX/MBJ7tT52BBQ4d4g==
X-Received: by 2002:a05:6a21:4985:b0:151:991c:84b6 with SMTP id
 ax5-20020a056a21498500b00151991c84b6mr6676548pzc.59.1695324494675; 
 Thu, 21 Sep 2023 12:28:14 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:e6ed:6d49:f262:8041])
 by smtp.gmail.com with ESMTPSA id
 w8-20020a1709029a8800b001b9f032bb3dsm1892875plp.3.2023.09.21.12.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Sep 2023 12:28:13 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH v2 00/12] drm: call drm_atomic_helper_shutdown() at the
 right times
Date: Thu, 21 Sep 2023 12:26:43 -0700
Message-ID: <20230921192749.1542462-1-dianders@chromium.org>
X-Mailer: git-send-email 2.42.0.515.g380fc7ccd1-goog
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
 linux-tegra@vger.kernel.org, mdaenzer@redhat.com, thierry.reding@gmail.com,
 laurent.pinchart@ideasonboard.com, alim.akhtar@samsung.com,
 anitha.chrisanthus@intel.com, srinivasan.shanmugam@amd.com,
 steven.price@arm.com, mario.limonciello@amd.com,
 linux-samsung-soc@vger.kernel.org, kherbst@redhat.com, abrodkin@synopsys.com,
 kyungmin.park@samsung.com, amd-gfx@lists.freedesktop.org, jonathanh@nvidia.com,
 matthias.bgg@gmail.com, bskeggs@redhat.com, sam@ravnborg.org,
 orsonzhai@gmail.com, linux-imx@nxp.com, chunkuang.hu@kernel.org,
 lijo.lazar@amd.com, kernel@pengutronix.de, mperttunen@nvidia.com,
 Bokun.Zhang@amd.com, Sascha Hauer <s.hauer@pengutronix.de>,
 shiwu.zhang@amd.com, le.ma@amd.com, linux-mediatek@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, laurentiu.palcu@oss.nxp.com,
 biju.das.jz@bp.renesas.com, James.Zhu@amd.com,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com,
 tzimmermann@suse.de, felix.kuehling@amd.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, Douglas Anderson <dianders@chromium.org>,
 linux-renesas-soc@vger.kernel.org, krzysztof.kozlowski@linaro.org,
 kieran.bingham+renesas@ideasonboard.com, zhang.lyra@gmail.com,
 alexander.deucher@amd.com, shawnguo@kernel.org, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


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

I've labeled this patch series as RFT (request for testing) to help
call attention to the fact that I didn't personally test any of these
patches.

I'd like to call out a few drivers that I _didn't_ fix in this series
and why. If any of these drivers should be fixed then please yell.
- DRM drivers backed by usb_driver (like gud, gm12u320, udl): I didn't
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

NOTE: I landed everything I could from v1 of the patch series [2] [3]
to drm-misc. This v2 is everyone that is still left. If you'd like me
to land one of the patches here to drm-misc for you, please say
so. Otherwise I will assume maintainers will pick patches for their
particular driver and land them. There are no dependencies.

[1] https://lore.kernel.org/lkml/20230804140605.RFC.4.I930069a32baab6faf46d6b234f89613b5cec0f14@changeid
[2] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org

Changes in v2:
- Rebased and resolved conflicts.

Douglas Anderson (12):
  drm/imx/dcss: Call drm_atomic_helper_shutdown() at shutdown time
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
  drm/radeon: Call drm_helper_force_disable_all() at shutdown/remove
    time
  drm/renesas/shmobile: Call drm_helper_force_disable_all() at
    shutdown/remove time

 drivers/gpu/drm/amd/amdgpu/amdgpu.h              |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 10 ++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c          |  2 ++
 drivers/gpu/drm/exynos/exynos_drm_drv.c          | 11 +++++++++++
 drivers/gpu/drm/gma500/psb_drv.c                 |  8 ++++++++
 drivers/gpu/drm/imx/dcss/dcss-drv.c              |  8 ++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c              |  7 +++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.h              |  1 +
 drivers/gpu/drm/kmb/kmb_drv.c                    |  6 ++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c           |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_display.c        |  9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_display.h        |  1 +
 drivers/gpu/drm/nouveau/nouveau_drm.c            | 13 +++++++++++++
 drivers/gpu/drm/nouveau/nouveau_drv.h            |  1 +
 drivers/gpu/drm/nouveau/nouveau_platform.c       |  6 ++++++
 drivers/gpu/drm/radeon/radeon_drv.c              |  7 ++++++-
 drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c | 10 ++++++++++
 drivers/gpu/drm/sprd/sprd_drm.c                  |  4 +++-
 drivers/gpu/drm/tegra/drm.c                      |  6 ++++++
 drivers/gpu/drm/tiny/arcpgu.c                    |  6 ++++++
 20 files changed, 124 insertions(+), 2 deletions(-)

-- 
2.42.0.515.g380fc7ccd1-goog

