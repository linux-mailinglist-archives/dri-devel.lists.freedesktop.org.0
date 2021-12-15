Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2083D474FEA
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036CD10E19C;
	Wed, 15 Dec 2021 01:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9414910E160
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530077;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ft2fXSAgvOZV7IJVmAiQYpq+OlEAfY5PyKMyCzSqF+M=;
 b=Mx7sezv+U5Wyn1KrbipZyGtbbjuE9lGzXqqm6bCcn2ukXWrTMpe/eEcFfbjb4R75iMnI73
 aKsoDTMv4zmv7EkOqtvHCx/3THUDQxPxV2io83oa1SqwZVY323MM/hhdx2IErZicJEaU6/
 QdGTatZhxduy4ND9cn14Uk3e208AViI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-150-zjfKUmGIMZa6HnuAOvYXAA-1; Tue, 14 Dec 2021 20:01:14 -0500
X-MC-Unique: zjfKUmGIMZa6HnuAOvYXAA-1
Received: by mail-wr1-f72.google.com with SMTP id
 q17-20020adfcd91000000b0017bcb12ad4fso5375092wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ft2fXSAgvOZV7IJVmAiQYpq+OlEAfY5PyKMyCzSqF+M=;
 b=10vxJscp9yQl/SwbGKBKXOu6GJYL2mk54wfnCEZTQrbQN9Xw2X/LcSoG3SVKvDeFwA
 Y4wIYst8fHhpe/FceTbZc3Maqa1cZJqD0xxZAJ0mL0rNySfLclFyJeo6jJ2oUI6Aodn+
 G7a7y0Rypz+5jzeU+CpqPT53QpF/iVtDL+UHNrLJ78cxfE0DfExrspwsWcEpQtcw9EvB
 dnqA56rb0PxS1vId4pgRmxu3r9p7pKsIY6yi8oI2cY9js6jNdEVLvDqrrqthLeUj4c6c
 n99SNTJ2mk26ejEoTDfvWdmBc3D3goDld2+xLeWpZ4D0BuLrG58g0P4By6i3A4/GEurL
 IDjQ==
X-Gm-Message-State: AOAM531g8pRYpCEhP9TD3Fx/+4Vb7J9BuOJqP158S5Qd/t3V+7O5l1RL
 s7oMy4D8IXd/m+yTHFwVI1Zb7SB2hbjUtI6dP+FmdX7heC0BU+sZtoz5/xIag/Eps1VSrt8cl1b
 SttL4tLz5bvDF1TXxFSZIr+koK980
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr2261186wmj.166.1639530073471; 
 Tue, 14 Dec 2021 17:01:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxPvTXOhrJZdB/gQ5iTFxqHIA8mAQjLVS7EzgHjDkOE9skFP2lDxbVMNReZ0NK+OIXg971fkg==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr2261176wmj.166.1639530073290; 
 Tue, 14 Dec 2021 17:01:13 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 27/60] drm/omap: Add support for the nomodeset kernel parameter
Date: Wed, 15 Dec 2021 01:59:35 +0100
Message-Id: <20211215010008.2545520-28-javierm@redhat.com>
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

 drivers/gpu/drm/omapdrm/omap_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 2720a58ccd90..eaf67b9e5f12 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -727,6 +727,9 @@ static int omapdrm_init(struct omap_drm_private *priv, struct device *dev)
 
 	DBG("%s", dev_name(dev));
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	/* Allocate and initialize the DRM device. */
 	ddev = drm_dev_alloc(&omap_drm_driver, dev);
 	if (IS_ERR(ddev))
-- 
2.33.1

