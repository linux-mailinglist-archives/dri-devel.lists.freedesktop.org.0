Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 131D83EAB4A
	for <lists+dri-devel@lfdr.de>; Thu, 12 Aug 2021 21:49:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD416E461;
	Thu, 12 Aug 2021 19:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A88E6E461
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 19:49:23 +0000 (UTC)
Received: by mail-qt1-x834.google.com with SMTP id l24so6270718qtj.4
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Aug 2021 12:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aw+FbrIIja+CRqOhDTlNO91t0qVwSUGUJ/sX3AQRch0=;
 b=OjR9ddVfDdOfxVYfVPyTl6jXDOUGmsx+1B6Sv99HEKmgRfthenXK32TV4hbyE0Fg0x
 5fBwWcdwCdnLlBbnMkipbOGD/HOMbVDxYx4oaL/LX1KjRnb2LVjJp/jtwyvwmR7z6oRW
 uzjGpE5tk1FBpkM8QxDITBQsHkvpj5lxJfxyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aw+FbrIIja+CRqOhDTlNO91t0qVwSUGUJ/sX3AQRch0=;
 b=FbWCgTNvB+zN4KYFNwWeqp1/1TasEUE1HSbAHnxQ3Xg+eMlVdysqe1tkh61HGktsaL
 a/kua6NnPOZj0xujdeW9PWO+pmR6VOFACWd9vveqEyUSn19MozbAZ6YzfT3wHvJeMPAm
 pcdXTd2jxcxyIXWteO0LfvFtVSjd6mGcTF1L5waFSCGUjJTV75SfJUh7Fanr9AYyB1xN
 ZeRdThS+wbhDTPsNx9ZXX0bmcFisBPe07dwPYyrxXP1XkygaxPI3I/VWJGcNO7oRbYaa
 ELGJ1C5QsvrCKOxDXM/P0aGlgoKJi4ZHOoMbPVXAVIxWTlSCJwDA3KVC+XpPMuKxxAmB
 OJyg==
X-Gm-Message-State: AOAM53381Axb1DNmazEJx8GiK81AYNvB7b/pIaZi58KrWB0OFMocL05H
 qOBmE6TTKqWwun8CMmuQi+2X+VQJ2seZWg==
X-Google-Smtp-Source: ABdhPJx4KpUB9aVtoZ+oK8MJWaSEL2ZoYN/OB1t+3SGiBH/UM1Yuazjzk4M3EJ3XPrTwP7SNHconnQ==
X-Received: by 2002:ac8:1184:: with SMTP id d4mr5492328qtj.56.1628797761800;
 Thu, 12 Aug 2021 12:49:21 -0700 (PDT)
Received: from markyacoub.nyc.corp.google.com
 ([2620:0:1003:416:c4b:8430:790e:79e])
 by smtp.gmail.com with ESMTPSA id bi3sm1832867qkb.133.2021.08.12.12.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 12:49:21 -0700 (PDT)
From: Mark Yacoub <markyacoub@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: seanpaul@chromium.org, abhinavk@codeaurora.org, robdclark@chromium.org,
 michel@daenzer.net, airlied@linux.ie, Mark Yacoub <markyacoub@google.com>,
 Mark Yacoub <markyacoub@chromium.org>
Subject: [PATCH v2] drm: Copy drm_wait_vblank to user before returning
Date: Thu, 12 Aug 2021 15:49:17 -0400
Message-Id: <20210812194917.1703356-1-markyacoub@chromium.org>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
In-Reply-To: <20210811175525.2125964-1-markyacoub@chromium.org>
References: <20210811175525.2125964-1-markyacoub@chromium.org>
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

Fixes: IGT:kms_flip::modeset-vs-vblank-race-interruptible
Tested on ChromeOS Trogdor(msm)

Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
Change-Id: I98da279a5f1329c66a9d1e06b88d40b247b51313
---
 drivers/gpu/drm/drm_ioc32.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_ioc32.c b/drivers/gpu/drm/drm_ioc32.c
index d29907955ff79..5d82891c32223 100644
--- a/drivers/gpu/drm/drm_ioc32.c
+++ b/drivers/gpu/drm/drm_ioc32.c
@@ -855,8 +855,6 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
 	req.request.sequence = req32.request.sequence;
 	req.request.signal = req32.request.signal;
 	err = drm_ioctl_kernel(file, drm_wait_vblank_ioctl, &req, DRM_UNLOCKED);
-	if (err)
-		return err;
 
 	req32.reply.type = req.reply.type;
 	req32.reply.sequence = req.reply.sequence;
@@ -865,7 +863,7 @@ static int compat_drm_wait_vblank(struct file *file, unsigned int cmd,
 	if (copy_to_user(argp, &req32, sizeof(req32)))
 		return -EFAULT;
 
-	return 0;
+	return err;
 }
 
 #if defined(CONFIG_X86)
-- 
2.33.0.rc1.237.g0d66db33f3-goog

