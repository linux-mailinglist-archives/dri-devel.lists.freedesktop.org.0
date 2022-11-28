Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B5663A11D
	for <lists+dri-devel@lfdr.de>; Mon, 28 Nov 2022 07:19:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A364410E1AE;
	Mon, 28 Nov 2022 06:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66DE10E1AE
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 06:19:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D1E4B80B3A
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 06:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9B20C433B5
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 06:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669616351;
 bh=1A5eUdu35MNrkAUfXZi0dut76zm79UR0hJSdaaTAZ6s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YD6GIuJhdr+pLUUOZmjB8w5q2BcCIyWxD3fc6Y+lAr09aJOPukTSRI8BLfizVM/Gl
 cmKL+23ks9XircayAfCavcAY8x2QxTHMx7ypbP/F/eg5jjJmIuCVQN9N4SVIy6bAHH
 Zv4uKrhnzNVy6X3DcIkCnKuUFVzr6S7U3tfhypKy1ffP9tRq5FiHJ7GJY+Bbyn+PtC
 HoAN/7irubG787Y+WnchmduP263I6aVoAg96sADa8LfcLu1+RaEhyGN8P2HChN6MJE
 A9UJ+yGNlgcUTSmhcndf2NCwqTM3dPhDelchV8KOUzQ8SyucaHPoLT7ry97NP0ePTc
 VEWQ6U8L6C71w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8AB0BC433EA; Mon, 28 Nov 2022 06:19:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216727] [amdgpu] Failure to wake up from suspend to RAM under
 memory pressure
Date: Mon, 28 Nov 2022 06:19:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status bug_file_loc resolution short_desc
Message-ID: <bug-216727-2300-lOo5mLMJ9Y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216727-2300@https.bugzilla.kernel.org/>
References: <bug-216727-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216727

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                URL|                            |https://gitlab.freedesktop.
                   |                            |org/drm/amd/-/issues/2223
         Resolution|---                         |CODE_FIX
            Summary|Failure to wake up from     |[amdgpu] Failure to wake up
                   |suspend to RAM              |from suspend to RAM under
                   |                            |memory pressure

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
