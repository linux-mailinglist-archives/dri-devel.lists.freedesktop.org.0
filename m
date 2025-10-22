Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BDCBFC728
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:21:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AF7A10E7BE;
	Wed, 22 Oct 2025 14:21:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nRzWkZ5B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D79D510E7BA
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:21:36 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4711f3c386eso36399415e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142895; x=1761747695; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
 b=nRzWkZ5Bfu083NLHStw4LFXOrRtJmBjB6+PRIlNNyYY8gjKGWprQbiQ3gwT6RCiFcP
 NZ2FqwFCPQAbDet7bK/DwGHyqYSzQm2NCIisdouV2Zzp6QaZ6lhPtDbMHP46QsjWP+44
 ShoiBiW6h2zRqvjpv08DrAC2RErHn/G+ZQUk5Vy9dQ90OaaDNsqfiSGHSDZIK3HyXh7z
 JX5o45Wuv6Bj5xwZpqhqTGtcaJhI1+MPbvTBTEZBN9u0BZhBiaGU5ffszM+UT8bM/Q9R
 EiwIBgTbEnkcZdyqiUUdrbCVcniOfRfCeienGfugxhH0cmSeS0Lee7NH0FiVS7PUj+kF
 U24g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142895; x=1761747695;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rAO9OwRfZdFmlMl3mS0tub2HzSBi7qv3ODFvIZHKgFU=;
 b=rTJ8Q08YfA1gnOxC+pDXbhNUxUJBbg5rTAtJfgZ2l33DuiFX+3/LruwsgUySm7ECh+
 evczEkLmIfI8wTBRKX/h/J5iC13411XlrjYtBBILIsED75HF3q7FBdqI98f1xTAj/XCi
 kZ6P5tqnwE5GwTF1JIHERf44L9ZKa/t+TvEew4Uyv4TG/gCvw5VgUV3ixC2L+JqaKycq
 rN3vYM/Lht9lgMIJ63T3NZ3Wfi2+mHGG8jk4LRWio5BpMOSaNpw+xgoh5wWo+KcMfJZI
 zaKL33Hm4OqEkdsz3ufq7lDghpuFVQ3kdj4zTjb4Fr+M8zli17pPjCP0gekfzpLiMHyp
 uxmQ==
X-Gm-Message-State: AOJu0YxwS45s7JctVK/KGJQffTFMbX6fIGOfFGKNw5PXHZgZtywLP+3I
 efvoubtPjGx7440+QRSQkDSb41/dcDULlhePKN7+n2w9Rpt3OEfyPQwf
X-Gm-Gg: ASbGncvyLwDeJxFU+RSFa9Yew1lD4E49mjEwHzIhkgXmpG4LMYxdYXYi0lqfiYe6H/j
 nYpNE59aK+gFk+T1VkS65hONelF3bzf8jYHZ62914l2mNMziu4uulWLBqLOrcBXJmh8eNtClp7A
 XqcGzjr7CdZrcp7V4wOMZsag0zWE/I2e8JEMGFwY7OfgFD5If4LpiRwpJVKdM+7wfsOQA2hD5Lr
 CGJIhQEBQ7pfxVfo4GrRvFPZyLzzVDbAzFj7QtdXBDDSxnBoUpdXXNfjWiBLiHLWgbVtaXoDHiI
 tC/6+ctyhBtRFSrznwi12ndLiSLW0J6cL3Qjfj5G/8HUkhGFYtcrligvSlVpM66kG02ZF21Ubae
 h6DAMZPyGLgqp4+GvYWxXYpMPQYoEX9c2y/4eBIseOtCNm7S4Zh8cJlEJtjZc43XBXkSTlYlqag
 3cmA==
X-Google-Smtp-Source: AGHT+IGaJGEihzS9F6fnNyhHVGRwXCsOXdE9dlWNhp4wiYwBqGQCgmFf5u4C0KR9SkCEnEJDDokDBg==
X-Received: by 2002:a05:600c:8284:b0:46f:b43a:aedf with SMTP id
 5b1f17b1804b1-47117925da1mr126433075e9.38.1761142895124; 
 Wed, 22 Oct 2025 07:21:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:34 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 =?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
 Dmitry Osipenko <digetx@gmail.com>,
 Charan Pedumuru <charan.pedumuru@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Aaron Kling <webgeek1234@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-staging@lists.linux.dev
Subject: [PATCH v5 07/23] staging: media: tegra-video: vi: add flip controls
 only if no source controls are provided
Date: Wed, 22 Oct 2025 17:20:35 +0300
Message-ID: <20251022142051.70400-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
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

Because the current Tegra video driver is video-centric, it exposes all
controls via /dev/video. If both the camera sensor and the VI provide
hflip and vflip, the driver will fail because only one control is allowed.
To address this, hflip and vflip should be added from the SoC only if the
camera sensor doesn't provide those controls.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 856b7c18b551..90473729b546 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -961,6 +961,7 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 	}
 #else
 	struct v4l2_subdev *subdev;
+	struct v4l2_ctrl *hflip, *vflip;
 
 	/* custom control */
 	v4l2_ctrl_new_custom(&chan->ctrl_handler, &syncpt_timeout_ctrl, NULL);
@@ -986,11 +987,13 @@ static int tegra_channel_setup_ctrl_handler(struct tegra_vi_channel *chan)
 		return ret;
 	}
 
-	if (chan->vi->soc->has_h_v_flip) {
+	hflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_HFLIP);
+	if (chan->vi->soc->has_h_v_flip && !hflip)
 		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_HFLIP, 0, 1, 1, 0);
-		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
-	}
 
+	vflip = v4l2_ctrl_find(subdev->ctrl_handler, V4L2_CID_VFLIP);
+	if (chan->vi->soc->has_h_v_flip && !vflip)
+		v4l2_ctrl_new_std(&chan->ctrl_handler, &vi_ctrl_ops, V4L2_CID_VFLIP, 0, 1, 1, 0);
 #endif
 
 	/* setup the controls */
-- 
2.48.1

