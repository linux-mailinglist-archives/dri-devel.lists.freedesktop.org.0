Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B58B0585C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 13:05:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D00210E592;
	Tue, 15 Jul 2025 11:05:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Kg+QZYQ6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B2BD10E58F
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 11:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752577497;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z+XQ0wnLzLRCtqZjvZ0JrZrVBsaHoyUy1S29+DwjIbk=;
 b=Kg+QZYQ6RVjAmLajJQHnm1anplb8OTJ3j4uaOpg3VOPqgFp3a5R1VraxGvSPzGD3/UCbuP
 mcerIoQ7Ngdnudi2NLCNsDUDXsCm5dvbZf8foBMr0E57V2m/rNT9XxWX8h9ZBsd611yIry
 aHcGxwjSy6cTDNr4Onn8BjUQuxD6+M8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-0-Njxs5wNMisZ_S-Am35hQ-1; Tue, 15 Jul 2025 07:04:56 -0400
X-MC-Unique: 0-Njxs5wNMisZ_S-Am35hQ-1
X-Mimecast-MFC-AGG-ID: 0-Njxs5wNMisZ_S-Am35hQ_1752577495
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-451d7de4ae3so34006575e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 04:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752577495; x=1753182295;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z+XQ0wnLzLRCtqZjvZ0JrZrVBsaHoyUy1S29+DwjIbk=;
 b=RHpYAifSuyG/abnrdDa2Bj9PyInOonD/tvqBm+qO5CXXztILsijN9zzkapujmNIwLA
 jJ93E3PUKahIQr3+YjZlacVtK1fpfCwgHy0j8gd0pCVPM5pc+yOWJCAirccvREOtTffx
 bQCwFsic9WlwEnyuFF2qGAuE3p6NYeQ2XceNv39AYS22l3xxVyEY4NSnXFx3rP16kXfy
 WfSzb7aAZdahXosEH0kRA41oKiShPbIIeQJT+R7mOwOltOUcWbYdHNdpDcX82IprHvm+
 EbsD7Ab3U7RUeNUWIoxSGfu636M++jHyz0CgClJ/qjtw/E2XxTfWXeI/Z3hl+ZnOqX6/
 CVyA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWC0K5wW9tCammh3Sg5qsGwLgWDtSWhN2SgEU10fLMwxifl2xPaVV+fIXLrwN4+sVSzFVue0hEi4Po=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJWWGSdXTo5radHt4voKUYRw6g/tQdXVQLJGV4fAYFMAwH4Aii
 27mL5BL18bmo53i1+UiEHotZOSC5cWa3lbY6XrrAmP/Zzd3vEnex/Xh0pcPnGSpbaMZ/ArF17/k
 Q/9xJf7Y+mG8xABffLFGJuhMf0baMREJ2Li3V4nXqf9pBBc8PKyBMSDMYlIQWv1U7Ul2RQQ==
X-Gm-Gg: ASbGnctFFe+8S5REovgO2OgbiFYrcxVDnzLv0GZSiVqiUDSafoVKqAkCmDLyT+7vemz
 O/X15pwOmgkSfceHECDljiCV0s3ZI9EsJUQ5LD9KsjpFLoS3t6WYygpucXj29ICWEwJ7Z3Lkw0p
 Y2myVrPdstPIdTLY/blYJfO4zE170phpL1TXMaz4EXnI+FKeR1l0jnown/1c1V8UIpRCbLmljmV
 JYO1x6vFEW64erza5bQasmX8D2EldBHtonClO6gc6vVW+KLFj0gS6CIfm4qfxQSpTncji4irSDn
 MHpOBRKKJBhF+LDx5h9vdiIarG4fibM7
X-Received: by 2002:a05:600c:1911:b0:456:1121:3ad8 with SMTP id
 5b1f17b1804b1-45611213e56mr112694135e9.10.1752577494644; 
 Tue, 15 Jul 2025 04:04:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEDf1q/9ll+0HqD4jBDdBu3RKQxiaOkxZFjweljA0KeUGAtwMbuwVCGChuZioa+ATzj+6OKw==
X-Received: by 2002:a05:600c:1911:b0:456:1121:3ad8 with SMTP id
 5b1f17b1804b1-45611213e56mr112693785e9.10.1752577494260; 
 Tue, 15 Jul 2025 04:04:54 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b600a39281sm7146233f8f.73.2025.07.15.04.04.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jul 2025 04:04:53 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, Javier Martinez Canillas <javierm@redhat.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/5] drm/sitronix/st7571-i2c: Log probe deferral cause for
 GPIO get failure
Date: Tue, 15 Jul 2025 13:03:51 +0200
Message-ID: <20250715110411.448343-3-javierm@redhat.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250715110411.448343-1-javierm@redhat.com>
References: <20250715110411.448343-1-javierm@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Vsi8oOcZrxUXIwfoxBkqEfa8zcgwprTTTX6Lw09rmQU_1752577495
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

Also do the same when it fails to obtain the reset GPIO.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---

Changes in v3:
- Fix reset typo in commit message (Marcus Folkesson).

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

