Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50874C0745D
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 18:22:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 622A810EB02;
	Fri, 24 Oct 2025 16:22:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="WyQaRWeC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Fri, 24 Oct 2025 16:22:30 UTC
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB3A10EB02
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Oct 2025 16:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1761322950; x=1792858950;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=e9gZeMGN3pLQbfkAI6g+chfPTIRCv+JSr9r7OpEpjuk=;
 b=WyQaRWeCnHlmb3W1bDPEcWFzsictkvs6BR9SMzixKF/nG0rNtChW1eME
 3enh4xqKHDAdj8tDoHW92yMdIKwUswraFPNg1diFxpf7m/tN9lw3RYduc
 q0M5nbE8YRCBpDLppT51AVPhX7yrjyPd1CM/MDDwiNLzuHxjHTvHqP/tx
 6T3FAB+/YlZ9DlnFMtWqLpaljPcEYdrjMnaRqcud/kDv9pA1/WPjSQBDX
 2kmCDPsE4bTEsziTIlhC4vju5Ec+Z490n9wAuThnUQPF7yHthUdr/VJ30
 yygwwuuYrTedRL1K7V2NUE6UHv0tEZsn7I/Kw6pvzxJ8hvoyj+URpBUch g==;
X-CSE-ConnectionGUID: OZLbVyjtRe6JiCTkoaquJg==
X-CSE-MsgGUID: tWkYl6LlQYecV7NCWXBUjA==
X-IronPort-AV: E=Sophos;i="6.19,252,1754982000"; d="scan'208";a="48227183"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Oct 2025 09:15:24 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 24 Oct 2025 09:15:04 -0700
Received: from [127.0.0.1] (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 24 Oct 2025 09:15:01 -0700
From: Ludovic Desroches <ludovic.desroches@microchip.com>
Subject: [PATCH 0/2] drm/atmel-hlcdc: fix memory bugs
Date: Fri, 24 Oct 2025 18:14:51 +0200
Message-ID: <20251024-lcd_fixes_mainlining-v1-0-79b615130dc3@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPul+2gC/x3LWwqAIBBA0a3EfCeo2YO2EiGSkw3UFAoRhHtP+
 jxw7wsJI2GCsXoh4k2JTi5QdQXL5jigIF8MWupWSW3Evni70oPJHo54JyYOwindGD8o13cDlPW
 K+DflnOacP62Vzw1mAAAA
X-Change-ID: 20251024-lcd_fixes_mainlining-a1234d81a768
To: Manikandan Muralidharan <manikandan.m@microchip.com>, "Dharma
 Balasubiramani" <dharma.b@microchip.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Ludovic Desroches
 <ludovic.desroches@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=783;
 i=ludovic.desroches@microchip.com; h=from:subject:message-id;
 bh=e9gZeMGN3pLQbfkAI6g+chfPTIRCv+JSr9r7OpEpjuk=;
 b=owEBbQKS/ZANAwAKAT455hP3e2QtAcsmYgBo+6YFICrXySxOd9teoHGeB2+HmsYggPPyWFg9a
 3Nkv1Nq3VaJAjMEAAEKAB0WIQQAMEvJiWmsW41tNU0+OeYT93tkLQUCaPumBQAKCRA+OeYT93tk
 LaL3D/kBHNZN3S0vO14Kj0FTERJ2sgFYLuy2xE2tfj6kKNq54iFnwGmqovofI4usMq7ZVoVuoaU
 /HAwVhYZiV6xUAfoLkhK7dKcNMFsLNk26H8I2h++xCthy2sXyfKKadipCX/00HjfUuuoseDO7Gi
 facNrCrQjES3HjO2c9dtEO+nAjGr1/eMQk+YD4PV4DYvrxKJnsoup6bqQWl1l6iPqZeetdLeutu
 8wG+bi5J7ZaFnLyC228aoLTQcID0oYDaRX2wcWXGN5baSHamPJY/pmr5A9QiB3ZwBRC+CJO4+3D
 vpP8SmIytiFIaMtyHp2+1a/JG3toz4zLIrqNwfH8QRkj8/Bep6UcrqxpH/Bcot+snlJnUOCJZVN
 Dd4GfOrkFXWODaQISEO5lC1VocEQ+gztwcAm5pjrVHPb2dOVGUakhcy/U90G04P12FWqwZFVPmR
 CgOuvEmzSulQxAqveUC6StIcGk4eNJah38C5L7suk4Mde+6KyeTveUVNR5I7hby0mEdbXyWx8ij
 4DuuktM/LUuDIRvYQfM5MOy7JVj0H97GUIEqF2eHGa3sQHtynOEQDXgv1+7tmefa6iDa8oPwEzO
 CFTBoMbTMbfcNFcFTYl/PMC7wXWrh5sfkRmHuBLnL0cxq0BH2JwTTDylY/8MbztCrcPvu8UqGCb
 qZsNnyKmfrt/4Xg==
X-Developer-Key: i=ludovic.desroches@microchip.com; a=openpgp;
 fpr=665BAA7297BE089A28B77696E332995F09DCC11A
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

These two patches fix a memory leak and a use after free bugs.

The memory leak bug had been reported by several users. There were some
attempts to fix it in the past, but the resolutions proposed caused
other breakages.

Signed-off-by: Ludovic Desroches <ludovic.desroches@microchip.com>
---
Ludovic Desroches (2):
      drm/atmel-hlcdc: fix memory leak from the atomic_destroy_state callback
      drm/atmel-hlcdc: fix use-after-free of drm_crtc_commit after release

 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
---
base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
change-id: 20251024-lcd_fixes_mainlining-a1234d81a768

Best regards,
-- 
Ludovic Desroches <ludovic.desroches@microchip.com>

