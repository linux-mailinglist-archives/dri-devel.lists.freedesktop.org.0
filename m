Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A402F662DB4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 18:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BAA810E211;
	Mon,  9 Jan 2023 17:53:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2424910E211
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 17:53:42 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C2F2BB80EA0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 17:53:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F9F3C433F2
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 17:53:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673286819;
 bh=hkIpcUFI69jGTMtGcwGNKAUXB42b0kehSxr8OFZn/cY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oF7EN5H1PXaKECV87LkM8SUDVVNdX2s2yPSMQDHdq3JMwNH1fcX/TxjMtJsY/B2jG
 7xRFK+iS301e7U3XQKfMoA5iajGsZ91mL1gA7ehw5JxOneBzgWJiAVWkP/IXow1sn9
 JmmN1ZIOp3gGwD4J7AX1f7e0lg7OHgctM33yNjZhyybcH21++/lN6mK6xouNrbF0Tx
 uLEPbgRCHrlpa8RthpXgklVpbYYMJvZtl3SORyVLq0A5KfE6mF5NXvnCEwkvYTajDB
 Fjak/3yYyPYVgkab3ngftggOpTK5z36B4+aZMU6qEhr82UrohvepC3lKzYsGzFkHq8
 0bPSqRPKbOs9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6AAA9C004D5; Mon,  9 Jan 2023 17:53:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 211189] vgaarb overrides boot device unexpectedly with Intel
 and discrete AMDGPU
Date: Mon, 09 Jan 2023 17:53:39 +0000
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
Message-ID: <bug-211189-2300-gikmsEE0qV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211189-2300@https.bugzilla.kernel.org/>
References: <bug-211189-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D211189

--- Comment #7 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Eduardo Medina from comment #6)
> How I do to check that? I force the use of the iGPU from the motherboard,
> but even with that the system identifies the dedicated card as the iGPU a=
nd
> vice versa.

When you boot the system, before the OS loads, what GPU displays the sbios
splash screen?  If it's always the dGPU, regardless of what you set in the
sbios, it sounds like the sbios is broken and just always sets the dGPU as
default.  The Linux kernel looks at what the pre-OS environment left when t=
he
kernel loads.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
