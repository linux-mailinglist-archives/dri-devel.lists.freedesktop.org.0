Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD784F8843
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 22:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2745C10EEA3;
	Thu,  7 Apr 2022 20:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5721A10EEA2
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Apr 2022 20:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649361784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x93PCRKwviqgnFctHZ564pBYePcJr5i4ENQzOlQlhIE=;
 b=PLsWol43f4SCLKZMr4irROMYh0B3DJYnBZ4Dnr1sesR9CRGoFEX4QJ2icAkNqoXMaaK8LP
 uYVHelfReixnkUZNZxIuEhjx6DpMQgVE49GUTKSwp4+1Q5/SOIcR6OZMoW3ZA3J1sslryq
 8rJlZCo+u8YGPIu1UFpCM+/wamAfc+A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-sjtnhdyAPXKqE6E8Wb7cxA-1; Thu, 07 Apr 2022 16:03:03 -0400
X-MC-Unique: sjtnhdyAPXKqE6E8Wb7cxA-1
Received: by mail-wm1-f70.google.com with SMTP id
 k39-20020a05600c1ca700b0038e6f5d2f40so1764708wms.6
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Apr 2022 13:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=x93PCRKwviqgnFctHZ564pBYePcJr5i4ENQzOlQlhIE=;
 b=ucqsYcXFafdxtWdemzkZv4p2xBttdmmbIbluUhiUSgtTB7VNcQRYXWoE+ppMlbkfjB
 npdPcFVOoGoMReh3m+pHIfy8W4z4e7/n6nTugBX1hYzwWHSF7sDA64mYXWvofcGwD6Rz
 7sOTvT5djf+h5XPxPxWCeY9cEfIHCDZ9isWULk96tTAjrV00xAcxcwYVHqIuSV2itBoJ
 2XLtdzIFGD9EK+Vcgy66Q6YjPqfSLkkTBQJP34ZcHp20METVArlYqPGsSkeSDUMrSlyp
 EZqnh5IOF1PzJ8nHbUvwl2lIDKK9kmWQoLhK5kfquc2EO2U/IeA5iv5+khgF7vJdJ0pR
 ZofA==
X-Gm-Message-State: AOAM530HrRDE6AuXcFbzaAN7WmdxzKzbhnDEhSJrsoSqjOjgQnEMbngz
 UcgojkzGtWrN+OtuaX8oUo6reGeQkgNgohS67/duSOYlAFvhgULF1QVt3TrWNI79afNbKO7EsCJ
 gyM68HMWhcz13sEpc4yon3FXUtRfg
X-Received: by 2002:a7b:cb46:0:b0:37b:dd79:e1c4 with SMTP id
 v6-20020a7bcb46000000b0037bdd79e1c4mr13618119wmj.39.1649361782231; 
 Thu, 07 Apr 2022 13:03:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzddimnsAmF0jPIGaa3uK+oB4t/RezvERAcP6vteLSMkHFZ1dvuNZDvJ3lkXyuq9wVKp07AKg==
X-Received: by 2002:a7b:cb46:0:b0:37b:dd79:e1c4 with SMTP id
 v6-20020a7bcb46000000b0037bdd79e1c4mr13618110wmj.39.1649361782029; 
 Thu, 07 Apr 2022 13:03:02 -0700 (PDT)
Received: from minerva.home ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 f15-20020a0560001a8f00b002078f74ccd2sm1048712wry.36.2022.04.07.13.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 13:03:01 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] drm/solomon: Add ssd130x-i2c compatible strings without
 an -fb suffix
Date: Thu,  7 Apr 2022 22:02:02 +0200
Message-Id: <20220407200205.28838-4-javierm@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407200205.28838-1-javierm@redhat.com>
References: <20220407200205.28838-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Chen-Yu Tsai <wens@kernel.org>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The current compatible strings for SSD130x I2C controllers contain an -fb
suffix, this seems to indicate that are for a fbdev driver. But the DT is
supposed to describe the hardware and not Linux implementation details.

Let's deprecate those compatible strings and add new ones that don't have
the -fb suffix. The old entries are still kept for backward compatibility.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x-i2c.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x-i2c.c b/drivers/gpu/drm/solomon/ssd130x-i2c.c
index d099b241dd3f..a469679548f8 100644
--- a/drivers/gpu/drm/solomon/ssd130x-i2c.c
+++ b/drivers/gpu/drm/solomon/ssd130x-i2c.c
@@ -91,6 +91,23 @@ static const struct of_device_id ssd130x_of_match[] = {
 		.compatible = "sinowealth,sh1106-i2c",
 		.data = &ssd130x_sh1106_deviceinfo,
 	},
+	{
+		.compatible = "solomon,ssd1305-i2c",
+		.data = &ssd130x_ssd1305_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1306-i2c",
+		.data = &ssd130x_ssd1306_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1307-i2c",
+		.data = &ssd130x_ssd1307_deviceinfo,
+	},
+	{
+		.compatible = "solomon,ssd1309-i2c",
+		.data = &ssd130x_ssd1309_deviceinfo,
+	},
+	/* Deprecated but remain for backward compatibility */
 	{
 		.compatible = "solomon,ssd1305fb-i2c",
 		.data = &ssd130x_ssd1305_deviceinfo,
-- 
2.35.1

