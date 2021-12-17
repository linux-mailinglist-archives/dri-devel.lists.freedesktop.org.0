Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E9204781A6
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 008ED10E288;
	Fri, 17 Dec 2021 00:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80B9910E216
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uYOa0F3jqaQqpv+N8rljaqNHk1HiWXZfWmsXt7P2ADU=;
 b=BjVVn9owmgKCVUKN5yViKCP4ccrzZGVJ/92Cr/ZapTxrlpnlhff6abM8mD2g42HIhS3LbD
 ReyID6PN7kUNBulIbEB3KFayoqvWnCIiW6o42ionaPE5rtv58LqP7Fz7A8Y48p5RTmLNYW
 Sr/CH/XEUC4ttNLjSrdD6UjHK+gS988=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-194-xL5CrdhdNh-8uYEMCVIP5Q-1; Thu, 16 Dec 2021 19:38:23 -0500
X-MC-Unique: xL5CrdhdNh-8uYEMCVIP5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 b75-20020a1c804e000000b0034569bde713so2066710wmd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYOa0F3jqaQqpv+N8rljaqNHk1HiWXZfWmsXt7P2ADU=;
 b=32TV0Rao7mr7BeyBIaF7ttufDzw+lhAzC+9AL/s/W+xEnEwxuZi8A527IVlRyEts/6
 spDytjdiKXLpFgPwS5Ast/7tkhX3deA4Xur/8QXHyrllVPp1atqQyiu+fv65f2S++VkT
 uJ/TRSaG31K4yvq1/GbcdnP6mKTSDXTGCbHhHt1/I7/c1A1L/88rGagFiujmge6DPrsv
 m80yePe1rJHRcBqCY6xygFuSTByAyXktSx/h/ztjNnXosDbPchhOmCWnAEQyQULb6e6H
 ZZkc9Oie/dywGLYyxK97niPgpN/v+0eVgNVg+F+gyUWrCJwoyDcs7v1rEBdzqYBp/fra
 Aitg==
X-Gm-Message-State: AOAM532WUrMEmmGIpuaW5sfBncg+q5UMbMck5HXhSu7khkHZTO8OSkIE
 mB2gcewwwZXk2Bo+fjRmatNWnooNGbnm0H1sx216u+NQJNRTFGrqHa3sfaG+uAue20btfqL5xIz
 +t2SqKuUQjqOX5O2QrISWvbRAT1hd
X-Received: by 2002:a5d:6e8d:: with SMTP id k13mr363709wrz.449.1639701502083; 
 Thu, 16 Dec 2021 16:38:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwxTViLGqNo1DGlMqBapIEqyC75s/aJw0u0oxAO3rcEgKyVzTALKlCVK39UtqnhY5i7uh+BBw==
X-Received: by 2002:a5d:6e8d:: with SMTP id k13mr363703wrz.449.1639701501862; 
 Thu, 16 Dec 2021 16:38:21 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:21 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 24/37] drm/hyperv: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:39 +0100
Message-Id: <20211217003752.3946210-25-javierm@redhat.com>
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
Cc: Deepak Rawat <drawat.floss@gmail.com>,
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

 drivers/gpu/drm/hyperv/hyperv_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
index 00e53de4812b..4a8941fa0815 100644
--- a/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
+++ b/drivers/gpu/drm/hyperv/hyperv_drm_drv.c
@@ -305,6 +305,9 @@ static int __init hyperv_init(void)
 {
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ret = pci_register_driver(&hyperv_pci_driver);
 	if (ret != 0)
 		return ret;
-- 
2.33.1

