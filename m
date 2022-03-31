Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D21044EDA84
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 15:29:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFF9210F3E0;
	Thu, 31 Mar 2022 13:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65AB310F3E0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:28:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 58C1D61910
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C0ACC34115
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648733337;
 bh=IkyrwJZmVpUkpWmsPLMJRY2m4hukXOCHibtZbkiK2ms=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=m9avNEACAvrcIvCRCrocVQFmq7M4BJ1lglhqICbhjAjCN9ZBBAAa1Kdg/5Ce5tvRS
 2EPNTRRTXgTYRNHvdF2nikxWg/sfQrmXY7jxRyPjUs4bUCszmW1AM6SUwhLtBeuvSG
 bnTb1+C24FsXSrarrR0IfqdTGIYjXHqTLdViKjW7J+ScaahQgVCAd7Uif10sPmz9eD
 beGPoaWfSpfoIv16hYuX3DGB2doCftsoBfB6m5gcPMIO2W0mdBQkp70O0SP5WVvCS4
 Kw11yuaHUW/D4UeiD5Xl6Y/8ECh2ZoJMdmafw1sqrwqvZu7M1jc3Yg2/bFOnqGC9A4
 SBv3D2ATYoYjA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 157EDC05FD2; Thu, 31 Mar 2022 13:28:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214071] amdgpu idle power draw too high at +75Hz
Date: Thu, 31 Mar 2022 13:28:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214071-2300-l5NjJq31a1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214071-2300@https.bugzilla.kernel.org/>
References: <bug-214071-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214071

Alex Deucher (alexdeucher@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexdeucher@gmail.com

--- Comment #3 from Alex Deucher (alexdeucher@gmail.com) ---
The driver can only change memory clocks during display blanking periods to
avoid display glitches.  If the blanking period is too short, the driver ca=
n't
change the memory clock so it keeps it clocked high.  You could try adjusti=
ng
the modelines for the problematic modes to extend the blanking periods and =
see
if that helps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
