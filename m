Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5CF4AFCF16
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 17:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6904F10E68F;
	Tue,  8 Jul 2025 15:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="VWgjcXuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1036110E137
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 15:25:38 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8248D443F7;
 Tue,  8 Jul 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751988337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bl2mZLAmfC38rN0LPamsmSOKGf0UkHN/P7hgt6AZZ44=;
 b=VWgjcXuR1zJPygqIoVLzx57coaQ92mwk10H7tZzTBL+39Kcba0tsAWA3MNAbuCRK3YfYWo
 73uRwFXpZEr7CyhIBhsAPWlkBoGg9mxz4bOcGe0zlwOraDLJ7Z/mFvTgfs0p1o+Z0bcEdr
 ffbrx56bFhW3C+Sb4bqHBsRAqIuEBt05j6DJ0dbf5immeG4u9EgY/rVXBXuKMNwCz3C1LK
 /N1fa0+YUmpsHb/noNdryaohjCoS/0nP4L4QHHzN/icsxvxP3zwc0krypMs73i6XnDG1+S
 IvRyAgTYb5icDwlKIvSdbihRhYsghBqcacgxsgstCEOAUQ7eAv5CY/HWKyibSw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] drm: fix missing conversions of bridge drivers to
 devm_drm_bridge_alloc()
Date: Tue, 08 Jul 2025 17:24:41 +0200
Message-Id: <20250708-drm-bridge-convert-to-alloc-api-leftovers-v1-0-6285de8c3759@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADk4bWgC/x2N0QrCMAxFf2Xk2UCtzk1/ZfjQtZkGajPSMoSxf
 zf4eO6Be3aopEwVHt0OShtXlmJwPnUQ36G8CDkZg3e+d4MbMekHZ+VkJkrZSBs2wZCzRAwrY6a
 lic0Vb3EkP1yuc093sL9VaeHvvzU9j+MH6OFzm3sAAAA=
X-Change-ID: 20250708-drm-bridge-convert-to-alloc-api-leftovers-6c8e2734b5e9
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefhedtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffufffkgggtgffvvefosehtjeertdertdejnecuhfhrohhmpefnuhgtrgcuvegvrhgvshholhhiuceolhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgfeiteekkefgtdduveeuffeuffevkeehieduhfefvdfhueekuefhhfdttddvkeefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkphepkeejrdduvddtrddvudekrddvtdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepkeejrdduvddtrddvudekrddvtdejpdhhvghloheplgduledvrdduieekrddurddufegnpdhmrghilhhfrhhomheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepudefpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopefjuhhirdfruhesghgvhhgvrghlthhhtggrrhgvrdgtohhmpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiii
 ihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghirhhlihgvugesghhmrghilhdrtghomhdprhgtphhtthhopehrghgrlhhlrghishhpohhusehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhdrshiihihprhhofihskhhisehsrghmshhunhhgrdgtohhmpdhrtghpthhtoheplhhutggrrdgtvghrvghsohhlihessghoohhtlhhinhdrtghomh
X-GND-Sasl: luca.ceresoli@bootlin.com
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

Most DRM bridge drivers have been converted to devm_drm_bridge_alloc() by
[0], but a few drivers were missed. One got converted by [1], this series
converts all the (known) remaining ones.

Thanks Marek for having found and reported them!

[0] https://lore.kernel.org/all/20250528-drm-bridge-convert-to-alloc-api-v4-1-f04e698c9a77@bootlin.com/
[1] https://lore.kernel.org/all/20250627165652.580798-1-m.szyprowski@samsung.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      drm/sti: hdmi: convert to devm_drm_bridge_alloc() API
      drm/sti: hda: convert to devm_drm_bridge_alloc() API

 drivers/gpu/drm/sti/sti_hda.c  | 27 +++++++++++++--------------
 drivers/gpu/drm/sti/sti_hdmi.c | 26 ++++++++++++--------------
 drivers/gpu/drm/sti/sti_hdmi.h |  2 ++
 3 files changed, 27 insertions(+), 28 deletions(-)
---
base-commit: 482c7e296edc0f594e8869a789a40be53c49bd6a
change-id: 20250708-drm-bridge-convert-to-alloc-api-leftovers-6c8e2734b5e9

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

