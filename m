Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E880B752859
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jul 2023 18:32:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8CC10E0F0;
	Thu, 13 Jul 2023 16:32:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63BEF10E0F0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 16:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689265951;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hA4oXFz7iMz2TN7Oq1WGXGk81ddHsb/K8fUHUI+fX50=;
 b=gols2NlS28BnwpAeeqqdH19Sl1AE3kMJ9yDpQM75Nl7mgPhBm9PTtyM8R34aW8NVC929I6
 tr65ZkoWBYE/K3moz7fFXn/gnl6bPse0f9ld2gTzS1eU4X93/6APXe8Mi8YZ5MH0z1BPel
 gMIq82+rKDC606BbOOvA1E+gXRBU4HQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-51pWfSJdOK6tW5jE1ANuRA-1; Thu, 13 Jul 2023 12:32:22 -0400
X-MC-Unique: 51pWfSJdOK6tW5jE1ANuRA-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-315998d6e7fso591133f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jul 2023 09:32:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689265941; x=1691857941;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hA4oXFz7iMz2TN7Oq1WGXGk81ddHsb/K8fUHUI+fX50=;
 b=fUlX+GErfqFB1c9DaZN/KqewhqcT/PJsNpkjnTrPr5qCmV9zwJe0SN94REXN4LwyXB
 f+RBrewqAQQyJJSKVTMMEhryzngbgrcN4W5SS3n/PinJ4dK3Be5xoY8lNoeUnRnXKMNZ
 CSxyvGtuw521sPHlUnyscjDvVrGxzhi53DbLXfCiqaHBzN7lVTN7e3nMYw2pdLu8iO3h
 my9oYa6OpkmQTSEQ27FTUhOWhDbgepxU3gyN65A04IPy0CjrMc6KsusJ/nVP+PzbudJq
 f/fUqAlhM8+Lr5TDYqYqJ3zYhfarTz1iYm2cWhASONO3z4f7eFeYfp+V8yp7kJJAPTIX
 xhVg==
X-Gm-Message-State: ABy/qLblZly8Wlp++ClE7H9U3V42eT4lTd6/k7aswgsPMXuhDwIcP9Dy
 8ZsoN6qa7aqirQJmAaw68vdLsNKG/4SoGnrX9vqCSAv6xbuAOwTnVr+zUWocUTx/E/k695hXUm7
 qWWypPZrBh6qiUyJ1SWn4aaCp3RzC
X-Received: by 2002:a05:6000:87:b0:314:449e:8536 with SMTP id
 m7-20020a056000008700b00314449e8536mr2005169wrx.10.1689265941789; 
 Thu, 13 Jul 2023 09:32:21 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEa8zIOvCR3FZIuk4Bh+6wmih6StOOoYjgtZavSN3obv2xketnv0WzrE7x0Q/+hJFIveJRfiQ==
X-Received: by 2002:a05:6000:87:b0:314:449e:8536 with SMTP id
 m7-20020a056000008700b00314449e8536mr2005152wrx.10.1689265941523; 
 Thu, 13 Jul 2023 09:32:21 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 z13-20020adfe54d000000b003143ac73fd0sm8486974wrm.1.2023.07.13.09.32.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 09:32:21 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Fix an oops when attempting to update a disabled
 plane
Date: Thu, 13 Jul 2023 18:32:06 +0200
Message-ID: <20230713163213.1028952-1-javierm@redhat.com>
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
Cc: dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert reports that the following NULL pointer dereference happens for him
after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
plane update"):

    [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
    ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
    and format(R1   little-endian (0x20203152))
    Unable to handle kernel NULL pointer dereference at virtual address 00000000
    Oops [#1]
    CPU: 0 PID: 1 Comm: swapper Not tainted
    6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
    epc : ssd130x_update_rect.isra.0+0x13c/0x340
     ra : ssd130x_update_rect.isra.0+0x2bc/0x340
    ...
    status: 00000120 badaddr: 00000000 cause: 0000000f
    [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
    [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
    [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
    [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
    [<c02f94fc>] commit_tail+0x190/0x1b8
    [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0
    [<c02c5d00>] drm_atomic_commit+0xa4/0xe4
    [<c02cce40>] drm_client_modeset_commit_atomic+0x244/0x278
    [<c02ccef0>] drm_client_modeset_commit_locked+0x7c/0x1bc
    [<c02cd064>] drm_client_modeset_commit+0x34/0x64
    [<c0301a78>] __drm_fb_helper_restore_fbdev_mode_unlocked+0xc4/0xe8
    [<c0303424>] drm_fb_helper_set_par+0x38/0x58
    [<c027c410>] fbcon_init+0x294/0x534
    ...

The problem is that fbcon calls fbcon_init() which triggers a DRM modeset
and this leads to drm_atomic_helper_commit_planes() attempting to commit
the atomic state for all planes, even the ones whose CRTC is not enabled.

Since the primary plane buffer is allocated in the encoder .atomic_enable
callback, this happens after that initial modeset commit and leads to the
mentioned NULL pointer dereference.

Fix this by not using the default drm_atomic_helper_commit_tail() helper,
but instead the drm_atomic_helper_commit_tail_rpm() function that doesn't
attempt to commit the atomic state for planes related to inactive CRTCs.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index afb08a8aa9fc..12820d16b15b 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -795,6 +795,10 @@ static const struct drm_mode_config_funcs ssd130x_mode_config_funcs = {
 	.atomic_commit = drm_atomic_helper_commit,
 };
 
+static const struct drm_mode_config_helper_funcs ssd130x_mode_config_helpers = {
+	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
+};
+
 static const uint32_t ssd130x_formats[] = {
 	DRM_FORMAT_XRGB8888,
 };
@@ -923,6 +927,7 @@ static int ssd130x_init_modeset(struct ssd130x_device *ssd130x)
 	drm->mode_config.max_height = max_height;
 	drm->mode_config.preferred_depth = 24;
 	drm->mode_config.funcs = &ssd130x_mode_config_funcs;
+	drm->mode_config.helper_private = &ssd130x_mode_config_helpers;
 
 	/* Primary plane */
 
-- 
2.41.0

