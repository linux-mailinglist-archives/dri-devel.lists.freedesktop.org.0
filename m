Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA793F54A1
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 02:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477CE89E43;
	Tue, 24 Aug 2021 00:55:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7FE89DC7
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 00:55:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDF8B615E1;
 Tue, 24 Aug 2021 00:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766507;
 bh=thmN39DdoxQpsvAKeQo/Rb4xDIfOQHTjYfOikOUmUL4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c4yLHgGZjyBBnTufhIybevzmSO+NYtcfJOAzLa5e9XaS723UUnIbpNR4cHnRxqXmi
 fjPM1F8XlJ1vShZU7HCxARQBXF7GiCanjfJ8cWMqbdDB262Vt5zIcwvmp3cLnlu7B7
 3nV/xumqwLTbHdy5to8oFKDnwaSNWqVWN2WuBdLRMDT5KBGZCyqKw0eEJ30hz45Q10
 Bi8wHdJx2RH8nfgRfg11zH14TOclkxFcSneKocdRXGZ/yTTwQGplhE1kRpk0gzf6Kl
 SP3cZFnKWMdA0+gc55+AmTl3NgGexnrrnJ+kD0gX47sf57wk2HaNFy6aibDuS5il7F
 +KKCnLlH7ldEQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.4 07/10] drm: Copy drm_wait_vblank to user before
 returning
Date: Mon, 23 Aug 2021 20:54:54 -0400
Message-Id: <20210824005458.631377-7-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005458.631377-1-sashal@kernel.org>
References: <20210824005458.631377-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[ Upstream commit fa0b1ef5f7a694f48e00804a391245f3471aa155 ]

[Why]
Userspace should get back a copy of drm_wait_vblank that's been modified
even when drm_wait_vblank_ioctl returns a failure.

Rationale:
drm_wait_vblank_ioctl modifies the request and expects the user to read
it back. When the type is RELATIVE, it modifies it to ABSOLUTE and updates
the sequence to become current_vblank_count + sequence (which was
RELATIVE), but now it became ABSOLUTE.
drmWaitVBlank (in libdrm) expects this to be the case as it modifies
the request to be Absolute so it expects the sequence to would have been
updated.

The change is in compat_drm_wait_vblank, which is called by
drm_compat_ioctl. This change of copying the data back regardless of the
return number makes it en par with drm_ioctl, which always copies the
data before returning.

[How]
Return from the function after everything has been copied to user.

Fixes IGT:kms_flip::modeset-vs-vblank-race-interruptible
Tested on ChromeOS Trogdor(msm)

Reviewed-by: Michel Dänzer <mdaenzer@redhat.com>
Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
Link: https://patchwork.freedesktop.org/patch/msgid/20210812194917.1703356-1-markyacoub@chromium.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/drm_ioc32.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index 2cf053fb8d54..1c691bdb8914 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -863,8 +863,6 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
 	req.request.sequence = req32.request.sequence;
 	req.request.signal = req32.request.signal;
 	err = drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, DRM_UNLOCKED);
-	if (err)
-		return err;
 
 	req32.reply.type = req.reply.type;
 	req32.reply.sequence = req.reply.sequence;
@@ -873,7 +871,7 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
 	if (copy_to_user(argp, &req32, sizeof(req32)))
 		return -EFAULT;
 
-	return 0;
+	return err;
 }
 
 #if defined(CONFIG_X86)
-- 
2.30.2

