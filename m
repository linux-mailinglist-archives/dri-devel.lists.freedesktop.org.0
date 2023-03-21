Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EEF6C274C
	for <lists+dri-devel@lfdr.de>; Tue, 21 Mar 2023 02:18:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 338A810E6C4;
	Tue, 21 Mar 2023 01:18:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE41D10E6AF
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Mar 2023 01:18:25 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id br6so17202114lfb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 18:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679361504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYN3oYps1kExjbkf+zjFZYaGqiWBM1RDNanr9QzGX+M=;
 b=GrqYqhhsIMn2xfgfbCoGZNP53LWMZSCxJxVxh3b92VCfmVcZyZUhLADpEkxVp97/9c
 coPwD3Po75Uo65GLG/15Gvq6yTvNxeewn7Mrsnh/khiwtGIoB5LkPuns8HyzC7HeReEN
 C2jeqtmb6IyzG3THhmf0DKEAkahOoqU9wEQ4jWyAxBwJhtJyasCNn5+nVVA6EFOepEOS
 5LSfRGmGIra2+5+hsnsm/2nNlUGjd+m0MpLQHBaknMk9o41sddol+pC0pHkiOis7TO74
 bBCbSuqzwcQr7XaHb20OYQU6JHi/tuVxIMij03/ce0bwEMdwqZuMxU8+WoKmMrGhG144
 WWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679361504;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYN3oYps1kExjbkf+zjFZYaGqiWBM1RDNanr9QzGX+M=;
 b=f3Wf6mE0G6uMut4JypqKWQF8REzemEesSroVCmNN1nncubAWi8ASGXkwpKRObumvGP
 8wP7ZiZ6gG296vb/I2+dhODVf70dV1NLmIsw+gwm008qWTH2kaudtIwP4nvlybto0oj+
 U3kjKBeoKQ6I7j0oGUOfVeZ9KdXt54yRU+8Ehb4sqk7eRrDbvd0Qd9rm3Q43Ci/8/3lH
 lLeh0XTpyRkC5NwH9b7qM7+aNHtWEriT9t2N/fxcdbf+Hn1nEajglHT5U46TLayMq3AM
 ecIfcpF5ZHxUWn8Pbawzafkg3uO98tWvbpuF2hKNmjqC4uclfpUJ/F8svkerCJpeqrq7
 DUYg==
X-Gm-Message-State: AO0yUKVdiSSUJ5yIKROZLF/QtvkBIS8ScG5iPF3u6E0QOnyNA5U5rP8S
 Ul8hGY60tbx8OtHqz8QW+HpRNg==
X-Google-Smtp-Source: AK7set//en3R7J7A36LAkaMdnCjbcNGxUJiPViGi+MCKzk39MaPSyhBsndT6fLK50TOdhIsO+FLMfg==
X-Received: by 2002:ac2:5961:0:b0:4dd:a718:31dd with SMTP id
 h1-20020ac25961000000b004dda71831ddmr265068lfp.12.1679361504107; 
 Mon, 20 Mar 2023 18:18:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 c18-20020ac25312000000b004eaec70c68esm46863lfh.294.2023.03.20.18.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 18:18:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [RFC PATCH v2 02/13] drm/msm/dpu: take plane rotation into account
 for wide planes
Date: Tue, 21 Mar 2023 04:18:10 +0300
Message-Id: <20230321011821.635977-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Take into account the plane rotation and flipping when calculating src
positions for the wide plane parts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 27 ++++++++++++++---------
 1 file changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 2e63eb0a2f3f..d43e04fc4578 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -887,16 +887,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
-	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -912,6 +902,15 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
+
+	drm_rect_rotate(&pipe_cfg->src_rect,
+			new_plane_state->fb->width, new_plane_state->fb->height,
+			new_plane_state->rotation);
+
 	if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
 		/*
 		 * In parallel multirect case only the half of the usual width
@@ -959,6 +958,14 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
 	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt);
 	if (ret)
 		return ret;
-- 
2.30.2

