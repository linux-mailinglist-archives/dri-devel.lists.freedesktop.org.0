Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23892744910
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 14:58:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8882F10E091;
	Sat,  1 Jul 2023 12:58:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1B9210E091
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 12:58:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E2F3760B09
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 12:58:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5779CC433C9
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 12:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688216294;
 bh=UshMWSFSQiG2WcRTNUO9RFFe0dI1RFyPgH686zXkcyA=;
 h=From:To:Subject:Date:From;
 b=uN/B/3uRuNDK/9uJe5DdCAolLE88veOIJhA9KRMkaiPwxjlmnxZvgm7JHaRncC/B5
 obu1w8YRWh67Hijpu5U4ShFBjCk0gTngoHhu1AV7zfPdIAnIfvPaw3jKtjvT3+SofH
 TiDubqMaR/SwhuLWAeYJBDPtxpz5hfl/+OyIkwJKRO/dpUkCZnWwTo6Egko0dySh/2
 XJO2/ZWjeaCrQ3nsqXzfaJqCZ8ulKzuHxEpqxDodeYGLpgq98S5zLWOaCDMQZCF2Z6
 rTBBtquW28KnuXq9JcQUn1hOlo1fdvobeKE7VTjLGLbq6Bjkrjj8yBtmrps0zEmrqD
 cQdlZ8nsmjfOw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 406E2C53BC6; Sat,  1 Jul 2023 12:58:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217621] New: AMDGPU - Internal 4K display used with 1920x1080
 leads to screen flickering and distortion, regression from commit
 edcfed8671ee57bb599184f2e12a1b3e11b32306
Date: Sat, 01 Jul 2023 12:58:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: der.timosch@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-217621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217621

            Bug ID: 217621
           Summary: AMDGPU - Internal 4K display used with 1920x1080 leads
                    to screen flickering and distortion, regression from
                    commit edcfed8671ee57bb599184f2e12a1b3e11b32306
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: der.timosch@gmail.com
        Regression: No

Created attachment 304514
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304514&action=3Dedit
Picture showing distorted display

I'm on Manjaro, using kernel 6.3 series. The following problem is also
reprocucible with 6.1 series (tested 6.1.36) and with NixOS using >=3D6.3.9.

I usually use my internal display and an external display with 3840x2160 and
100% scaling. I use my internal display not in its native 3840x2160 resolut=
ion
(and 200% scaling), but with 1920x1080 and 100% scaling, to prevent scaling
issues under Gnome when moving windows from one display to the other. That
worked until I updated from 6.3.8 to 6.3.9 (and lately 6.3.10). I suspected=
 the
following commit to be responsible: edcfed8671ee57bb599184f2e12a1b3e11b3230=
6.
I created a patch to revert the commit and recreated the amdgpu module and
everything is fine again.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
