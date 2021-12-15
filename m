Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EEA474FE0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367810E1B4;
	Wed, 15 Dec 2021 01:01:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59C7310E166
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=awWrf5B9PoquDrlINejpUk1+b8WRbMbhOZjQU0GR1bs=;
 b=akXc1zezqKPRJIAXiIk5bE5vaiamLNJwUpt4D93gvv4SyVAv9U9fJL1Gq1rNl1rmXMB+bq
 8SLIOISIetTq9+gf0IrQmXTYiqe7oHNzik1V6SkYXEGiJfLuonN0NLWFL0XQuUeg+FzQAj
 s/goCWT3f5zwSn0uVP4edUsv1gSOJCM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-0eggNfCkMdeVcIxQQe04qg-1; Tue, 14 Dec 2021 20:01:17 -0500
X-MC-Unique: 0eggNfCkMdeVcIxQQe04qg-1
Received: by mail-wr1-f70.google.com with SMTP id
 y4-20020adfd084000000b00186b16950f3so5369254wrh.14
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=awWrf5B9PoquDrlINejpUk1+b8WRbMbhOZjQU0GR1bs=;
 b=AgEFlxgZ2QQKznbznsz5EKWCYkzjBxv/cjpjOsqGw9WG096s+ij+C5z92dlUv059WU
 SVEZy/JtQh3Rg7Z+NcW3Pq2Wc1DC5U0NFjmxIMhKN470NKuLA4OQKHexIU4EZ2pujs+G
 hQP5ms0hPyYa1dWUJaAGhBdVOr55Ny7P6YIe2ythYZW/R/9ULV8613OJE+wBH6wGc8TB
 W27E25Q4dfnVzmyc9SfUoRLQs2XfhTBvhjLKdkTSM6F3FghBP6dOxa6sbnpOFIbxIIpl
 vBG2n9QYW8rNdE/UQdUjhScD7cc0Xc6nbKBEUTem85zr+C+cSw/35i7VAIG2nJrz6Qcu
 /OOg==
X-Gm-Message-State: AOAM532yrEh9jDzZIekhoJ9d+S14Vg812dnINyLaqWxIMmubVLESq2iI
 J9Mq1jJxHjjOUGLxQyvQRGDRXhOcccCXQ2vTj73L4O4CMXlR0Np0EcI5dD/oJmlHgPqSA2axTA2
 gz4ANmUHH8sExzOzgt14Xp0svmiBj
X-Received: by 2002:a5d:460d:: with SMTP id t13mr2257163wrq.44.1639530076310; 
 Tue, 14 Dec 2021 17:01:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5wNkadaSy1vz0hiZk0VMttTMI7udJznYgz7W4Y3vai/pifl1KFc2uvgkFngUslis2OSFA+w==
X-Received: by 2002:a5d:460d:: with SMTP id t13mr2257151wrq.44.1639530076169; 
 Tue, 14 Dec 2021 17:01:16 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 30/60] drm/pl111: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:38 +0100
Message-Id: <20211215010008.2545520-31-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Emma Anholt <emma@anholt.net>
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

 drivers/gpu/drm/pl111/pl111_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 520301b405f1..7a316c8d8301 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -243,6 +243,9 @@ static int pl111_amba_probe(struct amba_device *amba_dev,
 	struct drm_device *drm;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
 	if (!priv)
 		return -ENOMEM;
-- 
2.33.1

