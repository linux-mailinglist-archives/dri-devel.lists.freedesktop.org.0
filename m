Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 629EA7F05C1
	for <lists+dri-devel@lfdr.de>; Sun, 19 Nov 2023 12:28:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51BEE10E1DD;
	Sun, 19 Nov 2023 11:28:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3D910E1D2
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 11:28:41 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9e62ab773f1so479662966b.0
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Nov 2023 03:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700393319; x=1700998119; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
 b=EPpuKc1D2JdbVTQhybJ4YlA4G5g+vkCuRqCZu6/gfaBnxImIo0mu/D0CDJ7IwrgNVv
 xZisRXW3tRQ9ueYW+xiXbbxz/QalslRRDmOz2OK9mC9I1KibOaQQs9hNTkiB4Sqxqr0B
 tGo35lvfIzk1NFseAx66MCsmI0RQKomjDWY9n6qvz6iMWGnmhbgr7EEVUrRonlyYJBD7
 EuRtNyj7vopV5RwkuzE0cJgBcQcmwczvQd4I7y3XySHInslkathb5DWH+IbQQdItLe/M
 agnYf610uE5pZhKqOjoDxtT/ahdAgL0rBPmmLoGI9sebPCL/BvigsG8IisTKWEhg7TfE
 0Ivw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700393319; x=1700998119;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=x0UShpfjCPfBIWng5J4/pQaeext1SYGd0ovoJY2VHzk=;
 b=uukvrYV1rujLGDvXBFk/ezJ7AiYVUE9MUB8d99N6dfyt96zQCSIGKRYJA2UEmd9+ZD
 DxEyo+Kk5FID8cCy8NQe7UQtkgfyH9nppdOMaUaxXS6MjisvrIEm4NZrLrC8mS6u8XRq
 yMJcMBVSJzMWBleAMnpiM2O8lxhxfsV0tDNSKweXuwbsbuF4/xSzy3zdeSl84GMOMNGZ
 96EAo5s7cg+i8l+v3ofGEOaGN2QdeRlQtfgyqE7IkJ2k+ljw/GI9FSA1T1Z8ZwY30uZd
 D5lpZTgtGd+weGHhcn76ih1D/WnvDIPNnZc6qlcc8vmjoP7KHPkebTUOi67UiJbGTRgi
 0V8A==
X-Gm-Message-State: AOJu0YxFPjmJPUOuiEBYGB2Upbb0LZ3ORb/qgdJzePRU4g9ZgquoeGGO
 BTmpKuergnlOF6pDgTpdlEo=
X-Google-Smtp-Source: AGHT+IGW8bdZ2RS0eD/PKhlU2KiBuoc9GKfQcR1+tjuS9TfpWDLNx8Ift2fVRfhA8+J2YatXx72CBA==
X-Received: by 2002:a17:907:3f8a:b0:9b8:b683:5837 with SMTP id
 hr10-20020a1709073f8a00b009b8b6835837mr3412002ejc.46.1700393319210; 
 Sun, 19 Nov 2023 03:28:39 -0800 (PST)
Received: from zotac.lan.
 (dynamic-2a01-0c23-bde4-3e00-2223-08ff-fe18-0310.c23.pool.telefonica.de.
 [2a01:c23:bde4:3e00:2223:8ff:fe18:310])
 by smtp.gmail.com with ESMTPSA id
 k22-20020a1709063fd600b009f8af454d0dsm2420378ejj.112.2023.11.19.03.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 03:28:38 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v3 11/20] drivers/gpu/drm/bridge/synopsys/dw-hdmi.c: remove
 I2C_CLASS_DDC support
Date: Sun, 19 Nov 2023 12:28:16 +0100
Message-ID: <20231119112826.5115-12-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231119112826.5115-1-hkallweit1@gmail.com>
References: <20231119112826.5115-1-hkallweit1@gmail.com>
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
Cc: Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-i2c@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

After removal of the legacy EEPROM driver and I2C_CLASS_DDC support in
olpc_dcon there's no i2c client driver left supporting I2C_CLASS_DDC.
Class-based device auto-detection is a legacy mechanism and shouldn't
be used in new code. So we can remove this class completely now.

Preferably this series should be applied via the i2c tree.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |    1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 52d91a0df..aca5bb086 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -515,7 +515,6 @@ static struct i2c_adapter *dw_hdmi_i2c_adapter(struct dw_hdmi *hdmi)
 	init_completion(&i2c->cmp);
 
 	adap = &i2c->adap;
-	adap->class = I2C_CLASS_DDC;
 	adap->owner = THIS_MODULE;
 	adap->dev.parent = hdmi->dev;
 	adap->algo = &dw_hdmi_algorithm;

