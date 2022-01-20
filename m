Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3478D4946F7
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 06:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C088910E72A;
	Thu, 20 Jan 2022 05:27:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DAEA10E731
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EF2A1B81CDB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BE1F1C340EB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jan 2022 05:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642656446;
 bh=qTE/TpxDTLQFnQHHAwR7Zmqq+USIUpmjuX4O0ridlTU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Sw4PXWbCPSCebcN6gD0fy2bTlKsolJrPXAlwQ4ZDj5es4zz90PDbOrSsrHH44ncJX
 sJCItLzmUZY3OP8yiYHm1lpM5CSuHkdEpkE0vpuEx8yQCmBTCK0umg7Dgvpals+GuI
 yBCLV/cyNdoigDbGFsaqA0YkRrZlhXOBBudz9EfjMIXbC8kLfn+3b1hnsIYiw4N9dZ
 TLL0SzJ3vk69hs4VtAxSYosEsO/CKUel3ydN/UuCdcag7KI5Q211oAJVW03GYlP1Of
 WIZ0x6RQ9PhB///59ok6te8fa2aMqN9F/kYF4kYblXjQ0x7+USBNbqDMwuHISr0WRl
 kR2C7fq4m4krg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9FAB2CC13A7; Thu, 20 Jan 2022 05:27:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213561] [bisected][regression] GFX10 AMDGPUs can no longer
 enter idle state after commit. Commit has been pushed to stable branches too.
Date: Thu, 20 Jan 2022 05:27:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: soshial@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213561-2300-wke7QfFIS9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213561-2300@https.bugzilla.kernel.org/>
References: <bug-213561-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213561

soshial@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |soshial@gmail.com

--- Comment #15 from soshial@gmail.com ---
I have exactly the same problem on my Dell XPS 9575 laptop.

GPU: AMD Polaris 22 XL [Radeon RX Vega M GL].
Kernel: 5.15.12

Several months ago there was no such problem. The amdgpu is always in D0 st=
ate
and fans are spinning all the time. How may I help to fix the problem?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
