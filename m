Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24E1444438D
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 15:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C9B16E9BD;
	Wed,  3 Nov 2021 14:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 212A06E9BD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 14:29:23 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id E5EB36109F
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Nov 2021 14:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635949762;
 bh=uXM1b8fTHwmZQfaTJrFSQax3zKO2DZdE7b+C2WoJuNw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GL31inuG9A226OqmmVOO8T05dWb4WkyX16XFa4RTkrKKKMIUxll+kuwyMwS6q4ewc
 HkteQ+IjZw35ouQQNYrAaW3bBXOkabqVlMX/Fhme4fTZPXyBujksxt9DeYsAXsg48u
 mJqxD1oruU0yZ4ByT+uV8h647Ti2+fBkkUa3ajNkPejzbpWpjnQ4zsz6KOD3livTVM
 8VQ98ySTwvgH8Ff75GDhmDupPitg//aKFRRbE+eeLA2LhFE9VnHCOO28vR2VA3rVUt
 SQ2+eXs46a+w3gqqe+XVHp+Mrc6y9Y4XzEh1/9gkWrZ87PBY31YEP0YMG1SjAoKvKQ
 G01CNJgtRKgFw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DAD9B60F41; Wed,  3 Nov 2021 14:29:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 214859] drm-amdgpu-init-iommu~fd-device-init.patch introduce bug
Date: Wed, 03 Nov 2021 14:29:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jamesz@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-214859-2300-TVvMkrtdXo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214859-2300@https.bugzilla.kernel.org/>
References: <bug-214859-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D214859

--- Comment #6 from James Zhu (jamesz@amd.com) ---
Created attachment 299437
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299437&action=3Dedit
analysis for this issue

Linux 5.14.15  + afd1818 can fix the issue.

Linux 5.15rc7 re-apply "init iommu after amdkfd device init" and "move
iommu_resume before ip init/resume" which overwrote afd1818 caused the issue
again.

714d9e4 drm/amdgpu: init iommu after amdkfd device init

f02abeb drm/amdgpu: move iommu_resume before ip init/resume

afd1818 drm/amdkfd: fix boot failure when iommu is disabled in Picasso.

286826d drm/amdgpu: init iommu after amdkfd device init

9cec53c drm/amdgpu: move iommu_resume before ip init/resume

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
