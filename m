Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDACE63E062
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 19:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D3610E4AC;
	Wed, 30 Nov 2022 18:58:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D49F10E4B0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 18:57:56 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 3-20020a17090a098300b00219041dcbe9so3217343pjo.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 10:57:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=443GVmcToH/y8glGR0fFoR2riM937PfQ5f3l05L3jxo=;
 b=nU5cx5ZeKoq3BQaltqdsx6egPMVueQQzwxAPy9tlM9TmEdoE3QctSFV5PK711ntz+M
 c3UIPubekuFGIAJW8HGycbOjmB4h5XlOpZK00YpUtvh6TszI58RY4FyR76sBEYXCRpJ3
 WZgg06t29/5muKCfY7GxFyilfZ4chVwf2O/4txjgp3U+pS+x1Qcerl0t/Xj0H5uDbMus
 1eZR+BfVQZBVA3ctLiURgDnE5yo9nje22jRt3h9ZalnN5DYLS364MiwA9Off5ZZfuIUH
 dQ+/NB5/sHleF9fmbkuZUsIVWh1L686M/A/wp/lMagmZtzYKlgXvlL7OaT3nBWi1gX2V
 NFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=443GVmcToH/y8glGR0fFoR2riM937PfQ5f3l05L3jxo=;
 b=jUq6hUag4PlwPK0agn6X0GxvAHQhdfh/I8loJkXdPKHmYfg16Mk9zZIgQwOJeZaRtL
 AN2BoWQdwkNTvBksb3UBLp4CQ1lUy8ayFIfLEMm8J++v+VMKNrQMrP1m9VQ8zQfCZ0jT
 1sfRIKQEOA5Sp5178zyTOHTF0h54hNKosk7pXsWevNjcEwr7O2TyT7TnNDbe3u5/qH3y
 OSu9DePWL6rb2riZCFmEaMsvlt8eR06g6+G3cB+4VoFQfuTeJvvWIi3EZXuyvLUEYvD1
 gpEy30XO+e11eTZ1Tx9L86Tr1J+NzoKXUAgm4brEWGNMXXm6231Tsr+8QB73HKajk5yp
 Iqzw==
X-Gm-Message-State: ANoB5pmV6zFwMlxWK8LtkgnliUzBCUUhdih0XdZmCS4C+kvPkv2dFVIR
 slxSIgHAYl0NO0r0P0EdEVWXar1JNTk=
X-Google-Smtp-Source: AA0mqf7TzMsWbL38UL/eRb+KGt8aU0pyZLP1+wMxjW8tk5BT/J69QqzSiQrv4oAbTk6NlputMW1O1g==
X-Received: by 2002:a17:903:2112:b0:188:7dca:6f41 with SMTP id
 o18-20020a170903211200b001887dca6f41mr43302945ple.72.1669834676369; 
 Wed, 30 Nov 2022 10:57:56 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 d6-20020a170902654600b00188f3970d4asm1823737pln.163.2022.11.30.10.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Nov 2022 10:57:56 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/shmem-helper: Remove errant put in error path
Date: Wed, 30 Nov 2022 10:57:47 -0800
Message-Id: <20221130185748.357410-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130185748.357410-1-robdclark@gmail.com>
References: <20221130185748.357410-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Eric Anholt <eric@anholt.net>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

drm_gem_shmem_mmap() doesn't own this reference, resulting in the GEM
object getting prematurely freed leading to a later use-after-free.

Link: https://syzkaller.appspot.com/bug?extid=c8ae65286134dd1b800d
Reported-by: syzbot+c8ae65286134dd1b800d@syzkaller.appspotmail.com
Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Cc: stable@vger.kernel.org
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 35138f8a375c..3b7b71391a4c 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -622,10 +622,8 @@ int drm_gem_shmem_mmap(struct drm_gem_shmem_object *shmem, struct vm_area_struct
 	}
 
 	ret = drm_gem_shmem_get_pages(shmem);
-	if (ret) {
-		drm_gem_vm_close(vma);
+	if (ret)
 		return ret;
-	}
 
 	vma->vm_flags |= VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP;
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-- 
2.38.1

