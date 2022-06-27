Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE9B55BC80
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 01:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9757010E0E8;
	Mon, 27 Jun 2022 23:48:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25A210E0E8
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 23:48:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5DC72B81982
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 23:48:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 250CBC385A2
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jun 2022 23:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656373693;
 bh=xEMAKKJkIZv0rf+69Va08P/xJNQPmeBLFdankVzflh0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OP4yFhQ0kleNQWEm2iKjCv9iL/XXL1MDaOBHuKXsaNrdAkI7u7e/vT7XgdCFmIMFT
 pbP86+UruvJrP7bkNqjpRtL2WlRQ9gHmR+S9r9hwZwjrL7q5iEOgRRJmzr2o9QJ8M1
 x+wGDidHNihJ93J1Qup/fuwpsYVF+l0SDrELwm5DOWm0bbEzJ5qYydDa0131b4+toC
 jDjL5qIQAwQFTX8kJH10jCYZT0adNceiOoRDBDi2DHhROjc42LmeT6pC+O85bqNdee
 AxXBewA/snqKyqd3kAC1S36nrdB9wDUDPyITAveBQLTteM1OljWIQgbDh99CSMkMiJ
 V6E08DAWFhlEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0AF9CCC13B5; Mon, 27 Jun 2022 23:48:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Mon, 27 Jun 2022 23:48:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216119-2300-AgHDUEeS3c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #23 from Harald Judt (h.judt@gmx.at) ---
Created attachment 301291
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D301291&action=3Dedit
mailing-list-patch-adapted-for-5.18.7.patch

I had to adapt the patch for 5.18.7. I hope this is right, there is only a
difference in a struct it seems.
Unfortunately, it did not help. Screen suspended, comes back after a while,
goes blank again (but powered on), also keyboard back for sysreq, but ssh
unresponsive.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
