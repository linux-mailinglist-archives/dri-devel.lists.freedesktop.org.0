Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF2A467367
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 09:43:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E8B6F3D5;
	Fri,  3 Dec 2021 08:43:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7516B72FA8
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 08:43:36 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id r5so2365834pgi.6
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Dec 2021 00:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZE+eyVTlgGs9+AIP2vmWrN/5/319nQUIDXkWbwr6YtE=;
 b=VDbYfoQXRs9UHxCEK9S7OW6FTx6guHxJyZPP8BKTaq0BFlv1ouM9tI/H+QI2QIkmUK
 vgNlj4Ue10IZAYAlk/k49AlI32/okqaqbppNdQK7LogVZRyeh01/lzK3NNuCqwX+eMPD
 rsCM4drqg2NnCzdiVRNfrrH8YCSrmsLck/IT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZE+eyVTlgGs9+AIP2vmWrN/5/319nQUIDXkWbwr6YtE=;
 b=I446TC+3A1VvypTOJiVpju67ig0OqtleaQqfuS6Vo212RduwrJOg4tRGvqYPYSmAxI
 0zZLBc7t6twHAXxbg+kbIdiLVeqj/cSZodfSkG8+IEhwpNgs1rOmMvB3B4NMVIbbvHqe
 8Sb6eDyyfrQn0qCQp9R7JKiVdK/ar6tCEJrgw6s46Dze0ZrXpSw9gJtFhKbdpAP3wrlv
 472Cm6B1mYxXE5BeDlbqzkhBC73pggQyBls8ocPz0/xUDFvGq+kxh7wdcqJhmeGQ3f8o
 s5lDENpDlWS9xATPYBkxN6sdaFyJkw9Fn00oEDQmgrV+biVwRCQLjZu+OLJ17FMBiLaZ
 iUrw==
X-Gm-Message-State: AOAM5316xm6Xt54QBRasPv6yOsmWg+qwsFT/GVbz1NPr3fKDkninqT8/
 3nUIU9uGZg39urbBSFkrF5ISfg==
X-Google-Smtp-Source: ABdhPJwQfA/hRvvynLK4rv8xy6QfeakwaLWnL/8X265xiYrZ7weDjYz9N+w5NMQ2McIaic7OerHAMA==
X-Received: by 2002:a63:2542:: with SMTP id l63mr3502793pgl.431.1638521016128; 
 Fri, 03 Dec 2021 00:43:36 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id g20sm2838048pfj.12.2021.12.03.00.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 00:43:35 -0800 (PST)
From: Kees Cook <keescook@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/dp: Fix off-by-one in register cache size
Date: Fri,  3 Dec 2021 00:43:33 -0800
Message-Id: <20211203084333.3105038-1-keescook@chromium.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; h=from:subject;
 bh=rsrmXkTfjT0xKWn6tW4v+AFF+Qh9FSj0rQAAqFtZsnE=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBhqdi1VB8a7JgU9iVrIiez0JAFg3QRkKnyojAvpfmk
 xGJenGaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCYanYtQAKCRCJcvTf3G3AJqDrD/
 0Q+WlLCtIOelpAxkp8i+3mzggF/AKL3hGb0fhgFfr9eL9oxCO1iQd/QVz2OFadF0kFQnNrCXYxSJs8
 1/B1Bzi03yQGmwxPIuwwbg9ptXI7iFNa+s80WXYT/HVmQ5YhLMiRE/TyY3AQBt9xDgYWpHRD97reQr
 49WW92g7ss6Q4EU6rXL3s3iooH1ZRsg6dueYFAzVgOO8O7YIjMRPKFwhquL9zdU3fjZqzYmKEwLt22
 tkERTbWN82Q6g0k+SVAeLR1iTI4tPwFr3Vy9FzAf+USQA2EAG/v9EQilBmGbRgmjDMXr+4EXqyqTie
 7904y4yhNPlflKyU/Y34LYTBQTddQWL7QjK78RtgwFjtKptCyj+WMnHReEExsZnfGLeiKW/KmN8IhW
 l7ftFOGMzOUiwOQQkdEuveoUoxciBZFbzpwsqoA4uwwMajShbSLtO/c1JP/x+/A/XTHdz3bsussdV1
 ehpcCbWNIN1WZJnX3GHM/K4eUT6ESl1ZWnkex/7KfwKXmwOydgLLuzhVjEYGXWhT30kj7HSIaZp6WI
 Xbk10bTyszsaJunW6tdhjRtB4FjbGYT0Y0KuAbKTHqkihlqeXUv7Ss0zJJ9u5EU/FWY9YKHE6NrLIg
 077Wg3pDM8XyeZ6VIeYvaqhsWd0ceqfxO2gwgpDqf6WJwg/Gm7y1dFUxnofg==
X-Developer-Key: i=keescook@chromium.org; a=openpgp;
 fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Uma Shankar <uma.shankar@intel.com>, linux-hardening@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Ankit Nautiyal <ankit.k.nautiyal@intel.com>, Kees Cook <keescook@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The pcon_dsc_dpcd array holds 13 registers (0x92 through 0x9E). Fix the
math to calculate the max size. Found from a -Warray-bounds build:

drivers/gpu/drm/drm_dp_helper.c: In function 'drm_dp_pcon_dsc_bpp_incr':
drivers/gpu/drm/drm_dp_helper.c:3130:28: error: array subscript 12 is outside array bounds of 'const u8[12]' {aka 'const unsigned char[12]'} [-Werror=array-bounds]
 3130 |         buf = pcon_dsc_dpcd[DP_PCON_DSC_BPP_INCR - DP_PCON_DSC_ENCODER];
      |               ~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/drm_dp_helper.c:3126:39: note: while referencing 'pcon_dsc_dpcd'
 3126 | int drm_dp_pcon_dsc_bpp_incr(const u8 pcon_dsc_dpcd[DP_PCON_DSC_ENCODER_CAP_SIZE])
      |                              ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes: e2e16da398d9 ("drm/dp_helper: Add support for Configuring DSC for HDMI2.1 Pcon")
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 include/drm/drm_dp_helper.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_dp_helper.h b/include/drm/drm_dp_helper.h
index 30359e434c3f..472dac376284 100644
--- a/include/drm/drm_dp_helper.h
+++ b/include/drm/drm_dp_helper.h
@@ -456,7 +456,7 @@ struct drm_panel;
 #define DP_FEC_CAPABILITY_1			0x091   /* 2.0 */
 
 /* DP-HDMI2.1 PCON DSC ENCODER SUPPORT */
-#define DP_PCON_DSC_ENCODER_CAP_SIZE        0xC	/* 0x9E - 0x92 */
+#define DP_PCON_DSC_ENCODER_CAP_SIZE        0xD	/* 0x92 through 0x9E */
 #define DP_PCON_DSC_ENCODER                 0x092
 # define DP_PCON_DSC_ENCODER_SUPPORTED      (1 << 0)
 # define DP_PCON_DSC_PPS_ENC_OVERRIDE       (1 << 1)
-- 
2.30.2

