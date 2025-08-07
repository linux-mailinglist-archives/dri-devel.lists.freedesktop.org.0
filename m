Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 529D3B1D68A
	for <lists+dri-devel@lfdr.de>; Thu,  7 Aug 2025 13:22:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC65A10E7B4;
	Thu,  7 Aug 2025 11:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zpfj8Dtm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD8510E7B4
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Aug 2025 11:21:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8FA85601D2;
 Thu,  7 Aug 2025 11:21:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A06EC4CEEB;
 Thu,  7 Aug 2025 11:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754565711;
 bh=DbcTSWaRzktvT+5n3OPpZZIBogKl8mnhUbrMX9SXuKM=;
 h=Date:From:To:Subject:From;
 b=Zpfj8DtmGkq6q534Y5j9vbVipoEx56NKo08uV0+vVDW0godlpQs4R8YsFCmL4dXvw
 uAlcjgN20whTobeH4tIh2SETH5hS8KhOi3YdVsoYgU74a7CJ5o5BYrwAR7JJ5hy5LK
 gQ8H99t/cCildzr01qHzHcHy7GdV+lbH91v0MRoTGCWbNI3kCcBCBY9/8oBnWu6QBz
 qqXAo9XZ+Gw5DzDTHZZG7wVbaBcze5Lm2ogLD+p3VgJmd7WodIgtOHMd0LWgp4SdtU
 ViXda9Ds4z79a9yjzYCMjbI7TX3QCe999CQULZbGQzlQDYSM6eY8RfL9SYt19A+Dff
 tBWLsqiWW2E/g==
Date: Thu, 7 Aug 2025 13:21:47 +0200
From: Helge Deller <deller@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [GIT PULL] fbdev last fixes for v6.17-rc1
Message-ID: <aJSMS8PhMMe0NL63@p100>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

please pull two more fbdev fixes for 6.17-rc1:

One patch reverts a previous stable tree patch which broke the VGA console,
the other fixes an out-of-bounds access bug which may happen during console
resizing when a console is mapped to a frame buffer.

Both patches are tagged for stable series.

Thanks,
Helge

----------------------------------------------------------------
The following changes since commit 038d61fd642278bab63ee8ef722c50d10ab01e8f:

  Linux 6.16 (2025-07-27 14:26:38 -0700)

are available in the Git repository at:

  http://git.kernel.org/pub/scm/linux/kernel/git/deller/linux-fbdev.git tags/fbdev-for-6.17-rc1-2

for you to fetch changes up to e4fc307d8e24f122402907ebf585248cad52841d:

  Revert "vgacon: Add check for vc_origin address range in vgacon_scroll()" (2025-08-02 21:47:33 +0200)

----------------------------------------------------------------
fbdev fixes for 6.17-rc1:

- Revert a patch which broke VGA console.
- Fix an out-of-bounds access bug which may happen during console
   resizing when a console is mapped to a frame buffer.

----------------------------------------------------------------
Helge Deller (1):
      Revert "vgacon: Add check for vc_origin address range in vgacon_scroll()"

Sravan Kumar Gundu (1):
      fbdev: Fix vmalloc out-of-bounds write in fast_imageblit

 drivers/video/console/vgacon.c   | 2 +-
 drivers/video/fbdev/core/fbcon.c | 9 +++++----
 2 files changed, 6 insertions(+), 5 deletions(-)
