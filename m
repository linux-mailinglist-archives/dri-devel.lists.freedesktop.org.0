Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EFC5C598B0D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 20:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B83210E193;
	Thu, 18 Aug 2022 18:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A724010E193
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:23:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3EED9B82357
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:23:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ED7B3C433C1
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 18:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660846993;
 bh=cep3fb0kqpJAo+2kIkyORgMgwfXFTmcdlKgzfrGp3D4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GbmUG4bJwyKthxrBv0wV7iD3vzOXZKNHZ3zyYs/dg/vUJMfaUlpWUw+/06nGfNoHB
 Bw2MMQeDh+fhML+SfA8eW89Hboe15OVM9QyfRvgrWDNttz5DRocRqxrjx2I/3CxizM
 +/YM07tXvPydTbFyZIRXyn38rWkxUEbUEG19kmXsgFlCCEH3k54OGlFaygqJ0EHE0Y
 xv5mqfeTURqZMYQfxcngmNro5CUDGKGSlVVT/4K4T0IRz5wLPltl9YL5rnjIpK1VnJ
 UM75Yx2HtQoG7Q5pNp/yMwytu3y0FzwuRxDTVBxaVsNRPJian1FhSvKUqMTzL8VtXD
 d7W3LrNE+ueSA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D1B1BC433E6; Thu, 18 Aug 2022 18:23:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216376] AMDGPU: display output disables and quickly reenables
 when switching AVR into/from standby doing HDMI passthrough
Date: Thu, 18 Aug 2022 18:23:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216376-2300-MQBudExXNj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216376-2300@https.bugzilla.kernel.org/>
References: <bug-216376-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216376

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
I suspect the receiver toggles the hotplug pin when it switches to/from
passthrough mode notify the GPU that the EDID will change (e.g., from recei=
ver
audio to monitor audio) otherwise the GPU won't know that the receiver is no
longer part of the chain.  The driver doesn't actually do anything when it
receives this hotplug interrupt.  It just tells userspace.  Your desktop
environment listens for hotplug events and then acts on them (either enabli=
ng
or disabling displays).  Your best bet is probably to change the behavior of
your desktop environment when it receives a hotplug notification.=20
Alternatively, you could try and block drm hotplug events in udev.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
