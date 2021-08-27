Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EA93F97CC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Aug 2021 12:06:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404386E913;
	Fri, 27 Aug 2021 10:06:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 034776E913
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 10:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630058765;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=p4aikmi0g6nX7SuLm/Bk6aLBr61zFNCjsy8EnVkGMSU=;
 b=cTKJ3HeO/j/l+bxByaO+QvvosQB5A58W3fR40amNMBRdMeeJQLch2j6WkUGz4SCmy5yn4g
 LRtMJJ66GUnAzEcvF1GU4kbNPcz+f22bv9beNPb72/o+IPKVjr5tz45w+rfDRrlwkZsxqR
 JRBF1Nv/D43f2mJc6+mArhztt52g2Dg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-575-0LmdwAPqOZCEgqJ_yZJQow-1; Fri, 27 Aug 2021 06:06:01 -0400
X-MC-Unique: 0LmdwAPqOZCEgqJ_yZJQow-1
Received: by mail-wr1-f69.google.com with SMTP id
 b7-20020a5d4d87000000b001575d1053d2so1680987wru.23
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Aug 2021 03:06:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4aikmi0g6nX7SuLm/Bk6aLBr61zFNCjsy8EnVkGMSU=;
 b=R9zQIIFjTSRp8zWPoTzzQlfUfpNgwX/SUsM2Tl4EUH4yvHSZ64TRkP0nj3IBuLMmoV
 T25Rlv8UVwUTQ4lmhFtC9FMnSOAJq0kiF961TaZ6Ix6y+pOgWtXZ7LfZuYObZeBXSp85
 W/XgZQDpjO0ZvwR38tyxytVmwCcn9WJ5U+8KFnE7d7GExqgWPWQaPF/C1NcPB3L3qIB5
 ZyFyXYqhkdHjQ0rDdscmo/PGPYV5sG+nlKEjD/XInY2edCIrrctUlOPsf2mio1gbupJb
 VDTO4Jb1HWCw2MEAOYKJSF9hPAe3eTIGYqDWHVUUg2n8YFiGmsRV2IDVF1nIgpPU6hb3
 7pXQ==
X-Gm-Message-State: AOAM532gzrvObiJ3pF324fauWwx8e0DWJJi/9zfGr7MTf14n8D8zbf4K
 Qw1EWtVOr39Dla7ZosIAWqgZTjWmZrtDI7A4avUQedaw3q23cahLEGyYgXFcvm41nwNi7yh/5hq
 zOkCoDsqVbhVqxV5qutQcZXWYFWqD
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr13186006wml.47.1630058760667; 
 Fri, 27 Aug 2021 03:06:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJweQKtGcTVQCT5oK+T9jojfllLFKvn1d+zXGWWo3Yar8zcxTOTUijovtCiHgZqBsq9Js5k20w==
X-Received: by 2002:a05:600c:2215:: with SMTP id
 z21mr13185978wml.47.1630058760467; 
 Fri, 27 Aug 2021 03:06:00 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id d28sm4834317wrc.4.2021.08.27.03.05.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Aug 2021 03:06:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>, Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, x86@kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@redhat.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [RFC PATCH 4/4] drm: Make fbdev emulation depend on FB_CORE instead
 of FB
Date: Fri, 27 Aug 2021 12:05:57 +0200
Message-Id: <20210827100557.1578746-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that the fbdev core has been split in FB_CORE and FB, make DRM fbdev
emulation layer to just depend on the former.

This allows to disable the CONFIG_FB option if is not needed, which will
avoid the need to explicitly disable all the legacy fbdev drivers.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 8fc40317f2b..7806adb02f1 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -103,7 +103,7 @@ config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
 config DRM_FBDEV_EMULATION
 	bool "Enable legacy fbdev support for your modesetting driver"
 	depends on DRM
-	depends on FB
+	depends on FB_CORE
 	select DRM_KMS_HELPER
 	select FB_CFB_FILLRECT
 	select FB_CFB_COPYAREA
-- 
2.31.1

