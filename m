Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8220147816E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7396010E1C3;
	Fri, 17 Dec 2021 00:38:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2823910E13E
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yZgKCXxMxXdMGFJR5lD736fmZZUs4WxcnzSatWsTV/s=;
 b=ikXQ9xHpFM2Gc41HLW3jz59+YwXONxW4SjuuyWFVG0UHMXiPD/5jGMuFIjQP7BBjMDQl2h
 NmMzqOcCH4o0yk6Jl1QF61dNp8tqSFV1biePnrNK7P1FhwHYVU4dewHdLXNB+VXGmxXxA2
 vEKUPoPqBwLyhkHDwhp/kCPjJZUmlQo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-S_wOzG6lPjOhGUudv2ahbg-1; Thu, 16 Dec 2021 19:38:03 -0500
X-MC-Unique: S_wOzG6lPjOhGUudv2ahbg-1
Received: by mail-wm1-f72.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so2071235wms.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yZgKCXxMxXdMGFJR5lD736fmZZUs4WxcnzSatWsTV/s=;
 b=sAGRA6+bELqazdRCZiw7vT7UV7ynI2H1k1rO0Ze5ryWB16QDDQZplgmnqececa4Ra9
 c9AX+KwvUwli+rSsRDTqPpILvSoxZG1g1WSIGbQDzL0ichqP6X1zuKCBac0LmhLDDzlG
 kjZn7Fi8Sv/gWf4VPxrcnwgHhYMfw9TsNUHovKXVSF3ve4ZY0p4dupaJtmQeJqbroZx1
 6bSY0VvRB75H5p0/zP148Csd1nAGB+OmQDEGhoO6M9RtO/l0kYX0Hvfs3d3kQNWyeZG8
 DIf7gCN4tvyUIHEOvYpoA0I/i4MRy2xGGIvjOC9343ePMFpupwSjyCRYmPrdBHt/aNVD
 LYxg==
X-Gm-Message-State: AOAM533SLnLZb3v9jcf7xEMULWgiIaTS1vFk0AV9hopVGg1bNQXhNBGb
 X5aMXyQwWjzcGNuh3YQI/p9LaNbvqaqhqZXcrkwWHR4u72cyIO4B6gE9pyA/NN7So5rfy919qDh
 6FpHztoH3uWwBw5imSrj008N9g8hW
X-Received: by 2002:adf:ec83:: with SMTP id z3mr380476wrn.165.1639701482548;
 Thu, 16 Dec 2021 16:38:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzN8V9+x9EQHK2tMJ2CUW6+VwGKoSxsEAxMur+xa4drpIb/8syBawi/xpAJhR/OiKojB/Izaw==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr380470wrn.165.1639701482382;
 Thu, 16 Dec 2021 16:38:02 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:02 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/37] drm/arm/hdlcd: Use drm_module_platform_driver() to
 register the driver
Date: Fri, 17 Dec 2021 01:37:19 +0100
Message-Id: <20211217003752.3946210-5-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211217003752.3946210-1-javierm@redhat.com>
References: <20211217003752.3946210-1-javierm@redhat.com>
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
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The macro calls to a DRM specific platform driver init handler that checks
whether the driver is allowed to be registered or not.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 drivers/gpu/drm/arm/hdlcd_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index 479c2422a2e0..1959ee7592c4 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -434,7 +434,7 @@ static struct platform_driver hdlcd_platform_driver = {
 	},
 };
 
-module_platform_driver(hdlcd_platform_driver);
+drm_module_platform_driver(hdlcd_platform_driver);
 
 MODULE_AUTHOR("Liviu Dudau");
 MODULE_DESCRIPTION("ARM HDLCD DRM driver");
-- 
2.33.1

