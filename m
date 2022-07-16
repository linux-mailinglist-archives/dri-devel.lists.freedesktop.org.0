Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D949E5771F9
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 00:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E298112D6F;
	Sat, 16 Jul 2022 22:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E28112C5C
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 22:39:56 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7551461325
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 22:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6BA1C341CD
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Jul 2022 22:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658011191;
 bh=wSGExP8TriGg8/nb6ZcVNW72Uc062Fis1orZjojJk2M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=FWV9WqXa+/+Kgt2UzJBdFD9Kc0kKXoTesmSy7kkIc23COxqUHnNPGfgmIYcwkUUgS
 H7ozmEzxTyabOFOrPLb5E9nBG6SyuEOS4jU4lar5SPMe5GkPw+wqxlUwjjlV9YqSRK
 zFnXlvoclhexR2ukoDxQEzf3+65arf4YHSBTHusmipinDJJjh7Rx7XaNpHAnq+M4gH
 rrzjjRrS/FMTsccLZJxwahi33aLJXO/dMTh6PwmW5z9ZicwGMjVxoNDpwXIoKJXQk2
 e9M8TDl5DW/XBV72MZCkGIanoeKZjv6zpNOTGXQqxJ5SrKSVm693AdyVcDC+AnLE7s
 yPAVirDLVF0Ow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C136ACAC6E2; Sat, 16 Jul 2022 22:39:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Sat, 16 Jul 2022 22:39:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-bU6zZVLvlJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #32 from Harald Judt (h.judt@gmx.at) ---
There still seem to be issues with the shared fb implementation and
hibernation. After resume, chvt to another vt causes the following errors in
dmesg:

[  975.920944] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft
recovered
[  986.160803] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft
recovered
[  996.400610] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft
recovered
[ 1006.640916] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft
recovered
[ 1016.880923] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft
recovered
[ 1027.120907] [drm:amdgpu_job_timedout] *ERROR* ring gfx timeout, but soft
recovered

And the machine gets stuck/freezes, except one can ssh in and reboot it. So
only the graphical display will not restore properly. Also, if I reboot the
machine and the error above does not occur, then the console (not X display=
) is
somehow misaligned, that is the messages are not printed on the most-left
column, but a bit more in the middle of the screen.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
