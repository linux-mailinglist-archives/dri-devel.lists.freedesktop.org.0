Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC837C5717
	for <lists+dri-devel@lfdr.de>; Wed, 11 Oct 2023 16:38:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40C210E4F7;
	Wed, 11 Oct 2023 14:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5AC510E4E9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 14:38:13 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso1256827066b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Oct 2023 07:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697035092; x=1697639892; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C0H21NAxHWpVVzgKPMwSiQ6VL6uuihpmAvcOM/Zucss=;
 b=nNEZP50dKy4el8p2mnbfdvznV85CfiTAq+Rf/1dg7ZWB88n5VvMBoagVDFOLuLaAzR
 zpVm2Xz3V7YaxdGNjy039OGBWCtpgF2ESJ7tQlVZeUhZNHcKOhy2sKHX9e/nWrE9FDEt
 o284GudktBVA3eq1N60vWbkF11R/2Rcz4FVBib+3HwaaTyl61ylwQHbSkead3MLiYsIz
 9qK8Sk4stwTvhGIs8dsP93Q5avx92aWr4ynPuPtNt3Uc5lkUprP30+V+r1buqFpavx9I
 sCWngw3M9uH6s3XWYdjBKRCmbuLidqlm7bbHX0GAeT5p3t5bs7y5TwTuy7yxIG0ROwRj
 xQhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697035092; x=1697639892;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C0H21NAxHWpVVzgKPMwSiQ6VL6uuihpmAvcOM/Zucss=;
 b=SXKWetLWLZ1dg5Bo2oQYGje2qa3vh5szF7e3yPcqsBf6Gsqsyet1sGekm5yZTTGlL+
 KWAvLrYB663HBQ4pB8Mg5gHFIpv5pJgThlUtMeasPmHhQnoBQsnlDSyVzWGAmPisSW20
 K8BhlEaX13+iAAwrXU3PiA1/xAfG1hN4ooJabQjaMlRuMfSStEZCqTZokHiJrrVDHnI0
 076lthSez5NOMRnMd9Tb4Q1FNCtBJw8m0BBrrmaGkzTts76gRer1hE86aBNaRxeOAWDg
 EZc2WbiB/DGs76v7pkm6D3FC//NU6JI4agKv9xmRGU7BKn4Z+MwZ0rMRAC6JmSxuuzeF
 YvXg==
X-Gm-Message-State: AOJu0YwpPOxGKh17bS+Gxx5SbzVXfa6+N1eFHlEllJXXPezP0dNhjEBG
 BCK4eHf/kcTiJrgahpZWuBY=
X-Google-Smtp-Source: AGHT+IFkW31k/TJYDnRHJXlJQmJc6ZC0M1NnjX6UKAFzKEHalfSt4SHdlfpvmLIIIw3xese1yVQXGQ==
X-Received: by 2002:a17:906:319a:b0:9a5:9f8d:770 with SMTP id
 26-20020a170906319a00b009a59f8d0770mr19331256ejy.46.1697035091924; 
 Wed, 11 Oct 2023 07:38:11 -0700 (PDT)
Received: from localhost
 (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 n12-20020a170906378c00b0099d45ed589csm9842711ejc.125.2023.10.11.07.38.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 07:38:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH 1/2] fbdev/simplefb: Support memory-region property
Date: Wed, 11 Oct 2023 16:38:08 +0200
Message-ID: <20231011143809.1108034-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231011143809.1108034-1-thierry.reding@gmail.com>
References: <20231011143809.1108034-1-thierry.reding@gmail.com>
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
Cc: linux-fbdev@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The simple-framebuffer bindings specify that the "memory-region"
property can be used as an alternative to the "reg" property to define
the framebuffer memory used by the display hardware. Implement support
for this in the simplefb driver.

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

