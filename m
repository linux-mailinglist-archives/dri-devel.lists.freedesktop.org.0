Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53B7B4595BB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 20:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A8C189CDD;
	Mon, 22 Nov 2021 19:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D38789CE2
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 19:44:17 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id ay21so38847883uab.12
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 11:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g8AjUosguFFwtSTTUN5QcdLFCu3iDK1fKV4GOcMHHcY=;
 b=pbFrqlUVzhnm5n6ITTPe9DCbZp2i5cNyTuiDngpN//1z4QbeoGsaDefKTFXO0FArQN
 1rKFnY8w3H8mqSj1xkPl3UUZSokwKzSnLzKMt0Zpop/uLXpksw8mLlzpUT7rvDbN8yHY
 YRuJfpmo+MBXYor3ssXct7tplTlfgl76Mh5JnZdId+tiv9znl0MbdxPetZ96wKaGX3eu
 4bF9r7Z6kU5tGkulOyKFzMlvIU48VNaJ/DxKTYiAhzB4dFIcoFQqtjENkz6MkDGcg9l4
 jv+7NRCS39r2Oe2b0V6Vqg/RFB25/RM3500ZwpM24v/PBlxhjgvfvZKNasn9CWeaEU5l
 w2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g8AjUosguFFwtSTTUN5QcdLFCu3iDK1fKV4GOcMHHcY=;
 b=mpODUzVXHCR1tf8+ODAbaGK/mEw5ZnL1MF6263lPRRdzbcdVtiYLsPcToz2E5HSsXO
 5xSZAkQAVazn19NGG9dJoYYhqekUFGOZ2Cyk0nDiaIfxKsqSejCp5JrOivHxuvhkoReA
 JgvFSE2BwMsM7vH8KaOi/E2LrbqdVJIbqxgrTBE6V04PxwOcNtB5EcuUR/YUGCKq6b3e
 7Dk7XujUOFt5yHdgGfPCrjE77rS3nziGj5xAoZ6z++Ye26yEotWTM2x805vv2ivEDV2s
 R3B79pGVQDJpP46GPAyC60Ry64Y2wXS48NFeXqbqZN7bEfAvHyKhGrufRlo/vz9T0+tc
 s06w==
X-Gm-Message-State: AOAM53236zUfW26K0W2nIK9YDCtOaB0Oq9Z8A0zxgwRDVMkUj5lsucwd
 /fj3A2Q/cDcw0lVB6Krqs9/eTjAjLNM=
X-Google-Smtp-Source: ABdhPJwHZQP4Fjum3BGm4aecFilfgPGt8v6zOQj3aG+9E8GdQ5PtBDOiQ8DLQmDeILjB+q83Zk4SSw==
X-Received: by 2002:a67:bc16:: with SMTP id t22mr123648366vsn.10.1637610256673; 
 Mon, 22 Nov 2021 11:44:16 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7f4:3a5b:14e9:b724:f63b:b22b])
 by smtp.googlemail.com with ESMTPSA id i27sm5269373uab.8.2021.11.22.11.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Nov 2021 11:44:16 -0800 (PST)
From: Igor Torrente <igormtorrente@gmail.com>
To: rodrigosiqueiramelo@gmail.com, melissa.srw@gmail.com, ppaalanen@gmail.com,
 tzimmermann@suse.de
Subject: [PATCH v3 1/9] drm: vkms: Replace the deprecated drm_mode_config_init
Date: Mon, 22 Nov 2021 16:43:52 -0300
Message-Id: <20211122194400.30836-2-igormtorrente@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211122194400.30836-1-igormtorrente@gmail.com>
References: <20211122194400.30836-1-igormtorrente@gmail.com>
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
 dri-devel@lists.freedesktop.org, ~lkcamp/patches@lists.sr.ht,
 Igor Torrente <igormtorrente@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The `drm_mode_config_init` was deprecated since c3b790e commit, and it's
being replaced by the `drmm_mode_config_init`.

Signed-off-by: Igor Torrente <igormtorrente@gmail.com>
---
V2: Change the code style(Thomas Zimmermann).
---
 drivers/gpu/drm/vkms/vkms_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index 0ffe5f0e33f7..ee4d96dabe19 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -140,8 +140,12 @@ static const struct drm_mode_config_helper_funcs vkms_mode_config_helpers = {
 static int vkms_modeset_init(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
+	int ret;
+
+	ret = drmm_mode_config_init(dev);
+	if (ret < 0)
+		return ret;
 
-	drm_mode_config_init(dev);
 	dev->mode_config.funcs = &vkms_mode_funcs;
 	dev->mode_config.min_width = XRES_MIN;
 	dev->mode_config.min_height = YRES_MIN;
-- 
2.30.2

