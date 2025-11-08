Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99CE1C42AA3
	for <lists+dri-devel@lfdr.de>; Sat, 08 Nov 2025 10:39:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5261E10E17E;
	Sat,  8 Nov 2025 09:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RxyO+Z1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E5510E27A
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Nov 2025 02:24:21 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-7ea50f94045so12697156d6.1
 for <dri-devel@lists.freedesktop.org>; Fri, 07 Nov 2025 18:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762568660; x=1763173460; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NY2LbgvIY/fMzsfOBXS1nVDAgZLdeObOtoX1Ris2Kn0=;
 b=RxyO+Z1TbWZEkCs9M8De9DIy8Ua1n2elYntKXMEYuQnn9f/eVRVyyIeIWMhmQUaVNZ
 xOIwm33TXCB+G7rpl1VvAnM5GCLNzXTcpRE9WzZ8GZaYJPRCI7dYvOTKSMSt7pGmiXFq
 zI+zS3SoCLqXbF97y5e4C1osxJAeJMpMn54/QR0pO6x+SKqrJ4KROgfkw3mSHYjEm33y
 h/MnOkgIe/pR3RE7LJaQx8gYTAnoEtilNW1D3lmlKTMltLxz666JYT1SVBbqAg7rzQtV
 9g6w/AyjSoQFL+ERGSTfJq5quFLLPu0Awz98olReFJDg8i4ZWJ5qqgP8PmqV43kI6dAF
 DZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762568660; x=1763173460;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NY2LbgvIY/fMzsfOBXS1nVDAgZLdeObOtoX1Ris2Kn0=;
 b=Qyn2LG/bN3usQuyrdddMpoxMrmK6zbKNdEGjAf62NWY7QWaH654HrBWvef0v0uqRZA
 VvlBdUMhsp2j1q5ot44RTJ0LJLDacWzSnQtiqYtJOKvLEDbXtqXYbIFa1A9AEFhSUC2w
 V8i/dU9Lo1RmywKzifli+jC4CgHv043EaY8x/+02+ePdX2/TCyZLkM69T+hfiOkIDVmW
 X8jPdKmQp+EXYU9oqIBUo64vXzNfZa4B6uTkoE7UrAMLI7I7h4rt4AYP3acMhGI1Wz1v
 Ji75dmybUQY7IvcVOoM2eLLwh71qa0zH76JFYHFbU8kJrMLdnkK/iMllB2dHVcT4lyXh
 Xg1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8c/IQ80EE+8P0rqnXUbUraDMfQZXmt1X8gIc0U+xCzra3H3sc/1+FVuqe81PaAMzIqSzXCddSXAU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxKB7HvCYKmHlOI7wuyNxpyA++EAHIq6ClznbPjjLhY0n/+YDqY
 ajiAG13zwIfYBpe2TpUJb5F+DDK0leYYeozp9nTcOKp0K6YuZLdqM17n
X-Gm-Gg: ASbGncuPWXzfey6nWQYfHMP/wSz0fWrraZdPk2ATDpuruoyiHMY19/gdlXSR+q5/PNu
 MmWzpQt0BSEDMQ9QSXCjZTUbtFZOp5rRf+cukYQKCILyxD7upmxC4zLcyFKPcpS/TTlRmFQ4gsI
 4SsdMALmLURgAMEtIfAkIjRaCVa5K9vQ89TLvZKhw6XXPFNC0+8Znm28Nw0zMiQ08Qucb+tR0Wl
 bU0dUECQVFHwFTISlgIEtm9wsH8MOv2rg6owgkK5c0SiN/+6V4bNl2GzGjjraDTcv2BGo7LOK8b
 douXh258Ert0a2qKPkKLqZgwQ144nT1t2hkqm1x+8qDfVWd4ohTsqnVP1+aWm2bbRteWhvn5HDu
 pKN5YEaqvuSktJjqLLhLR8EwIDqlYMO8m7hHrX0KLwPGFxNk=
X-Google-Smtp-Source: AGHT+IFg9wz6lhJl8Q0/MXiDVkvZKRCFkQJ5hkPlMaUqnbTVBXvIucOF1fAknSssoiuUZ/XVQ1oB7g==
X-Received: by 2002:a05:6214:2aad:b0:880:580f:27c8 with SMTP id
 6a1803df08f44-8822f4d3cbemr47329436d6.6.1762568659947; 
 Fri, 07 Nov 2025 18:24:19 -0800 (PST)
Received: from ryzen ([2601:644:8000:8e26::ea0])
 by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88238928af8sm7493646d6.6.2025.11.07.18.24.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Nov 2025 18:24:19 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: dri-devel@vger.kernel.org
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 amd-gfx@lists.freedesktop.org (open list:AMD DISPLAY CORE),
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/amd/display:: fix designated initializer error
Date: Fri,  7 Nov 2025 18:24:01 -0800
Message-ID: <20251108022401.270909-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 08 Nov 2025 09:39:27 +0000
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

{} instead of {0} avoids the error with W=1

error: positional initialization of field in ‘struct’ declared
with ‘designated_init’ attribute [-Werror=designated-init]

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
index f8996ee2856b..574618d5d4a4 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dce_stream_encoder.c
@@ -1568,7 +1568,7 @@ void dce110_stream_encoder_construct(
 	enc110->se_mask = se_mask;
 }
 
-static const struct stream_encoder_funcs dce110_an_str_enc_funcs = {0};
+static const struct stream_encoder_funcs dce110_an_str_enc_funcs = {};
 
 void dce110_analog_stream_encoder_construct(
 	struct dce110_stream_encoder *enc110,
-- 
2.51.2

