Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FE5AD305C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 10:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D4210E4AF;
	Tue, 10 Jun 2025 08:30:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="RHvix/P3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4687E10E4A8;
 Tue, 10 Jun 2025 08:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GJSHTce66Jea0KOnPaRkOM+/PJBsn9bgNyoRl97BpDM=; b=RHvix/P3be4KcTxh05xCf3Zbsg
 RqLoJNjsjbQB5NPXuou+Jqv/x9EeE7yI2E04cYOTyHGpMJm/oS6McZ1K7nJwvhydmKpG8A48gCQQ7
 bRTQKWmdn9opmpvunQ+UgWu0HxNp1HLdY3OlGD99UuDFlcmW88bODr2mzlZxouWruIczjsJFrK05P
 6BXvEbUhdXdkjaIGb+WN13sMUdSP4Z4aTbRNtvdOGZYdCzF7zDUDS7zC8/qJZysESA7PsR6kMy/zK
 K6qnXdY858EJn2pqoOAJk/f1w/B39ZrvdkQjQk+cvPrYkXtLbCA5fsVOlBZjZ0ftnC8nSSZUyng2X
 AgTbEdCQ==;
Received: from [81.79.92.254] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uOuMu-001jmb-7Z; Tue, 10 Jun 2025 10:30:04 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v4 0/6] A few drm_syncobj optimisations
Date: Tue, 10 Jun 2025 09:29:55 +0100
Message-ID: <20250610083001.4120-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

A small set of drm_syncobj optimisations which should make things a tiny bit
more efficient on the CPU side of things.

Improvement seems to be around 1.5%* more FPS if observed with "vkgears
-present-mailbox" on a Steam Deck Plasma desktop, but I am reluctant to make a
definitive claim on the numbers since there is some run to run variance. But, as
suggested by Michel Dänzer, I did do a five ~100 second runs on the each kernel
to be able to show the ministat analysis.

x before
+ after
+------------------------------------------------------------+
|                          x         +                       |
|                   x      x         +                       |
|                   x      xx      ++++                      |
|                 x x      xx x    ++++                      |
|                 x xx   x xx x+   ++++                      |
|                xxxxx   xxxxxx+   ++++ + +                  |
|                xxxxxxx xxxxxx+x  ++++ +++                  |
|              x xxxxxxxxxxx*xx+* x++++++++   ++             |
|        x x   xxxxxxxxxxxx**x*+*+*++++++++ ++++ +           |
|       xx x   xxxxxxxxxx*x****+***+**+++++ ++++++           |
|x     xxx x   xxxxx*x****x***********+*++**+++++++   +  +  +|
|               |_______A______|                             |
|                             |______A_______|               |
+------------------------------------------------------------+
    N           Min           Max        Median           Avg        Stddev
x 135      21697.58     22809.467     22321.396     22307.707     198.75011
+ 118     22200.746      23277.09       22661.4     22671.442     192.10609
Difference at 95.0% confidence
    363.735 +/- 48.3345
    1.63054% +/- 0.216672%
    (Student's t, pooled s = 195.681)

Or when tested on Intel Alderlake, KDE Wayland:

x base
+ syncobj
+--------------------------------------------------------------+
|                                                       +      |
|                                                       +   +  |
|                                                       +   +  |
|                                                       +  ++  |
|                                                       ++ ++  |
|                                       x               ++ ++  |
|                       x               x             + ++ ++  |
|                       x          xx   xx x x        +++++++  |
|                       x   x   xx xxx xxxx*xxx      +++++++++ |
|x       xx x  x    x  xx xxxxxxxxxx*xxx****xxx  +x+ ++++++++++|
|                      |__________A_M_______|     |____A_M___| |
+--------------------------------------------------------------+
    N           Min           Max        Median           Avg        Stddev
x  55      7158.232      8058.753      7803.506     7754.5195     191.69526
+  55       7801.23      8272.271      8172.435     8150.6303     105.84085
Difference at 95.0% confidence
    396.111 +/- 57.8717
    5.10813% +/- 0.746296%
    (Student's t, pooled s = 154.838)

Scores may seem low but I had to fix to conservative CPU freq to avoid some
pretty strong thermal throttling causing wild swings within a run. Nevertheless
the improvement is clearly shown here as well.

v2:
 * Implemented review feedback - see patch change logs.

v3:
 * Moved #define DRM_SYNCOBJ_FAST_PATH_ENTRIES one patch earlier for less churn.

 v3.1:
 * Consolidated testing results.

v4:
 * Kernel test robot reports 32-bit ARM does not implement 64-bit get/put_user.
   Switch to copy_to/from_user in relevant places.

Cc: Maíra Canal <mcanal@igalia.com>

Tvrtko Ursulin (6):
  drm/syncobj: Remove unhelpful helper
  drm/syncobj: Do not allocate an array to store zeros when waiting
  drm/syncobj: Avoid one temporary allocation in drm_syncobj_array_find
  drm/syncobj: Avoid temporary allocation in
    drm_syncobj_timeline_signal_ioctl
  drm/syncobj: Add a fast path to drm_syncobj_array_wait_timeout
  drm/syncobj: Add a fast path to drm_syncobj_array_find

 drivers/gpu/drm/drm_syncobj.c | 277 ++++++++++++++++++----------------
 1 file changed, 147 insertions(+), 130 deletions(-)

-- 
2.48.0

