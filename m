Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13297A95E32
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 08:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A24F410E4FF;
	Tue, 22 Apr 2025 06:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yGakkHde";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EE110E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 06:31:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7C23461166;
 Tue, 22 Apr 2025 06:30:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78B64C4CEE9;
 Tue, 22 Apr 2025 06:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1745303478;
 bh=tZzXEJJxqBvocIrjK/CqjBhsE4HmjODVexI28fsdeks=;
 h=Subject:To:Cc:From:Date:From;
 b=yGakkHdeziPm6N0e4viyNkCxPazucazBTLLau4eBe3YYhroJucbzXgSnvxGXM7MTy
 GaNMsR2gOJnTJiNVxqg/3KR+oq4wU04BLqifSe7Ka0G03rfm7tA58jKxv66QO986k4
 tSVMi70ARvkBDRykg8ZXiF3e7OhunqBlmWLKat8M=
Subject: Patch "drm/mgag200: Fix value in <VBLKSTR> register" has been added
 to the 6.14-stable tree
To: afmerlord@gmail.com, airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, tzimmermann@suse.de,
 wakko@animx.eu.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 08:30:33 +0200
Message-ID: <2025042233-prowling-humbly-e1a3@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/mgag200: Fix value in <VBLKSTR> register

to the 6.14-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-mgag200-fix-value-in-vblkstr-register.patch
and it can be found in the queue-6.14 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 76c332d119f9048c6e16b52359f401510f18b2ff Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 16 Apr 2025 10:38:05 +0200
Subject: drm/mgag200: Fix value in <VBLKSTR> register
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 76c332d119f9048c6e16b52359f401510f18b2ff upstream.

Fix an off-by-one error when setting the vblanking start in
<VBLKSTR>. Commit d6460bd52c27 ("drm/mgag200: Add dedicated
variables for blanking fields") switched the value from
crtc_vdisplay to crtc_vblank_start, which DRM helpers copy
from the former. The commit missed to subtract one though.

Reported-by: Wakko Warner <wakko@animx.eu.org>
Closes: https://lore.kernel.org/dri-devel/CAMwc25rKPKooaSp85zDq2eh-9q4UPZD=RqSDBRp1fAagDnmRmA@mail.gmail.com/
Reported-by: Сергей <afmerlord@gmail.com>
Closes: https://lore.kernel.org/all/5b193b75-40b1-4342-a16a-ae9fc62f245a@gmail.com/
Closes: https://bbs.archlinux.org/viewtopic.php?id=303819
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: d6460bd52c27 ("drm/mgag200: Add dedicated variables for blanking fields")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.12+
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Tested-by: Wakko Warner <wakko@animx.eu.org>
Link: https://lore.kernel.org/r/20250416083847.51764-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/mgag200/mgag200_mode.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -223,7 +223,7 @@ void mgag200_set_mode_regs(struct mga_de
 	vsyncstr = mode->crtc_vsync_start - 1;
 	vsyncend = mode->crtc_vsync_end - 1;
 	vtotal = mode->crtc_vtotal - 2;
-	vblkstr = mode->crtc_vblank_start;
+	vblkstr = mode->crtc_vblank_start - 1;
 	vblkend = vtotal + 1;
 
 	linecomp = vdispend;


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.14/drm-mgag200-fix-value-in-vblkstr-register.patch
queue-6.14/drm-ast-fix-ast_dp-connection-status.patch
