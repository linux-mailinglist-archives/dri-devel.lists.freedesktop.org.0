Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0868C33259
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 23:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B11210E67B;
	Tue,  4 Nov 2025 22:16:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="seNth5R3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC34E10E679
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3971A448AF;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03B0BC2BC9E;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762294575;
 bh=f6GfQjehkKWl/LGMGUh9JdpxtbOydSanZ93bKCsBU8c=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=seNth5R3IyH7LK0QzOAyE2VCQjWoZVAFlDhYgYhsJyyTwSIpMNVjEzXBzBKtx8Obj
 ECT2N8L75b1BQpi5oiKkGQUCwEyL859dfUvuthDo4GwE6zBtPu8qsXWSKXaKx2yOZQ
 k+iTnqWK9InbT6ZBRpITkfbqm8hdBaoM+4osSYf43mFi6l+rgfHLXYpdee6au7zjJP
 qbqAlLFdf07UtJJu9gIS5M6ZdFV1hRylMVOAPjbQS3G3F0hGXfqKpfZD3bYmdB8eQo
 +T9FA+efGaOPaIY7sF75tlUYfraPFO87QQmFBkMxTDfocj98iqqRh3lYq/XCsazslK
 EGwSGxV0AWPzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id EE929CCFA0D;
 Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:16 +0100
Subject: [PATCH 08/12] drm/panel: sofef00: Initialise at 50% brightness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-8-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=vjrHJH4EY6FJhDpprnzSkcksIGyeb+RoENa3mCki5mI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnss7ioIaB4Vn83ddXF7/bWJwnVZnrJ7v1T7z
 rUkYUUTU2uJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 cqbcEAC7O0ACBx2lh2Z/DMIYqPFPfs7X6TdoUa0MoUDHyWseBCo5JDa0JYVyUq51CJldk5EljHW
 dB1FrnKzy1E80sbj8eRvDPh5Ei+8KfJW/fGdNWNZRqG/765s+oO5R0o5d5tpv4KnuDYwaoi+TkT
 9pMWFAHOO/9mKnt5TTfjFu1On4guFnprjl3LmwIavRekvC3hg7ymj1Zl+bJXQIIYy/imvb6WPbS
 o/YcjzCBedfldstrg1EzP7ChVY9ygQf0fIh3fUX14pO/JBctpH/RWjlENskK29aNDQOLkC9pqPl
 2Ybzt7GFnyEHsccVTVCtNpUh1Mlng5eNNrz2YElGPFdI4HyZ/cIDFh6waXAtV3lPw/heyj6rM5P
 SledLJjM6B172MzWItLynytxNNXrUamWMwyyBv6pvQ6w57XaRrjEMZaLEYst9kiayA0wdcOsbDN
 A03l33lo+MrEOV2/BGe57U1SwH4eORWF+W5lwyY7KI0ZJwUNUwJCqU4xd/I4Ca6pzolIP2uSFA5
 0bCVapWEajMQTxeDloNE/r18+KkjNrtFuh2vfWdWOgcJuQ+5XLnk3a8rESppmWao8x6cSyV6A+j
 AYhWSKKMMdCn/IyxQ4vTddOG+mGIj8Z11328vJxpLRmBCcHxIogcyHQc8gYek8e3GN+UgBGLeCY
 l0dtvu6UsiFoZpQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Casey Connolly <casey.connolly@linaro.org>

Initialising at max brightness is not necessary.
Half brightness is much more comfortable.

Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 0d3ae0689a19b..d1e5340d7e337 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -204,7 +204,7 @@ sofef00_create_backlight(struct mipi_dsi_device *dsi)
 	struct device *dev = &dsi->dev;
 	const struct backlight_properties props = {
 		.type = BACKLIGHT_PLATFORM,
-		.brightness = 1023,
+		.brightness = 512,
 		.max_brightness = 1023,
 	};
 

-- 
2.51.0


