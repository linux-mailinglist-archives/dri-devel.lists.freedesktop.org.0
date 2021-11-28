Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D765E4606F3
	for <lists+dri-devel@lfdr.de>; Sun, 28 Nov 2021 15:32:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6036FF48;
	Sun, 28 Nov 2021 14:32:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06026F5CE
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 14:32:51 +0000 (UTC)
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9E9E061018
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 14:32:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id ADEC660E78
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Nov 2021 14:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638109969;
 bh=1rdzNhKysJIhNud6Lsf6nDUr3khwhm/nCEFaYIzdBok=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=u5awjQL3Df4Nms0fHAxKv5pWISWbezJlclRuhInFaq+8lhMm+4y2QtflxxedijknW
 ZGeDDfszZLoNUJNHgC2FLmcUtdk5w12SRQD2PqmGbvDAdsExb3m/4e3DcjEZS2B+Yc
 tyv/EJtQnpYTkbMwgNAGnUVGkgEhV4Iiqkvs6Z0d13OEGuMzMdYtrz33+5U46W/Z1K
 7M3q+GpnUaVPe0jpxvOCqKVQaoQNDbMHFNioa0nRCUfRY4V/VdstGtCyRGYP4YnGlU
 J96XcXS13Fv95oIhm9fYabiMQl0yWcGVnU8fU/wHeDtGS/JPPuPT+Tj3sPBCj6C0m5
 uFJPSwYMFaxQQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AB77861101; Sun, 28 Nov 2021 14:32:49 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Sun, 28 Nov 2021 14:32:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: david@qore.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-wX2EUWIGJl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205089-2300@https.bugzilla.kernel.org/>
References: <bug-205089-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D205089

--- Comment #30 from David Nichols (david@qore.org) ---
The amdgpu problems in my system were completely and definitively resolved =
with
a memcpy() patch to glibc:
https://gist.github.com/jnettlet/f6f8b49bb7c731255c46f541f875f436

The SoC I'm using (NXP LX2160A - SolidRun HoneyComb system) has a known bug
regarding PCI device memory writes that can be completely addressed with a
simple reordering of the assembly instructions in the arch-specific memcpy()
implementation.=20

In any case, this is not a kernel bug for me after all.  I can't comment on=
 the
source of the problem for others who most likely are running an x86_64 kern=
el.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
