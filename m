Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0A2412DA8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 06:05:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD1A6E8F2;
	Tue, 21 Sep 2021 04:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F8826E8F2
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 04:04:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EC1E061268
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Sep 2021 04:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632197099;
 bh=Zl9wVftz5nLwl+4nh3ieAKmHxAAY3hw4PYCyyt3YeW8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=eNZPRp8vAkszWvcvGiZLXC+Q2OXipAl7D0+x9krknQ0ADOH2Yec6pirCcKUZwsEtb
 V+47iTdzoqyoSZnVh4+y5yMK6IZWKY3wlAZsFMLKgzch0MrXS03+kIffrTg7dImAXX
 jXCKqVUGTMapYyaOwyeCRcsTua0eKAatPC+dc35NjoMxlQQ5NvEgQI80r76WF60JWb
 yDd8OgfK/jwdbrPMSSlWkrBb9oIqopHXPjU/Dk6zh98Ay6iy9BsaH6xDNvg97Vfmns
 NtX4PUjo/2XYOMEBT0p8EIDPACC4lrYmJi3AtcP+tQyXv721VsPg4xZlQoc8T29GWQ
 lxFLP5ATuMF0Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id E8E7760F53; Tue, 21 Sep 2021 04:04:58 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211277] sometimes crash at s2ram-wake (Ryzen 3500U): amdgpu,
 drm, commit_tail, amdgpu_dm_atomic_commit_tail
Date: Tue, 21 Sep 2021 04:04:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youling257@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211277-2300-J4oTLyoc2S@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211277-2300@https.bugzilla.kernel.org/>
References: <bug-211277-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211277

--- Comment #65 from youling257@gmail.com ---
(In reply to James Zhu from comment #63)
> (In reply to youling257 from comment #62)
> > (In reply to James Zhu from comment #61)
> > > (In reply to youling257 from comment #60)
> > > > Created attachment 298889 [details]
> > > > dmesg5.15.txt
> > > >=20
> > > > (In reply to James Zhu from comment #59)
> > > > > (In reply to youling257 from comment #58)
> > > > > > drm/amdgpu: move iommu_resume before ip init/resume cause suspe=
nd
> to
> > > disk
> > > > > > resume failed on my amdgpu 3400g.
> > > > >=20
> > > > > Can you share whole demsg log? Regards! James
> > > >=20
> > > > when resume failed have to force shutdown, how to output dmesg?
> > > > only has boot log dmesg.
> > >=20
> > > after reboot, you can find under /var/log/kern.log and /var/log/syslog
> > based
> > > on timestamp. you can just attach kern.log
> >=20
> > my userspace is androidx86, running androidx86 with linux 5.15 and mesa=
21
> on
> > amdgpu, no /var/log.
> > git bisect linux kernel 5.15rc1 and rc2, bad commit is drm/amdgpu: move
> > iommu_resume before ip init/resume.
>=20
> Can you check CONFIG_HSA_AMD setting in .config? By the way , see if the
> below link help you dump the  error message during resume.
> https://stackoverflow.com/questions/9682306/android-how-to-get-kernel-log=
s-
> after-kernel-panic

do you see my dmesg kernel command line "memmap=3D1M!5M ramoops.mem_size=3D=
1048576
ramoops.ecc=3D1 ramoops.mem_address=3D0x00500000 ramoops.console_size=3D163=
84
ramoops.ftrace_size=3D16384 ramoops.pmsg_size=3D16384 ramoops.record_size=
=3D32768".

if kernel panic reboot, can get /sys/fs/pstore/console-ramoops-0 and
/sys/fs/pstore/pmsg-ramoops-0.
but when resume failed, have to press power button force shutdown, no anyth=
ing.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
