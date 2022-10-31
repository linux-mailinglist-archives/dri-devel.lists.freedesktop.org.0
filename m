Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9819E61402B
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 22:53:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B7010E188;
	Mon, 31 Oct 2022 21:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DF410E188
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 21:53:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1B70CB81AD3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 21:53:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B9E04C433C1
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Oct 2022 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667253183;
 bh=eu+b1PGVnl91DE+zvegdT7Ev2PTtft2AOeEJI2MQJSk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=SFQD28yqXdmgSRJ+uABtwlBcqY4mbBDazWCgsRCFYl07tq5Pamkh6NAjQZTR+2dUm
 UXfc7kxqANLsBid+paoMdhduiJeoeMsSJ251ceFcxCszZcHai+1VJTQEcWH1yk2EQC
 8iDBDVFqnlCoBUXcRpeEm/Hy2dfl4yl8ax+1ZAySsBVOMrxhw7oyZrq7lUZVnZiA4n
 6Hk/Uj06P0XA0mZUEN+nCMhnKj9ufm9t7rQBJJ+PM9uMJ5X+5/b7rBqbENO4AfrjZh
 VEMLO+F1DOY+ddASkQcwrT8tEGD01XBh/lJe7msgTDV7sfuv01+r2jDA1L6jxuC1pa
 a9gG3YTQON+rQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A0749C433E9; Mon, 31 Oct 2022 21:53:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216645] Fence fallback timer expired on ring gfx
Date: Mon, 31 Oct 2022 21:53:03 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216645-2300-rkA4tbAiEa@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216645-2300@https.bugzilla.kernel.org/>
References: <bug-216645-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216645

--- Comment #6 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Martin =C5=A0u=C5=A1la from comment #5)
> (In reply to Martin =C5=A0u=C5=A1la from comment #3)
> > After the message mention in title appears, not even a single interrupt=
 is
> > registered.
>=20
> (Valid for both interrupts of the amdgpu driver.)

There are two GPUs in the system.  You appear to be getting at least some
interrupts.

Are you using the dGPU at all or just the APU?  You might try a newer system
bios if there is one available for your system.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
