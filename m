Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F8E73A4B8
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 17:24:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2544010E051;
	Thu, 22 Jun 2023 15:24:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47C510E051
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 15:24:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1745261844
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 15:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A01EC433C0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jun 2023 15:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687447438;
 bh=PAuwHftMiJE6q5zelmq4a0mM2VwO0qHKFww2iPX84gQ=;
 h=From:To:Subject:Date:From;
 b=bVI6RwiLyIb9xw/362s1KLN+m2i35zXKNN5B3m7Zs+3ZmT7EPZmyZM0JupeOjkmmm
 qIK4q+HL8U9NZQ89NvtJj/6QZIoCTzUPM8H0zPyT5GSRHQgcMgB6OQpOKH5Tmc2OC3
 h2dkXFOi9c7SY+/gfP3cX3YtmeK7l6DpISdwIswlE862to1NDHMOPfygbfn7dB/ST7
 qJ5g94ndXnTeyjt2iGpS/6Nyrzj/ICDXyBWe1TnjDjepANSdOuQrOy2OW2OKNMZzqr
 xj1vpJ0RiIDZD0X5BBybmdhU3BhNLf+qAK4eZ5ADIJH7Fn33tukbi/yJLNmnu9wdEA
 Z8r/Foz5/Bz6g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 656F1C53BCD; Thu, 22 Jun 2023 15:23:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217587] New: amdgpu kernel NULL pointer dereference, address:
 0000000000000054
Date: Thu, 22 Jun 2023 15:23:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: moviuro.kernel@popho.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217587-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217587

            Bug ID: 217587
           Summary: amdgpu kernel NULL pointer dereference, address:
                    0000000000000054
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: moviuro.kernel@popho.be
        Regression: No

Created attachment 304471
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304471&action=3Dedit
dmesg (journalctl -k -b -1) & lspci -kkv

My 6.3.8 kernel says Oops, NULL pointer dereference, address: 0000000000000=
054,
when I successfully unlock my Xorg session that is locked by xsecurelock
(https://github.com/google/xsecurelock) when my screen(s) have not yet turn=
ed
back on.

* Lock the screen with `xsecurelock(1)`
* Wait until the monitors go to sleep (I unplug my mouse and keyboard thank=
s to
a little USB KVM)
* Quickly type my password and <enter> to unlock my session before the scre=
ens
turn back on

Unexpected: machine ~freeze (X11 not responsive, machine won't reboot prope=
rly
(`reboot`), but I can initiate a SSH session and `echo b > /proc/sysrq-targ=
et`)

The attached dmesg was obtained with `drm=3Ddebug=3D4` in cmdline.

`lspci -kkv` also attached.

Hardware list: B550 Phantom Gaming-ITX, 5800X, RX6950XT reference design ca=
rd.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
