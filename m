Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EED47CE47
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E3E1126C6;
	Wed, 22 Dec 2021 08:28:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6312E1126D6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AAodSLL93garPqCDkdNkBwu9Tnajc5yTcM/GAEzqdI4=;
 b=JHbwdyuVq1+jZSOfuOUyS2WxaAlWxYEJQASNg4cx/PXn/TxmohdOLBQx6M8yF+6lMqqlU7
 I2E7rJwjFFh7VCqfsD0UVW3FVnqhlbvwG2iZnjr2YsKBAo2DG3350p1rNB5E4sBOElDVcf
 Oc84WL5Lna/kgGlUXLDYUliNRLgKpfQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-48-rIZzXaTGMH6Zrgwaj1mJhw-1; Wed, 22 Dec 2021 03:28:52 -0500
X-MC-Unique: rIZzXaTGMH6Zrgwaj1mJhw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so523819wrc.17
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AAodSLL93garPqCDkdNkBwu9Tnajc5yTcM/GAEzqdI4=;
 b=QWrN35oT/5/y6ifzgcfOsFwL0rczvqIZT+VLOdJc/MxhSylNKw3axEZAepdNXnqU3C
 kz7sGDA1s0R7tyfh4cnZdMyyM7aBjUoCInmsBzsmIufOvf0Kg39e91HOD7fDBfheBF+m
 BjkJONwaCxZHzWPhgI9jMY1lAI6FgkhQc84+w/Tno5s+trqd3eCjVxSgHWOQBMO7PHeu
 xWgHeV+XM/yBUDeq67TrvFfef6WoWpSdefMx1ZgokK2m9PGDc3BAcauYS4RIWYl/SfUW
 tIbBQJo2NXaMyqZuC+UHbg13aK6dVfwOrt1B3AXG5f3R0YqeN7zCw2IZt572JmjTDEhg
 l2Fg==
X-Gm-Message-State: AOAM5304/SxjRv4Er6hSdxxMHGYoVgf5KtbjKc5MDX9lSuP/4npnW5f/
 E0vpP+TCDfr+Vo/3uwH9QBp5KN5v1tv9kfYDAyohA41UzlQrO41RjXQDieV4o48LmeYWowD8yws
 Rsispas4C2Np7nG4hX0tT3C7sLT2v
X-Received: by 2002:adf:a115:: with SMTP id o21mr1312263wro.412.1640161731254; 
 Wed, 22 Dec 2021 00:28:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjm51fMB5qRQAh6yQM8XD4XEpPtgOnxQIVI3FSY5oNhvoDTlTKefemEzBKkx4IHWPKt0Rr4w==
X-Received: by 2002:adf:a115:: with SMTP id o21mr1312255wro.412.1640161731089; 
 Wed, 22 Dec 2021 00:28:51 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:50 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/10] drm/malidp: Replace module initialization with DRM
 helpers
Date: Wed, 22 Dec 2021 09:28:31 +0100
Message-Id: <20211222082831.196562-11-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
References: <20211222082831.196562-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace module_platform_driver() with drm_module_platform_driver(). The
DRM macro respects drm_firmware_drivers_only() and fails if the flag has
been set.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/arm/malidp_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 78d15b04b105..d5aef21426cf 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -1008,7 +1009,7 @@ static struct platform_driver malidp_platform_driver = {
 	},
 };
 
-module_platform_driver(malidp_platform_driver);
+drm_module_platform_driver(malidp_platform_driver);
 
 MODULE_AUTHOR("Liviu Dudau <Liviu.Dudau@arm.com>");
 MODULE_DESCRIPTION("ARM Mali DP DRM driver");
-- 
2.33.1

