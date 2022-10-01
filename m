Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4314B5F1846
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 03:19:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2B7F10EE06;
	Sat,  1 Oct 2022 01:19:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F6E710EDFD
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Oct 2022 01:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664587168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hsWBexLFDVqUOZMqbhy+SL8q312glCS9Mla/+vP6MEc=;
 b=VxGwHVOqw+hsOxzMXO+xYyfgU11cxwkaDkc/b5kaCguRPR1Ak74B0DNzvVz24+y4BWHbyw
 7OfQiGMhy0RuxGGkyxYwZbtACGGJ9Prr31yTPTgMkNPpN4OeiR5bxU9nvdkYrAnt5jaL7v
 G4yEfRRcnVpZckeaVEhVlUdIY7uED2U=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-215-MQGRGA6HPLqahs2wKT98Ng-1; Fri, 30 Sep 2022 21:19:24 -0400
X-MC-Unique: MQGRGA6HPLqahs2wKT98Ng-1
Received: by mail-ed1-f71.google.com with SMTP id
 s17-20020a056402521100b004511c8d59e3so4684037edd.11
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 18:19:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hsWBexLFDVqUOZMqbhy+SL8q312glCS9Mla/+vP6MEc=;
 b=1l2uw3M0y3TOfH3m9+nrwHwhi4ZcWFG6GTeN8YZyEAig1F8/0O6shywwtZWsgfGLPT
 MnyNZyYzNrZdNQZajULo1/nbuz4HKs8iUf4BNiM67BPlIc4TefxMG7d3l0TXIn6JVptL
 hb8wxZxx45rx2rsPZvFPYBn0bPxEewe7GVwoprdjGOu8A3cFiDhY3gFyte0zIhv+JKhZ
 SzAVjc5R/Zs3EO/e0sflcDy9WzlBR3pEt6a/Dds1z4nY3iMfGJVJInU0HpM8kGKhle2V
 07eICv6NTLYQ5fFi2KA0JB+o1PYm+XUIcD3vxZYxuhMxPa0nvw44ps0zEbtwUsYXEZqD
 xEgQ==
X-Gm-Message-State: ACrzQf2aa3o6h8xKmpMogWxA6OTZrYR42TUMcIFvJQ6ylY3wkdKca9sN
 vZz6qMHGk34aVPN/wqnl1EAJVvXfAn+I8ls+4izOTBjRe3dh3NdNX5DjGLvp1N4vhh4ge2/pxni
 zGEeM+cljchROHbYh19O3N/LVidaq
X-Received: by 2002:a17:907:2c77:b0:77c:59aa:c011 with SMTP id
 ib23-20020a1709072c7700b0077c59aac011mr8480019ejc.724.1664587163739; 
 Fri, 30 Sep 2022 18:19:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4zcMskX82KTUkI5E7f0f84qForNAwCdRF+W3G2xOEagDWoB9NXlhmTv0aJC4uLhVIyAmcViA==
X-Received: by 2002:a17:907:2c77:b0:77c:59aa:c011 with SMTP id
 ib23-20020a1709072c7700b0077c59aac011mr8480004ejc.724.1664587163596; 
 Fri, 30 Sep 2022 18:19:23 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 r20-20020aa7c154000000b004582a37889csm2573958edp.16.2022.09.30.18.19.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Sep 2022 18:19:23 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@linux.ie, tzimmermann@suse.de, mripard@kernel.org,
 liviu.dudau@arm.com, brian.starkey@arm.com
Subject: [PATCH drm-misc-next v3 4/7] drm/arm/hdlcd: use drm_dev_unplug()
Date: Sat,  1 Oct 2022 03:19:02 +0200
Message-Id: <20221001011905.433408-5-dakr@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221001011905.433408-1-dakr@redhat.com>
References: <20221001011905.433408-1-dakr@redhat.com>
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
2.37.3

