Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB87E474FE4
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 02:02:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 482D710E1A7;
	Wed, 15 Dec 2021 01:01:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0895A10E128
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 01:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639530068;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=buQa/q4lH2BtifIaLjaqC/HHZXhIkn7s/entEE4V0Lw=;
 b=KnorF4Y7UhqO1kvVD9V/g+2T3EUUzIXJGMIje7+Gzmk4HyLzFVZrvJWDEDYFAvYj9GBX5B
 R75+y5VAlRcDBVU/HdDfkjEKoHxNGbW3INaoY2uUdAb6wu0XgBUC3sRNE7Oz2/Da4nUavR
 /bJ6YvsFDfJdahofrUlqwjaxU0BWmnw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-395-MIU6bmH0PdilkvXvdeQ3bQ-1; Tue, 14 Dec 2021 20:01:06 -0500
X-MC-Unique: MIU6bmH0PdilkvXvdeQ3bQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 d3-20020adfa343000000b0018ed6dd4629so5378674wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Dec 2021 17:01:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=buQa/q4lH2BtifIaLjaqC/HHZXhIkn7s/entEE4V0Lw=;
 b=gZp5qNYapt5YMOCK1HjIE1aSOWSWxbozPWfzME4a7rAllDbG6gJLFe1TjQx26C+u1V
 Tqbm+z03psdVGp8ukDySatO/mCS2+gc7hpS6mWnS9Ykn4xauLrtMJEEsx1l79R8/64ZG
 0hJN079dqSHKBEgx60wt8npYFDa5gwiWoDCekCKmrpNJ21BDy6oX/X6hVjZKX4tkJqYH
 rs6ZEY7Nr18QAelziSONYcvs/FFZeIfTEiLEOga0Ly+/zYLpURlcgImDlPCeQt7L+ZUX
 LZtILk6SBs3ZiQK4xE4O2s4bkWHOzp1nat3iYOwFQOvARCK0y5X8rz3eDTbGE/lTb0GD
 uwPQ==
X-Gm-Message-State: AOAM532OPVY33eos2G+CxC5hcoNEkgEJfhby3iaiCkzp4TmKmUlThrKP
 0vdOeqj2jqEbUoFGjjX9hYCAYQtc7jUxRm9ZOUiQ/+9JbQQUotXxVLpGipB1F7RRJ4ksP13yF4w
 WJCmRm7hCWA3pOE6yPT84520JS5qR
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr2197908wrd.114.1639530065653; 
 Tue, 14 Dec 2021 17:01:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxjnCCBCYToqRjdRNxAmerjAQhtI/o7UoTXtHCb9XWsRZ8oOku/Gp1bPO/ee31R4W2GQgac+A==
X-Received: by 2002:adf:d1c2:: with SMTP id b2mr2197894wrd.114.1639530065497; 
 Tue, 14 Dec 2021 17:01:05 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id o64sm334543wme.28.2021.12.14.17.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Dec 2021 17:01:05 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 18/60] drm/ingenic: Add support for the nomodeset kernel
 parameter
Date: Wed, 15 Dec 2021 01:59:26 +0100
Message-Id: <20211215010008.2545520-19-javierm@redhat.com>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Javier Martinez Canillas <javierm@redhat.com>
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

 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index b4943a56be09..8748cc5d2069 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1487,6 +1487,9 @@ static int ingenic_drm_init(void)
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

