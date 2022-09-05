Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605675AD792
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 18:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6993D10E45D;
	Mon,  5 Sep 2022 16:33:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDE510E45A
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 16:33:17 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id y3so18152958ejc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 09:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=R/yzLKhstrQ0xuNqdI7CQxffVFlTJqRQoTH/xpLP5OU=;
 b=HDUsN9A3LfTPf3YIRADcz2R0FithZkh3c41sWO7FC9dkLdUOH+ieYkK6U96fbkzQtW
 D+zsGdXNM/YcdTCyx1Bo5ComQeLzLAgEa7B9uZHR/qLJZx34wOipzJSWxfDKKeucEGSp
 M+Tkb93JL4QbVjIQR+KtQNeK3MXyJwEivUiTPXQU7roBJR4fkKbyfTk1VT/D63yl1pF4
 6B0Barl6ZVHJaZmDk33Ne344y31J6t57Q7bMphWvn5u9qOb3/81Oia63CV+o+57rljx6
 pihUEfecNDlNJbQvuOVsnQuFprgjw0S6aNirRzFbrRYxh0C4vhTAMo8Cq//uGsXQzzde
 vSJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=R/yzLKhstrQ0xuNqdI7CQxffVFlTJqRQoTH/xpLP5OU=;
 b=bnhT090zm+lpL6IqLCiMlvxpl732eEk6vUQFMie+/CBboez0noKxzjsjH2oUAdKhU8
 4qefJAmm2ErQMvmwBsOmbs3XYXWZKigPOBU+6wsKHJAdMMBm0KYzh9EdhrlsRzHZ8bGR
 MxlJ66gVZuxQ6Ol84g8XeDtkfOrT2wLZaeVasKMfRoNTLi7dpmoZZFIZCP49blN7FaOO
 5ViVp/ajRJ4Xh9dXYKtIl3c9e+GUn/GWGEaQM6ZfKoyVr8C9j6uY4iEVloZYXhJz96yy
 909biQnwhA4nHCTtVIF+6mkx2kFnR5dBgjRvQeErCald1aPFIymGy94UH80p+GvmkR82
 JFMg==
X-Gm-Message-State: ACgBeo2F+xrWLntp9lK9aF/4O4k1z768ybpxZBoE8E5hQ63mkO5CiJcC
 FWGojwD50SxkM/lBot3jG8Q=
X-Google-Smtp-Source: AA6agR5BBZuXs7pXLimDyLExSj1si+XQzJdO7LmmaCvaRyKgfPjpIyndggLcnlfhtm/jHZRjYtcEhw==
X-Received: by 2002:a17:907:980f:b0:73d:8e27:7779 with SMTP id
 ji15-20020a170907980f00b0073d8e277779mr37852958ejc.205.1662395596077; 
 Mon, 05 Sep 2022 09:33:16 -0700 (PDT)
Received: from localhost
 (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 er20-20020a056402449400b0044d6c6a5b5fsm4263709edb.89.2022.09.05.09.33.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 09:33:15 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 5/6] drm/simpledrm: Support the AB24 format
Date: Mon,  5 Sep 2022 18:32:59 +0200
Message-Id: <20220905163300.391692-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905163300.391692-1-thierry.reding@gmail.com>
References: <20220905163300.391692-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

Add AB24 to the list of supported formats. The format helpers support
conversion to that format and it is documented in the simple-framebuffer
device tree bindings.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tiny/simpledrm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 16377b39f012..7829a12ba3dd 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -563,6 +563,7 @@ static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 static const uint32_t simpledrm_primary_plane_formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
 	DRM_FORMAT_RGB565,
 	//DRM_FORMAT_XRGB1555,
 	//DRM_FORMAT_ARGB1555,
-- 
2.37.2

