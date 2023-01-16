Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13D8C66CE7B
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 19:12:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C24BA10E486;
	Mon, 16 Jan 2023 18:12:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9A610E486
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 18:12:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3D54C61119
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 18:12:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2497C433F1
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jan 2023 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673892745;
 bh=cIk/1ENhZ16n1wlV1PrD7stTCqIns9Zcd702teSvUzI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ar1EUCi2apsx24j/hJo/6ZxmEpzYXjS8mK26MggCNOj9R27YqufcTGomr/fR426Ea
 5WMvHy+tteU76DjIi5OZgDA1K8dZrrs5Q3tt7FNKsIjj+cPKjIw37YP8YgifcarLAQ
 0m+N2nPhAEvG1kagR4FcT8MHZHkvFzT1wKKRB35t57gdIWIaRz4d4GiJqWGBzDRjsN
 oRant+q6O/xxvI56xsuCPMpozXncIqWb9ART/XR+8vVzrvrf1iyjXAJI+bAz25ckHB
 B4WL8hK/wf4+m4rIBCW+B8R36Q2FFdKV9nadWaXEMRFDXa2+WpZhh4VXRqUBgHHLn8
 tMD5W2dwsMH5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 864C5C43143; Mon, 16 Jan 2023 18:12:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216917] hibernation regression since 6.0.18 (Ryzen-5650U incl.
 Radeon GPU)
Date: Mon, 16 Jan 2023 18:12:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jrf@mailbox.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216917-2300-RpzQLWAogr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216917-2300@https.bugzilla.kernel.org/>
References: <bug-216917-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216917

--- Comment #20 from Rainer Fiebig (jrf@mailbox.org) ---
(In reply to Mario Limonciello (AMD) from comment #19)
> Assuming it's within amdgpu and not DRM helpers it's still ~800 commits to
> sift through. Even though 6.0.y is EOL now, I think it would be easier to
> check the missing commit(s) from there to backport.  We can worry about
> 5.15.y after that.
>=20
> Can you see if this series from 6.1 on top of 6.0.19 helps?
>=20
> https://patchwork.freedesktop.org/series/106027/

Yes, but may take a while.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
