Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE95E6D5AA6
	for <lists+dri-devel@lfdr.de>; Tue,  4 Apr 2023 10:21:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC54810E617;
	Tue,  4 Apr 2023 08:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E9D10E617
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 08:21:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2068C63008
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 08:21:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A2BCC433A8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Apr 2023 08:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680596469;
 bh=mooQ1By+Ibdpf89C+aTqhKWYVMKry0FCwCcTPA1LcYs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bj02NbfEl0ulUEB5tOH2LHZpHLlaSv2vkyE+/NNLufAYC2z0i5r23Nv3O4oGxXoIL
 bbb0o/XSq6y9kERodnIBvIbPoWKNZnTXQ5rgqiLUT8RDNKRUR+90r2b0JL/Pc9YZ9R
 EZSuhNvfy8V07fXmWrK22WW23t2+tniK77DU9uT9qfTl2E1Modhhk+Uo36xHx547oe
 q+eaLFFgDv3EKlWqyR6TCMUqjJusp3uNeMHp53I4x6aZNPSssvTjiUlLqgudVdXrJa
 w+IPF4s8GBxt2U/76CSFK5A+s8WJkdVSnctDO0124p95OfRq6lSmnjSfMJ/ot0LpNV
 1K/b8lyhyE8+Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2A8A1C43144; Tue,  4 Apr 2023 08:21:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 172421] radeon: allow to set the TMDS frequency by a special
 kernel parameter
Date: Tue, 04 Apr 2023 08:21:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: jameshendry05@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-172421-2300-2Ca8lE5GfZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-172421-2300@https.bugzilla.kernel.org/>
References: <bug-172421-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D172421

James Hendry (jameshendry05@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jameshendry05@gmail.com

--- Comment #25 from James Hendry (jameshendry05@gmail.com) ---
With the help of Elmar Stellenberger's patch to the kernel, I managed to ma=
ke a
patch to the 6.2.0 kernel that allowed me to use a DisplayPort -> HDMI adap=
tor
for my ultrawide monitor (2560x1080@60Hz). the 165Mhz was just below what i
required (I needed about 166Mhz for my monitor) so very very minimal
over-clocking to go from not working at all to working perfectly. This work=
ed
natively in windows so clearly they have determined that it is acceptable, =
so I
don't see any real risk.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
