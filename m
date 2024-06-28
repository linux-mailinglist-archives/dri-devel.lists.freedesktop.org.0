Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B143B91C649
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2024 21:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EEE410ED2D;
	Fri, 28 Jun 2024 19:01:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=jookia.org header.i=@jookia.org header.b="gPiB1B86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 500 seconds by postgrey-1.36 at gabe;
 Fri, 28 Jun 2024 19:01:32 UTC
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C58110ED2E
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jun 2024 19:01:32 +0000 (UTC)
X-Envelope-To: linux-sunxi@lists.linux.dev
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
 t=1719600790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ol5vZWmzYCAtuPZvkV2jmiAnvzmCMXUkEioC5JggsN8=;
 b=gPiB1B86mnE70dlWle33ELiZCWlxK3uL2NGuS12wTJoFk7DW0qoHRufvn35raPdcC/ENqk
 LmdRP691WwONfx8wP5voen+IpJ2/Shes1KRp4fgZ7KPwi54GhJWvtcr+5C/KxQqPbVg6/3
 Bz5NwyO2tK7cNeZy+c4hHcTxkHniTncvX+LPMtS2/SaaLGxIB1/SaWmL4NVJgJnJ1Bf6uR
 5V1DTFASS2eJ5KmXvAedPdJNuY+QGx2W/Wo9sqsuGRVqboK2rNeHdZUQEBes/KoIP01t8T
 L0dP3ZUHcUEcjQsoqfrIWcpPkS2smu5X4g9GigCbZ7V7KUSMai8RH3DWAvc8qg==
X-Envelope-To: andre.przywara@arm.com
X-Envelope-To: jakobl.gm.g@gmail.com
X-Envelope-To: kirby.nankivell@gmail.com
X-Envelope-To: contact@paulk.fr
X-Envelope-To: mripard@kernel.org
X-Envelope-To: wens@csie.org
X-Envelope-To: jernej.skrabec@gmail.com
X-Envelope-To: maarten.lankhorst@linux.intel.com
X-Envelope-To: tzimmermann@suse.de
X-Envelope-To: airlied@gmail.com
X-Envelope-To: daniel@ffwll.ch
X-Envelope-To: samuel@sholland.org
X-Envelope-To: dri-devel@lists.freedesktop.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: linux-kernel@vger.kernel.org
Date: Sat, 29 Jun 2024 04:52:06 +1000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: John Watts <contact@jookia.org>
To: linux-sunxi@lists.linux.dev
Cc: andre.przywara@arm.com, Jakob L <jakobl.gm.g@gmail.com>,
 "K. James" <kirby.nankivell@gmail.com>,
 Paul Kocialkowski <contact@paulk.fr>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: T113 TCON Top tinting troubleshooting
Message-ID: <Zn8GVkpwXwhaUFno@titan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello,

On the T113 (and most likely the D1) sometimes the RGB LCD output has strange
artifacts such as:

- A blue tint
- A mostly opaque green tint
- A red tint
- A pink tint

The actual tint seems to differ between boards or chips, and has some
probability of showing up that can range from 50% to 90%.

After a week or so of troubleshooting I've managed to figure out what's
happening here, and I'm not too sure how to fix it.

It appears that the TCON Top on this chip can't mux both mixers to a shared
output. The R40 (and H6?) allows this and prioritizes the DE0 when muxing, but
on the T113 it seems to cause graphical artifacts. Disabling DE1 in the
device tree can help but doesn't solve the problem entirely.

Here's a change that tests this behaviour, it sets DE1 to output to TVE0. DE0
then outputs to LCD0 as usual. I would appreciate if anyone with this issue can
test the above workaround on their boards.
There was a previous discussion here:
https://groups.google.com/g/linux-sunxi/c/HxDBpY5HbbQ/m/mX2O2OYlCwAJ

---8<--- CUT HERE ---8<---

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

---8<--- CUT HERE ---8<---

The sunxi display code works around this issue by ensuring DE0 and DE1 never
map to the same output: If you have DE0 set to TVE0 and DE1 set to LCD0,
then tell it to set DE0 to LCD0, it will silently swap TVE0 on to DE1. 

I'm probably going to send a patch that copies this behaviour as it
should just work, but I'd be interested to see if there's anything I'm
missing.

John.
