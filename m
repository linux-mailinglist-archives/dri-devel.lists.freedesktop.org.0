Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9B17F0520
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 11:15:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D4510E19D;
	Sun, 19 Nov 2023 10:14:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E979A10E19C
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 10:14:52 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-53e08b60febso4889280a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 02:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700388891; x=1700993691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
 b=QGrDUVdwHeS9uLohJ8ItSxzWM17pYU1wm8beVqLYZKbbF4KbJrESxEDDAt6FUikHfz
 pSmjwpeuelhLfwKDmsUaJsv4rN75tbL46Kza+ZGuTweGHVb7W2Gt8rnwvYRaiZKVWGZR
 InXprjXSd9ATgLK8yY1x0ODw/8f0apncGwYmUac9rErBLaxlIoMiNentMhOyIGvO2gyX
 tbPfLwswgQr3Oq6Oc6+NyHVBh2pP7ASLx4bh2aJJhyAsnji6Lh0O2A8q50wTWVlM5pkt
 ktTzVXUed/4pmSnkWyhTzM8CTyQJ4gjEk9WBqtnvW4L6q3JHW+dhIU08nM71NLmnHjA3
 MMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700388891; x=1700993691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3j9ifWvhNZGTq3IiSm2aJzZT95r7nTZmkK8TlD5sXtw=;
 b=itraD2cC1qguMqHrW3H1nUZ86ko+y8IwvJZGiWXgXSNC4ge04rFJ/DsAo9d7LWkdD2
 fvgSsaqoLaOhXfMrLupxFkv1Oei1RaFPbJdfGW3Nev5SHZAFefqUKDwQvbgIPB0FurPA
 LqfyesnL111uVymC/9jz/N7lmY5mEJMauo7Yh3YBslHEGJOL8patjUgy1HHIzDYBjDD8
 XNPHn9ZRchKMnSsESfAsRs4ou2XTB8RKAa6v4VWPHenKpel71iSMsAmvI+LusrUwal1b
 0RszCxjVLpe/vWeeCqafwU8TuTT8worxkpL61LBnsaxrYH75z7HNpoIBwAF+qQgqxtPD
 kFMQ==
X-Gm-Message-State: AOJu0Yzvqu7yj4/MI3IJG+AErkA9UKkuamlnQl2QIh4KmacYjiz3GxGG
 Va7toYbyzbBk3w9iVV5rNCo=
X-Google-Smtp-Source: AGHT+IHk2xu3Z7VHdNC0cDI4LceA/80hAyskiv/hXJYF6ETvfNGrJOqk/TU7oB4w9TiA7tO07j1rfQ==
X-Received: by 2002:a17:907:9483:b0:9ba:1d08:ad43 with SMTP id
 dm3-20020a170907948300b009ba1d08ad43mr4137673ejc.70.1700388891276; 
 Sun, 19 Nov 2023 02:14:51 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 p20-20020a17090628d400b009928b4e3b9fsm2743581ejd.114.2023.11.19.02.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 02:14:50 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v3 02/20] drivers/gpu/drm/mgag200/mgag200_i2c.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 11:14:27 +0100
Message-ID: <20231119101445.4737-3-hkallweit1@gmail.com>
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
 drivers/gpu/drm/mgag200/mgag200_i2c.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
index 0c48bdf3e..423eb302b 100644
--- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
+++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
@@ -106,7 +106,6 @@ int mgag200_i2c_init(struct mga_device *mdev, struct mga_i2c_chan *i2c)
 	i2c->data = BIT(info->i2c.data_bit);
 	i2c->clock = BIT(info->i2c.clock_bit);
 	i2c->adapter.owner = THIS_MODULE;
-	i2c->adapter.class = I2C_CLASS_DDC;
 	i2c->adapter.dev.parent = dev->dev;
 	i2c->dev = dev;
 	i2c_set_adapdata(&i2c->adapter, i2c);

