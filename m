Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 562BE375212
	for <lists+dri-devel@lfdr.de>; Thu,  6 May 2021 12:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7056E0F7;
	Thu,  6 May 2021 10:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BAF6E0F7
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 10:12:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 3A717613BF
 for <dri-devel@lists.freedesktop.org>; Thu,  6 May 2021 10:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620295931;
 bh=QsYpTqXnc9eg3cRYSgcB/cXcmXxB6VhdCecID0/iRiM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qnSfOfei/01dT3ghXanysGH3LnDAHI0DG15i60A5MggWAz/uPL+9FE54OS9aZgsFE
 JRxKhEmmf0A69N9dy4e0rzuvUolYdqVNEC2ZiVfnkXnoHhdjND+RmNoirn0bMEYYR+
 Ym8Ywi2hF/CedSRpaslK9p4iyoxslAUx+tajzc8PBoTnBJkyJVzxa3TnmfNUb0l2bq
 Ko6rH2vvTk2kfzNpJlwKwcB7s4ON5twH65zwsL6mp7oWTQLK271cfu8OMacNqHmJ2A
 DYSwguCdT9AwnnosmOlszofagjEntOCbpMOwLU/U5uPgnNpeE1++J9jY+Heo0uyQAP
 OwQDKr03hiXrA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3807E6129E; Thu,  6 May 2021 10:12:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 203905] amdgpu:actual_brightness has unreal/wrong value
Date: Thu, 06 May 2021 10:12:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: filip.hejsek@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-203905-2300-uXQr5AR5zg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-203905-2300@https.bugzilla.kernel.org/>
References: <bug-203905-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D203905

Filip Hejsek (filip.hejsek@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |filip.hejsek@gmail.com

--- Comment #29 from Filip Hejsek (filip.hejsek@gmail.com) ---
All the workarounds posted here are for a different bug:
https://bugzilla.kernel.org/show_bug.cgi?id=3D210263

There are three different problems:
- setting brightness doesn't work before showing something on display (the =
bug
linked above)
- actual_brightness has wrong range (this bug)
- kernel uses aux for backlight control on systems that don't support it

For the third problem, there is a patch in
https://bugzilla.opensuse.org/show_bug.cgi?id=3D1180749, and it seems to be
merged already. However, because there is no way yet to detect that aux
backlight doesn't work, the workaround has to be enabled with
amdgpu.aux_backlight=3D0 (assuming you have a kernel with the patch).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
