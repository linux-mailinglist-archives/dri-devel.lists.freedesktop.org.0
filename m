Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A433A3F5464
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 02:55:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D6889D7D;
	Tue, 24 Aug 2021 00:54:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE44989D63
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Aug 2021 00:54:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 96F65613D2;
 Tue, 24 Aug 2021 00:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629766491;
 bh=eD7Mh7yKFLunROXvwGmWc4qE4Yk8kegCJ1S1t0zEyFY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zakvw4ZXJZXFjK9Tv54Zy4hcQ54nPlnj1k0EGL20Eg5OepfhSA+qQk4YFfqxgYBsq
 W4PxU0RHd3IrWUVji85RRJBHom1poAv1QrDVQEqOH0fhlPpLwbzzp50JKDUxuq3Sjy
 SP5zvvl4SNQ/vzCfzs9k2uGjmmaxrUs6b1ZMmBTBP8CeNUh+D3DSnWkQmAaQdUuGMZ
 e3XmKSbTPAQr35EP9Wg9yDH7htznmw09LbT7etNRDKAnAyJV5AIIJApgSo0Dot7bfX
 L/K5DVTZXfPMeZBlGZmAzxMHtVB4RlWnZH/2VxsagKKY8mqm55uuR/u0CcgwOusrqS
 yDnMSCfU8lrsA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Mark Yacoub <markyacoub@google.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Mark Yacoub <markyacoub@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 5.10 14/18] drm: Copy drm_wait_vblank to user before
 returning
Date: Mon, 23 Aug 2021 20:54:28 -0400
Message-Id: <20210824005432.631154-14-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210824005432.631154-1-sashal@kernel.org>
References: <20210824005432.631154-1-sashal@kernel.org>
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
index dc734d4828a1..aaf8d625ce1a 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -865,8 +865,6 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
 	req.request.sequence = req32.request.sequence;
 	req.request.signal = req32.request.signal;
 	err = drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, DRM_UNLOCKED);
-	if (err)
-		return err;
 
 	req32.reply.type = req.reply.type;
 	req32.reply.sequence = req.reply.sequence;
@@ -875,7 +873,7 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
 	if (copy_to_user(argp, &req32, sizeof(req32)))
 		return -EFAULT;
 
-	return 0;
+	return err;
 }
 
 #if defined(CONFIG_X86)
-- 
2.30.2

