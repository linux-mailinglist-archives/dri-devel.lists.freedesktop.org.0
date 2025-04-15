Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00EE3A8A040
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 15:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B0110E79C;
	Tue, 15 Apr 2025 13:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="h16p2gHX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A752A10E798
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Apr 2025 13:55:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3BCC543B34;
 Tue, 15 Apr 2025 13:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1744725346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/kxBS+R7AatRUaACkLiwnROBm8TvWT/gTUSAyzoqDo=;
 b=h16p2gHXzQNCgSJWhxKwugqErCfuCWAkC3D6bYeYUDthSR67fOdbo8Lpo3iH9Zkza+XdQF
 i8ALEVLE0cfwfFtPUEftAgz8/AcqcJv7nKcwS8LGu/ArWZbnUPhS3VWy4xlvkDxn4eLQFo
 WknukgwzaPEmO/XyGDPsjtacRi8AWqTQvh1gfeiL7+ITMJfx1fN2Jx1GTJZIwrtJ3/cHh0
 e7FNOWzX+nDL0NHpOWvU5yY4qeB77QT/iWfUyQ6CxwK250iWPzqRRhf9v1rd+xHN2mYCci
 uSPOL8/n/uzPgrixwXcIEndnwDDgkqgbHDnUXCifw7N2lUNrshTebHBsCvOyAA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Tue, 15 Apr 2025 15:55:36 +0200
Subject: [PATCH v18 5/8] drm: Export symbols to use in tests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250415-yuv-v18-5-f2918f71ec4b@bootlin.com>
References: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
In-Reply-To: <20250415-yuv-v18-0-f2918f71ec4b@bootlin.com>
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, rdunlap@infradead.org, 
 arthurgrillo@riseup.net, Jonathan Corbet <corbet@lwn.net>, 
 pekka.paalanen@haloniitty.fi, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, marcheu@google.com, 
 nicolejadeyee@google.com, linux-doc@vger.kernel.org, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1321;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=oFZEeYV9E7SVwSiSnD5a6fJUQNr5BRcYxn1NNJcKmJ4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBn/mVXzaq5d/Otd49/nUx4n0o1bpU0gEVJfJEwj
 FqvNibXQw+JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ/5lVwAKCRAgrS7GWxAs
 4vsUD/9vxX/9vJRhKpWbEDP+E1LsjZiq8xrofY3+sO5G1fxynS8kq84NTPo2ObielE7V1c1Smpq
 kskPPd+pAFd3NSwih7qfVh0Cr3lBRpwDbLRvIhmJz9FoSyFBtAvHV8oHJOIbZrsNeV575Mz5rK9
 lxY0gvB5HODEQ0I0uNK8xccWP9i6ULvPdJAtXcj46j4NQE/X5xYqpgE3kKVzsY15o/CZf0lwSNL
 bNScNtSuMCD6OHQ+xHkLpxNYReQWYKIKiezToECms++1bEp8TRm/ACLlLZho+Hlajfp62fviuoh
 Uyb4aTqClrZ4QIMFdnYyvxt7RefHw5BPEa92Eemp2mgh1HkslRZIO9nivw5L0ATrtoLKHPZEKKt
 cZzzYsIne+Xy14YLDG79BkJU4URt3qSmrTYC1XOV2Z2NuoaQEOLz5sWmwlOQt1QuTsFJJ/mtXeQ
 Hl3jTW+/LCtVzlgKM3G4VmMEh36hXXUzYbBmMaqfFPYqn6axExnxIdWvrRZ9dLPOGGYO8c94H4K
 X3mzG4wcoySsJbMc+Cp2CXz2hT95wC0B2EX4dSdiK99/vm0qieWf7xX2UoaOsgD7w7cTjwMyBb+
 t/vDDZ9JWnVNpH1YlLscS7Vm/MnoXQV5x5nA+gGzY+XZ2xBQ+qNQS9a7r8xijQYdjux3s/6Ox9B
 7v/wdyDw9WAU5ow==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvvdefieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedtieevieduhedttdfgtefhuddufeffudetkeegveeuteduveehheeivedttddtkeenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgdujedvrddukedrtddrudgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdehpdhrtghpthhtohepshhimhhonhgrrdhvvghtthgvrhesfhhffihllhdrtghhpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopehmrghirhgrtggrnhgrlhesrhhishgvuhhprdhnvghtpdhrtghpthhtohepnhhitghol
 hgvjhgruggvhigvvgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepshhimhhonhgrsehffhiflhhlrdgthhdprhgtphhtthhopehmrghrtghhvghusehgohhoghhlvgdrtghomhdprhgtphhtthhopehjohhsvgdrvgigphhoshhithhokeelsehgmhgrihhlrdgtohhm
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

The functions drm_get_color_encoding_name and drm_get_color_range_name
are useful for clarifying test results. Therefore, export them so they
can be used in tests built as modules.

Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 3969dc548cff..b73a998352d1 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -28,6 +28,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_print.h>
+#include <kunit/visibility.h>
 
 #include "drm_crtc_internal.h"
 
@@ -494,6 +495,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
@@ -509,6 +511,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
+EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties

-- 
2.49.0

