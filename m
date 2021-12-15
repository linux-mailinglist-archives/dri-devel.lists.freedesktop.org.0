Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C95474FF5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13CB210E1D5;
	Wed, 15 Dec 2021 01:02:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4555510E15E
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530088;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KPWP8E8vlF3j/9zyVbEBgLJAnHOMG05UNKEMPCeGQek=;
 b=C1rHFeeq7np4VB92zVmvRkzAVSzHzvXgTSai0I1aoTHv7NiWCn4HtSPnTajslAuFq3SZey
 7gs7kmdShtw2g86/2OKqQAQcDoDcXFI9cHlEnBMS78eWPrgKW7vLRPO1xq+GSX+2sO+I7Z
 CLcZcV/liNA8EntzljbWW/7uyXUyZOM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-zd19boRrNj-j5r3ubMjyuw-1; Tue, 14 Dec 2021 20:01:27 -0500
X-MC-Unique: zd19boRrNj-j5r3ubMjyuw-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso13872432wms.4
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KPWP8E8vlF3j/9zyVbEBgLJAnHOMG05UNKEMPCeGQek=;
 b=PcGJb8FB9W3aGGSE0YTfHjsf9qVwrqyO3ifPJBHPZZkDKNmKHx1rkT/gFLrOGhZZFz
 lPwFd/4SDiSuAowZbGUlzNLbwuMyGimsl0JgLAF+y/PNPSaAUrgSoYh7hb+A2ukApQSM
 GX7yLEvg+VqtzXAmkYBTY1lz9BaaDRdshIC579RluTMYsIwdYL2rOaLz0/uYvR3lLMJe
 GHLCR0BebsnIbrQIYgBf0RoKP06+D6DDmjn/q1/3+USP0tX2Zfeg953d+sHPOqJNRDoa
 28svD7eIfh2qyqEpE/ITrARVs2W2zTPy1PSb62ZTzUnUm6aAcdPscPRdld9Ifo4atBW2
 Q0XA==
X-Gm-Message-State: AOAM531wOm+Di0HShWcPUSaBbxixCKZmnDGdjvNvT6qJ56vgwfiFXXO+
 jLaHQFXEuBrv0m/kpQ/V0iITfYE9XFyOb6rnVy5qMaRn74G7Hv+BaocgbDdnfZbA9u9bzO6jg1Y
 AzvNjE7q42lEvVVxJIbaAF1bh2MVR
X-Received: by 2002:a1c:5445:: with SMTP id p5mr951343wmi.137.1639530085493;
 Tue, 14 Dec 2021 17:01:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC2ib/uK2QIaWxvvQGfp9Zjg+MQWGESUHnyWTmgIVwzTH0X6VAxVfSCQZ5EAlMy02Zo9Ve3g==
X-Received: by 2002:a1c:5445:: with SMTP id p5mr951333wmi.137.1639530085314;
 Tue, 14 Dec 2021 17:01:25 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:25 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 40/60] drm/sun4i: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:48 +0100
Message-Id: <20211215010008.2545520-41-javierm@redhat.com>
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
Cc: Chen-Yu Tsai <wens@csie.org>, Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/sun4i/sun4i_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index b630614b3d72..174d3d7790e6 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -373,6 +373,9 @@ static int sun4i_drv_probe(struct platform_device *pdev)
 	struct endpoint_list list;
 	int i, ret, count = 0;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	INIT_KFIFO(list.fifo);
 
 	for (i = 0;; i++) {
-- 
2.33.1

