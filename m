Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C00253A755
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 16:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A92010EBAB;
	Wed,  1 Jun 2022 14:01:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BFA910ED2C
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 14:01:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E42A2615AA;
 Wed,  1 Jun 2022 14:01:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFFE1C3411D;
 Wed,  1 Jun 2022 14:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654092088;
 bh=Bf5QOHaJpiVUqhHBRSN35OBw5iZVamMzadF9hlHiv/U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Cpf7T/vUb1d4hvMoZxdKAUVcD5z+daL9PaQrq3n59KP52Ah0AVVs15A2Dc8HP95Qj
 MdhL3McM3oQQwWWLDXr/0EbPebL+fapUJzrBBylw0jUALOUZb9pti8ijOAFzz0y/vr
 LedDlpx4IjuH7bgxbMeUTGaxzHOi434cphgx2K/DHy+dAVh4pwnZtAc/1KmSndqYk4
 Tmz4jRLl6zS9mfANuEO2QiNEG/zG2Wqf1fsZ8vbHHJ1hoVx3pM/XQRm9+Bqr43Kyzr
 HUuXzSmWjVliSjceG2GTkb7R0+dh/h7WturgdyrQbMUr2T3K96LdIzK9wME7hxxbk9
 jQCTd7ao28YEg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 11/11] drm: fix EDID struct for old ARM OABI format
Date: Wed,  1 Jun 2022 10:01:00 -0400
Message-Id: <20220601140100.2005469-11-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220601140100.2005469-1-sashal@kernel.org>
References: <20220601140100.2005469-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 47f15561b69e226bfc034e94ff6dbec51a4662af ]

When building the kernel for arm with the "-mabi=apcs-gnu" option, gcc
will force alignment of all structures and unions to a word boundary
(see also STRUCTURE_SIZE_BOUNDARY and the "-mstructure-size-boundary=XX"
option if you're a gcc person), even when the members of said structures
do not want or need said alignment.

This completely messes up the structure alignment of 'struct edid' on
those targets, because even though all the embedded structures are
marked with "__attribute__((packed))", the unions that contain them are
not.

This was exposed by commit f1e4c916f97f ("drm/edid: add EDID block count
and size helpers"), but the bug is pre-existing.  That commit just made
the structure layout problem cause a build failure due to the addition
of the

        BUILD_BUG_ON(sizeof(*edid) != EDID_LENGTH);

sanity check in drivers/gpu/drm/drm_edid.c:edid_block_data().

This legacy union alignment should probably not be used in the first
place, but we can fix the layout by adding the packed attribute to the
union entries even when each member is already packed and it shouldn't
matter in a sane build environment.

You can see this issue with a trivial test program:

  union {
	struct {
		char c[5];
	};
	struct {
		char d;
		unsigned e;
	} __attribute__((packed));
  } a = { "1234" };

where building this with a normal "gcc -S" will result in the expected
5-byte size of said union:

	.type	a, @object
	.size	a, 5

but with an ARM compiler and the old ABI:

    arm-linux-gnu-gcc -mabi=apcs-gnu -mfloat-abi=soft -S t.c

you get

	.type	a, %object
	.size	a, 8

instead, because even though each member of the union is packed, the
union itself still gets aligned.

This was reported by Sudip for the spear3xx_defconfig target.

Link: https://lore.kernel.org/lkml/YpCUzStDnSgQLNFN@debian/
Reported-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 include/drm/drm_edid.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index c3a7d440bc11..514a02095983 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -114,7 +114,7 @@ struct detailed_data_monitor_range {
 			u8 supported_scalings;
 			u8 preferred_refresh;
 		} __attribute__((packed)) cvt;
-	} formula;
+	} __attribute__((packed)) formula;
 } __attribute__((packed));
 
 struct detailed_data_wpindex {
@@ -147,7 +147,7 @@ struct detailed_non_pixel {
 		struct detailed_data_wpindex color;
 		struct std_timing timings[6];
 		struct cvt_timing cvt[4];
-	} data;
+	} __attribute__((packed)) data;
 } __attribute__((packed));
 
 #define EDID_DETAIL_EST_TIMINGS 0xf7
@@ -165,7 +165,7 @@ struct detailed_timing {
 	union {
 		struct detailed_pixel_timing pixel_data;
 		struct detailed_non_pixel other_data;
-	} data;
+	} __attribute__((packed)) data;
 } __attribute__((packed));
 
 #define DRM_EDID_INPUT_SERRATION_VSYNC (1 << 0)
-- 
2.35.1

