Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D5E58984B4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Apr 2024 12:08:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20ACD11B32C;
	Thu,  4 Apr 2024 10:08:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rMYQ3BvT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70BEA11B32C
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Apr 2024 10:08:09 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-56bdf81706aso1037748a12.2
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Apr 2024 03:08:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712225287; x=1712830087; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qmPmdTR9ZwPxhvP2c4bgI17aKaTHU1vV+VtVIiuiDB4=;
 b=rMYQ3BvTVPCrEgaQ3cAgPez3yGKYocUjdKOUT/XZ0g59Qmh4IBDYPesvJ1qJBEHaNm
 O32E9YrTYjZv06nifmgxV73J0OEnvSB8g2u1l5odI2bCoJ6c15jx50OqFP2jvUH7nrsk
 45eU/Jo6umLwtLZOaBAqA/G2yK4vGSjKeFKqxi9axh2/Otpv/QGQ3fKCPPcGkRFMPOiH
 guAs/ZHBb0MwR8b6HCTFHMtRhFbJgu7jR43vn9j8pppTX7dCGHXeaqo05VH4xmTKJ8Fg
 Rk4MAPCK9dNIwvXhUgGhRF+40G22WNdS/PS8EXHOLcBS+VRO8ihZC59X8cDcE8YmYBha
 fpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712225288; x=1712830088;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qmPmdTR9ZwPxhvP2c4bgI17aKaTHU1vV+VtVIiuiDB4=;
 b=Zg3K9/SUMqqw/qMMMrWHooby5LsqODrxTsKOkhEQT1VgzHdYfQcvWatju3vef5Bms+
 fvGSL1xssHC7y03XMQOzttAYhGOO18M4Nze57nlsU05L0BajD0nFOYFWDGGtgZ8au6rp
 ewUDzSA2MIy4XLhaSXPYxs4gqIqESV7eO+iQ37jUEtSHcUmx9y65ov7XhunueP2d52Nb
 dSIBATJJF90b4GPwjbhc7GzyHWyVKTEQwHFNP1GtxHesrwfAAsHHnmqgvsypHM4DYOb0
 OA3FJqRY6q5H43t5YSZM9UPa3gxOZoMfo0oVUvfdh++hPY/oXEpkvgxyjmY/dxmb4C31
 NvOQ==
X-Gm-Message-State: AOJu0YyuQCWx0tk12k3sW7Obp3eSsJJOYI1fuW6TZHXCZbt1XN6ly9DH
 iWneyNb8npfKXXOaKSrEICEerwa1p/TJ/sZw1K2xVjGEBvwYApetVdXqrYo1hzE=
X-Google-Smtp-Source: AGHT+IGH9QuL6NMx64raNLiACxvVKWuZIeX2HIIWXh2fepAfblZYgtSLhQDB19KMz0mESLgiFnB8Hg==
X-Received: by 2002:a50:9b1c:0:b0:56d:ece8:a5e8 with SMTP id
 o28-20020a509b1c000000b0056dece8a5e8mr1463406edi.14.1712225287519; 
 Thu, 04 Apr 2024 03:08:07 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 ig10-20020a056402458a00b0056c0a668316sm1984219edb.3.2024.04.04.03.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Apr 2024 03:08:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] drm/panel: small fixes for visionox and novatek panel
 drivers
Date: Thu, 04 Apr 2024 13:07:58 +0300
Message-Id: <20240404-drop-panel-unregister-v1-0-9f56953c5fb9@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP57DmYC/x2MQQqAIBAAvxJ7bqFCivpKdBBdayFU1opA/HsSc
 5rDTIZEwpRgaTIIPZw4+Cp924A5tN8J2VaHoRtUV0ErIWLUnk68vdDO6SLBSSk9O6t6Y0aobRR
 y/P7fdSvlAyplgMhnAAAA
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Kaehlcke <mka@chromium.org>, 
 Harigovindan P <harigovi@codeaurora.org>, 
 Ritesh Kumar <quic_riteshk@quicinc.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Du46wueKWvwkNxb//bx6Oplm8RijccGjLPvLCDL3hio=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmDnwFB4ymGew9A+j+lPaxjOF+3+3RraubF85ot
 OjFFlmnjvmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZg58BQAKCRCLPIo+Aiko
 1T43B/99SNedkXIzKq81LkZB/eLv5u0TTihQz/8l+QHHCWt0oOkMNGJ1OiuTLDr+ToE8FUWE6MR
 GuVpa19gteiQWaMoOMLaUlGG+yLtiytO3n9DtqRDSEdkeWshqiEW+YdN1Ur8opJZEYUlmnfPYcb
 uSQWI9uSHpch7sZk7im8Xu6b456C+r3slCqiLotvjlaHZ26ghhwV9M05njsLLcxzq1lwRlYMI3y
 XO9wtiu8lczQFupCgCRVuVAHl90JotvyLoC3RV5Vq8qdCEn/L5Cqy/GGdyzttgNeJkZ9PO78HVz
 nze2WXDRUaOPJYEP92kgYo/dSUBocbb3MZ93en0qQFGV7oXr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

While taking a glance at the novatek-nt36672e driver I stumbled upon a
call to unregister the DSI device for the panel, although it was not the
panel driver that registered the device.

Remove this call and a similar call from the visionox-rm69299 driver.
While we are at it, also optimize regulator API calls in these two
drivers and in the novatek-nt36672a driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/panel: visionox-rm69299: don't unregister DSI device
      drm/panel: novatek-nt36682e: don't unregister DSI device
      drm/panel: novatek-nt36672e: stop setting register load before disable
      drm/panel: novatek-nt36672e: stop calling regulator_set_load manually
      drm/panel: novatek-nt36672a: stop calling regulator_set_load manually
      drm/panel: visionox-rm69299: stop calling regulator_set_load manually

 drivers/gpu/drm/panel/panel-novatek-nt36672a.c | 11 +++-----
 drivers/gpu/drm/panel/panel-novatek-nt36672e.c | 35 +++-----------------------
 drivers/gpu/drm/panel/panel-visionox-rm69299.c | 18 ++-----------
 3 files changed, 9 insertions(+), 55 deletions(-)
---
base-commit: a6bd6c9333397f5a0e2667d4d82fef8c970108f2
change-id: 20240404-drop-panel-unregister-744a9fd41cc6

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

