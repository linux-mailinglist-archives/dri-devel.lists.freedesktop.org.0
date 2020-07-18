Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77C64224E2F
	for <lists+dri-devel@lfdr.de>; Sun, 19 Jul 2020 00:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616126E384;
	Sat, 18 Jul 2020 22:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8C926E384
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 22:04:30 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 208333] Black screen with Kernel 5.8 rc1/2/3/4 with Nvidia Gtx
 760 driver nouveau
Date: Sat, 18 Jul 2020 22:04:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: nbryant@optonline.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208333-2300-451Jiqj5xr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208333-2300@https.bugzilla.kernel.org/>
References: <bug-208333-2300@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=208333

--- Comment #9 from Nathan Bryant (nbryant@optonline.net) ---
I'm seeing similar symptoms on my Geforce GTX 1070 (GP104). Screen blanks after
GDM login, Wayland works, Xorg doesn't. This is a regression from 5.7 to
5.8-rc1.

As long as I only have my primary monitor connected, after the failure I can
still switch to another VT with Ctrl-Alt-F3 and log in to the text console.

~/.local/share/xorg/Xorg.0.log has a few of these:

[    17.240] (EE) modeset(0): failed to set mode: Invalid argument

Bisected to this commit:

fa4f4c213f5f7807360c41f2501a3031a9940f3a is the first bad commit
commit fa4f4c213f5f7807360c41f2501a3031a9940f3a
Author: James Jones <jajones@nvidia.com>
Date:   Mon Feb 10 15:15:55 2020 -0800

    drm/nouveau/kms: Support NVIDIA format modifiers

    Allow setting the block layout of a nouveau FB
    object using DRM format modifiers.  When
    specified, the format modifier block layout and
    kind overrides the GEM buffer's implicit layout
    and kind.  The specified format modifier is
    validated against the list of modifiers supported
    by the target display hardware.

    v2: Used Tesla family instead of NV50 chipset compare
    v4: Do not cache kind, tile_mode in nouveau_framebuffer
    v5: Resolved against nouveau_framebuffer cleanup

    Signed-off-by: James Jones <jajones@nvidia.com>
    Signed-off-by: Ben Skeggs <bskeggs@redhat.com>

 drivers/gpu/drm/nouveau/dispnv50/wndw.c   | 20 ++++---
 drivers/gpu/drm/nouveau/nouveau_display.c | 89 ++++++++++++++++++++++++++++++-
 drivers/gpu/drm/nouveau/nouveau_display.h |  4 ++
 3 files changed, 104 insertions(+), 9 deletions(-)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
