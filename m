Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD85474FCA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:01:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C33C310E152;
	Wed, 15 Dec 2021 01:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CD5C10E14A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XGTIhgk3Nk7+6Si7STv7J04XeA+V7br+Ro7B0SjyNKM=;
 b=hFYguGlCurXo6Fl0eeYtVxxdFv4RlHD81WQwSNmwduxU1gAVORkKa34P4ytPGP+IPNmsBK
 NCgXL5/AU32GXY/y1Cl99f9MgpRUaERQDjHvcKzzIpytIdoe9iljGqLdX8PcxbQhrz/EgN
 chn4UP6Xhy08IMzl0yftPLIPLUbsWD0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-423-GizRjbSjNBCvZCdUpzslxQ-1; Tue, 14 Dec 2021 20:01:06 -0500
X-MC-Unique: GizRjbSjNBCvZCdUpzslxQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 187-20020a1c02c4000000b003335872db8dso11939733wmc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XGTIhgk3Nk7+6Si7STv7J04XeA+V7br+Ro7B0SjyNKM=;
 b=bRDlZU3eWQRiZKFqycf0+weLvRrIQSzXw+tCGPVYOj5DAICquGTX6u0lwTQ3FaHM/j
 Jh6Cer6ihXHkF9j/QHIHmsBZRkr9KzDmoXWmyZvKo0KQZyOCOLebLHfRZjAd0H+ujQzB
 I9ioLQSrgNcpTNV6c9uq04zDSQKWFzuJz930QY2p1yEcL89akyKQGkiTwFzf2IzGal8t
 YIemFSZsfswjlPvWYUQ6pYHtb8v5/4bpvOc2vfEQCN+ddoE3se/CZXGsIWHbJXhQSlzh
 3LT6fITdsd2u3yz4S/txdTlHLpbRSHXXRIJ175tmogSnISt+mJpM/ukPoqorEZ+zYQd5
 mrrA==
X-Gm-Message-State: AOAM530u6xOuy3efGQWFvEAglpKs/BqAcYICaoKodyZsNbm0HwGeyeZ0
 eukZbuf83heO1Y6EqXMYz+Cqw/fiIozW+SfoJUrRlIWvC/9heJJ/vTo0jCGwSswvaHFOMmwOiVZ
 k0o78ai1Tc+Wej2uoR3BOZ0Yd4xS8
X-Received: by 2002:a7b:c306:: with SMTP id k6mr2286479wmj.15.1639530064849;
 Tue, 14 Dec 2021 17:01:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLH34X5QqMkkKlKq8+U5eGGqpS6ask7gBEx/Kuxzk6vtNcXskqKxuZyjCx/2YEQmErgYtEWg==
X-Received: by 2002:a7b:c306:: with SMTP id k6mr2286467wmj.15.1639530064637;
 Tue, 14 Dec 2021 17:01:04 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:03 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 17/60] drm/imx: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:25 +0100
Message-Id: <20211215010008.2545520-18-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/imx/imx-drm-core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index cb685fe2039b..a57812ec36b1 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -341,6 +341,9 @@ static struct platform_driver * const drivers[] = {
 
 static int __init imx_drm_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	return platform_register_drivers(drivers, ARRAY_SIZE(drivers));
 }
 module_init(imx_drm_init);
-- 
2.33.1

