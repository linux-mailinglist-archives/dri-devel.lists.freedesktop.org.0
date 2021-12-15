Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EBD474FC1
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF99210E144;
	Wed, 15 Dec 2021 01:01:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FF3F10E152
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530055;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ta/BJOrkWopySKAnFVtxGY/BWy3a5d+p8/Y0sx9Nc9s=;
 b=EBDf0P9lVCpCFnMMRSakMklxL3AECClXHyeHipq0yaUIaeaqeAT4xLmZyxoPw4rSRy83AT
 dJLNNRm+prF8aiRF3HmS8p9yDPFTKM/2G3BUuAPcvduReq06ri+M6K8S+0q8gK6/8NkHCF
 a0RxnPBWOKxX7Ut3617YCrX6t1j9eZQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-eFc6mlDSN9-RFfHOb_j-pA-1; Tue, 14 Dec 2021 20:00:54 -0500
X-MC-Unique: eFc6mlDSN9-RFfHOb_j-pA-1
Received: by mail-wr1-f71.google.com with SMTP id
 f13-20020adfe90d000000b001a15c110077so616371wrm.8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:00:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ta/BJOrkWopySKAnFVtxGY/BWy3a5d+p8/Y0sx9Nc9s=;
 b=DrrEPwu86O1mM/QU0FyD0s8ssuJ6m0tG1SPgEchfTATMpc5k1CGGIJucChEzybBHhT
 tqj3fLbx3+22b6QtifeQUrdQtHUQPBE6e1ZA9gWuvFHASbWEVegNwS4GmN2StGeaDrr1
 9gRUzu0fcdy5UO+aCj4MlouBq9OunZ8spH5gIK7Xhxt7XxnZa8SVMxawrD+Q56gMT00y
 3yUX0m15TbNEviFGSNTajixzhYk7wck3mcbMawSMH0SNoznMvPxzXK5GcPu+66PwbakJ
 GjLrFxCoU7uhuFBXnkJ5ZQ83cDJtYYISldGz2aGxp65/gDIU+nzLMWAHqXVMzQVQCac2
 xG2g==
X-Gm-Message-State: AOAM5302uH3tIFqRngCvHrj056PLt2eoEENisORmKirDxzYAp5anB4pY
 6EiofcMphcxnhPgA4AK8/6yA/216SmeZ/Pj65gh/Fj5Cgo4xOtQtwjpBPNf+E5Yran9iGko+Y6Q
 /TONTmhuBqUCaUOkWFltj+CCInrOk
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr2080127wrt.413.1639530053248; 
 Tue, 14 Dec 2021 17:00:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwsLRMjBE0wc5ZwF8ARaHlVSv0EqCsQANIP5PykNXkYwInd75dCCI3LsyC5MKdbqvLnMvVoqQ==
X-Received: by 2002:a5d:4b8a:: with SMTP id b10mr2080118wrt.413.1639530053088; 
 Tue, 14 Dec 2021 17:00:53 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.00.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:00:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/60] drm/armada: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:12 +0100
Message-Id: <20211215010008.2545520-5-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Russell King <linux@armlinux.org.uk>
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

 drivers/gpu/drm/armada/armada_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 8e3e98f13db4..4f9b0a9f13e3 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -273,6 +273,9 @@ static int __init armada_drm_init(void)
 {
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ret = platform_driver_register(&armada_lcd_platform_driver);
 	if (ret)
 		return ret;
-- 
2.33.1

