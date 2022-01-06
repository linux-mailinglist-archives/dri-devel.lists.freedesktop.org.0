Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A276C486699
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 16:16:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1A111128CA;
	Thu,  6 Jan 2022 15:16:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B604C1128CA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 15:16:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2B52B821EA
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 15:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B516C36AF3
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 15:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641482205;
 bh=a3ttlvn9dEMXFxcASRMXS0VIRkkpcylIkVpYu9t+KSQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=sA4VF/iLuoRn8IKkFMleSAJ2sUz05Djwz1XIZLyrcUUB16r5TJchk1+FKlFeX3GD5
 pey7MiBuDcGrgSKHp17hiy5e0bnmk0/buh55RNMZGY2GxGyV2yTcFOPtE3FUURx9SE
 WK06LIEvJJzgU5f44+J5oOkS+7/HstJ8/LPgWkMc00Y+kW5xl6C6IU1COd6ZzG17XF
 U1wca2AEarBoq0vTer0qy6Vlj2uRg9JTwuf5RpVZNXDSIY07v9Li5hZS5nOxMS+Knq
 OurM+IJ0mWNzj+HFMYjr9bADIfmDe3r4ko7hw1m1m8dj4ev+eNgynxltsj2dgnh+F5
 5vuSwx++XMhtA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6418EC05FF8; Thu,  6 Jan 2022 15:16:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215001] Regression in 5.15, Firmware-initialized graphics
 console selects FB_VGA16, screen corruption
Date: Thu, 06 Jan 2022 15:16:45 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(Other)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215001-2300-2pYtCJvfK5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215001-2300@https.bugzilla.kernel.org/>
References: <bug-215001-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215001

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #4 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
(In reply to Kris Karas from comment #3)

> I just bisected this bug.  "First bad commit" is
> d391c58271072d0b0fad93c82018d495b2633448

Just to be sure: did you recheck if the issue still occurs with 5.16-rc or =
the
latest 5.15.y release? There was another regression caused by this commit f=
ixed
a few weeks ago:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
h=3Dmaster&id=3Dfb561bf9abde49f7e00fdbf9ed2ccf2d86cac8ee

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
