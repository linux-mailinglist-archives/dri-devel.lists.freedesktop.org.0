Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6681D4A02
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B22C66EC37;
	Fri, 15 May 2020 09:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F106EC37
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:20 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id i15so2752987wrx.10
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PasN3W+D2oQqot5e26TwMNatIzqzako2o4xSnkb4yyE=;
 b=KOVy+6BuuQhwNc3+thbObORaoaD52Frv+Wua2mM8Ftt5/b0MTsxAIIroHpfysWACCH
 pgdLxICASyfIUgs+MI7J966a3vmmC+Oz8wF7NqkEsXXZGp3PEnM7va0F1kzZwBTBdOOy
 E3X1q4g0A57iPckmglLi7RPmM0c0+dIaTxC0tA/cNRgx4Y9fpNqybzRL9iRCJC4dT2S8
 qyHFvj8ny0RUo4g4ptpc0uWvfRLLM1RQraUA6fY9ZeqgOkhJVSBllCXKsqrGI8IOFMIf
 QCxkIkAwkjf/wD0gHbdcxqdrknl1WUIB9jpaLLnhxYLgnWUCImz/SJ/a4L1eojVT30/j
 hUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PasN3W+D2oQqot5e26TwMNatIzqzako2o4xSnkb4yyE=;
 b=Jb5tipDYq98nxntuL2w+XyLYUBX4QYOYfHKPygVxEHOAC7j6CDAOkxssKcLAyaodRa
 5PptWFoi1Nv+mU9VXjf30E5SK24cd1iSQb7oHnG4UU5mXsrgStWh5duBDJdYtxX5Fzgh
 0qHk5X2jYFLqv6obQY6CtZS1UNXE41pmga1b2lCaz2xaWFj3OCwYzIHK/DcXn9UJ+9lG
 2GNHr1RB6O15qQSoLuQN9k4qU6vXZWWmvGxA5j2coVAq6+XjQLBYG8eJsI7JmR2xGMxa
 kJ61w+PoFqnx+7w7vennE9XshsV/lK2wG7N0GrUMYn61LfdmPQR1+iaP3dRcWUDG8MTf
 et2Q==
X-Gm-Message-State: AOAM53002MNjcobUAC6Z+XGw31j8Wchm3GZeNVPhbmtFPi6AM34Z7ziB
 OuVl6uq3AiiB2tghEksA3v3iG9n5
X-Google-Smtp-Source: ABdhPJy6whfnAu7ss2H/eEo6S/KzQKTd7exeSLiHy0qZa5Ulbvmas1hPATFMMXyi5p7sKXR7MXls9g==
X-Received: by 2002:adf:9d91:: with SMTP id p17mr3242727wre.119.1589536459006; 
 Fri, 15 May 2020 02:54:19 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:18 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 15/38] drm/arm: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:50:55 +0100
Message-Id: <20200515095118.2743122-16-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
MIME-Version: 1.0
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
 emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

Spelling out _unlocked for each and every driver is a annoying.
Especially if we consider how many drivers, do not know (or need to)
about the horror stories involving struct_mutex.

Just drop the suffix. It makes the API cleaner.

Done via the following script:

__from=drm_gem_object_put_unlocked
__to=drm_gem_object_put
for __file in $(git grep --name-only $__from); do
  sed -i  "s/$__from/$__to/g" $__file;
done

Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: David Airlie <airlied@linux.ie>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Acked-by: Liviu Dudau <liviu.dudau@arm.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 6 +++---
 drivers/gpu/drm/arm/malidp_drv.c                        | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 1b01a625f40e..170f9dc8ec19 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -19,7 +19,7 @@ static void komeda_fb_destroy(struct drm_framebuffer *fb)
 	u32 i;
 
 	for (i = 0; i < fb->format->num_planes; i++)
-		drm_gem_object_put_unlocked(fb->obj[i]);
+		drm_gem_object_put(fb->obj[i]);
 
 	drm_framebuffer_cleanup(fb);
 	kfree(kfb);
@@ -103,7 +103,7 @@ komeda_fb_afbc_size_check(struct komeda_fb *kfb, struct drm_file *file,
 	return 0;
 
 check_failed:
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 	return -EINVAL;
 }
 
@@ -199,7 +199,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 
 err_cleanup:
 	for (i = 0; i < kfb->base.format->num_planes; i++)
-		drm_gem_object_put_unlocked(kfb->base.obj[i]);
+		drm_gem_object_put(kfb->base.obj[i]);
 
 	kfree(kfb);
 	return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index def8c9ffafca..c2507b7d8512 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -349,11 +349,11 @@ malidp_verify_afbc_framebuffer_size(struct drm_device *dev,
 	if (objs->size < afbc_size) {
 		DRM_DEBUG_KMS("buffer size (%zu) too small for AFBC buffer size = %u\n",
 			      objs->size, afbc_size);
-		drm_gem_object_put_unlocked(objs);
+		drm_gem_object_put(objs);
 		return false;
 	}
 
-	drm_gem_object_put_unlocked(objs);
+	drm_gem_object_put(objs);
 
 	return true;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
