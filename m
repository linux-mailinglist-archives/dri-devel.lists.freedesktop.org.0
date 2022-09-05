Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 181F15AD656
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:27:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBC9610EA48;
	Mon,  5 Sep 2022 15:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275B110EA48
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662391662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AFFGKxt+Rynb6H3rLFquNUiuipOW4GaSN2+USkzDWw0=;
 b=OQGS6E2iiktVnwMjtGKxnfsnlF9CsTGXjL8VNH/Hll27yO+teJ9B3OiytEzhIUtDWk4JqI
 x4yUURIMRAW9qVhTMUyTaE0q7zLYr3lAknVAreVbfsE0NhsjDymeVxKG7IN3Ay3nRbVmzR
 jkE76ILt+EyvscQv7WHv9icQ13PJ9QI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-524-VD8NtoS3Oqi-gNQEpNzjjg-1; Mon, 05 Sep 2022 11:27:41 -0400
X-MC-Unique: VD8NtoS3Oqi-gNQEpNzjjg-1
Received: by mail-ed1-f72.google.com with SMTP id
 y12-20020a056402358c00b00448898f1c33so5926283edc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:27:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=AFFGKxt+Rynb6H3rLFquNUiuipOW4GaSN2+USkzDWw0=;
 b=m2HNbjSXBqwk5WOLjQxFoYlvmhk1TyXsKDq6aY+EqZHgiHWgGeK2GoohXFg4U0PzG/
 /AyBpGq/NNGXgI5KupAFkNohn76t3b5nIV1440kG/t+0O/ATqNtRhZvF4wuHCIG00fJ/
 msono7CRU0Ku4JazIp9iUJIU4AFtP1CMdIdled5/1N5PlVbtCldjrYOfcq1RyE/isa/3
 xipz0iFWUqVuaP1Vae0rY5IkvHtm3tllxsLXMAdeRECGdmlCylE0vjSFIp2L1bmzjEoG
 XVoxe9U7/rimjqoengNGOJh2t6Vwlhk7vjwvqe4bUMiq85x1/rN1UFKpmBWAI6mQ9vA/
 SL2w==
X-Gm-Message-State: ACgBeo22DLlXdUKDhOJXDWS9SHzoDABeMubipYoacBmr8W5lQuu5zHkK
 DosTduQcJ4KyKwxX+ZaDwZ14Oz9ZxiafdUh699SwCedm+Ts4hiHvNX4Yl92o6uFjvBMOPDRuGOv
 aC6592rMcBt98C4EZ7+vHusO47NFG
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr30493942ejc.208.1662391660391; 
 Mon, 05 Sep 2022 08:27:40 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6WM2uFwG2RTEDgKoROw3MIJz+VXV9au2IY/ThjnrDXlkgsiZ2ds5tMDggnRKnnGCTJfkxepA==
X-Received: by 2002:a17:907:1c89:b0:741:4453:75be with SMTP id
 nb9-20020a1709071c8900b00741445375bemr30493926ejc.208.1662391660199; 
 Mon, 05 Sep 2022 08:27:40 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 i10-20020a170906264a00b0073cf8e0355fsm5034306ejc.208.2022.09.05.08.27.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Sep 2022 08:27:39 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH RESEND drm-misc-next 5/7] drm/arm/hdlcd: use drm_dev_unplug()
Date: Mon,  5 Sep 2022 17:27:17 +0200
Message-Id: <20220905152719.128539-6-dakr@redhat.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220905152719.128539-1-dakr@redhat.com>
References: <20220905152719.128539-1-dakr@redhat.com>
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

