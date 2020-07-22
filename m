Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3A92296DB
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jul 2020 13:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E3D16E044;
	Wed, 22 Jul 2020 11:04:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 130736E044
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 11:04:23 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id y3so1480463wrl.4
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jul 2020 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=OCy4M+IerAUwrGq+R10RYFBywYGUc8/udZhkNLn8gcA=;
 b=blnhOXIRlgBIHslJnR+DyX3qRw0egROpKwj7Y0Zkk0MMdUtpreXtgx75Kq1wPrfpcw
 YT0xqBP0X9bvfkLrjDAjTmnTxzFZrZQIvAqUg6rrrRMpE1+2Am8fg/BMXJTPLpUCrRHG
 WG4KDPcO+AnnCn+WJph8oQSDcEQOtFVBnYkClbRvOg2bqXfvK2yeOn1d/J2s59wzpd0b
 VTw1CPE1C6poESLQsUVR+9mx8lbuqnKWymfrOoz608Ea4C1gFhgHQ1OA0EBcrOP2hpnE
 2Z07LwLiO83BYhupbyWqS0g8hcUHHqXlNFYa0FOnBXmju5sMmeNIWSPap5YxzMnH1UeX
 n0Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=OCy4M+IerAUwrGq+R10RYFBywYGUc8/udZhkNLn8gcA=;
 b=edtDRS2HFZU9tIlcVDp7M0+08/YR6+oIxdTIySbJQWo+CIaZ+v0H1JjykWgBuXkFi0
 i38vwIZg5qFZnCKauvFPTukkZv3u8182M5FVQeXLBHoTILXq0NuQ82tGqJDQKkz/ae4J
 aqC+n3hGw1vw0czexA0wY1GZhmem9pS5f4DzRVfGPlcl7ro7AJFOMed5bTevJoWwxsEu
 237qP9++sO9/nKb+Pq839Z3lItcPTsHuR/rP7U/CUjgqdWbPHJXYGPA0yCIcBGI5Vywn
 J1Qq36KPmn2hvU37cPsLXpVK4xd8bqynl4zN2BwP0brjCZXQ6EUoriB6EXLYfEGn7WBa
 gLjg==
X-Gm-Message-State: AOAM533CeYnRRZnXiygEBQqtfhfM6wWT6aIegCCla+qeUFYugiFaV6Hv
 byXjQE6tLn/QNynhRodUBa8=
X-Google-Smtp-Source: ABdhPJyen9XQxbMOmxYyIRo9xkcOiFhcP/BsUcVILGQr7xM0UXW3SkKzFeItTtT4WGFXCvo6Y3Wceg==
X-Received: by 2002:adf:ea06:: with SMTP id q6mr29366083wrm.69.1595415861662; 
 Wed, 22 Jul 2020 04:04:21 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id t2sm6735027wma.43.2020.07.22.04.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jul 2020 04:04:21 -0700 (PDT)
Date: Wed, 22 Jul 2020 08:04:11 -0300
From: Melissa Wen <melissa.srw@gmail.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Subject: [PATCH] drm/vkms: add missing drm_crtc_vblank_put to the get/put
 pair on flush
Message-ID: <20200722110411.ebkv6knvc6mzw5uf@smtp.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-usp@googlegroups.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch adds a missing drm_crtc_vblank_put op to the pair
drm_crtc_vblank_get/put (inc/decrement counter to guarantee vblanks).

It clears the execution of the following kms_cursor_crc subtests:
1. pipe-A-cursor-[size,alpha-opaque, NxN-(on-screen, off-screen, sliding,
   random, fast-moving])] - successful when running individually.
2. pipe-A-cursor-dpms passes again
3. pipe-A-cursor-suspend also passes

The issue was initially tracked in the sequential execution of IGT
kms_cursor_crc subtest: when running the test sequence or one of its
subtests twice, the odd execs complete and the pairs get stuck in an
endless wait. In the IGT code, calling a wait_for_vblank before the start
of CRC capture prevented the busy-wait. But the problem persisted in the
pipe-A-cursor-dpms and -suspend subtests.

Checking the history, the pipe-A-cursor-dpms subtest was successful when,
in vkms_atomic_commit_tail, instead of using the flip_done op, it used
wait_for_vblanks. Another way to prevent blocking was wait_one_vblank when
enabling crtc. However, in both cases, pipe-A-cursor-suspend persisted
blocking in the 2nd start of CRC capture, which may indicate that
something got stuck in the step of CRC setup. Indeed, wait_one_vblank in
the crc setup was able to sync things and free all kms_cursor_crc
subtests.

Tracing and comparing a clean run with a blocked one:
- in a clean one, vkms_crtc_atomic_flush enables vblanks;
- when blocked, only in next op, vkms_crtc_atomic_enable, the vblanks
started. Moreover, a series of vkms_vblank_simulate flow out until
disabling vblanks.
Also watching the steps of vkms_crtc_atomic_flush, when the very first
drm_crtc_vblank_get returned an error, the subtest crashed. On the other
hand, when vblank_get succeeded, the subtest completed. Finally, checking
the flush steps: it increases counter to hold a vblank reference (get),
but there isn't a op to decreased it and release vblanks (put).

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index ac85e17428f8..a99d6b4a92dd 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -246,6 +246,7 @@ static void vkms_crtc_atomic_flush(struct drm_crtc *crtc,
 
 		spin_unlock(&crtc->dev->event_lock);
 
+		drm_crtc_vblank_put(crtc);
 		crtc->state->event = NULL;
 	}
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
