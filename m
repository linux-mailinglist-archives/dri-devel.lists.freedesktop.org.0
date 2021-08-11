Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B07C33E971F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 19:55:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AFF5896ED;
	Wed, 11 Aug 2021 17:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB94E896ED
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 17:55:30 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id bl13so1605860qvb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 10:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UBSfdzuf86UwC0KLjgG7VaVWu7uNU9511WDLsb+xbb4=;
 b=czX51fZuMrGz3z0G+Y6miA1NOGclNGSAmWv7sw+g//pnRRq3Ap3biQ3by5z4QMKi0k
 SSHonz+oiQLyALt/9XC7O0LC9y9c8NgZgj5W0AFUe+gh6Ev02QZGBipthvqDjSTm6v5l
 RhoKYmSdjta17JIVJOs+uXC3cQ+tAHtqDo+0s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UBSfdzuf86UwC0KLjgG7VaVWu7uNU9511WDLsb+xbb4=;
 b=ed9Wlfxwx9ujM5+WGzKGOo5iUPqHZEdssYtXomA2NoKXFkrbypuyx+BsJgzVAWWfeE
 c7Hq8khy02RJGmmll5K3CGsUsA1UW6iUriuQCSEz1Ke9pyjm0l3bnH4fev2irTvTFvef
 RxuXYfCKH9j+Wemy1iS+q2CJvG4xDJ/yYiBGvWQch8XK2zXne0ns0ZgTTccoxg9O4L74
 c099ztqA1jDhLTetoS6l6AkWpuInTvfOvuaRC6lYLtg+cdhLnEoLmlVSLrPQrrEaL5Fj
 SjwgZu/bwWyDxgIwtpa1Wwc9gCESMdV6MqDbfdgqCnySVtLHts3/pxpJFs1hRDC6g/V+
 nJNA==
X-Gm-Message-State: AOAM532s8WUrTsdGG6p2VW8P65bRccrSNxxoYZ5+3XFr/l22YINVgZdH
 3wGCAlrToBOAspdNDKDugl14Hg==
X-Google-Smtp-Source: ABdhPJwLTkj8oC9xCS2JhFmBoMoUWB0LsiHewNZAnE6RZY/ZS+tb0zWFgfDkyLtp+1iYpcJocFOCxw==
X-Received: by 2002:a05:6214:c6d:: with SMTP id
 t13mr24447956qvj.22.1628704530027; 
 Wed, 11 Aug 2021 10:55:30 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:416:dbca:c030:2b4a:66b4])
 by smtp.gmail.com with ESMTPSA id k66sm2603574qke.43.2021.08.11.10.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Aug 2021 10:55:29 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: seanpaul@chromium.org, abhinavk@codeaurora.org, robdclark@chromium.org,
 irlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: Mark Yacoub <markyacoub@google.com>, Mark Yacoub <markyacoub@chromium.org>
Subject: [PATCH] drm: Copy drm_wait_vblank request and copy_to_user before
 return.
Date: Wed, 11 Aug 2021 13:55:25 -0400
Message-Id: <20210811175525.2125964-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Yacoub <markyacoub@google.com>

[Why]
Userspace should get back a copy of the request that's been modified
even when drm_wait_vblank_ioctl returns a failure.

Rationale:
drm_wait_vblank_ioctl modifies the request and expects the user to read
back. When the type is RELATIVE, it modifies it to ABSOLUTE and updates
the sequence to become current_vblank_count + sequence (which was
relative), not it becomes absolute.
drmWaitVBlank (in libdrm), expects this to be the case as it modifies
the request to be Absolute as it expects the sequence to would have been
updated.

The change is in compat_drm_wait_vblank, which is called by
drm_compat_ioctl. This change of copying the data back regardless of the
return number makes it en par with drm_ioctl, which always copies the
data before returning.

[How]
Copy the drm_wait_vblank request.
Return from the function after everything has been copied to user.

Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
Tested on ChromeOS Trogdor(msm)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
---
 drivers/gpu/drm/drm_ioc32.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index d29907955ff79..275b860df8fbe 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -855,17 +855,19 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
 	req.request.sequence = req32.request.sequence;
 	req.request.signal = req32.request.signal;
 	err = drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, DRM_UNLOCKED);
-	if (err)
-		return err;
 
 	req32.reply.type = req.reply.type;
 	req32.reply.sequence = req.reply.sequence;
 	req32.reply.tval_sec = req.reply.tval_sec;
 	req32.reply.tval_usec = req.reply.tval_usec;
+	/* drm_wait_vblank_ioctl modifies Request, update their values here as well. */
+	req32.request.type = req.request.type;
+	req32.request.sequence = req.request.sequence;
+	req32.request.signal = req.request.signal;
 	if (copy_to_user(argp, &req32, sizeof(req32)))
 		return -EFAULT;
 
-	return 0;
+	return err;
 }
 
 #if defined(CONFIG_X86)
-- 
2.33.0.rc1.237.g0d66db33f3-goog

