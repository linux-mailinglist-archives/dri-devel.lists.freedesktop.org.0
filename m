Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BB97F055B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:16:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1501110E19E;
	Sun, 19 Nov 2023 10:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C38B310E1C0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:15:06 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9e28724ac88so474036366b.2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388905; x=1700993705; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
 b=Y2IowoXktNvmW7ZH429UTwF8P2nAOUZHdDyTGljvOaLjJ3ourIYO5nviBpKaI5hkzM
 TXAW8s/7UwRM6tfU1x9NqVrkSw3fgu/H2fa9V9qQYtoQJR28gzqOBK0am0+P6IsRJ2Fq
 VKqVuEQQwt5m5VsJvmkieBZtpZP9Yv7ZGZtjEhEpAr0CKXKT8vAYwmbOsx1ZQlJ6Xomb
 CTo9Fx4VG9Vakx06aJbjdt+9x0jQHxZ7rJwGm96DeIWUquiGWNtDwBBU47lVIU8p9RZS
 0dMFSBVfcYKUC/x4F2oWYuvbwHmU4CHB2lvdgxmA4euNRc/J69MQHZo73kfPiXG7kxIM
 6jZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388905; x=1700993705;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
 b=QzG/7jaPa9niIprxvn0T+yQ33vl/EPOk0JGE7ccWm9rbe3hkAEUL+7hZX/xiv5nNWg
 XBLLziTMdcUOmz6IzxpHL3VSjO4Eqt7RycrIlTmZlsxs/Q12NLJL6KWbAAgyEyRGmXHc
 w4GLMuMH4k1WDovn10qEWDOz8v421/KAjDx5pcRdFRFA0IfOpy/Q5Vh5KbihdlNTs/jL
 EOzymzW395Gn76fn9vSN/310GalVpukpPmM9GZYCHOxRA4jue5fR+SN99goSs+OU2VD0
 D4No1iib0+OIk97UbwdSkcIVVFoIHe5XW5uUj4EtRuzaJ1RK+uGB2dP0mEuegfJccUYP
 IIHQ==
X-Gm-Message-State: AOJu0YyOvvP3VCPgxZapyoTGQFrikRbWcYT3QWn7n6Okarhq4dTE6cjS
 TqmIrv1iE6yz343wodhi0c0=
X-Google-Smtp-Source: AGHT+IFVvZzXcZMoSvdXbtJGqi8lBJ7fXTKr3foFJmhtdb3r+iUKMa2DPobEi14a5i6AA9++GYiikg==
X-Received: by 2002:a17:907:cbc6:b0:9e5:2c72:9409 with SMTP id
 vk6-20020a170907cbc600b009e52c729409mr4079477ejc.43.1700388905079; 
 Sun, 19 Nov 2023 02:15:05 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.15.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:15:04 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v3 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove I2C_CLASS_DDC
 support
Date: Sun, 19 Nov 2023 11:14:42 +0100
Message-ID: <20231119101445.4737-18-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119101445.4737-1-hkallweit1@gmail.com>
References: <20231119101445.4737-1-hkallweit1@gmail.com>
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

