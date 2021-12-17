Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B48478190
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B5AC10E2BD;
	Fri, 17 Dec 2021 00:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5A7F10E243
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MMwC+6iV4pUIscAwY5CUqN9dmmZrwXUE328K64bB1gA=;
 b=SXRevvvZNaR7P2IWv3rMpComTMOeOoVJ+gS13AZgbkrJkaKlntatAMQjyvD7Y+CuSZ7jct
 9RtCYOFgwGvWMCgls7b0cvh6/yiRtVuLGbcxiuikeGmCSGXFX/B8XUT+p8KyfHepnDWbaV
 HFW+o3Lx28U7fpY7LTqs5C2bSJwO9ZA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-Hks2RcUbO9CyiuV3ZnzwRA-1; Thu, 16 Dec 2021 19:38:21 -0500
X-MC-Unique: Hks2RcUbO9CyiuV3ZnzwRA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso144067wrj.12
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MMwC+6iV4pUIscAwY5CUqN9dmmZrwXUE328K64bB1gA=;
 b=8Pz9ZcJh+JXs2R5vMtfqlZ438+doTZUDRtIKe44a4kBx//Ca0NlkW8hr87RhR4q2D2
 jMUHNNayMxM1N+CNmdKI19rHoOBwDFJfm7l3PKIBEexanXX6nexEBt78Xj3QNqokJl3N
 z5jhbvfn/tNxVZgB7na29DnG9snrcv9GUH8Mgwage4MuVLdCeFZiWdpn2IcApz4AytwE
 QR/p1VfoT02Jlu+Xt1BRU7SkeyM9iC5v0smUgrniMGylAYVU6/aelHuwwoO0srl/r5eJ
 qbf4xXB7IBZYmsDyEtgqWUVRIUlipve8ATaXimClp2fYIDLN8TMVaKjtMDg5E7o/NJek
 Ivjg==
X-Gm-Message-State: AOAM531SNyXmPlWeKRBl+6dUU7fnN7vI76RmxZknRcAFvFQdrrexKJs4
 qI/eBENV/twd4nY9pGKLmwSYlVG8GPJw0peR1iGaTR+TbcCvFWdi07oFTPXiY4xdUzdOV3RRcZw
 HZO21ifUF8E8LB6eVp2ewAGXkBtJj
X-Received: by 2002:a1c:a517:: with SMTP id o23mr337559wme.189.1639701500311; 
 Thu, 16 Dec 2021 16:38:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYxHnIt03QQb/BceGXRT0JLzIDcDwt9TqEVsGg9IYIen92gM74vnhF+uC/19itfmumxWnwxQ==
X-Received: by 2002:a1c:a517:: with SMTP id o23mr337549wme.189.1639701500125; 
 Thu, 16 Dec 2021 16:38:20 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:19 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 22/37] drm/exynos: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:37 +0100
Message-Id: <20211217003752.3946210-23-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
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

 drivers/gpu/drm/exynos/exynos_drm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index d8f1cf4d6b69..f9f10413a4f2 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -464,6 +464,9 @@ static int exynos_drm_init(void)
 {
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	ret = exynos_drm_register_devices();
 	if (ret)
 		return ret;
-- 
2.33.1

