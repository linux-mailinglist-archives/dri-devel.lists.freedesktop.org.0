Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 455EC6AB643
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 07:13:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2999F10E0A1;
	Mon,  6 Mar 2023 06:13:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465D310E0A1
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 06:13:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F2EF60BA4
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 06:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E86FAC4339B
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Mar 2023 06:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678083206;
 bh=+qRJQIjFAu3Qvx5OXOXmOz/Y988doElIjS08dnMGb8c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LrunsNeYdwVexyeugnZkXKfksnH94MT/pi+fcHPYp7L6ff33KZekXCBrEL4RTVQFI
 otqod6CpYOb10Aa0zXSR0HMV4Qir9739m6Ye+w5IQXbkZ02ZeDXTzSROcsAbU6VKMa
 0dBjbhm28/cbqS8WYORbeRJXOG93r6uJfAsgXSqWVcDkXK7ntNQQudUzifbqvOINCl
 ipe+rwYHHievNMTkhptZzUfe/G+y8bc8uilkT+JGB69Mk5X39UvL2S0hOK6yLDXwa3
 iWfImOny1yNj6DCn7SQh9p6RHsa9DN9Bjibq8r+TdMPINqRT4K6e341Y6v00rmYTM8
 QrStqx47VnZgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B1736C43144; Mon,  6 Mar 2023 06:13:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216625] [regression] GPU lockup on Radeon R7 Kaveri
Date: Mon, 06 Mar 2023 06:13:25 +0000
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
Message-ID: <bug-216625-2300-ma9ubdFM0L@https.bugzilla.kernel.org/>
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

--- Comment #9 from Pierre Ossman (pierre-bugzilla@ossman.eu) ---
FYI, it seems to have gotten worse since upgrading from
kernel-6.1.8-100.fc36.x86_64 to kernel-6.1.13-100.fc36.x86_64.

It now hangs more arbitrarily, not just when trying to play a video. Having
done a suspend/resume cycle is still a requirement though.

I'm struggling building the old version of mesa that still worked. It isn't
very compatible with newer LLVM, and there is something wrong with Fedora's
packaging of LLVM 12 (that seems to be the matching LLVM version for that o=
ld
mesa). I'll need some more effort to get that test up and running.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
