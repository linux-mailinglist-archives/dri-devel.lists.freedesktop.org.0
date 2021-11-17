Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE3D454180
	for <lists+dri-devel@lfdr.de>; Wed, 17 Nov 2021 07:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8666E3C1;
	Wed, 17 Nov 2021 06:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75EA56E3C1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:58:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 4472F61BF4
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Nov 2021 06:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637132296;
 bh=RZES6bgo2d/yhBknALqwqcvN3LGNNkETZI+CFViUfLI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DBnJcDcO6C+ZuZBi6Pzn0HFQkO/1DGlcpVmtV0Ss7fTEuFVMLy5fYhrlqqG8L0k3L
 bIjsrkF+KlBFfpEIdNp4ti6ekKK3eMbk2gTavYw2vlYk5l7idAE9utky62AJR8Bg3H
 F1RL+NAeI0C0gD7NaXc6DFUOBbCYYmClukOiaJ3kj97iVorKPj8ulNMTGtbpvGoruB
 UqAY4r84ezrlj6am2CnbbI/ckaPv3Ta/tXKmOKN0ArpAX8a4NJngw4OwJTYeNiMX1b
 Jh+SrBcBYUkbMvMgLV/3ejG4CJVCuzjhUMP5JtNkHSv6IiIjerwVVmvnoxhFou3KYP
 3x3H63pAJxViA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3CBAD60FC3; Wed, 17 Nov 2021 06:58:16 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214991] VC4 DRM waiting for flip down makes UI freeze a while
 with kernel 5.15
Date: Wed, 17 Nov 2021 06:58:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jhp@endlessos.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214991-2300-ddJZGwwHyA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214991-2300@https.bugzilla.kernel.org/>
References: <bug-214991-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214991

--- Comment #1 from Jian-Hong Pan (jhp@endlessos.org) ---
Created attachment 299603
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299603&action=3Dedit
Full dmesg log with the patch series "drm/vc4: kms: Misc fixes for HVS comm=
its"

Thanks to Maxime's reply from
https://lore.kernel.org/lkml/20211115113348.aylgkwrmaaomqrp4@gilmour/T/

So, I applied the patch series "drm/vc4: kms: Misc fixes for HVS commits" [=
1]
based on latest mainline kernel at commit 8ab774587903 ("Merge tag
'trace-v5.16-5' of
git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/linux-trace"), which
almost equals "tags/v5.16-rc1".

However, the system hangs and becomes dead at the kernel message:

[drm] Initialized vc4 0.0.0 20140616 for gpu on minor 0

If I revert the patch series to the original mainline kernel, system can bo=
ot
up.

[1]:
https://lore.kernel.org/dri-devel/20211115113105.103275-1-maxime@cerno.tech/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
