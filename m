Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA837547C9F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jun 2022 23:42:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2BE210E22B;
	Sun, 12 Jun 2022 21:42:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33DE410E22B
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 21:42:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 039C861177
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 21:42:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64EE0C341C0
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jun 2022 21:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655070163;
 bh=KCDZN0hzpX0k10ov3y1+0pUZlGovhEmMnrFBLErOKXw=;
 h=From:To:Subject:Date:From;
 b=IovWb1ahTJQjVHDXvR23ofet9LHF+AWNNs2PcML908F86djkF+6VZEUfXTsHXO+wK
 q1XKF++ZaW/g1swHhFbNPzgcWsW6bcFmg9/qM9RkBN7Xs7suOev7c2I0T3yTNEhSMa
 UYiBrod1gwLpDeKNbY5HJu1jmpJR2Yzld7PTkIUAMDRU06R5RyN3x/7ovBOr6SixHc
 Z14My6dnSdXTtCusYB3pRUKCU7RyjTw55ky3IhqrIL644T2omGOmpRSIomvkB/pY40
 q58yYCx3uctm35nt6PoUf/8vAnidym6hD3iSCWBuWMm6KgIxdsg53HJuOf/MGb6hdf
 s5P29I3GglRFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4C387C05FD6; Sun, 12 Jun 2022 21:42:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] New: 087451f372bf76d breaks hibernation on amdgpu
 Radeon R9 390
Date: Sun, 12 Jun 2022 21:42:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216119-2300@https.bugzilla.kernel.org/>
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

            Bug ID: 216119
           Summary: 087451f372bf76d breaks hibernation on amdgpu Radeon R9
                    390
           Product: Drivers
           Version: 2.5
    Kernel Version: v5.17+
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: h.judt@gmx.at
        Regression: No

This is a problem with amdgpu only, as I did not experience this on my other
machines, and caused by [087451f372bf76d971184caa258807b7c35aac8f] drm/amdg=
pu:
use generic fb helpers instead of setting up AMD own's
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D087451f372bf76d971184caa258807b7c35aac8f

Reverting this patch makes me a happy amdgpu user with working hibernation
again on Linux 5.18.3.

Note I did the bisect on the stable linux repo, but that shouldn't matter.

git bisect start
# good: [c19a885e12f114b799b5d0d877219f0695e0d4de] Linux 5.16.20
git bisect good c19a885e12f114b799b5d0d877219f0695e0d4de
# bad: [f443e374ae131c168a065ea1748feac6b2e76613] Linux 5.17
git bisect bad f443e374ae131c168a065ea1748feac6b2e76613
# good: [df0cc57e057f18e44dac8e6c18aba47ab53202f9] Linux 5.16
git bisect good df0cc57e057f18e44dac8e6c18aba47ab53202f9
# bad: [22ef12195e13c5ec58320dbf99ef85059a2c0820] Merge tag 'staging-5.17-r=
c1'
of git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging
git bisect bad 22ef12195e13c5ec58320dbf99ef85059a2c0820
# bad: [9bcbf894b6872216ef61faf17248ec234e3db6bc] Merge tag 'media/v5.17-1'=
 of
git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media
git bisect bad 9bcbf894b6872216ef61faf17248ec234e3db6bc
# bad: [cb6846fbb83b574c85c2a80211b402a6347b60b1] Merge tag
'amd-drm-next-5.17-2021-12-30' of ssh://gitlab.freedesktop.org/agd5f/linux =
into
drm-next
git bisect bad cb6846fbb83b574c85c2a80211b402a6347b60b1
# bad: [15bb79910fe734ad21c765d1cae762e855969caa] Merge tag
'drm-misc-next-2021-12-09' of git://anongit.freedesktop.org/drm/drm-misc in=
to
drm-next
git bisect bad 15bb79910fe734ad21c765d1cae762e855969caa
# good: [03848335b5b1faa4a4641fcf30b7c233579a45aa] drm/bridge: sn65dsi86: d=
efer
if there is no dsi host
git bisect good 03848335b5b1faa4a4641fcf30b7c233579a45aa
# good: [6bb0a0e0fd358d4f9f6ce4c2d36c1f80d7496f6a] drm/i915: Clean up
FPGA_DBG/CLAIM_ER bits
git bisect good 6bb0a0e0fd358d4f9f6ce4c2d36c1f80d7496f6a
# bad: [13d20aabd6ef501229ac002493c6f237482c47de] drm/amd/display: remove no
need NULL check before kfree
git bisect bad 13d20aabd6ef501229ac002493c6f237482c47de
# bad: [a6506cd845824fe92b1760aaf104011cc04dfa78] drm/radeon: correct
indentation
git bisect bad a6506cd845824fe92b1760aaf104011cc04dfa78
# bad: [f0d0c39149f817e5ecdff8fa164f44da455b3317] drm/amd/display: Pass pan=
el
inst to a PSR command
git bisect bad f0d0c39149f817e5ecdff8fa164f44da455b3317
# good: [574c4183ef75117f763e9f2b35e08c85f5dcad2d] drm/amdkfd: replace kgd_=
dev
in get amdgpu_amdkfd funcs
git bisect good 574c4183ef75117f763e9f2b35e08c85f5dcad2d
# bad: [b5f57384805a34f497edb8b04d694a8a1b3d81d4] drm/amdkfd: Add sysfs
bitfields and enums to uAPI
git bisect bad b5f57384805a34f497edb8b04d694a8a1b3d81d4
# good: [56c5977eae8799c9a71ee2112802fd1f1591dc3a] drm/amdkfd: replace/remo=
ve
remaining kgd_dev references
git bisect good 56c5977eae8799c9a71ee2112802fd1f1591dc3a
# bad: [087451f372bf76d971184caa258807b7c35aac8f] drm/amdgpu: use generic fb
helpers instead of setting up AMD own's.
git bisect bad 087451f372bf76d971184caa258807b7c35aac8f
# good: [b5d1d755c1344075d4f16a3e6183ed04b4d022ef] drm/amdkfd: remove kgd_d=
ev
declaration and initialization
git bisect good b5d1d755c1344075d4f16a3e6183ed04b4d022ef
# first bad commit: [087451f372bf76d971184caa258807b7c35aac8f] drm/amdgpu: =
use
generic fb helpers instead of setting up AMD own's.

lspci:
01:00.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI]
Hawaii PRO [Radeon R9 290/390] (rev 80) (prog-if 00 [VGA controller])
        Subsystem: XFX Pine Group Inc. Hawaii PRO [Radeon R9 290/390]
        Flags: bus master, fast devsel, latency 0, IRQ 25
        Memory at e0000000 (64-bit, prefetchable) [size=3D256M]
        Memory at f0000000 (64-bit, prefetchable) [size=3D8M]
        I/O ports at e000 [size=3D256]
        Memory at f7e00000 (32-bit, non-prefetchable) [size=3D256K]
        Expansion ROM at 000c0000 [disabled] [size=3D128K]
        Capabilities: <access denied>
        Kernel driver in use: amdgpu

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
