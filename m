Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C6C00F71
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 14:05:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E140810E3E5;
	Thu, 23 Oct 2025 12:05:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qV0epkhL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com
 [209.85.208.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83AA10E3E5
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 12:05:12 +0000 (UTC)
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-378d50e1c82so8132321fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Oct 2025 05:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761221111; x=1761825911; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BoEX23xd/nGNP6bsxFTl8PssrTkiP0VDDAlBt1h+gv4=;
 b=qV0epkhLR9GxeBD//dbK7WpOlOJJYtbF/MrOlcnF4s38yamRQN1bSLOj6K7Jq64BVR
 pDJ7e36x7HteCcwJAl5DeY9tx5F/Mrr8v1DLx2IMuoWZAOJIEr9B0pGBF1Z2+4YNgJm0
 BLJZoVSW+ZCkCzBJWSePKO1rr+XnP6qzBB1deqfbAjj+vi/MO4GUe5MEP06EMTRmD9G8
 NS8bLtjG2Sdu/JM5GSzHbnzmEJqPQyIjgxGmeG49YICt+Ocy6+gSeqtbC1FRPolfcpRR
 6eLcyJYIXhpRHIPytNzeEkFcyocZDwNI2f/HDRX1jadjnnCius5g9pMXR4cu/8UAf6qK
 Fe4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761221111; x=1761825911;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BoEX23xd/nGNP6bsxFTl8PssrTkiP0VDDAlBt1h+gv4=;
 b=YRIqB2kjQtUkR7tagkM1c6Fw2AlgElXubq2eo+ZLc34aJawrEUJ+cqsaGe9AouaTvK
 FDTC77ABUWFBSpq7hMOtc5/FgrJ7D88vVwl64/21quF3Yb1YZx7IEEHiyT3Z6QbtCZxq
 GRlat+aJg1GGuslN1e4t92j4DmlXCwlCUO/BocvIlkh3+1SEa/CIcRXUtjsGZd3mGE1v
 GJ4vz6tAm6rPklsZADRhtMQLb1LgMAgHYZ2bZicmm0WuGjLcW+dMKi3HUumqPMCnhJ6o
 519aU08ibF74fiitgcyfAmgAo7jSrmhgZBB+vPXnoxKjC7JJKLE1vklNUSwFrjbZ8Lph
 dAKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVyHcB7sLvRvdTajC4VwpbWNd/c3sHY2dzj7WMrI55Iaoyv7HFSwyj+EfFx1gJX+qP9NmU5KOdzViI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzVIheMK643vTym/fFTAxNHa3FfF77X/fAUF80rM+nXlmdoxXhh
 1ImSdnP8suKRPC1PuOIDSL97RJ1fEaYV2zm6+s5Q8tv7KgXk9mq3j2FvKxPrCgS9+gI=
X-Gm-Gg: ASbGnctIybdHkjiCs/J6WrPPMmndLVF2PYQNw3ZivP7lFS4KpKGlSzES6OOFJz7QDoH
 sbqi4d+ur2OhqK1qz36O/Ehm+ycQoiGZLDFTMgClulS5gxLuseagALGNgggCheCl9XD2mkTCYpG
 iAzs0aXE1bGuJNu1TieKfA/HfIe33q4uKdIRgKeiySdvrpDGXtxFLzFY1luS6QjMXeHfMJWMU+o
 zZ9Y+PvBZcSRjBhCW+pIGwFo4aL7t/ynJGNeDMuY+Gw1oo4fzSsKFyJcVOBC5dV20C0HNDsbpUm
 SS6s7BInk47NE+lhd0u74Om6izN/ylg7/rTjdYL3CtOF51tDdjdG7K+2a1Sj3hdxSoazGDsjAKQ
 7GYAXj9m3mPP823gjCv/EokjpELnrz56inwf4NS/O2wb0Sj1PnF0jccTGSO+adPzfOQvUFHlqbG
 R6+2E4cdPvvyn1TmoG5XzsY5rtRrrRSXq9JmMJrU9doHa/
X-Google-Smtp-Source: AGHT+IFYLbhLjOY2LMBy7lXUJqenzjQosnzEM8MW3QWTj8JugrqDJBsjM/ACbE4M/KUmHk97UAP8Nw==
X-Received: by 2002:a05:651c:901:b0:36b:698b:1f00 with SMTP id
 38308e7fff4ca-37797815b55mr69910171fa.6.1761221110718; 
 Thu, 23 Oct 2025 05:05:10 -0700 (PDT)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d680322dsm4070701fa.47.2025.10.23.05.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 05:05:10 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/4] drm: panel: Fix atomic helper-induced regressions
Date: Thu, 23 Oct 2025 14:05:08 +0200
Message-Id: <20251023-fix-mcde-drm-regression-v1-0-ed9a925db8c7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MzQqEMAwGX6XkvIE2sAf3VRYP3fRbzcEfUhBBf
 Herx4GZOajCDZU+4SDHZtWWuUF6BdIxzwPYSmOSKO8URfhvO09awMUndgyOejesXdaoKvGXQa1
 eHU19zt/+PC+uwVdVaQAAAA==
X-Change-ID: 20251022-fix-mcde-drm-regression-c9ac0cc20bae
To: Aradhya Bhatia <a-bhatia1@ti.com>, 
 Stefan Hansson <newbyte@postmarketos.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org
Cc: Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks.

As the CRTC is no longer online at bridge_pre_enable()
and gone at brige_post_disable() which maps to the panel
bridge .prepare()/.unprepare() callbacks, any CRTC that
enable/disable the DSI transmitter in it's enable/disable
callbacks will be unable to send any DSI commands in the
.prepare() and .unprepare() callbacks.

This is also evident from device trees with the DSI
inside the CRTC such as this:

mcde@a0350000 {
   status = "okay";
   pinctrl-names = "default";
   pinctrl-0 = <&dsi_default_mode>;

   dsi@a0351000 {
     panel {
       compatible = "hydis,hva40wv1", "novatek,nt35510";
       reg = <0>;
       vdd-supply = <&ab8500_ldo_aux4_reg>;
       vddi-supply = <&ab8500_ldo_aux6_reg>;
    };
  };
};

The panel is inside the DSI which is inside the CRTC
(MCDE).

This is in a way natural, so let's just fix it in all
affected panel drivers that I know of and can test.
Mostly Ux500 phones, and only those with the display
directly on DSI (not e.g. using DPI and SPI).

Other panel drivers may be affected.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (4):
      drm: panel: nt355510: Move DSI commands to enable/disable
      drm: panel: s6d16d0: Move DSI commands to enable/disable
      drm: panel: nt35560: Move DSI commands to enable/disable
      drm: panel: s6e63m0: Move DSI commands to enable/disable

 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 24 ++++++++++++------
 drivers/gpu/drm/panel/panel-novatek-nt35560.c | 24 ++++++++++++------
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 35 ++++++++++++---------------
 drivers/gpu/drm/panel/panel-samsung-s6e63m0.c | 31 +++++++++---------------
 4 files changed, 61 insertions(+), 53 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251022-fix-mcde-drm-regression-c9ac0cc20bae

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

