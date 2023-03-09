Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0466B1B5A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 07:23:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FAA10E798;
	Thu,  9 Mar 2023 06:23:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDB8010E798
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 06:23:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2492A619E0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 06:23:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B558C433EF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 06:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678342985;
 bh=2sjIKESzv9QBFUm6Oy3gTwyA3zUQctN5fZDqnvPQGcU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=q0UsFRgnqClvqMiMCP5de+B3xvjo1YfjCnw0X1++w4Q6gnQuZxkANuSlSIZQAezWT
 vHQDmqMBt2VfZ28YMNHB0kaQFtVOYe5wUmBtKT7Q3x/sWnhgM3qVpKmi/10rqlAteV
 TLwI/32YamQ+KinTG3uf3xTcg01B/jWqrkK6TyF9aApuVLPeozaeIoRKkwwDF/thsj
 bi7oYfSph0ak0mPjJrT+E9g+nUnjDoGc+W33txREVmOuRkeAE0BcbWzf8Hpf2ayxDX
 RRw71JqMa+EvYqzsC1HUdtd9fV6uLBUkn5FYFQRnjxJ7Ah4JRXmnHQcJnv7VKbOTwf
 Hg8pueIh2IRzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 76DA4C43144; Thu,  9 Mar 2023 06:23:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Thu, 09 Mar 2023 06:23:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierre-bugzilla@ossman.eu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216625-2300-QQFAjQUq6R@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216625-2300@https.bugzilla.kernel.org/>
References: <bug-216625-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216625

--- Comment #10 from Pierre Ossman (pierre-bugzilla@ossman.eu) ---
I finally got that old version of mesa to build. Unfortunately, the hangs s=
till
happen even with that. :/

> Mar 09 07:18:30 kernel: radeon 0000:00:01.0: ring 3 stalled for more than
> 10028msec
> Mar 09 07:18:30 kernel: radeon 0000:00:01.0: GPU lockup (current fence id
> 0x000000000000fa91 last fence id 0x000000000000fabc on ring 3)
> Mar 09 07:18:31 kernel: radeon 0000:00:01.0: ring 5 stalled for more than
> 10077msec
> Mar 09 07:18:31 kernel: radeon 0000:00:01.0: GPU lockup (current fence id
> 0x00000000000018fb last fence id 0x00000000000018fe on ring 5)
> Mar 09 07:18:31 kernel: radeon 0000:00:01.0: ring 0 stalled for more than
> 10202msec
> ...

What can we do next to pinpoint this?

It seems to fail rather reliably after a suspend/resume. Is there some test
suite I can run to provoke things?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
