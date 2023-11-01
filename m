Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB71A7DE538
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 18:20:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16DE610E141;
	Wed,  1 Nov 2023 17:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E6710E032
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Nov 2023 17:20:25 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-9c773ac9b15so4057066b.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Nov 2023 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698859223; x=1699464023; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MES5GqV7TrvEk7NAdheCC8mL6C1jpFNBBuLO0wdyWF0=;
 b=JYgUTe3kIaqPIieQQC5rk3RW+qvX8H+eYrAaaQR2BGxb5+rUzVhb+657KKU27nGqNj
 EMEMpR4xD88xa+uAray56nv8qL+eh5J3N4LHgfTwolTLhnJJ3QuK5WybVJR1Ji1dQkAR
 uAPP7QhkIgxBi6rHMx/4lB3enQ57VnnFasDPu5JBKkmD/SQLBxKXDPDe443sQZ7Vp61f
 cdn7VysZ6dSGuTIB8IDaNQirSDUrZ+CusKDMIbyTuM35O3/rPCkNU6UyhYQjuO67mFep
 wwGsgX91SihySDsjsbqKBiVbrOKYtwqnuESizQfvi/gfYuJ0l928iobOonhyUycp4KVS
 Hxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698859223; x=1699464023;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MES5GqV7TrvEk7NAdheCC8mL6C1jpFNBBuLO0wdyWF0=;
 b=LsWtX0zG9OlwLeWTXYOPIvRgiZpiX7KUz5bjJUXkr7MyOayxt1BeMBAVxN/MWlekYz
 9QiW2OQ3Sj3ChkfYhUk/fGidhx+A4ZPI7QDeI9QiHx+tEF5X4YfYfbVhqSfFx+Tpsual
 3JwbY8RtuxAPxx4bFEzdjUEUumThRCvGSUerB7GNA73eNt2IhjovSTQDO2Oq8adwIVzo
 3CDG2ev8wvIrp+LuHBxyELuizpTlilEbdwITwaqvNawSyr0+4Rst9IMB5X/9kwpHrZtW
 /mpCvMZonRnWGZuL53bV+aSBQXh9OCZV/1G89b/J8wN9iVBr4Qkzp8nCIbiTorx4Mzih
 nr8Q==
X-Gm-Message-State: AOJu0YxbmQVLIXjlCMrtdBeeShOS0S9iY9RDmeAMp8ht1XrGDoIZVO3i
 KhJgQTUR/FsavdVKRTU621Y=
X-Google-Smtp-Source: AGHT+IGz0MS81PMDRbPIhLnqVUjvRxWV5C5P9/qd8vePmVYHlptWcpeqp+orYnQX/HZMMyiyB1u7hw==
X-Received: by 2002:a17:906:fe45:b0:9ad:e298:a5d with SMTP id
 wz5-20020a170906fe4500b009ade2980a5dmr3275899ejb.19.1698859223483; 
 Wed, 01 Nov 2023 10:20:23 -0700 (PDT)
Received: from localhost
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 t24-20020a170906065800b009b2b47cd757sm167671ejb.9.2023.11.01.10.20.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 10:20:22 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v2 1/2] fbdev/simplefb: Support memory-region property
Date: Wed,  1 Nov 2023 18:20:16 +0100
Message-ID: <20231101172017.3872242-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231101172017.3872242-1-thierry.reding@gmail.com>
References: <20231101172017.3872242-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Robert Foss <rfoss@kernel.org>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The simple-framebuffer bindings specify that the "memory-region"
property can be used as an alternative to the "reg" property to define
the framebuffer memory used by the display hardware. Implement support
for this in the simplefb driver.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/video/fbdev/simplefb.c | 35 +++++++++++++++++++++++++++++-----
 1 file changed, 30 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/simplefb.c b/drivers/video/fbdev/simplefb.c
index 62f99f6fccd3..18025f34fde7 100644
--- a/drivers/video/fbdev/simplefb.c
+++ b/drivers/video/fbdev/simplefb.c
@@ -21,6 +21,7 @@
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_address.h>
 #include <linux/of_clk.h>
 #include <linux/of_platform.h>
 #include <linux/parser.h>
@@ -121,12 +122,13 @@ struct simplefb_params {
 	u32 height;
 	u32 stride;
 	struct simplefb_format *format;
+	struct resource memory;
 };
 
 static int simplefb_parse_dt(struct platform_device *pdev,
 			   struct simplefb_params *params)
 {
-	struct device_node *np = pdev->dev.of_node;
+	struct device_node *np = pdev->dev.of_node, *mem;
 	int ret;
 	const char *format;
 	int i;
@@ -166,6 +168,23 @@ static int simplefb_parse_dt(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	mem = of_parse_phandle(np, "memory-region", 0);
+	if (mem) {
+		ret = of_address_to_resource(mem, 0, &params->memory);
+		if (ret < 0) {
+			dev_err(&pdev->dev, "failed to parse memory-region\n");
+			of_node_put(mem);
+			return ret;
+		}
+
+		if (of_property_present(np, "reg"))
+			dev_warn(&pdev->dev, "preferring \"memory-region\" over \"reg\" property\n");
+
+		of_node_put(mem);
+	} else {
+		memset(&params->memory, 0, sizeof(params->memory));
+	}
+
 	return 0;
 }
 
@@ -193,6 +212,8 @@ static int simplefb_parse_pd(struct platform_device *pdev,
 		return -EINVAL;
 	}
 
+	memset(&params->memory, 0, sizeof(params->memory));
+
 	return 0;
 }
 
@@ -431,10 +452,14 @@ static int simplefb_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(&pdev->dev, "No memory resource\n");
-		return -EINVAL;
+	if (params.memory.start == 0 && params.memory.end == 0) {
+		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		if (!res) {
+			dev_err(&pdev->dev, "No memory resource\n");
+			return -EINVAL;
+		}
+	} else {
+		res = &params.memory;
 	}
 
 	mem = request_mem_region(res->start, resource_size(res), "simplefb");
-- 
2.42.0

