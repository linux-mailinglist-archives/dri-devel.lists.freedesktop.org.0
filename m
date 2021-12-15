Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0717474FD4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8078689FD3;
	Wed, 15 Dec 2021 01:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FAA810E155
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a1nXGx5Wd/g7fzmsst6Uux3CzRbuFIIxSi+2V/lXjkE=;
 b=fadmAy+S1XTC9AANW7HmaPKGC6QyWDOd9UTWvMuwed8xeKhnArLH8nB+zWiJy7po3esPKB
 +Isq92gh8oayvZ/X/UUIIctjxlxkXF6x86XgppDdKaQ0XKiSBWB/vivAoisxXIwzmWzDZO
 hUkZ0W5OSLDlDhOt5mSxghKB77coak8=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-263-PvwhU_bYPaSRr-3wBoBuEQ-1; Tue, 14 Dec 2021 20:01:24 -0500
X-MC-Unique: PvwhU_bYPaSRr-3wBoBuEQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso5375285wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=a1nXGx5Wd/g7fzmsst6Uux3CzRbuFIIxSi+2V/lXjkE=;
 b=1/vaHoDjXIDWZTOLhyGEaL+OLLZaxY1SWUOfOz+jV1/5sJmtenD7KdG3TVHQQ4GWuE
 rpj+7IMwwBE3dcysCv1NmYPKHIDnDmNeMPKa5KGxBSawgbeqmlRtQ6nXXSfOBq1VSdrZ
 LzjFSuTJBAp8Hja+VVXjB0kiWvtdGWJwZ/7Wt0pqZH2fJrCORAFP6RSpYRNAtYVZBrEB
 nu0TJlZXzqYjUk/H9GXZjum+V2YJOnw94gyq77vWer7ONhPyrQm7Npd0z+QGTIUZHZ8y
 HdaTeoCecSf//7x9EmIh7xLOD0EBV8s7zaSzVjzAZzy6OzODG4JQ+jVtSTlDzmgIRTPs
 tD2g==
X-Gm-Message-State: AOAM533qt/EDBVIBNxRwt4sGHdCyyghMCQWadP23AhTfWEcWTJ3WqOC2
 rsLA2tLvf+c4Z5aymy2DwyiFSXKsOjht8hN3CoY5qtVb0Ee7JIU5x15atkGMSCkRfdhHpNovWd+
 +y0sd/QicPV4lueU48XtQu7x+TSeZ
X-Received: by 2002:adf:e286:: with SMTP id v6mr2221058wri.565.1639530082856; 
 Tue, 14 Dec 2021 17:01:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx22fYzLE1Ah8GH2QbaO1YPJDRk0tppY9ONA/JiuobDywPJUJXpeRGzz7g6xwBp2l/1xqmXrg==
X-Received: by 2002:adf:e286:: with SMTP id v6mr2221050wri.565.1639530082703; 
 Tue, 14 Dec 2021 17:01:22 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 37/60] drm/sprd: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:45 +0100
Message-Id: <20211215010008.2545520-38-javierm@redhat.com>
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

