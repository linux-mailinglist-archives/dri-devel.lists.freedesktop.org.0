Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FA1905735
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 17:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98E9510E11A;
	Wed, 12 Jun 2024 15:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dRs29bse";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EA210E7B9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:37:11 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-6570bd6c3d7so4144130a12.0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 06:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718199430; x=1718804230; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v/n0skyDCqk0A4g17wGPYh0p/6wetdSwsLx+Vq4wTy8=;
 b=dRs29bsePlgHf3yBgiDGVcGFHMH6f6Dy+iJFtidlKTsZoHEj2Q4N4NjPnePTo/rSVm
 lbFlT6nOEAKwyLr6un5IsGNn/bVuLtdhKXop8rjko2T4KwLqr+TZaUwKZQ87CRvMjABM
 3IiBuouyNyx9Ikt0HuD+VT04XAcxnrVVEePI3yYnSS4l8GHd+MlJN7tLD3Kw7st9L/Ho
 XH6yfbqeO/yLxtHHOLn0Zvn/6uNZONSkrDyJPdTjuDOHdnm8PNehzNV3ijUla44VP6bA
 Oc/bf0pkZClygzMAqLHK4a8VPX+anRHf+fxJF5/67foGLTuRr7RyCiuXMzE4QI2TmQEo
 JAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718199430; x=1718804230;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v/n0skyDCqk0A4g17wGPYh0p/6wetdSwsLx+Vq4wTy8=;
 b=kbJ+fBpUMPqoE1+Au6aNcRO6ESh5WuUtC6sYYb9N5d7A/7qqZhjMqZC2bBFkj5Vcln
 VqOrcyV1qxFXU46S6dOYrTKdnzaRPRv/sDRS+IoI1UUMiJxZfdHyrRBm5Eqkr16kdj8J
 D8LqH79fYHVo1Zg2G4d4hQziqazVab8IhD3btdUacSjpnB0NmjlXc6i4ZFqIjHxDoIrM
 X7VVhjFyrCL61ZiR2u/NXBWsJLLrzQYH8Bd4jgWbVje1tCuny16WlgWf/WS4fvU4+na6
 aztNHV7tJlCZkDSupGOdN1HpmCFEaISYJiO1HF5ieb72oNniwhk07zOrjczmPfvrRbKG
 oBZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8GjUfL2slGC9kl/5K9vypthVda8KAZ0HWG8Psl23mLbslZOoSKootFlN1MhSJfaEmoTBBJd9qRQbTT28v0OZX0ygcmx6u5fe9NXh4ZxH2
X-Gm-Message-State: AOJu0YwA1TGnQ2sbK/Yup7gJ6ZqQjQV7zyZYYM/PMauFsR+eACuvKBRM
 HRC8rsDax2h19oftcouDHRQBPzevLFoyBk6GmnBn+Yo4KlJ5M2pE
X-Google-Smtp-Source: AGHT+IGcY5lrA68E4+hHXL1ibBHgiWf7Aag49KQay59rhRT3xV22h/I+PhvUY5tYGnv77TorH4ctkA==
X-Received: by 2002:a17:902:dacb:b0:1f8:4932:2f05 with SMTP id
 d9443c01a7336-1f849323126mr6170465ad.64.1718199430429; 
 Wed, 12 Jun 2024 06:37:10 -0700 (PDT)
Received: from distilledx.localdomain ([103.246.195.195])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1f845e0ca86sm7291815ad.0.2024.06.12.06.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jun 2024 06:37:10 -0700 (PDT)
From: Tejas Vipin <tejasvipin76@gmail.com>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com
Cc: Tejas Vipin <tejasvipin76@gmail.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, linus.walleij@linaro.org, dmitry.baryshkov@linaro.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] drm/mipi-dsi: fix handling of ctx in mipi_dsi_msleep
Date: Wed, 12 Jun 2024 19:05:43 +0530
Message-ID: <20240612133550.473279-3-tejasvipin76@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612133550.473279-1-tejasvipin76@gmail.com>
References: <20240612133550.473279-1-tejasvipin76@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jun 2024 15:43:15 +0000
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

ctx would be better off treated as a pointer to account for most of its
usage so far, and brackets should be added to account for operator 
precedence for correct evaluation.

Fixes: f79d6d28d8fe7 ("drm/mipi-dsi: wrap more functions for streamline handling") 
Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
---
 include/drm/drm_mipi_dsi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
index bd5a0b6d0711..71d121aeef24 100644
--- a/include/drm/drm_mipi_dsi.h
+++ b/include/drm/drm_mipi_dsi.h
@@ -293,7 +293,7 @@ ssize_t mipi_dsi_generic_read(struct mipi_dsi_device *dsi, const void *params,
 
 #define mipi_dsi_msleep(ctx, delay)	\
 	do {				\
-		if (!ctx.accum_err)	\
+		if (!(ctx)->accum_err)	\
 			msleep(delay);	\
 	} while (0)
 
-- 
2.45.2

