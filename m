Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EAEB4F1A2D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Apr 2022 22:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0C4810E23F;
	Mon,  4 Apr 2022 20:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2887310E285
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Apr 2022 20:45:45 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id c4so8843436qtx.1
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Apr 2022 13:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xWDwz8oUfFyMvnxzDfOkFjo5IscFGHgrVHe0iuMEWrE=;
 b=Ms/EctuzI5X8IlOM+jLJHEC845Ng1trRw6wq7ItRLO6KY+/nrhq8LhmgPAOIGuko06
 lRkxNTA1PcedEs1RaEKrTirI0akwvB4yDTy8ok4avvM+eN5OMkZ9hoFiiFkkH6ht2lX+
 +CI3Klj7YidCqEi8hiukgsWuCniKyw08vU0QqQCrJ0EdhPX61py5VKTPtpiXLLUmCgep
 2sOjuuO/607HJlldaWTWXbhd55tPSfBMYkArVAPHfUMdxq6tsV1AoJzAK9fv1bKB7nwg
 fHQ2HcyCnOjVL7ck7+og7pNaChFRDD44iSN7e/ztUU7Pid+uUbR8LsXDyZGlEevlbcOt
 h2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xWDwz8oUfFyMvnxzDfOkFjo5IscFGHgrVHe0iuMEWrE=;
 b=gVf1LaKSwbJE540XOUiT/IMIYX/FUi6aJoOcKww4WK69GqIJw7Vx4JIZCkoewQSy5D
 DrYJ+tlGmYZJMcrf26qaiufbcyTdVnqCRv97FTGoun4THBdm3QKDgmUmko6+dQvisk7/
 7xP2yVoFErjXWs+SQGSc1BfGA9gBnE8Jh3dvDF02gBWXmeIBqrPw3HEN9/8lbvWT3D+i
 uAit9IW08KJsonlGb08x3qRtqFA3TV+OwdE7/npiEHRspAuccoH9c8Ddccb++b0FTTXz
 S4js1Hoqbsy482cPIUZnhoaaxmxTXVcRZS4I5jmGuPHSdm4oEPO0SO74EhuGSZQEnZMW
 ZYtA==
X-Gm-Message-State: AOAM532u4jF0jQ7kI/IgPwaCzWiY1QP3vXO/cM0DL8uYXaH2iB782jnP
 qgybRMpW1N+eV6SpefpkI6Y=
X-Google-Smtp-Source: ABdhPJxDPYP75UTPXYtxd4dVuIu0vAV4eWGjW2PVV6lRerhf1/TR9PK/+n2mmqrdNBpPzFIeVuCTdw==
X-Received: by 2002:a05:622a:17cf:b0:2eb:a616:76fb with SMTP id
 u15-20020a05622a17cf00b002eba61676fbmr122285qtk.613.1649105144317; 
 Mon, 04 Apr 2022 13:45:44 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f4:7cc:26a1:e446:de76:c0b8])
 by smtp.googlemail.com with ESMTPSA id
 m10-20020a05622a054a00b002eb965bbc3esm9630548qtx.93.2022.04.04.13.45.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 13:45:44 -0700 (PDT)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v5 2/9] drm: vkms: Replace hardcoded value of
 `vkms_composer.map` to DRM_FORMAT_MAX_PLANES
Date: Mon,  4 Apr 2022 17:45:08 -0300
Message-Id: <20220404204515.42144-3-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220404204515.42144-1-igormtorrente@gmail.com>
References: <20220404204515.42144-1-igormtorrente@gmail.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, leandro.ribeiro@collabora.com,
 Melissa Wen <mwen@igalia.com>, dri-devel@lists.freedesktop.org,
 tales.aparecida@gmail.com, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `map` vector at `vkms_composer` uses a hardcoded value to define its
size.

If someday the maximum number of planes increases, this hardcoded value
can be a problem.

This value is being replaced with the DRM_FORMAT_MAX_PLANES macro.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 9496fdc900b8..0eeea6f93733 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -30,7 +30,7 @@ struct vkms_writeback_job {
 struct vkms_composer {
 	struct drm_framebuffer fb;
 	struct drm_rect src, dst;
-	struct dma_buf_map map[4];
+	struct dma_buf_map map[DRM_FORMAT_MAX_PLANES];
 	unsigned int offset;
 	unsigned int pitch;
 	unsigned int cpp;
-- 
2.30.2

