Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B217C78B5
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 23:39:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C885810E55E;
	Thu, 12 Oct 2023 21:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99FA610E555
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 21:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697146757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=4HjQ38FaqAqOPBHqQYuQ0KM6yn2TAQcFHI6s0KVsEyk=;
 b=dyRMQmtHEGXXQCorv3G6PnXosv9BOaeO3c+Qz3ra/s7+M1K8399Bj4JWGy2F8G+bz0NFuX
 SW6q7NJTRhWss1lXdnKmiS0oZw8WVRC4TWcp735oHBPaw+Myg4WZWx+7sjlMOvEA84TcxR
 UP0zoUmnr6jIOvDE3o+j/iz2km2Yq5I=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-p03LZsEtMTuZPGCaF_8hGA-1; Thu, 12 Oct 2023 17:39:06 -0400
X-MC-Unique: p03LZsEtMTuZPGCaF_8hGA-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4074f9d17a5so9884415e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 14:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697146745; x=1697751545;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4HjQ38FaqAqOPBHqQYuQ0KM6yn2TAQcFHI6s0KVsEyk=;
 b=wBgQornkVG49LpWTQ9YHVG0x4lKTRdkUpnI4cZ24cMKJc7A6UjdLo7yzu961gAS6MO
 gBw6a6AmMeSqg49kaG481nDF+zL1XCEGG1PzkfvGtUBdEUpVC4Pgc8Xb0dqK2Iauc6PH
 5LipBxDj9Q3TjWKf+keO9BfnjcawJ/SIqsm1FHzJO1c1KEGcCMt6hZhB0lyLmCvJwAuy
 e+Nh4Gqstl+ibew9dtBrJAtWS5KO8JmMiG13o9FEiADE5YGyfmFotJvclVUYDgvDNmR7
 idOiI5FKlaRCUe647C0k7GCCZ4oj6ptvVwjXrMBTdGp++bY3iGQ781SqlzbGo7r+J//I
 x7jg==
X-Gm-Message-State: AOJu0Ywyf/eZc8vwG3iuxJxJqps9iEsvhCYP+JOH5lsC3fe3rGEQmt34
 ZO7AqC14aIxJMQP9OG59IPRDwoIUzq3vfNEiU6vz++Kd9xX6kdEIK/UOPvxkpZIc03fYbl2YZjp
 de2lJFm6pU9QQ9cjZyMTpqX9/FS/V
X-Received: by 2002:a1c:7419:0:b0:405:7b92:453e with SMTP id
 p25-20020a1c7419000000b004057b92453emr22304324wmc.37.1697146744737; 
 Thu, 12 Oct 2023 14:39:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFId6vEUm6lLY12c7Khxf6C447HYWMwZjfxbHOw/t6gc3FOvk/WHTGkr1lL9jQkvffet2nE3g==
X-Received: by 2002:a1c:7419:0:b0:405:7b92:453e with SMTP id
 p25-20020a1c7419000000b004057b92453emr22304296wmc.37.1697146744355; 
 Thu, 12 Oct 2023 14:39:04 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g9-20020a7bc4c9000000b00405959469afsm822140wmk.3.2023.10.12.14.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 14:39:03 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] drm/solomon: Add support for the SSD132x controller
 family
Date: Thu, 12 Oct 2023 23:38:30 +0200
Message-ID: <20231012213843.1151060-1-javierm@redhat.com>
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
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch-set adds support for the family of SSD132x Solomon controllers,
such as the SSD1322, SSD1325 and SSD1327 chips. These are used for 16 Gray
Scale Dot Matrix OLED panels.

This is a v3 that address issues pointed out during review of the v2:

https://lists.freedesktop.org/archives/dri-devel/2023-October/426448.html

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
 drivers/gpu/drm/solomon/ssd130x.c             | 507 ++++++++++++++++--
 drivers/gpu/drm/solomon/ssd130x.h             |  17 +-
 9 files changed, 644 insertions(+), 99 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd132x.yaml

-- 
2.41.0

