Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B782FB03C22
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 12:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49C710E44B;
	Mon, 14 Jul 2025 10:44:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="AjxJ43gN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C764210E44B
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 10:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752489885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L2gdjIwVeQi8Hoq0lCLi65nVhLbR8gpg8luFAFpWgHM=;
 b=AjxJ43gN4fLfJp34deVqlpaW+bLdbjiUzV3QBpz/uORUpYOmU4z8p6gx/ktHlK/xPgQ1ZB
 WRyT1lbx2gxP2zsF68f7HGguqvSDVAw/TGqtu46h1Ilo4TxGmG2Ee1q86YlyfnLirryb9J
 cJSrUpOKRLYDQee6JFybMgiksistXLo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-303-7F--IwoiP0y7zvI9zG4Tvw-1; Mon, 14 Jul 2025 06:44:43 -0400
X-MC-Unique: 7F--IwoiP0y7zvI9zG4Tvw-1
X-Mimecast-MFC-AGG-ID: 7F--IwoiP0y7zvI9zG4Tvw_1752489881
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a4fabcafecso2011078f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 03:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752489881; x=1753094681;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L2gdjIwVeQi8Hoq0lCLi65nVhLbR8gpg8luFAFpWgHM=;
 b=HnQjSDDKZRgoP4SY6E+GWFd6WX7BkJ/6MQdbapX/0q8IiCXf8zoo0B2XTqhtw8sCgU
 eEw3S1ZXOqORyZiHMpvT9/6KZICbY82BxYwjM8Dku+A4fdsNCJnNcMHbSQm8Imc4ONR2
 QCA5azPzp8YIzy7Vg0zm3dfwQXBhQTMK2vkl8FhSWNyB5TF/7yhhCUr8OUUb4jxtRzhZ
 hHDtIV/vmRsHUhRYLjXB31IiluiMHcyCGiNsfZzYg7TtKkUoITO8RRDVEHbbyIcCGI4s
 892KEOesZN20xLo/cf1i0GX8tZfQtBvyitgppzc35Za7PrYt+bYX+YoygwPWCmjHobP2
 aQfA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC8eVMaN08+0ZNSuyxeUArS6NtT1L5UxvwG8akkDc7ig93dBA5HIj8B2/oN12/xgKNqskHFzC7Fyc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzbjHLu48UjREcIbm+sd9Uu8z1kwuS6b3T4SpMeIr9WoV00HIZk
 aZ209dg1815ttmyVS/EnWNjnk7JNJvh+qbdO46nYdD834OYgtig1UZj5CH8bjoWZcZK7U4UJeu2
 68Na5r38hdVq5SI/ks9iiSqztfdbWxSB+gv2CNHKKdTZGj1KHAQSNV2Exfq8O5/dL8fpieA==
X-Gm-Gg: ASbGncu2i8BuxulFebYbULfEQ2N2kBt0gnJ4fgHFuNFJp/OMN9JZI0kvnQkEzbPWXPc
 r5KwAiIYOp87i5e6P62C6UyZV9rGWNw0FMvizqM9RxvS+CcZsRGm3iHsbnWpO48TdWj927xCXwG
 xTY1UkEXwPfY+/TdELSwdzoS6wvv76aXB2mw03LiRSvgUbe247nKxyBWui045KyqC2s5cf5TMAp
 ljaRLlfnV7SQ1FEkhQkjiBTTASRxD+GFzmLY+EBI0F8rEZF7HD4Od+TPhROpw/fbGVwvaA2eIcD
 TpRGuYBMUHo2Ul0ovWoNHfHJ5wT6XBZa
X-Received: by 2002:a05:6000:290b:b0:3b3:9c75:acc6 with SMTP id
 ffacd0b85a97d-3b5f359d08dmr9051344f8f.59.1752489881077; 
 Mon, 14 Jul 2025 03:44:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGtxVKiRxB+FpXzE5cW+k4F38kh1q3AFLo1SgxCi5sV67WZgIsGuQ18ILpi+whjo1m/+jvI2Q==
X-Received: by 2002:a05:6000:290b:b0:3b3:9c75:acc6 with SMTP id
 ffacd0b85a97d-3b5f359d08dmr9051312f8f.59.1752489880604; 
 Mon, 14 Jul 2025 03:44:40 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8e1e1a5sm11873559f8f.74.2025.07.14.03.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 03:44:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/5] drm/sitronix/st7571-i2c: Log probe deferral cause for
 GPIO get failure
Date: Mon, 14 Jul 2025 12:44:01 +0200
Message-ID: <20250714104421.323753-3-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250714104421.323753-1-javierm@redhat.com>
References: <20250714104421.323753-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8dZORFhZjBT3yVZEw1d4vg8RV2xY8uRS6D23U038Njc_1752489881
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

The driver already uses the dev_err_probe() helper (that only prints error
messages for the -EPROBE_DEFER case) when fails to get any other resource.

Also do the same when it fails to obtain the rest GPIO.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/sitronix/st7571-i2c.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
index 634b426e2874..fd9d6c701cc4 100644
--- a/drivers/gpu/drm/sitronix/st7571-i2c.c
+++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
@@ -804,7 +804,9 @@ static int st7571_parse_dt(struct st7571_device *st7571)
 
 	st7571->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	if (IS_ERR(st7571->reset))
-		return PTR_ERR(st7571->reset);
+		return dev_err_probe(dev, PTR_ERR(st7571->reset),
+				     "Failed to get reset gpio\n");
+
 
 	return 0;
 }
-- 
2.49.0

