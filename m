Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A987F5B53
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 10:41:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27B4310E6F4;
	Thu, 23 Nov 2023 09:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EF010E700
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 09:41:01 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-548d1f8b388so968059a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700732459; x=1701337259; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bqROwQG7N3qrkO1+o2zNL4maIfyYwDDg69jSMCtjk0o=;
 b=PaRSVklrcSYAd2ynVe70q5Lh5v2GBu+w+fnM/gZGlNmL/65kzh4BfNUGIQFniOgvHB
 w5rgxPdwCBjVppN56MML4zySb8a3r6zzRoJyvXRAVJppQMPU/DEUQKqqnD5nUMI5rBqQ
 217m12p3V/l4z2uRw+WoJIvjuyQ9vXpEu7QC4RTq1r9NHkeolLwMIy6HpUXrd4mneukW
 OhVJBOt8GpYvB36F/6UIKvwRIy8GbmlSg21QKvX+Mh0d/3pRsZxKToihH7WSdUDTUXAx
 2NkCoC4e+KhhE90QDNUZ8bUcYRiBka8cg1zF6NSU0Grd0KQYyS7SUGFF1hlMDHrRhINR
 Iy9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700732459; x=1701337259;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bqROwQG7N3qrkO1+o2zNL4maIfyYwDDg69jSMCtjk0o=;
 b=cvsd3+e9aYQV8yNQ0pG46A0UjsOEDsJreb/k4XIOD6BkgDn3rzOKH/icwMLWJ9/5en
 g5iqe4ZJJG+tJaJ0QKMJjby7FzBuhcHWE5EmLK2mtJXQMWgb5QMT53xDPtH5dvbVNbZ+
 jYqqby2y9qqGsDy5U/RgnSPic+lr7O8dbPg2t5uojGQQtlD28OfvZ1p/p/HVgUb+bm3E
 E882qNUrsa/It47qiFy+sxc2J9TnieUFjKXQ5Mwo8uLu/B/ef57tivjUGq5UBX5WvlXS
 TPhVIyRk28EOv5wD/IpENRMDcSAlh3D7vEEzgiUA0FOz8B2tzYQ6RMWr3tba73VSsEs7
 /LYg==
X-Gm-Message-State: AOJu0Yy1L1hrSKyD85b8uTXhB2brwXJEs1fzH7RGg7WxhO2ixPU6mlMT
 efeZCocTiUoy/v8QExMhJCw=
X-Google-Smtp-Source: AGHT+IFzDKDdw9ToYZGoNPeCiTiYjGf6iU2HQh3DpjZwk9f0pHAhcqea5zBWX9e6oLqquOqcr6+iMA==
X-Received: by 2002:a17:906:28d:b0:a00:131c:bc3e with SMTP id
 13-20020a170906028d00b00a00131cbc3emr3342294ejf.11.1700732459394; 
 Thu, 23 Nov 2023 01:40:59 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-c0f2-3200-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:c0f2:3200:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a1709066c8900b009e5ce1acb01sm546199ejr.103.2023.11.23.01.40.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Nov 2023 01:40:59 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Dave Airlie <airlied@redhat.com>
Subject: [PATCH v5 17/20] drivers/gpu/drm/ast/ast_i2c.c: remove I2C_CLASS_DDC
 support
Date: Thu, 23 Nov 2023 10:40:37 +0100
Message-ID: <20231123094040.592-18-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231123094040.592-1-hkallweit1@gmail.com>
References: <20231123094040.592-1-hkallweit1@gmail.com>
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

