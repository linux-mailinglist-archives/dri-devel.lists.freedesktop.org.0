Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9C26571BC
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 02:48:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A9310E363;
	Wed, 28 Dec 2022 01:48:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7132710E363
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 01:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672192089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=P5KKuoIGAE6MpY1AzB0SKM8BM5G/7Bvgi1+Zq+kEeaY=;
 b=WhRZ3wTDRakNvbrhOHDOdGQDbvFFY/uDeYjtacO9f7dRKYykh6qFG6c2KcBEL95wveupPR
 doR2A/M1F24qvihIIQTxYR4yNOF0wRsyMLmEiNceoYaQa57USgPs38Mh5goNRN+1KJQcpa
 JrP/u7I8nYVQw/i2Bu2LmE2/uZNN+dQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-590-MGIuUsk8MwC4rBtQ8tucLQ-1; Tue, 27 Dec 2022 20:48:06 -0500
X-MC-Unique: MGIuUsk8MwC4rBtQ8tucLQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 fl12-20020a05600c0b8c00b003d96f0a7f36so6181045wmb.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Dec 2022 17:48:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P5KKuoIGAE6MpY1AzB0SKM8BM5G/7Bvgi1+Zq+kEeaY=;
 b=PQQKAaEJAzeq30EA6g0vYWtgElPYO2jUEbIw0JF/RairGtKONphQVPoLlO3njE7LBg
 u6bvzTSSh/x4+8VicU01XUynwNz/SiHAAdIY2qnxdvpdzitdjZXC9m/cNug0vGGQ5Rwb
 QoZOCxjkrzrijlYAa2sgQY4MC3Pz4abxNMm/XBKtvQi62FcBLbNs7XbfUSOzbixN/MRn
 6rXcCbLcqFeYGfMeb0nIT0aBFxdb61gZipgHOWXJZVvAtkQJxJBlQD2IXwft3Bjf41Hw
 1Rv69Q9M/mZ/83G1R7yvxqNqYhpt034AfPuIq6ir5EPBXzrdzWDyvGQ9Yq30Jv9Qrdwm
 /LZg==
X-Gm-Message-State: AFqh2kr+xXVaYdExDWYeB551tjL+5BS7cS/47nulpHqhQr6hfXzmTMdq
 yjr4kSsmcE5+DVOtOJteVKMJOFhyvwQGhL5ml/X+TMWTPeh17cLYkxZAnyhQNXnKr9OdiE1BPdX
 xPxEdgs/k0cn3THnHSROJIwzHDAtS
X-Received: by 2002:adf:aa89:0:b0:248:2d6e:aa3c with SMTP id
 h9-20020adfaa89000000b002482d6eaa3cmr17806146wrc.58.1672192084955; 
 Tue, 27 Dec 2022 17:48:04 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvvPMePoymVldOmzVyLZLGayM8TTqf0I+K+2FRLyH9T84ePvZEMQyZLl7/owZtTQ0WURql2OQ==
X-Received: by 2002:adf:aa89:0:b0:248:2d6e:aa3c with SMTP id
 h9-20020adfaa89000000b002482d6eaa3cmr17806138wrc.58.1672192084746; 
 Tue, 27 Dec 2022 17:48:04 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 k16-20020a056000005000b002258235bda3sm14158873wrx.61.2022.12.27.17.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Dec 2022 17:48:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 00/14] drm/panel: Make panel drivers use existing DSI write
 macros
Date: Wed, 28 Dec 2022 02:47:43 +0100
Message-Id: <20221228014757.3170486-1-javierm@redhat.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Ondrej Jirman <megous@megous.com>, Purism Kernel Team <kernel@puri.sm>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series contains cleanups for DRM panel drivers that define their own
DSI write macros instead of using what's already in <drm/drm_mipi_dsi.h>.

The changes are quite trivial but I've only tested this with allmodconfig
and `make M=drivers/gpu/drm/panel/` so please review and testing would be
highly appreciated.

Best regards,
Javier


Javier Martinez Canillas (14):
  drm/mipi-dsi: Add a mipi_dsi_dcs_write_seq() macro
  drm/panel-asus-z00t-tm5p5-n35596: Drop custom DSI write macros
  drm/panel-sitronix-st7703: Drop custom DSI write macros
  drm/panel-leadtek-ltk050h3146w: Drop custom DSI write macro
  drm/panel-elida-kd35t133: Drop custom DSI write macro
  drm/panel-boe-bf060y8m-aj0: Drop custom DSI write macro
  drm/panel-novatek-nt35950: Drop custom DSI write macro
  drm/panel-jdi-fhd-r63452: Drop custom DSI write macros
  drm/panel-samsung-s6e88a0-ams452ef01: Drop custom DSI write macro
  drm/panel-samsung-sofef00: Drop custom DSI write macro
  drm/panel-sharp-ls060t1sx01: Drop custom DSI write macro
  drm/panel-mantix-mlaf057we51: Drop custom DSI write macro
  drm/panel-sony-tulip-truly-nt35521: Drop custom DSI write macro
  drm/panel-xinpeng-xpp055c272: Drop custom DSI write macro

 .../drm/panel/panel-asus-z00t-tm5p5-n35596.c  |  96 ++---
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    |  28 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  |  34 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c  |  50 +--
 .../drm/panel/panel-leadtek-ltk050h3146w.c    |  64 ++--
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  |  24 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c |  14 +-
 .../panel/panel-samsung-s6e88a0-ams452ef01.c  |  24 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  24 +-
 .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   |  19 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c |  83 ++---
 .../panel/panel-sony-tulip-truly-nt35521.c    | 348 +++++++++---------
 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  |  44 +--
 include/drm/drm_mipi_dsi.h                    |  16 +
 14 files changed, 374 insertions(+), 494 deletions(-)

-- 
2.38.1

