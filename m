Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD7409D29
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 21:35:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15F346E235;
	Mon, 13 Sep 2021 19:35:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com
 [IPv6:2607:f8b0:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE916E231;
 Mon, 13 Sep 2021 19:35:43 +0000 (UTC)
Received: by mail-pg1-x52f.google.com with SMTP id u18so10475493pgf.0;
 Mon, 13 Sep 2021 12:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOOYsSoEc/D646aNbudkKETOp6ZJbahQerUYpHk8gG8=;
 b=hxvtuiSNl91HGeT5ayFqo4qZVk2gWSOqjkpso/9dqGHI2G39SsLxk5P9+xXNSVnj/1
 uOrKJv6oabEyqzv6fzuvF2geipiFZvFmcOEuBQ4EBwfte3Jr3pkX7iVUClYI4kA1IaYl
 MKMv7+BvKwq8yp+m9/gS3ZN4LyEbZ+/nOpUOcBapnC4djHq4aX/ojs2Ut0220nPRK/xY
 pysKdZNFiZzF1etDiz0aaSUhXnRuQ7Op1m1KIqTSrOxBKTAvxgZM/IqtnC8A2Hsq0+FG
 hq8svhTtZk3sNejbdZpmqaygYH1I1eoMygZykCVcrYADVvNJ/MxqBEt0BNwgbC5o3yCX
 4ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FOOYsSoEc/D646aNbudkKETOp6ZJbahQerUYpHk8gG8=;
 b=Mb+etowekzUCMTLQtCcFpj6LgwXNRY1yDXp0WcvttS0HbKdC4P5ODj8fswiqPU1rYO
 veZdFFhBjY6et6XWzU4aeFETGjCbdBT9T7KOeDbvVYi8zMMUlGmQgp4pkQsxus6UHObT
 luckMF2/3/CS6a2zDmjHSh0XtRhnS4Nf7XaPJb/A5AjTcJbLJWc7sSg66b2kuOxxL7bI
 /967HRhU/QynAUvcUlclKXe6LyTJ8CE5Un/UiK6O1/6RE7fBWBCdrYaUeDIN7AMLWw1O
 yReGB7bL40zv3jMtdxVONAzGvSq39GBjJratwc75teKgvZBc2//EmU2OPX+enLHu9/In
 7b/A==
X-Gm-Message-State: AOAM533FFzPQ5fW+qsMo8SYT9ei2nvxYsshu0O7J1BTLxJcc64EYWDhX
 W1xW1DWxFc3Km5v9W+egryw=
X-Google-Smtp-Source: ABdhPJwbXYYcsUERZAMwlqgIst1DIJ+CrmeYqpfhlqY2BNnob/GSjsBKxZhWH/A70k3k2zc6io4NAA==
X-Received: by 2002:aa7:8510:0:b0:3f8:f367:4890 with SMTP id
 v16-20020aa78510000000b003f8f3674890mr1049356pfn.49.1631561742830; 
 Mon, 13 Sep 2021 12:35:42 -0700 (PDT)
Received: from anarsoul-xps15.lan ([2604:3d08:7780:1f45::a59])
 by smtp.gmail.com with ESMTPSA id s38sm2888855pfw.209.2021.09.13.12.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 12:35:42 -0700 (PDT)
From: Vasily Khoruzhick <anarsoul@gmail.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Lyude Paul <lyude@redhat.com>,
 Sean Paul <seanpaul@chromium.org>, Aaron Ma <aaron.ma@canonical.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH] drm/i915/dp: add a delay before setting panel brightness
 after power on
Date: Mon, 13 Sep 2021 12:35:09 -0700
Message-Id: <20210913193509.3575-1-anarsoul@gmail.com>
X-Mailer: git-send-email 2.33.0
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

Panel in my Dell XPS 7590, that uses Intel's HDR backlight interface to
control brightness, apparently needs a delay before setting brightness
after power on. Without this delay the panel does accept the setting
and may come up with some arbitrary brightness (sometimes it's too dark,
sometimes it's too bright, I wasn't able to find a system).

I don't have access to the spec, so I'm not sure if it's expected
behavior or a quirk for particular device.

Delay was chosen by experiment: it works with 100ms, but fails with
anything lower than 75ms.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
index 4f8337c7fd2e..c4f35e1b5870 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
@@ -210,6 +210,10 @@ intel_dp_aux_hdr_enable_backlight(const struct intel_crtc_state *crtc_state,
 
 	ctrl = old_ctrl;
 	if (panel->backlight.edp.intel.sdr_uses_aux) {
+		/* Wait 100ms to ensure that panel is ready otherwise it may not
+		 * set chosen backlight level
+		 */
+		msleep(100);
 		ctrl |= INTEL_EDP_HDR_TCON_BRIGHTNESS_AUX_ENABLE;
 		intel_dp_aux_hdr_set_aux_backlight(conn_state, level);
 	} else {
-- 
2.33.0

