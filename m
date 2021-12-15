Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9F3474FC9
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B6510E159;
	Wed, 15 Dec 2021 01:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4913410E125
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4+msvf+qowHp1HRo12KuePWcAeO9dq4LBkUMGYiKJfs=;
 b=iiE2PkzwzIhYfdl0Slytb5pEz9JyFjGl040XK98LINbAz0wVUHNU/+rFMiFkfwz6KjqnIi
 CjZeYTMuMmzSQJXriNWilDW6RKqT5TVfqYkYDlLGGcdbv23t0tiOANyc9SzqKUQbqRgmH0
 P0JcQt77n4/LCYv/UDUyXnzZLlqc+10=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-326-qkhigEueMri8fTUpkb_kog-1; Tue, 14 Dec 2021 20:01:01 -0500
X-MC-Unique: qkhigEueMri8fTUpkb_kog-1
Received: by mail-wm1-f72.google.com with SMTP id
 j23-20020a05600c1c1700b0033283ea5facso263824wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4+msvf+qowHp1HRo12KuePWcAeO9dq4LBkUMGYiKJfs=;
 b=eTg6z8CQN/qOCuL+HX+g1oMoVIURmJbhjrJxDnEJ592gRVtOT9Z76Q88jPdbOlX8ZW
 I1O+vFESi2r2gjNWSeBrw38JIF84rvs8iGEU6vlrOP0ntpjRhQJh+8oBLZ4lt5bqmVFL
 V/35Ajhb6AQ5H9MKuibcNCGuPKUcwwdYTrCz+QFnHjldfkPYXbBwJSZq53KtW1gULxk2
 2hJXKWiw1HVvR2R15OTsWLNqi7FKa+H3hS9rrgbj9LBusZDn24kftO6xE2v7Wb6CSg8m
 h019GPrpLgtMrWd2TQ3lSpqC8SSsyd3fSTU2wTSlVxrOvcqJJmx9NdICLyn0pm0vciEo
 KBeg==
X-Gm-Message-State: AOAM53307oba9Zg5nX0/CiSHtY+WRCBbTwN5CZY0ZXO9opGYJSH6BNEE
 IvsUXdyz/yxNi4aijWnoYtMY0AE/4T5fHdkovYQ7U2yF6BCs11YuOelqOWRwAbxN3q99tqDz8tH
 u00l5OdlXOlz8R3+xVy7Qvl7WI1J6
X-Received: by 2002:adf:c146:: with SMTP id w6mr2172864wre.541.1639530060150; 
 Tue, 14 Dec 2021 17:01:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwQIMVv6PwVt+SrjSfagS0OVwceAnaI9S7mGufWHm1b01W94NLSkOh0t/pBQ2zxQOuEt/WFYQ==
X-Received: by 2002:adf:c146:: with SMTP id w6mr2172856wre.541.1639530059982; 
 Tue, 14 Dec 2021 17:00:59 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:59 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/60] drm/hisilicon/hibmc: Add support for the nomodeset
 kernel parameter
Date: Wed, 15 Dec 2021 01:59:20 +0100
Message-Id: <20211215010008.2545520-13-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to disable Documentation/admin-guide/kernel-parameters.txt, this
parameter can be used to disable kernel modesetting.

DRM drivers will not perform display-mode changes or accelerated rendering
and only the systewm system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Patch-cc:Tian Tao <tiantao6@hisilicon.com>
---

 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 610fc8e135f9..f66de93831c6 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -315,6 +315,9 @@ static int hibmc_pci_probe(struct pci_dev *pdev,
 	struct drm_device *dev;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ret = drm_aperture_remove_conflicting_pci_framebuffers(pdev, &hibmc_driver);
 	if (ret)
 		return ret;
-- 
2.33.1

