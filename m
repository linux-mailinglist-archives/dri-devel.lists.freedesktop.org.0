Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCC18258FC
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 18:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08BD510E648;
	Fri,  5 Jan 2024 17:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 190DE10E647
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 17:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704475396;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xBgR6EF/EirqUkTInXMLhcQ/iDbvWyd/X1PfgAKAIyE=;
 b=E7Q2h+cL5f8y7zwJ918pDc/3dv927i86dkEE+njEVnKb2tR3Vd8lvdYtIrFuyJXESX/Z/c
 cGnMVybqlVgAkr9+dhJDjfwENThCjGOpx+dpE7rkhDrkHaT1GW+G3npIFvC3SDqUm5vfHp
 Y2w+lOXz/uo4HZDFuPUPCqSq+90x5Oc=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-fCpbV6nEPz2hlQANTlkOwg-1; Fri, 05 Jan 2024 12:23:15 -0500
X-MC-Unique: fCpbV6nEPz2hlQANTlkOwg-1
Received: by mail-vs1-f70.google.com with SMTP id
 ada2fe7eead31-4670ca688easo169586137.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Jan 2024 09:23:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704475394; x=1705080194;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xBgR6EF/EirqUkTInXMLhcQ/iDbvWyd/X1PfgAKAIyE=;
 b=byCwY26F2rXt/djxbcRsPho8zTYxZ4e+1yglRoA5PNRpPQRk2vAIDwu1QXTyvZqZ0/
 FjJRQZYAVD5WOuWlZKX49McOyFg+PNLlMzc4xq7HvRh12SLmoXGVsxXJDUADUSIPlbYS
 zNyhTWktqMkZoHB5GuA6wvH87aDIOmERZN2CBF+3Wy3U/SDDo5L4up6fU1oDRtNUeP5c
 sitOqf1GttDSw4zFeZ6I7ij/P/dbbR5/i+YiWo0krPCY5Zh2lZtamHztqWo66tKfrRXv
 RXLzP9ul3kYhOQ7jBBb4B61LczZBR0XElAqciuZXzFH42sqEc1U5tky6dgNhnhFPF7f7
 mdBg==
X-Gm-Message-State: AOJu0YztgI1sxkPU2+sKcuD4AJdDrR2vjWAWHdvviIAZW2QWHF1ZkWx2
 JH3eZ588oZRBjCKzST/JMI0z8G7J6Wcsz5U1otcaXjuf62idLVFOcMbWm9Icbp5cciq0wDdXl5r
 IV9d2ml7bV4Y5YhKzN3ylk9hY6NtSCenpDbCq
X-Received: by 2002:a67:ecda:0:b0:467:55c5:588 with SMTP id
 i26-20020a67ecda000000b0046755c50588mr4120291vsp.3.1704475394637; 
 Fri, 05 Jan 2024 09:23:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGTkGeaWdrkvk9vkGZOM8wRaOT8a6juJhCYrGyYaDRBNcd8dZEL/Cbb4G38NHhLuk+2Ph/AUQ==
X-Received: by 2002:a67:ecda:0:b0:467:55c5:588 with SMTP id
 i26-20020a67ecda000000b0046755c50588mr4120262vsp.3.1704475394262; 
 Fri, 05 Jan 2024 09:23:14 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32d1:a900:227b:d2ff:fe26:2a7a])
 by smtp.gmail.com with ESMTPSA id
 t22-20020ac865d6000000b004282c862fccsm884750qto.57.2024.01.05.09.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jan 2024 09:23:13 -0800 (PST)
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
Subject: [PATCH 1/2] platform_device: add devres function region-reqs
Date: Fri,  5 Jan 2024 18:22:18 +0100
Message-ID: <20240105172218.42457-3-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105172218.42457-2-pstanner@redhat.com>
References: <20240105172218.42457-2-pstanner@redhat.com>
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

Add the function devm_platform_get_resource()

Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/base/platform.c         | 37 +++++++++++++++++++++++++++++++++
 include/linux/platform_device.h |  2 ++
 2 files changed, 39 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 10c577963418..243b9ec54d04 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -82,6 +82,43 @@ struct resource *platform_get_mem_or_io(struct platform_device *dev,
 }
 EXPORT_SYMBOL_GPL(platform_get_mem_or_io);
 
+/**
+ * devm_platform_get_and_resource - get and request a resource
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
+struct resource *devm_platform_get_resource(struct platform_device *pdev,
+		unsigned int type, unsigned int num, const char *name)
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
+EXPORT_SYMBOL_GPL(devm_platform_get_resource);
+
 #ifdef CONFIG_HAS_IOMEM
 /**
  * devm_platform_get_and_ioremap_resource - call devm_ioremap_resource() for a
diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 7a41c72c1959..68e2857521f4 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -59,6 +59,8 @@ extern struct resource *platform_get_resource(struct platform_device *,
 					      unsigned int, unsigned int);
 extern struct resource *platform_get_mem_or_io(struct platform_device *,
 					       unsigned int);
+extern struct resource *devm_platform_get_resource(struct platform_device *pdev,
+		unsigned int type, unsigned int num, const char *name);
 
 extern struct device *
 platform_find_device_by_driver(struct device *start,
-- 
2.43.0

