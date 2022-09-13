Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E98D5B7C57
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 22:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8257410E492;
	Tue, 13 Sep 2022 20:55:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x949.google.com (mail-ua1-x949.google.com
 [IPv6:2607:f8b0:4864:20::949])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07CA10E4BB
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 20:55:16 +0000 (UTC)
Received: by mail-ua1-x949.google.com with SMTP id
 k12-20020ab0538c000000b0039f64f6d1e2so3850212uaa.15
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Sep 2022 13:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date; bh=nJJJEPzYfSkXVdsCpO+dC++9rjlYO0nwzxMLu7tGL28=;
 b=kBuaNyAa7BFLRUEAj+HWAu4RAwHGJ9M57W9cIKk5MyobRXZOJfVdASqgAzWehpzyUn
 Y2IjOvlKDeODQuKbuNU3iikjsk79MNdjB7129WV6VfDSJNyYNNWrbljfwjvUPNHaboNr
 uiD84mx7PdI1dLViLrk1nug6KFyvMaOYA5/g2iznrnDGS9JbMdD4SWf2Db7rcUZGQLcG
 PMriKa3MzKAq1ZqqRh77D4TnN4zbttl85a6WpoJim5+T9nS0Gpmnk8hOc6Hgjloq/vak
 YyqkjUk+2SaZYQyLFnw2OgHqRIPyCfeeMNJtGxqxurWYcYuRL5J4RQfQpyzJPmHPv9zm
 QTyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date;
 bh=nJJJEPzYfSkXVdsCpO+dC++9rjlYO0nwzxMLu7tGL28=;
 b=5nOvd8/pV27WoB5psWey7aBDGf6QDXWeu8kvrhyoxKhz57gBdS3fi/0I07OO/1FQbR
 Ruc80g7TGtZVmqsNAdEQMjUHNPLu5PfMzqWqBMor/Ay0BWlsVWq8eqS/xeyajFeSGP5o
 55pB4OY6hZDWFq67vWebFl+ESPhcptRSr0ExTPgWc3PvfUPmz6iDRxpne0Q40RWOzPt5
 BdauigI0HcPBRWaMI5d9Vw+rk8hm+K8a+0j5/PZEjcbOKkGihGFKlf/1H4W8aGhbTaQ3
 65WKH5bvxQf3qKqLMbxO31bOP0UP/Mi4/A68nXkyVxWDtmL/Gyp9gB6JxrPMHw9fvfbD
 aWdQ==
X-Gm-Message-State: ACgBeo1+EWzG5tLFZ6AyQGfo1cMkP1zWi+a6e5X4vSJrYE/TW5Xy8SFz
 QCph/KQHmEk9Cbi7D1HVAqCoyBkxhg==
X-Google-Smtp-Source: AA6agR4lN1+7GX3YCJf/g+HqBAOkYjtAZV+sr5K0G3Nx6PLg9iKXtY/f1H3UDT4F3TWgC7ydjoSAksoqag==
X-Received: from nhuck.c.googlers.com ([fda3:e722:ac3:cc00:14:4d90:c0a8:39cc])
 (user=nhuck job=sendgmr) by 2002:a05:6122:106e:b0:39e:e580:440
 with SMTP id
 k14-20020a056122106e00b0039ee5800440mr10035328vko.37.1663102515183; Tue, 13
 Sep 2022 13:55:15 -0700 (PDT)
Date: Tue, 13 Sep 2022 13:54:49 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220913205449.154966-1-nhuck@google.com>
Subject: [PATCH] drm/exynos: Fix return type for mixer_mode_valid and
 hdmi_mode_valid
From: Nathan Huckleberry <nhuck@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Nathan Chancellor <nathan@kernel.org>, linux-samsung-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>,
 David Airlie <airlied@linux.ie>, Nick Desaulniers <ndesaulniers@google.com>,
 llvm@lists.linux.dev, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Nathan Huckleberry <nhuck@google.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Tom Rix <trix@redhat.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The field mode_valid in exynos_drm_crtc_ops is expected to be of type
enum drm_mode_status (*mode_valid)(struct exynos_drm_crtc *crtc,
                                   const struct drm_display_mode *mode);

Likewise for mode_valid in drm_connector_helper_funcs.

The mismatched return type breaks forward edge kCFI since the underlying
function definition does not match the function hook definition.

The return type of mixer_mode_valid and hdmi_mode_valid should be
changed from int to enum drm_mode_status.

Reported-by: Dan Carpenter <error27@gmail.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/1703
Cc: llvm@lists.linux.dev
Signed-off-by: Nathan Huckleberry <nhuck@google.com>
---
 drivers/gpu/drm/exynos/exynos_hdmi.c  | 4 ++--
 drivers/gpu/drm/exynos/exynos_mixer.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 10b0036f8a2e..8453359c92e8 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -922,8 +922,8 @@ static int hdmi_find_phy_conf(struct hdmi_context *hdata, u32 pixel_clock)
 	return -EINVAL;
 }
 
-static int hdmi_mode_valid(struct drm_connector *connector,
-			struct drm_display_mode *mode)
+static enum drm_mode_status hdmi_mode_valid(struct drm_connector *connector,
+					    struct drm_display_mode *mode)
 {
 	struct hdmi_context *hdata = connector_to_hdmi(connector);
 	int ret;
diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/exynos/exynos_mixer.c
index 65260a658684..82f676e6d21b 100644
--- a/drivers/gpu/drm/exynos/exynos_mixer.c
+++ b/drivers/gpu/drm/exynos/exynos_mixer.c
@@ -1045,8 +1045,9 @@ static void mixer_atomic_disable(struct exynos_drm_crtc *crtc)
 	clear_bit(MXR_BIT_POWERED, &ctx->flags);
 }
 
-static int mixer_mode_valid(struct exynos_drm_crtc *crtc,
-		const struct drm_display_mode *mode)
+static enum drm_mode_status
+mixer_mode_valid(struct exynos_drm_crtc *crtc,
+		 const struct drm_display_mode *mode)
 {
 	struct mixer_context *ctx = crtc->ctx;
 	u32 w = mode->hdisplay, h = mode->vdisplay;
-- 
2.37.2.789.g6183377224-goog

