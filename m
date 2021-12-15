Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D098474FD5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B5189FAC;
	Wed, 15 Dec 2021 01:01:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06DA710E155
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530083;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n0Qeg1XtrmMJ6I9FESbbvredwBDg/CTYfsGnS4MCcCE=;
 b=DnmQVVndbM9IdwN11Lm1kE669FHaD/KlcPO2CYSC2RLU/CD6u/a7ahb4/846s6zcih77Ah
 j9GKmVAHOcMrIKP4iFpCySc6r7Vn/8+K+QTW99OTzHH5gsQ0JtuZkhj8ikLOBPrxdSghOq
 54zPxdfBnqPgUZiKzSfozdO9eXFrVRw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-CYZrDUOwOnSbBKCdsP3KPQ-1; Tue, 14 Dec 2021 20:01:22 -0500
X-MC-Unique: CYZrDUOwOnSbBKCdsP3KPQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k8-20020a5d5248000000b001763e7c9ce5so5409025wrc.22
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n0Qeg1XtrmMJ6I9FESbbvredwBDg/CTYfsGnS4MCcCE=;
 b=FzvIK1KX0Hcfokr18O+3kP1uz93RTKSiKlmpslzHPSSwCAcxtaVcxcJMk+lJZRRazk
 LfKQDgTCuHI5vtc20QtkEkr+0TuS+nSEWHPcuQFpACebjbiF8sgA8vrWPLwJx+eC7TB/
 iYf5byjtSxAvadQ7yzsFpQ/BJe632Y909oYGbREfucrwK+dmPd6sJKq7tojP9Yl7vgf9
 JfUs0I0JH/qHXwJKAk1V9/hfxqDR9XtbBDfRriOuv/jji5peQ0qixPVkfkshYBPM1ABb
 b6CdDFu/O7v4x/bRrlifa0EfQxejt2qIyHBBonKdO7mzEbzRBSuLYtZnI1VSw38t1v3P
 4F1g==
X-Gm-Message-State: AOAM5318IHeEw6Y1R9qaEFTRe85Bs4eBLGd3ae9JJsWxXdDpRLqyzi56
 Xuj7vuHh/TqvqzRWJnFNn4UtMbvsFbJHPeGlgmuKTFxS2uoB7D6lDQ0dkiU8d3PpMdw0eklcDsG
 aiY06kDhBXyzoiSG5P+6mzjblDnJU
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr2288765wmq.122.1639530080758; 
 Tue, 14 Dec 2021 17:01:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw0M50lbmTt43Xk8dBfnzkCOnU7EwfJT3eiU1UsVtqhjtvQH7uYilHF22Y5O3T2RfEMLnQ4fQ==
X-Received: by 2002:a05:600c:3506:: with SMTP id
 h6mr2288752wmq.122.1639530080544; 
 Tue, 14 Dec 2021 17:01:20 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:20 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 35/60] drm/shmobile: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:43 +0100
Message-Id: <20211215010008.2545520-36-javierm@redhat.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

 drivers/gpu/drm/shmobile/shmob_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
index 80078a9fd7f6..7011c659a921 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
@@ -195,6 +195,9 @@ static int shmob_drm_probe(struct platform_device *pdev)
 	unsigned int i;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	if (pdata == NULL) {
 		dev_err(&pdev->dev, "no platform data\n");
 		return -EINVAL;
-- 
2.33.1

