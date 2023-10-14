Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A420A7C931D
	for <lists+dri-devel@lfdr.de>; Sat, 14 Oct 2023 09:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C8D010E084;
	Sat, 14 Oct 2023 07:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA9310E066
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 07:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697267731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/5sur0d8z6Ch5nawEvWUvmJt66ioO3eas3zF7Y15+CY=;
 b=H0cIYoeQnICnuFtPlNHeZZkJzkrWIi7kwp2wRZkeeX7dtxfh4OdoUCgVSXwPxM3K24YJ7M
 Fqmkowt7heRfeAf4SEuCeE3BDik02egTR7/YPPFM2vY+Y1wp2R0gqp99aKTNBvxGaUZ1D3
 u8XLF0XZgL+GH3QHbF5jfF7gUjRGnlc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-259-_Uy2qmBQO0GWUzFe57UmNQ-1; Sat, 14 Oct 2023 03:15:28 -0400
X-MC-Unique: _Uy2qmBQO0GWUzFe57UmNQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3296bd73d91so1678092f8f.1
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Oct 2023 00:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697267725; x=1697872525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/5sur0d8z6Ch5nawEvWUvmJt66ioO3eas3zF7Y15+CY=;
 b=hWrPYuuZ1mm6pQAGDpLv4qdpSwm6jm0bjVQVg5DbbCLlLugZxLFCNQNKVclAwNM0Cz
 +StuDtXe9yzSfRqyg02nOQWhJaZ3jehN2URwzsaezOpEaJOIyMaJj5jaj1FoJ5jFiwtL
 NCe0AINLbNa458bT7ywO9bNwkOstBOeqPeJ6fSqkITuxFXzSzNXC6KTnV3h9oLmeByp2
 PFSMO5CIpAB4/MS9c4R4ErR18JoJP6nNikpr8xVQm5i1jwWzPnfTk8bL+9HXHF1zqIQ0
 28RjBAjoAfRuMJtAKiyBRGF4R2tzyY6aH5oH20WTXmShdjWBT4bRLif5LONWoUmg4PFF
 zZHA==
X-Gm-Message-State: AOJu0Yy6z6yFUBIEaEt6KNVsxLiVAeKEEJ0ldnglW/kXqIWuhJX8n4w+
 asHYGRDxro6mu+d5gnqS+VwJuBlrS9L1Ih9F0yIUMlatrqGaVjXpcfGUm7TjZJ/UDU0Kyud+ymK
 CCDqA+HaHNJ4VElS54orogD9HSd7s
X-Received: by 2002:adf:cc8a:0:b0:31a:d49a:38d with SMTP id
 p10-20020adfcc8a000000b0031ad49a038dmr25614657wrj.54.1697267725170; 
 Sat, 14 Oct 2023 00:15:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtx68sm77fSM2l+MPku3L9wgkn1CIXV77p6tOGdf1hWrtQhINmwCfG/IjzsrkVnrDfksdvNw==
X-Received: by 2002:adf:cc8a:0:b0:31a:d49a:38d with SMTP id
 p10-20020adfcc8a000000b0031ad49a038dmr25614629wrj.54.1697267724773; 
 Sat, 14 Oct 2023 00:15:24 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w15-20020a5d404f000000b0032da471c0c1sm866163wrp.7.2023.10.14.00.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Oct 2023 00:15:24 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/6] drm/solomon: Add support for the SSD132x controller
 family
Date: Sat, 14 Oct 2023 09:15:02 +0200
Message-ID: <20231014071520.1342189-1-javierm@redhat.com>
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

This is a v4 that just rebases on top of commit a48e2cc92835 ("drm/ssd130x:
Fix atomic_check for disabled planes"), that landed in drm-misc tree and
conflicts with this series.

It also fixes ssd132x_primary_plane_atomic_check(), using the same change
in the mentioned commit to fix the ssd132x_primary_plane_atomic_check()
callback function.

The patches were tested on a Waveshare SSD1327 display using glmark2-drm,
fbcon, fbtests and the retroarch emulator.

Patch #1 drops the .page_height field from the device info with a constant
because it's only needed by the SSD130x family and not the SSD132x family.

Patch #2 adds a per controller family id field to the device info data, to
allow the driver to support different Solomon display controller families.

Patch #3 renames some SSD130X_* commands that are shared by both families.

Patch #4 adds the support for the SSD132x controller family.

Patch #5 splits out some properties that are shared across both controller
families bindings and move them into a separate solomon,ssd-common schema.

Finally patch #6 adds a DT binding schema for the SSD132x controllers.

Best regards,
Javier

Changes in v4:
- Fix ssd132x_primary_plane_atomic_check() with the same change that commit
  48e2cc92835 ("drm/ssd130x: Fix atomic_check for disabled planes") did for
  the ssd130x_primary_plane_atomic_check() callback.
- Add Thomas Zimmermann's Acked-by tag to all the patches in the series.

Changes in v3:
- Drop the per controller family functions table (Thomas Zimmermann).
- Use different modesetting pipelines for chip families (Thomas Zimmermann).
- Change the i,j variables type to unsigned int (Geert Uytterhoeven).
- Fix "No newline at end of file" in solomon,ssd-common.yaml (Rob Herring).
- Add Rob Herring's Reviewed-by tag to patch #5.
- Add Rob Herring's Reviewed-by tag to patch #6.

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
  drm/ssd130x: Add a controller family id to the device info data
  drm/ssd130x: Rename commands that are shared across chip families
  drm/ssd130x: Add support for the SSD132x OLED controller family
  dt-bindings: display: Split common Solomon properties in their own
    schema
  dt-bindings: display: Add SSD132x OLED controllers

 .../bindings/display/solomon,ssd-common.yaml  |  42 ++
 .../bindings/display/solomon,ssd1307fb.yaml   |  28 +-
 .../bindings/display/solomon,ssd132x.yaml     |  89 +++
 MAINTAINERS                                   |   3 +-
 drivers/gpu/drm/solomon/Kconfig               |  12 +-
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |  18 +-
 drivers/gpu/drm/solomon/ssd130x-spi.c         |  27 +-
 drivers/gpu/drm/solomon/ssd130x.c             | 508 ++++++++++++++++--
 drivers/gpu/drm/solomon/ssd130x.h             |  17 +-
 9 files changed, 645 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd132x.yaml

-- 
2.41.0

