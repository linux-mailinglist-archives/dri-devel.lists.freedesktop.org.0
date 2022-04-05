Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B304F3F7A
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 23:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCA710EEBB;
	Tue,  5 Apr 2022 21:03:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A8E10E45C
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Apr 2022 21:03:47 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u3so345291wrg.3
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Apr 2022 14:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S29FSv+eJmyfJZoRTSJV+EXfojUyv63fbNJUk83A8l4=;
 b=UcmJZz+GdrJa50pViHrkFerhwvD7gGcRiaUWKIh+7CJ//iivU/zOabv5EDihe+u97v
 zftjnRwS64/gA8vF8MxDGA4q32lLHlzkqgGRUSx9Gji9LVOZ/oyE4fJIvSj2QY8xTINe
 ErryP5yF/OE1GSZ14ozgdimkPWc5oekHLa3y4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S29FSv+eJmyfJZoRTSJV+EXfojUyv63fbNJUk83A8l4=;
 b=dp4jUvD7N3IqAfAm8c9TCHQEsM8MErbnXA6FePlk7QTMp38APi9GP2LQTl6Ev4g9dB
 VL6xDNCdB6Xpuv22Df730yQF0oqUljt/Y4hNR8cHS4tXDfBjZr97DJ+ehL4qlGoNEno5
 kMk94LgzMv8VMH9cTrsTTOi2NS/1i0aoB6lnRflMgNGmEHJR87zTocuOZMKfw5JTcv8J
 ysG4d+kvSGAosis8yCW+8gCtoxU5kbmRmpPyEkDrI4jVg5ko0p574Lny1+utnQSge+rI
 ACyrevjIkpYwlOOjRM3r1GsJ+K3YiLBGMgatpVPRqt/Vb7FRUo/tuAZj89l9fnfDt5YO
 JvIg==
X-Gm-Message-State: AOAM532/oDZXMboK1diVYB2N8+QP5dNx+zKLktYcFz5tF5T5qKR8vECl
 pZZWu7sjTXuWeEAEURbNGS01EHI0o+NKTaIe+xI=
X-Google-Smtp-Source: ABdhPJzMFRNMpzjLDMGxxPchoGpe4381w9RkfcqqeSoBFDcTbhpVSgcvzzpGP5oLTb8Z65Qsl91Xpg==
X-Received: by 2002:adf:c10b:0:b0:1ed:c40f:7f91 with SMTP id
 r11-20020adfc10b000000b001edc40f7f91mr4063615wre.276.1649192625481; 
 Tue, 05 Apr 2022 14:03:45 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 az19-20020a05600c601300b0038cadf3aa69sm4858569wmb.36.2022.04.05.14.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 14:03:45 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v3 04/17] fbcon: delete delayed loading code
Date: Tue,  5 Apr 2022 23:03:22 +0200
Message-Id: <20220405210335.3434130-5-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
References: <20220405210335.3434130-1-daniel.vetter@ffwll.ch>
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
Cc: Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Claudio Suarez <cssk@net-c.es>, Thomas Zimmermann <tzimmermann@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Helge Deller <deller@gmx.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Before

commit 6104c37094e729f3d4ce65797002112735d49cd1
Author: Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Tue Aug 1 17:32:07 2017 +0200

    fbcon: Make fbcon a built-time depency for fbdev

it was possible to load fbcon and fbdev drivers in any order, which
means that fbcon init had to handle the case where fbdev drivers where
already registered.

This is no longer possible, hence delete that code.

Note that the exit case is a bit more complex and will be done in a
separate patch.

Since I had to audit the entire fbcon load code I also spotted a wrong
function name in a comment in fbcon_startup(), which this patch also
fixes.

v2: Explain why we also fix the comment (Sam)

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Du Cheng <ducheng2@gmail.com>
---
 drivers/video/fbdev/core/fbcon.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index b75e638cb83d..83f0223f5333 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -944,7 +944,7 @@ static const char *fbcon_startup(void)
 		return display_desc;
 	/*
 	 * Instead of blindly using registered_fb[0], we use info_idx, set by
-	 * fb_console_init();
+	 * fbcon_fb_registered();
 	 */
 	info = registered_fb[info_idx];
 	if (!info)
@@ -3299,17 +3299,6 @@ static void fbcon_start(void)
 		return;
 	}
 #endif
-
-	if (num_registered_fb) {
-		int i;
-
-		for_each_registered_fb(i) {
-			info_idx = i;
-			break;
-		}
-
-		do_fbcon_takeover(0);
-	}
 }
 
 static void fbcon_exit(void)
-- 
2.34.1

