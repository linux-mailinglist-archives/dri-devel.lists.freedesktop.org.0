Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5716D7DBF
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 15:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B1B10E0F4;
	Wed,  5 Apr 2023 13:31:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DAF110E963
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 13:31:10 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5002f12ccfeso51103a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 06:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680701468; x=1683293468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3gC8T0Hhz327/2VJSCVE22Spl2AolEJ6ULqD6zuiRhk=;
 b=AkK5o1gPoKlpjmOtGwL8M6vCey9KxFconHuNHHCOmCN6TcyMGJmKmfyeLwbow/xaSW
 1q1XNWjQwBcipxXpjLHAhNDU1R9uIB2FrdfgiNeipcBpeb6iM4v2S+YzoLaArl66pD6p
 4qnymoyer02lJSF4W5m9C6pTcZBCzyVZb0LZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680701468; x=1683293468;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3gC8T0Hhz327/2VJSCVE22Spl2AolEJ6ULqD6zuiRhk=;
 b=6UAGJE/ARJG0MLEc4jtTC7Y00lvIkIetgt1MuSuVUARnboWcMwRxGrWo9bsLg5M60+
 fEohWBocTMWdoA/4xkrDMhHxdUb23re+xkEpEXUDZhB/937TiqOsLMEfePCnEVHzyA7n
 KGzRajnEHXG5X1omVFO9Af/Wk/j36RwKpQpG6KNTyCqmcO75cQWQUMoP6lZNkWD2v1mO
 7gVXSTNqzy1GfLKgtWKuAY1W60lOLw8dpbS9yt27dKZynRyFnpUdgj7Li6eQOJQXLaAO
 yxjxHkjEWdndFZfPZ/ZmNTJasWYIVrTpf670bvVTIGjnVDxkDjV9V+1dXli+rEEdqmlp
 yc7Q==
X-Gm-Message-State: AAQBX9fB0wqChnlRFAcEB738y9b50Yn2dskcx79xXzA//Sc+IXgrL6/5
 AoeQ0guhe7/hN299Hlu9T4tSIwVYUHjVtxCus60=
X-Google-Smtp-Source: AKy350aAj7cYJY1Pl6RYcAwQBP7OKijW579XjVqW7J1JRBzC7iKfyIqhrIb/P5eEos3qZF75Xpz3TQ==
X-Received: by 2002:a05:6402:34c8:b0:502:367:d5b8 with SMTP id
 w8-20020a05640234c800b005020367d5b8mr2082819edc.4.1680701468509; 
 Wed, 05 Apr 2023 06:31:08 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 g29-20020a50d0dd000000b004c0239e41d8sm7346375edf.81.2023.04.05.06.31.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 06:31:07 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic-helper: Don't set deadline for modesets
Date: Wed,  5 Apr 2023 15:31:05 +0200
Message-Id: <20230405133105.947834-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230405081650.797972-1-daniel.vetter@ffwll.ch>
References: <20230405081650.797972-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the crtc is being switched on or off then the semantics of
computing the timestampe of the next vblank is somewhat ill-defined.
And indeed, the code splats with a warning in the timestamp
computation code. Specifically it hits the check to make sure that
atomic drivers have full set up the timing constants in the drm_vblank
structure, and that's just not the case before the crtc is actually
on.

For robustness it seems best to just not set deadlines for modesets.

v2: Also skip on inactive crtc (Ville)

Link: https://lore.kernel.org/dri-devel/dfc21f18-7e1e-48f0-c05a-d659b9c90b91@linaro.org/
Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # test patch only
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f21b5a74176c..d44fb9b87ef8 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1528,6 +1528,12 @@ static void set_fence_deadline(struct drm_device *dev,
 	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
 		ktime_t v;
 
+		if (drm_atomic_crtc_needs_modeset(new_crtc_state))
+			continue;
+
+		if (!new_crtc_state->active)
+			continue;
+
 		if (drm_crtc_next_vblank_start(crtc, &v))
 			continue;
 
-- 
2.40.0

