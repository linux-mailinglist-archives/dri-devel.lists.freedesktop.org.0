Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090AD6F67FE
	for <lists+dri-devel@lfdr.de>; Thu,  4 May 2023 11:09:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DDAF10E3F9;
	Thu,  4 May 2023 09:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D03F10E3F9
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:09:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F07E56328B
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:09:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EF1BC433EF
 for <dri-devel@lists.freedesktop.org>; Thu,  4 May 2023 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683191343;
 bh=ZwEZKo3InamrramNz2ioaue2C3LuBELln8pSEvHCrSk=;
 h=From:To:Subject:Date:From;
 b=IVUO7rpln42RjarSxAPl3Mrl9iuqs/femZWW/jrd6L/JX6iS5tXqDWX86l0kHV2x8
 ntO+DACWJaIF4oACSo/Tqv08ijeBTXkjLwtaJrXUDGwOhRtfdQWjfaP1iG1wvEZR8d
 wPe008FnCAhtGkJdKzooPgm9OcxHKdCFIBt96wIkLOgsRFecf4HP3+zPK/H9zzGFYw
 tvpwSpvOJko3EbD5pqVqNl2ynlQkjRsPbfqIKn+nMNfxSoj1y+o/srOPZCBXt7JVoG
 fFwFut1iJ8Z86YILLZzRw2IXlzc/J2pJsn6JOBqQOjsiJWvqwsZ6E2ixcLKtPUQaTQ
 iFZjidFkzJNPQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 42F2AC43142; Thu,  4 May 2023 09:09:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217397] New: amdgpu module loading breaks display output - no
 signal
Date: Thu, 04 May 2023 09:09:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: a1bert@atlas.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys bug_status bug_severity priority
 component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-217397-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217397

            Bug ID: 217397
           Summary: amdgpu module loading breaks display output - no
                    signal
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.3.1
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: a1bert@atlas.cz
        Regression: No

Created attachment 304211
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304211&action=3Dedit
dmesg of 6.3.1

after loading amdgpu module of 6.3.1 kernel (from ubuntu kernel-ppa) monitor
starts "blinking" between blank screen and "no signal" message

console nor X are working

model name      : AMD Ryzen 5 5600G with Radeon Graphics

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
