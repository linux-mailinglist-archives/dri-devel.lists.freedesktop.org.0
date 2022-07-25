Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 536645802A4
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 18:27:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E5CB7923;
	Mon, 25 Jul 2022 16:27:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25CB0C09A5
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:27:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 99B3061307
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08BC0C36AE3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658766426;
 bh=Eks75G6rj/VdbdojWvMIeLrGWlzCP4lx96PmtM1UOsk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rh/P62EnTj/yBHpjPlOTlRu9IculqKG8AArtXJ2MjOqBS0cnU5H8PnRgvd4Xo+nTl
 DFjDRC60M/hMUdH0kT0m22CHrpf2iEJDfxnShrk5sfJCVtFdXKZgv1xrSVHOkcahkb
 jw5Hk6u4FEXyyOafjQOTYYGXACc/5KilTFQyUFtyn5XQwSB1ltB0j98ozKX1bBVqLo
 7h3zLmmfosRdV3YNBIjDHOPhuEy4wkbxyuprGN/eCBSy7WX+K/tqjUGBCDHRPZi89O
 i7tL428LCyrcevvcmqhT3tDEOcGn747fsIcn8w0mHbzUoKU3lRbDRtA3GcGPRrhg71
 ckA2bGnWJVrzQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EA263CC13B6; Mon, 25 Jul 2022 16:27:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216277] X11 doesn't wait for amdgpu driver to be up
Date: Mon, 25 Jul 2022 16:27:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dark_sylinc@yahoo.com.ar
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216277-2300-TuUfoKHfiH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216277-2300@https.bugzilla.kernel.org/>
References: <bug-216277-2300@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=3D216277

--- Comment #5 from dark_sylinc@yahoo.com.ar ---
Your hint is very good.

It tells me upstream kernel devs expect the amdgpu driver & firmware should=
 be
in initrd; while Ubuntu does not do that.

This is starting to look more and more like an Ubuntu bug.

I looked further into the matter and found out that
/lib/udev/rules.d/78-graphics-card.rules

has entries for

1. "drm": i915, radeon, nouveau, vmwgfx
2. "graphics": amdgpu, i915, radeon, nouveau, efifb, efi-framebuffer,
vesa-framebuffer

I just edited the rules file to include amdgpu on both sections and see what
happens. So far rebooted only once and Xorg didn't crash.

I'll monitor how it goes and if the crashes stop I'll close this ticket and
report it to Ubuntu.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
