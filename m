Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C2C4C4755
	for <lists+dri-devel@lfdr.de>; Fri, 25 Feb 2022 15:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B91C10E125;
	Fri, 25 Feb 2022 14:20:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F7510E3D3
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:20:28 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6218D61272
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:20:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 33FA4C34102
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Feb 2022 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645798827;
 bh=PlsjEYv+R6++lKGyI001dCUrSQ/bq1EAFnXOldhPyB0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=na/rFMOf2cIegKz5+/z16KI/yWSacLLyhYpdpgBEDKXlDifFmAvIoXqzUz+KYVtG0
 7diAQZF64559qSaYJnL0QwseI1Vw0zEUFkTb/b2bbGrEPB1yE3YQiBt35XoUjx5uLn
 twttclT6/RIUL1leuJCYxcHRJAZknGQtqYCg7acU6wbN09mbN8QUHy9TI7qH08XsfQ
 HNkMNalB7Lp1fxf/Vp0ObUZilAla/wm4K9ELCoH0O3eL1O6XkBVryXAJtrXv/pjlM8
 URC+N9J0ukZRn7rORuQYiyYEjVo8Gl1aMadQ8SU3I0MHWetDuT/v1qtQSfCRDBakcO
 mwPYpLcHOFhQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 238FCCAC6E2; Fri, 25 Feb 2022 14:20:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Fri, 25 Feb 2022 14:20:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-201957-2300-JmzAsDkwoy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D201957

--- Comment #67 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Randune from comment #66)
>=20
> I understand that amdgpu.runpm=3D0 is related to power management but I d=
on't
> know the specifics. Possibly Alex Deucher can chime in and specify exactly
> what this parameter does?

The runpm parameter allows you to disable runtime power management which po=
wers
down dGPUs at runtime if they are not being used (e.g., hybrid graphics lap=
tops
or desktop systems with multiple GPUs) to save power.  It does not affect
dynamic power management while the chip is powered up.  Disabling it will
increase idle power usage.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
