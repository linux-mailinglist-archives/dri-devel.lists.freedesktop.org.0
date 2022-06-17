Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6447654FFBA
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 00:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E2F10E086;
	Fri, 17 Jun 2022 22:08:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C4E910E086
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 22:08:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6F0E0620E0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 22:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CF89AC341C0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 22:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655503681;
 bh=7C8JxqjnRbHD3xBT6PElGCVHjh2yGXD4jkHeWBKhOls=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oa5C2o7KmeOIBT4HmABLwcpdDRwP1QNgBl613g+6eNt5kcvP9R+CGF8Wbxi6byzIj
 j2yOETqDFcNZHo7/KF8RjJM1SEeIlWweqm0iOqrPNn1jjy6Te1ncGXMHGKsNpHla53
 4ZYEpx+ITINj6H3ryC/LIYh8lWhoQ39n+oqiOx8ekaW8HXmhQXeRB5xSYh55bYIisF
 12eH8dJUtd5HVhwIatIEHaRHGEjHc9SUUZVHhXUpT8mg6SyS+MHnnjgZduZHi5ubX8
 7h0sO6/waukbDvq723x/qtpkTXLVNh4M6Q5x4+E7oaKNrIJXbDreDw9gew18camUfj
 vFy+j2Ur6os3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B5331CC13B1; Fri, 17 Jun 2022 22:08:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216143] [bisected] garbled screen when starting X + dmesg
 cluttered with "[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the
 dependencies handling -1431655766!"
Date: Fri, 17 Jun 2022 22:08:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216143-2300-zNBRgXEsws@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216143-2300@https.bugzilla.kernel.org/>
References: <bug-216143-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216143

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Ok, seems to be commit   94f4c4965e5513ba624488f4b601d6b385635aec drm/amdgp=
u:
partial revert "remove ctx->lock" v2   specifically.

Reverting it on top of v5.19-rc2 gives me working X again and also the
"[drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Failed in the dependencies handling
-1431655766!" errors disappear from dmesg.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
