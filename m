Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6CAED812
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 11:01:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEEE710E3D2;
	Mon, 30 Jun 2025 09:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Po0F+Rtb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5161710E3D2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 09:01:05 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-453634d8609so28638245e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Jun 2025 02:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751274064; x=1751878864; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w95P+dWG3ZuObvzvYSEnqdj+iXFN6Vo8U0ez9iwhMbM=;
 b=Po0F+RtbJhPdQDV2pClTaFHLi/7yYaZRTdlcHsK1715HZXUBvL+oaGLCx/Kdy/7/WH
 75Pynvs5hds6y7dCOUFMiYsNc+riBTTJmqHw/MG74gIucJ7p1PRoNJopvmHa6zSBzqcd
 jE7A3DEKx/hC7LypIjzBjrtXEeH/7D5L0KMOi6xrn4FLrMWDI9O5P7g+6j1Dfsr9bRGq
 K6+6JWr3lidMlyl0sERbCFCgmKGK8xB3KB5YW8Pwjao+ufZIk02P/UC1Y6J2J5CAT5YK
 IpbTWUfMM9MyiZNZdHo4s056nr9JrlR3ijUaQXYg111s2h0x+S8ycjxC32O0jx3tu2d/
 9v/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751274064; x=1751878864;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w95P+dWG3ZuObvzvYSEnqdj+iXFN6Vo8U0ez9iwhMbM=;
 b=sdxGvbdRZVZsVUiBtNDAdPBYekp+PZmiaDhFlQiwoRVf+JA/nOIQybq1f7ruHd0JOR
 uP/4/PSqOfkxvJOECDRbDIbEx/CpQf5YdiCLz/o18Raob36a/ZKxG5EefUJQQg4v/DBL
 AAV2gCo9yw6T9gnqn5xsTptfdwPi5Fevd+Vf9MPMgQiTIQct2k8b5gSfqypqcGSLHCh6
 xFlY23VGQY497lOPlhi2d3Cq9tgazl2ZugXgo1N+o0OLmioTpZDFcCOzXKENzEHUZWbF
 hBPSbQVZUXhmGVbHOGUg1WtOXANKEuHZQaHWAwwa4rO+1rMM5pu2+qiNkDd1hybp76B1
 m4XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8RdSzfZTf4iGHc7INJ5UKjdJqrzSM5gwoym+VSGMqDAIxaruZ1DVL+jhB+I61sOisrQshE7ke/LI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzoXmncgLBHrhVEcDOM87N+DSYHAibW5gVW74sFjxRbDjxHeZE3
 3zaOqCYeEOB9JQqX31mu0dchrWL0qd/ROP+WkSskEMj+GrdFBkoRNVa1
X-Gm-Gg: ASbGncsawYLOYMvEHLpBE8iIAFkd+vKsAYnMplX07lTYtpZXH3D3nKQ2DCSmTXAsPhM
 FdX6WAVsYioOpO39thL9BYyRPO278+dcvvPu3GOkWCCGR4UMRyyDSdsW/JdA83RsW8Z01EK4f6f
 ybXzfWQCPjZGh4CHlNkO2V9FCTTzHBpc/YFg8h1wshjYZvO75nkfruHlxk7i7a1JkEvzLgAQdzK
 6CwqXPlXRRk9LJiUnegzLAd9ymgkxwA+gnHlqMUGqbkYFDAxk7CS8zqsvNfBZL40J23BI9gJhq/
 2NGb/O5Zh/lgArci6Q7SzaWWMvjTFuRDkGeNLvt1NIoeX/lbhDOlSqf2Lys=
X-Google-Smtp-Source: AGHT+IEr8Bta3Dn7/9urhfz6+RJ6qK8vLaQt2JKl5jhIuXqaJyQdCt0DGEZzIL5ZZLcRPHKk0XkHHg==
X-Received: by 2002:a05:600c:4fce:b0:442:f4a3:b5f2 with SMTP id
 5b1f17b1804b1-45390259d15mr98930845e9.6.1751274063522; 
 Mon, 30 Jun 2025 02:01:03 -0700 (PDT)
Received: from fedora ([94.73.34.56]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c80b516sm9588408f8f.41.2025.06.30.02.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 02:01:03 -0700 (PDT)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, lumag@kernel.org, cristian.ciocaltea@collabora.com,
 gcarlos@disroot.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Subject: [PATCH 2/2] drm/tests: Fix drm_test_fb_xrgb8888_to_xrgb2101010() on
 big-endian
Date: Mon, 30 Jun 2025 11:00:54 +0200
Message-ID: <20250630090054.353246-2-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630090054.353246-1-jose.exposito89@gmail.com>
References: <20250630090054.353246-1-jose.exposito89@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix failures on big-endian architectures on tests cases
single_pixel_source_buffer, single_pixel_clip_rectangle,
well_known_colors and destination_pitch.

Fixes: 15bda1f8de5d ("drm/tests: Add calls to drm_fb_blit() on supported format conversion tests")
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/tests/drm_format_helper_test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tests/drm_format_helper_test.c b/drivers/gpu/drm/tests/drm_format_helper_test.c
index 86829e1cb7f0..981dada8f3a8 100644
--- a/drivers/gpu/drm/tests/drm_format_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_format_helper_test.c
@@ -1040,6 +1040,7 @@ static void drm_test_fb_xrgb8888_to_xrgb2101010(struct kunit *test)
 	memset(buf, 0, dst_size);
 
 	drm_fb_xrgb8888_to_xrgb2101010(&dst, dst_pitch, &src, &fb, &params->clip, &fmtcnv_state);
+	buf = le32buf_to_cpu(test, (__force const __le32 *)buf, dst_size / sizeof(u32));
 	KUNIT_EXPECT_MEMEQ(test, buf, result->expected, dst_size);
 }
 
-- 
2.50.0

