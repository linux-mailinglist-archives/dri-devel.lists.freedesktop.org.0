Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0797D8179DC
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:41:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2787B10E2C1;
	Mon, 18 Dec 2023 18:41:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278F810E370
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702924872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QgMgRDSHYmMiI0OrgNFQA61j2Lc6QloANV8tk9hWb9Q=;
 b=YPhAvY3+TTRs3/42Gk5fiYd8YcHqzUyMwile5EY6oklS7SbkckVHx6yDhv6pYrbobth86J
 CdtniRMadWf1URZhQBQk5n6UGFI2boVeRgiazeh987N8nfQb5ivJXBmGJxnf+1I/TjdQqw
 B5Ulbj+kz3lMfgwJXWyLcF2+nw7SoJs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-siY7vhS_PGeIKn44DCXEcA-1; Mon, 18 Dec 2023 08:21:26 -0500
X-MC-Unique: siY7vhS_PGeIKn44DCXEcA-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-332ee20a40fso1950428f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 05:21:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702905685; x=1703510485;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QgMgRDSHYmMiI0OrgNFQA61j2Lc6QloANV8tk9hWb9Q=;
 b=MxyhQN43KGEmURKxsJnT2z+YJVRZiOCRBWHgdYYFuDyQg3BQz2s/T2EYi741MyFIU9
 /EnuVxF/T7wKYjl/gEO9Gvz557/XkPYCQqjjztkpIVM2p83eRp6ZaJ+3quf5cnaPpQG8
 qect8PPFHHDrvLxlp8AS4CWJoDRBaCosT/SYNEL8fictu120RRksQLyvyfqYsDDJ2p/a
 skfKBfrxeCrQ8KDmhX6GNHS3n2vRDntKju21jPJa8jpCell+I73KnT2ZGS2wUuZ1FWxO
 A2ii8UddYE0Q3zJqmpC79vvFIaddKDArsg5rseVtWZVBsIzZ9ewKuZtZ1K0DS/ym874b
 eDFg==
X-Gm-Message-State: AOJu0YyO8aEeffSE1qmf7RmjkKq3PsL7UdY2gWI+WZqBZptUiGOMP+th
 3c4E9icf2dE92awQgatq6D0zTFTkdS7axDKzMbM/q89M3XCed6I3GWEOVfAJf78yNbhhOsZjdOy
 uUAhmAxTgaRTFb5vglmXp07i69ss5
X-Received: by 2002:a05:6000:ccf:b0:333:4c30:dae4 with SMTP id
 dq15-20020a0560000ccf00b003334c30dae4mr7208821wrb.45.1702905685129; 
 Mon, 18 Dec 2023 05:21:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeADstQsPMxdpXUY6VIcyZImy7z4H6FSe/tPLdOt2UZrsYef/bw1noI6ZXdZaCctcd3r5dsw==
X-Received: by 2002:a05:6000:ccf:b0:333:4c30:dae4 with SMTP id
 dq15-20020a0560000ccf00b003334c30dae4mr7208796wrb.45.1702905684680; 
 Mon, 18 Dec 2023 05:21:24 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 j4-20020adfea44000000b00336471bc7ffsm12370217wrn.109.2023.12.18.05.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 05:21:24 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] drm/solomon: Add support for the SSD133x controller
 family
Date: Mon, 18 Dec 2023 14:20:34 +0100
Message-ID: <20231218132045.2066576-1-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Conor Dooley <conor+dt@kernel.org>, Jocelyn Falempe <jfalempe@redhat.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, Conor Dooley <conor@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch-set adds support for the family of SSD133x Solomon controllers,
such as the SSD1331. These are used for RGB Dot Matrix OLED/PLED panels.

This is a v2 that addresses issues pointed out in v1:

https://lore.kernel.org/lkml/20231217100741.1943932-2-javierm@redhat.com/T/

The patches were tested on a Waveshare SSD1331 display using glmark2-drm,
fbcon, fbtests and the retroarch emulator.

Patch #1 adds a DT binding schema for the SSD133x controllers and patch #2
extends the ssd130x DRM driver to support the SSD133x controller family.

Best regards,
Javier

Changes in v2:
- Unconditionally set the width and height constraints (Conor Dooley).
- Fix indentation in the DTS examples (Krzysztof Kozlowski).

Javier Martinez Canillas (2):
  dt-bindings: display: Add SSD133x OLED controllers
  drm/ssd130x: Add support for the SSD133x OLED controller family

 .../bindings/display/solomon,ssd133x.yaml     |  57 +++
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |   5 +
 drivers/gpu/drm/solomon/ssd130x-spi.c         |   7 +
 drivers/gpu/drm/solomon/ssd130x.c             | 370 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.h             |   5 +-
 5 files changed, 443 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

-- 
2.43.0

