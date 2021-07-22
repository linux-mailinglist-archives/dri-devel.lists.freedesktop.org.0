Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4891D3D20F4
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 11:30:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3121B6EF21;
	Thu, 22 Jul 2021 09:30:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B5636EF21;
 Thu, 22 Jul 2021 09:30:22 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 h6-20020a17090a6486b029017613554465so4651006pjj.4; 
 Thu, 22 Jul 2021 02:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A2l/KYBC3bXoznTgQM09vSdqpXWqmsKUF+1UGlqjuAs=;
 b=iVpkBp98NPm8dzyyjh2eWotbxQtjnGNI1V2cdYfzEqO8V2JwfDNWiljVhOnth5v9vV
 JCLZ0eWSPMARC4eF7+5anNLBscRUOCtfHoDE9BKCnZ7WlthaGsCOmK+QXDfEM119EHAs
 9zlgS5BKQXnuI/wObxt9KXRXzsqsbN2pSrv1E0A32+AJpLQstfJPNoTDW/ZyBMRsjUP2
 r2sAKbAPGA3A+lGRQQztqiF4D5bzJk3Q+J98dqlC5BzylIBi16x4VN1uqrrEBkPEEset
 6PuSnPzJSKGWMrW1iyPf8aoz8Uha7BQm5bq2xoH9ONbdjpUqxiJjkvhO0EgprYuGFl2/
 dqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A2l/KYBC3bXoznTgQM09vSdqpXWqmsKUF+1UGlqjuAs=;
 b=hC4xR1sLfaYe2wN7Cn9idfvvgQdqtXvCK/Kvm0JoWz2eoqLtTxL3r3Tm8H1nZgXc3K
 9lFpHi3/wewaa5OAmA2YEYFPa04WEZuzkhb4kCi7lQWW4ihpTpeapVKxaPmFAG4r4Q+E
 mQ5j+x1t22DL17KP6WSyKODTV/D+vWFwY+xVh0CH8uUrnIX9sZeLIMxC7AZuv3j7hw2W
 rWyIW7zWZ/nBsViPWTOijVrVQg17LyFfPja4Q55x1FPx2zWVk8a+OFHCT6pFfA0dnvPc
 yNxdzdpy7EutMmPtkugzrZVXQzvJo8zouhp2SlsIu40mq6ruhmVPT3TbFWGXh4EHuKoM
 3vPw==
X-Gm-Message-State: AOAM530zOWG35Hjhh/InZ0fwGLfmDHeZI8fzBIDv86rESDogmF/8yu6r
 QzViPFqXNsnY79qypkfzQtg=
X-Google-Smtp-Source: ABdhPJwWSq7bPLEO8MIHqEQ+hopaL1ENBkio6HpKz1UWTD3GAqFQS/Lxme9q8QwdqhvLTnGtDD1QDA==
X-Received: by 2002:a17:90a:8811:: with SMTP id
 s17mr8215397pjn.171.1626946221835; 
 Thu, 22 Jul 2021 02:30:21 -0700 (PDT)
Received: from localhost.localdomain ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id q5sm1069592pjo.7.2021.07.22.02.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 02:30:21 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: linux-graphics-maintainer@vmware.com, zackr@vmware.com, airlied@linux.ie,
 daniel@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
Subject: [PATCH 3/3] drm/vmwgfx: fix potential UAF in vmwgfx_surface.c
Date: Thu, 22 Jul 2021 17:29:29 +0800
Message-Id: <20210722092929.244629-4-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210722092929.244629-1-desmondcheongzx@gmail.com>
References: <20210722092929.244629-1-desmondcheongzx@gmail.com>
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
Cc: gregkh@linuxfoundation.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 skhan@linuxfoundation.org, Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_file.master should be protected by either drm_device.master_mutex
or drm_file.master_lookup_lock when being dereferenced. However,
drm_master_get is called on unprotected file_priv->master pointers in
vmw_surface_define_ioctl and vmw_gb_surface_define_internal.

This is fixed by replacing drm_master_get with drm_file_get_master.

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_surface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
index 0eba47762bed..5d53a5f9d123 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
@@ -865,7 +865,7 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
 	user_srf->prime.base.shareable = false;
 	user_srf->prime.base.tfile = NULL;
 	if (drm_is_primary_client(file_priv))
-		user_srf->master = drm_master_get(file_priv->master);
+		user_srf->master = drm_file_get_master(file_priv);
 
 	/**
 	 * From this point, the generic resource management functions
@@ -1534,7 +1534,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
 
 	user_srf = container_of(srf, struct vmw_user_surface, srf);
 	if (drm_is_primary_client(file_priv))
-		user_srf->master = drm_master_get(file_priv->master);
+		user_srf->master = drm_file_get_master(file_priv);
 
 	res = &user_srf->srf.res;
 
-- 
2.25.1

