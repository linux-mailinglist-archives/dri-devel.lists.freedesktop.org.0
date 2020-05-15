Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FA21D4A0C
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEA16EC4C;
	Fri, 15 May 2020 09:54:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEF6D6EC47
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 09:54:29 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id z4so507596wmi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 May 2020 02:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYxU0sVB7JLDlLEDa5kZGpU1Yn8cbvlsGZ3jNXb2NIY=;
 b=WhtOt1Za8i21jfoG76/5yUZaKMTridARfpIeuDD5utC+FT2+ehF0pGa98/rKyvAUUV
 u3I4VD62dS/VHMmuLAFcM2jNXTLUDypm2M67M3kAqzLngbwrLfiBTykOCdVuwxZu52N7
 Jd2KUuGcgB3aOlylsg8ffalR99mtUPTfXV4OQEnczrrgyX4YUjR9npsbFjpBt3JXilLu
 brk99SpYj0hvaLWHqK+PNQ70XOQzkiFgqazJHn9ksFZ+Za8lEP12DdAhSFj4sCUoF21h
 grDpU7my+/X/Iph0IGNsG1PpwgcnTmQrfPxJbYYpX/gZuXI1ME4TqdcfNrPG6SAyquT7
 /4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYxU0sVB7JLDlLEDa5kZGpU1Yn8cbvlsGZ3jNXb2NIY=;
 b=OgEfGhq/O+TbmJxUVV1TBZIAcuOBPbWELLPzPUUPY84S3Bz5RhNTw/dPgdAsqNE/3i
 VC3c/2NxLab1qcmogsBi3XiivI7icGhWkXiFah9Is5/GRAnlW/W2AwgMnf0EALkCMBcQ
 1kHtz9bjndJ1j9FtxNVSZy6r1JamaH9kyfn8MvtM/JstOeJKbrhkjzQ/j6HuUIubim43
 t2cU0nPHjdhQaKTrhi3fb+ukU8Qn69C4Iivq/7MaxshM5jLKxEsH55ir9m8YqYDafH2f
 gHt4rgS+NsHDEMkzSUV2XqCNDmfWs/PYddf1F2ERBEmq0Q6Xe5QdZ+ED1WY1syjJlZ2F
 6GAg==
X-Gm-Message-State: AOAM530Bi/PI3Alb8IlyAYZgIp1H5IIqPPXhms926qBMLa0b5qgqrHmg
 jVyJBg/5ENtMw915fy0W7X1FKFXw
X-Google-Smtp-Source: ABdhPJzV+8/UBUnwPG7X7COkpNZ3a7KNQ5pBWd+n1GbNAoP8Um/XvLwl3+9ix/yGr4Vy1yEDL6ObpA==
X-Received: by 2002:a05:600c:2043:: with SMTP id
 p3mr3020728wmg.187.1589536468132; 
 Fri, 15 May 2020 02:54:28 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:27 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 23/38] drm/mgag200: remove _unlocked suffix in
 drm_object_put_unlocked
Date: Fri, 15 May 2020 10:51:03 +0100
Message-Id: <20200515095118.2743122-24-emil.l.velikov@gmail.com>
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
Cc: David Airlie <airlied@linux.ie>, Dave Airlie <airlied@redhat.com>,
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

Cc: Dave Airlie <airlied@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index aebc9ce43d55..c6932dc8acf2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -286,7 +286,7 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		ret = PTR_ERR(src);
 		dev_err(&dev->pdev->dev,
 			"failed to map user buffer updates\n");
-		goto err_drm_gem_object_put_unlocked;
+		goto err_drm_gem_object_put;
 	}
 
 	ret = mgag200_show_cursor(mdev, src, width, height);
@@ -295,13 +295,13 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 
 	/* Now update internal buffer pointers */
 	drm_gem_vram_vunmap(gbo, src);
-	drm_gem_object_put_unlocked(obj);
+	drm_gem_object_put(obj);
 
 	return 0;
 err_drm_gem_vram_vunmap:
 	drm_gem_vram_vunmap(gbo, src);
-err_drm_gem_object_put_unlocked:
-	drm_gem_object_put_unlocked(obj);
+err_drm_gem_object_put:
+	drm_gem_object_put(obj);
 	return ret;
 }
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
