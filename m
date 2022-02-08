Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD9F4AE2EF
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 22:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93FD510E2FF;
	Tue,  8 Feb 2022 21:09:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F88310E5D7
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 21:08:53 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id w11so600996wra.4
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 13:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ox4yXC0LP8o2wCPaioNRgnQjoBr7m6vhS+hT+ChhFWw=;
 b=S5BqVNPSpXHrqviuw3HJUVHCNuXrwfZETQgddkSqec9Q51qTu/X1Dy3DHTTT/LagCc
 TdfBUwokFJF0o/5jKLoZI4jM9BwZ4q0H1RYvw+h1/Ibn+wlkQIVyJ99QoReMwJFgFFyb
 hL6uv3nX42Ve284n0fZhP+uQl2c3CEhq0yFcA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ox4yXC0LP8o2wCPaioNRgnQjoBr7m6vhS+hT+ChhFWw=;
 b=fIdoE0b0RvnvjEbRahRsHAw+hF/ZVF/MDfArxVxCF+v0HPa9E9EwHO0T/i7eqRsC26
 lPWyiEdqSK3AA6trbBXt/MLGTuspJE3zUVzz4W+PnLVFrJWrvgAIZQaFEhumyD+qj8Wk
 CYGVHYtXIFi2AISD2ML8vupu1GXdnF9QDgrVww6lUPta+hBBytweRSiPW7llqoqRNjKK
 g5DAdA2rirgwO6IHLGIpbvk0Di8VhOIR5YrhzwCACfF+Q+pHhSDeh94HwOHZbXc6561U
 rP+vrrd3X1R1fPXOHqhf7oEY4u10KzIe+Z6bqB9kuTOwbowT2M2/4Oq5NjjVYi7Kkeav
 TlEw==
X-Gm-Message-State: AOAM532btuGzhZL9BXkIkGZtOZekbUwcxz+3bA8AIqriCyWpOFWqHQYY
 9ZQYwL4WwgQ7+jM8q5/mkIZ77cn5lGG4MA==
X-Google-Smtp-Source: ABdhPJz+CmlVndGXlugGb0ahxfiZBUSbHrx3Tg5Zrm6dge27t3XQoa5XtM7kt+nVAKioCX2KEMo9QQ==
X-Received: by 2002:a5d:4c41:: with SMTP id n1mr4989076wrt.128.1644354531674; 
 Tue, 08 Feb 2022 13:08:51 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id o14sm3033561wmr.3.2022.02.08.13.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 13:08:50 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 13/19] fbcon: Consistently protect deferred_takeover with
 console_lock()
Date: Tue,  8 Feb 2022 22:08:18 +0100
Message-Id: <20220208210824.2238981-14-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
References: <20220208210824.2238981-1-daniel.vetter@ffwll.ch>
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
Cc: linux-fbdev@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Claudio Suarez <cssk@net-c.es>,
 Daniel Vetter <daniel.vetter@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This shouldn't be a problem in practice since until we've actually
taken over the console there's nothing we've registered with the
console/vt subsystem, so the exit/unbind path that check this can't
do the wrong thing. But it's confusing, so fix it by moving it a tad
later.

Acked-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Du Cheng <ducheng2@gmail.com>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Cc: Claudio Suarez <cssk@net-c.es>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/core/fbcon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index cc960bf49991..4f9752ee9189 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3227,6 +3227,9 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
 
 	console_lock();
 
+	deferred_takeover = false;
+	logo_shown = FBCON_LOGO_DONTSHOW;
+
 	for_each_registered_fb(i)
 		fbcon_fb_registered(registered_fb[i]);
 
@@ -3244,8 +3247,6 @@ static int fbcon_output_notifier(struct notifier_block *nb,
 	pr_info("fbcon: Taking over console\n");
 
 	dummycon_unregister_output_notifier(&fbcon_output_nb);
-	deferred_takeover = false;
-	logo_shown = FBCON_LOGO_DONTSHOW;
 
 	/* We may get called in atomic context */
 	schedule_work(&fbcon_deferred_takeover_work);
-- 
2.34.1

