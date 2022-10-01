Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 576305F1DBF
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 18:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C28910E667;
	Sat,  1 Oct 2022 16:40:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A48210E664
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 16:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664642410;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7y8Kg9mwa0vUvwm8PGHbH7MwQR+LJsA0v4Hu5SumJhk=;
 b=flt4+5OYLLNX0KdPkEDBfxjLnoNbXaWbz142IenohxzqlvmMaA8T4mhVu3ni2UlR1NF86P
 GprLEfSgoo9VdU3EDgRHdeZewx0vgV4sPtub9ZDl97Xl7jLk/upQ9GyWlAVehETgIcMwBy
 rlMlP+jwh/o9nOODq9DhFpUxSXCEl38=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-630-ohK6r1YbMYW1rlQC1VF7pg-1; Sat, 01 Oct 2022 12:40:09 -0400
X-MC-Unique: ohK6r1YbMYW1rlQC1VF7pg-1
Received: by mail-ed1-f70.google.com with SMTP id
 h13-20020a056402280d00b004581108ba90so5725534ede.2
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Oct 2022 09:40:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7y8Kg9mwa0vUvwm8PGHbH7MwQR+LJsA0v4Hu5SumJhk=;
 b=1efYxgrICMcYy9+U3sQSZAbN9ShRwvVMT6yYIdRfRLoobuSixUf8Ew8g/7201/RbKX
 H0awlyjdRvPQ1/YFIWO6Y7kNTBqlgLGWaon9xdKQZGJBgrN7VFPDPnqZxXeBWBPe1uG9
 iBr534tp1OL3FfEQYHsNGSiyE2iV8O/HSOE2x0QzQfErKO6Ra+tH35UIA0bbaVJQmg4/
 qsdp2UvVBm4zC3CX8gJWlBzUnh9bD7yPO+QL2Ddupnync8RaXXzDlLgNAeNQalCfWO3f
 9TUXlgFR1JBG2LkP6yaIz3xH+5Farqz2TZGSmxo8hefcqiX24fAY3kZ/aATUdAxvQ/tT
 xCNA==
X-Gm-Message-State: ACrzQf39abj9MkMhiY+JVTcYltJ7zYkc6pkuwQL+Sx8qS/N/2gI4koDJ
 QKitq7HilkRghnM4NCjFqYZgPK7xCwpBIrniZW8JO3beHnAMJaZBoflycOrteiTwf1JxCHpAMTL
 BYTL3qTpmyfUObD+nhkVexq3s1Cfd
X-Received: by 2002:a05:6402:4441:b0:454:8a74:5459 with SMTP id
 o1-20020a056402444100b004548a745459mr11944340edb.155.1664642408036; 
 Sat, 01 Oct 2022 09:40:08 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4DTCDeA0KWBh6kSo2zm+j4Tg0+Kb8tU2UeueTgZVbg3102O9jUVRVuOw8bgSS/D1ZVeC8EAw==
X-Received: by 2002:a05:6402:4441:b0:454:8a74:5459 with SMTP id
 o1-20020a056402444100b004548a745459mr11944325edb.155.1664642407879; 
 Sat, 01 Oct 2022 09:40:07 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a1709062e9900b0077f15e98256sm2865110eji.203.2022.10.01.09.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:40:07 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v2 5/9] drm/arm/malidp: use drm_dev_unplug()
Date: Sat,  1 Oct 2022 18:39:42 +0200
Message-Id: <20221001163946.534067-6-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001163946.534067-1-dakr@redhat.com>
References: <20221001163946.534067-1-dakr@redhat.com>
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
2.37.3

