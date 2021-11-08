Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01A7447F5C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 13:16:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CDD6E0F3;
	Mon,  8 Nov 2021 12:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D5E36E0D7
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 12:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636373765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kKN5KjqJ+KRnaHGOwpSHiDENJCInQ2OqIClv005Af3M=;
 b=SdFgJdkJ8bX+T6AegieWHZtIJhalpPWLuvlspgLnKmxDQdgjtTYidYA3rbn5+ViFNyhp6c
 xIR2RFF09Vvj/pAcIk8PTLYwQB+FSPNRvxzE9OrgoTRxP+smO/NXKunVo/0HnE2UbI4Glk
 s5OruPplcEuL7x6+WNdwCofUP4ghYi0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-esc0PQm2OI-fQ1uCAR_fmA-1; Mon, 08 Nov 2021 07:16:04 -0500
X-MC-Unique: esc0PQm2OI-fQ1uCAR_fmA-1
Received: by mail-wm1-f69.google.com with SMTP id
 o10-20020a05600c4fca00b0033312e1ed8bso3015903wmq.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 04:16:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kKN5KjqJ+KRnaHGOwpSHiDENJCInQ2OqIClv005Af3M=;
 b=yJc86ApXzcI/F2XElS8KCG0IuDauq0eeBk73Rn1zyOYNC5cEX0nNjhu4Qhl0UOc0z6
 7Lj4TWVPRRvAtMU0aubKq+h58/g/zo9bIE0ZApleRF1UJAqJZxYpe7CVizgKRi/mdSgx
 NJsh3D2bX5zNf9iOd7b4bgu59TLAOFAcBdk5h8G23NySyz+LUF5fG/YMWjxwRsvQHVZt
 BRfC+q70ll9QtM3NBo3X7d/2sbcHHdNSXn+sn15CP27ZKgGNBJAA943H9RqXcGxfDs91
 SmiY5urBDFGlcJkZumk+C+R+1XAsZcH3DYgMPxFFR0COhE2BgpnQ5C1KWna4gXZ0RCbg
 VrtQ==
X-Gm-Message-State: AOAM533Ulj3H5QMsKiXhkHG0WT3CrNGaHA/xqKdb0Xu0e4I98CEq9tTR
 MameRxEn8AgoaYk1LV2ZM//8X6kheiIu3fMAMTrEPQUE/K32kccBhmL40/c3nG8rxb4b/5NZJP4
 PDaBoJePbM9OgdrztDJBumhnNqU6W
X-Received: by 2002:a5d:6152:: with SMTP id y18mr78918163wrt.271.1636373763435; 
 Mon, 08 Nov 2021 04:16:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLO9Sz8FK6iWw4u45XTsQ+MXDa4qY4K+cEjRCPC5NDTtyoJkPljBpWWnh2Q6Jmp2Obx6u0aw==
X-Received: by 2002:a5d:6152:: with SMTP id y18mr78918132wrt.271.1636373763251; 
 Mon, 08 Nov 2021 04:16:03 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id q4sm16866866wrs.56.2021.11.08.04.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 04:16:03 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] drm/vboxvideo: Drop CONFIG_VGA_CONSOLE guard to call
 vgacon_text_force()
Date: Mon,  8 Nov 2021 13:15:40 +0100
Message-Id: <20211108121544.776590-3-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108121544.776590-1-javierm@redhat.com>
References: <20211108121544.776590-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Peter Robinson <pbrobinson@gmail.com>, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is already handled by the console.h macro since a stub inline function
is defined for vgacon_text_force() if CONFIG_VGA_CONSOLE is not set.

There's no need to have ifdefery in the driver when calling the function.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/vboxvideo/vbox_drv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git drivers/gpu/drm/vboxvideo/vbox_drv.c drivers/gpu/drm/vboxvideo/vbox_drv.c
index a6c81af37345..fd7abb029c65 100644
--- drivers/gpu/drm/vboxvideo/vbox_drv.c
+++ drivers/gpu/drm/vboxvideo/vbox_drv.c
@@ -193,10 +193,8 @@ static const struct drm_driver driver = {
 
 static int __init vbox_init(void)
 {
-#ifdef CONFIG_VGA_CONSOLE
 	if (vgacon_text_force() && vbox_modeset == -1)
 		return -EINVAL;
-#endif
 
 	if (vbox_modeset == 0)
 		return -EINVAL;
-- 
2.33.1

