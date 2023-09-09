Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51420799743
	for <lists+dri-devel@lfdr.de>; Sat,  9 Sep 2023 12:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A0CB10E10A;
	Sat,  9 Sep 2023 10:19:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9760B10E10A
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 10:19:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D7EEFB801B9
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 10:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A249C433C9
 for <dri-devel@lists.freedesktop.org>; Sat,  9 Sep 2023 10:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1694254776;
 bh=ITneNOyRxHv0x5i9BtT2OM2d5CSf2jK6aflh3wnCKOM=;
 h=From:To:Subject:Date:From;
 b=dvCYqHI7WJUDbgu3qNtYanRcV2AXrOuHhnm8GzAzlOF6R7nJ1CaVWl0ywQCyqwg+/
 ZEeWwx6QEgiYvP8uIQQeP9DK6F4UdLRGeAQyIJcJs5RZCECXI4LWlW0dWLg8nK8plb
 MxtChtVjFT2N6AZ3d/nkvzFhA1721MnLNvejj3mLyK/TCG8UU0yHZRMsFggfSau5ba
 Z+8ky6pwuJJ9Ok6Y+AwBCYpDkKwMWB0ibnG0HqCrpw1OWdTaSayHnqhvcv8UX9jwFt
 xXdVSqZ9M/wZK1QwJKCoDJjd6cMlaqiP0sc5Z7peHChhijEZeeZz+ay+ewtq624ax+
 p6jFGTjZsvhuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 51DF8C53BC6; Sat,  9 Sep 2023 10:19:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217892] New: [amdgpu]: system freezes when trying to turn back
 on monitor
Date: Sat, 09 Sep 2023 10:19:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mmk+bugs@levelnine.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-217892-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217892

            Bug ID: 217892
           Summary: [amdgpu]: system freezes when trying to turn back on
                    monitor
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mmk+bugs@levelnine.at
        Regression: No

Hi,

My setup is a dual monitor 4K/144Hz with running sway on it. Both monitors =
are
connected via DP to a Advanced Micro Devices, Inc. [AMD/ATI] Navi 31 [Radeo=
n RX
7900 XT/7900 XTX]. Usually if i don't change monitor settings everything wo=
rks
as expected. The monitors do also wake up flawlessly after system idling.=20

However, sometimes i turn off the second monitor (for example for playing
games). For that i made a shortcut in sway which looks like this.=20
> bindsym $mod+Shift+F12 output DP-2 toggle

Now, turning the monitor of works as expected. However, turning it back on i
encounter following erros/problems:
Main Workspace (Desktop) freezes, second monitor tries to get turned on. (T=
he
monitor led goes up)
After some time (couple of seconds, around 10-15sec) the main desktop works
again, the second screen goes off again.
At that point i usually have to reboot the system to get the second monitor
back.

In dmesg is see following entries:
[ 8623.325357] [drm] enabling link 1 failed: 15
[ 8623.382238] [drm] REG_WAIT timeout 10us * 5000 tries -
enc32_stream_encoder_dp_unblank line:348
[ 8623.437493] [drm] REG_WAIT timeout 10us * 5000 tries -
enc32_stream_encoder_dp_unblank line:357
[ 8638.435963] [drm:amdgpu_dm_atomic_check] *ERROR* [CRTC:81:crtc-3] hw_don=
e or
flip_done timed out

This is also something which can be reproduces quite easily. However someti=
mes
it works almost without problems. (in that case, the monitor comes back but=
 the
desktop on the main monitor looks distorted/corruped - maximizing a applica=
tion
fixes that)

This also seems to be a regression. With kernel 6.2 and 6.3 this worked as
expected.

I'm using following kernel:
Linux x2 6.5.2-gentoo #1 SMP PREEMPT_DYNAMIC Sat Sep  9 00:29:42 CEST 2023
x86_64 AMD Ryzen 9 7950X3D 16-Core Processor AuthenticAMD GNU/Linux

As soon as there is a linux-6.6 kernel available in gentoo i'll try that one
too.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
