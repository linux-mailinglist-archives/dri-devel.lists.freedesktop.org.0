Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 913374781B3
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D9FF10E2CD;
	Fri, 17 Dec 2021 00:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D49D10E245
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xe2qqsqY1ZDRJ/iB0UyKPDWNzmIrG10ufhDSRl4JpQE=;
 b=HJ0NpUaLpq6Mr1zVtN2/5Ap+eHGZU7RDS743tMg3m1s7oo6IUTZdZ0VIP/fur2Tus0Q2Hl
 Kx+UpMqx4d45dn9xPdvg5Uhaj4er907o7O+WrpF3Q+chrVdLvZG+GYYT8QyMS3hiPG6lmD
 4REzNEULq5wekLuxb2Ijc5w55GNFWus=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-UrS0RBz9Mp6mv2VgPmpxJQ-1; Thu, 16 Dec 2021 19:38:31 -0500
X-MC-Unique: UrS0RBz9Mp6mv2VgPmpxJQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 ay17-20020a05600c1e1100b0033f27b76819so390007wmb.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xe2qqsqY1ZDRJ/iB0UyKPDWNzmIrG10ufhDSRl4JpQE=;
 b=wK03ajOy+IZcpLcMacu5etBva7d1j3hmd0oPRONtNV6/FXTavMLrtlw8vtGHohBe1o
 gIN1QnW/CywoiFfLWWjNCZVfexKXUfjMKO7xEOKcsNH5ouApdsYi6q8g7vu1qhojk4yP
 /AF26O+pWCc/G5HBssg/0gYi+cOLLLVGUGk0HXfl4yowSDVnjxlWJraCBuRahIrZd1Ok
 P6oJakmiVV4B5t3lD+2WGkCGJDKkDOw1AJRuhd+d4ZBHWln/IDsnTsEaBhBzNUyGvw7v
 X2CvEyK3ZT+YhoPOPBUA8BJ5g+dGHkwwGDXtiGP/BDtVD1SRSkej3ZHpq1MS2wUFreak
 pRzQ==
X-Gm-Message-State: AOAM53173CJ/T7XcysM+HDL7zljNM53sy7UtjSa/lOBCTgkpPDpAV8dj
 Y5iT5Rh2y7LYtDkUBRgd4q6rHQL2VoYHe1g9+ZzWEV5/GZFnkVYBHkDZ4PA422pf7SW5GWg7zys
 k9a2UuGFrcDXMsYpo9bW/IAzy0tJZ
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr399271wrq.176.1639701510043;
 Thu, 16 Dec 2021 16:38:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzGrQvoqRHrC7aR+ydwAfgOe/UZRHJ4+qDtY7BSAxnq7B8kg7+cb55gpicV4DAOi/vzOzzUxg==
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr399266wrq.176.1639701509861;
 Thu, 16 Dec 2021 16:38:29 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 33/37] drm/sprd: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:48 +0100
Message-Id: <20211217003752.3946210-34-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/sprd/sprd_drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/sprd/sprd_drm.c b/drivers/gpu/drm/sprd/sprd_drm.c
index a077e2d4d721..dd7e3de780f3 100644
--- a/drivers/gpu/drm/sprd/sprd_drm.c
+++ b/drivers/gpu/drm/sprd/sprd_drm.c
@@ -186,6 +186,9 @@ static struct platform_driver *sprd_drm_drivers[]  = {
 
 static int __init sprd_drm_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	return platform_register_drivers(sprd_drm_drivers,
 					ARRAY_SIZE(sprd_drm_drivers));
 }
-- 
2.33.1

