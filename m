Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2697817CF5
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 22:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D729710E38A;
	Mon, 18 Dec 2023 21:52:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 4199 seconds by postgrey-1.36 at gabe;
 Mon, 18 Dec 2023 20:34:34 UTC
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4128B10E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 20:34:34 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1702893460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=b9B/dJhmZ1FQU1Ml+AeFKF1QKF+vHETnd8Coz1FtEOs=;
 b=qJt0FVa+T5xF0c23SDHgq6oH8efKsuOHIpvSGOh5PZh7sS18QYv9sYs+rbCl2hUlt3bKmB
 vMKNOYTXB0HhUvBInth1H/Dz4ip7T0Mh7Ta3Wwe6WMM4s7ZXcWm3IJShUMtQ9wX1vReAwD
 8Z5QG2XWpBSiVwGStwFmROYr7j//Lpb6RlSmiXamssiwsr+Ike4vHqKWhbJIVukrL1vkvO
 srdJ1GQEVfHoUUvmpvvPF3r3ohT78Cx69DJ+dR7Exc/R/O5er64Z7Ufh8cw/Ana6aFfZob
 UElghQGblGLF+FUvqxBzbjl7GHC4ACR3fw1xGHR06RcgiZcDh+w9M2g/MRMx+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1702893460;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=b9B/dJhmZ1FQU1Ml+AeFKF1QKF+vHETnd8Coz1FtEOs=;
 b=iULYsgGLAjpNxsywH3DLqbO9R6yfT8uCby5NXhu/LjersaoceyLj+bMy8mKBmPQYycXE37
 onivXZO+3yellrBg==
To: Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Antonino Daplas <adaplas@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Paul Mundt <lethal@linux-sh.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] fix LCD diplays sporadically not work
Date: Mon, 18 Dec 2023 10:57:29 +0100
Message-Id: <cover.1702890493.git.namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Mon, 18 Dec 2023 21:52:28 +0000
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
Cc: Nam Cao <namcao@linutronix.de>, bigeasy@linutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

While working with a framebuffer displays, I noticed that the displays
sporadically do not show the image as I expect.

After investigation: this is because my devices use deferred IO, and by
closing the framebuffers, all pending deferred IO get cancelled. This
causes the image I sent to the devices to just vanish. Using fsync() does
not always help, because the driver's implementation of fsync() does not
guarantee that all pending work is flushed on return.

This series solves the problem by flush the workqueue in .release(). Also
flush the workqueue in .fsync(), as it is supposed to do.

Nam Cao (2):
  fb: flush deferred work in fb_deferred_io_fsync()
  fb: flush deferred IO before closing

 drivers/video/fbdev/core/fb_defio.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

--=20
2.39.2

