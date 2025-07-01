Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B849AF0266
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 20:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87BF910E5F7;
	Tue,  1 Jul 2025 18:01:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LEAZxCQR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51A3310E5F3
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 18:01:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4B08A5C67C4
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 18:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEAE9C4CEEF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Jul 2025 18:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751392882;
 bh=p+lHrlnUjggYzcpnRRnIAnf4zHy2/tBsAZMysQZL5ZQ=;
 h=From:To:Subject:Date:From;
 b=LEAZxCQRWOcoc833e1pH4yYay4TsW0g70GCbp3O+LXpjgYf7HSqrnXTE84seiJtAa
 0MkF1LqHCu9OHOmCHcyiHkXSIWfsd01icV55joz0DXtmkUmnuPx9XirPdRcnOyC2ue
 L7eHiZwI+ePrybzdpZlctv7WYYg9QfN8xWbhosNea/PMjYqJeKYp1o2HfqACz0Cvod
 62/RHA1X78mzsdRqkel7vQ5ncTBoGcjpuvPfUHK4JXF9pvfN1nKgDsWlDfb6KPr77w
 Gu52YCJM9cf/3YPtJ9nfF1pRKPyM+n/LKXChYWacgUsLTovjYDgt2MwgphhmNZfqfI
 Q4XWPBLW1wGcg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E427FC4160E; Tue,  1 Jul 2025 18:01:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220304] New: [amdgpu] DisplayPort resource allocation issue
 (one blank screen)
Date: Tue, 01 Jul 2025 18:01:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jonas@sldr.se
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220304-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220304

            Bug ID: 220304
           Summary: [amdgpu] DisplayPort resource allocation issue (one
                    blank screen)
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: jonas@sldr.se
        Regression: No

I have a Lenovo laptop with an AMD Ryzen 7 (7840HS) and its integrated GPU =
ATI
Phoenix1. The laptop is connected to a Thunderbolt 4 Dell dock (WD22TB4)
through which it is connected to two 4K screens via DisplayPort. OS is NixO=
S.

The problem: after updating NixOS, my kernel jumped from 6.6.something to
6.12.something-else. During boot, all screens light up and show the boot
process, but as soon as X starts one of the external screens go dark,
complaining of no signal. X, however, still thinks the screen is there, sho=
wing
it as connected and functional. Changing the screen modes around can let me
change which screen loses signal, and reducing the resolution on one of them
brings them both back on, but then no longer in 4K. Switching the system ba=
ck
to the 6.6 kernel (but still in the latest NixOS version) "fixes" the issue,
and both 4K screen work again.

After some bisecting, I've narrowed down the window where this problem was
introduced to somewhere between 6.9.0 and 6.10-rc1. I also tested later ker=
nels
(6.13 and 6.14) which all showed the same issue. Opening this report to hav=
e it
reported, while I continue bisecting and hopefully finding the rough-ish so=
urce
of the problem.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
