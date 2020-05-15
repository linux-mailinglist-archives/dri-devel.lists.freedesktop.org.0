Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E471D49FC
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAE76EC3A;
	Fri, 15 May 2020 09:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD356EC35
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:12 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id f134so1679103wmf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gJhPGZFo6yQauL1OgVWozjoNA81pY8H8RIemQ11igo4=;
 b=hHuHdjufFaoqO7s1OPjO+kOhipZ9+cdDo9oJr5iTOwc9DNaAo5P0q96M4xKv2YHyav
 FbqInA3mCUQ+apbd2UzzPEir9Bh6WDWzGXM26Q3tLfMcKiMSeV3uMd2GhaaH6YUAit2v
 zAQ0QpSpXfj2165qEDJQWqKAfCA6AnsZlFdCKmM1Hapg4IUEAiVTSK9Inp0CxldqeBCp
 SSfWE7/Pu6IVgCLQsRi8p1gMcbHc2rXlQZkyQXnQY5ePLpCmuP7dkV070pn2qnhwR295
 yHt5m357OLNv4uuKAFliqrwt88vfey2biuYvEPNjdYw2BPleGRieyuBTiuqvYBkanW6z
 ypWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gJhPGZFo6yQauL1OgVWozjoNA81pY8H8RIemQ11igo4=;
 b=HbhzQpYotETUIwTZyFvV3dVQx2CWMCCyHSy2P3VhACsBG+pmKTAvfaWHN42IkXDVdJ
 wFf0ayXVYsJERhg7DOEHcIIhuyGZgh8lvdOlwNagQwd4mPunSYnmOeAbA0lgoi8+THEr
 Z8PZg2tiiX9JiIIO0ljUdzUtrM9QgSWFJZqHefb2CKHV3q0ai0g9+31DnQyxBI/B3i/J
 r/3TaHZmdZy3JVVVeIPf1UCydjJrGgmjDyE2lzuj9wS0FbyCqD2uTxbwn8rXuocrqEHx
 h1JPcM6iAUqHOjN06a/iaN/8nINXGh3WphvZaBwd6hCXQWC0uGnrZsC5ceCDsE1P+Y9Y
 SAOA==
X-Gm-Message-State: AOAM533JDEWNiSNieSSy4cba1pLqezXxKDZYsxagUY9F7tWVfTJ+Pzih
 V1P5z9MJ3H26zNGL9N3GBzKTNoGO
X-Google-Smtp-Source: ABdhPJziqgckZcbAYrwBD42yFqqQnr9zkuS3qv+aqq8haGrfOSaeIpCAq/iIvH8jPlAjzrkVnPecfw==
X-Received: by 2002:a1c:a952:: with SMTP id s79mr3035759wme.153.1589536450823; 
 Fri, 15 May 2020 02:54:10 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:10 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/38] drm/gma500: Use lockless gem BO free callback
Date: Fri, 15 May 2020 10:50:48 +0100
Message-Id: <20200515095118.2743122-9-emil.l.velikov@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Emil Velikov <emil.velikov@collabora.com>

No dev->struct_mutex anywhere to be seen.

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 2411eb9827b8..34b4aae9a15e 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -507,7 +507,7 @@ static struct drm_driver driver = {
 	.irq_uninstall = psb_irq_uninstall,
 	.irq_handler = psb_irq_handler,
 
-	.gem_free_object = psb_gem_free_object,
+	.gem_free_object_unlocked = psb_gem_free_object,
 	.gem_vm_ops = &psb_gem_vm_ops,
 
 	.dumb_create = psb_gem_dumb_create,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
