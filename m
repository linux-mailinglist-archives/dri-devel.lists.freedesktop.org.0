Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB15B4C87C7
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 10:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB6D10E714;
	Tue,  1 Mar 2022 09:22:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAFB510E714
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 09:22:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 955666106E
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 09:22:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0349DC340F2
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646126561;
 bh=ZOKGX1XR1xPN6z3KRQfQ29M65A9Qr2S5ttV0QPSKAWM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ch+7G3Q+ZEOdsonr6/m2wDtdpXBkbY7na6IPxcxGUnEZmusMllGNosr1PpEG0nZZu
 r+gNDY6HXuRNqAslOPx0T4EItU2R4D/yiXAeq1/aeF780fMIGR02KTpPiJ+oZaz5Gd
 hsliluvzNqU5GM6o7WZSqdLlaYtanevI2EAOCVOj47fRWGdLePb1WUzzrXTaEz56mD
 l123kaUFHH+g5kAbmF8lujDo2NMH5+DMOYSwnS1VDefqGf55Ideo3u/3ppGHhiLSYM
 DDckYRIaw8AvAxBqabvHepV6u9ild6nHJ4VTjxiyLsoWFv4BLtBv1lGk+EiDoqS9DG
 XWf3HX600qkiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D7E6DCAC6E2; Tue,  1 Mar 2022 09:22:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215511] Dual monitor with amd 5700 causes system to hang at
 startup.
Date: Tue, 01 Mar 2022 09:22:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pr_kernel@tum.fail
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215511-2300-tLfjnUexZP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215511-2300@https.bugzilla.kernel.org/>
References: <bug-215511-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215511

Philipp Riederer (pr_kernel@tum.fail) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pr_kernel@tum.fail

--- Comment #7 from Philipp Riederer (pr_kernel@tum.fail) ---
Hi!

My Lenovo T14s (AMD) crashes with a panic (https://imgur.com/a/P6Twvov) whe=
n I
unplug/replug any monitor. This also happens when waking from DPMS.

I have bisected the issue to the same 0f591d17e36e08313b0c440b99b0e57b47e01=
a9a
as Jose. The patch (that is already mainlined, if I see that correctly) does
not help.

I have tried all kernel up to 5.15.24 -- I cannot try 5.16 as I use zfs as =
root
device the and zfs module is not (yet) compatible with 5.16.

Is there anything you would like me to try or should my issue be fixed in
5.16+?

Cheers,
Philipp

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
