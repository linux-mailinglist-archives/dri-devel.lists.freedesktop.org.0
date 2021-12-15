Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C0431474FEE
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858C810E188;
	Wed, 15 Dec 2021 01:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D44E10E155
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rlYV5jujXPmrTef8VMng0tahS4lUJ8NEfoE2L3lNMRc=;
 b=EH+Ui55QtFB+kdHZwcenr7wUEF7iMQJNPBvhAasyjPLUls5toZquwdr8CT8o6jIcfsgzMF
 MbuwcMUyBz2ZkR7xooAxsxTUStBv0OrwdSLBaMdTi3eryYsrMVUOc/LUNwQRVpKooj8U08
 1s4jev/B0y0XyJFas3CTt/eEuSUawAI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-586-_cUYLbYrPVyOGjS9CyE1xQ-1; Tue, 14 Dec 2021 20:01:21 -0500
X-MC-Unique: _cUYLbYrPVyOGjS9CyE1xQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 k15-20020adfe8cf000000b00198d48342f9so5383842wrn.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rlYV5jujXPmrTef8VMng0tahS4lUJ8NEfoE2L3lNMRc=;
 b=FhiBSQbVANxQk2VUp858k+72jgge8fEQHK/wEpOcqiFS+cumtUGvOCwZid7DC8cyzr
 ANXsYCOvkGEVXY1CRFaRot3fjixkZMNwIekFgqZq/G0UcdeMKPWYnyUD1TGlBC1vJoKJ
 94CZ+bhuPz8YMh5dPdz37+AvRA/9/iCzoqYr7PZaY9ZkRp3H0tCsSxFFZ0Pg5HZmyBZq
 0ndas+ffXMIAIu9I+s5vF4/IiQ0FKwMLwMF0xhDJ2MxmthVtdbvvSBDIbf9EuEsmj7rG
 oKGuZ7uSmz5Y21N0w99+UW6K5wThRPeCneVzToaSyXLsX/KFYMu52AOh16Pmr7JHx7rA
 /QnA==
X-Gm-Message-State: AOAM531z6PvVCalBLOIs0fm4LFCSrRWSOCDB+rLq8W0e6V8uqCXImD/j
 kHjRhOkpccY7KzW5yNHBMK/eQDkw96pi3uzJ8AssLUwHRdlirx4BU1pjVgLqkSIi9JUPc2mS2oU
 vSJ9UsebatvgkLlywD7cfk6x7M1Lw
X-Received: by 2002:a05:600c:4ca3:: with SMTP id g35mr4287wmp.54.1639530079222; 
 Tue, 14 Dec 2021 17:01:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwbrE2P7uLd5gohyPv60Cvh2x5AK1c5Fb/dSoeBTKa1erFm5CYUANmoo1pNd8dydJLjKaDOg==
X-Received: by 2002:a05:600c:4ca3:: with SMTP id g35mr4272wmp.54.1639530078984; 
 Tue, 14 Dec 2021 17:01:18 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:18 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 33/60] drm/rockchip: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:41 +0100
Message-Id: <20211215010008.2545520-34-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211215010008.2545520-1-javierm@redhat.com>
References: <20211215010008.2545520-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: Sandy Huang <hjc@rock-chips.com>,
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

 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index bec207de4544..ac190e2b1f7a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -457,6 +457,9 @@ static int __init rockchip_drm_init(void)
 {
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	num_rockchip_sub_drivers = 0;
 	ADD_ROCKCHIP_SUB_DRIVER(vop_platform_driver, CONFIG_DRM_ROCKCHIP);
 	ADD_ROCKCHIP_SUB_DRIVER(rockchip_lvds_driver,
-- 
2.33.1

