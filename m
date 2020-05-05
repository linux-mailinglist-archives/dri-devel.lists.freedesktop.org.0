Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F26111C5CEC
	for <lists+dri-devel@lfdr.de>; Tue,  5 May 2020 18:06:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811496E28A;
	Tue,  5 May 2020 16:05:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0A96E28A
 for <dri-devel@lists.freedesktop.org>; Tue,  5 May 2020 16:05:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z8so2481974wrw.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 May 2020 09:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O1oAMhDPXg9F06mOnyk1XlMx/B4VkAxgxCrayfwc8CY=;
 b=C6WOu57GPpVg+TQWaH4qoiLJNdx4F5WNr/0puTjrDx95SC1HPGf+p3nbCzEJ2m6lRf
 rgYhkV9fEzZdk4mCY8A4x5lO96sdikaGO8ozJUUKORyfOqSWJ2zxJbrE7fM/oDnRjTu3
 +ncBCZWgM9bvE2kGIE3o0PObv8PbSFd8Cgb9nmdSjbA/HUwhcSHKr4IHLw8veu1FrSEe
 K6Cvhwbb2YvEKHLrHGn3nS7u6WPhhUHLd9uxaUEE70Tzd0T2XAUT6SWTCVTfWThJRW04
 yFzImUqSnP/eF6tlcKbEZmOMtmrS+LOBLeKWfoD3s0r320n/nG2n/x1U68zum5SE6NUg
 1ToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=O1oAMhDPXg9F06mOnyk1XlMx/B4VkAxgxCrayfwc8CY=;
 b=q3RpzRNORW45Em4q9HxjOkLA6K6HGsBgeLhqL+ARp1U9lhYvd0VNqTHpopqi6i/syx
 Kk9JTL5n82nZstMQl8QbPydLlBPosQ1d0xTqK0t/A8tQ7U7t4e/LPNgzCTd0GSew9QoB
 cZcSxwdmbPqnwNtaibRdOuZCAv+p8pFZnTRqwVbbobcjIlcHtzuRjPa4Z+Hb68D3pxzs
 rkgjW0ZJbZDW16OjVJwxpHLTg6AHL+3QPqFaY8uuYboLGVczRA831jMaLdEMACbqmuMW
 BnGWPtlBucBxFvE3r0kqMPHqF7cf1D8Gdju2QH9nb95FduIkWe2G1TxlQ3nCVOMMExTA
 3zmg==
X-Gm-Message-State: AGi0PubWBpBppm1xZ8mylQrFliNT73m+gf/RO0D4aHIF5vOn4Xe3Xow7
 AGbqlIDPpxXHypf+aqbgEEDg6Em2
X-Google-Smtp-Source: APiQypLTvjHMny0zNDh50iVzS9QS/FuVOFmDIQULuxjMPePp4S8brD5g0u/cPbhDtz1bOyQ3rnPnrQ==
X-Received: by 2002:adf:aa8e:: with SMTP id h14mr4865528wrc.371.1588694755425; 
 Tue, 05 May 2020 09:05:55 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id w18sm3803621wrn.55.2020.05.05.09.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 May 2020 09:05:54 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/dsi: use stack buffer in mipi_dsi_dcs_write()
Date: Tue,  5 May 2020 17:03:27 +0100
Message-Id: <20200505160329.2976059-1-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Jani Nikula <jani.nikula@intel.com>, Thierry Reding <treding@nvidia.com>,
 emil.l.velikov@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently the function heap allocates when we have any payload. Where in
many case the payload is 1 byte - ouch.

From casual observation, vast majority of the payloads are smaller than
8 bytes - so use a stack array tx[8] to avoid the senseless kmalloc and
kfree dance.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Thierry Reding <treding@nvidia.com>
Signed-off-by: Emil Velikov <emil.velikov@collabora.com>
---
 drivers/gpu/drm/drm_mipi_dsi.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 55531895dde6..b96d5b4629d7 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -748,26 +748,26 @@ ssize_t mipi_dsi_dcs_write(struct mipi_dsi_device *dsi, u8 cmd,
 {
 	ssize_t err;
 	size_t size;
+	u8 stack_tx[8];
 	u8 *tx;
 
-	if (len > 0) {
-		size = 1 + len;
-
+	size = 1 + len;
+	if (len > ARRAY_SIZE(stack_tx) - 1) {
 		tx = kmalloc(size, GFP_KERNEL);
 		if (!tx)
 			return -ENOMEM;
-
-		/* concatenate the DCS command byte and the payload */
-		tx[0] = cmd;
-		memcpy(&tx[1], data, len);
 	} else {
-		tx = &cmd;
-		size = 1;
+		tx = stack_tx;
 	}
 
+	/* concatenate the DCS command byte and the payload */
+	tx[0] = cmd;
+	if (data)
+		memcpy(&tx[1], data, len);
+
 	err = mipi_dsi_dcs_write_buffer(dsi, tx, size);
 
-	if (len > 0)
+	if (tx != stack_tx)
 		kfree(tx);
 
 	return err;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
