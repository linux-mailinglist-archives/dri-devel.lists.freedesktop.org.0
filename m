Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C74F15FFAB6
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 17:05:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEB7F10E252;
	Sat, 15 Oct 2022 15:05:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D0D10E252
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 15:05:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E4D1C60DE9
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 15:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54490C433C1
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 15:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665846338;
 bh=X2QfPdBGZl5UZe1WH50djezidod1j1XTWu83fLVLfH4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cyl338hD43GbXz/vt6A1Hbej8LPfZfVfXUxa7mRJCsNOUTW4xe4+WlVXn3CquVsgp
 mdH9mGvAuqbecGuDwTadPIZhbDvxgfP86MxDBMdV5/wIIzVW9acR7cVxjzaT3ZIo2F
 Irbfb/28uHKM7c7SBBdeGB01KuVAYpeKuHKNCr9LFYAv+XTudt4uhT+lMXNlHOfkoP
 dpeaPkUn2pdzx8ZlWCsRtB5YxVwSUGZxViFU7Yaje0vAemut1AzGFAhTAvSsVkV9ap
 udTVjxq8uPycezdUEN3PdT/S3rkzdlf7PQARUkyDkH61OGmCyzNxb1HMsWAmTSvKq+
 /559GDe5FaOpQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3D44CC433E7; Sat, 15 Oct 2022 15:05:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214425] [drm][amdgpu][TTM] Page pool memory never gets freed
Date: Sat, 15 Oct 2022 15:05:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rafael.ristovski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214425-2300-Ly1EhtsZP3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214425-2300@https.bugzilla.kernel.org/>
References: <bug-214425-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214425

--- Comment #3 from Rafael Ristovski (rafael.ristovski@gmail.com) ---
(In reply to Martin Doucha from comment #2)
> (In reply to Rafael Ristovski from comment #1)
> > According to amdgpu devs, this is a feature where the allocated pages a=
re
> > kept around in case they are needed later on. TTM is able to release the
> > memory in case the memory pressure increases.
>=20
> I understand the logic behind keeping idle buffers allocated for a while.
> But it does not make sense to keep them for hours after last use and the
> release mechanism on increased memory pressure does not seem to be workin=
g.
>=20
> When I run a large compilation overnight, starting from a fresh reboot and
> shutting down all graphics software including the X server, I'll often co=
me
> back in the morning to find that 70% of all RAM is allocated in idle TTM
> buffers and GCC is stuck swapping for hours. The TTM buffers were likely
> allocated by some GPU-accelerated build computation halfway through the
> night. But this is harder to reproduce than the games I've mentioned in t=
he
> initial bugreport.

Indeed, I too run into situations where even if I purposefully trigger an O=
OM
situation just to get the TTM "cache" to evict itself through memory pressu=
re,
_it still does not end up releasing all of the memory_.

There are also the following two sysfs files, simply reading them triggers =
an
eviction of GTT/VRAM:
> cat /sys/kernel/debug/dri/0/amdgpu_evict_vram
> cat /sys/kernel/debug/dri/0/amdgpu_evict_gtt

this can be confirmed as working with tools like `radeontop`/`nvtop`.

However, this once again does not release the TTM buffers.

As you can see in the issue I linked, I never got a reply about a mechanism=
 to
manually release TTM memory. I will attempt coercing an answer on IRC, perh=
aps
I will have better luck asking directly there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
