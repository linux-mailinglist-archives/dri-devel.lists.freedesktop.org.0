Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8AA17F05DD
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34CD910E1E9;
	Sun, 19 Nov 2023 11:29:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 328F710E1CC
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:46 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-5484ef5e3d2so2689398a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393324; x=1700998124; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
 b=ae3QS3eSQtfo2vUbwiVftuu8OjupILWuQQosrE082q7FJb7SbAgPGmoJdTdpkmcypg
 jWr5ejw1H1Qtcze6MGYFKHdWWQwj0DxX21+ooj/GAShpj0d1EqBf8fxp456UTKZmaIMa
 Jb45i5/Dqz/frGpMUCGkpqEXqUMOjjMvjFz98Ofr1HTO5KohXLg8mTwtfT8jZkFVUzqM
 EMLYp7rCcuOLWnaE2FxHymvGFUNLvRDj8m2ATztHkq2FUBWVA3EAAJD+8uK7+WtsFumQ
 rdBqJAarGsc1kpQmITdfBmyYsnitlLrq6YTtAjei5M1zpyN1OmSjzAVPK7sKrjIKXZwU
 a2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393324; x=1700998124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
 b=JZb9Io3XjrE4GMB2ODmJXvgzJ3aSLk3oIu6eVKvhp2G5QDamC3KLyaXELwaBkLbaJq
 fctAUQG4l5FXvfQvxXbyUWhTDc2gf6xQ7vEr1hsLyCcnkpfg1dhYIZ+X+FucNuRGlF+v
 zrPQI6PU1WqRTrTcpuI4KmE6nLuitI9+XSNL5eYcdyHd30t+5kixq03cJsLgQ2zr3xmF
 3eUrwQ7kVMaX4IzyDCGCNzVZGPKE725P8wLFzQTA1h2Yvl5Pjh1p2qmYZ4oEl0HpUFmb
 pPQaZOmlsu/VnGVaD/1Iq1e++UikZKF6k4ml6ghNqwV+Pn48mqew3rclIEmy+Po3vZw9
 1oRg==
X-Gm-Message-State: AOJu0Yzw0++UGfl2QPTqr4x6bVy7czVePUNMdSbdarAj4eW0wIUsdCgS
 CKVwuEF3cbRsUfIJCFaWouM=
X-Google-Smtp-Source: AGHT+IFb7FJqtaozsUjTf6lsnbfpB7UGN4+3ECKCKWY6V95FP/oQIeTwzIueiarO6eHMyVbgM8bRWg==
X-Received: by 2002:a17:906:446:b0:9e7:3af8:1fd2 with SMTP id
 e6-20020a170906044600b009e73af81fd2mr3244286eja.58.1700393324637; 
 Sun, 19 Nov 2023 03:28:44 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:44 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v3 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove I2C_CLASS_DDC
 support
Date: Sun, 19 Nov 2023 12:28:22 +0100
Message-ID: <20231119112826.5115-18-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/ast/ast_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_i2c.c b/drivers/gpu/drm/ast/ast_i2c.c
index 0e845e7ac..e5d3f7121 100644
--- a/drivers/gpu/drm/ast/ast_i2c.c
+++ b/drivers/gpu/drm/ast/ast_i2c.c
@@ -120,7 +120,6 @@ struct ast_i2c_chan *ast_i2c_create(struct drm_device *dev)
 		return NULL;
 
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);

