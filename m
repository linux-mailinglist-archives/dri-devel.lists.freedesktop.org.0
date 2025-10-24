Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 501E8C05B69
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 12:57:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A012C10E056;
	Fri, 24 Oct 2025 10:57:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GUw1j4Za";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B09210E056
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 10:57:33 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-3717780ea70so26692531fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 03:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761303452; x=1761908252; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oLgGrwj2cvg8pbP9aZUjo9XHFc3IK9CECbX8yze6a+I=;
 b=GUw1j4Zak6IzMrU8ky09y5TDX3PCd3pjPgDjLLAzJQJ2e9+o6CIIDBFmBolCxCslYQ
 DEQvrrU1hy5MD6NFSBJV0wVm0+4cEyeRHIBY30dPoT02aeLDTYI9lwH5XLozBXcR+jw6
 G0NWWXfdCWbYMSUbn8OrjkW+WE615ENKJDkXudRWDNr5R5eu6GVDhwg5DL3SXlrZyki1
 wbN8Kozg6l6wDX2yqLgInNTRwYg/GwZItW4MN7Z3IemeN9xheOuG/PxgYkL4G9zEh+gF
 c1s+L7L5leIxSUtRIwDi1FITvhGi+7vDEjN2n4l3WOEtiY9503w0AePeZ/TXtw4njPTj
 +FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761303452; x=1761908252;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oLgGrwj2cvg8pbP9aZUjo9XHFc3IK9CECbX8yze6a+I=;
 b=Vt/1flBuTsnGr8XyVSzFLAaTBnJaVRaLfoclDUlRGab+o4R5kbpRVXmoguBH5wQXcS
 9uSKfMbluwUhhV1MGw1lZsWsGLfru6jIuWTgl8B2vJE/rJmsXGgSX8OnxXSeu5d48h/I
 rG+UWhY4NBTUh+GOCz/qagoHYCJWGhtK8YNoVRq4Ud6OUoS2KlCj+x0m2xthOo6nQPk/
 synCNOJ2s48+fSUO23tjDK4niNx+L1n8gF+OswchLXM/ShabhGP43+m3CV74YMuLd1OX
 kJLchsQFYzD6plwr/7aXnFNIbQTiJSRonRY5XzIuf/QqRFzhHWlEpOuQC32/qMgIMjBS
 KpKA==
X-Gm-Message-State: AOJu0YwPWbeMHAyYVdnjZN9rPwdB/PBOUljywOWORDtdr9Q869e4xMOF
 5crgjycXB2ntQRu4QNI9rJvTr+n78cJd6ds2b5yDGjRDMnHGe7wuaqCv
X-Gm-Gg: ASbGnct4x8Uoa9qYycvuP3dbSptpMeI0BjxeuBgNtWAeOMzXccGiCbcc0gqnlFxHbdi
 d3IZXe+GQuVG2YrpUwj0LRRjrHLMo+sB7olAm3Qp7hWFCya2vABhn0mQpYUO7tB2jPgIaBifQcW
 o446tC8Y2u+4CGSCubllDQveApRshpVz26WxhUjyZ7FcQt3k/M13BoQLb4IH/1XLkji0man5GLU
 EnuPkdeFZmPed4E9IGMUYrrICEGllZdwjUOaCM+n3aqVtkXvofvhcjgtDdzhVQ/cQoUZwfXWDCD
 qCw9o3XTOnzu3V6um6eJikLqE1OhOCbr8GZyV/Vb3ttmozacVT1fbU/7zMyJPAIssDXvvDKYxF1
 gfuOyzpqF7wFtOq+nQWyCwjy4pLvYwFfi65IrsfNuvV6104CCiOmo9Fv5mjl2Q0ewCFtA+M/uEU
 13f4pxHXjJZDbqPHd/kQKVuDlaD5Yfg3MI1RQcrjGfmTkn
X-Google-Smtp-Source: AGHT+IF5dJWz8eNNAmFHIgmHUtxjJ0+59k4uqUMNim6/zblOyHNP4qzO4SmxeZSF1EgjU9z1tA49IA==
X-Received: by 2002:a05:651c:1a08:b0:336:df0e:f4ac with SMTP id
 38308e7fff4ca-377979febaemr74275511fa.25.1761303451403; 
 Fri, 24 Oct 2025 03:57:31 -0700 (PDT)
Received: from [192.168.1.168] (83-233-6-197.cust.bredband2.com.
 [83.233.6.197]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-378d67db8fesm10375671fa.38.2025.10.24.03.57.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 03:57:30 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/6] drm/sitronix/st7571: split up driver to support both
 I2C and SPI
Date: Fri, 24 Oct 2025 12:56:51 +0200
Message-Id: <20251024-st7571-split-v1-0-d3092b98130f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHNb+2gC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDAyMT3eISc1NzQ93igpzMEt1kc2OTJAMzQwOzRBMloJaCotS0zAqwcdG
 xtbUAcxhRQl4AAAA=
X-Change-ID: 20251024-st7571-split-c734b06106a4
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1401;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=R6v56paA/dEHvU/dNXKGIvdsjJizyetpWPpVvBUzIPQ=;
 b=owEBbQKS/ZANAwAKAYiATm9ZXVIyAcsmYgBo+1t3aLKOO+EE32uhrK/QULQ+IkiU96FlJcBXr
 G9PfzLvN3KJAjMEAAEKAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCaPtbdwAKCRCIgE5vWV1S
 Mq/oEAC0bxr4XNigfBCApzjlC/u3jVIW4DTs1eik4K1b+1vDlJsLxlX6opIwqXPfn/GbJxT2xCS
 cL6FTLqEdXyl1AwkCubT8KaG6Y5WC+H/L+qQkV2TF0BgZ72IzHs9rtrrYy1EYajHiVGa6dhUwed
 CX1d2nCdoQd82NG5J2I44EA8oFzz/kJSA1eF7VKNVT2vbl5kTB1srZn3Gc/h9LTVAYQqPw0Bshe
 y9eDd4QYvmHy/SqTGrrbyPckFZ6TonnBT2/3hpSdhwSisn0PmILXNhojBYg657dLUAbG7hpPM48
 wurAeHTbqxpe7Av/De9qcghB+J/ijpPzO1DJqH/LxHzSdN8cUwS1k65WcCbYR1QeHDXqsLPJsL3
 XGpanOvjF15LhnWu7yhbePNXxg/EsoU4NYD5IHjQgyEqPAy7kpl18diJDOrIk3F6NMpEm1NN/bI
 bloy1y51PXJx0ZLhmo8iU44aCsYgOIa0/nkKhtfVHxjyVZEy7BmVZ68sxMsJMlCbhIyVKXdbvpR
 pQ9slkxQ6W4MDzM+AHd580ws9tTOzfsWc0YcBsHQ+1evtBMJA+7XkSzZYhbVua4hKufqgCxhvq3
 +tatrWsmf+zRTS398O23No/wT59+Pq44vvKzclc4957F8kVpf+x2qT8L1yGF35o9HEj40BBldBQ
 i95D/ZvO0rZ5v9g==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127
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

This series splits up the driver and finally implements
support for ST7571/ST7561 connected to a SPI bus.

I've not tested the SPI interface myself as I lack HW, but the
implementation should be okay from what I've read in the datasheet.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Marcus Folkesson (6):
      drm/sitronix/st7571-i2c: rename 'struct drm_device' in st7571_device
      drm/sitronix/st7571-i2c: add 'struct device' to st7571_device
      drm/sitronix/st7571-i2c: move common structures to st7571.h
      drm/sitronix/st7571-i2c: make probe independent of hw interface
      drm/sitronix/st7571: split up the driver into a common and an i2c part
      drm/sitronix/st7571-spi: add support for SPI interface

 MAINTAINERS                           |    3 +
 drivers/gpu/drm/sitronix/Kconfig      |   38 +-
 drivers/gpu/drm/sitronix/Makefile     |    2 +
 drivers/gpu/drm/sitronix/st7571-i2c.c | 1002 ++-------------------------------
 drivers/gpu/drm/sitronix/st7571-spi.c |   75 +++
 drivers/gpu/drm/sitronix/st7571.c     |  918 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/sitronix/st7571.h     |   91 +++
 7 files changed, 1160 insertions(+), 969 deletions(-)
---
base-commit: 7e73cefd2bede5408d1aeb6145261b62d85d23be
change-id: 20251024-st7571-split-c734b06106a4

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>

