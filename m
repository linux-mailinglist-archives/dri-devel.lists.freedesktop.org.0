Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C177235410
	for <lists+dri-devel@lfdr.de>; Sat,  1 Aug 2020 20:49:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 931BF6EC00;
	Sat,  1 Aug 2020 18:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D856EC00
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Aug 2020 18:49:39 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 184so12021823wmb.0
 for <dri-devel@lists.freedesktop.org>; Sat, 01 Aug 2020 11:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=MxpRTOZ+a9Yk8BaelNAvYzSAx53X3UQsDpK+3T01PFk=;
 b=tieGcHAUi5zaeQVURRe2RYpMe1e61SVS/e8Cnuf+0wtR7Fk11ZyWKs787++NVY67/7
 hZ+IpG5kTZ7aPOQEQClYgToiGaMQSgYLFa3HKUqKfqtCtkLyTvzqvn/QlkHEyDWutOsy
 tqL8qudVO/2RWkr3/lBBqHQPQeCWpiQ1dQobjYp7zYLw3WFUtjJxrGcpoqKFzx9L/Wqb
 TL2rlGXkGsX9RKa+PfmlYwz3FbEthxjsw72rsF37Kf1n/wLZ0IBy3u8jqTuxMPjmAiFf
 6SsHl5ItKPNGMClsv00zvktKC3uGYFzxgJoCwL+ut41yIcYDk/I3ltxgfgBcteo1WHkl
 HP5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=MxpRTOZ+a9Yk8BaelNAvYzSAx53X3UQsDpK+3T01PFk=;
 b=UJBTbxb+v3d6lE9MfgV4c7iSV6ua7R/UqtIEcVM7voPxYvHt737Dg6TIL/+7MBKOM3
 FT6r0ja8TOpxnYgKgbk7Bra9/dsQ2f+s/tyF59mExWw5YUQyvfVpqZvifwIeFANTtUKd
 Z8CLPxqqp4CCmZHZv7DH+KukuVBC0+fq8xklzWWHxCm2HYQ7VzghrvZ/qn2k+3w9nuHS
 8CbsWhk14o/ECYwrTRi4Ow2oeAsWMOlfbc956hJJ1MUJL4xNaLnzEf/8rp0IIUyRgtdk
 Xr9/RsLSNp4yUb87fLcGtzHGqhUGt4duVtQUBvh1VO9ZyiZFrnrOanyVHYXGCABTiyQL
 aRAA==
X-Gm-Message-State: AOAM530iXzVsfqfsXH5NOg8jFTNEFIrzpHP2EOKa7v/MhsF7ASPASdPH
 y8wH47PE44u/U9RDGCtvI7g=
X-Google-Smtp-Source: ABdhPJxdXVLKSbEh46C6FdcV3pFdoQMjxG1UfSDRcGPjlrNW6T1XLmE0B9rMRQ7e4vGdfQ1fICHBZQ==
X-Received: by 2002:a1c:484:: with SMTP id 126mr8844477wme.9.1596307778064;
 Sat, 01 Aug 2020 11:49:38 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id s19sm20089660wrb.54.2020.08.01.11.49.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Aug 2020 11:49:37 -0700 (PDT)
Date: Sat, 1 Aug 2020 15:49:29 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Sidong Yang <realwakka@gmail.com>
Subject: [PATCH] drm/vkms: guarantee vblank when capturing crc
Message-ID: <20200801184929.2eaxyoq6fm3nk4ey@smtp.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: kernel-usp@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VKMS needs vblank interrupts enabled to capture CRC. When vblank is
disabled, tests like kms_cursor_crc and kms_pipe_crc_basic getting stuck
waiting for a capture that will not occur until vkms wakes up. This
patch ensures that vblank remains enabled as long as the CRC capture is
needed.

It clears the execution of the following kms_cursor_crc subtests:
1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
random, fast-moving])] - successful when running individually.
2. pipe-A-cursor-dpms passes again
3. pipe-A-cursor-suspend also passes

The issue was initially tracked in the sequential execution of IGT
kms_cursor_crc subtest: when running the test sequence or one of its
subtests twice, the odd execs complete and the pairs get stuck in an
endless wait. In the IGT code, calling a wait_for_vblank on preparing
for CRC capture prevented the busy-wait. But the problem persisted in
the pipe-A-cursor-dpms and -suspend subtests.

Checking the history, the pipe-A-cursor-dpms subtest was successful
when, in vkms_atomic_commit_tail, instead of using the flip_done op, it
used wait_for_vblanks. Another way to prevent blocking was
wait_one_vblank when enabling crtc. However, in both cases,
pipe-A-cursor-suspend persisted blocking in the 2nd start of CRC
capture, which may indicate that something got stuck in the step of CRC
setup. Indeed, wait_one_vblank in the crc setup was able to sync things
and free all kms_cursor_crc subtests.

Besides, other alternatives to force enabling vblanks or prevent
disabling them such as calling drm_crtc_put_vblank or modeset_enables
before commit_planes + offdelay = 0, also unlock all subtests
executions. These facts together converge on the lack of vblank to
unblock the crc capture.

Finally, considering the vkms's dependence on vblank interruptions to
perform tasks, this patch acquires a vblank ref when setup CRC source
and releases ref when disabling crc capture, ensuring vblanks happen to
compute CRC.

Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Co-developed-by: Sidong Yang <realwakka@gmail.com>
Signed-off-by: Sidong Yang <realwakka@gmail.com>
Co-developed-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 4af2f19480f4..1161eaa383f1 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -241,6 +241,14 @@ int vkms_set_crc_source(struct drm_crtc *crtc, const char *src_name)
 
 	ret = vkms_crc_parse_source(src_name, &enabled);
 
+	/* Ensure that vblank interruptions are enabled for crc capture */
+	/* Enabling CRC: acquire vblank ref */
+	if (enabled)
+		drm_crtc_vblank_get(crtc);
+	/* Disabling CRC: release vblank ref */
+	if (!src_name)
+		drm_crtc_vblank_put(crtc);
+
 	spin_lock_irq(&out->lock);
 	out->composer_enabled = enabled;
 	spin_unlock_irq(&out->lock);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
