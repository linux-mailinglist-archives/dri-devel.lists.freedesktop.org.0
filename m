Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 049ED7F1F95
	for <lists+dri-devel@lfdr.de>; Mon, 20 Nov 2023 22:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F19BD10E1F1;
	Mon, 20 Nov 2023 21:46:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E580710E1FC
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 21:46:44 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-332ca7f95e1so703344f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Nov 2023 13:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700516803; x=1701121603; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqROwQG7N3qrkO1+o2zNL4maIfyYwDDg69jSMCtjk0o=;
 b=dJFydR3k47bYm5j/972jfDk2rPq3pUQpMCrZKLTf8jXNemtFfjwSFUXED60kA5oQV6
 LlIyIlv4m0fReA0m2MLO6BKG8JOQpgarkuI60K0oVBOF0qkcW7mRDxEwzTV6UPYNTtEJ
 r3OIWPRTQZaAggmTg+S3C2IekVwoXuXU2K3c6bWprnNDUWXpYhI3vqYCvnFmFoALB6YT
 ZwBKa0cgzZ9N+1DXy5ppN/wq1wFL/EszdCTRFEt2pRJmOMnnEchdU6p2otxcRhKbF6A4
 eXraulf6fsNe7CDB3BIE3BNFKUkLXSaADkGBjoqK/rcz8gtrB7LwFKP5xWzuZZEFwden
 aAlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700516803; x=1701121603;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqROwQG7N3qrkO1+o2zNL4maIfyYwDDg69jSMCtjk0o=;
 b=LHMSTwTM9wK0K/5jO1tqDvIWKOZYbD6IAgDHYxKWJD9fRphU8UoB8Bv3sfzTCyOXDH
 yXdXinVyj1wRUPQVqx2Q1nInvNzW/sjQaKz/ZaC5bk662pwB+NnH6hMxSO1tEFbY9YVd
 cPw4VaGoDIhoE0zXvmi6mEaW0v3VnhgTE1jviFsZkFzjqQz4irLQW2GvBOKRWIS7AVjH
 3jwYa8tIUWw5O9LLryXfB7xAypQcfSG+YJwAlEnVgcneOs9t8/H40fJyXJnWWJWReTLv
 XGESMKwh99lMDaASCVyhAGU2S1m+1LhLbd94EYIPGs9nxs1r+DOMWai8uWr+tw9ZIyZl
 22tg==
X-Gm-Message-State: AOJu0YzTw+rNn/CtrviJeMlR5ZCC6oUL4CgVRpd4xKsvIx0iohh7F/Vv
 5n5DsXWeTQc99dgjgkCFNUg=
X-Google-Smtp-Source: AGHT+IHzZWuP7fUYMd2+O3OBOSCHQpJLAk+VbHkWWjSpa7kQzX5njoZWRysEH9t0PNmhOAIArQoRaQ==
X-Received: by 2002:adf:a353:0:b0:332:c4e3:9b09 with SMTP id
 d19-20020adfa353000000b00332c4e39b09mr3466448wrb.30.1700516803239; 
 Mon, 20 Nov 2023 13:46:43 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a02-3100-9030-5a00-2223-08ff-fe18-0310.310.pool.telefonica.de.
 [2a02:3100:9030:5a00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 i13-20020a5d584d000000b00332cb0937f4sm2667052wrf.33.2023.11.20.13.46.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 13:46:42 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v4 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove I2C_CLASS_DDC
 support
Date: Mon, 20 Nov 2023 22:46:20 +0100
Message-ID: <20231120214624.9378-18-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231120214624.9378-1-hkallweit1@gmail.com>
References: <20231120214624.9378-1-hkallweit1@gmail.com>
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

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

