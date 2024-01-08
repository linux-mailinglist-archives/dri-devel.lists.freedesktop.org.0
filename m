Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC5A826A90
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 10:21:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AB4B8825B;
	Mon,  8 Jan 2024 09:21:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94A910E20F
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704705659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arbdXlZxmXJOFEKJF2R1zNrEF3q6fd9QYRmRT41BVKs=;
 b=ZaAh1UBpZYOIGe4CHgoR2Dr+xv24IpLV+01uQL52V6YjQgLJV985r1x3U/eJ7D4LnpDJFe
 8pX0XeIA/3R7YdKGGaQqPI0P1VpAW6OtX7hefqNQWNnkos9hVOUX3l+cArJZmVq76kqW9h
 HXMY57PJ43kz+2IMwJr4vYSIHr+vVjo=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-457-Edbyen5zMXWOHpjmix8F7A-1; Mon, 08 Jan 2024 04:20:55 -0500
X-MC-Unique: Edbyen5zMXWOHpjmix8F7A-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7831a20711dso23478785a.0
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 01:20:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704705655; x=1705310455;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=arbdXlZxmXJOFEKJF2R1zNrEF3q6fd9QYRmRT41BVKs=;
 b=QXaD4azsSc0a+0N126TIVij/PPjRGrcWcZNCI9QB0oL3wmDQL5gpO4LeLc36i4xWY7
 V657GQWCubdvFff9quPchI4vB/isSrwF8iqCAJci7uLGidG+0TpSyhU/m+8SJBcZRbd+
 jN48ol4PAO4IL+F3Kqio8WKN9Cd6mSNFh0+IAsq/J4Ui7CL1v4+AAdIJJfD4SNj5CMhR
 E+/Ufy5fDUWTkgnvVJq1WGQb7L0B7VcanizzC/bCpngqzcxdUogyBxNEhkmi9iCZe+UH
 OUbcAJyqTVSdsT2c4sla3G5bTrtX+GN8q1VUN1T/gKijxuFN/Ej1hQCIRCC9jgXNtjnx
 HTBw==
X-Gm-Message-State: AOJu0Yz3se31dw9Rjlsyb/5+nfNGY4zrbAbALTRwxBq9pQpEBPDHogBI
 y5cdIbP875VLl5qmJAdQdSBy5hzDtgytxSdONBP2jBLOok7rBGerXnTU3ULkiVL4b3D8mVOI6BH
 xdlBb739c0d7o1BNxoAzHV9ZBnH9KpoVJRhCO
X-Received: by 2002:a05:6214:19c5:b0:67f:4c05:4d34 with SMTP id
 j5-20020a05621419c500b0067f4c054d34mr6990911qvc.5.1704705655234; 
 Mon, 08 Jan 2024 01:20:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnK+XpKlzV2pJwpxp9WnHxnhGBrqDUDY4SuSe10hNQMzlz0sxl/7oEnH6B+hqyoG0C8qKDAg==
X-Received: by 2002:a05:6214:19c5:b0:67f:4c05:4d34 with SMTP id
 j5-20020a05621419c500b0067f4c054d34mr6990895qvc.5.1704705654917; 
 Mon, 08 Jan 2024 01:20:54 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.muc.redhat.com
 (nat-pool-muc-t.redhat.com. [149.14.88.26])
 by smtp.gmail.com with ESMTPSA id
 dm4-20020ad44e24000000b00680613267d5sm2732554qvb.115.2024.01.08.01.20.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 01:20:54 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>,
 David Gow <davidgow@google.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Subject: [PATCH v2 1/2] platform_device: add devres function region-reqs
Date: Mon,  8 Jan 2024 10:20:42 +0100
Message-ID: <20240108092042.16949-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240108092042.16949-2-pstanner@redhat.com>
References: <20240108092042.16949-2-pstanner@redhat.com>
MIME-Version: 1.0
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Philipp Stanner <pstanner@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some drivers want to use (request) a region exclusively but nevertheless
create several mappings within that region.

Currently, there is no managed devres function to request a region
without mapping it.

Add the function devm_platform_get_resource().

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/base/platform.c         | 38 +++++++++++++++++++++++++++++++++
 include/linux/platform_device.h |  3 +++
 2 files changed, 41 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 10c577963418..7b29e6da31ae 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -82,6 +82,44 @@ struct resource *platform_get_mem_or_io(struct platform_device *dev,
 }
 EXPORT_SYMBOL_GPL(platform_get_mem_or_io);
 
+/**
+ * devm_platform_get_and_request_resource - get and request a resource
+ *
+ * @pdev: the platform device to get the resource from
+ * @type: resource type (either IORESOURCE_MEM or IORESOURCE_IO)
+ * @num: resource index
+ * @name: name to be associated with the request
+ *
+ * Return: a pointer to the resource on success, an ERR_PTR on failure.
+ *
+ * Gets a resource and requests it. Use this instead of
+ * devm_platform_ioremap_resource() only if you have to create several single
+ * mappings with devm_ioremap().
+ */
+struct resource *devm_platform_get_and_request_resource(
+		struct platform_device *pdev, unsigned int type,
+		unsigned int num, const char *name)
+{
+	struct resource *res;
+
+	res = platform_get_resource(pdev, type, num);
+	if (!res)
+		return ERR_PTR(-EINVAL);
+
+	if (type & IORESOURCE_MEM)
+		res = devm_request_mem_region(&pdev->dev, res->start, res->end, name);
+	else if (type & IORESOURCE_IO)
+		res = devm_request_region(&pdev->dev, res->start, res->end, name);
+	else
+		return ERR_PTR(-EINVAL);
+
+	if (!res)
+		return ERR_PTR(-EBUSY);
+
+	return res;
+}
+EXPORT_SYMBOL_GPL(devm_platform_get_and_request_resource);
+
 #ifdef CONFIG_HAS_IOMEM
 /**
  * devm_platform_get_and_ioremap_resource - call devm_ioremap_resource() for a
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 7a41c72c1959..44e4ba930d5f 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -59,6 +59,9 @@ extern struct resource *platform_get_resource(struct platform_device *,
 					      unsigned int, unsigned int);
 extern struct resource *platform_get_mem_or_io(struct platform_device *,
 					       unsigned int);
+extern struct resource *devm_platform_get_and_request_resource(
+		struct platform_device *pdev, unsigned int type,
+		unsigned int num, const char *name);
 
 extern struct device *
 platform_find_device_by_driver(struct device *start,
-- 
2.43.0

