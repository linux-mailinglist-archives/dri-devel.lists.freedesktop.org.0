Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 43ACC537B75
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 15:25:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD98310E851;
	Mon, 30 May 2022 13:25:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B85310E851
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 13:25:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6716960EE9;
 Mon, 30 May 2022 13:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A61C385B8;
 Mon, 30 May 2022 13:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653917107;
 bh=+ehzoZ1+4/6eIf04m+qPZ2eANMxYBdwQHqalydfBe80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cWBeJeGAcIH5Vom7aZ33vnn7uOSqcEoDHdP1JCizha21+kwdFBmpv/fUe6kAKD7Yt
 LbbKVMzNg9dbdZmiG69YyHkYXIWsKJpisZYGeVtN04at78fBgXfhLz+ZPzEIZcGzwX
 oiO/RR01KngI2FFXu/wEZ4mP47VzLAJcgyLmMpzimxQxOGOjxa2TQy8Oh58f02DZ1K
 nCEDUp2Z8tNdk4u81S5HESvWCFpoBX7SHh7p/AXu4t+/0wzmI6PPNPjYi2ZEOJcJLl
 HVU2QdPfXRnZUvCsKateqkPTwlpscffvQ8xX1ablK+wdyTtc2bBIheGvcfdoV38H9s
 GoovVqSR37kHw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 017/159] fbcon: Consistently protect
 deferred_takeover with console_lock()
Date: Mon, 30 May 2022 09:22:02 -0400
Message-Id: <20220530132425.1929512-17-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220530132425.1929512-1-sashal@kernel.org>
References: <20220530132425.1929512-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Du Cheng <ducheng2@gmail.com>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, deller@gmx.de,
 dri-devel@lists.freedesktop.org, geert@linux-m68k.org,
 Claudio Suarez <cssk@net-c.es>, Daniel Vetter <daniel.vetter@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniel Vetter <daniel.vetter@ffwll.ch>

[ Upstream commit 43553559121ca90965b572cf8a1d6d0fd618b449 ]

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
Link: https://patchwork.freedesktop.org/patch/msgid/20220405210335.3434130-14-daniel.vetter@ffwll.ch
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/fbcon.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 2fc1b80a26ad..9a8ae6fa6ecb 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -3265,6 +3265,9 @@ static void fbcon_register_existing_fbs(struct work_struct *work)
 
 	console_lock();
 
+	deferred_takeover = false;
+	logo_shown = FBCON_LOGO_DONTSHOW;
+
 	for_each_registered_fb(i)
 		fbcon_fb_registered(registered_fb[i]);
 
@@ -3282,8 +3285,6 @@ static int fbcon_output_notifier(struct notifier_block *nb,
 	pr_info("fbcon: Taking over console\n");
 
 	dummycon_unregister_output_notifier(&fbcon_output_nb);
-	deferred_takeover = false;
-	logo_shown = FBCON_LOGO_DONTSHOW;
 
 	/* We may get called in atomic context */
 	schedule_work(&fbcon_deferred_takeover_work);
-- 
2.35.1

