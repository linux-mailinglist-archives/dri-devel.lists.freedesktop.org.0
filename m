Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 123BD47CE4A
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 09:29:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 820AD1126E8;
	Wed, 22 Dec 2021 08:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FAB1126C6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 08:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640161732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ivba8PnccKK3fE+1KqwcyTESXW/go6yH+CoRlAVXUHY=;
 b=L3xt50skQEbGF/9mykl5zTASg5KZz6528ZLKY8ZbekepqgWDLzpJ8+Dj4ClOoKBK5CvUZh
 SmxiR/Y7157r2mHf1hVB3BEkjslcyT9GgXEheePlvaQUsAUlbIHS2V3gEs6r9qRskcvFly
 KWv4pZx6oLP/G77++HF/tOFODSqFt9o=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-Tb1LejpeOOewypd-y78GqA-1; Wed, 22 Dec 2021 03:28:51 -0500
X-MC-Unique: Tb1LejpeOOewypd-y78GqA-1
Received: by mail-wr1-f70.google.com with SMTP id
 d6-20020adfa346000000b001a262748c6fso519846wrb.12
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 00:28:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ivba8PnccKK3fE+1KqwcyTESXW/go6yH+CoRlAVXUHY=;
 b=Fu6PfbrTvR5HqkvWq2R2EqYI6gsvIxOiCmYswU9k2idVJFgEc4qqq3ZhG7CUKeQhMJ
 vYbWlL+ianjU6s/mwCglrJXDXclOZEMV5C41D294kmEx//CFK/Tm0WAu0eoqlVhsqG3s
 L/9unaS0OS00kBE+sCsv2JA+6cV65e+dj4q3Uneu3598r+OLJ0gX4QAW3f2R/tpjJmBn
 Z4/uEpRJre6s5hzK+B8nMmAj8XmWwZQr5Pkgwrogf9s2rnYogweTbjtQ9VpkoxNSJY+L
 oPkvg7NA8FRQ//h6gK0svjv+YblfoKQl4EEDb3VHeNFO47X58l9Vueghx/f2/ye9H0Vd
 Yuhw==
X-Gm-Message-State: AOAM531MevYGOtVCjDFwtc2vyIIzsrvTO5WJ2xpt54nc82ZogSWPkPE8
 cyrTcUow85MbE8VMEHGKE08jUMaKscvQMH2dlPlH1UQ/5j1jN5Q1045Sd59mp9sNok02mSNkgQ0
 p0rjumJlLqVM+wxL4PUTqyLvUxMhN
X-Received: by 2002:a7b:c745:: with SMTP id w5mr88269wmk.167.1640161730387;
 Wed, 22 Dec 2021 00:28:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUvQSHyffY2CYOqgAXb+4llmThUCCs6y8dzFLhVLwFXI0SYQnZ0rbY2rp8lrrmaIFZWyHdFQ==
X-Received: by 2002:a7b:c745:: with SMTP id w5mr88259wmk.167.1640161730228;
 Wed, 22 Dec 2021 00:28:50 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 00:28:50 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 09/10] drm/arm/hdlcd: Replace module initialization with
 DRM helpers
Date: Wed, 22 Dec 2021 09:28:30 +0100
Message-Id: <20211222082831.196562-10-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
References: <20211222082831.196562-1-javierm@redhat.com>
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

 drivers/gpu/drm/arm/hdlcd_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 479c2422a2e0..e89ae0ec60eb 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -30,6 +30,7 @@
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_modeset_helper.h>
+#include <drm/drm_module.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -434,7 +435,7 @@ static struct platform_driver hdlcd_platform_driver = {
 	},
 };
 
-module_platform_driver(hdlcd_platform_driver);
+drm_module_platform_driver(hdlcd_platform_driver);
 
 MODULE_AUTHOR("Liviu Dudau");
 MODULE_DESCRIPTION("ARM HDLCD DRM driver");
-- 
2.33.1

