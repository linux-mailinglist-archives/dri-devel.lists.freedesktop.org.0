Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC49D10BD2
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 07:46:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786BE10E2C9;
	Mon, 12 Jan 2026 06:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tbfZrKbx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC7110E2C9
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jan 2026 06:46:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F4814168A;
 Mon, 12 Jan 2026 06:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA53FC116D0;
 Mon, 12 Jan 2026 06:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768200362;
 bh=T+6DAB5U+aymplM4EogtY9wqWk51pwq6UxFmNbuENE0=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=tbfZrKbxOiISXeXUJid3i04ienS21t35b4CjUdrYP/OKE5PQG5QcCHI3TCdaxe7D8
 8DHNusUeVVo+Jfkh8h+vc4HkM4IW8DEkUoqXRs6q9pFP+gxK+a/Jevbhi+Ov3KXUBp
 bvmipZ776SVylDNY2CG8FKeJ3R03bSkQBMAtH+Ixlxbv/yphT3Ep8EgC9a8zp31+13
 /pkCyI+l20BpTZpaSC8n7xr2/aga8zZCG76OVBi49bMj1BBKQgP8SwbU5Bf6R3R+fa
 5ob3msmF1rX/xSZUekMnBYKux2ktODdxZO5XokqfwRByszFHczYBcA+Dv0029QpNPl
 kB1ESOaoNI/yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C8360D2503B;
 Mon, 12 Jan 2026 06:46:02 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Mon, 12 Jan 2026 14:47:07 +0800
Subject: [PATCH] drm/bridge: it6505: disable HDCP retry when KSV list timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260112-disable-hdcp-auto-retry-v1-1-dc9217f08f7c@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAOqYZGkC/x3MMQqAMAxA0atIZgNth6JeRRxiGzUgKqmKIt7d4
 viG/x9IrMIJmuIB5VOSrEuGLQsIEy0jo8RscMZ5Y63DKIn6mXGKYUM69hWVd73RUxWNGXxProZ
 cb8qDXP+57d73A4D9RE9pAAAA
X-Change-ID: 20260112-disable-hdcp-auto-retry-6a8d00f6ba29
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768200435; l=1553;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=rCW3jddM8TQgyxZZEpHfDk8/Yn8r6UZLGkwB+J85M8A=;
 b=7A7jap0TA1DohHAgYYmCcYl1NvpnYzSGNv+i1t3xfwhcNzW/K+OvbUDvCRlUdUPNYksWhPW6n
 ku9ky5ji0efD3VRnbEgNU/W8mhV7rEfdjoyUPEQMYt+3f6A0E2XVlM+
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

Some DP to HDMI converters fail to report KSV list within the 6-second
HDCP window, causing the IT6505 to repeatedly restart authentication.
This results in continuous flickering on the connected HDMI monitor.

Disable automatic HDCP retry when KSV list timeout. This breaks the
re-auth loop and significantly improves stability/user experience with
problematic converters.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index a094803ba7aa4e12165fcde432d4e6417fbf3676..1c1e6b78fadbf29da00a68e26671ce5b54ee1557 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -2238,7 +2238,7 @@ static void it6505_hdcp_wait_ksv_list(struct work_struct *work)
 		return;
 
 timeout:
-	it6505_start_hdcp(it6505);
+	it6505_stop_hdcp(it6505);
 }
 
 static void it6505_hdcp_work(struct work_struct *work)
@@ -2596,7 +2596,7 @@ static void it6505_irq_hdcp_fail(struct it6505 *it6505)
 	DRM_DEV_DEBUG_DRIVER(dev, "hdcp fail interrupt");
 	it6505->hdcp_status = HDCP_AUTH_IDLE;
 	it6505_show_hdcp_info(it6505);
-	it6505_start_hdcp(it6505);
+	it6505_stop_hdcp(it6505);
 }
 
 static void it6505_irq_aux_cmd_fail(struct it6505 *it6505)

---
base-commit: 38feb171b3f92d77e8061fafb5ddfffc2c13b672
change-id: 20260112-disable-hdcp-auto-retry-6a8d00f6ba29

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


