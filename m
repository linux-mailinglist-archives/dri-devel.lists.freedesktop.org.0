Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B22962540A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 07:48:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23B110E779;
	Fri, 11 Nov 2022 06:48:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D8610E789
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 06:48:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F0F1061EB0
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 06:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60CD3C433B5
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Nov 2022 06:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668149279;
 bh=rzWdQBMIV7RiwDBYeeHDftpzj1YL/EPsVT1PLcbWBTA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cV1bYX2QLJxnrZradQIWvoYdngcLhLBWzwxJKxmrX4+i9HSrFbpWQGBl8ik130bmK
 HZTuGn2ZCt4vgzhgbfrT42Sjm6dNg97qBnmXEjkop/fpxDXaaX4L+nk9o+jFI7apUY
 IIJiSJ8JgIHnBGFIWn/dE0rH8oxMNSBRKxiRgu1OogZ0D9olabMtBx3z+P1ghae8J+
 LcTj5cWLnhkULk9ZTibus7zLpI22uoOipfytbxNDI9FQCiv5tKB/LiCvWsRGmiBtx6
 K+AJ4x8wugFXA6yHx8yRxRQRVtqvvKtvrOBKXrl7fKuxze5zhvvedaCfFmiaNefzC5
 6ZRc2PilYHyWA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 51918C433E6; Fri, 11 Nov 2022 06:47:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Fri, 11 Nov 2022 06:47:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216625-2300-5DoSxvhvF0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216625-2300@https.bugzilla.kernel.org/>
References: <bug-216625-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216625

--- Comment #5 from Pierre Ossman (pierre-bugzilla@ossman.eu) ---
The lockup happens on 5.17.2 as well, so it seems the kernel is not the most
likely suspect.

I'll see if I can try an older mesa next.

Could the issue be with the firmware? Has that changed recently for these
devices?

The last good firmware should be:

  linux-firmware-20220509-132.fc34.noarch

And the first bad firmware should be:

  linux-firmware-20220708-136.fc35.noarch

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
