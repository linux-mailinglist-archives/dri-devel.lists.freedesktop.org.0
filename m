Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6694A47A81E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 12:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7B210FCE8;
	Mon, 20 Dec 2021 11:00:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2660 seconds by postgrey-1.36 at gabe;
 Mon, 20 Dec 2021 10:59:59 UTC
Received: from sipsolutions.net (s3.sipsolutions.net
 [IPv6:2a01:4f8:191:4433::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B82CE10FCE7
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 10:59:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Content-Type:Sender
 :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
 Resent-Cc:Resent-Message-ID; bh=alHpGosBZG9KLUVJPord3i/tdWAv/gVYDukIQiUTKBI=; 
 t=1639997999; x=1641207599; b=wPDZSbPW3GiSJxLXnewHXas+qdEEAbmdMeQLh3OfM7GSmml
 XceVYlDmkyxH/54rnqabFxhPh5sxyvBkb00nM/dkWFfqi1MCZTkKb7qrO+axDE3dRGplOnJDUfBO0
 wlTJYkhmjT23sJhLZZDYGMqt9vEyMbWHmmVxo07yOSwIYKYjUhbMemGtLPf7BMfJ1Zri0ALxdirar
 MIvjF9IMrx4LDLxSQB8yoKUvpU6U4zrUjqvizxcy4NzvrVn/wkisI6Bdy4vrtsoQvtihzZ3nAbfai
 hLf60xQNWmsxykHCyCBsVRmRpIvCVzHC01pS1js0195NnmU3VyiZaaDqytYjY3WQ==;
Received: by sipsolutions.net with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.95) (envelope-from <johannes@sipsolutions.net>)
 id 1mzFhf-00E3ko-Uu; Mon, 20 Dec 2021 11:15:36 +0100
From: Johannes Berg <johannes@sipsolutions.net>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix compilation on ARCH=um
Date: Mon, 20 Dec 2021 11:15:22 +0100
Message-Id: <20211220111519.a4c8c6eff702.Ie4cf4e68698f6a9f546b83379bc52c266504424f@changeid>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <CAMuHMdXTRYjtfyWTVN86pn4STO2EPR1B5+KHj=wAqguXt=hpHg@mail.gmail.com>
References: <CAMuHMdXTRYjtfyWTVN86pn4STO2EPR1B5+KHj=wAqguXt=hpHg@mail.gmail.com>
MIME-Version: 1.0
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Johannes Berg <johannes.berg@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Johannes Berg <johannes.berg@intel.com>

Even if it's probably not really useful, it can get selected
by e.g. randconfig builds, and then failing to compile is an
annoyance. Unfortunately, it's hard to fix in Kconfig, since
DRM_TTM is selected by many things that don't really depend
on any specific architecture, and just depend on PCI (which
is indeed now available in ARCH=um via simulation/emulation).

Fix this in the code instead by just ifdef'ing the relevant
two lines that depend on "real X86".

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Johannes Berg <johannes.berg@intel.com>
---
 drivers/gpu/drm/ttm/ttm_module.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_module.c b/drivers/gpu/drm/ttm/ttm_module.c
index 0037eefe3239..a3ad7c9736ec 100644
--- a/drivers/gpu/drm/ttm/ttm_module.c
+++ b/drivers/gpu/drm/ttm/ttm_module.c
@@ -68,9 +68,11 @@ pgprot_t ttm_prot_from_caching(enum ttm_caching caching, pgprot_t tmp)
 #if defined(__i386__) || defined(__x86_64__)
 	if (caching == ttm_write_combined)
 		tmp = pgprot_writecombine(tmp);
+#ifndef CONFIG_UML
 	else if (boot_cpu_data.x86 > 3)
 		tmp = pgprot_noncached(tmp);
-#endif
+#endif /* CONFIG_UML */
+#endif /* __i386__ || __x86_64__ */
 #if defined(__ia64__) || defined(__arm__) || defined(__aarch64__) || \
 	defined(__powerpc__) || defined(__mips__)
 	if (caching == ttm_write_combined)
-- 
2.33.1

