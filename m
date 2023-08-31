Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BFA78F4A1
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 23:33:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A959D10E321;
	Thu, 31 Aug 2023 21:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 594 seconds by postgrey-1.36 at gabe;
 Thu, 31 Aug 2023 21:33:28 UTC
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BD1810E321
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 21:33:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 72665B823CF;
 Thu, 31 Aug 2023 21:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F1DC433C8;
 Thu, 31 Aug 2023 21:23:28 +0000 (UTC)
Date: Thu, 31 Aug 2023 23:23:26 +0200
From: Helge Deller <deller@gmx.de>
To: Nick Desaulniers <ndesaulniers@google.com>, linux-fbdev@vger.kernel.org,
 dri-devel <dri-devel@lists.freedesktop.org>,
 clang-built-linux <llvm@lists.linux.dev>,
 LKML <linux-kernel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nathan Chancellor <nathan@kernel.org>
Subject: Re: truncation in drivers/video/fbdev/neofb.c
Message-ID: <ZPEEzkQcQOP9yVFF@ls3530>
References: <CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com>
 <9d2bb495-0c1d-0d1b-96ea-4b1110d45b79@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d2bb495-0c1d-0d1b-96ea-4b1110d45b79@gmx.de>
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

* Helge Deller <deller@gmx.de>:
> On 8/29/23 18:45, Nick Desaulniers wrote:
> > A recent change in clang made it better about spotting snprintf that
> > will result in truncation.  Nathan reported the following instances:
> > 
> > drivers/video/fbdev/neofb.c:1959:3: warning: 'snprintf' will always be
> > truncated; specified size is 16, but format string expands to at least
> > 17 [-Wfortify-source]

FYI, I've added the patch below to the fbdev for-next git tree.

Helge

From: Helge Deller <deller@gmx.de>
Subject: [PATCH] fbdev: neofb: Shorten Neomagic product name in info struct

Avoid those compiler warnings:
neofb.c:1959:3: warning: 'snprintf' will always be truncated;
   specified size is 16, but format string expands to at least 17 [-Wfortify-source]

Signed-off-by: Helge Deller <deller@gmx.de>
Reported-by: Nathan Chancellor <nathan@kernel.org>
Reported-by: Nick Desaulniers <ndesaulniers@google.com>
Link: https://lore.kernel.org/all/CAKwvOdn0xoVWjQ6ufM_rojtKb0f1i1hW-J_xYGfKDNFdHwaeHQ@mail.gmail.com/
Link: https://github.com/ClangBuiltLinux/linux/issues/1923

diff --git a/drivers/video/fbdev/neofb.c b/drivers/video/fbdev/neofb.c
index d2f622b4c372..b905fe93b525 100644
--- a/drivers/video/fbdev/neofb.c
+++ b/drivers/video/fbdev/neofb.c
@@ -1948,49 +1948,40 @@ static struct fb_info *neo_alloc_fb_info(struct pci_dev *dev,
 
 	switch (info->fix.accel) {
 	case FB_ACCEL_NEOMAGIC_NM2070:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128");
+		strscpy(info->fix.id, "MagicGraph128", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2090:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128V");
+		strscpy(info->fix.id, "MagicGraph128V", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2093:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128ZV");
+		strscpy(info->fix.id, "MagicGraph128ZV", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2097:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128ZV+");
+		strscpy(info->fix.id, "Mag.Graph128ZV+", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2160:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 128XD");
+		strscpy(info->fix.id, "MagicGraph128XD", sizeof(info->fix.id));
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2200:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256AV");
+		strscpy(info->fix.id, "MagicGraph256AV", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2230:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256AV+");
+		strscpy(info->fix.id, "MagicGraph256AV+", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2360:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256ZX");
+		strscpy(info->fix.id, "MagicGraph256ZX", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
 		break;
 	case FB_ACCEL_NEOMAGIC_NM2380:
-		snprintf(info->fix.id, sizeof(info->fix.id),
-				"MagicGraph 256XL+");
+		strscpy(info->fix.id, "MagicGraph256XL+", sizeof(info->fix.id));
 		info->flags |= FBINFO_HWACCEL_IMAGEBLIT |
 		               FBINFO_HWACCEL_COPYAREA |
                 	       FBINFO_HWACCEL_FILLRECT;
