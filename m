Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0BB29ECC5
	for <lists+dri-devel@lfdr.de>; Thu, 29 Oct 2020 14:22:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A06826ECCB;
	Thu, 29 Oct 2020 13:22:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2593E6ECCA
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 13:22:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id k10so1414243wrw.13
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Oct 2020 06:22:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Un1VALpiFe636eSWIbZOWUYJR1lVi9/ZVvvMHcazUik=;
 b=RaQHSmYDt+iwmPWtcYIGHPXslh9PDDrYrYxv4rnzxIpZ1b90PMDQviNSuEK44MpSgE
 tdOCOAI/tbkOa/f95VlD4GEcG6f0pKoc4MLmkeT2rKQjDgIwevMN8rmTWyojD3uWomha
 ProO2sL3uwuJJpgjBic8Wr7e8FR73yEiIU9n4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Un1VALpiFe636eSWIbZOWUYJR1lVi9/ZVvvMHcazUik=;
 b=eyNFUfLV8SpQmPpxX0aeFAFkKiIFv5CANdJBZt7cBSAB82qvoFnhS/BvVC7Eh8U0Uc
 WzhFNAGfKJGiV0QPcmtpHn8Am2qU7QJLnM93c89KC52nunQv3CQu8+P62BsrrW/XRIgJ
 BcLRdCrdO0TaMmrtuo9Xgc5HMCk2RrXo02joicYQpce1NLQQY6crJRPJVcAcmWp1K61Y
 DefWDMu3kldVTit5VnQCWDKCRloLh8uy4iD0hxOj9zNdZ91lPPYdTOZq+lwcSn+n3gxG
 +hkGVhO4e6VAxXncB1qJXUWygVTxRn9FxDdjzDzNYHpkbs3PdyiBNK5QUhmThWeBCfWi
 XsNg==
X-Gm-Message-State: AOAM533WyNV0EpdVnPYpcngxZueZth89l6mSXni0FTz4uzvLCF15nr6S
 XC7lsnGDG8eFPvcPADukJ7C472C+zINWJImg
X-Google-Smtp-Source: ABdhPJxRLoeRWo1mpUX+JQtEX0fOdyhM4e8mVfxODr7dHm/4SG6ovXxiaEiPj0MvNHn85fFvEYcRCA==
X-Received: by 2002:adf:c101:: with SMTP id r1mr5372656wre.87.1603977758427;
 Thu, 29 Oct 2020 06:22:38 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v19sm4282418wmj.31.2020.10.29.06.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 06:22:37 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] fbcon: Disable accelerated scrolling
Date: Thu, 29 Oct 2020 14:22:29 +0100
Message-Id: <20201029132229.4068359-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
References: <20201029101428.4058311-1-daniel.vetter@ffwll.ch>
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
Cc: George Kennedy <george.kennedy@oracle.com>, Sam Ravnborg <sam@ravnborg.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Rosin <peda@axentia.se>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, Ben Skeggs <bskeggs@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, nouveau@lists.freedesktop.org,
 Daniel Vetter <daniel.vetter@intel.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

So ever since syzbot discovered fbcon, we have solid proof that it's
full of bugs. And often the solution is to just delete code and remove
features, e.g.  50145474f6ef ("fbcon: remove soft scrollback code").

Now the problem is that most modern-ish drivers really only treat
fbcon as an dumb kernel console until userspace takes over, and Oops
printer for some emergencies. Looking at drm drivers and the basic
vesa/efi fbdev drivers shows that only 3 drivers support any kind of
acceleration:

- nouveau, seems to be enabled by default
- omapdrm, when a DMM remapper exists using remapper rewriting for
  y/xpanning
- gma500, but that is getting deleted now for the GTT remapper trick,
  and the accelerated copyarea never set the FBINFO_HWACCEL_COPYAREA
  flag, so unused (and could be deleted already I think).

No other driver supportes accelerated fbcon. And fbcon is the only
user of this accel code (it's not exposed as uapi through ioctls),
which means we could garbage collect fairly enormous amounts of code
if we kill this.

Plus because syzbot only runs on virtual hardware, and none of the
drivers for that have acceleration, we'd remove a huge gap in testing.
And there's no other even remotely comprehensive testing aside from
syzbot.

This patch here just disables the acceleration code by always
redrawing when scrolling. The plan is that once this has been merged
for well over a year in released kernels, we can start to go around
and delete a lot of code.

v2:
- Drop a few more unused local variables, somehow I missed the
compiler warnings (Sam)
- Fix typo in comment (Jiri)
- add a todo entry for the cleanup (Thomas)

v3: Remove more unused variables (0day)

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Jiri Slaby <jirislaby@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Peilin Ye <yepeilin.cs@gmail.com>
Cc: George Kennedy <george.kennedy@oracle.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>
Cc: Peter Rosin <peda@axentia.se>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 Documentation/gpu/todo.rst       | 18 +++++++++++++
 drivers/video/fbdev/core/fbcon.c | 45 ++++++--------------------------
 2 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 6b224ef14455..bec99341a904 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -277,6 +277,24 @@ Contact: Daniel Vetter, Noralf Tronnes
 
 Level: Advanced
 
+Garbage collect fbdev scrolling acceleration
+--------------------------------------------
+
+Scroll acceleration is disabled in fbcon by hard-wiring p->scrollmode =
+SCROLL_REDRAW. There's a ton of code this will allow us to remove:
+- lots of code in fbcon.c
+- a bunch of the hooks in fbcon_ops, maybe the remaining hooks could be called
+  directly instead of the function table (with a switch on p->rotate)
+- fb_copyarea is unused after this, and can be deleted from all drivers
+
+Note that not all acceleration code can be deleted, since clearing and cursor
+support is still accelerated, which might be good candidates for further
+deletion projects.
+
+Contact: Daniel Vetter
+
+Level: Intermediate
+
 idr_init_base()
 ---------------
 
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cef437817b0d..8d1ae973041a 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1033,7 +1033,7 @@ static void fbcon_init(struct vc_data *vc, int init)
 	struct vc_data *svc = *default_mode;
 	struct fbcon_display *t, *p = &fb_display[vc->vc_num];
 	int logo = 1, new_rows, new_cols, rows, cols, charcnt = 256;
-	int cap, ret;
+	int ret;
 
 	if (WARN_ON(info_idx == -1))
 	    return;
@@ -1042,7 +1042,6 @@ static void fbcon_init(struct vc_data *vc, int init)
 		con2fb_map[vc->vc_num] = info_idx;
 
 	info = registered_fb[con2fb_map[vc->vc_num]];
-	cap = info->flags;
 
 	if (logo_shown < 0 && console_loglevel <= CONSOLE_LOGLEVEL_QUIET)
 		logo_shown = FBCON_LOGO_DONTSHOW;
@@ -1147,11 +1146,13 @@ static void fbcon_init(struct vc_data *vc, int init)
 
 	ops->graphics = 0;
 
-	if ((cap & FBINFO_HWACCEL_COPYAREA) &&
-	    !(cap & FBINFO_HWACCEL_DISABLED))
-		p->scrollmode = SCROLL_MOVE;
-	else /* default to something safe */
-		p->scrollmode = SCROLL_REDRAW;
+	/*
+	 * No more hw acceleration for fbcon.
+	 *
+	 * FIXME: Garbage collect all the now dead code after sufficient time
+	 * has passed.
+	 */
+	p->scrollmode = SCROLL_REDRAW;
 
 	/*
 	 *  ++guenther: console.c:vc_allocate() relies on initializing
@@ -1961,45 +1962,15 @@ static void updatescrollmode(struct fbcon_display *p,
 {
 	struct fbcon_ops *ops = info->fbcon_par;
 	int fh = vc->vc_font.height;
-	int cap = info->flags;
-	u16 t = 0;
-	int ypan = FBCON_SWAP(ops->rotate, info->fix.ypanstep,
-				  info->fix.xpanstep);
-	int ywrap = FBCON_SWAP(ops->rotate, info->fix.ywrapstep, t);
 	int yres = FBCON_SWAP(ops->rotate, info->var.yres, info->var.xres);
 	int vyres = FBCON_SWAP(ops->rotate, info->var.yres_virtual,
 				   info->var.xres_virtual);
-	int good_pan = (cap & FBINFO_HWACCEL_YPAN) &&
-		divides(ypan, vc->vc_font.height) && vyres > yres;
-	int good_wrap = (cap & FBINFO_HWACCEL_YWRAP) &&
-		divides(ywrap, vc->vc_font.height) &&
-		divides(vc->vc_font.height, vyres) &&
-		divides(vc->vc_font.height, yres);
-	int reading_fast = cap & FBINFO_READS_FAST;
-	int fast_copyarea = (cap & FBINFO_HWACCEL_COPYAREA) &&
-		!(cap & FBINFO_HWACCEL_DISABLED);
-	int fast_imageblit = (cap & FBINFO_HWACCEL_IMAGEBLIT) &&
-		!(cap & FBINFO_HWACCEL_DISABLED);
 
 	p->vrows = vyres/fh;
 	if (yres > (fh * (vc->vc_rows + 1)))
 		p->vrows -= (yres - (fh * vc->vc_rows)) / fh;
 	if ((yres % fh) && (vyres % fh < yres % fh))
 		p->vrows--;
-
-	if (good_wrap || good_pan) {
-		if (reading_fast || fast_copyarea)
-			p->scrollmode = good_wrap ?
-				SCROLL_WRAP_MOVE : SCROLL_PAN_MOVE;
-		else
-			p->scrollmode = good_wrap ? SCROLL_REDRAW :
-				SCROLL_PAN_REDRAW;
-	} else {
-		if (reading_fast || (fast_copyarea && !fast_imageblit))
-			p->scrollmode = SCROLL_MOVE;
-		else
-			p->scrollmode = SCROLL_REDRAW;
-	}
 }
 
 #define PITCH(w) (((w) + 7) >> 3)
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
