Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EC66CA7969
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:38:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFD710EAE5;
	Fri,  5 Dec 2025 12:38:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RosYcScN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7031610EAE5
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:38:28 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-5945510fd7aso1656401e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 04:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1764938307; x=1765543107; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=om/cMeG15+uH3BDN4RH9PI4d5N4TSJ2+dVbkHS9xaeo=;
 b=RosYcScNJJ3MEmK1IkGy8A6J9PhHfERnZZpWVMUdTQ7/sGirfKWCSkDFnnlrOQu0S1
 b51TIEEepImxf3Ib8Pw5GPTwP6UYDsDtRvID4q4KNIEtGZ84LWpuRXUOjK2w2r0+n+Sd
 yPIBkrij4CU+I+7MHCcJHsd6Ej792zRe+kK8do53VuO9l4WWhDS1yrucesfDy/hP8vEj
 GzWNxeQ5sSR2LjyELvVB7eKJzGA8xjF0cXWUlkX7P+Cpz1SfNbwta38+/tbxCOBp9jXv
 5SkmhEA2+LWqBgdE057VREzIUzYU2bWGBYdKET/0bsxxibMMicXk9d4VtKsDRsAeAINh
 Kb8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764938307; x=1765543107;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=om/cMeG15+uH3BDN4RH9PI4d5N4TSJ2+dVbkHS9xaeo=;
 b=T9t7YdYVo0xxZrMzj+GYzDmutfEqYnLFLnAietsahCIQGIHd7c6yBuTKz82k2NRFXp
 fIOOpnBb+31fjWfkNhbCod36zHhlgXFZ9h9MSFfHTAbMrUTt2FgtC2vxj95P4n/cG2eI
 Qv5xIpB2J3Ig5ITrS+v29Sf/cvorFbj7qzut8l3QIc3+YIZOYQxIFCcygS53J8bXgibY
 X9zTbI2HaEE6m0qydEJZ17N6yUMnSDUzkRMSLykAetZE8DrSJO2B0hd+Hh3i7yKU+Se4
 pu0X27j+w0gBZj436YMl0Z6hWYWtxYlav5cQ0NnE4fBoIxNeIMJnm9MQe+cBzzU42mdg
 U/yA==
X-Gm-Message-State: AOJu0Yzb7T8jpklUr/i1cKNWbHscdcZqFQ3Ad16HjIgH495RabLYsrxj
 N4OQ2wFNqW+blI+5Y7RapLMYCWCaWXPtUQLHjPpQivQfDhqegocQfjWUQPk3p8bqFqLk9dtHV3i
 mC48E
X-Gm-Gg: ASbGnct2AMNYdrZ23qt3Oclawk1T/1qpSbiGvoUN7Pbj0dFDndRbbflTYf2VpVtc+VH
 iEPy3fFa3R03me/pLTQsEfuRgPOr0P2RmfLxIT6jyDqSoyu6XZNaE7R35bzhYRFVvMUxZl8PN7W
 /CDMpUD1SapOJIMJGgwp5r3+WRJcuTdmpTOATG5RkPSdUwYlOop+chCsS4m4EBccPH+FTOX8Dzq
 kZ3+eLv+6zCXU0bRRLwNY8oMPS4U/rTmHyWK7Smfhj2zbnhJz+/Y6rVKVM3KzyNK67xkt8UDUhi
 E1XNxs2VHOQsl3Oe1apupsFL4Cw3xZ8uPesk80jSg4OAV6iFbnpRCSDoOkw39R7KsjZOpCQZL45
 KIiUP8BqtbSHF+A3+dT083r0CR2BUOzdFKFnXlQYvERifI2KTclBh1Khqny97+EVfpM4UaT21vs
 RUEjX50ddllsioMaNJE1+g/uaD+BO1m7Kj3Lqw+M0jXbLC
X-Google-Smtp-Source: AGHT+IGtYnj9jiu7muloz7dbfG4ZFq4BxsOy0KSiABI/FVyASbXwFy6IXZLRiaF5QzQ0YklTxWXgoA==
X-Received: by 2002:a05:6512:1558:b0:597:ddd8:cce9 with SMTP id
 2adb3069b0e04-597ddd8cea8mr420850e87.25.1764938306636; 
 Fri, 05 Dec 2025 04:38:26 -0800 (PST)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-597d7b1a3d9sm1462351e87.4.2025.12.05.04.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 04:38:26 -0800 (PST)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Michal Simek <michal.simek@amd.com>,
 Bill Mills <bill.mills@linaro.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, stable@vger.kernel.org,
 Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 1/2] drm: xlnx: zynqmp_kms: Init fbdev with 16 bit color
Date: Fri,  5 Dec 2025 14:37:50 +0200
Message-ID: <20251205123751.2257694-2-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
References: <20251205123751.2257694-1-mikko.rapeli@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>

Use RG16 buffer format for fbdev emulation. Fbdev backend is being used
by Mali 400 userspace driver which expects 16 bit RGB pixel color format.
This change should not affect console or other fbdev applications as we
still have plenty of colors left.

Cc: Bill Mills <bill.mills@linaro.org>
Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: stable@vger.kernel.org
Signed-off-by: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 drivers/gpu/drm/xlnx/zynqmp_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xlnx/zynqmp_kms.c b/drivers/gpu/drm/xlnx/zynqmp_kms.c
index 2bee0a2275ede..ccc35cacd10cb 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_kms.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_kms.c
@@ -525,7 +525,7 @@ int zynqmp_dpsub_drm_init(struct zynqmp_dpsub *dpsub)
 		goto err_poll_fini;
 
 	/* Initialize fbdev generic emulation. */
-	drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB888);
+	drm_client_setup_with_fourcc(drm, DRM_FORMAT_RGB565);
 
 	return 0;
 
-- 
2.34.1

