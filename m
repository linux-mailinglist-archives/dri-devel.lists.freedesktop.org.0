Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC83478198
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D56910E2AE;
	Fri, 17 Dec 2021 00:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C70010E243
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2sBzpk2fsKwHpZn+T2FBimQdU3OJP1/6a//W+uFghJ4=;
 b=LqPsIwQ3ZjnyVaei5UKgyMg5PyxIkUH9/DFxCGYizbfTC1Mch1Fsemybj+kg4sHeqzqCMt
 AUFdHJRxdxdg8FJFVGxy1pZw83MbsKlFdP94RyMMLhtmCe8NU2ool+fAIe3Wp+M63k3Jjx
 l28ZtEdmT/RWFIsFi2yit90nsfUuNwo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-193-Yj8PnWEzNxeDkiWys4ft8A-1; Thu, 16 Dec 2021 19:38:25 -0500
X-MC-Unique: Yj8PnWEzNxeDkiWys4ft8A-1
Received: by mail-wm1-f70.google.com with SMTP id
 l34-20020a05600c1d2200b00344d34754e4so2071619wms.7
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2sBzpk2fsKwHpZn+T2FBimQdU3OJP1/6a//W+uFghJ4=;
 b=HED546jHS6jCbG6m+PsNh0JzGuoZHU+Baar15z+vhIn7+NcD2JWNGKkSR1QI5a5cNo
 Ul7UtFjD1R+nToAwVF5QOFNhFqke0a47fR7RjyJDoTwF2LYW7eFQjxSzdHBORMlVrrHJ
 GW+qyZEQLnmT3zib34MbTWvQzASQIsh425+vTVCM4NfYH0JbqlxTVmoGgNqhUcMAVzf3
 H40DvOJ9e2xMvpvmIBXlvituAc7Mpr/CerhOhHAiZ6M4Qa8noNv4BGR8tIHDYQkYLcJN
 4uoL1E4kE18JETeSGS0IBQ6reGc4B+FfDtx4pvqRXuaFgZyHscbNc5tq4xGpbykphcf4
 UpcA==
X-Gm-Message-State: AOAM5316c5HUKR70wEoR7HPawb5Mghe9cAI7FudTUn5pcA7q8rWU4YiZ
 D6w5c4P5FeBYJME/aFhllgaWpJcN258d2dc1xQwDqmJW3FTCpZjOQ5ytPvA5yEQTgTDzyfx0A8c
 /puGFxsleWQFl4yp2jVNjoZjPDK0w
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr346886wmq.195.1639701503804; 
 Thu, 16 Dec 2021 16:38:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwRsau1I8cEnOg7ZqXrQs2zfayzOf7wmlzMPCpNNKy5x2CNdg7fDpz7eQOKnlfL+aWa2xn22A==
X-Received: by 2002:a05:600c:4e91:: with SMTP id
 f17mr346876wmq.195.1639701503621; 
 Thu, 16 Dec 2021 16:38:23 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:23 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 26/37] drm/ingenic: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:41 +0100
Message-Id: <20211217003752.3946210-27-javierm@redhat.com>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
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

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 542c4af70661..7f10d6eed549 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1543,6 +1543,9 @@ static int ingenic_drm_init(void)
 {
 	int err;
 
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
 	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
 		err = platform_driver_register(ingenic_ipu_driver_ptr);
 		if (err)
-- 
2.33.1

