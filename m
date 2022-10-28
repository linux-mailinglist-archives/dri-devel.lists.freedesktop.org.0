Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEB86109C6
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 07:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4DD10E759;
	Fri, 28 Oct 2022 05:40:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244B510E759
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 05:40:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F06FA62653
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 05:40:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60551C433B5
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 05:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666935602;
 bh=4Yxe7tajfnlfl2hQjGn4qAboZjiNpv0F6LGrs3yTVPQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Q1fvP09OluWJkZ+xGDngx+L++6OGx4gJ7OymPXpvuvN41qcFYsQH1XW8LQPQb6H+a
 S9FnfupGc+uzyU7oJh58JvnkFPNz/r92s/xJvnY4cuIOizrXjq4khSIji5HqMxcDCY
 Fxj7yHghKzw0QYZSdto0yHoRu4crxhPPB7+tKjgIUkDdLZ5OOPwVZ2IwOVB27mQVsp
 2woJCci/LikNVVg6MLXAa/ov5xbI0Qld8vv1z2RAkzCX29u1Ex8WvTzf77q6unpkix
 HlwAu0dQ2b4e8KX4Rd2faK8bWpgDzAFeU0i/Rjn1dFQBvixCFESAKzEUIG9PU4D8Mm
 P+16kDqDrOekA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 48E03C433E9; Fri, 28 Oct 2022 05:40:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Fri, 28 Oct 2022 05:40:02 +0000
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
Message-ID: <bug-216625-2300-DzFixDGFqr@https.bugzilla.kernel.org/>
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

--- Comment #4 from Pierre Ossman (pierre-bugzilla@ossman.eu) ---
I just got a GPU lockup on 5.18.4. So it's either not the kernel, or a bug =
that
appeared in the 5.18 series. I'll go back to the known good kernel now and =
see
if I can get the bug there.


One thought though, even if it is mesa that happens to issue a bad sequence=
 of
commands, shouldn't the kernel driver be able to reset the GPU? It certainly
indicates that it is trying.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
