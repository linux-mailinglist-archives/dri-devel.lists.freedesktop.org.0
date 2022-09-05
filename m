Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2FC55AD61E
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:19:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89DC810E97B;
	Mon,  5 Sep 2022 15:19:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3746310E411
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNisDhpi4BOnPBk5Q4gtZJ5EEe/qIg6dIjsLwDYtTko=;
 b=HO3nd7cUlZP6ZUsxTObt/Vwx/GJzKeaHqRBnoVY7z2P1RFQ1Qr2oLgqgt2wj+WpqWZTJno
 WsIFWtmaFvs2nkKODUHkD8z6wMOEAYXiNFeYZkbw1h7rDyUxkKZnWEyUWpYtxprWFMCCvz
 79D+smlaPnsMGLih9ebAdsiVdMrPS7U=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-616-QFOXWAo-NYuLo6tDgNNveg-1; Mon, 05 Sep 2022 11:19:29 -0400
X-MC-Unique: QFOXWAo-NYuLo6tDgNNveg-1
Received: by mail-wm1-f69.google.com with SMTP id
 h133-20020a1c218b000000b003a5fa79008bso7568803wmh.5
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:19:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=ZNisDhpi4BOnPBk5Q4gtZJ5EEe/qIg6dIjsLwDYtTko=;
 b=sLWnTkCbagaZhxb1kcdRDJ/FOv3w/C4FSRxmuRJeljrCSu4/Ohqn2v/Os+uKwW/i39
 i68gf/1yKjGeMjwck4GWwdeFSzjVY9Cmuu7f9Cs4Lktq+gvMc3m7R2Hy1tBx7b+NKdC3
 AksoKivJKckVsfbsiGm1Dm3yUHUAVzRYdSW0WvkhnuFkMsg4XhlyIyH2eGmp59P5OvKT
 mJWiATlhU2P48KYuEP1nU0ylT3G1JwkZmrbsCx8oA8YP/4faAsE2pi5MbIPDselWRoV+
 vQ8oid21tBKxKPEbcRuxSynvTM1sHdZK5/ANOVEY6StNcGT+EseIE2VpP2ykiMEyJLM1
 Ei4w==
X-Gm-Message-State: ACgBeo1ZEre8Udi7fQsGJE3JiF/tbLU+BjccemSn9fHyA5LL3hmYQqem
 99R40daXPV+f1xGC2SwuDi8F6zacFuLcA2I3dCnxK2mWQO6ZM4m+Quqgl7Zpwz+9clyQcLUz7gH
 BhyM7pXu8onLBqcd/2czAVEH7PsxL
X-Received: by 2002:a5d:574a:0:b0:228:b90c:e5ee with SMTP id
 q10-20020a5d574a000000b00228b90ce5eemr1807460wrw.328.1662391168240; 
 Mon, 05 Sep 2022 08:19:28 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6eWxwVNqHxhAwNSWdaScWGMzVC83ybJupld88qShpGqLG4sQlF8ye4ahmYcqUVP9A/HW6EjQ==
X-Received: by 2002:a5d:574a:0:b0:228:b90c:e5ee with SMTP id
 q10-20020a5d574a000000b00228b90ce5eemr1807443wrw.328.1662391168083; 
 Mon, 05 Sep 2022 08:19:28 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a05600001c400b00228aea99efcsm2209641wrx.14.2022.09.05.08.19.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:19:27 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 5/8] drm/arm/malidp: use drm_dev_unplug()
Date: Mon,  5 Sep 2022 17:19:07 +0200
Message-Id: <20220905151910.98279-6-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905151910.98279-1-dakr@redhat.com>
References: <20220905151910.98279-1-dakr@redhat.com>
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

