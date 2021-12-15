Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E69D1474FE5
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABDCE10E1B6;
	Wed, 15 Dec 2021 01:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B36210E191
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5qQcI/Amlwg4a9ar7DdVwzPkc7DjrNDla/ZRcRYeiA=;
 b=CpqHASmd5uEyDopKLyASil+rtz/pP2ELUBYSJ3BOpdHAmCWzYHY0qTY1qyhkrlHBezLYwQ
 sPeXaHiNvxeS5Ww1NvcKeVTjD4deIlC8BTZciwisij9qHKKX5sXP1VIm31LJOaS7MSwztT
 TXNTNqDWrHcHcY82w7R7n/DM28IiK8s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-414-0EVnlum3N6avh17L9pRelQ-1; Tue, 14 Dec 2021 20:01:41 -0500
X-MC-Unique: 0EVnlum3N6avh17L9pRelQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 h12-20020adfa4cc000000b001a22dceda69so94648wrb.16
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g5qQcI/Amlwg4a9ar7DdVwzPkc7DjrNDla/ZRcRYeiA=;
 b=W/2oGd+US+bLscs0jzdGy8H67ZUbs892dA5xY1KFDlXtEVEy1D1z7JodRwSGB1Us4O
 mQRCmjoQJiXuMHW7zm4BbgNw9aDejaWKRpbs0yv28PCvUtU9YjZKYsTBYJn/7L/IzPcG
 bwcjZxn673KqNJe3B+RHcrTDNDiQT5ki9tYmArsFjhgda8YbCuu3+fCKQn/UTcgH3Cts
 vLs2t+J4GFhyhTtCgOywy/3Mme1KbNehJhrOkDxR4S3KFufvI/gUZy5XBejmChbQW7RK
 zDnAuvNcDhfvkxvsheOOZlDdUUK3xhmv5rnFcjDPQNdWvRE9mF1HGKiBGv8Gmq9ztlag
 pcFQ==
X-Gm-Message-State: AOAM530rlV7N4YnKSitrG5ZoGNuOMEFN30d0oUShAdWO/ujywu71xThS
 XTjOI47TsD30AiYOmkjy2EXE+s/o1h6TppU4lK+jLzC4vwDXQQR4F9LI9izTn4DCxmO7SL15Zyp
 gJ7z66pL5C5HL1an4zLXVkCGIIa6v
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr2424138wmq.74.1639530100444; 
 Tue, 14 Dec 2021 17:01:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjZ53iWgnqPlE6QmrgnZNvFZDIVV8vQx3xga5emLEBubaer5+ZmoznUGdlBfeRiCEM69QnBA==
X-Received: by 2002:a05:600c:4fc3:: with SMTP id
 o3mr2424129wmq.74.1639530100289; 
 Tue, 14 Dec 2021 17:01:40 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:40 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 59/60] drm/xen: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 02:00:07 +0100
Message-Id: <20211215010008.2545520-60-javierm@redhat.com>
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
Cc: Javier Martinez Canillas <javierm@redhat.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
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

 drivers/gpu/drm/xen/xen_drm_front.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 434064c820e8..20d11ea79e0f 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -495,6 +495,9 @@ static int xen_drm_drv_init(struct xen_drm_front_info *front_info)
 	struct drm_device *drm_dev;
 	int ret;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	DRM_INFO("Creating %s\n", xen_drm_driver.desc);
 
 	drm_info = kzalloc(sizeof(*drm_info), GFP_KERNEL);
-- 
2.33.1

