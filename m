Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A898151BE0A
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 13:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A1A10F6BA;
	Thu,  5 May 2022 11:31:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 10977 seconds by postgrey-1.36 at gabe;
 Thu, 05 May 2022 11:31:41 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB12B10F665
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 11:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651750301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncwUrPXa6D//xAE+gUKX4W9jlEJvsWNrctcaxVQSCb8=;
 b=D9gfaKsQ1QTAPszxP4aUdc+mTvaCOQxJQXpTKm/WA3r282aq8iMnsTvJo83wKGDyXNFWQA
 SbzZeupdc5pPae902dy35vllZtLAhtABv+NsJJZQhrcQOSa4AAaRZnnDTbHv7rSvt7nUBN
 9xvsVyjA6HqqU0mer2m0/A6t0y0XPNg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-384-R9vze2BtMWGlcxIqbe0Zhg-1; Thu, 05 May 2022 07:31:39 -0400
X-MC-Unique: R9vze2BtMWGlcxIqbe0Zhg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc310000000b0038e6cf00439so1648978wmj.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 04:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncwUrPXa6D//xAE+gUKX4W9jlEJvsWNrctcaxVQSCb8=;
 b=oWKoL/58KNSA8NK/9WpTD+6b6rovFH1kj8XJToGa15kDcdOFoiH66vdMCXwF6Vc9/S
 fWvP6o9vxaffScFYuUXZZmXlpRFJSKFCufWnnwTfrs9yxM3qyLZ9SLAu7dUV3dDH8U7V
 atZpOEOfwAY5hkn0dpeRb7VaQdyAhVQYoPumLNfkv3ztqyDu72tCTzW8gf+Ra1aAiXYf
 ZsGLB2/fgaflCSRU6Tyz4jnaXUUTXofwl5MppsbOpo0M4R/+CZpjjq8JUGtdgIHPg9O0
 aFWh6hDwPpeVS2wqPGH14OAcYJv81dBo/T6eyj9CacXGcMA5fval5YsDUkJVfTGEKW7W
 rJXA==
X-Gm-Message-State: AOAM532Jr95/zV+tQMs92O8wIB5m9PMAlUCPbAeJbCWwb05nGIZAbkpo
 liQyewrCGnxRHfapZKCknwfp7+S9AxejbqnBk5gX6rKc4oJE89PxMFFC8zZQPiAyeRW+FQgvVuD
 hPgeJjpZ8wBIUzJrkIOBx6qDEeVMw
X-Received: by 2002:a7b:ce82:0:b0:394:2514:6f07 with SMTP id
 q2-20020a7bce82000000b0039425146f07mr4288637wmj.56.1651750298624; 
 Thu, 05 May 2022 04:31:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTaX+emZRGME2XrbVDdeWq3PLdol9IHOXQKtajyniJm9UY0h9+OnzRg+JdW6I4XRxCo9UumA==
X-Received: by 2002:a7b:ce82:0:b0:394:2514:6f07 with SMTP id
 q2-20020a7bce82000000b0039425146f07mr4288610wmj.56.1651750298397; 
 Thu, 05 May 2022 04:31:38 -0700 (PDT)
Received: from minerva.. ([90.167.94.135]) by smtp.gmail.com with ESMTPSA id
 k1-20020a5d5181000000b0020c5253d8f5sm995809wrv.65.2022.05.05.04.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 04:31:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] fbdev: Prevent possible use-after-free in fb_release()
Date: Thu,  5 May 2022 13:31:24 +0200
Message-Id: <20220505113128.264963-2-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505113128.264963-1-javierm@redhat.com>
References: <20220505113128.264963-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

Most fbdev drivers have issues with the fb_info lifetime, because call to
framebuffer_release() from their driver's .remove callback, rather than
doing from fbops.fb_destroy callback.

Doing that will destroy the fb_info too early, while references to it may
still exist, leading to a use-after-free error.

To prevent this, check the fb_info reference counter when attempting to
kfree the data structure in framebuffer_release(). That will leak it but
at least will prevent the mentioned error.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---

(no changes since v1)

 drivers/video/fbdev/core/fbsysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/video/fbdev/core/fbsysfs.c b/drivers/video/fbdev/core/fbsysfs.c
index 8c1ee9ecec3d..c2a60b187467 100644
--- a/drivers/video/fbdev/core/fbsysfs.c
+++ b/drivers/video/fbdev/core/fbsysfs.c
@@ -80,6 +80,10 @@ void framebuffer_release(struct fb_info *info)
 {
 	if (!info)
 		return;
+
+	if (WARN_ON(refcount_read(&info->count)))
+		return;
+
 	kfree(info->apertures);
 	kfree(info);
 }
-- 
2.35.1

