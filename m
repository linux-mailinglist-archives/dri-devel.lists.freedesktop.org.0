Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA02251CBD6
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 00:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05AA10E1A1;
	Thu,  5 May 2022 22:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A1ED10E1A1
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 22:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651788268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ncwUrPXa6D//xAE+gUKX4W9jlEJvsWNrctcaxVQSCb8=;
 b=PMi2RoYAU17Y80cUBB8EuRwJ+zKPK4V7RKazqZfOlTX/icHoaQ4832p0wWZYCW4D23LMe/
 BF/K7TysPMXwqCeagF1EQvG5o6ia8G0tJ8uk5Qfs0z5NxzuxjErHWpi6xSbFrn1l/5afOh
 +9slWxl6KP8sQGBaSrKcD4UfgEb6m7c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-492-kvh7cwAMOgWQi3VQpKNWGw-1; Thu, 05 May 2022 18:04:25 -0400
X-MC-Unique: kvh7cwAMOgWQi3VQpKNWGw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ba21-20020a0560001c1500b0020ca6a45dfcso3827wrb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 15:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ncwUrPXa6D//xAE+gUKX4W9jlEJvsWNrctcaxVQSCb8=;
 b=aGTyy2Vaucl5dtiBfHzdXGOAJeD1lVCZO+r5IscBMRcDfiv2O5Ua+tipnRUJAe6Kbb
 hVBTp06fd7gW4tkA9X21zE0Xbj/pzemr/6MmZkQpRieOl4Opg3aEwTmMgZ3rZoIcQqkT
 8gDbQ3VF4AxbWe1CMPbW8bP3Znnms5T86wLq0OnhvNewM8P99YMJSMsGTEyQ3mWPtloO
 poTOS3Sz/YtVHVroMt5bcAzzWFsqdWA+9HIbN2pT/9ZVY6U1MLQIqlYuX0aDuZc3+CVe
 dfBav58RSr2SBS9viPhW0OShNHT185gZwFCnT0DjEYDYdHho6MXXDkPBjuofMatb3ul6
 Hl1Q==
X-Gm-Message-State: AOAM531HbyeRwAnqQJYOl7WoEx6I5rGasZL98/UvETO7d88SLqNmAjUe
 m3eGKxqvQWTYfh+37PiMRIUvEKHdXxZO8gxF3UuFy4JdPlh7Mnmyw5v/FAnQ8q1AuUg7eIhhIzt
 SRKCPQobUUvCTwogPJv1vFSqjupFS
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr6726652wmb.29.1651788263959; 
 Thu, 05 May 2022 15:04:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfwhAOIQeVF2O3srNOg8rIqNBWMADJBM0ucjW4JDKss+KaRrP/Oe0Hd/iuu0biw9+SXEcE9g==
X-Received: by 2002:a05:600c:3d8c:b0:394:6097:9994 with SMTP id
 bi12-20020a05600c3d8c00b0039460979994mr6726643wmb.29.1651788263758; 
 Thu, 05 May 2022 15:04:23 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 m21-20020a05600c3b1500b003942a244f4bsm7980875wms.36.2022.05.05.15.04.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 15:04:23 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] fbdev: Prevent possible use-after-free in fb_release()
Date: Fri,  6 May 2022 00:04:13 +0200
Message-Id: <20220505220413.365977-1-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220505215947.364694-1-javierm@redhat.com>
References: <20220505215947.364694-1-javierm@redhat.com>
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
Cc: linux-fbdev@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Javier Martinez Canillas <javierm@redhat.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
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

