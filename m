Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FEF744916
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jul 2023 15:03:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA6E10E096;
	Sat,  1 Jul 2023 13:03:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E29D10E096
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 13:03:27 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8A68B60B6B
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 13:03:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F1BB1C433C8
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Jul 2023 13:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688216606;
 bh=MgW5vQRCuFKP6Wcy0r/1qRokjiywM3jr2NoHUmNdJ9U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Cr2hCqfNxG+lJaYqI1MnPpPih0Xrl4bRX1eE+vb+fSJIVUrsGzi7PQmT0z5Qqz2H1
 CzU8qT64HloQfVZVx9exCTxJA/Q1Bibca/g1q5F6eHFZr89yfEmHThP9ID8mpj8B/B
 oryBGFKUzGQ9/8pkg7hzFfTtEelTA61p4JcHQ2po5Mj1tYwtq0oMNc2MtDrfey1A7W
 rGH/k6ZevQvL4RrOGTiCV/oRN197/NpuJ2XJZ45czbEi8xNvZTpFesYjXBeLTwhk3E
 lmr+YoSK4O9SRd9PkfI9zy9iMLK4y9CKWF2HyS8jXH3ivzEgeTILLDEUuuvzDgx8mc
 EWhhVwn4QuITQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D38AAC53BCD; Sat,  1 Jul 2023 13:03:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217621] AMDGPU - Internal 4K display used with 1920x1080 leads
 to screen flickering and distortion, regression from commit
 edcfed8671ee57bb599184f2e12a1b3e11b32306
Date: Sat, 01 Jul 2023 13:03:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: der.timosch@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217621-2300-l1PFcclKGj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217621-2300@https.bugzilla.kernel.org/>
References: <bug-217621-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217621

--- Comment #1 from Timo Schr=C3=B6der (der.timosch@gmail.com) ---
Created attachment 304515
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D304515&action=3Dedit
inxi output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
