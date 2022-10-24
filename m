Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F0160AF33
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 17:39:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5923D10E87E;
	Mon, 24 Oct 2022 15:39:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23DC10E87E
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:29 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id s24so2786532ljs.11
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4iRQ1ZLI8K+KKo3Mi3lCacL/2gYfLmhjW+eZ+G5VxR0=;
 b=DK03fHAgU4BsXGUew2FzyG3+wVE1aU4jA6ElvQnlho0LEO32GQFcBY4dd/LkCacBJ2
 jPIwbDMb2KnH0lLk1oaf7f2CmWkfUlIO1bnPfDHSgSmzMrI8sNmCR7B37cRbVo3Xb0qW
 Dk4xPSNWnfO6MqLUqU0BwiV5QT7qiki/jvUIMYxU33HgObQCtr5I/qWByuNiyiQf7wyv
 y0jFQqxx37K5dKOOaXLzRfVS5Uk5IOWF7L/jw3uXSTx5iFH2VfQzEKNAZHjY9kmLDE4E
 LaHw9E2HVZl2VkJ5z3LuMkaH3FxatPfoF70MaFt456vIuB3oCBztawgsnK/cu0BcbnSj
 EE8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4iRQ1ZLI8K+KKo3Mi3lCacL/2gYfLmhjW+eZ+G5VxR0=;
 b=KIT6peXKAfanwI6cOQWN7LaDPqNtfUuRi5p/rGtjXmmJuaJQU/2EHlWhqXZ6mPHgEH
 NcrzQirEbDI3oMU/+aR/I6Jh4vFds1dokpK5/MMIuxS8sDji2CWqRwKCrmNTvcHPAkxm
 3MzTXEtpX8fpCDCdndt4PgpCeUA6CxDoZ8cRnYSYvGEYxLaWKWkfBJS5HCWa3EroeCdr
 b/CJd6CFIliKHHl6npRuHYlYWBsfSGa9ASVqBza8KfY3Sv6mycasDJjYG9kMq+IWh+rJ
 +XWvi7eMhzBHZRSQuz6yfcSTQNo1PYuerxynz6AjfUO90pxUVGHomjzmSdZziZpNzjQm
 tojA==
X-Gm-Message-State: ACrzQf2JBszewD+dcFbMlwd6m76QQSULJWPE2amdYAgiExUms5q88DDk
 gvzl7EO9hfwgwM6nLaJgXW/VQg==
X-Google-Smtp-Source: AMsMyM6aZgyFcF24FEeW+Du1bHiLYldBNuRLnhbLGjWtlua2WDhhdBQOeIt39dXfHwX+IO0gs5LU4w==
X-Received: by 2002:a05:651c:169a:b0:277:2ee:5e77 with SMTP id
 bd26-20020a05651c169a00b0027702ee5e77mr4629293ljb.455.1666625968011; 
 Mon, 24 Oct 2022 08:39:28 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Subject: [PATCH v2 0/7] drm/bridge_connector: perform HPD enablement
 automatically
Date: Mon, 24 Oct 2022 18:39:19 +0300
Message-Id: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From all the drivers using drm_bridge_connector only iMX/dcss and OMAP
DRM driver do a proper work of calling
drm_bridge_connector_en/disable_hpd() in right places. Rather than
teaching each and every driver how to properly handle
drm_bridge_connector's HPD, make that automatic.

Add two additional drm_connector helper funcs: enable_hpd() and
disable_hpd(). Make drm_kms_helper_poll_* functions call them (as this
is the time where the drm_bridge_connector's functions are called by the
drivers too).

Changes since v1:
 - Rebased on top of v6.1-rc1
 - Removed the drm_bridge_connector_enable_hpd() from
   drm_bridge_connector_init()
 - Removed extra underscore prefix from
   drm_bridge_connector_en/disable_hpd() helpers

Dmitry Baryshkov (7):
  drm/poll-helper: merge drm_kms_helper_poll_disable() and _fini()
  drm/probe-helper: enable and disable HPD on connectors
  drm/bridge_connector: rely on drm_kms_helper_poll_* for HPD enablement
  drm/imx/dcss: stop using drm_bridge_connector_en/disable_hpd()
  drm/msm/hdmi: stop using drm_bridge_connector_en/disable_hpd()
  drm/omap: stop using drm_bridge_connector_en/disable_hpd()
  drm/bridge_connector: drop drm_bridge_connector_en/disable_hpd()

 drivers/gpu/drm/drm_bridge_connector.c   | 27 +++-------------
 drivers/gpu/drm/drm_probe_helper.c       | 40 ++++++++++++++++++-----
 drivers/gpu/drm/imx/dcss/dcss-dev.c      |  4 ---
 drivers/gpu/drm/imx/dcss/dcss-kms.c      |  2 --
 drivers/gpu/drm/msm/hdmi/hdmi.c          |  2 --
 drivers/gpu/drm/omapdrm/omap_drv.c       | 41 ------------------------
 include/drm/drm_bridge_connector.h       |  2 --
 include/drm/drm_modeset_helper_vtables.h | 22 +++++++++++++
 8 files changed, 59 insertions(+), 81 deletions(-)

-- 
2.35.1

