Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8C474FEC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E3AD10E1B5;
	Wed, 15 Dec 2021 01:02:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41DF689C14
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g13vgTwK95Nb9J+XqBfe3e0QnKLA1jpSXKM4Gkznqus=;
 b=CYXDQNFMnruM24iaubaW9tH2BM9AEERvGGjfpCuhBVMtAnY8XARLcV1k/jvekQbmdfPpap
 xV7OIVDtOdm5ZVUxESuld2ZmLDYqlECtxNlJyTKQ/mRQBhkWJcSwpLgEq+djPxV45/5glO
 WO1VFUKOZXxHgmE/+1cVmeyPpLbmXSU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-672-bX_8j4OhO_WrRaJrMndxrQ-1; Tue, 14 Dec 2021 20:01:30 -0500
X-MC-Unique: bX_8j4OhO_WrRaJrMndxrQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 j23-20020a05600c1c1700b0033283ea5facso264263wms.1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g13vgTwK95Nb9J+XqBfe3e0QnKLA1jpSXKM4Gkznqus=;
 b=qZz17x5GF72vHkHuPPmUNucSAv0hB/WwjvAUwiB2j4oxsnJf3Au8dyGXwxrropTrLN
 W1OCc7KxIxMz/FeXu6MuHCGdYDOJuckcCswj/JIN3s2Yh3OYIsC1TaPSR67+ZenPmXIb
 pPWHvqB1KaaPjoiafkD8J+ub0dphmuU0I4kwFhKe6I8toz00gmEzIlTH9oEP45imLhFe
 V+6/L40LVcquBtR1iMwxLOEhFXcwugzEDts8fKofLHVP9EjeHSt9ApeDr0ZkcGfzQU/4
 ar23DNvIxS4Vqp1vduKkY0DA6JiVbIG5/0Q6dubXJBAJs1CHsLTSSNo7LPK2uh+2ABha
 jS0Q==
X-Gm-Message-State: AOAM531UJ0YMvYbjL89bKeYF3D7Jy2IkGifHoOehn0puJfoaVvtzPz2f
 mHmUL1R0aZGFkyAwX0n+y4BW1+yHPLmpvpWaoo9lPjp/gP2z0BSo8Rl8pPpSAzdVWBZ2IoxPJRI
 Eiw4dhiF+aaR0DsOH29139JKknad7
X-Received: by 2002:a7b:c017:: with SMTP id c23mr2231900wmb.137.1639530088730; 
 Tue, 14 Dec 2021 17:01:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLWnkY7t73UpAMyPZvCL+/ruSdaxpZrBS5KHfSm4lVNH+Ia9HiiZZrXZTRnuFK3moIMpLfYA==
X-Received: by 2002:a7b:c017:: with SMTP id c23mr2231893wmb.137.1639530088576; 
 Tue, 14 Dec 2021 17:01:28 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 44/60] drm/tilcdc: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:52 +0100
Message-Id: <20211215010008.2545520-45-javierm@redhat.com>
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
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomba@kernel.org>
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

 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 3ddb7c710a3d..25fe1f8de6bd 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -606,6 +606,9 @@ static struct platform_driver tilcdc_platform_driver = {
 
 static int __init tilcdc_drm_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	DBG("init");
 	tilcdc_panel_init();
 	return platform_driver_register(&tilcdc_platform_driver);
-- 
2.33.1

