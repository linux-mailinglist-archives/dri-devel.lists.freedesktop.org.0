Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D6B69D628
	for <lists+dri-devel@lfdr.de>; Mon, 20 Feb 2023 23:10:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C1D10E7CE;
	Mon, 20 Feb 2023 22:10:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8521C10E7CE
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 22:10:42 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id nv15so2856401qvb.7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Feb 2023 14:10:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=criticallink.com; s=google;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5rUU2/WZPr1JSZcAGB+y8Up7AbNA2zdWucg2WvW8jfg=;
 b=ndmMC5E2WlVJtkOA7NBSDcv+bwnm+YJCJpv9A0s0b7bSZlCm/158TU2tdJw2Ere1y/
 pRnqb0dIqn9dkyO89wFGFocwSxfz9+w//ql+ElqVlBjKZpA7Gb6+EPHTFzLcdN53faah
 +WOeD9QVcXNR8E2WRVSef7tP8K+wvfcDAKMm9i4TdaKgzjlrkZa8Ntnt8atmwxxdTOZx
 QBTSKDZyPaoimeJzhmJUnxWKuNzSo7JRcEXmay09aJdg+lUYdpgcVz1rIdZkelEG8BKh
 nwXmsHNVfVoNL2WVUW1naJasMPy7cGlGW8b2NTU9rOB+ErFrWV3kLMfPN2Mwoa4gWfXd
 Bw5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5rUU2/WZPr1JSZcAGB+y8Up7AbNA2zdWucg2WvW8jfg=;
 b=qtbxjR1PKMGHqGZRMwM1S2RXKuMn3jJ9kFFvK5iaPpFf6o1JxRTlHN00npLU9jypOj
 wgRlRnCZFoojRFws0f5Jcbikafte3lVojMTOEi+6Yki5rt2VE98UZ1PPOcCzyHxfIflq
 LVh87teWZGBKK9ZxWCD32Nqy7pC+x2JCVlDysX52X5CaUw7Nxk8ifooZO2KT6oGGUvP/
 m8i0UzdnOUvixPIczoqvULtMtt3Yp/MYcVD2IXwFkWA8yGbL6qfYWLHQb6vd9n9Cntuq
 j8hvZfAxtInemGEaHuPiWarjkcrf6QlNZI32DBx5sTUTX5SzKeK0uWCXvMXwGsE+9QAD
 soPg==
X-Gm-Message-State: AO0yUKUoe3CwSl3+Ke+qUnOlldr+QTAhruiPIoFE22bbz3k+AWKV44XO
 rrbribBn0a4WHmpAQUmac7cxjlbcf63MxwRegN4=
X-Google-Smtp-Source: AK7set9SpTOHwG3ln7LMUjQ7Kgg+kixZ9alJTQWygn2FivXxoL8RZDAN6fAmeLdThIpI5DNSqTF/ew==
X-Received: by 2002:a05:6214:240d:b0:56e:96bf:9d57 with SMTP id
 fv13-20020a056214240d00b0056e96bf9d57mr3736930qvb.41.1676931041264; 
 Mon, 20 Feb 2023 14:10:41 -0800 (PST)
Received: from [127.0.1.1] (static-72-90-70-109.syrcny.fios.verizon.net.
 [72.90.70.109]) by smtp.gmail.com with ESMTPSA id
 q13-20020a05620a024d00b006f9ddaaf01esm9766986qkn.102.2023.02.20.14.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 14:10:40 -0800 (PST)
From: Jonathan Cormier <jcormier@criticallink.com>
Subject: [PATCH v3 0/3] drm/bridge: tfp410: Add i2c support
Date: Mon, 20 Feb 2023 17:10:32 -0500
Message-Id: <20230125-tfp410_i2c-v3-0-a85d5f0f50f1@criticallink.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANjv82MC/3WOQQ6CMBBFr0K6tqZMK0RX3sMY0papTEQgLTYYw
 t0tuMXl/5n3/swsoCcM7JLNzGOkQH2XgjxkzDa6eyCnOmUGAqTI4cRHN6hcVASWSwOlMMI4iYI
 lwOiA3Hjd2WZFWureU/XSYURf/bD1avDoaNomb/eUGwpj7z/bBzFf292xmHPBi0KrWqE8C1Ner
 aeRrG7TzvNo+xdbbRH+GyAZjANwqrbGot4xLMvyBTt2W8UTAQAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1463;
 i=jcormier@criticallink.com; h=from:subject:message-id;
 bh=F4ePDp9YQlDEPYMwJJxpcbg51wbahBLtQAl5HlBYoro=;
 b=owEBbQKS/ZANAwAKAdzX/S4LNuuqAcsmYgBj8+/foopW0wA1O42qAG7Zp+D4ICNsSp7resI12r28
 H9NYMGGJAjMEAAEKAB0WIQT/MozqCeZtYxNnVN/c1/0uCzbrqgUCY/Pv3wAKCRDc1/0uCzbrqhzsD/
 0Q9eJEEV/igPPF+WONF9jTbpcj7hdIGDyln5FjGZZHNDTsYpzts9rt26k34cb8KudXJSr8jsn9HzNw
 aV1c9+DzjrXXe5DXNQTIa5tzdrKSzUdM9tP9BpS/BAp5Cx56HNwTymcQkZ/1VtPyOis4Ea7l0Cq2bg
 wZpdke7cAhuXBh7lvaFsjuAo+wFVx5pFasRcev6A4WvG9Ydzvmw5FHmUq6S0Sod1HTe5S0Na3MqvtO
 ZEJP/vRYAnEOraA9HZVaF0W0UgUVohe/ijlPJ+oAr7uARX4Ru4IzP+7eL5ncW4ZRzTgHzM3suvZuv3
 OPDkC7Jsb5m4Rx8MRe6XSvSCG6Rq2BkJ9q2pM4Rc6ki2b/BDHeHuzZo4GCEbiQWyYe3ho+r7dtD4pF
 +dRS+N+2doef3iuqX2Jt0Kcc+QjBMHuvQauzZi3qQ0EQwqs2tRewn0p1UcZjygk3Oj0fym7ztx0lU/
 H0ZNP3vfStA0Vh7uje01v/Zm36Jjkx9m1fC2+Kym0Rg4EcF+8Aqsy0w4m9dm4sGpxs9Wu9VNzigTMD
 ReIv88GOsHfGDhrE02QqbfZJiPhc8fBHFmnoYgQ/8cw3hDe0qBH4h7kg7Nyk1fJPOtNvWmtkOHXdVr
 fJdvYJibg35Nf+pezTCFOgGiIjDRrjl6ewnEmEVMFZfWxzgQk3+bwk5jwUfw==
X-Developer-Key: i=jcormier@criticallink.com; a=openpgp;
 fpr=FF328CEA09E66D63136754DFDCD7FD2E0B36EBAA
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
Cc: Jonathan Cormier <jcormier@criticallink.com>, devicetree@vger.kernel.org,
 Bob Duke <bduke@criticallink.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Michael Williamson <michael.williamson@criticallink.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TFP410 driver does not support I2C.  As such, the device remains in
Power Down if the I2C is enabled by the bootstrap pins.

Add basic support for the I2C interface, and provide support to take
the device out of power down when enabled.  Also read the bootstrap mode
pins via the CTL_1_MODE register when using the I2C bus.

Also allow polling device to support hdmi/dvi hotplug detection.

Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
---
Changes in v3:
- Drop dt-bindings i2c example
- Link to v2: https://lore.kernel.org/r/20230125-tfp410_i2c-v2-0-bf22f4dcbcea@criticallink.com

Changes in v2:
- Fix dt_binding_check errors
- Remove hdmi connector from binding example
- Fix compile warning. Unused variable and unsigned int instead of int for ret
- Fix commit titles
- Drop of_match_ptr change
- Link to v1: https://lore.kernel.org/r/20230125-tfp410_i2c-v1-0-66a4d4e390b7@criticallink.com

---
Michael Williamson (3):
      drm/bridge: tfp410: Support basic I2C interface
      drm/bridge: tfp410: Fix logic to configured polled HPD
      drm/bridge: tfp410: If connected, use I2C for polled HPD status.

 drivers/gpu/drm/bridge/ti-tfp410.c | 107 +++++++++++++++++++++++++++----------
 1 file changed, 80 insertions(+), 27 deletions(-)
---
base-commit: 93f875a8526a291005e7f38478079526c843cbec
change-id: 20230125-tfp410_i2c-3b270b0bf3e0

Best regards,
-- 
Jonathan Cormier <jcormier@criticallink.com>

