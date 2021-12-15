Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D71C474FDF
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE36910E163;
	Wed, 15 Dec 2021 01:01:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0991389BF1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530090;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DjrFVfXcl13gsqHz0jlu5PwI7gXEaTj3y59F9LJzTf4=;
 b=Mw03Wfec9IqaODXJErP9EhDVM5GUy5SI8U0lfUN3pqnvIlegkuUeMsl3wN5nYd8bff5V3w
 Y7/Aj8l7AIekV6AM4JxYGLO+zHL9FBmvQ0NLBEFKCiCs4dkVk6TRgCU6rgc0S6Qu2M8dBf
 Ysv9zIz/MaTW8gpSOfUCc/V2QGl2VsU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-113-rTtXnJqVM5eKLpDGtlHXjw-1; Tue, 14 Dec 2021 20:01:29 -0500
X-MC-Unique: rTtXnJqVM5eKLpDGtlHXjw-1
Received: by mail-wr1-f71.google.com with SMTP id
 h7-20020adfaa87000000b001885269a937so5416501wrc.17
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DjrFVfXcl13gsqHz0jlu5PwI7gXEaTj3y59F9LJzTf4=;
 b=QO1iGMkbzSSlMQK8YK68bAQlPUeH73sbkxufKRadTs1F8ROLXciu55krkHCXlEEglF
 4PjiXterSKlxSk14Z6wytTL8slpIL5UilPRZNA7TA1tICtZOZQf1s5VtXGu+lR0RAEZ5
 Ix7yqMqJUXnhtGMJitP4C5RPVaEGwDjk02blNn9NRi+DTof+QbRHIUqA3Px+hO482fUC
 jilI9Kx3rQ2S8WIl4+71t87qYksSUbe0CKnLcgbra8StP71Ge3lyCuhn4AfPVjPwzMKK
 5/bYuZABecGDAd71Or1ms97fm2/a0hISyrd+jw8EAYd49hv4puye1iU5WyaFzZkvtxq4
 FIxA==
X-Gm-Message-State: AOAM531gU9Qb+9Wy6j/zSeVlDoXXcCOXORfh191xllUcYOz39dVx8aDi
 7E5mmxyLd+HZ29U4VhB1BI33pZD+WfyMgcU9QUqcisgydMoueYWlwg6cVV7zoIjshlgoey7lctr
 cvmNqwYHNLrb0MgnV1M33FZNwdfp7
X-Received: by 2002:a05:600c:19cc:: with SMTP id
 u12mr2469220wmq.24.1639530087875; 
 Tue, 14 Dec 2021 17:01:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVhwmKE9m9aIxWzeCddXz7W3+Vdj/kFC/plUVVUcsEZaD3joZtzHOhk4gtl6MIZWnvxHMnRQ==
X-Received: by 2002:a05:600c:19cc:: with SMTP id
 u12mr2469205wmq.24.1639530087658; 
 Tue, 14 Dec 2021 17:01:27 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 43/60] drm/tidss: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:51 +0100
Message-Id: <20211215010008.2545520-44-javierm@redhat.com>
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
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Tomi Valkeinen <tomba@kernel.org>
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

 drivers/gpu/drm/tidss/tidss_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
index 7c784e90e40e..5a6ff5af6d26 100644
--- a/drivers/gpu/drm/tidss/tidss_drv.c
+++ b/drivers/gpu/drm/tidss/tidss_drv.c
@@ -124,6 +124,9 @@ static int tidss_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "%s\n", __func__);
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	tidss = devm_drm_dev_alloc(&pdev->dev, &tidss_driver,
 				   struct tidss_device, ddev);
 	if (IS_ERR(tidss))
-- 
2.33.1

