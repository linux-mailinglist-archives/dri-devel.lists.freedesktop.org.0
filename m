Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF335A0BA4
	for <lists+dri-devel@lfdr.de>; Thu, 25 Aug 2022 10:37:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E70E10E0CF;
	Thu, 25 Aug 2022 08:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A50E10E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 08:37:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9F314B82778
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 08:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C913C4347C
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Aug 2022 08:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1661416633;
 bh=nk7hDBE0dMEo9J7O1On/C/rd+UqHkC0wDAcquFpx4jc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=P1/x4E10c+utzjyg8zzXqIJAg93OnKJ/tGPiEKk37aIGKHy8jxZg1FBpCZWGfziQm
 0bX1lQldaYqNRkKGlyznUhFL8CJXVlxiqURPkPVEtkWZJjP+9/+6PmBFalCMDrURXq
 24lnTOqvKlr2RU9KgKCnh0u2ASXiHFRqk1V98Aw15jy66//AFrRc1o/yAO78xRHhS3
 RQW5ph04xD6MxmgoGsbZU2DD82qiDCTZxVsbJGNLhkR114hgvbmnq8umLx3FG0VSHe
 bz5YIygXxJQHKodi5qYMu1YX9VSJ45VLltQcjg6RVoeKuD2Roguz0wJkH2yX6UMFIr
 evXWW0sjloe7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 39C2BC433E9; Thu, 25 Aug 2022 08:37:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 216119] 087451f372bf76d breaks hibernation on amdgpu Radeon R9
 390
Date: Thu, 25 Aug 2022 08:37:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: h.judt@gmx.at
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216119-2300-b2KU2x0Mlm@https.bugzilla.kernel.org/>
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

--- Comment #39 from Harald Judt (h.judt@gmx.at) ---
Switching back to the original amdgpu_fb implementation (I've reverted this=
 and
all relevant patches on stable-5.18.19), all remaining issues vanish. After=
 two
hibernate/resume cycles, I can still successfully switch vts to the console=
 and
back, and nothing freezes.

Regarding the "[drm] Fence fallback timer expired on ring sdma0 messages", =
they
also appear when using the amdgpu_fb implementation.

As for the display corruption on the console, this is an ascii art of how it
looks like - next time I'll try to take a picture.

-----------------------------------------------------------------------
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
|                       Beginning of line starts here not at column 0 |
-----------------------------------------------------------------------

Maybe that can give some clue what else could be wrong.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
