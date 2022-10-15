Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D285FFA97
	for <lists+dri-devel@lfdr.de>; Sat, 15 Oct 2022 16:47:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B277310E4D4;
	Sat, 15 Oct 2022 14:47:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5EED10E4D4
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 14:47:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1A0560D2F
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 14:47:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59929C433D6
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Oct 2022 14:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665845225;
 bh=/XVy6sxNwSvo90oLXc9jUhKQQGrV6/Toko6OIujy/BM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=mz0w4OEwmOxI4kILVC1KJ5yqGDIXmQ/xcSmZ1N6Oq3W6o7/iU3ogzo4en4gTIQ+wX
 j8Jsc4NlatI1YDB/ueF54SNxHcMnhfZioF7BIpI7ngJQC1M596HD7T8SJHemc6ZrLA
 D0ZBlsKg1RFyqiphvfJhZPHO/E6iplBXXKllgctzVX1DySkN7vzKZagUCBTRPcL2Lt
 3GRXZt9UFjnYFbmcPyJ729qNcV4yiiUzAheiAHJcHuT0n4O1o3gxG1jp+ORJY2YSjs
 bxKiLwlrIBA0VQZLoTqTToaYJ80p9p/RExj3fCcT091x/WQcVB7//lVrPyYblSMPXD
 /M4UtE9LgiKDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3FF06C433E4; Sat, 15 Oct 2022 14:47:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214425] [drm][amdgpu][TTM] Page pool memory never gets freed
Date: Sat, 15 Oct 2022 14:47:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: doucha@swarmtech.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214425-2300-KtxyMX2C3R@https.bugzilla.kernel.org/>
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

--- Comment #2 from Martin Doucha (doucha@swarmtech.cz) ---
(In reply to Rafael Ristovski from comment #1)
> According to amdgpu devs, this is a feature where the allocated pages are
> kept around in case they are needed later on. TTM is able to release the
> memory in case the memory pressure increases.

I understand the logic behind keeping idle buffers allocated for a while. B=
ut
it does not make sense to keep them for hours after last use and the release
mechanism on increased memory pressure does not seem to be working.

When I run a large compilation overnight, starting from a fresh reboot and
shutting down all graphics software including the X server, I'll often come
back in the morning to find that 70% of all RAM is allocated in idle TTM
buffers and GCC is stuck swapping for hours. The TTM buffers were likely
allocated by some GPU-accelerated build computation halfway through the nig=
ht.
But this is harder to reproduce than the games I've mentioned in the initial
bugreport.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
