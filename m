Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CA87E9B10
	for <lists+dri-devel@lfdr.de>; Mon, 13 Nov 2023 12:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91DCC10E356;
	Mon, 13 Nov 2023 11:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E3110E081
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 11:24:18 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2c50ec238aeso60843601fa.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Nov 2023 03:24:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699874656; x=1700479456; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
 b=T79ghEM5OWRo/EGIsGU1zjgPHJAtJzwh6zhG4XsHM0hL6WhenVM1iHWdmaIOgj14/X
 vjjPCwBEq56tA0KOpVfE0EU0uSWhcgzkw2szsZkOsc3LQNzg/DCPttKpDqKAtxu9CpeL
 ki7i4xeVZbuTHoMjip8MNdAv2y7SZBSzwJlGg03EsniWI26BbaSSaJwpFfAwZujo0ZaX
 P5vKdWg2KHq4EHPbyFpwcZZmZQWY/pdFsKzY7iXQOQtbH3BXOqMN8w+bavAW237VZOGu
 GkMlH4VL7SaebxEAbyDTDVKRNlsHkALPGGIzy3DfewXiZBdyj5qDyP/M7l34dQMGBUla
 gghg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699874656; x=1700479456;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e72KmLCJ3CDoJCk97GYas08RIDfDHJvByQpoDflcW58=;
 b=lqhXKHY78j5Me0arf6fMO+hYjo4cSscBXjVNxHlu/uszTBvYdhvgLJGkFfrsKJthxz
 cPUhP4fJCzGwgDueRAOMHQAF5K+EpBUbBxBU22o7nfF5EBhtewCdG/o4C+81NQWvdje0
 Brd0/06soTFmZjMalzOOqjxPTpGnb2x1plNKuRHkW0kTyvAMtdPGORHSBx7DIXcVRY8Y
 9glvjgHH0hR8fIAzo4WOKEv7i0rF6/AEJgJZjShpTqu2M1gQZv7OqGmRBVe/VdgIgB4+
 92X8atUYQ/ErSvXWtp7qezLX3McnceJXD2fT7SuxihusEHeKBRzZZEA6rUWoO9yK8uTL
 yJrQ==
X-Gm-Message-State: AOJu0YzRUrhsTUuizHt9jQhkuZ9BmdUHvbpy3VpGY2yWnYI8KUkYANqj
 TanBVDdtYRmq96z8FRRKsu0=
X-Google-Smtp-Source: AGHT+IGwZkPMUDnYf7aWTcm7+nEKhgTcMFQj/pdloNSaCeOKlzkBATJoAqDNZ0r9EMoXYM2oSPX3zA==
X-Received: by 2002:a05:651c:1049:b0:2c5:1f70:a266 with SMTP id
 x9-20020a05651c104900b002c51f70a266mr4020668ljm.50.1699874656613; 
 Mon, 13 Nov 2023 03:24:16 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c22-6e16-fe00-2223-08ff-fe18-0310.c22.pool.telefonica.de.
 [2a01:c22:6e16:fe00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 l19-20020a05600c4f1300b0040772138bb7sm13565787wmq.2.2023.11.13.03.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Nov 2023 03:24:16 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove I2C_CLASS_DDC
 support
Date: Mon, 13 Nov 2023 12:23:41 +0100
Message-ID: <20231113112344.719-18-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231113112344.719-1-hkallweit1@gmail.com>
References: <20231113112344.719-1-hkallweit1@gmail.com>
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

