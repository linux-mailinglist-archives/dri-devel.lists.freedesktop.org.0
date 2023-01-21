Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B526676862
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 20:24:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991B110E031;
	Sat, 21 Jan 2023 19:24:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DA510E031
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 19:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674329090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t3hudovJHnxcneZUu+woal1qY/z5dLk/KSxEgxM2qkk=;
 b=Uu85tamzqotnBJItu/TcjsCrqariLoO8kmj+S2+X3Q7vJ59lHP3O7BDm2YbZ0KCfBYnf3f
 BnH8L98uA3u7OpNz8mtpyguFfWEYM/SDt+uv153+ayldHknZoV5kNA9oTUvn5pBK445x6T
 Fkn8snxEjZxoXtOTO3HpM3sgyJKtr+I=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-183-4GEkX_mWNEOBjHxWWryB4Q-1; Sat, 21 Jan 2023 14:24:46 -0500
X-MC-Unique: 4GEkX_mWNEOBjHxWWryB4Q-1
Received: by mail-wr1-f72.google.com with SMTP id
 v3-20020adfa1c3000000b002bdd6ce1358so1434072wrv.23
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Jan 2023 11:24:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=t3hudovJHnxcneZUu+woal1qY/z5dLk/KSxEgxM2qkk=;
 b=44u24l+os8WIHgS9k4lBGTaASoUd3DagOpx0tuAst5O4M8lkXm2FjxNSsDgB5RPIaw
 MZ7VcSXdmmtXMTpU7JsRvBAzgLgyP8TizvEo8ty2Cwlem5Cny8gtKpLP3TvyqNQcPi1E
 gsZrbgrETGKZjVILZyCBlPZEzUUDTGSuguL1+1tiZ9eka0lk96iDV7usEvZzc9Tx4lKG
 e4aZ7nW6PrPtMyeizlPopsTltw9AkBRh5fyDW+5nAfvdYOr3wNabWa+CI1xV+w+o+ymM
 V/s99PL4DkDjWFZQIwSTXOpDabGpKXoOeD77VBJmGKGJAvk/g4O6O4lyBpXBROHMukbe
 bLdg==
X-Gm-Message-State: AFqh2kpPHlg/hWtOuXNXWN67x7aaVqnBl0WhQYSG2Kw4Dv2fRbkHWZxX
 4lvAbu/uAx4JviLc0Q5yk55ygHzzpnIZ1vSB1MLF1BXDuDDVmRTs2hUDjzs5HM38YD+Zi7O6Pyp
 tI0+TJl3dKo+LPHc9U9mnCd1zu4/y
X-Received: by 2002:a05:600c:3b91:b0:3d3:5c9e:6b27 with SMTP id
 n17-20020a05600c3b9100b003d35c9e6b27mr15020836wms.12.1674329084674; 
 Sat, 21 Jan 2023 11:24:44 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsX9USPEoSwU8E0lwBmJ+d/5/Wr2ac8HU57kLtvH6Q9yQcFpRhHXcnJcvHcD2LCoyGFM1bn+A==
X-Received: by 2002:a05:600c:3b91:b0:3d3:5c9e:6b27 with SMTP id
 n17-20020a05600c3b9100b003d35c9e6b27mr15020826wms.12.1674329084475; 
 Sat, 21 Jan 2023 11:24:44 -0800 (PST)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b003daff80f16esm8544321wmg.27.2023.01.21.11.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Jan 2023 11:24:43 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] Fixes and cleanup for DRM fbdev emulation and deferred
 I/O
Date: Sat, 21 Jan 2023 20:24:15 +0100
Message-Id: <20230121192418.2814955-1-javierm@redhat.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org, Jaya Kumar <jayalk@intworks.biz>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series contains two fixes and a cleanup for things that I noticed
while debugging a regression in the fbdev emulation for a DRM driver.

The first two patches are trivial and shoulnd't be controversial, the third
patch is less trivial, but it has been already reviewed by Thomas and I did
test it to make sure that works as expected. With it, I got rid of the WARN
that happened due a mutex used after it has been destroyed.

Best regards,
Javier

Changes in v2:
- Re-introduce the CONFIG_FB_DEFERRED_IO ifdef guard for the @fbdefio field
  declaration since the kernel test robot reported that's needed at the end.

Javier Martinez Canillas (3):
  fbdev: Remove unused struct fb_deferred_io .first_io field
  drm/fb-helper: Check fb_deferred_io_init() return value
  drm/fb-helper: Use a per-driver FB deferred I/O handler

 drivers/gpu/drm/drm_fbdev_generic.c | 15 ++++++++-------
 drivers/video/fbdev/core/fb_defio.c |  4 ----
 include/drm/drm_fb_helper.h         | 12 ++++++++++++
 include/linux/fb.h                  |  1 -
 4 files changed, 20 insertions(+), 12 deletions(-)

-- 
2.39.0

