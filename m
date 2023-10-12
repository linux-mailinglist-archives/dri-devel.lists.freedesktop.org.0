Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 531BD7C65F4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 08:58:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1567010E419;
	Thu, 12 Oct 2023 06:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF3610E00C
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 06:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697093911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gQEDK0zRsxdao/USWhxq2/eyquvh3FKOLJOV9l+xrLE=;
 b=G+XgY0Ux1twQhdzYX/jtN4CJ3P5he3mlcftSIT/XQadZpAj+9D0hye4LZleM9X+bhhyvUj
 wZ/uq2JP9dFOLpajKWQ7/9W/+ei2B2illDZrgbJdQbS9e+JTckwTDZBurIB+MIy60kdXjp
 frs/1I8Ty0Js03I0cNc67/mI5O5JcDw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-365-qhMEX-xVOWejiE6Kip6V7w-1; Thu, 12 Oct 2023 02:58:27 -0400
X-MC-Unique: qhMEX-xVOWejiE6Kip6V7w-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3231fceb811so405121f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 23:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697093906; x=1697698706;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gQEDK0zRsxdao/USWhxq2/eyquvh3FKOLJOV9l+xrLE=;
 b=LWi2Qy8m1Esr2yaR2kh7aRi7xdhALpr8TLqczu40ha/zcwbDgf+05wWZ9F7bIU+yXk
 AjeQ4yg7koREx+hFFrfEIRogFX9dlDKPnP469KuGKhJKP0Jbvu9sNDmNcTJPmuWB2EQP
 GYtQFM69/j0xDtNlfEkvUb+7cRT61TyQToHxmaKtKgK+a3sbKxzTaDuNhzI7+XBKgGlp
 IjdLuS0i+lW4LJyZekw22OSYjBThyd5hnXGLkLUJB5ufbELJjAiQWvLUw7gEuIFT4cJs
 waa1RQdqpb8NForGm035b8b2R5ubIvsShdcSymtEDOAlvFFaYjhV7hqQ0rHfb71ebIWa
 wY6g==
X-Gm-Message-State: AOJu0Yyd5JqgpGmkggxK9IjQNQtc5rI0vW/WIhGkm+zTBP4o+mg8A/JJ
 BdyvQOdlqO+jrfBqTOPdVdpKy2knmaHpYMzanpFiuT7t1g4CiBWXQ8U10P0f/2FT3pNcp51g9hn
 Hhbyl+lClzFgNm4cVSmTk0UE/276i
X-Received: by 2002:adf:cc8b:0:b0:313:f463:9d40 with SMTP id
 p11-20020adfcc8b000000b00313f4639d40mr18345671wrj.65.1697093906342; 
 Wed, 11 Oct 2023 23:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzNihkYzTu2tJnnUcYJA6WaMhrtpm35B3hFdl4wrfrsDprJD4URFLUpjs1H44prEQ12HB8DA==
X-Received: by 2002:adf:cc8b:0:b0:313:f463:9d40 with SMTP id
 p11-20020adfcc8b000000b00313f4639d40mr18345648wrj.65.1697093905990; 
 Wed, 11 Oct 2023 23:58:25 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q15-20020a5d574f000000b00323384e04e8sm17393266wrw.111.2023.10.11.23.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 23:58:25 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/6] drm/solomon: Add support for the SSD132x controller
 family
Date: Thu, 12 Oct 2023 08:58:09 +0200
Message-ID: <20231012065822.1007930-1-javierm@redhat.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch-set adds support for the family of SSD132x Solomon controllers,
such as the SSD1322, SSD1325 and SSD1327 chips. These are used for 16 Gray
Scale Dot Matrix OLED panels.

This is a v2 that address issues pointed out during review of the v1:

https://lists.freedesktop.org/archives/dri-devel/2023-October/426039.html

The patches were tested on a Waveshare SSD1327 display using glmark2-drm,
fbcon, fbtests and the retroarch emulator.

Patch #1 drops the .page_height field from the device info with a constant
because it's only needed by the SSD130x family and not the SSD132x family.

Patch #2 adds a per controller family functions table to have logic that
could be shared by both SSD130x and SSD132x callbacks.

Patch #3 renames some SSD130X_* commands that are shared by both families.

Patch #4 adds the support for the SSD132x controller family.

Patch #5 splits out some properties that are shared across both controller
families bindings and move them into a separate solomon,ssd-common schema.

Finally patch #6 adds a DT binding schema for the SSD132x controllers.

Best regards,
Javier

Changes in v2:
- Add Geert Uytterhoeven's Reviewed-by tag to patch #1.
- Squash patch that uses drm_format_info_min_pitch() to calculate dest_pitch
  with the following patch (Geert Uytterhoeven).
- Store ssd13xx_family_funcs[SSD130X_FAMILY] in struct ssd130x_deviceinfo
  (Geert Uytterhoeven).
- Don't mix switch (family_id) and ssd13xx_funcs[family_id] (Geert Uytterhoeven).
- Replace switch (family_id) by an .set_buffer_sizes (Geert Uytterhoeven).
- Move the rect alignment to a per chip family function (Geert Uytterhoeven).
- Align the rectangle to the segment width (Geert Uytterhoeven).
- Drop patches that rename driver and prefixes (Maxime Ripard, Peter Robinson).
- Remove unnecessary 'oneOf' in the SSD132x DT binding schema (Conor Dooley).
- Remove unused DT nodes labels in the binding schema examples (Conor Dooley).
- Split out common Solomon properties into a separate schema (Rob Herring).

Javier Martinez Canillas (6):
  drm/ssd130x: Replace .page_height field in device info with a constant
  drm/ssd130x: Add a per controller family functions table
  drm/ssd130x: Rename commands that are shared across chip families
  drm/ssd130x: Add support for the SSD132x OLED controller family
  dt-bindings: display: Split common Solomon properties in their own
    schema
  dt-bindings: display: Add SSD132x OLED controllers

 .../bindings/display/solomon,ssd-common.yaml  |  42 ++
 .../bindings/display/solomon,ssd1307fb.yaml   |  28 +-
 .../bindings/display/solomon,ssd132x.yaml     |  89 ++++
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/solomon/Kconfig               |  12 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |  18 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c         |  27 +-
 drivers/gpu/drm/solomon/ssd130x.c             | 405 +++++++++++++++---
 drivers/gpu/drm/solomon/ssd130x.h             |  33 +-
 9 files changed, 552 insertions(+), 105 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd132x.yaml

-- 
2.41.0

