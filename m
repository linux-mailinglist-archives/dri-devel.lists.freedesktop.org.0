Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 981705B36CD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 13:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27AE410ECC8;
	Fri,  9 Sep 2022 11:57:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0843510E040
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Sep 2022 11:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662724616;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sUhF4bO8BP74auKvOt1N2/Og87wKgOioSUJdinYTuaU=;
 b=PIkXumkF+uNsQL2gs+m2DZk3Ao8nyA8uKDn4rgnnz2JUigTJbXS+0/jyhvEjtStqT9zPtr
 dIH4ODOs2Ty5EyNkQ+Hab/niMl0YmjBDK5HskpHTvwtgNhzhstg9sVY8RJpYFIhubcNaZP
 bQdMR/g4i8w/WQhB0PwGGPPLhpUveEY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-2GIMCVQxPx6JjX2Rsbqslg-1; Fri, 09 Sep 2022 07:56:54 -0400
X-MC-Unique: 2GIMCVQxPx6JjX2Rsbqslg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9CC033C0E210;
 Fri,  9 Sep 2022 11:56:54 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E44E1410F36;
 Fri,  9 Sep 2022 11:56:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Subject: [PATCH 2/6] drm/gma500: Remove runtime_allowed dead code in
 psb_unlocked_ioctl()
Date: Fri,  9 Sep 2022 13:56:42 +0200
Message-Id: <20220909115646.99920-3-hdegoede@redhat.com>
In-Reply-To: <20220909115646.99920-1-hdegoede@redhat.com>
References: <20220909115646.99920-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Hans de Goede <hdegoede@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

runtime_allowed is initialized to 0, so the runtime_allowed == 1 condition
is never true making this dead code. Remove it.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 54e756b48606..7a94e0d8fa6c 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -433,18 +433,7 @@ static inline void get_brightness(struct backlight_device *bd)
 static long psb_unlocked_ioctl(struct file *filp, unsigned int cmd,
 			       unsigned long arg)
 {
-	struct drm_file *file_priv = filp->private_data;
-	struct drm_device *dev = file_priv->minor->dev;
-	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
-	static unsigned int runtime_allowed;
-
-	if (runtime_allowed == 1 && dev_priv->is_lvds_on) {
-		runtime_allowed++;
-		pm_runtime_allow(dev->dev);
-		dev_priv->rpm_enabled = 1;
-	}
 	return drm_ioctl(filp, cmd, arg);
-	/* FIXME: do we need to wrap the other side of this */
 }
 
 static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
-- 
2.37.2

