Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF10BE327E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 13:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 448F010E9C2;
	Thu, 16 Oct 2025 11:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="TrTwhDv7";
	dkim=pass (2048-bit key) header.d=sigxcpu.org header.i=@sigxcpu.org header.b="MXzMS8dV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 388 seconds by postgrey-1.36 at gabe;
 Thu, 16 Oct 2025 11:48:10 UTC
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF9110E9C2
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Oct 2025 11:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1760614899; bh=1uX+iCoWbbjlWd3wtxJLMpV1DvJ1ymMC5djhMKb2x6E=;
 h=From:Date:Subject:To:Cc:From;
 b=TrTwhDv78JXvTmxNwLMfnDGUHA/a5yzZEf+bJZSOTUHLK7yPotLP5LfpmGfEsl1HZ
 nOlKhqzond9NkKwzgqPyW4vKG6bG50EwMMKWKva7CyfdUuBHOM/QD0//IHNcJnAjvv
 vRJZS4yLvaWtUZppr2swIJxkooH9LGOXkVsLhbtr2gNbS2H3T7mACpEqxR2QeMiCRN
 w1UnTWCEa/sXN0pNV3ETfqstt/Ir0dTFZLzQCJEICRzal4D5vEqsgebOU33tVHMbRC
 5F4QmloXPZkIcRIXy34bOFsaewSC21nBdZC4/HVkGcpNxCJHGSWRoTASAqPXCv17dF
 qxm0bUBXHyeww==
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 93C3AFB03;
 Thu, 16 Oct 2025 13:41:39 +0200 (CEST)
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GcYD6Z5qO_cK; Thu, 16 Oct 2025 13:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=sigxcpu.org; s=2024;
 t=1760614898; bh=1uX+iCoWbbjlWd3wtxJLMpV1DvJ1ymMC5djhMKb2x6E=;
 h=From:Date:Subject:To:Cc:From;
 b=MXzMS8dVauLGdGvUsUigJj68Cz8vYmupGJRgCs6Z8gRXOecJXjyQtYtPcUFtDwXjO
 9U5s5cj4X90twHD3TXJfbalF153QTLQhkPzgoadokJ7w+s7VCgjfXsKAuUqC8wW1Ng
 rf9+3Usz47mnQePEpcIhAFTOz71awud5yLSHOkPNRCCBnnPp8V++Nj4lxxGavW/KlV
 66QvSd9Sdj+QCZk+d7bXDbpwIWmFq5cioLhwO0cj6/pAWu6m8cZkF5SVCRxxLgBYho
 ZqrgzmzR3KAY+1PsG9h7XIv2NpQYlHR4YBxB8NXagWEHT1YpxWXL6iMqG1+zJlsrk5
 qDiAZtoVsCjMw==
From: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Date: Thu, 16 Oct 2025 13:41:27 +0200
Subject: [PATCH] drm/panel: visionox-rm69299: Depend on BACKLIGHT_CLASS_DEVICE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251016-visionox-rm69299-bl-v1-1-d3b817ae5a26@sigxcpu.org>
X-B4-Tracking: v=1; b=H4sIAObZ8GgC/yWMSQqAMAwAvyI5G2gjRupXxEPVqAE3WhBB/LtFj
 wMzc0OUoBKhzm4IcmrUfUtg8wz62W+ToA6JgQyV1ljGX9kvDCs7cg67BSthT1IYJh4glUeQUa/
 v2rTP8wLUphi0ZQAAAA==
X-Change-ID: 20251016-visionox-rm69299-bl-7e6a2e30626d
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel <phone-devel@vger.kernel.org>, 
 Gustavo Padovan <gus@collabora.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=886; i=agx@sigxcpu.org;
 h=from:subject:message-id; bh=1uX+iCoWbbjlWd3wtxJLMpV1DvJ1ymMC5djhMKb2x6E=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FJQVNXL2hsSksvT
 UhqQWNzbVlnQm84Tm5yM3JGaG9MeERnQVVuZVlkenlsaHNYZ2R6CjUrQVNjKzVJMUg3SnhwNnZK
 ZEdKQWpNRUFBRUlBQjBXSVFSajlzemZsaUtkQ1NocktzTWx2NFpTU3Z6QjR3VUMKYVBEWjZ3QUt
 DUkFsdjRaU1N2ekI0MGdWRUFDcmMzSjdyNHZuQmxxWUJxbndiMEh0dHJDZ3VXbUhUVnRDc0Z0Tg
 o3S1dBZWlpaytnS09SMk1DTlJFTUMvdXJmdE5xODFoOVlMTC9KRUNKY0ZyRktUM0VRN3B6TUdzR
 Vc0Q2NpSkIwCmlIMC82UW4zNG5oUGxJdzBlam5YeDRYN3hqYlEwUDAxZS9mejNTdXk1RXQvUnBq
 SFE5c0ZJaC9OWjdCSmxIdm0KZitsUDZ0N09LSFBCWXlqdGlSV1VQc00wRHJIU2xmRUwyTnFKVkR
 uZXhMOGIrUkdoT3Zrem1VUGhBSkVvcGtZbAoyczVGN0VZYk9GNlZIbGl5emJDQjJockhVNFJ2Ym
 1qakU0dmt2MUR5aHRRditEM0FYSldTdWNLQWF2SHcrTUFWCnVodWE3TXBIVjAwaXQ5VHE3SDZWZ
 UN3NHRwYzRiY0RMRDRNQW9qN0ZuV3JZWUdUcGFManVCV1BFbTBITW5KcVgKYnJrZG4wSytXTG1G
 bHd4WkNsU3J3V0FLTkxhelZZU2MzZGFEMnVveXlhUEh0MjNHUTlIanJTRTBLL0lIMHlUSgpJUjB
 xMjY5dGsrSXVnanE4YnB0MzRqRy9HVFp1b01icGxKRnBkWHNvK3RFU3B6VzdwdXVVQmtvcXFwTk
 Mra1NRCngxRXA4ZWFJL0JBZGFocWhwZ0RmNHAwRlMyTXJNTzA5MEcrM21WTldzbjF0RHdISGF2a
 GtVTkM5VFc5cFRZZ04KSlJDUm9rVFg2cWdiV0F6UElCcTY2TW1oaDVuMTB6ZzlyVk9KRUszTHEw
 NXFYdUIxdHpzUVZpYkR6SmxiQ2owbApzRlZtTVhUZFBZV1lsM2EwbTF3bTM2ZU1GWncvZE5hbmp
 Gc1RvUVRnTzlHcGF6Yk4xYzgzU0lBRGlOa2FHTmFCCjFIYlc0Zz09Cj1xM1FwCi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=agx@sigxcpu.org; a=openpgp;
 fpr=0DB3932762F78E592F6522AFBB5A2C77584122D3
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

We handle backlight so need that dependency.

Fixes: 49802972d116 ("drm/panel: visionox-rm69299: Add backlight support")
Signed-off-by: Guido Günther <agx@sigxcpu.org>
---
 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 407c5f6a268b..59f5a31f3381 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -1112,6 +1112,7 @@ config DRM_PANEL_VISIONOX_RM69299
 	tristate "Visionox RM69299"
 	depends on OF
 	depends on DRM_MIPI_DSI
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  Say Y here if you want to enable support for Visionox
 	  RM69299  DSI Video Mode panel.

---
base-commit: 7ea30958b3054f5e488fa0b33c352723f7ab3a2a
change-id: 20251016-visionox-rm69299-bl-7e6a2e30626d

Best regards,
-- 
Guido Günther <agx@sigxcpu.org>

