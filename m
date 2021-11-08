Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C964480D1
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 15:07:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3D456E0A8;
	Mon,  8 Nov 2021 14:07:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 831FD6E095
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 14:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636380427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QBLSYCGNnxL90t/5H+fXmKYwqgv0hYBDnt/wGxwYShQ=;
 b=YZYT8UUqXRoH8YaltqYuuMAjiYZGAjWAfpWPKq2wEPeVpq0LAHuW2KlwNPPJW39L+VGzFO
 U7//x9TNrjDYcTs83xRl3Yv8NGbyYhtMlZ1UZ1vLB1c7zdxtkwfeVjDoTzkzFN4v3ZVnYS
 zU19gPHHAlQuA2X6t7Ax9VV/n/IZ/N8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-qGcOH9HWMHWN0R5mkNMobw-1; Mon, 08 Nov 2021 09:07:06 -0500
X-MC-Unique: qGcOH9HWMHWN0R5mkNMobw-1
Received: by mail-wm1-f69.google.com with SMTP id
 z137-20020a1c7e8f000000b0030cd1800d86so6267775wmc.2
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 06:07:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QBLSYCGNnxL90t/5H+fXmKYwqgv0hYBDnt/wGxwYShQ=;
 b=I4/4JcTTJ00OV/EcQQBPqIsSx9BZK5XWrCJP9Bb1O+XSfQg4rwJ6WK95EYfjep40q/
 Y9IUFzYhOmdY/v5h52+/CGq42i0oBjvMo4UwUclDnGqimx/2n089iuL3bh3IlafW0kPA
 ZXuyQ/j2BgrKvJ54m++yXL3zBZi9gwCOZRHujx52NoF2Zd7SFBUZcEuO8+L5iDhbxb6H
 wYvBQJonhN+td7DrfFijWQRmAHYAi7hvxVSGF8HewQ7pCfrBOy0lwZSNhgAbYwQMUzn7
 78UcNrrUdXA0Czs8pLd3bdvwZbCB08oWrYCKzTr3Pznb9ya8FkckYQNJk5yyfIZmZgCv
 uZYQ==
X-Gm-Message-State: AOAM530SfiPmoL06ST1kMSqt+GO9/DdFhE+FZYt8/xRyApr2CT6ZXSqz
 ZEj+mWKvqsCBOuvB2Bo/EKkz4idpihXcAxgGDyOKhJfLz7NY8PyVvzu3v/pk32u9I25xaOgl/MX
 7Ik1+SLZ4kmiaa8F+vO2BYQzKrC+j
X-Received: by 2002:a5d:5651:: with SMTP id j17mr68102wrw.166.1636380425219;
 Mon, 08 Nov 2021 06:07:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHyDgAew+dtCqACNkmDLzBa0RJwibVQ2fmqgfKLQQb8uNEyhZ+QodkcyI1wWViqtj63Ut+JA==
X-Received: by 2002:a5d:5651:: with SMTP id j17mr68067wrw.166.1636380425058;
 Mon, 08 Nov 2021 06:07:05 -0800 (PST)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id m14sm10081696wrp.28.2021.11.08.06.07.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 06:07:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] drm/vboxvideo: Drop CONFIG_VGA_CONSOLE guard to call
 vgacon_text_force()
Date: Mon,  8 Nov 2021 15:06:44 +0100
Message-Id: <20211108140648.795268-3-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108140648.795268-1-javierm@redhat.com>
References: <20211108140648.795268-1-javierm@redhat.com>
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
Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
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

