Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA68B18420
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:43:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE7A10E1DB;
	Fri,  1 Aug 2025 14:43:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Vqo6qsSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D2F10E1DB
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 14:43:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7554244341;
 Fri,  1 Aug 2025 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754059432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=D/69elMkHysrArB+OwaL13Okhm4LtEB5WNscuqVegoY=;
 b=Vqo6qsSJBtBmF+x3r6E+wxLOuG4uYXgy2Q5hLbUCMs0ec6bW+2YCoiagvjWaZpoKkhJKcQ
 0IVfDj+7pX7B7CMzped+SS6u+T/T0IbhZ+uRYyIH3R2CAqxSSZCtGQg6u1nBqzix7kLFGS
 mpYyo4ViN7/xogbpp2YHuBzLpACdD7e1nDL1xvc+QEMxwLir1svsY+HSnCAgAm9mf/os+y
 HDiyYzQYGXzFDCVVN6jo/UNLEODvDKm8NI7m47QxA3CqpsGZGP3emJjkWP2/5oIAEmbelt
 vdibE2x96pNm4HvtvWxQy7RFlr4dxwDc81hzf3D8TJaXPJi3Sr9wmQuaeLp0xg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 0/2] drm/vkms: Fix plane blending z-order
Date: Fri, 01 Aug 2025 16:43:47 +0200
Message-Id: <20250801-vkms-fix-zpos-v1-0-d83ba1e6291d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKPSjGgC/zWMwQrCMBBEfyXs2cWkEpH+ivQQk60ukqRmYymW/
 rvB4m3eDPNWECpMAr1aodDMwjk1MAcF/uHSnZBDY+h0Z/VFG5yfUXDkBT9TFjTBn91ptMZZDe0
 zFWrbz3cddi70ejdt3Uu4OSH0OUauvQolYmTxx3/AREuFYdu+u61rrZkAAAA=
X-Change-ID: 20250801-vkms-fix-zpos-1dc6a3f51a50
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=981;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=w2VNIfshd90vdN0CS1H7ffwxjyrfhadvcLmCh3u+p3M=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBojNKmOcZT9m/7J8cgXYrhgxJu5ZfgyrnshFYdW
 b3ghN3SdTaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaIzSpgAKCRAgrS7GWxAs
 4nquD/9n4bOyYxsTbDOekYIuZVgRmSqHhXhmblBAegmMX21wvd+63mZKK9kCIluY+YDAZLvUKgB
 m3wFDCSAbupjhciOSQdWCJv7ZTgVW072PSTg0a8eyzce74LyGuMer942HkLw1blPFxQcvs1ql5k
 V+egCV4STAl97qU/5w6N8ClSZ0+pPNrIlrRys/7Jk3D8ggeEvmXQc/UUw3SSqYoVlTI7n03iV2t
 uinQn7ihnePF11hcYtOgafMFXHFxgGzkEKQVtiaMV5Ub1UPXFeaSYvzy2zsTKlOaxPyn7yaMoXg
 QH2H0CJ9w/URW/dMub0HOJt5JtxZEm6CiIP7T/itUVB3qmxKjfpd3FuGlOrpVQ5zE+MctlI3mnj
 xsR2xDZqbQHEjv1Ho6J/Zy8rEY7Bt5Tf1bpWafNs72T9th66AclxDjsgK4ZyyKgNWD5hk1pGmUL
 ajXdbU5LlS2vcBXyRFtyN4urDJH9spbru6lrrYf92Z4rfe4xNeHPF9ncZyNei2hegGdj4806HtC
 WM5oii/1CUR+pSdv8tt5XzSWB3ubIoOCq/DW0eNi9IJ5SNxhoCKGA9fxfNXTS92QSMZ1GIqbNq1
 SOqvLNu5fROyjqznXB8hWwQsF6mgrzOwHIraWUU18iW5uK4w5SxSVh8P7Ur2WSgtSYG+iejgfwq
 MkvL2Z66d8NtZYA==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejleduffeikeefkeejvdejffffueevfeeigefhiefhudegkefhjeejvefhvdefjeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppeeltddrkeelrdduieefrdduvdejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepledtrdekledrudeifedruddvjedphhgvlhhopegludelvddrudeikedrtddrvddtngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeduuddprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehtiihimhhmvghrmhgrnhhnsehsu
 hhsvgdruggvpdhrtghpthhtohepmhgvlhhishhsrgdrshhrfiesghhmrghilhdrtghomhdprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhm
X-GND-Sasl: louis.chauvet@bootlin.com
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

As reported by Marius [1], the current blending algorithm for vkms planes 
is not future-proof. Currently the z-ordering is only garanteed by the 
creation order. As the future ConfigFS interface will allows to create 
planes, this order may vary.

To avoid this, add the zpos property and blend the planes according to 
this zpos order.

[1]:https://lore.kernel.org/all/aHpGGxZyimpJ8Ehz@xpredator/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (2):
      drm/vkms: Add zpos property to planes
      drm/vkms: Properly order plane for blending

 drivers/gpu/drm/vkms/vkms_crtc.c  | 26 ++++++++++++++++++++------
 drivers/gpu/drm/vkms/vkms_drv.c   |  1 +
 drivers/gpu/drm/vkms/vkms_plane.c | 12 ++++++++++++
 3 files changed, 33 insertions(+), 6 deletions(-)
---
base-commit: 82928cc1c2b2be16ea6ee9e23799ca182e1cd37c
change-id: 20250801-vkms-fix-zpos-1dc6a3f51a50

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

