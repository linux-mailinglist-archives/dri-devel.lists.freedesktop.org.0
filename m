Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC589E593C
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 16:03:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1229410EEB6;
	Thu,  5 Dec 2024 15:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="L2puFw7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B416110EEB5;
 Thu,  5 Dec 2024 15:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733410993; x=1764946993;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DsikNBXCdIZVTSilpDpoAhdCiGGe96pPxGezOXGgMVc=;
 b=L2puFw7nGjCLnX7FcVRxUxlgM3rQsUGIAtRtaRVWwQH34cVYx6QpZw1L
 7YtO5OKmiiVqSEEJY+0kuXQngaiCZ2fvrB1mVUBAyEdh7INtw6aJdZ5TB
 HZoTnVGB6TV51s9CtbaAFV4B8aLAtuvhnMoQTO6367IKIDbA/iOd3nsmD
 P83fQXlqABoALdaWWXVKeQVM/1RX/R72Op7RlvCso7qZYZEYffuVymxIh
 a31COqJineFR+cEfBO12/5nTuyf7rcZt32e0ZAS+wg+jpl4sbJZtUBSua
 8Hng5yzBGiMvfE10fOcMJtpYbXUtLpfZhs/WEmr6Xo04K1kCXDigShuSD Q==;
X-CSE-ConnectionGUID: w3E1osdvSFiRgTxpyTVyZQ==
X-CSE-MsgGUID: XGWnCY5JSn6DzlzLKhdpKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51142022"
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="51142022"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:03:13 -0800
X-CSE-ConnectionGUID: Bm3q89BjTy6NKii8yXc0lg==
X-CSE-MsgGUID: 2GBOgD3XRXCtATKithSe5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,210,1728975600"; d="scan'208";a="93983008"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2024 07:03:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2 1/3] drm/bridge: dw-hdmi-i2s: annotate hdmi_read() with
 __maybe_unused
Date: Thu,  5 Dec 2024 17:02:59 +0200
Message-Id: <ea9624c7519951c9858b014d71b6f0ea77695c14.1733410889.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733410889.git.jani.nikula@intel.com>
References: <cover.1733410889.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Building with clang and and W=1 leads to warning about unused
hdmi_read(). Fix by annotating it with __maybe_unused.

See also commit 6863f5643dd7 ("kbuild: allow Clang to find unused static
inline functions for W=1 build").

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
index 26c187d20d97..4377f9d89a82 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-i2s-audio.c
@@ -27,7 +27,7 @@ static inline void hdmi_write(struct dw_hdmi_i2s_audio_data *audio,
 	audio->write(hdmi, val, offset);
 }
 
-static inline u8 hdmi_read(struct dw_hdmi_i2s_audio_data *audio, int offset)
+static inline __maybe_unused u8 hdmi_read(struct dw_hdmi_i2s_audio_data *audio, int offset)
 {
 	struct dw_hdmi *hdmi = audio->hdmi;
 
-- 
2.39.5

