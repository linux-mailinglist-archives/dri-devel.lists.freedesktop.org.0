Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A2ADBBCE
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 23:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75F7D10E456;
	Mon, 16 Jun 2025 21:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K7S33NIV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3A2710E445
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 21:19:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 4B9A8A517F8
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 21:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E4031C4CEEE
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Jun 2025 21:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750108738;
 bh=zZE4f3c4IMLkMjKT4apL9Pt0TT6vIKPCcfetwhGQp5Q=;
 h=From:To:Subject:Date:From;
 b=K7S33NIVf1AgETjWEuOUr79Khv9PwGI0LTlIfSBs0aJOG3BmLDbZOvvBNWXe3CoL5
 OmZ3/bMNm/4UogFvoDBYjYj16hhAZXPZ8BE0MhE9WxeoyK9awQ/O3aB8GusTCZGORx
 1k5gAbceuKnIGUhVCw/hful0MEJd8p1ZzP1KKh6WMMTyr2UF++RrO0zxpzN1VtrwCG
 QsRJuydfrMffd2pOtaGGwze71hKzUKDGtc7ld5fQauLZHaGmwG3p9hSwQurIRRIlg2
 kAQjDDIuxTHzJY2wQWsm0obaMdeD5sgFWc+fPwS/ZCAS4YPq6GPgZaeAFjXvhoyxjN
 14PruVLxl3CVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D2A9CC4160E; Mon, 16 Jun 2025 21:18:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220239] New: lvds->panel not setup or used anywhere
Date: Mon, 16 Jun 2025 21:18:58 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: asrivats@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter cc
 cf_regression
Message-ID: <bug-220239-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220239

            Bug ID: 220239
           Summary: lvds->panel not setup or used anywhere
           Product: Drivers
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Other
          Assignee: drivers_other@kernel-bugs.osdl.org
          Reporter: asrivats@redhat.com
                CC: dri-devel@lists.freedesktop.org
        Regression: No

As part of of_drm_find_panel() work, I bumped into its usage in
drivers/gpu/drm/bridge/microchip-lvds.c. It looks like a panel is searched =
for
but unlike rest of the kernel drivers, its not used or setup anywhere....

Can someone explain why the panel is needed if not used?

Thanks,
Anusha

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.=
