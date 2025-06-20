Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE9AAE18E9
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jun 2025 12:31:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF28D10EB3C;
	Fri, 20 Jun 2025 10:31:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="5oGWyeSA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4260410E217
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 10:31:35 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-adb5cb6d8f1so265748666b.3
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jun 2025 03:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1750415494; x=1751020294; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1muw2blYzxaHAsDZg3IXNPfcSbqmSvh2KRGWNScsj00=;
 b=5oGWyeSAp7bB32VWYbkfiK86hqbcjnm4S18Ak3HiDIEa1JtbsIyiINlYGBIQxTZqVD
 UFlaOG7RjvM5wuH3SG+tpGcO8Ddqk6pfYnVzEKlLSpdzYPnSsXd2WGWkrG3wPhcVSrUZ
 b3zZIvpHf0lbEu83CLTCRJUV5j+QQvWcN6aImSSBDSVniPM38iXREsSOJeAynQq51us3
 i2/RgMxM4y/o7zRDU4m9fANHEyDAvUGgYpNEIhjB7OlHOu9PS6UzzL6spelsHOLBWj3c
 ceaeHrhB0UIGbIL0agw8HCu1mvkDMUQgQ+1WYG2EumvIznICSM3L6KkM7SyPtw3wFp9T
 ga5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750415494; x=1751020294;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1muw2blYzxaHAsDZg3IXNPfcSbqmSvh2KRGWNScsj00=;
 b=nAKFFFBKzF00MH4P7PxEJfUvsdUqPd+geL3XO28kLAscaMO0IJPdXBVzEKTyTbpvmx
 +95KK1qYSqoXYz1ac6EPLXVkBnUAB0QC3Zl1yAai4xUXz4FNxlNXJnWMnIZbqrjWDXP3
 8XMAGtCMPtG4x9Ip6Jv+urpSk8wk0+CfzQSF3wqCHWl0SjZa5EGLHf1hAoFIafnmI864
 Fkv0ELbzaabroupYlEm4c73SRAumWHtM3GRJ49fUnSoOEVSypETTKUbLnqylxtwrf/jU
 UE8N9qzwISjR0BqBWKFz5tBOQx/TEKI/229JAPwhl5fJJpzzBGUazfzFgXpLG9mfU/2i
 7aHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV59Vp30AdomZ08bmhYIfm8rsfmnbFKduUsfcfueU+JhLgmNkb6sAoaQvjO0F/9+ihmFFeRZLm68qw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7imjoCCYZUgXfO+ZvVsaQGKtVGHFuuAMhIGSSC2wft6BfmPjb
 EhB8nTEEAQJnN0xkkRT0g8RFt5Icg8VzNweG59t+984Mkv6QgafU5+RWXO+C5fOlTjY=
X-Gm-Gg: ASbGncvHIH4IJDvAGJxxZxJKpZmVWX/PRiIAuLjq5yWreAm22DAHModnuwrxgSqcB/a
 a0K1Hc5ywqynEbAj3JkXOhDaMCK8YR9hQZT0XSZshFW86peHm8q2Thv2i9kWxl06v+RRBx804kT
 oMZ6jbmHp8eys0FhWsZNbF4NI1iWvNOsPdzIedX0v+wi9qUOvrRkyuCrB9Ql8RwkCRmbo45uGsE
 7C9A14PTKMboC8dvO2/h/TPbX+u9wRmhpYZB635ZUCjgnD/cQPAOzfGtwt28c3r/BSfxhlJxD/z
 LJTAigd9eru38oMShKi9nqYfkqX5vrG4m6buDBdEaI2z9Zte2zxpWnBqX/ZDBfTkWt+f/VeUmPn
 mmwlJugqQEXM3/mykWgH8TjRpiL/wCur7
X-Google-Smtp-Source: AGHT+IHoDGaWZ5BrbMFRiOuhEj2IF/mLQzBgFpihvoZBrr7fr3ArCX7v7z9d95MM7gVJZXVieJjUCw==
X-Received: by 2002:a17:907:97cd:b0:adf:f8f4:2001 with SMTP id
 a640c23a62f3a-ae057bf6566mr224474466b.49.1750415493718; 
 Fri, 20 Jun 2025 03:31:33 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl.
 [144.178.202.138]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ae0541b6f5csm138047366b.122.2025.06.20.03.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 03:31:33 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH 0/3] Add interconnent support for simpledrm/simplefb
Date: Fri, 20 Jun 2025 12:31:24 +0200
Message-Id: <20250620-simple-drm-fb-icc-v1-0-d92142e8f74f@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHw4VWgC/x3MTQqAIBBA4avErBtIS8uuEi3KxhroRxQikO6et
 PwW7yWIFJgi9EWCQDdHvs4MURZgt+lcCXnJBllJVWnRYuTD74RLONDNyNZiZxotrFLGiBpy5wM
 5fv7nML7vB1pWCE9jAAAA
X-Change-ID: 20250617-simple-drm-fb-icc-89461c559913
To: Hans de Goede <hdegoede@redhat.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750415493; l=929;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=g/vzD+cOWNqqj2T/TniSFBbEUCUdsEigkFpQHb857BU=;
 b=9cYc3EXbQ33AMBFKnPLXHwMs1U5skgQNdQEyFJ2oPbg7cPoKkn78i6p8FdCpi4ycoC0PtPnwr
 xSeaoEOjEGfB4uj+AatP1PQpE65PFg2JOldcgkg62kv7/usFdeh7zaK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=
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

Some devices might require keeping an interconnect path alive so that
the framebuffer continues working. Add support for that by setting the
bandwidth requirements appropriately for all provided interconnect
paths.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Luca Weiss (3):
      dt-bindings: display: simple-framebuffer: Add interconnects property
      drm/sysfb: simpledrm: Add support for interconnect paths
      fbdev/simplefb: Add support for interconnect paths

 .../bindings/display/simple-framebuffer.yaml       |  3 +
 drivers/gpu/drm/sysfb/simpledrm.c                  | 83 ++++++++++++++++++++++
 drivers/video/fbdev/simplefb.c                     | 83 ++++++++++++++++++++++
 3 files changed, 169 insertions(+)
---
base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
change-id: 20250617-simple-drm-fb-icc-89461c559913

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

