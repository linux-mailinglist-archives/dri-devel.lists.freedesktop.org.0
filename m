Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 683DC1E675A
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 18:24:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D17CE8928F;
	Thu, 28 May 2020 16:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405048928F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 16:24:22 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206987] [drm] [amdgpu] Whole system crashes when the driver is
 in mode_support_and_system_configuration
Date: Thu, 28 May 2020 16:24:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jpa@kernelbug.mail.kapsi.fi
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206987-2300-wNzCdYTPKA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206987-2300@https.bugzilla.kernel.org/>
References: <bug-206987-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206987

--- Comment #18 from Petteri Aimonen (jpa@kernelbug.mail.kapsi.fi) ---
As best as I can tell, the crash seems to be caused by some floating point
exception (such as underflow/overflow) in this function call in dcn_calc_auto.c
line 176:

dcn_bw_ceil2(v->byte_per_pixel_in_dety[k], 1.0)

In dcn_bw_ceil2() the exception occurs in this instruction:

addsd  0x0(%rip),%xmm3

which is performing the addition flr + 0.00001.
At this point %xmm3 is ((int)(v->byte_per_pixel_in_dety[k] / 1.0)) * 1.0
The variable byte_per_pixel_in_dety is only assigned constant values 1.0, 2.0,
4.0, 8.0 so
I don't see any reason for addsd to cause a simd exception. I'm not sure if the
exception
is precise or if it could be delayed from some prior instruction, but AFAIK it
should be
precise because in usermode the exception handler would attempt a recovery.

Having XMM3 or MXCSR values would help, but they don't seem to get included in
the dmesg output and I'm not sure if they are available in a crash dump either.

Google search turned up
https://beowulf.beowulf.narkive.com/tAHxVcs0/simd-exception-kernel-panic-on-skylake-ep-triggered-by-openfoam
where the exception was delayed for some reason.

Analyzing the dmesgs attached to this bug report, we have following crash
locations:

Cyrax    2020-03-26 21:36: divss  xmm0,DWORD PTR [r14+0x17f8]
Cyrax    2020-04-04 07:40: divss  xmm0,DWORD PTR [r14+0x17f8]
Cyrax    2020-04-18 13:19: divss  xmm0,DWORD PTR [r14+0x17f8]
farmboy0 2020-04-19 11:43: not a simd exception
Cyrax    2020-04-23 05:15: divss  xmm0,DWORD PTR [r14+0x17f8]
Cyrax    2020-04-27 19:20: divss  xmm0,DWORD PTR [r14+0x17f8]
Cyrax    2020-05-02 14:18: divss  xmm0,DWORD PTR [r14+0x17f8]
PetteriA 2020-05-28 16:05: addsd  xmm3,QWORD PTR [rip+0x1de967]

So the crash locations appear fairly consistent for Cyrax's machine, but no two
machines have the same location.

For other users affected by this problem, it could be helpful if you install
kernel debugging symbols and use decode_stacktrace.sh to convert the raw stack
trace to code locations.

Also reported on freedesktop amd bugtracker:
https://gitlab.freedesktop.org/drm/amd/-/issues/1154

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
