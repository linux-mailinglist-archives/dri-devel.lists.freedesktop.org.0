Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE13606293
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 16:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8B0310E22C;
	Thu, 20 Oct 2022 14:13:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A3110E22C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 14:13:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 617E8B82763
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 14:13:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 21F85C4347C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666275186;
 bh=m3ZlWv7yCGmSH6fe4LppOayJdt/0/p4HODRVupGDsa4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XCHjuiJXHIjngp2JyLtTeNyOERbD+Ijhh7JiDfQ7xXRhMYrjhRqy0gLagP8oV0Ca+
 H0h/yoseV8f7uNHhX+TSB+KHl1+9c09b2lS0ICE8fYygiRlWVjdmbxKZMSofQVwNUE
 VG5xvPyBKd1GeYWDuzWOqkNjXDhBdN8zeE2iQyzfdvpMLa23xv0HDo60MxBNRHNwBB
 4O5bcAohKLWTkOuAyHsZZJBmDUA0OmKbKHtgJ4wPy6sLQjQIOCFx5ZtWi5ftkVN1nN
 ZAnQexh8tYBCkIiDDsYqThGaiP4M7fZjptxhl7cSG0LgFD27+34rAk83UyGn6dDQxi
 Gfnb3h6ymhVhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0B6E3C05FD6; Thu, 20 Oct 2022 14:13:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 20 Oct 2022 14:13:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216119-2300-JrRrhP1fdn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216119-2300@https.bugzilla.kernel.org/>
References: <bug-216119-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216119

--- Comment #43 from Alex Deucher (alexdeucher@gmail.com) ---
Created attachment 303055
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D303055&action=3Dedit
possible fix

Can you try this patch?  You might also try adding:
https://patchwork.kernel.org/project/dri-devel/patch/20221020103755.24058-2=
-tzimmermann@suse.de/

If those two don't help, can you try this whole set:
https://patchwork.kernel.org/project/dri-devel/list/?series=3D687097

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
