Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722CB5F1D0E
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:58:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6CA10E638;
	Sat,  1 Oct 2022 14:58:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F352B10E638
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 14:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664636308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJ+r++kfC5cLOYGbcZ2ityl6Btvuyg0jJylQkWmqY/s=;
 b=Aws1LkqsAAqJaGtG9DxIjd5Xrki4gfUb8zZZNTtBNkHFCwrIZS2X5I3XikO5RYOYcQTi1c
 yDE9z450iiaYFuSMxZzvI6tfYT7kwzxMTmckbCbzRaz3bVxsZp3s1xF2yT9o35JHHTCBoD
 HgG4Kza8s9vqicWJop1pAJ+E4sPVWCY=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-OhB-yn8FN5GEN-Lm62AF9Q-1; Sat, 01 Oct 2022 10:58:27 -0400
X-MC-Unique: OhB-yn8FN5GEN-Lm62AF9Q-1
Received: by mail-ej1-f71.google.com with SMTP id
 hr29-20020a1709073f9d00b0078333782c48so2524030ejc.10
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 07:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AJ+r++kfC5cLOYGbcZ2ityl6Btvuyg0jJylQkWmqY/s=;
 b=Yv2HzIoqV/MnlKuIz+Kcw0uQmnF55YiZfvah2PzhRjMwMm7kEh7/1mVm0hb1NDGOIS
 hH37ZV9nNi2vxShTy1zsqTkL9hrb54kzU+BG3TOhrUKdtroX2/g4vSDUkE0V/Ns6pZEs
 JiRNr8Uk4T5gNKJ1aWcvcmuYLedBOoKy+lKrMtuonuGqg6QdwvqHjbwhG+auC89VuYu1
 8cOVsVGUq/J1nEofm4U0l7bxfSX2Y/RGKv3oXViZrfFTQekHkRRvtQc9gGvOfrgaxSfl
 whY4RruTQqDprDFKugzTPFvW6m1eap2Rbm7QAYHSoX93unfIYRlF5+V5krpIH+DO8L56
 E3EA==
X-Gm-Message-State: ACrzQf2zrGqtI33lsvMEBsuCIqi8S9xyRYRdrdXJrnMXYpNxpDKhPxin
 ZRk6gyeJugqT843G0JcNP/nyG98i/G7UWY2nIv7Cl+ZcbQ7kpVzHdCAd/qyOSir8uU+n4oZXGdY
 vX9BUq3w1snvbeWwq2u5mKsMrt9kF
X-Received: by 2002:a05:6402:d58:b0:458:5eca:a2c9 with SMTP id
 ec24-20020a0564020d5800b004585ecaa2c9mr8666625edb.306.1664636306052; 
 Sat, 01 Oct 2022 07:58:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4syfsKXsxvYYfn7fvRiEa9nCMbGy+JIuRGwK9SSQu/V4k3YaMKliTq0OSkaegLlpeFXpoyig==
X-Received: by 2002:a05:6402:d58:b0:458:5eca:a2c9 with SMTP id
 ec24-20020a0564020d5800b004585ecaa2c9mr8666615edb.306.1664636305905; 
 Sat, 01 Oct 2022 07:58:25 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 17-20020a170906301100b00731582babcasm2832561ejz.71.2022.10.01.07.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:58:25 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 stefan@agner.ch, alison.wang@nxp.com
Subject: [PATCH drm-misc-next v2 5/9] drm/fsl-dcu: use drm_dev_unplug()
Date: Sat,  1 Oct 2022 16:57:58 +0200
Message-Id: <20221001145802.515916-6-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001145802.515916-1-dakr@redhat.com>
References: <20221001145802.515916-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the driver is unbound, there might still be users in userspace
having an open fd and are calling into the driver.

While this is fine for drm managed resources, it is not for resources
bound to the device/driver lifecycle, e.g. clocks or MMIO mappings.

To prevent use-after-free issues we need to protect those resources with
drm_dev_enter() and drm_dev_exit(). This does only work if we indicate
that the drm device was unplugged, hence use drm_dev_unplug() instead of
drm_dev_unregister().

Protecting the particular resources with drm_dev_enter()/drm_dev_exit()
is handled by subsequent patches.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 4139f674c5de..3ac57516c3fe 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -340,7 +340,7 @@ static int fsl_dcu_drm_remove(struct platform_device *pdev)
 	struct fsl_dcu_drm_device *fsl_dev = platform_get_drvdata(pdev);
 	struct drm_device *drm = &fsl_dev->base;
 
-	drm_dev_unregister(drm);
+	drm_dev_unplug(drm);
 	clk_disable_unprepare(fsl_dev->clk);
 	clk_unregister(fsl_dev->pix_clk);
 
-- 
2.37.3

