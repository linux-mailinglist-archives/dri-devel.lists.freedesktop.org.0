Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F539AF602
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 02:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0958D10E9BE;
	Fri, 25 Oct 2024 00:20:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kqxgWbhl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 287CA10E9BC
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 00:20:17 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-539fb49c64aso2611726e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2024 17:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729815615; x=1730420415; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+xqrfLhi8maJ3GiZ3G/FlADlqaLUOMJAXiAxxK/1iKc=;
 b=kqxgWbhl270e39uP0GAkLIODKix24wk6GcRBhOZGmAlVzH5/CAriYkM/uxNfqg1PVG
 uvWodGjjqDe42iExcinbxc/ivJNyDo4v7cz6eG2DgpikEYjKLumlzl/INbxBdKbQ8NSt
 XIKWr0A3zCnsnxiO47BgdBTnE9scUU49uAXQ7bSw3TsfjL0oPM2UPgliZFUCRBqhhaIw
 ocpEQbOdXrcq9sgfqHwCBVAmVClb8kaE6TqGdE9Fg+IGx2FuK1XvjOXhpnpGk9qA5jlj
 AHUL9FJLxdvlgS02pHiQ8udayeliFrF6i8R9zJQzSU/1Nj72x3clpKBLp8Jmd7cs2raA
 QGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729815615; x=1730420415;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+xqrfLhi8maJ3GiZ3G/FlADlqaLUOMJAXiAxxK/1iKc=;
 b=TlBLopSEeYZgGxk7OgQjd4sz9lY09ec80dUSwrHw3JJ/59ysBCkvaOVPByuZ9zb4xn
 T17hYT1YWMlFb/GKUQOgP+/0L3bUb+hAorkEYIFc5P5DiRU6dLD2lxzEciQhLjF4WsuF
 b1T0AiPd5DO7WxJEGRs9+68HfpNbpI93II2hVVfw88UgdBFFSIi/kWFvwgr1alNHqTZW
 UWnk8FItvEJunVIGWNjCy6SflliHcQ6kbB/6aRxEKMVz8SMaqNmPrfQNVfPpLZTfORLW
 fd1Yaaw35mUhHw54Qub9FfMIxOghZaUvjKX31bf7Zlklm4z/4B+SqoJnnEXscpHgxk1u
 KBpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUiroDNDEQaeT7BPWLb2OwS+ZO8AtA0THVnxP2qHcsepd5VZfxwz/ibrVCObHpUyS6RdUdiaXZJJeY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIJjzOpD3q/IYG7dKolSIWtgX5ZnEOM+SPTLxkoRHqzirCf+uG
 F54BGfXkeVChg3I7VdJPNaK46Yi9wbsjd2cRiHYHYQ85HoFenkA8Fuisn7BblmY=
X-Google-Smtp-Source: AGHT+IHMp3Vj8D5xOK8sGcL7IZTD8X2M3Tusli278j57Rh6uC4B2tdfT0DQHDAHKsjpze0EnlHJyZg==
X-Received: by 2002:a05:6512:350e:b0:53b:1e70:6ab4 with SMTP id
 2adb3069b0e04-53b1e706b9fmr4865361e87.14.1729815614849; 
 Thu, 24 Oct 2024 17:20:14 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53b2e1b05b3sm6227e87.161.2024.10.24.17.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2024 17:20:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 25 Oct 2024 03:20:08 +0300
Subject: [PATCH v6 1/9] drm/msm/dpu: use drm_rect_fp_to_int()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-dpu-virtual-wide-v6-1-0310fd519765@linaro.org>
References: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
In-Reply-To: <20241025-dpu-virtual-wide-v6-0-0310fd519765@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1020;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Z1DUfkZ6/oZuA6xRT2zKvLthKeLBEYc68oLVcqrozCs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnGuQ5QZvFmOhdu+ChSig00R7PCHyXB/io4gx82
 9QJ266jmSmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxrkOQAKCRCLPIo+Aiko
 1RuYB/9ryN0Vx5GSVzt0aq/0oxk0TaqWvPjOsc9vwGvdO+M17JlZMARorjXfRX+LVmsgsHRMSpL
 TeR3TE9I6oOQjQbmZrRgw/1QKOowNUQVMeObdT1UshAlhiu4UPLsGSP84itcqEtTo6feXRAs8/O
 iYeyRyUmt7GbRimV8tKYZUCBkHqTE3ZNs1voX7QlW7fpnEpGsnHKLMG5Qe4d2qkvp//XDaxPsw2
 TcLV+wcvgUsB5YtkADcMyKJOtXxvP5crLjWMxyM/HMTt2LxVE4xqTSDbW9rpcfZO4x9Vnj4unbT
 qH228PzTSLSGi5tOrDp7mDMxYYOaQ8cwYMA0P+wFgcpnK8CD
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

Use the drm_rect_fp_to_int() helper instead of using the hand-written
code.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e935e9c05f04..37faf5b238b0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -829,13 +829,8 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	pipe_cfg->src_rect = new_plane_state->src;
-
 	/* state->src is 16.16, src_rect is not */
-	pipe_cfg->src_rect.x1 >>= 16;
-	pipe_cfg->src_rect.x2 >>= 16;
-	pipe_cfg->src_rect.y1 >>= 16;
-	pipe_cfg->src_rect.y2 >>= 16;
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
 
 	pipe_cfg->dst_rect = new_plane_state->dst;
 

-- 
2.39.5

