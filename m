Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F4F817A73
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 20:00:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343810E3E5;
	Mon, 18 Dec 2023 18:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 801E710E1D9
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702925829;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=PwCXRxshfx8ZM0R5hK4eeYL2KSGd//EyP+jsBCrOQIw=;
 b=QVDdcYJeP1OpIFtdGyLRGXwHVkFMjPM4NPNdDXhTbXcdTE1djZ8Ox6ieOWDXQavvEqQa/R
 ov+mNMqkaYSp9U6ZvDbvmUwN7HXF9fgBdO80XnXacF6ZacFnjgKOtLac6kPO0lfY8qbI29
 Z7uuAImOxqo44e2ZlTh4Zvqh3V9uBf4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-166-drZVjv0YPm66fsuISiG_9w-1; Sun, 17 Dec 2023 05:07:46 -0500
X-MC-Unique: drZVjv0YPm66fsuISiG_9w-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40c3307ccf4so16400985e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 02:07:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702807665; x=1703412465;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PwCXRxshfx8ZM0R5hK4eeYL2KSGd//EyP+jsBCrOQIw=;
 b=jl6+FyY0c0dLvdlsWz/G1ZhgcQyrVFo7kt47aFff36kXlUEmmqvkDPETaaR1hUJy+r
 7YbWPuUukY9n5dbIEy70+KIPO1AFSmsSZrV1sGGkSZwZIF62wpK73zFhvtUcxbIUn1iH
 1s3tJnZocs0nCQGCUpcbFscSdLk2TYsEYD3s217oqHFAoXfSNvHKgOKs44+XBjTB7gkI
 J6Jq408ei+MVqeQHAyWkRqBf22JCn2Q1EILy80YDW1f5hyHgzZa90YhuZiTNemMkA0Oh
 GpCq1UE4QBj8uI/f9m4mpAwDfXkLoaHQhqC2kduXx9lsKpgToon1m1KDXrzS9uPQLlwo
 VkdA==
X-Gm-Message-State: AOJu0YxZ9guiags9uC6/erGPsBplXAd3na1xBieqbkWKDHV7IDO4FXgF
 3+HIeVucEEHz3MgWkP0MI9CQeJbwBnsiA3XjULvHGERcQda/6f0mDPfggBFkx+9aL7zclu/z9ad
 pzuptTZdJugr7/pbvGALsXiV0R1iD
X-Received: by 2002:a05:600c:5012:b0:40c:6bfc:4bb1 with SMTP id
 n18-20020a05600c501200b0040c6bfc4bb1mr1982317wmr.38.1702807665097; 
 Sun, 17 Dec 2023 02:07:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFr/dUnxatgvI3QmEkCMBXVdE2DJBX2ZugmD4z83PXtxRvr9gelZBQVfY9JdfW/nkdU7628ww==
X-Received: by 2002:a05:600c:5012:b0:40c:6bfc:4bb1 with SMTP id
 n18-20020a05600c501200b0040c6bfc4bb1mr1982297wmr.38.1702807664778; 
 Sun, 17 Dec 2023 02:07:44 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w7-20020a05600c474700b0040c41846919sm30661883wmo.41.2023.12.17.02.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Dec 2023 02:07:44 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/solomon: Add support for the SSD133x controller family
Date: Sun, 17 Dec 2023 11:07:02 +0100
Message-ID: <20231217100741.1943932-1-javierm@redhat.com>
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
Cc: Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch-set adds support for the family of SSD133x Solomon controllers,
such as the SSD1331. These are used for RGB Dot Matrix OLED/PLED panels.

The patches were tested on a Waveshare SSD1331 display using glmark2-drm,
fbcon, fbtests and the retroarch emulator.

Patch #1 adds a DT binding schema for the SSD133x controllers and patch #2
extends the ssd130x DRM driver to support the SSD133x controller family.

Best regards,
Javier


Javier Martinez Canillas (2):
  dt-bindings: display: Add SSD133x OLED controllers
  drm/ssd130x: Add support for the SSD133x OLED controller family

 .../bindings/display/solomon,ssd133x.yaml     |  63 +++
 drivers/gpu/drm/solomon/ssd130x-i2c.c         |   5 +
 drivers/gpu/drm/solomon/ssd130x-spi.c         |   7 +
 drivers/gpu/drm/solomon/ssd130x.c             | 370 ++++++++++++++++++
 drivers/gpu/drm/solomon/ssd130x.h             |   5 +-
 5 files changed, 449 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/display/solomon,ssd133x.yaml

-- 
2.43.0

