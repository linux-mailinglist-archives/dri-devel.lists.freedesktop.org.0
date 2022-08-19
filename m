Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5D759A7A0
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 23:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5843B10E773;
	Fri, 19 Aug 2022 21:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8208D10E485
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 21:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660944293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNisDhpi4BOnPBk5Q4gtZJ5EEe/qIg6dIjsLwDYtTko=;
 b=f907O9qvpuSF7XPNCviJRj0WUMeDO5GOS3gRM5ksbCI4WR87QeEvhBrltWpxWmAD1Z/B5/
 uvxE+jq9EoxKu3Wd/ipA9RctzNdbo3Hb2jW2FRxnMUXDXFM4mTmEop/1ZWmpayHP33/DYC
 Z4NYcXZqNqoLGo4KkdXQbOnzIGWTtPo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-8I3H7G9mOiyD2XuGH5SRkA-1; Fri, 19 Aug 2022 17:24:52 -0400
X-MC-Unique: 8I3H7G9mOiyD2XuGH5SRkA-1
Received: by mail-ej1-f72.google.com with SMTP id
 sc31-20020a1709078a1f00b0073096c2b4e1so1951527ejc.22
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 14:24:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ZNisDhpi4BOnPBk5Q4gtZJ5EEe/qIg6dIjsLwDYtTko=;
 b=WvneZEQDQ1rx1x/5DvxAe/jS9GAkSRoGKtiqgekvPO1McG6YvCLD+HFuoD5Yw9CdcV
 6qFmK96kMeQABd3BkxS5CHvgZY6GT9OQEayyWsyvKrG3uo8NA0Uoe6HBvAibo90LIYFa
 XwY5F7exgwZnx/iwZ660O+Og6rDjcEdlz6FwzXvpohXGq3uTrpNweuAAVNbiZ4cQI/qE
 qHRdzxSv2Fuw2TAx5YUBDh9HCV30J/uastdrPLshau2X1g2YiDzU+ZSoe1+6UHt2eKEK
 TCUfvjESULu08/NK8IIDnpG9dnhmXGGn+swh7wo7qliIg8f/MsPnbHF/fvMRXEi2mIDX
 BiPQ==
X-Gm-Message-State: ACgBeo2kd1Hm287c7h0LHy8yo2ImZxKD03YnMJ/tr/VEk0Ggw58gXet8
 AIay1GOIcrWzeE/sNLgUCyfxDceVxbTXZ7sS6zfZpOKRchwg2pmFS+x8ZDaEOMLpBcG4hrWpQuJ
 hirTdTGanYKrDDlQc7XrF9lKPH4C6
X-Received: by 2002:a05:6402:c45:b0:442:c549:8e6b with SMTP id
 cs5-20020a0564020c4500b00442c5498e6bmr7454930edb.123.1660944291637; 
 Fri, 19 Aug 2022 14:24:51 -0700 (PDT)
X-Google-Smtp-Source: AA6agR49IKZ4pGTeuQlGM57eBuT/of7Y2qxJpRK+S8Nj2BgkCRrujKKcPSdvM66LTG6G1UhdU+EVxA==
X-Received: by 2002:a05:6402:c45:b0:442:c549:8e6b with SMTP id
 cs5-20020a0564020c4500b00442c5498e6bmr7454914edb.123.1660944291440; 
 Fri, 19 Aug 2022 14:24:51 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 k21-20020a170906579500b0072fa24c2ecbsm2842999ejq.94.2022.08.19.14.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 14:24:50 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next 5/8] drm/arm/malidp: use drm_dev_unplug()
Date: Fri, 19 Aug 2022 23:24:42 +0200
Message-Id: <20220819212445.559790-3-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220819212015.556220-1-dakr@redhat.com>
References: <20220819212015.556220-1-dakr@redhat.com>
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
 drivers/gpu/drm/arm/malidp_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 678c5b0d8014..aedd30f5f451 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -893,7 +893,7 @@ static void malidp_unbind(struct device *dev)
 	struct malidp_drm *malidp = drm_to_malidp(drm);
 	struct malidp_hw_device *hwdev = malidp->dev;
 
-	drm_dev_unregister(drm);
+	drm_dev_unplug(drm);
 	drm_kms_helper_poll_fini(drm);
 	pm_runtime_get_sync(dev);
 	drm_atomic_helper_shutdown(drm);
-- 
2.37.2

