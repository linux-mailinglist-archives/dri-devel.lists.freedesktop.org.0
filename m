Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C5421A7CE
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 21:30:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D626EB0C;
	Thu,  9 Jul 2020 19:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FF76EB0C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 19:30:39 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id e8so3751611ljb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jul 2020 12:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Jq4E/3rvV7KMO7dnkDeaICQG0J18bgcJJkGEr8cliCQ=;
 b=nUPBsopJi4SQMI1HOnfAi03AqeWpHc982j5ijzne1TK6J9vIRsfZN6uXs5pUoI6KKs
 H4p2jFGTksvLw6PH/l3Lsux03jz+rykq8ktkFTZAL6UAVx8xSvgErpImqcamD1wu4XGz
 qGWIFYbKRxw9HBbuHjZVgyMWV6DYufSwtOStjHerqoIzId+Xo8SK5IGps4JCBZPvO0VC
 S6W92i+IdBxnX8R5vFj8LzA5X0EkQWPl3rVOsKEbtNxFiTDjW96i4DEjehrkXtb7SpAI
 hHJaem0VmRjhhdGMLtcTKIn59MEo6VsCja2kPwsLoEgxCWmb9WDf9OkKA0heaQS2CFmk
 pRyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Jq4E/3rvV7KMO7dnkDeaICQG0J18bgcJJkGEr8cliCQ=;
 b=lRCTCQbHkPDo4+XTbzqUR6fPUINU6qLHRw0VVMZXfiJeCHFx0mCwf7zhKhABmVLyv1
 +oybSrTKg7CqzBeOa5QeR6COKJy3cxaE2+S0QXPO6XP8ZpSutwnfjkD8FBMOxF29uihm
 /PbzOeJoLdOkVwJy8o+zjJ7PjoGKYFAWEKGZoFal/8mO1u5bUu9H/J9f72giLxrTZH7a
 HoqFJloOlnOsCQmSO+3m+Sl56vC7qTILeyh2vCVSFZNskSR0pLZsg0fUwzqZjLNj+quq
 GJd81Nia4C7YCkzG1oBzTfFGvTF4ewC5zFzf0vscptjH522cpu/ZFPfbHNcATh3oFsUW
 HAzA==
X-Gm-Message-State: AOAM530D03TUTVua0yDJK2Q9JyQ5HiV16ru9/X+NaWFlQ72joy7HY0gK
 zV9+uUR6ztzYKjov14/+ImhH6P1U6Ug=
X-Google-Smtp-Source: ABdhPJwu68v/orHpVsAMsxR03Yip4FCqvb0vHr1in/xp8Df72HTrHOY0JidOMSr+sJoY8WZ291/kiw==
X-Received: by 2002:a2e:730c:: with SMTP id o12mr31664193ljc.165.1594323037518; 
 Thu, 09 Jul 2020 12:30:37 -0700 (PDT)
Received: from saturn.lan ([2a00:fd00:805f:db00:69d0:5d3c:ff19:c08c])
 by smtp.gmail.com with ESMTPSA id q3sm791771ljm.22.2020.07.09.12.30.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 12:30:36 -0700 (PDT)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/drm_fb_helper: fix fbdev with sparc64
Date: Thu,  9 Jul 2020 21:30:16 +0200
Message-Id: <20200709193016.291267-1-sam@ravnborg.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 sparclinux@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark reported that sparc64 would panic while booting using qemu.
Mark bisected this to a patch that introduced generic fbdev emulation to
the bochs DRM driver.
Mark pointed out that a similar bug was fixed before where
the sys helpers was replaced by cfb helpers.

The culprint here is that the framebuffer reside in IO memory which
requires SPARC ASI_PHYS (physical) loads and stores.

The current bohcs DRM driver uses a shadow buffer.
So all copying to the framebuffer happens in
drm_fb_helper_dirty_blit_real().

The fix is to replace the memcpy with memcpy_toio() from io.h.

memcpy_toio() uses writeb() where the original fbdev code
used sbus_memcpy_toio(). The latter uses sbus_writeb().

The difference between writeb() and sbus_memcpy_toio() is
that writeb() writes bytes in little-endian, where sbus_writeb() writes
bytes in big-endian. As endian does not matter for byte writes they are
the same. So we can safely use memcpy_toio() here.

For many architectures memcpy_toio() is a simple memcpy().
One sideeffect that is unknow is if this has any impact on other
architectures.
So far the analysis tells that this change is OK for other arch's.
but testing would be good.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: sparclinux@vger.kernel.org
---
 drivers/gpu/drm/drm_fb_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 5609e164805f..4d05b0ab1592 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -399,7 +399,7 @@ static void drm_fb_helper_dirty_blit_real(struct drm_fb_helper *fb_helper,
 	unsigned int y;
 
 	for (y = clip->y1; y < clip->y2; y++) {
-		memcpy(dst, src, len);
+		memcpy_toio(dst, src, len);
 		src += fb->pitches[0];
 		dst += fb->pitches[0];
 	}
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
