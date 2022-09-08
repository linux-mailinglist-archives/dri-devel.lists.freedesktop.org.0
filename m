Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E985B12E7
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 05:26:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F27010E734;
	Thu,  8 Sep 2022 03:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1118E10E734
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 03:26:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B107DB81D3E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 03:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6635EC433C1
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 03:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662607590;
 bh=UVYqPgaCR2rR5BWMGSwXIMOoPsRMbSehoCAB7rRBaWI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=tYXnwnYprazmPH9TwNL9YwOf65VmzBuoEWVFpchFajqeOD0wgPQsSl6h//PRHJ6OK
 3k7d3cWhKxfhrenEVVx570nYdUAl03ucgRmpDazt4uqo7odpKbM7ILxVAD/cYIEEmz
 tRE+xZDH0PhO0EEjlqjL+CEVC0vup7AMM0fxvAoaleO7C5IgsfH9t6sulssfjUr4ET
 Id57qui+YSdTlqRwM/93V1RabRk2sQVUR0tsySe/2TXaJISacsL0gcV66REALfK4gJ
 16dDPMsXC7JDW1Yk9VyIWAZaxunIOp1nY846KrWBuCX3yyQbhnna+Tt8kfhTInw/MF
 xZDQE5FNEHNaw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 45BAAC433E4; Thu,  8 Sep 2022 03:26:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216455] PCI AER error caused by LTR enablement on amdgpu with
 LTR disabled on video card PCIe bridge
Date: Thu, 08 Sep 2022 03:26:29 +0000
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
Message-ID: <bug-216455-2300-XadajYbvgr@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216455-2300@https.bugzilla.kernel.org/>
References: <bug-216455-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216455

--- Comment #7 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Lijo Lazar from comment #6)
> (In reply to Alex Deucher from comment #5)
> > (In reply to Lijo Lazar from comment #3)
> > > Created attachment 301760 [details]
> > > LTR Fix
> > >=20
> > > Does the attached patch help?
> >=20
> > The ASPM code in vi.c and cik.c and si.c should be similarly protected.
>=20
> Just checked. Actually, LTR settings are not changed in them.

Yes, but they do setup ASPM which should be protected with CONFIG_PCIEASPM?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
