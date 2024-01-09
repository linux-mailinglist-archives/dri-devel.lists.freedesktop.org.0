Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ADF68285B7
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 13:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB4889FF7;
	Tue,  9 Jan 2024 12:06:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556D889FF7
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 12:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704801975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8M7Gv5IVBBA2mbcRwXaGm3ftRkiaPEEV/XwtkM0luc0=;
 b=b0CkJ9o/DHrAAYBirxLiiI3X3Ed0SWwgt7Pk31orF4JyFf9zbYoQ0MOMglg2YgtYaFFvDk
 OI3DbNsLArT+sDVw8wuC920JsC+7nF+EfzPV5n5m449lXxK87ygiJRVNqO3Xywd+X8oGZ2
 m++xAkenSMIOqvBcJCMDFzZvCu3AGYo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-519-c9CKes3VNVWq542xGpq9Cw-1; Tue, 09 Jan 2024 07:06:12 -0500
X-MC-Unique: c9CKes3VNVWq542xGpq9Cw-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-336f83b47fbso1881394f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jan 2024 04:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704801971; x=1705406771;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8M7Gv5IVBBA2mbcRwXaGm3ftRkiaPEEV/XwtkM0luc0=;
 b=gA2OT3yfh73oMMbexdFSIubf376T40RCL2l1z2TNWyKnPPX1hSVKppC0kj0bmi25KR
 AJe8UOZXkTKVG9+SJM3IsLCskqqAV3OV0jj7c2GDIH2oLm2f/CrVjz2a+qyHcSTxyNJo
 7biKYOkj9QnnOdbnfxLjgVGOLiKrh7P9EXDfzx3vs+bYvJs3EWJNZmoa3lOkBJNNRdhM
 zV3bPasJXZBxNsUYOWAnqx0xruVtV37BCXtc8vlBbIHTQTMan5e8pqIdI4z6T8RfX47q
 ngWQDwbtadAqyMDWgdr6rB8SZuEuSKg+r5bzxPXm4EgM8mSXZKt4Z8VnOObMW6wKiZs5
 ZpSQ==
X-Gm-Message-State: AOJu0YwgESGde0v1QvhNh8d4nkZ0gt2s3F2ln8vBBCBSI4BMgcLglS11
 0fSzCBZnJ3rxnJbCWGFOeX2GvXfmaMh0NCVU5NtEQcecL4vNtbGEMap9cGuVxd3LyIrq/wkwdp/
 4m9fhMIQdMQ3nT69XrPczKnjNjT4p6S+pP9LI
X-Received: by 2002:adf:e4c4:0:b0:337:4a10:ea3 with SMTP id
 v4-20020adfe4c4000000b003374a100ea3mr317797wrm.186.1704801971209; 
 Tue, 09 Jan 2024 04:06:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7g1/Xhez1rCFP7vtPXdsWcQDVa/csDBccgmtzWhXp51V5vd3d6ZEfxealNmYDMH9OoEa7iA==
X-Received: by 2002:adf:e4c4:0:b0:337:4a10:ea3 with SMTP id
 v4-20020adfe4c4000000b003374a100ea3mr317783wrm.186.1704801970911; 
 Tue, 09 Jan 2024 04:06:10 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h16-20020a05600004d000b003367ff4aadasm2250543wri.31.2024.01.09.04.06.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 04:06:10 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/imagination: Defer probe if requested firmware is not
 available
Date: Tue,  9 Jan 2024 13:05:59 +0100
Message-ID: <20240109120604.603700-1-javierm@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Matt Coster <matt.coster@imgtec.com>,
 Donald Robson <donald.robson@imgtec.com>,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The device is initialized in the driver's probe callback and as part of
that initialization, the required firmware is loaded. But this fails if
the driver is built-in and the firmware isn't present in the initramfs:

$ dmesg | grep powervr
[    2.969757] powervr fd00000.gpu: Direct firmware load for powervr/rogue_33.15.11.3_v1.fw failed with error -2
[    2.979727] powervr fd00000.gpu: [drm] *ERROR* failed to load firmware powervr/rogue_33.15.11.3_v1.fw (err=-2)
[    2.989885] powervr: probe of fd00000.gpu failed with error -2

$ ls -lh /lib/firmware/powervr/rogue_33.15.11.3_v1.fw.xz
-rw-r--r-- 1 root root 51K Dec 12 19:00 /lib/firmware/powervr/rogue_33.15.11.3_v1.fw.xz

To prevent the probe to fail for this case, let's defer the probe if the
firmware isn't available. That way, the driver core can retry it and get
the probe to eventually succeed once the root filesystem has been mounted.

If the firmware is also not present in the root filesystem, then the probe
will never succeed and the reason listed in the debugfs devices_deferred:

$ cat /sys/kernel/debug/devices_deferred
fd00000.gpu     powervr: failed to load firmware powervr/rogue_33.15.11.3_v1.fw (err=-517)

Fixes: f99f5f3ea7ef ("drm/imagination: Add GPU ID parsing and firmware loading")
Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/imagination/pvr_device.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 1704c0268589..6eda25366431 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -295,8 +295,16 @@ pvr_request_firmware(struct pvr_device *pvr_dev)
 	 */
 	err = request_firmware(&fw, filename, pvr_dev->base.dev);
 	if (err) {
-		drm_err(drm_dev, "failed to load firmware %s (err=%d)\n",
-			filename, err);
+		/*
+		 * Defer probe if the firmware is not available yet (e.g: the driver
+		 * is built-in and the firmware not present in the initramfs image).
+		 */
+		if (err == -ENOENT)
+			err = -EPROBE_DEFER;
+
+		dev_err_probe(drm_dev->dev, err, "failed to load firmware %s (err=%d)\n",
+			      filename, err);
+
 		goto err_free_filename;
 	}
 
-- 
2.43.0

