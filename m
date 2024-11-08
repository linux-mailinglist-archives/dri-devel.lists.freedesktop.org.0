Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FBF9C13C8
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2024 02:48:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9742010E32C;
	Fri,  8 Nov 2024 01:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jookia.org header.i=@jookia.org header.b="WF2/syJt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 450 seconds by postgrey-1.36 at gabe;
 Fri, 08 Nov 2024 01:48:02 UTC
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 761DA10E32C
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2024 01:48:02 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1731030030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6SlCiON3cqc4vz5XEx0DbdrM/vWAePnU2JUI4leZ6jI=;
 b=WF2/syJtOv9gwYRzQQK1Tz+p1n4sJrrJLYf6JPhr4NQx2c6Iw6zAHtykD4VMfVDb87vyzB
 jXzcA56PrPqGfGZ87I59f3am4g3k10zRtmQqXN3hUgd4Q52hIIMFbGz1L12DtKfmwY78e7
 7ukelI1ZN691Mg04CRZI98dcskVRYjhvC9xfP/SWZjLDkIaKrA6eUJ71B5zunAgIH7P396
 fWnvUh3BTtz4c80J92JDReVBSxL996qjPLUEgpZ6LdvPIQ5MXGMLkfFRIb+izCLtXnaKNx
 s++5GHIB5NvWO/kVfJlTf8Mfr5DQj9qDRg42hBNZJ3CP2nSLfg92T8xntc2MvQ==
From: John Watts <contact@jookia.org>
Date: Fri, 08 Nov 2024 12:40:16 +1100
Subject: [PATCH] drm/sun4i: Workaround TCON TOP conflict between DE0 and
 DE1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-tcon_fix-v1-1-616218cc0d5f@jookia.org>
X-B4-Tracking: v=1; b=H4sIAP9rLWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQwML3ZLk/Lz4tMwK3TQDUwvTxGTLpMRUAyWg8oKiVKAw2Kjo2NpaAJr
 NfK5aAAAA
X-Change-ID: 20241108-tcon_fix-f0585ac9bae0
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Samuel Holland <samuel@sholland.org>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 John Watts <contact@jookia.org>
X-Developer-Signature: v=1; a=openssh-sha256; t=1731030018; l=1221;
 i=contact@jookia.org; h=from:subject:message-id;
 bh=/vB0A4Fo73KYupux7oAj+r9VcPiEW2iYRAxwvj/9zQg=;
 b=U1NIU0lHAAAAAQAAAEoAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAAAgPs7MDd2XR
 g2uRE9caV1lPPPeu0VzIG9fPrrVmYyAhLcAAAAEc3NoOgAAAAZwYXRhdHQAAAAAAAAABnNoYTUx
 MgAAAGcAAAAac2stc3NoLWVkMjU1MTlAb3BlbnNzaC5jb20AAABAsAsDWjawAwJm303ak1F4jDs
 LCMxEG6FoKq9hlQS6kcxUgFAAZdOULuhjgKrLrSACLm5/JiQDk2aK42XP22RlBQUAARju
X-Developer-Key: i=contact@jookia.org; a=openssh;
 fpr=SHA256:/gEvgms/9HpbgpcH+K7O4GYXmqkP7siJx9zHeEWRZTg
X-Migadu-Flow: FLOW_OUT
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

On the D1 and T113 the TCON TOP cannot handle setting both DEs to a
single output, even if the outputs are disabled. As a workaround assign
DE1 to TVE0 by default.

A full fix for this would include logic that makes sure both DEs never
share the same output.

Signed-off-by: John Watts <contact@jookia.org>
---
 drivers/gpu/drm/sun4i/sun8i_tcon_top.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
index a1ca3916f42bcc63b9ac7643e788d962ef360ca8..543311ffb1509face3fbfd069ded10933f254b9d 100644
--- a/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
+++ b/drivers/gpu/drm/sun4i/sun8i_tcon_top.c
@@ -179,7 +179,7 @@ static int sun8i_tcon_top_bind(struct device *dev, struct device *master,
 	 * At least on H6, some registers have some bits set by default
 	 * which may cause issues. Clear them here.
 	 */
-	writel(0, regs + TCON_TOP_PORT_SEL_REG);
+	writel(0x20, regs + TCON_TOP_PORT_SEL_REG);
 	writel(0, regs + TCON_TOP_GATE_SRC_REG);
 
 	/*

---
base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
change-id: 20241108-tcon_fix-f0585ac9bae0

Best regards,
-- 
John Watts <contact@jookia.org>

