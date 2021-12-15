Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1B6474FCC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB4AF10E15A;
	Wed, 15 Dec 2021 01:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E084A10E128
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3ZKbEfyLV70l6XiSNVJ5RXCznhS05ggY7V8bDfhnT+U=;
 b=aGb8pVxGXQ57Iht0OaiQW8AgvMkubSmQstmfh5EKeTPYJe/hAnSLuPwizEhdJDx+rgo0oU
 a0tLuyxuqNB2ZgxBTBFAR1xLV2Hh5frbNebublLPBzmWwxHVG/mj6nTD0ufr6rOoo/1DRr
 xI2f77xXyhhKzXQR91FTrmDpVl6osbI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-199-uPQnVdS5Pi6K1pYK6BTufg-1; Tue, 14 Dec 2021 20:01:08 -0500
X-MC-Unique: uPQnVdS5Pi6K1pYK6BTufg-1
Received: by mail-wm1-f70.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so1154719wms.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3ZKbEfyLV70l6XiSNVJ5RXCznhS05ggY7V8bDfhnT+U=;
 b=68cgXzmQzI7lYl/LgjwTXkojr+l2dAFifbgrM0zG5YItQ6wH3lvxCm72VUSvjBvvVe
 +Bm/2s43p7YZ9TypXPS8N2DqZQEG1HJIhmcoiKW/AdVebUtYKnRauMMpvR/jrtvNP3Mz
 x3oM6P/ErtKrW2O1AD6rfWGGLlJUP+BCs9q7a41H0H2hKZY1fhoA8pEw/v9bWvzqnJtE
 YCCA0h/3HxwfnPKfysA6C0O3Pw1hlaxBk4iqgspEFklvGzCHvp14H3LSLOUfKmBNYwNC
 iaOOBkmn66yC/rDIP4Eo9/LSQxTQjzIqaVmok9WvEQcjni57OPkFqpmgHeU1X1HZR/iB
 qCHA==
X-Gm-Message-State: AOAM530xefjI0YL00IqJAdfNwMCyw6fCfN4C5EphEBDC1HRYWE9M5Tvb
 ye4WG65h/UzkkcJvXF98e7+nm5isMAJclJiiYOVwSjX2dOzSlRafQc/qQmxeYJq5ASHT4ggttwm
 VCqphkqKA2VoNgdrTGpRAndVTYUfd
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr2041682wrw.591.1639530067409; 
 Tue, 14 Dec 2021 17:01:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx2OvVWw70d1Jz0nZ4EGB9SbUm1hrYOQZ8cVF6w98rG3WU5PwqQdwByDZI0o1AXmNIhJldlAg==
X-Received: by 2002:a5d:6b09:: with SMTP id v9mr2041675wrw.591.1639530067193; 
 Tue, 14 Dec 2021 17:01:07 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:06 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 20/60] drm/lima: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:28 +0100
Message-Id: <20211215010008.2545520-21-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Qiang Yu <yuq825@gmail.com>, Javier Martinez Canillas <javierm@redhat.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/lima/lima_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 7b8d7178d09a..9255073162db 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -375,6 +375,9 @@ static int lima_pdev_probe(struct platform_device *pdev)
 	struct drm_device *ddev;
 	int err;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	err = lima_sched_slab_init();
 	if (err)
 		return err;
-- 
2.33.1

