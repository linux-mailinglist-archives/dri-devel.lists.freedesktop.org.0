Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F11481C55
	for <lists+dri-devel@lfdr.de>; Thu, 30 Dec 2021 14:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD36B10E126;
	Thu, 30 Dec 2021 13:03:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2B7E10E126
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 13:03:52 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5F356B81BBE
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 13:03:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A569CC36B00
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Dec 2021 13:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640869426;
 bh=svt0OmpFyj+Ot4lL06U5hxn7MfafvwSqlXND85rcdzg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=O5z3Mf5Q5ZfPOPiNGHLoOH1mus/26WDdUOPNkX63e2Uv2L/7tS1xoohmU6u9Pefhc
 jB7wf+h6FemgJbXeGkD/Hicrmlm+3guDC4Fg7K4IXN/1opTSIHv5RvIVpEVCj8pnej
 HsIIY7IEh+zv57GC6y7Z+MQSaNcATt49R3JG/ZGofYOJ9tC4g8bla+9z4effTj/8+c
 Ta52md4stcaWi1PM9R/UU41xY+KOCw3oc9yPx4kFKLmQ1NAwngMq6fQ3e9Oif2tGcT
 rYtQ70qUDnxJAiQ94SAm5nAOM7U2vWM2I1UUOwZiyztmCHImC90yUsCkL1NPlqWJ2S
 9ymBEj/ixfFyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8818EC05FCB; Thu, 30 Dec 2021 13:03:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 215436] admgpu: suspend and resuming from suspend don't work
Date: Thu, 30 Dec 2021 13:03:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spasswolf@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215436-2300-DfEufwoSI7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215436-2300@https.bugzilla.kernel.org/>
References: <bug-215436-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215436

--- Comment #3 from spasswolf@web.de ---
I added printk at the beginnig and exit(s) of rn_clocks_update:
This is the result when resuming from suspend on commit
d020970959169627d59a711769f8c4b87bf5f90c

Dec 30 13:55:42 lisa kernel: [  140.198849] PM: suspend exit
Dec 30 13:55:42 lisa kernel: [  140.208063] amdgpu: entering rn_update_cloc=
ks
...
Dec 30 13:55:42 lisa kernel: [  140.209251] amdgpu: leaving rn_update_clocks
...
Dec 30 13:55:42 lisa kernel: [  140.211147] amdgpu: entering rn_update_cloc=
ks
...
Dec 30 13:55:42 lisa kernel: [  140.211148] amdgpu: leaving rn_update_clocks
...
Dec 30 13:55:42 lisa kernel: [  140.226830] Generic FE-GE Realtek PHY
r8169-0-500:00: attached PHY driver (mii_bus:phy_addr=3Dr8169-0-500:00, irq=
=3DMAC)
Dec 30 13:55:42 lisa kernel: [  140.277915] amdgpu: entering rn_update_cloc=
ks
...
Dec 30 13:55:42 lisa kernel: [  140.277925] amdgpu: leaving rn_update_clocks
...
Dec 30 13:55:42 lisa kernel: [  140.278233] amdgpu: entering rn_update_cloc=
ks
...
Dec 30 13:55:42 lisa kernel: [  140.278234] amdgpu: leaving rn_update_clocks
...

In this case the system does not hang, but suspend doesn't seem to work
properly, either (Fan and keyboard do not switch off). I probably missed th=
at
during the first bisection.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
