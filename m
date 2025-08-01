Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38EB18421
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 16:44:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4599010E88F;
	Fri,  1 Aug 2025 14:43:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="A/NHIBZA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E5110E88F
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 14:43:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 799BC44347;
 Fri,  1 Aug 2025 14:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1754059433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U4GOYRcAGnrxluekfcmtZfpghkxdEd4YE3WMatT/cbs=;
 b=A/NHIBZAb+7HlUD/b27Uha3C00KdmYJ82xqi6TLjNBMYUvEXt+ZpjWPAhTuenZh5T0V38A
 4BjalEY10nUFeyAvuLk3nU6xGKGJq5smfVryEz4TpDmJe78Nc6YWB8daT7aNbWn0OahbXz
 d3att8yiUM0LhHLc/qdBKqohm01iTujS1w02a4rVJvQKq0dG3qHARZqA1gYD5mChsyYPWa
 B9HlFBxlzZU6t1+ItuJoeP+cNRZ/C3OivzHsET0kL8AlAUGwoCS5V47ephvqyFTpml8pgm
 u/0lhv7cwWSXxRLhX7aJI5WRx6VepkXimLaKzA1PNZvtnIcnedLVmir/2Ke+1w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 01 Aug 2025 16:43:48 +0200
Subject: [PATCH 1/2] drm/vkms: Add zpos property to planes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-vkms-fix-zpos-v1-1-d83ba1e6291d@bootlin.com>
References: <20250801-vkms-fix-zpos-v1-0-d83ba1e6291d@bootlin.com>
In-Reply-To: <20250801-vkms-fix-zpos-v1-0-d83ba1e6291d@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1276;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=CoQQQ54Nww1OKo53T3U366w9ZeC8wDbRVYKl2l0onU8=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBojNKmSbtmmpv2v3Bd6ZjhoqFXDDGcnsRJXF5ur
 EIxoFTWk46JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaIzSpgAKCRAgrS7GWxAs
 4pyAD/99KAITbb+AU/AwvAWrbid6B1+XYOG38q9cuK76WAwR3VmNeC245N7dRXpyevRy03uLH/c
 9dRaiuUWLmHO0WiPAiKRAluqNt/pq1JejcCcVa1mZGMc4HKN96uCY1hST5lRiSsgRVEuFDtW/be
 1LjJ/6YvGycwAMQ0yIvEj0aOOkHtAdSEoKjqv09R7T15d/1sbn7aXiBi/WJedbHEUa3ss+Ikqr8
 SalP8wTs1lNuzKQ5T55ZLTn/CocCVfddVEiGdFoEnWBKMXwYdPev1+EMn71HXXB/oOudPYeSDPI
 fYf5lkKCb4J3g9cueHTGFzl1JqEJDJp3m+u98JrkGkNcj2vpVyVMoHNVhQS2QgGK1zcKeddRNMm
 e26CoiJThRajdtSg4uv4mKQFSI1+fCYlkt3lI8SmbDy9GBpxIC/Yyf7bVgVQ02gH54BsXWTtsTY
 U6EU1OjXRKsON2JUEvtPcK6Wq1oEJk0AoJ+17lYL8LJJpQiqRAErBIHky5JFDA9a8mg7n5R2E2F
 PCHg53kqjuFtkh6coz750W4egbxSRZ6ewIUzqGEOyUUVuHmSuth3a5mb8t252nDpfvmQ/fMRHjn
 s+vWNpMUXWu2oGcBTQlMlq9kWxHIAXYUfzMZB90Ys61MPwhpoRvGeXzA6X4r1LqwmObHdRpVxT7
 R70Yxecx606rl7A==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddutdefleeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhfffugggtgffkfhgjvfevofesthejredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehtdejtddtteeiiefgleejkeetteevhfdukeegleffjeehgeeivefhgeduffdvvdenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplgduledvrdduieekrddtrddvtdgnpdhmrghilhhfrhhomheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepuddupdhrtghpthhtohephhgrmhhohhgrmhhmvggurdhsrgesghhmrghilhdrtghomhdprhgtphhtthhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehmvghli
 hhsshgrrdhsrhifsehgmhgrihhlrdgtohhmpdhrtghpthhtohepmhhrihhprghrugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhouhhishdrtghhrghuvhgvthessghoohhtlhhinhdrtghomh
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

Currently no zpos are defined for vkms planes. This is not yet an
issue, but with the future introduction of configfs, we need to have a way
to properly order plane composition.

In order to make it predictable, add zpos=0 for primary, zpos=1 for
overlays and zpos=2 for cursor. This will be configurable later.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_plane.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index e3fdd161d0f0a1d20c14a79dbe51c08c8486d12f..44bf9eedf5a7641f2eb171c8995079ca65dfa04e 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -232,5 +232,17 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 					  DRM_COLOR_YCBCR_BT601,
 					  DRM_COLOR_YCBCR_FULL_RANGE);
 
+	switch (type) {
+	case DRM_PLANE_TYPE_PRIMARY:
+		drm_plane_create_zpos_immutable_property(&plane->base, 0);
+		break;
+	case DRM_PLANE_TYPE_OVERLAY:
+		drm_plane_create_zpos_immutable_property(&plane->base, 1);
+		break;
+	case DRM_PLANE_TYPE_CURSOR:
+		drm_plane_create_zpos_immutable_property(&plane->base, 2);
+		break;
+	}
+
 	return plane;
 }

-- 
2.50.1

