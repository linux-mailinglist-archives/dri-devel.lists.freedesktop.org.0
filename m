Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB4E558D315
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 07:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D447FC418F;
	Tue,  9 Aug 2022 05:09:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B9BC453A
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 05:04:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8117FB810A4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 05:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D1CDC43140
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Aug 2022 05:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660021476;
 bh=Z1dzUWc3Q6p24HgT209KQc4HsMBdp+i9+rjF6qsdDRU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iLPLJBgeT04SP+AfNbgO2hVQKswgOK5W5283bSFSf48zGdKqx2TK9KfIXOJ7paAXy
 h17tttOXCZUXSdz0ndE+Y0WtM9NtiyukjsFJNf2IAa4BXKYibZscQAZp89zETjnwQu
 uKu+8gIT8b8aJ4pbl34GMTbsd4zNoz6yyeuaPcFevVOfNrg9rdHnlrzoJgPcvNCX8a
 tJ+VD7IA0xx4UFmFVmIg1QAf6pi1Ibfa10Mxn1o5zSBZxwC/kbzUqIqQDzgFbCkhjl
 R8uU8JFoCL4qQbfc/zK4G4Rv2IEwl2DLIjOmEKz48CO7Ntd80Q/hHNVrmdZwEiykQW
 LqfnFaXES3h7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 24844C433E7; Tue,  9 Aug 2022 05:04:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Tue, 09 Aug 2022 05:04:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mario.limonciello@amd.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216119-2300-IR3mT7u3ZE@https.bugzilla.kernel.org/>
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

Mario Limonciello (AMD) (mario.limonciello@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mario.limonciello@amd.com

--- Comment #34 from Mario Limonciello (AMD) (mario.limonciello@amd.com) ---
I recently became aware that the WX3200 in my workstation wasn't working
properly after suspend-to-ram.

61:00.0 VGA compatible controller [0300]: Advanced Micro Devices, Inc.
[AMD/ATI] Lexa XT [Radeon PRO WX 3200] [1002:6981] (rev 10)

I ran a bisect, and unfortunately it came up to the commit that was created=
 for
this bug
(https://github.com/torvalds/linux/commit/3a4b1cc28fbdc2325b3e3ed7d8024995a=
75f9216)

$ git bisect log
git bisect start '--term-new=3Dbroken' '--term-old=3Dgood'
# good: [4b0986a3613c92f4ec1bdc7f60ec66fea135991f] Linux 5.18
git bisect good 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
# broken: [8843bf1f0737ecea456d2bbd19d4263d49f2d110] Linux 5.18.16
git bisect broken 8843bf1f0737ecea456d2bbd19d4263d49f2d110
# good: [ffd4c4d5293e4985092ea45ba21cad9326e2e434] drivers: staging: rtl819=
2e:
Fix deadlock in rtllib_beacons_stop()
git bisect good ffd4c4d5293e4985092ea45ba21cad9326e2e434
# good: [164f0714bae175e2f5737070d037d7475417228d] pinctrl: sunxi: a83t: Fix
NAND function name for some pins
git bisect good 164f0714bae175e2f5737070d037d7475417228d
# broken: [86fbd2844858c5aef57a28ebc3d53d298f37cc67] x86/retpoline: Use
-mfunction-return
git bisect broken 86fbd2844858c5aef57a28ebc3d53d298f37cc67
# broken: [7fc7c6d053cfca70bb81892f3f00937e5c459d5a] arm64: dts: broadcom:
bcm4908: Fix cpu node for smp boot
git bisect broken 7fc7c6d053cfca70bb81892f3f00937e5c459d5a
# good: [cd52154b924f2ea05069d4296045d9fd56a8da23] ALSA: hda - Add fixup for
Dell Latitidue E5430
git bisect good cd52154b924f2ea05069d4296045d9fd56a8da23
# good: [b8651049bdd77fa652bcf0f3157911a3a6fc4f2f] net/mlx5e: CT: Use own
workqueue instead of mlx5e priv
git bisect good b8651049bdd77fa652bcf0f3157911a3a6fc4f2f
# broken: [594cea2c09f7cd440d1ee1c4547d5bc6a646b0e4] netfilter: conntrack:
remove the percpu dying list
git bisect broken 594cea2c09f7cd440d1ee1c4547d5bc6a646b0e4
# broken: [cd486308d773d6d062a0140062458b48f8a0eb6b] ASoC: tas2764: Add post
reset delays
git bisect broken cd486308d773d6d062a0140062458b48f8a0eb6b
# broken: [4ffcacab7145080187330accafae69e87a481eec] drm/amdgpu/display:
disable prefer_shadow for generic fb helpers
git bisect broken 4ffcacab7145080187330accafae69e87a481eec
# good: [16427298f3dc02ec90bdfa31c8ef9b384ea5534a] net/mlx5e: Ring the TX
doorbell on DMA errors
git bisect good 16427298f3dc02ec90bdfa31c8ef9b384ea5534a
# good: [27dccf616a0a82f4d8004b7ee04560e7de419e63] drm/amdgpu: keep fbdev
buffers pinned during suspend
git bisect good 27dccf616a0a82f4d8004b7ee04560e7de419e63
# first broken commit: [4ffcacab7145080187330accafae69e87a481eec]
drm/amdgpu/display: disable prefer_shadow for generic fb helpers

It seems that a revert of that commit isn't the best solution as it's just
trading the S3 failure I see for your S4 failure.  But also it seems that f=
rom
your comment #32 there is still an underlying problem with using the fbdev
helper, albeit improved for you in S3.

Would you mind contrasting if S3 is working for you with/without that commi=
t?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
