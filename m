Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A3D59A912
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 01:12:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D4310EE74;
	Fri, 19 Aug 2022 23:12:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C34710E38A
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 23:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660950683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFFGKxt+Rynb6H3rLFquNUiuipOW4GaSN2+USkzDWw0=;
 b=Stn6rB+1lviyJrNtkGFiQfUAmiCQyX0UUqdO8eW2IYX16j/IvvNnKv/gkv/sS0fD3cvUDL
 jLP3C1C/4QX1J4Pi2SLfYNtLCvq3fRfQLa8hMWPSoqBWk4MbMXyhy48znsgQol1Ivdo+Nw
 f7lHKC40cpmkcqOoDZg2DIYc2HnqC2I=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-573-A3KoIPL2PZGZivsH60JBxw-1; Fri, 19 Aug 2022 19:11:14 -0400
X-MC-Unique: A3KoIPL2PZGZivsH60JBxw-1
Received: by mail-ej1-f70.google.com with SMTP id
 js11-20020a17090797cb00b00730d73eac83so1943577ejc.19
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 16:11:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=AFFGKxt+Rynb6H3rLFquNUiuipOW4GaSN2+USkzDWw0=;
 b=Ig3s4xkPEk4AZxLpBx90wh7PP+3W7UOqBLG8dSbp/fcxbqzSlj83ZZNW14L+LR4uGK
 8nRl82JYM2ydQ6xo46qI+YQ/UPcZqVj8Fhg3+QFkh+99tN7Nbh1eJBcSasRGrwoAgCBN
 rOnJsUXU9kY26LbwfKyhEh5HzxqM7eN5nIGWmFgL3mxO7tmimPBfN9GVOPex49qk30Cv
 xpGvNApiOsD/UUUa2LnOdnl0ENeSVGCnJhxQvp1Xf09VUOlaeH/1uS5X/gflURYmYUas
 8HM5AiWcJt/9HZ91km86XJj0i+opWl86lxOoB9JLqzgv7/zf8TlfzI8VeMFp23ndjlj3
 vxLw==
X-Gm-Message-State: ACgBeo3PLRBZWwG2mBonZqwikx6RCNkvvFe7cGfDo2u4tLingNHR8uga
 MTgbwR+wMYc/byxrUkB9wAW90K8yaxftd7YOMZ0Gp7jR64FCENuAfQNvGxho6L0vGkLhk3vacEd
 J5biCoPXQymd4YSzpx/+esuBWtx2h
X-Received: by 2002:a05:6402:b37:b0:446:79cb:8ed2 with SMTP id
 bo23-20020a0564020b3700b0044679cb8ed2mr22591edb.265.1660950673505; 
 Fri, 19 Aug 2022 16:11:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6I47xkeEdQdkJwg0IElCbZlxTvQ3PAI/2KK3WH2jBuBVpkk+QFYyUaoLDoZHy4tthJHuyR9g==
X-Received: by 2002:a05:6402:b37:b0:446:79cb:8ed2 with SMTP id
 bo23-20020a0564020b3700b0044679cb8ed2mr22583edb.265.1660950673381; 
 Fri, 19 Aug 2022 16:11:13 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 da7-20020a056402176700b0043a61f6c389sm3761651edb.4.2022.08.19.16.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 16:11:12 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 5/7] drm/arm/hdlcd: use drm_dev_unplug()
Date: Sat, 20 Aug 2022 01:10:56 +0200
Message-Id: <20220819231058.647658-6-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819231058.647658-1-dakr@redhat.com>
References: <20220819231058.647658-1-dakr@redhat.com>
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
 drivers/gpu/drm/arm/hdlcd_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 120c87934a91..e41def6d47cc 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -325,7 +325,7 @@ static void hdlcd_drm_unbind(struct device *dev)
 	struct drm_device *drm = dev_get_drvdata(dev);
 	struct hdlcd_drm_private *hdlcd = drm_to_hdlcd_priv(drm);
 
-	drm_dev_unregister(drm);
+	drm_dev_unplug(drm);
 	drm_kms_helper_poll_fini(drm);
 	component_unbind_all(dev, drm);
 	of_node_put(hdlcd->crtc.port);
-- 
2.37.2

