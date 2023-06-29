Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9AE7430BB
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 00:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FEC010E0B6;
	Thu, 29 Jun 2023 22:51:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF30010E0B6
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 22:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688079083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=97bfxa2ildUUs8zNadKQMWE3XSHS8OGi9guqfFdEnRY=;
 b=N98Vd8kfyK0I8IztC/iRDdfNr4ARCDwiY0AOlo2hjuvOGiHMG9yik5s356X2m/u7/9oxU1
 WCHVlh4PhxM3NHBvB3SW1H1zCrj25GEUT6DLKviU/MzjFoUlNkK/oiW1EPA8hhwe0dblh5
 czLfJBvR0XTi114MI7wbJV9nW7u5Rq4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-463-k_1Me4B6PqOZDPJZXAtAAA-1; Thu, 29 Jun 2023 18:51:20 -0400
X-MC-Unique: k_1Me4B6PqOZDPJZXAtAAA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-313ec030acbso514625f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jun 2023 15:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688079079; x=1690671079;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=97bfxa2ildUUs8zNadKQMWE3XSHS8OGi9guqfFdEnRY=;
 b=SEJgXLW3M2B1axpjaK9yg0UQCDRMnTGD4AXS8BALBZ+UCmJjn8aHtZ5ZaH3fhN8L4x
 sCnLqVCfeyRC+lcND54wEHNnauq6UY+fO7NWS0AlEKFijKKm0xEZFqJ3H0/eLCDhMZe2
 5t+deOm8pgrIumlgsSR+kZ098R60LcaSsdWWRiM8z66+HmUE5dyPLTNYcUuVPN2VHnbQ
 qIWqWv7Mf3i+aMZ7C+BqY2AtHqhSGMznsx59RraN2wAv0vpyDHLaSZpBOD+Pnf+4lwId
 Txkt8hnhLtZbHLVgDzNEQTCZe4y2m4UDTmv2rxtI7qC3MCYzu+t/C3sdDTj0fDJ8RJYV
 IfkQ==
X-Gm-Message-State: AC+VfDxgiXhmwUVLrA6HDNeGfK+jrcPlpNKFQOdym3lGVjaWWyxXVpHG
 5AF13i/yXm70LBV4jmVdFacUzMRu+UFUQwcYWlPVsvxFEz4x4RM2hJUteBoYJNmx5tG7PTbSYfI
 PfSJ9wHshpvaRhu51HOrs922OfHiz
X-Received: by 2002:adf:cf0d:0:b0:313:ed10:7f52 with SMTP id
 o13-20020adfcf0d000000b00313ed107f52mr6115098wrj.18.1688079079540; 
 Thu, 29 Jun 2023 15:51:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5yNLJ3SOH2DLnOJkryCoLwduMQdbLlL8LCtjNfgrXWsfzKraLofJ9rCFcQyRlq9jVxkKfBSg==
X-Received: by 2002:adf:cf0d:0:b0:313:ed10:7f52 with SMTP id
 o13-20020adfcf0d000000b00313ed107f52mr6115089wrj.18.1688079079281; 
 Thu, 29 Jun 2023 15:51:19 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 i6-20020adff306000000b00311339f5b06sm16795690wro.57.2023.06.29.15.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 15:51:18 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] Allow disabling all native fbdev drivers and only keeping
 DRM emulation
Date: Fri, 30 Jun 2023 00:51:02 +0200
Message-ID: <20230629225113.297512-1-javierm@redhat.com>
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
Cc: x86@kernel.org, linux-fbdev@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series splits the fbdev core support in two different Kconfig
symbols: FB and FB_CORE. The motivation for this is to allow CONFIG_FB to
be disabled, while still having the the core fbdev support needed for the
CONFIG_DRM_FBDEV_EMULATION to be enabled. The motivation is automatically
disabling all fbdev drivers instead of having to be disabled individually.

The reason for doing this is that now with simpledrm, there's no need for
the legacy fbdev (e.g: efifb or vesafb) drivers anymore and many distros
now disable them. But it would simplify the config a lot fo have a single
Kconfig symbol to disable all fbdev drivers.

I've build tested with possible combinations of CONFIG_FB, CONFIG_FB_CORE,
CONFIG_DRM_FBDEV_EMULATION and CONFIG_FB_DEVICE symbols set to 'y' or 'n'.

Patch 1/2 makes the CONFIG_FB split that is mentioned above and patch 2/2
makes DRM fbdev emulation depend on the new FB_CORE symbol instead of FB.


Javier Martinez Canillas (2):
  fbdev: Split frame buffer support in FB and FB_CORE symbols
  drm: Make fbdev emulation depend on FB_CORE instead of FB

 arch/x86/Makefile                 |  2 +-
 arch/x86/video/Makefile           |  2 +-
 drivers/gpu/drm/Kconfig           |  2 +-
 drivers/video/console/Kconfig     |  2 +-
 drivers/video/fbdev/Kconfig       | 62 ++++++++++++++++++-------------
 drivers/video/fbdev/core/Makefile | 14 +++----
 6 files changed, 48 insertions(+), 36 deletions(-)

-- 
2.41.0

