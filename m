Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B85F330371
	for <lists+dri-devel@lfdr.de>; Sun,  7 Mar 2021 18:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD0D6E079;
	Sun,  7 Mar 2021 17:49:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F35F4898E4;
 Sun,  7 Mar 2021 17:49:25 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id n79so7196477qke.3;
 Sun, 07 Mar 2021 09:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=naEL6AlE5P2OmqExZ9prNWI8kGRtuL6si5yW6TuTam4=;
 b=iaHNKyxipXn55s1z9UxZnkEqIX6YtUb013+8nlrLHNtWtjJJLEh150QZ9nwPeHOe+T
 Y79B5BV1iVIx3podYMq7o3nFHLcwOC2POnj61MNr91obZ+BgH0k0vG8pudQK4kPccqGv
 +049qbGnfsmfH1mbz20l9eL4dDP/RHo/we7OAGYdsTEt8/xlxWV9a+HcR+bA3NmhQJPT
 u5RQxDRlr0mhXPzYYE9csXu9i5fQx4oecgMlNrYUxvYuU7wlTx6nKG5b6hiK/VPKg5jS
 +YmKR6cc5LH58W+xeopMVWqbtFfzGNqPIGNlAPMShp2yQ0BmFaYxmOUd9u5378v926aN
 WMfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=naEL6AlE5P2OmqExZ9prNWI8kGRtuL6si5yW6TuTam4=;
 b=jm8+sdh840nP8cFtAUUWmaYyaNT6eALz0kIuPYYWF0Blki1lfu7UsZjE2Tbagc1Qg0
 bS0nhUoq2J4utCJsMrPwi2A/06xQdNIHcrF5G6hsUFdf2G3kXPbyEsCcjfas28Bb3ZV2
 DW+TarzfjKXLm9GYGngY6X3EbCox4pjXqx+DWaGzdDrgrY4SJjp3E9VoIPHKgvTfJ7fy
 vGj01/phq4Z/69yiFpl4Vqua284NRxrdx/hTehNFF2QAn13TPidAILiO/Ki3wRpUP+7C
 mf9yYI4J+/aDMwEoaGXOgJAh9fQQgK2ZWNvejxb3hX0VidiS5IeATymbGZRD/zEO45uB
 JpJQ==
X-Gm-Message-State: AOAM533/4lu3BaH/fsWHq9b4nNG35CbbO/fzaYb63CR0kt9IIcUclSHT
 fU2VqG5/l15YIBL/wtwfPaY=
X-Google-Smtp-Source: ABdhPJw6H/zGeACZcIyalUEcdXQw4T5njNsIqSEwK98j/QDguSeb4w6drziERYrP4I2xw1/rDMJhSA==
X-Received: by 2002:a05:620a:414e:: with SMTP id
 k14mr18576858qko.243.1615139365011; 
 Sun, 07 Mar 2021 09:49:25 -0800 (PST)
Received: from athos.hellosponsor.com ([70.19.70.200])
 by smtp.gmail.com with ESMTPSA id a14sm6130862qkc.47.2021.03.07.09.49.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Mar 2021 09:49:24 -0800 (PST)
From: Ilia Mirkin <imirkin@alum.mit.edu>
To: bskeggs@redhat.com
Subject: [PATCH] drm/nouveau/kms/nv04: use vzalloc for nv04_display
Date: Sun,  7 Mar 2021 12:48:53 -0500
Message-Id: <20210307174853.28273-1-imirkin@alum.mit.edu>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: "Nathan E . Egge" <unlord@xiph.org>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The struct is giant, and triggers an order-7 allocation (512K). There is
no reason for this to be kmalloc-type memory, so switch to vmalloc. This
should help loading nouveau on low-memory and/or long-running systems.

Reported-by: Nathan E. Egge <unlord@xiph.org>
Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/nouveau/dispnv04/disp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/disp.c b/drivers/gpu/drm/nouveau/dispnv04/disp.c
index 7739f46470d3..99fee4d8cd31 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/disp.c
@@ -205,7 +205,7 @@ nv04_display_destroy(struct drm_device *dev)
 	nvif_notify_dtor(&disp->flip);
 
 	nouveau_display(dev)->priv = NULL;
-	kfree(disp);
+	vfree(disp);
 
 	nvif_object_unmap(&drm->client.device.object);
 }
@@ -223,7 +223,7 @@ nv04_display_create(struct drm_device *dev)
 	struct nv04_display *disp;
 	int i, ret;
 
-	disp = kzalloc(sizeof(*disp), GFP_KERNEL);
+	disp = vzalloc(sizeof(*disp));
 	if (!disp)
 		return -ENOMEM;
 
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
