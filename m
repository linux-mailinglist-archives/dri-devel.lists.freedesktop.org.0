Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3947818E
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 01:38:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D34AE10E2CF;
	Fri, 17 Dec 2021 00:38:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5AF510E216
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Dec 2021 00:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639701509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ugd+51eNvxC0ydxh+YebU1HBCy2BdAa3vMMEqbj60C4=;
 b=DgBYDazsZgu9yM/V/B+Cya3/RLc+SioRJnl04zt2kUgcDX3zGSdJs/6tI0sC1dNjR0BGau
 du2sh9OhF+pgl+ORUyMzUNX8eyznPIdMjUTgdTAONDIARw3P3Zm6LHoW+HCXZolMEIMAIG
 CxCbL/gTk3qtJfSEve4MvxcKw6w2dng=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-248-F11u0V5yOU65zKXbjpSoqQ-1; Thu, 16 Dec 2021 19:38:28 -0500
X-MC-Unique: F11u0V5yOU65zKXbjpSoqQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 p15-20020adfaa0f000000b001a240b45c1fso146635wrd.4
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 16:38:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ugd+51eNvxC0ydxh+YebU1HBCy2BdAa3vMMEqbj60C4=;
 b=n+o+4SQJTvSZcatVVqCKkWJj0uQyqjQ7W4NkkDJbht9E2czAXr9wdlJLEAa8d6psWP
 6e1tx0ByDMI9Wa9AfdbtRAstva4qkjFJfVU8q1Q3T4JygdJ/ESiySLjYHlNx9rRyrx1X
 HLiS3j1+5yHfEr9TuR37REL1Lg+RVfJRwqBAEb2rF+BN6vfFVbKOJXl8ZT2GpJQh3Tvu
 QyPwfXuLl+aLYLrJtVBLvCv27h9AzYW2+oIam3yrQaFwlxUJ4EWtz4EmoQ2OUKokTImc
 ONqybPgo0IJsvWGDYmKVJ2JfRJsGZABMk5AZGwn0epZD2MTIB4v6d3bqlYsjomKvOnU8
 q9AA==
X-Gm-Message-State: AOAM530rCq2LdkT5rLSPhA7G4viHLFmnbcq4cSxOiXtMITxe9bdtkbI/
 o1Xqb65vhwmBWsZzX1vpkogfcEBR8E76T2wStd9G5Aj+doDp//4hUXon/OSkwkK2IDQMTXofXXo
 0eNbLeMgZtY29b00cbBCEBjExx6SV
X-Received: by 2002:a05:600c:253:: with SMTP id
 19mr7501442wmj.179.1639701507452; 
 Thu, 16 Dec 2021 16:38:27 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyaCwfJ1i3EmC7S5+5ejEYmoi30WtsMES0GQaL98ew1O0+BZXpFHuoy2ECOZSInnfTcE9rjGQ==
X-Received: by 2002:a05:600c:253:: with SMTP id
 19mr7501434wmj.179.1639701507277; 
 Thu, 16 Dec 2021 16:38:27 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id bg12sm7368433wmb.5.2021.12.16.16.38.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 16:38:27 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 30/37] drm/omap: Add support for the nomodeset kernel
 parameter
Date: Fri, 17 Dec 2021 01:37:45 +0100
Message-Id: <20211217003752.3946210-31-javierm@redhat.com>
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
 Tomi Valkeinen <tomba@kernel.org>
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

