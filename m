Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C8B4781A4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4245410E31E;
	Fri, 17 Dec 2021 00:38:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDB4810E281
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ESJ36qtFFPcXimyUN/SOrGqyDLoHG8BfmtKA3r/j+kA=;
 b=Bva+e/YKgnvU5l2aigVGqQ9bKeaLNlak2UrcMxo4A7jdC9SFawr6KK6DD1K1wtxlCMkq9X
 ZXg6tV6N/uIW8Yx5B6VUQSv7yS5ZgUqNqELXEVBl2LsfeN/RHSThPByQlmSHH3dy5qe2GH
 bxGBH8bH4Ufcnrw0GNiRYoe3mrFUVPM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-10-R8jfZOm2O221YnqTLZ4Dyw-1; Thu, 16 Dec 2021 19:38:30 -0500
X-MC-Unique: R8jfZOm2O221YnqTLZ4Dyw-1
Received: by mail-wr1-f70.google.com with SMTP id
 o4-20020adfca04000000b0018f07ad171aso140041wrh.20
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ESJ36qtFFPcXimyUN/SOrGqyDLoHG8BfmtKA3r/j+kA=;
 b=Os0oEVzABEiSNkI3qWz+FtbgOfFxUlRmr/60SDC3328Dc/Gq+KszNHNsGpdWvWJEkn
 pozMrsrDwpk3MshXMLtEck/QWLyGI6CXPptoZ5nJh8No8zdF6M/303IHccXdMMTnwumr
 1tSrP5wP4JuFhblcZRSpdP47Fhm8UEMNbm7EVqghGf2np/Xe2reHEtEC8kqGmIGcYCm6
 dL7lsuh/Mt5K46xSblneGXmJJthmYkN4BlW/4isOfaW0UtvxkJfCqBSnrZMSAym8gftU
 XKY85nqe9iwQoIzDw5nDPTOX2o2yxb7wDjPFqENLJbzkQw4dOtTqPuah6bR8gtoRb70u
 5WlA==
X-Gm-Message-State: AOAM533kAcEYFjCCxFQ4TNkqLSSzxfaRbFujK2CIHUKdhup1WBw6Q1vQ
 LY9NQOygHWhCrsii91bW8LfsHGO1vHhAZn/9FOWexJnBwtD/c0tuzk1ThexVoetUYL/jxIcMDMH
 6H+QwPdSNMB/KG5Fzbtu+fvg1NBFN
X-Received: by 2002:a05:6000:168e:: with SMTP id
 y14mr385042wrd.178.1639701509324; 
 Thu, 16 Dec 2021 16:38:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxK7FfN8kb8HttL9YlqdACI1cpfVlOFD/S7iG8wfvRdAbI0Ii6+du5UWJPfTYJ2I/kou4QLew==
X-Received: by 2002:a05:6000:168e:: with SMTP id
 y14mr385032wrd.178.1639701509146; 
 Thu, 16 Dec 2021 16:38:29 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:28 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 32/37] drm/rockchip: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:47 +0100
Message-Id: <20211217003752.3946210-33-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
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
and only the system framebuffer will be available if it was set-up.

But only a few DRM drivers currently check for nomodeset, make this driver
to also support the command line parameter.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

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

