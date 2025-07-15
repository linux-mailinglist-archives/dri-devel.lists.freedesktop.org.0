Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF1CB0585F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:05:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA9710E594;
	Tue, 15 Jul 2025 11:05:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="N7UP+em/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30F5B10E58F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752577502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RZ6F2xwZmJTchnY/FGJYtWyfDOS8jid6Za74XWNHMg4=;
 b=N7UP+em/iiPvJBvyHWG3GdN60/VwigkGqGEkKbj+T67cWW5IR1pgUfHXWnREKpkVFrx3i9
 Nl1fB+bjEM3SjsGQz0Xtj19+S2/CmlMCcZmPuEQr7Ob3xZ2QLU76u5WKALATAAqUDnSzXm
 gYZU0LY5HchiQQrXWDIEQ4cx0T5smc4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-6G-THRZlPGSFVB1NE_1uug-1; Tue, 15 Jul 2025 07:04:58 -0400
X-MC-Unique: 6G-THRZlPGSFVB1NE_1uug-1
X-Mimecast-MFC-AGG-ID: 6G-THRZlPGSFVB1NE_1uug_1752577497
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45597cc95d5so20936915e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 04:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752577497; x=1753182297;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RZ6F2xwZmJTchnY/FGJYtWyfDOS8jid6Za74XWNHMg4=;
 b=BVtl+GlIgSlCcvhkLcLrwo0F6DzsKA+46x1Wi9DwdlhZpLPFUP5r5UKmcsnlc+LVkU
 /5i+ZVDd02SY5V6KVrrr9Cd3+oZmzA4ErRYJvBJzoBLRd4AQcLUx8HWZwlCPr3Ke3tQ8
 +93e7jYEdlCTmyx89FTDKN/Ui8+HI+AE/4U65qxvTBbzFHKZ9hYl9EeGAszagAPUAlCg
 eALdY8VvlAKvozeSCzMrC8wMAs1U70Up/qG5RsDSXfRRmz6eleJTeVFO0hLcJZz/f1oD
 5rGZNkasue6Kctg6M9Bht3VNXt/bN3eZH8jvUJIbNh5bRS75oSjcEx0cUUv2LRgxrqy1
 BYQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKOWHKjhRNZ+y9bn9tf4Y1Smux2HveJ9vhDKI5ZJ7WhaWUAQIPB/8F6IxDBz7Cez5+Va+/yvFClQY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrRZyrJrok32jHN86+futCAnFmL/zazRi2QO0un+MhzlmJchcy
 t6UZoQDO5wJjvsv1WJ620xI1g3yIc3wVJPlxgMg65ibC9ums2wyp0mBg2kBTyIsbFm28NFfpBCJ
 o6qzg3TsI8av6leFyQhzQWQMNy7XhbTiT+wUz/csf6NogsYkmE0tZMVRfZh0y99fyqZ44JA==
X-Gm-Gg: ASbGncujqKlmnKS9hpVirXy3dITW/ZEo0K511cXUi0n3P6MorDLu2e+FnIWVrbejcvu
 VDC991fSxxAfAwYw1KZ/JYR5s/6txoNR3ZDREYe/cX9f/EM6q/yCDDA7abBJr+0nC1NXoVOHgep
 V96oX0hjU/aRl9oNBtFTiQJULrF9kQx3qorry11Lf4ndJ/pPVj3sJNQ1xLQqAXMzJu14F559GTg
 ssdzOWdnHOBJyvcjIDNhh2j4knLHFutuBEWPqZzIbxZ4KVMbBGQPQi1oz/eDirKckXh077z0g1Q
 VELcu5xJjKeP8HGRYdjGrf+eSa4Xk8uT
X-Received: by 2002:a05:600c:4f91:b0:453:62e9:125a with SMTP id
 5b1f17b1804b1-454ec27dc91mr164884935e9.18.1752577496788; 
 Tue, 15 Jul 2025 04:04:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGy/03rj+uvyxo8odjmdiUaAYAi/Dr5jnAKGatQgTP0VjrCmZ8kxYj+ayZXaZnc3r+nddecYg==
X-Received: by 2002:a05:600c:4f91:b0:453:62e9:125a with SMTP id
 5b1f17b1804b1-454ec27dc91mr164884735e9.18.1752577496390; 
 Tue, 15 Jul 2025 04:04:56 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45613c2d84dsm75109595e9.5.2025.07.15.04.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 04:04:55 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/5] drm/sitronix/st7571-i2c: Add an indirection level to
 parse DT
Date: Tue, 15 Jul 2025 13:03:52 +0200
Message-ID: <20250715110411.448343-4-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250715110411.448343-1-javierm@redhat.com>
References: <20250715110411.448343-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7gaPtb4NQM5lXmig7b5RzAd8gEREs3E8jQhzr481AgA_1752577497
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Other Sitronix display controllers might need a different parsing DT
logic, so lets add a .parse_dt callback to struct st7571_panel_data.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

(no changes since v1)

 drivers/gpu/drm/sitronix/st7571-i2c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index fd9d6c701cc4..f9c4fedb3cca 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -92,6 +92,7 @@ struct st7571_panel_constraints {
 
 struct st7571_panel_data {
 	int (*init)(struct st7571_device *st7571);
+	int (*parse_dt)(struct st7571_device *st7571);
 	struct st7571_panel_constraints constraints;
 };
 
@@ -881,7 +882,7 @@ static int st7571_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, st7571);
 	st7571->pdata = device_get_match_data(&client->dev);
 
-	ret = st7571_parse_dt(st7571);
+	ret = st7571->pdata->parse_dt(st7571);
 	if (ret)
 		return ret;
 
@@ -964,6 +965,7 @@ static void st7571_remove(struct i2c_client *client)
 
 struct st7571_panel_data st7571_config = {
 	.init = st7571_lcd_init,
+	.parse_dt = st7571_parse_dt,
 	.constraints = {
 		.min_nlines = 1,
 		.max_nlines = 128,
-- 
2.49.0

