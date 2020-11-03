Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 569F42A506F
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 20:49:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 961906E8F0;
	Tue,  3 Nov 2020 19:49:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFFF6E8F0
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 19:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604432981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yRgALKeAwL3sx0iS2wQ17fqCri52qNRN6hAIi0XVJ6g=;
 b=gw4lnIT7EqpjBlHWNl9n6jzmPD97fIEgaou92sUNJjhqn11UGoO53CV4J4V7UD0eG3PfnP
 +6zqX0JpFMeoQp/wLTTimnMDB2FhOpe7dv3Ug5alx4m8Ts/rrwwwp6DGF7v/wONdAgByvT
 ClAH9QDsRe/VhVcLagn2J/CzM45aReM=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-211-IwY2LV4MM1WuYZiOQ80ubQ-1; Tue, 03 Nov 2020 14:49:40 -0500
X-MC-Unique: IwY2LV4MM1WuYZiOQ80ubQ-1
Received: by mail-qk1-f197.google.com with SMTP id q18so8233224qke.9
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Nov 2020 11:49:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yRgALKeAwL3sx0iS2wQ17fqCri52qNRN6hAIi0XVJ6g=;
 b=GqKb8slIB0DrLbg7C4J0kwrsok239rJaG7qdCjyI2K+Yv3A3jToUfGrwucXwaHu+lu
 YLWH3es3hVNSLgpf858jeMXKq0OMAvFnJHrWjz4l1+rBLsltq9qPZOJ0bYIV+Ik54NwN
 YN4fweRXuTj8geVNN/qX40badIKJSmZ9BTwduuXp0GInZNe5MTIXWTyUTUfz8h1Mwmdl
 Ir0leB4XW6KNMtEd99c5SGp0JJJ29OLnf0Upfowe9hfPBpY8tS7StMzhiPUB8Yv3FP8H
 uAv9RH7s9qPkcMmHLfBeNHPVYHEJETx6ytPf2KwqmQoySP0gPlgQl4mwCMWUG2jBDxbW
 OgyQ==
X-Gm-Message-State: AOAM5314zCiNegp3w/II/SdQstHT6b/hlTmNJTWQlHDUIQ/PYGGbt2T4
 4iGyZoIg3ywEyVNYONJCQCvQLBmBt3VI/ulBiswsorLNmm3s+on7XSpXzcKYmRdmOoRmc3WtMRP
 PhoykI/dfkWb8kTeaK0GuaewvZRxU
X-Received: by 2002:a0c:8143:: with SMTP id 61mr28273246qvc.6.1604432979409;
 Tue, 03 Nov 2020 11:49:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxe2/eHvm2y4cYBO5/HR+vq0YC4gRRvwFqseWsvRM6ddEbcIT1VL9RyJKhYkXTPnfzfIHbvuA==
X-Received: by 2002:a0c:8143:: with SMTP id 61mr28273226qvc.6.1604432979204;
 Tue, 03 Nov 2020 11:49:39 -0800 (PST)
Received: from xps13.redhat.com ([2605:a601:a639:f01:1ac8:8e0c:f1cc:7a29])
 by smtp.gmail.com with ESMTPSA id w25sm11392532qkj.85.2020.11.03.11.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 11:49:38 -0800 (PST)
From: Jeremy Cline <jcline@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 1/3] drm/nouveau: use drm_dev_unplug() during device removal
Date: Tue,  3 Nov 2020 14:49:10 -0500
Message-Id: <20201103194912.184413-2-jcline@redhat.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103194912.184413-1-jcline@redhat.com>
References: <20201103194912.184413-1-jcline@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jeremy Cline <jcline@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Nouveau does not currently support hot-unplugging, but it still makes
sense to switch from drm_dev_unregister() to drm_dev_unplug().
drm_dev_unplug() calls drm_dev_unregister() after marking the device as
unplugged, but only after any device critical sections are finished.

Since nouveau isn't using drm_dev_enter() and drm_dev_exit(), there are
no critical sections so this is nearly functionally equivalent. However,
the DRM layer does check to see if the device is unplugged, and if it is
returns appropriate error codes.

In the future nouveau can add critical sections in order to truly
support hot-unplugging.

Signed-off-by: Jeremy Cline <jcline@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index d141a5f004af..4fe4d664c5f2 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -792,7 +792,7 @@ nouveau_drm_device_remove(struct drm_device *dev)
 	struct nvkm_client *client;
 	struct nvkm_device *device;
 
-	drm_dev_unregister(dev);
+	drm_dev_unplug(dev);
 
 	dev->irq_enabled = false;
 	client = nvxx_client(&drm->client.base);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
