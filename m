Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B75443C45B
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 09:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDD56E171;
	Wed, 27 Oct 2021 07:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1EB6E171
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 07:49:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 747CB610E5
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 07:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635320950;
 bh=wY77vk5jdFPFLm3/kJ2n2EmMwr5vL/FprGgLU8Wc2X0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VM43lzHN38OrteTryuBhRuPhygnTcGqKsr9uNJMrpmgOZmKSfddFFZ/iA/F/sdHFR
 HEgxAr0kn+XeeeHUmKV5J44wN/QBIkzjju8ty3AYUmf2Acy8KA9jjeD41WcFxOfq3R
 rfmba0jCpena1eqW5A4aGlXH/Oqis/3KwVNG3xkr9ELRurCrSfYCIb39NQN2hlCDBY
 lRHKQGoP0MJzQexIvPW9vSgN5Nz27phB2hmsfzYLt3JAuU4IaCjuU6rvbooRKOdBfc
 kzux24jJgiFEaS6jXsNweiw/SzAPqBv0S84fwuyux4vGNn7/M6ipZ3+HpMjfwzha0y
 bgts8++H8nRSg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6F0FC60F5D; Wed, 27 Oct 2021 07:49:10 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213983] WARNING: CPU: 3 PID: 520 at
 drivers/gpu/drm/ttm/ttm_bo.c:409 ttm_bo_release+0x7a/0x803 [ttm]
Date: Wed, 27 Oct 2021 07:49:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian.koenig@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213983-2300-XzZgxn4AfA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213983-2300@https.bugzilla.kernel.org/>
References: <bug-213983-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213983

Christian K=C3=B6nig (christian.koenig@amd.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christian.koenig@amd.com

--- Comment #3 from Christian K=C3=B6nig (christian.koenig@amd.com) ---
Well what happens here is that a buffer object is released while it is pinn=
ed
and TTM now warns about doing stuff like that.

The key point is we need to figure out why the buffer is pinned in the first
place.

One possibility is that it is used for scanout and containing the displayed
picture, but from the backtrace my guess is that the buffer is shared with a
different device and pinned because of that.

Can we get an lspci output for the system?

Thanks in advance,
Christian.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
