Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBFEA66D7C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 09:10:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C7310E449;
	Tue, 18 Mar 2025 08:10:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="OcOTzBWj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F7010E204
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 08:10:18 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id D61C45824B9
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 07:58:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D0FB844546;
 Tue, 18 Mar 2025 07:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1742284731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=E578/GSWCsWnqwEkiPnLlBcESnf5QKksDe4RlGkn5Sg=;
 b=OcOTzBWjUOPC212xhPokYRhO/F5KrzIHi9z8hJle8RW6172GWhcFA5WoLVHrDMWPuetYul
 8Rlltu+q/47QnavmtssxH/03p+P9auOdgaRXb1zvOrBCzlw4ZRtwPfYFWegswAMhuZr8lQ
 B+VlxUsj/K5wwmH+G6rU+sbF1q/Wa2hoAb+vUrvOYwec/YV6fpDcJyGYELXnceSEkRhvK3
 IpwWKVJcsanNA/vMiMgmUnAcGmfisx7dMhQNVseDPazQZpkv/WNSb0nbJQEb0dCnYmh+RY
 QK4EkdothAHNrRK1DWBLD120h1+ZAmkxU8oZOLIK1KVcgRzOObebfxnJdBimYA==
From: Antonin Godard <antonin.godard@bootlin.com>
Subject: [PATCH 0/2] Add NLT NL13676BC25-03F panel support
Date: Tue, 18 Mar 2025 08:58:27 +0100
Message-Id: <20250318-b4-add-nlt-nl13676bc25-03f-v1-0-67e0f8cf2e6f@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKMn2WcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDY0Nj3SQT3cSUFN28nBIgNjQ2MzdLSjYy1TUwTtM1S7SwSEtKMjW2NEt
 WAhpQUJSallkBNjw6trYWAL9yEMxsAAAA
X-Change-ID: 20250313-b4-add-nlt-nl13676bc25-03f-6a88fbb5396c
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=764;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/YTs9cU8ULer4Fb+jefyvYbbD+cxlf0i/GS6i1fBfX0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBn2Se5TCFCSVl+n4jCzn3XlEwyp4i8r2uCkbqY1
 3RegzkGV3iJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ9knuQAKCRDRgEFAKaOo
 Nic4EACAIccHu05AUx/bJlZ7iQ1AAqOKDZGI64Nw3FEQz4qVLFDXvLOdW+E4aAtuv56g99zU4wM
 syqQKPWmAVi8EONINcMggmeA9qva8O814ggTr1Nxw+LECDDUVw/zGQaAUdtol+g1kfwbKiFi4kQ
 0OAaYxXKVPRXOmEZJyitgMpaSKok5J3kjyM/jPGq5Q0HhBw+GKtHRgpmoLy4N+teqwB+Ynsmzne
 rPoEcdUgTorR2T79mhTyW3OInUSyBM40hSeK584tY3xU5QsbEDgUrJIDer1UtX8ITES2t8wFJkZ
 EkvEWbF2tNPhzCCzQOHUwIUYaSP5QkI8WiVIUVYhwUEeEbA+UEaX/u4GcUu6UPPCDhhFhQphLMv
 5rx+DB9zPG+1ivckuHLdZIT6Zimm1zhwskQrwkMLLETo5LbtDS3BFXlIkbLOkLPkEeS5Bnkyqbz
 NOyOc3MjUSRV/AnyJRHs4DsbuB1JlbsF8HeXst5407+5AYT/HB7Cj1oJPg2jQ+MqrgNfJ/VHH4B
 yc/9Oalr80yZOKegsoLkIidF/PlJEdlPxPdmuE6vOaXSkJ02U4rl3TPp0UUU8+JDcWxz6aA9rRZ
 AE2DaGdCq8VoU2a383jon1sVSe44lpkl2Q3Cbpx9QzwFMR8bDyBj7GuqlQ1reuDJYsmbJjCjkxJ
 XeWCTquV4x8ai9A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugedukeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomheptehnthhonhhinhcuifhouggrrhguuceorghnthhonhhinhdrghhouggrrhgusegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeduvdefkeffteeluedvgffhjeegffduveegfffghfejteejkedvgfeuvedtudejkeenucfkphepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdugeemheehieemjegrtddtmeejtgehtgemiegruggvmeejleegkeemgedtheelpdhhvghloheplgduvdejrddtrddurddungdpmhgrihhlfhhrohhmpegrnhhtohhnihhnrdhgohgurghrugessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudejpdhrtghpthhtohepqhhuihgtpghjvghsshiihhgrnhesqhhuihgtihhntgdrtghomhdprhgtphhtthhopehmrggrrhhtvghnrdhlrghnkhhhohhrshhtsehlihhnuhigrdhinhhtvghlrdgtohhmpdhrtghpthhtoheprghnthhonhhinhdrghhouggrrhgus
 egsohhothhlihhnrdgtohhmpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopegtohhnohhrodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhg
X-GND-Sasl: antonin.godard@bootlin.com
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

The NLT NL13676BC25-03F panel is a 15.6" LCD-TFT LVDS panel. It is a
single port display unlike the NLT NL192108AC18-02D. Add a binding and a
panel entry under panel-simple.c.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
Antonin Godard (2):
      dt-bindings: display: simple: Add NLT NL13676BC25-03F panel
      drm/panel: simple: Add NLT NL13676BC25-03F panel entry

 .../bindings/display/panel/panel-simple.yaml       |  2 ++
 drivers/gpu/drm/panel/panel-simple.c               | 27 ++++++++++++++++++++++
 2 files changed, 29 insertions(+)
---
base-commit: 0fed89a961ea851945d23cc35beb59d6e56c0964
change-id: 20250313-b4-add-nlt-nl13676bc25-03f-6a88fbb5396c

Best regards,
-- 
Antonin Godard <antonin.godard@bootlin.com>

