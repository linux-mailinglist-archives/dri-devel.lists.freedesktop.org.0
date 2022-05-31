Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3385394AC
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 18:04:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09D510E55B;
	Tue, 31 May 2022 16:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 885DC10E55B
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 16:03:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D4C7A61445
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 16:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B063C341CE
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 16:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654013036;
 bh=x/lEj2UuXTkCcMQn8GkMRLvZi8vA5IHnG5wLT4CKX8Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=m1nGqVvaPRzVR09sDuluHDaXHxjaPdKJAfWbbqPNOSHYLjAlWjA1GQoqnXa6Wkul3
 sV0dwCqac+PxM5ejbhrzwYsEIO/SD93D9Gv6sJsXz6dUVXP3JWlb6WqgCo8lwwdaHV
 TuA11KQT9d8M3ngF4LPRtJmaZr0kb7TS7JjX7ScvRDlhx9jGIlKOeOSNYMXZ3Mo2fZ
 5vMr7GY2kKIzkSDFRWkg0ia1Wg1cTZc9oU0+HcaGaoBm3pTQzQqH682XITSriGSxh8
 zgjV7S2ijD7krUnzHg3TfI6RY2ZTiHy3MJf13Hi6tvxgj+stswqYjvn+rwzbrQOUAR
 FYviQzzjLlAJQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6AA84C05FD2; Tue, 31 May 2022 16:03:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 205089] amdgpu : drm:amdgpu_cs_ioctl : Failed to initialize
 parser -125
Date: Tue, 31 May 2022 16:03:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205089-2300-YtayY5cfmm@https.bugzilla.kernel.org/>
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

--- Comment #45 from Alex Deucher (alexdeucher@gmail.com) ---
The "Failed to initialize parser -125!" error message is a generic symptom =
of a
GPU hang and reset.  The actual cause of the GPU hang is very likely differ=
ent
for everyone.  The issue is mostly likely in mesa (which handles the user m=
ode
side of graphics and video acceleration).  An improperly set up command buf=
fer
from the user mode driver could cause a GPU hang.  In that case the kernel =
is
just the messenger.  I would suggest trying a newer or older mesa release to
see if you can narrow down the issue.  If there is a specific application t=
hat
causes the issue consistently, I would suggest opening a mesa bug report
(https://gitlab.freedesktop.org/groups/mesa/-/issues?sort=3Dupdated_desc&st=
ate=3Dopened).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
