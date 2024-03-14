Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7150F87B588
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 01:02:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D75610E18F;
	Thu, 14 Mar 2024 00:02:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UxKjxZet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC4910E02E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:20 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-513b16bb739so510247e87.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374539; x=1710979339; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gj3lW7SJBVxAjQYikbiu5IXfqO7a39lu/HpAURIlMqg=;
 b=UxKjxZethOf0w3bpsV6HvqFPEd2LAj2ANjg4QlFC1SU5eWu1fd1+Q9vC87IY6QdwPS
 O+U0qOuH+8xJQg0MkTldqw46OFrSLkWJwFeqWO4KJ9dRwGrlNYjmJMsdsK3ooNBCiAhe
 I5WbwUIOAv/HrlLVDikfYkUK46skGH3/ADg1hQ+yy9FgZRjKNsJ5A87I463AXg2xkPjW
 Vx3k3bHdBk2pOMxKPBOR1vpljjd/+CFa37fO5cOJ0kOmGXoolvngxQ4JrasKbCn649lM
 kTqXQNDTPCb0mmM/3Rl/cnpg5b0I4f86VdSVL8eB+9pMUgY2vVS2bRKLwZ05YLbEzj4D
 EMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374539; x=1710979339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Gj3lW7SJBVxAjQYikbiu5IXfqO7a39lu/HpAURIlMqg=;
 b=pqrqrSmook3QAKH6FSBHsx1ZuYDIxCGDkae7OcDlI2XM2xpjhqasiFWZPxctgyGfso
 Dy4SrCvG02obRCxHOOTCPeDs1J9CzVBUy1mh97TXIqYnszR8RLgwJ3R0oEsGC3PHQxbG
 /GzX9sKG/0axzSRNOOIJZ3V2xYPpEf+7Ul7+DVa5vdymxQRANKBSssMkh4ohdCGluJXH
 3yYgNFBWcz7Zq1a0sEgOCddZObUoxlfLEp+5MV8eLIh/qpuch9MaeXX59FZG4bys6//c
 7qFHLE4FtbA3PJBekOx+BQn4r8NwVR9ga7tHEGxEvZGstWY7CmYePjSyeM/T5JaKA1X3
 EW/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZOrB72x/Y8Tt4gcfnD1GAzRbulc6AqdYYdrmnaDbH2wIVgkYCWOaIQXpviwYpbDvch+mwLq8FoGXTRCZ5ifSleMbfoIFmGjRPMr7ohoDZ
X-Gm-Message-State: AOJu0YyEUYS00XEwbngFe0xGcEoZ0PlPch7V7ExX0d/vmLeHv2NcskNp
 /j8WxiO5bF3lIgKA5MF+/+2um1rFv/cktmQRVCzLBPcK1VPaavnM4wALED2S1/o=
X-Google-Smtp-Source: AGHT+IHvIoBT0iRAcOZiJAOvlSC6Oas+0qwTlsWhsEbNCVnMb3zY79S6PeoK2c0PRRLO+zTIkxwkcw==
X-Received: by 2002:ac2:54ad:0:b0:513:cab1:354b with SMTP id
 w13-20020ac254ad000000b00513cab1354bmr37991lfk.41.1710374539020; 
 Wed, 13 Mar 2024 17:02:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 01/13] drm/msm/dpu: take plane rotation into account for
 wide planes
Date: Thu, 14 Mar 2024 02:02:04 +0200
Message-Id: <20240314000216.392549-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
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

Take into account the plane rotation and flipping when calculating src
positions for the wide plane parts.

This is not an issue yet, because rotation is only supported for the
UBWC planes and wide UBWC planes are rejected anyway because in parallel
multirect case only the half of the usual width is supported for tiled
formats. However it's better to fix this now rather than stumbling upon
it later.

Fixes: 80e8ae3b38ab ("drm/msm/dpu: add support for wide planes")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ff975ad51145..44f35ae09ba6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -862,6 +862,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	drm_rect_rotate(&pipe_cfg->src_rect,
+			new_plane_state->fb->width, new_plane_state->fb->height,
+			new_plane_state->rotation);
+
 	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
 	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
 		/*
@@ -911,6 +915,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
 	}
 
+	drm_rect_rotate_inv(&pipe_cfg->src_rect,
+			    new_plane_state->fb->width, new_plane_state->fb->height,
+			    new_plane_state->rotation);
+	if (r_pipe->sspp)
+		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+				    new_plane_state->fb->width, new_plane_state->fb->height,
+				    new_plane_state->rotation);
+
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
 	if (ret)
 		return ret;
-- 
2.39.2

