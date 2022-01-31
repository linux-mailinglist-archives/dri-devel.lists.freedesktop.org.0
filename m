Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 800874A50F4
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 22:07:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400A410E540;
	Mon, 31 Jan 2022 21:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FA3610E540
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 21:06:50 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id r7so11184966wmq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 13:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zvAncPlENd1mkArHeBkA576DDmIGdQX94f0ukCjnIXQ=;
 b=U2t8kjkQ/Vt2HJQRdamapjasWFD4c3zJbcxURpYTYrPL2cbDmMJxvxEJJMlW99DO/4
 HUhOQG+NtbaKJIqcJQ1bk77wmHdiXo6RDrFZUBjDjoYa1m3+m13Io4vvAUPU/RdXN4pI
 fBNkESnc3jQO0p8GldNWuLNg+S4Y098h1Fh7o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zvAncPlENd1mkArHeBkA576DDmIGdQX94f0ukCjnIXQ=;
 b=CUDIY8bb3FdT39nLXEHmWEfMg57hukyhHW6FhYwMZ9II63HlV1ABZw78XdnhwwAB8p
 +xboNPDM1ImnZ5qTAh9q8ZHvsYOdH7sot2Xmk599bVuaYiVZlQoA7NlVHVk1sQkMynrd
 DZioD5tlfJyE56eVferkpyPbKaUVJY5fPVdO8rozAVq44rbZ4APXU8Z3KilFyRxSCXIJ
 yTibbERZfJ6sbzjk78jWYv7TVTv0YpsDQJod3ZkgvAGRE6mU8kVkdAw4Gvi/KYbXhQH0
 jKrLOnmx4wIa3zas13c+h72lJMgrgfZmXuP8JLEtnLvh9UlWdCHZlHLwWvKXfTOc+Z5x
 gBYg==
X-Gm-Message-State: AOAM532L+MNEkZJmMorX0TYxkmfjfjSC946e+4yPEl0sgp69wdWZnIqa
 l9ZWh5lxt3hiAZXSze8H2MWIccjnHB63mQ==
X-Google-Smtp-Source: ABdhPJw4OlP2ZiGsyZ53C2rKU+S/VlUSh/yp+iwZxn0Bz//sDKkThBEktGnYMjV7P/SFzkmcbMEHWA==
X-Received: by 2002:a05:600c:19d0:: with SMTP id
 u16mr28683628wmq.35.1643663208709; 
 Mon, 31 Jan 2022 13:06:48 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id b11sm314961wmq.46.2022.01.31.13.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 13:06:48 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 15/21] fbcon: Consistently protect deferred_takeover with
 console_lock()
Date: Mon, 31 Jan 2022 22:05:46 +0100
Message-Id: <20220131210552.482606-16-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
References: <20220131210552.482606-1-daniel.vetter@ffwll.ch>
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
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This shouldn't be a problem in practice since until we've actually
taken over the console there's nothing we've registered with the
console/vt subsystem, so the exit/unbind path that check this can't
do the wrong thing. But it's confusing, so fix it by moving it a tad
later.

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
index 496bc5f2133e..11b9f962af6f 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3247,6 +3247,9 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
 
 	console_lock();
 
+	deferred_takeover = false;
+	logo_shown = FBCON_LOGO_DONTSHOW;
+
 	for_each_registered_fb(i)
 		fbcon_fb_registered(registered_fb[i]);
 
@@ -3264,8 +3267,6 @@ static int fbcon_output_notifier(struct notifier_block *nb,
 	pr_info("fbcon: Taking over console\n");
 
 	dummycon_unregister_output_notifier(&fbcon_output_nb);
-	deferred_takeover = false;
-	logo_shown = FBCON_LOGO_DONTSHOW;
 
 	/* We may get called in atomic context */
 	schedule_work(&fbcon_deferred_takeover_work);
-- 
2.33.0

