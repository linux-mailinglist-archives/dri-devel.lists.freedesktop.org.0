Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D93861412AF
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 22:16:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88BC26F926;
	Fri, 17 Jan 2020 21:16:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2D7E6F926
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2020 21:16:45 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206141] VCE UVD ring test failed -110
Date: Fri, 17 Jan 2020 21:16:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206141-2300-iIfZqeJnVy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206141-2300@https.bugzilla.kernel.org/>
References: <bug-206141-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=206141

--- Comment #8 from Alex Deucher (alexdeucher@gmail.com) ---
(In reply to Janpieter Sollie from comment #7)
> Is it possible to disable the UVD/VCE engine on the original GPU?
> I mean, it's not used anyway, so I might as well disable it completely to
> avoid these errors.

Yes.  Set the amdgpu.ip_block_mask module parameter on the kernel command line
in grub.  Each bit refers to an IP.  From your log:

[    3.987749] [drm] add ip block number 0 <vi_common>
[    3.987750] [drm] add ip block number 1 <gmc_v8_0>
[    3.987751] [drm] add ip block number 2 <tonga_ih>
[    3.987752] [drm] add ip block number 3 <gfx_v8_0>
[    3.987753] [drm] add ip block number 4 <sdma_v3_0>
[    3.987753] [drm] add ip block number 5 <powerplay>
[    3.987754] [drm] add ip block number 6 <dm>
[    3.987755] [drm] add ip block number 7 <uvd_v6_0>
[    3.987755] [drm] add ip block number 8 <vce_v3_0>

bits 7 and 8 are for uvd and vce, so you can append amdgpu.ip_block_mask=0x7f
to only enable blocks 0-6.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
