Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD464606A9F
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 23:59:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC41910E1B6;
	Thu, 20 Oct 2022 21:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D62A610E1B6
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 21:59:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5A4F260E88
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 21:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1A6EC4347C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 21:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666303151;
 bh=t0CcCaauW/BYvfnLvOa703DHUABErSGxrWKlbPbqU04=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QVYp5Zb2zPlfkYMDfddmEYbmKb7uk+3QL+QBunayt36AsoPaaTrwdRlow4J4Fz14s
 eVgIa++Z/FfBqTolwsifZk6uVktprO+wFtfkzA9xG2qZQNf1oz0VBCu5IatI1cL9sc
 UXPq8NyN6xbq/fz9w/yXYBogKUHKbCIVh4ZXNgnw85WykArysiRHjXpbWIjsd5gb13
 52uCqY1SrI4dIyHIQt8qlZ4Y3X1AP2YHkxciVatEbSPZYBDwwbDmAOeqILgkL/AShR
 VBn+WeDacc9h1Trs4LFsRSozmLOlbJzsaNKP6jWtVTeMjucRLRvqb/JBkfo9n8i1BQ
 GQl+ZIiWKpvoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A1658C433E6; Thu, 20 Oct 2022 21:59:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 20 Oct 2022 21:59:11 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-oHPj8J6Skl@https.bugzilla.kernel.org/>
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

--- Comment #45 from Harald Judt (h.judt@gmx.at) ---
Thanks for the new patches.

Applying attachment 303055 and
https://patchwork.kernel.org/project/dri-devel/patch/20221020103755.24058-2=
-tzimmermann@suse.de/
on linux-5.19.16 did seem to have an effect at first, but after a few cycles
(and I booted into Windows and then resumed Linux again, switching VTs to
another X session and consoles and back, then hibernated/resumed again) the
machine crashed at resume, with the screen not frozen but dead.

I will try the whole patchset, however it seems I will have to adapt it to
5.19.16 - which needs more work - or update to the latest kernel dev release
and then try to apply it on this.

I have not yet tried the last fix, which reverts the prefer_shadow setting =
for
hawaii.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
