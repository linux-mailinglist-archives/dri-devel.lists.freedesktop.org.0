Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C130E281
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 19:29:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5AA76EB2C;
	Wed,  3 Feb 2021 18:29:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DAE76EB2C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 18:29:01 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B4BAF64E24
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Feb 2021 18:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1612376940;
 bh=uJR/aXJSMkaTaTLBRItegYK+bn9FrF9A4azP1MR/bwk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gGNHjtarIKoRIM9HcQcc3w2B01PGS+5bGNX6Y7yT/4039MBx0x9h/GOQMrh7XVoII
 IvipjVEiiTBgx1IQl+fJ2jXYu9CgINtEfEFmj4OTzK73m5twsbqj4ISjXIC1XhLFkI
 AoD432uKQeigc+sAOhjH9yJ48OGuMlCt/r/VKhe2phz89R9YGVq5RcOVaybmyQ6kZK
 cnmFZo4cUdWcFKxbbRT0MM59nEChloKCp4yhVTkAHW3tiEEDjXe24AG1kr7LnNZj8i
 U+2NKN8mw5SdyYj9GF4MiVkkU7ccSW6jLZ8/qDPeTg5Gjo5F00i4s8dtLyBNr5Pqsg
 3LJnX5GNMOfIA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A9B8A65331; Wed,  3 Feb 2021 18:29:00 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211501] Kernel freeze when waking monitor from blanking / DPMS
 (AMDGPU / DC)
Date: Wed, 03 Feb 2021 18:29:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: borisovjasen@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-211501-2300-YkvcgssOym@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211501-2300@https.bugzilla.kernel.org/>
References: <bug-211501-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=211501

--- Comment #2 from Jasen Borisov (borisovjasen@protonmail.com) ---
OK, it just happened again. More info:

The secondary monitor lights up, but just shows a black screen with the mouse
cursor, but the primary monitor does not. This makes me suspect that my primary
monitor is the culprit.

As before, the kernel freezes for about a minute or so in that state, and then
recovers.

The dmesg output is shorter this time:

[Feb 3 19:20] [drm] perform_link_training_with_retries: Link training attempt 1
of 4 failed
[  +0.407677] [drm] perform_link_training_with_retries: Link training attempt 2
of 4 failed
[  +0.460615] [drm] perform_link_training_with_retries: Link training attempt 3
of 4 failed
[  +0.420583] [drm] enabling link 0 failed: 15
[  +0.177390] [drm] perform_link_training_with_retries: Link training attempt 1
of 4 failed
[  +0.060044] [drm] perform_link_training_with_retries: Link training attempt 2
of 4 failed
[  +0.111304] [drm] perform_link_training_with_retries: Link training attempt 3
of 4 failed
[  +0.159993] [drm] enabling link 0 failed: 15
[Feb 3 19:21] [drm] REG_WAIT timeout 10us * 3000 tries -
dce110_stream_encoder_dp_blank line:955

There was no backtrace like last time.

BTW, note that the kernel "thinks" that ~1 second passed, based on those
timestamps, but in reality, it was about a minute.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
