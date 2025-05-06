Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2AEDAAC9D3
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E1910E6EA;
	Tue,  6 May 2025 15:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hiUN0Bbv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FAC10E6EA
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:47:52 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-306b6ae4fb3so6317326a91.1
 for <dri-devel@lists.freedesktop.org>; Tue, 06 May 2025 08:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746546472; x=1747151272; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=EAZqwoIR5WgNwGU/xBD+IG2xOYwT2VXmbD6p9oxdt2c=;
 b=hiUN0BbvE+5MMrOESy0KPhaI2zBMciURZm8Vo+7j4iL0ScxdXhZihjypGzch0ty+ct
 m4AX5nT0xD9WWTkgE/PJCiXlIc3+/VHjvxcr5/D6C4Ew39k2QaODmUwEGJC/HiFDLIFj
 IEWHawgbxAqgZsk0qsfOTW8FlhBWi2PD3vNCz5bB4BMagSqol8wIELmh8E1aSOs8gJDX
 UvNFsfF9DeUeee7xKpsBe18QTMTdb1eRImvhTNEROx1ZCjGdZB8eOajG/O92pkWS1WWC
 CWbUEQW9LJX2KGVxjrTHwWfenhB3Rl090rseVJ8cHSJ+F8qHXKTHmYbxst1ZKVlmTHvC
 w6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746546472; x=1747151272;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAZqwoIR5WgNwGU/xBD+IG2xOYwT2VXmbD6p9oxdt2c=;
 b=Uz7w+pBvrT9KOEwYwGbrDPtQdTKiM4I7woXJMb2rLmZy45vBMAtqEElCnv8eAEF55m
 r1mizJDq8OpoTAhWDQhNH3Fcy35/Ju/i4/QXb7QH0QwwmzL+GbjqML/Mbgwt4kdMYH7H
 4H2mYMiR2N6l1g8bjp9mV9hPQS2wqDJUf+1LOoy3vKQvHjg8kJGQeN6AWamas+Jd6HE2
 onfi+V/2dMjsXU1yNHCTP0fz/KOcBm+qVaVCH8ECd2XzoApz48Xxg5nq4DZEq7w8mAFJ
 yY+2J4bJU+h8aWI6Zxh3V419crMcjlWpzYmlL4lGjhWr1DDUXmmX2nu1RWq71DtznBnB
 u67A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX49OKbFRG0zBgcPTKyLkzPG+ZNFYo5KEWX6YABnW1u6emVai4bSmDGioyNdRIBAvV1EW4Ejt/k+jM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybkY98KFPDL9FIebTIpf+zzmye+soHnGHESWmYwdGmYw4jBu4G
 PPt9NnBcLQS1Q628V/jn4wxHAscajpep6kmRsHlUr8S/2ZeRLCWhD7Uh8yY+V58=
X-Gm-Gg: ASbGnctjjavs1TBiwOfWe1REP0aEnTK7X6tXESSl1OrFHk2nq4qvu+n1uiZ6yq/RmCn
 MGYt/gv/VTJJBcU2YUNpgaTCK/A+hE1U/Z/lw3e9wFzCo19qcumO32aOTVgTyYIQ6s7kuZ+nJwP
 0saXUylDJmkmqygo9o3qkLx7fyN3RzdMGaRIsHWDzlzIn7o85gWQGoCyjQ45/6t6M3qRIHKsYJr
 FdvyHD/sdwhFlz1uM7zjto0MRk8/59eHAeCiyBQAUdUwW71lkFVlc50+qacy5ww2wdxLAnSH018
 e8E8U1gmPHZHbw4l0pEUDT2E3wlyEr3MGStgew==
X-Google-Smtp-Source: AGHT+IFnRgAer2YqJDKDG8WSftGtJ1rR+zxfOuhlRqYyJ424rX57bTivAhXqIy4syKRnXc5Ylo86Kw==
X-Received: by 2002:a17:90b:2e0b:b0:309:f53c:b0a0 with SMTP id
 98e67ed59e1d1-30a7c0c8b02mr5742205a91.24.1746546472392; 
 Tue, 06 May 2025 08:47:52 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 May 2025 08:47:51 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:31 +0800
Subject: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before checking
 plane
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=1629;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=e+MxQIILmTfaUEYG8mRcW6giFJAkMzchKGmqQw3Zq2A=;
 b=zpOMrRtqL6iX2AnAGqg8NxcePk05uQNGAMoOqxpNJZAmmvq/T93PJYpj5MEkzyl0Fs18ufdNZ
 mXIzLx/KpGwAtrE8yNGE6pJr71Tx85cXy5Pz8Ck0WGp71qZ5JT8CS0t
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Some display controller support flexible CRTC and DMA, such as the display
controllers in snapdragon SoCs. CRTC can be implemented with several mixers
in parallel, and plane fetching can be implemented with several DMA under
umberala of a virtual drm plane.

The mixer number is decided per panel resolution and clock rate constrain
first, which happens in CRTC side. Then plane is split per mixer number
and configure DMA accordingly.

To support such forthcoming usage case, CRTC checking shall happen before
checking plane. Add the checking in the drm_atomic_helper_check_modeset().

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 			return ret;
 	}
 
+	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
+		const struct drm_crtc_helper_funcs *funcs;
+
+		funcs = crtc->helper_private;
+
+		if (!funcs || !funcs->atomic_check)
+			continue;
+
+		ret = funcs->atomic_check(crtc, state);
+		if (ret) {
+			drm_dbg_atomic(crtc->dev,
+				       "[CRTC:%d:%s] atomic driver check failed\n",
+				       crtc->base.id, crtc->name);
+			return ret;
+		}
+	}
+
+
+
 	ret = mode_valid(state);
 	if (ret)
 		return ret;

-- 
2.34.1

