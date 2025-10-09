Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB08BCA449
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 18:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ED010EAA9;
	Thu,  9 Oct 2025 16:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VYHHxyvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E00610EAA9
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:57:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 576D0623B4
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07194C4CEF8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760029063;
 bh=Xg/J/1uKzd73V9euoR8DgJKQwahvkyaGAjgHZQ7KpyI=;
 h=From:To:Subject:Date:From;
 b=VYHHxyvfQTTXvXvYW6Qbl1SqebFuDj5JmHK6pBVzd8DxQyd7CzVmetk82cqTeji8q
 yHiGLXBCSu5fyromuJ1NegmKFC6eTSY92MLSOT1tvrQcFCIPIp4XesqUfD/qECqkaN
 iJkkV6Z88cF6BEkRx0n6pwLFkvLvN81KjS9euG2g4EtoetfoffkqmRBy7jEFHjcuWB
 60If0L1WhborSTj0SCExU8rmlyFKdrpwagt+ohU2k9uoDsjK1jgj2QHG/hD6GuWJ1t
 cZG895r5iNHMfBOCYuhslnV0zJ4Em7qS/dk/OT9BSShJkoNiEl4/82x0D/Eg2vesOU
 KVb+dJ6i3pxzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E86A3C41612; Thu,  9 Oct 2025 16:57:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220650] New: Kernel panic in amdgpu_cs_ioctl during Xwayland
 operation
Date: Thu, 09 Oct 2025 16:57:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tamir.z3@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression attachments.created
Message-ID: <bug-220650-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220650

            Bug ID: 220650
           Summary: Kernel panic in amdgpu_cs_ioctl during Xwayland
                    operation
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: tamir.z3@gmail.com
        Regression: No

Created attachment 308781
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308781&action=3Dedit
Kernel panic log

I seem to pretty consistently hit this bug that is caused during Xwayland
operation by running VirtualBox (running a Windows XP VM). Seems like a null
dereference.

I am on kernel version 6.17.1. Attaching the panic log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
