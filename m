Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD0D474FE2
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D8C310E1A9;
	Wed, 15 Dec 2021 01:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 472CE10E155
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530081;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Dn9hvS/hE+6Q3aeifiJb08PIGBHJHXd+uPexu/tsonU=;
 b=MEeE1H3QMDbOwELmPbFXC3v50XYAeD6cf3VbpmFSz+YRFUDcroiowSiuB5JCDD5EDgs+iJ
 tHbV+IiRGLGctJ7uE+mntJpuxdqZp1dzCFsRV47Oawwm8I/oIKbQPReN1XjnQMOnHi5L3V
 rusj+CKZnfHSLB/2Y3IeEFlVub+uhsk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-662-PaaW1zL6MYKl38cf6ESsMg-1; Tue, 14 Dec 2021 20:01:19 -0500
X-MC-Unique: PaaW1zL6MYKl38cf6ESsMg-1
Received: by mail-wm1-f71.google.com with SMTP id
 j20-20020a05600c1c1400b00343ad0c4c40so1928916wms.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dn9hvS/hE+6Q3aeifiJb08PIGBHJHXd+uPexu/tsonU=;
 b=NdVJ6FvNM6GI3/DQhsTbGRkIj0ljz90vq/JpPTC9fUjhPVsFFtqHtlO39twneRSbAV
 a3QUmP/vEFCQBzn0FBnbKJ+gegNbTParYgZWxYhnJiIuZbHNob1zm1/92VeTdKqEBbvY
 wnfbpEUliCGXO1i0c3anhyP1ETUWGvmnCQQjhLFgjEPpswiMItS60gYOyF37hb+LxXUT
 dmWoKHD3G4q9c2tlynbC1icwFIpMY2YuWIekjMZjAzWxyLDFJl5Gm/IuEbs80IBA/Y0E
 bX305b7ZbVLWcQHs64drn4cKzg2+NYXGbClsf4cXbjS9ZsBh3HZDpZTpEJTCtm9Q8uAM
 3JAA==
X-Gm-Message-State: AOAM531Gc13kQIRYEyQnYCRdKjCi97p3ulrvzG7t0lWxD4F4j1I1R9FV
 L6bz7pXYJeqkpozWrSH6z1zZhWcj+/fk5ATlRNuQ1Sp7Hd/Qjrx21+5uTUOCBBzqYJwdaFQ9SHk
 l2ismqO0DCFfz2JF8th1fHLA0Iedj
X-Received: by 2002:adf:c5d1:: with SMTP id v17mr2041311wrg.571.1639530078165; 
 Tue, 14 Dec 2021 17:01:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycZee8IeEpnSGxw0fK7crCXAu04SYEjusDcgnk8vStLkhcKO3lv7vCppnlF58OqBmYIZJQ0A==
X-Received: by 2002:adf:c5d1:: with SMTP id v17mr2041301wrg.571.1639530078013; 
 Tue, 14 Dec 2021 17:01:18 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:17 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 32/60] drm: rcar-du: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:40 +0100
Message-Id: <20211215010008.2545520-33-javierm@redhat.com>
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
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

 drivers/gpu/drm/rcar-du/rcar_du_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 5612a9e7a905..7b676b2f0f06 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -699,6 +699,9 @@ static struct platform_driver rcar_du_platform_driver = {
 
 static int __init rcar_du_init(void)
 {
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	rcar_du_of_init(rcar_du_of_table);
 
 	return platform_driver_register(&rcar_du_platform_driver);
-- 
2.33.1

