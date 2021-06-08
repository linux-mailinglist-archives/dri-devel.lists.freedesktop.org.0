Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AC9439FD66
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 19:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1AF6E10D;
	Tue,  8 Jun 2021 17:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB136E10D
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:17:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 13E4E61359
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 17:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623172675;
 bh=4jfYgNGyH7l4WR0XaIQPdY2r3d8Qlob9jpz9wjlPMvU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rZoin114rdXVZEvewWL4hw/aRDfsz7mHPwSIE1yq2VqRaA4XW3WfnH/cWsfnyCBSO
 rAff1xx3H80TWXgxMAc2d+m6xD0/woMjCWlGRBbAfhfwwuSKHKcscxAMr+n12SyXjr
 oPgOzha40m2buNdccyToO/C8Da5V9LeRST290yjKpye/xk2BA37OX+gu5QJWy+jiQb
 bVBK4kfySYF49K28gVLNhFjsH0qwkhxdlqo9teu2fa+JsMFgu62NzPNwdYbQssufZb
 i589Y1LH4b61rCxM54Bi6WZVtVTG+qP8AzWgzjlXTclk3HsvGRkfXwWuY7h37v4ScS
 jVTbMooHFtbag==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 09D9F610D2; Tue,  8 Jun 2021 17:17:55 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213145] AMDGPU resets, timesout and crashes after "*ERROR*
 Waiting for fences timed out!"
Date: Tue, 08 Jun 2021 17:17:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: tgayoso@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213145-2300-OgtaIE4lOM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213145-2300@https.bugzilla.kernel.org/>
References: <bug-213145-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213145

--- Comment #9 from Tomas Gayoso (tgayoso@gmail.com) ---
Created attachment 297243
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297243&action=3Dedit
patch for mesa 21.1.2

Thanks for the irony.=20

Recompiling Mesa 21.1.2 with the attached patch fixes the issue for me in
kernels  5.10.42 and 5.12.9.=20

I followed this suggestion from the mesa bug report:

can you try 21.1.2 and change this line:
file: src/mesa/main/draw.c=20=20
function: validate_draw_arrays

change:
if (count < 0 || numInstances < 0)
into:
if (count <=3D 0 || numInstances <=3D 0)=20

Cheers,

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
