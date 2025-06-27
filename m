Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6033AAEB345
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 11:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1072B10E9A6;
	Fri, 27 Jun 2025 09:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="UEJbey2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0969410E9A3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:48:02 +0000 (UTC)
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id 514AC5867F3
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 09:12:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7EC14388C;
 Fri, 27 Jun 2025 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751015569;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jMMS4ea1lRKR0o6OKvXdrGiucNnIGPkdr5Jn9qFP87U=;
 b=UEJbey2aMdghOOt1fBRUZu5HuQXA3IxGl2hx8t31+2ZHNrPjAODP7uuOHtkScBv8tLSVdC
 aNHvhfCIJx5K9a70NGmOJ1fzsQafUB6iFix9J7cJRFHBVB+ffazQkbD5qcOrFX5Q0lQR6L
 Dh0oM88ScCktL9gaYJRflw9QRT79LaLpvpv+epORKRntvUoYkbWMGcGT9gZNwAu3mxOyz5
 n4GK89PCozZkC5AD51tVsiNoVMkOOcnw93b2cni/wD3XV+txT9K8yYcM32Cbp+7rI5J9+w
 THfcJIr9k5swqp53S89UGnKtPaVf7SIb96a7JVoIYjE5Rqb6nDra3xYSlYHwCQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v5 0/8] drm/vkms: Add support for multiple plane formats
Date: Fri, 27 Jun 2025 11:12:31 +0200
Message-Id: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH9gXmgC/33RzU4DIRAH8FfZcC7K57L05HsYDwsMlqQsCrjWN
 H13aTfVNHW9MSTzm+HPERXIAQradkeUYQ4lpKkVctMhuxunV8DBtRoxwgThlGEj8ASf2KZ9yti
 nHMdaMDWgXT8MhtERtda3DD4cLuzzS6t3odSUvy5TZnq+XUBJ+7/BmWKClbBeeyCKU/VkUqr7M
 D3YFNGZnNkvM1CxwrDGDIYLra0HTeCG2SzPooSof9qdUG6UxIleifst+M8WlLKVdGbeGMa9Uqq
 nWll9z4grI4nkZIURjQEvWyZi4Kq3t8xpyT3D+0f7xbqEj8xYoDkxhrrtXI44hmIfr4c25VBb6
 +kboQy/eQgCAAA=
X-Change-ID: 20240312-b4-new-color-formats-1be9d688b21a
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2619;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=j205EYLjzOUu5rmW2oUGimRr250dsQmrzW5+uyLHUG4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXmCH80JevWz0vzrlM/lG8lV0MRm01bgrCPx8T
 HhQNL6Bw8uJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF5ghwAKCRAgrS7GWxAs
 4pomD/93nbTLzVjNebVf4lLWqb7YPbgHlGEi21o944mf1He7BJ6rTmwihelVRpSOFCA6ctA6wzA
 6V8juC4fOnQA+hD4j2iy7RZ7B+lGa0XgVCSAYufmqoNzCi1JAZf2eydMshf2l82ZQH+bov6WJDv
 7k8vwUhBDInWz+TV6I2MGxI/ykembRSDQgjjcTgjiCz8Eg+WHPaSxIIpXhj9SCBBK8W2XOBoodJ
 pVfHywD520emUcK62bZXaIGggPpuAg/cqu0DTZeME12iwyLtK468aoV8/Gs/2lnNKAkhuOleq8v
 uAEptegAMi1sHmsAcee1qEj6PynYkZjTuUqrBj3m7vRDCfnO9KVEQNAsQ8FazNdTY6T4gr9gteK
 DEa0DA3t4G6DIyUdaBbtxUOpFNetux8pZktkVKUcPUOaLhlkRbUZ6VIwuh6nUnEJX+jbhbGxmux
 vEutO7Mx9Qi7tXmDjNsIHXU1oRA//lwx3obXNlKf2Z+d2Cxv3SGnXtM9JahjjJcxc1YpGgndxaW
 mI1EpoxiE6pu6PwhL435GQWINojiolnl1IlFJU6hidIppAe1o5+bl2tRE5Sxdd8a8cxvj8FO1nx
 bMZCAHVvXv5HXncYHVNEcidXUT/MpZakIJBfY67RJDaTVEpMYZUcf85ZuYGGR6H0RpQOkyqrGsf
 rDisECYwC5b5xXg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejleduffeikeefkeejvdejffffueevfeeigefhiefhudegkefhjeejvefhvdefjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrgedvrdeijegnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddtpdhrtghpthhtohepmhgrihhrrggtrghnrghlsehrihhsvghuphdrnhgvthdprhgtphhtthhopehsihhquhgvihhrrgesihhgrghlihgrrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvthdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtiihimhhmvghrm
 hgrnhhnsehsuhhsvgdruggvpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepjhgvrhgvmhhivgdruggruhhthhgvrhhisggvshessghoohhtlhhinhdrtghomh
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

This series introduce a macro to generate a function to read simple
formats. It avoid duplication of the same logic for similar formats.

In addition, it also introduce multiple "easy" formats (rgb888 variants)
and also 16 bits yuv support (P01* formats).

PATCH 1 is the introduction of the macro and adaptation of the existing
code to avoid duplication
PATCH 2-5 introduce new formats with the help of this macro.
PATCH 6 adds support for 16-bit yuv formats
PATCH 7 introduces a macro to reduce code duplication between yuv formats
PATCH 8 adds support for P01* formats

I tested the implementation using kms_plane.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v5:
- Avoid code duplication in RGB565 and BRG565 readline functions
- Properly rename yuv_u8 to yuv_u16
- Fix useless indentatin
- Remove untested formats
- Link to v4: https://lore.kernel.org/r/20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com

Changes in v4:
- Update tests to test yuv 16 bits conversions, not only 8 bits
- Link to v3: https://lore.kernel.org/r/20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com

Changes in v3:
- Rebased on new YUV iterations
- Link to v2: https://lore.kernel.org/r/20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com

Changes in v2:
- Add proper casting/type to __le16 when needed to avoid warnings with
  sparse
- Change the function argb_u16_from_yuv8888 to argb_u16_from_yuv161616 to
  support 16 bits values.
- Add support for P010/P012/P016 format
- Link to v1: https://lore.kernel.org/r/20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com

---
Louis Chauvet (8):
      drm/vkms: Create helpers macro to avoid code duplication in format callbacks
      drm/vkms: Add support for ARGB8888 formats
      drm/vkms: Add support for ARGB16161616 formats
      drm/vkms: Add support for RGB565 formats
      drm/vkms: Add support for RGB888 formats
      drm/vkms: Change YUV helpers to support u16 inputs for conversion
      drm/vkms: Create helper macro for YUV formats
      drm/vkms: Add P01* formats

 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 139 +++++------
 drivers/gpu/drm/vkms/vkms_formats.c           | 325 +++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_formats.h           |   4 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  13 +-
 4 files changed, 244 insertions(+), 237 deletions(-)
---
base-commit: bb8aa27eff6f3376242da37c2d02b9dcc66934b1
change-id: 20240312-b4-new-color-formats-1be9d688b21a

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

