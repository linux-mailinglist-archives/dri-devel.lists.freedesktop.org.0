Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5412BFC71C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 16:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4B310E7B6;
	Wed, 22 Oct 2025 14:21:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RwQfn0mv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE0910E7B6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 14:21:35 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-47117f92e32so46783695e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 07:21:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761142893; x=1761747693; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
 b=RwQfn0mv1Cvxv7mJF/vN0MpnmYoIf5a4bvoP4bd4oXO5VVRDMvNjJx/IIxRDy2wHM4
 jM0dlV3aytm8KKp30/kOyswDztB5WBGTsbqJXNgDTBIuwdS40W4ZwvbI6OeTmb4vSWEq
 JT4Dh2SSjQgNduoefxhK0UFW/3KrVQQd7srav2D8ZFkcuw8dg6s0v738KCoiDd8dYiOi
 j12tDlkEXvRjmW2IkxVgPEcm1ZF2vo8b0Aad345jbZBOR4fF8arwU9ggjV1qr9iG/s6/
 nadOFv1x+URdT4c0aYD//XwZITWU+cbsllZWP9oaeeX9uiu6SNfI1LCE7/WPiWCScHAY
 UWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761142893; x=1761747693;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oNnZ9HXiG4U5oHkge6rfZLR0dPMVP9tD5A0n1Dg/8XI=;
 b=m4ExwVRB74ultHRGDmCEPYhTGf6wuWD6aDnLTALzmtqqO4x4hJhiWDCFQHkCzynvVt
 PBasRaoMz7/c97zBKGmKPAOSTeGwvPJj9Jri9fyIDNxaA/DEjFSBFeGgdgzSUb188dPI
 Ti4NH49wPgUN3YNKIr4gSwyiZS0JLnApL235S0LgwDPiabsX+YVCRCeNlGBt9YlqTE6I
 uszrtGjYwEZl469z4Ywqc61FvmUToLtUEK6wNzmui2PYcCyR0ZVoZJSPHzrI48jtv6bM
 kv1oHnBfE2oZHEfRD5cXSy4bPDMLBiie4g/4x9w1yscr1eHQu6nWPNYTnLbWPVla7NbI
 h5yg==
X-Gm-Message-State: AOJu0YyOWTSPClhfJm/hPg3LDgRMmH+R7UYLbrAJMPrthIQYPwWJiv4S
 CREFShtS55Hmp5j6jT8VPl5fEeHrg30wT5G6+v8qRwH6AAMA1n8Bk6a4
X-Gm-Gg: ASbGnctnQg4wj+RYUU9vK4VjtVCTUHSTBh5UZ3mJReZatS7aQ3pbFR8zZm0KW3QXA9I
 s8N5vVkBsXpsw3Nj2sDrxXF545POXp5dPn61r5ol+RQPVVymAnUCvbjrAwf2jg4ZP5G6VIMM1p2
 CoWTyP1kmlMwjl82aXT/rinYs/PwrQtwHE+kDb3mPj8trNVTWELbx62/r5hUyoc1MpkQlTH8s/n
 oiJIXypoKGe70WBINVZjQo5QZFvaYSsNGkOHIK8Lp5+U+05pm+TuGzB+NYiv7NhIxfssg5pQPmN
 YCrbZeY0Ytosm6lKuZZ/BChzlG7/T4QHXSfVotpZarGYKa2EG48tS4av47nY99O03iiQMLUfmuk
 l8MTTZiFXNpDbSCosRaYBE6Vcq7iB54Zbg0cNdgWo8Fg7n8FX2QlcoaB1cLak91mE09CL4+wPib
 hj3uPgGNjSzG3s
X-Google-Smtp-Source: AGHT+IEnXWlJDCOikv9Trvtrnq+YEjaVZ6eiwnQHVodVjHM0wnLfQoIbLbeHL/Nmsexg12AMq8heQQ==
X-Received: by 2002:a05:600c:518f:b0:46e:4a60:ea2c with SMTP id
 5b1f17b1804b1-47117925e1dmr162394545e9.37.1761142893340; 
 Wed, 22 Oct 2025 07:21:33 -0700 (PDT)
Received: from xeon.. ([188.163.112.61]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3d4csm24803518f8f.19.2025.10.22.07.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Oct 2025 07:21:32 -0700 (PDT)
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
Subject: [PATCH v5 06/23] staging: media: tegra-video: vi: adjust
 get_selection op check
Date: Wed, 22 Oct 2025 17:20:34 +0300
Message-ID: <20251022142051.70400-7-clamor95@gmail.com>
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

Get_selection operation may be implemented only for sink pad and may
return error code. Set try_crop to 0 instead of returning error.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/staging/media/tegra-video/vi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
index 7c44a3448588..856b7c18b551 100644
--- a/drivers/staging/media/tegra-video/vi.c
+++ b/drivers/staging/media/tegra-video/vi.c
@@ -476,15 +476,11 @@ static int __tegra_channel_try_format(struct tegra_vi_channel *chan,
 	fse.code = fmtinfo->code;
 	ret = v4l2_subdev_call(subdev, pad, enum_frame_size, sd_state, &fse);
 	if (ret) {
-		if (!v4l2_subdev_has_op(subdev, pad, get_selection)) {
+		if (!v4l2_subdev_has_op(subdev, pad, get_selection) ||
+		    v4l2_subdev_call(subdev, pad, get_selection, NULL, &sdsel)) {
 			try_crop->width = 0;
 			try_crop->height = 0;
 		} else {
-			ret = v4l2_subdev_call(subdev, pad, get_selection,
-					       NULL, &sdsel);
-			if (ret)
-				return -EINVAL;
-
 			try_crop->width = sdsel.r.width;
 			try_crop->height = sdsel.r.height;
 		}
-- 
2.48.1

