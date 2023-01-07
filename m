Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85258661140
	for <lists+dri-devel@lfdr.de>; Sat,  7 Jan 2023 20:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B04A10E1B8;
	Sat,  7 Jan 2023 19:18:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E2EC10E1B8
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Jan 2023 19:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673119114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=j4lvL16cX5Ecc0dt+ze79o67iI/xFSw7pgX0Q6ktKIc=;
 b=ZxBLY/HWyX+jUR1xQ7bYpPkE1JWCOj+498ty39mSVlckumcxAjY7mG8unRY5H52qVpIoLM
 asQACkLTcKvbXunf3ZMGtfsg/jyy3ZkO3iEORx2JlraGoCUD09Ef0UNqgssf4miBf63SvT
 bIiclqbQ/scPz94YUYDf03dJKgo1jX0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-FHsseAOOMJS3lxmnufMlLA-1; Sat, 07 Jan 2023 14:18:32 -0500
X-MC-Unique: FHsseAOOMJS3lxmnufMlLA-1
Received: by mail-wm1-f72.google.com with SMTP id
 i7-20020a05600c354700b003d62131fe46so4644947wmq.5
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Jan 2023 11:18:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j4lvL16cX5Ecc0dt+ze79o67iI/xFSw7pgX0Q6ktKIc=;
 b=mRPbq0X2H+T9a338UWlQozlrJH5vX9Cv+zWw/lXiBj6nV/KRENOqW4/Hf50txLazU1
 F4LBVF5suwoab6cakxN2BL+bbaAwS7gA8hVGg7U1Lc2mnp4pG2hsg9rELN+KiCIWGzZ3
 s7hX5oPl9vQniBtavVljDGArekUnvk+/tdm8UW45F4W/AjS+kGlbdJVl//1xvjxsoNj3
 5taQpC9X7GPG08A9NQzd+bGEwGDjsOUty5VQtV5mlLP+JhKHVOsRLrdRrkl2TgQLpUJm
 4o0GH6FOkGeK//kLs0OprHl60VP9EiRkpL879rECgRC8N7RhmgoBUVsZzc+5l/vJmUxz
 OPQw==
X-Gm-Message-State: AFqh2koIGVe5VRg4c314MZgowD0DAwNELZxC2JQjUeMzKJzuURtDeMEY
 rejxzYqV57HXGh7RtVtEUMo03xytYNrrnWsKI49gvKGpei8/eqT0Irbz+s34ZvwSnuaJOUKU4qO
 iqpFiR3kY81pVkC3AuzqDThCyzw3i
X-Received: by 2002:a5d:5b07:0:b0:270:f10a:b90a with SMTP id
 bx7-20020a5d5b07000000b00270f10ab90amr36172329wrb.6.1673119111864; 
 Sat, 07 Jan 2023 11:18:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsnFHfGQHY5z41Y/XajscECribjEcj8eAoYdGQZoRswR+RMReVfcV5D+H2q7ZWXCx6inx7cUQ==
X-Received: by 2002:a5d:5b07:0:b0:270:f10a:b90a with SMTP id
 bx7-20020a5d5b07000000b00270f10ab90amr36172316wrb.6.1673119111661; 
 Sat, 07 Jan 2023 11:18:31 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 bp28-20020a5d5a9c000000b00273cd321a1bsm4553900wrb.107.2023.01.07.11.18.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jan 2023 11:18:31 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 00/13] drm/panel: Make panel drivers use existing DSI write
 macros
Date: Sat,  7 Jan 2023 20:18:09 +0100
Message-Id: <20230107191822.3787147-1-javierm@redhat.com>
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
 Sam Ravnborg <sam@ravnborg.org>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This series contains cleanups for DRM panel drivers that define their own
DSI write macros instead of using what's already in <drm/drm_mipi_dsi.h>.

This is a v2 that addresses issues pointed out by Sam Ravnborg in the v1:

https://lore.kernel.org/lkml/20221228014757.3170486-1-javierm@redhat.com/

The changes are quite trivial but I've only tested this with allmodconfig
and `make M=drivers/gpu/drm/panel/` so please review and testing would be
highly appreciated.

Best regards,
Javier

Changes in v2:
- Fix identations and a usage discrepancy in one driver (Sam Ravnborg).

Javier Martinez Canillas (13):
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
 .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    |  42 +-
 drivers/gpu/drm/panel/panel-elida-kd35t133.c  |  46 +-
 drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c  |  58 +--
 .../drm/panel/panel-leadtek-ltk050h3146w.c    | 106 +++--
 .../gpu/drm/panel/panel-mantix-mlaf057we51.c  |  24 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c |  14 +-
 .../panel/panel-samsung-s6e88a0-ams452ef01.c  |  44 +-
 drivers/gpu/drm/panel/panel-samsung-sofef00.c |  24 +-
 .../gpu/drm/panel/panel-sharp-ls060t1sx01.c   |  19 +-
 drivers/gpu/drm/panel/panel-sitronix-st7703.c | 341 +++++++--------
 .../panel/panel-sony-tulip-truly-nt35521.c    | 398 +++++++++---------
 .../gpu/drm/panel/panel-xinpeng-xpp055c272.c  | 112 +++--
 13 files changed, 594 insertions(+), 730 deletions(-)

-- 
2.38.1

