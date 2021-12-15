Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF07474FDA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA4610E160;
	Wed, 15 Dec 2021 01:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE5410E125
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FFUY3y4Fc7Li7zPn7hZWKeCZOkC5w2h++A9aiZzcqyY=;
 b=DvH8K+Df2VduTP+l5Cq9uAWjft6EgGGSJ753yzYrvtkzHbNLIHvFQD2ftmyi9bx80BwinW
 qYTppHFDxa2Ub8QR7jnuOdHqvpeu2qdcVx2ZfMNpvXMmXazgvG5A/Gv407hX56q3Oa2NeL
 NVpT52JT8i3jeWkGaYasxSQ3WoSIw0Q=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-5-r6PcOP9ANZSZc-R1rTsAvw-1; Tue, 14 Dec 2021 20:01:07 -0500
X-MC-Unique: r6PcOP9ANZSZc-R1rTsAvw-1
Received: by mail-wm1-f70.google.com with SMTP id
 144-20020a1c0496000000b003305ac0e03aso13857568wme.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FFUY3y4Fc7Li7zPn7hZWKeCZOkC5w2h++A9aiZzcqyY=;
 b=J4qEHWCkV3uR3zoWQ7PqonpoMXkIvKfnBIeaBoQJ8UyedOgV0TeyFpr/XezA8QMoo9
 jteIA34XEUfRprcsVaqLBA8xoc5AZy9Tu01IrFBhJMqHOQnhZCwkKmAgakq7oDk7BsU1
 Az6tZunCSt9wlYnHsHzo9jVFjzUhrNqkIaEGvSGrdbP2ZzoxJInix/hAF52oRDHTY1Mz
 haCmytioOexZyTXF/GC4z46Juz45u0jf15ffRkBPSh4/QA1rs8ChFoqDJ9PFaZ1UToNz
 5wl6jklcRlKqNSOBsfyirdDJiJjosiNdgTJbxhEgJmMN96JFAV5LbdS1zq5UgE2KOIZT
 vn7A==
X-Gm-Message-State: AOAM5324Kh9KGRNMujnULVDtwGKhsj2bbTHqUjGJji/G/nJJ1RzFStBO
 rQxl/M0WClxVsqcewSFmOxt4F9QURKrBTqOSCpYB/m8V8XSits389n5dOT+Cym/JqUxY1c4X97D
 N78CGYjkeTVg3+QiwIVcRiy00wlOJ
X-Received: by 2002:a7b:c097:: with SMTP id r23mr2275697wmh.193.1639530066398; 
 Tue, 14 Dec 2021 17:01:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyBRHnacxFWs8Vwf5YdSr72P6F02qEBLsigQyW6PkgT7R1zH4EboAaqYGonUTE0XPmXOsyY/A==
X-Received: by 2002:a7b:c097:: with SMTP id r23mr2275687wmh.193.1639530066221; 
 Tue, 14 Dec 2021 17:01:06 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:06 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 19/60] drm/kmb: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:27 +0100
Message-Id: <20211215010008.2545520-20-javierm@redhat.com>
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>,
 Edmund Dea <edmund.j.dea@intel.com>,
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
---

 drivers/gpu/drm/kmb/kmb_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/kmb/kmb_drv.c b/drivers/gpu/drm/kmb/kmb_drv.c
index ed2424350773..56a59ee71755 100644
--- a/drivers/gpu/drm/kmb/kmb_drv.c
+++ b/drivers/gpu/drm/kmb/kmb_drv.c
@@ -484,6 +484,9 @@ static int kmb_probe(struct platform_device *pdev)
 	struct device_node *dsi_node;
 	struct platform_device *dsi_pdev;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	/* The bridge (ADV 7535) will return -EPROBE_DEFER until it
 	 * has a mipi_dsi_host to register its device to. So, we
 	 * first register the DSI host during probe time, and then return
-- 
2.33.1

