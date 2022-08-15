Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C43959307B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Aug 2022 16:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BDF012A914;
	Mon, 15 Aug 2022 14:10:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB00B8FE05
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 14:10:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 25B5A60F76
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 14:10:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85F03C4347C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Aug 2022 14:10:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660572603;
 bh=3Rk5PzTqX2pysN5On3GRzGDVnjJZvqL3FvDK25uprL8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Xk6EJ5NF67Uir0hj7ERDqe7yv4b3v2HLf5G/7UOY2yIWQ4jqIetHe4/+SMmvg8lrZ
 PsUpYqEeAGj4m0i88fZ7o0O6G5Wh5nZpwsrk5OIFgWV9xzdADQLahZAL1h1iQ1wLEG
 7uX+ayYR0Fq5abVrWT0f858UaFlTTwT0t19xAMOQxxVH8pawHSxHvm/kX8Vl6wvYsX
 O8zDVMIJLK/WZ3rQvBifE6J+YsKUUj8HBJjKFN13SlvTGvCgQvOboSR5JRYPCMEr36
 0CGCvLHSWjvrGf4aHvTNbflmbXV/aMRdjHKZ+4ML+XHp5oTo8JnOU32PaujR2GSNfI
 JIfV/K9W1l7Vw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 76EDCC433E7; Mon, 15 Aug 2022 14:10:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Mon, 15 Aug 2022 14:10:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216143-2300-hF0tzlH6NR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #11 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 301574
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301574&action=3Dedit
kernel .config (kernel 6.0-rc1, AMD Ryzen 9 5950X)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
