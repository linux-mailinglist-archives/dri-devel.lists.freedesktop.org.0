Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBF5B04F3E
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 05:41:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D38CB10E2B7;
	Tue, 15 Jul 2025 03:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="m26Od6kO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8FD610E2B7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 03:41:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2A8495C309E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 03:41:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD3A7C4CEE3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jul 2025 03:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752550879;
 bh=cqApSMFZXCimpL18ySCaDrtOS0bA+n/U49JIXffaHt0=;
 h=From:To:Subject:Date:From;
 b=m26Od6kO/7ZaXWN/4Xl8ufybk62lcUBjZND5xI/wSsGqKuybLPXffH/uk7JMVGW89
 Ju+RCuYC5viC06Wi/8NAC66LLJ60EHKBmpxqEegR7xQ2mtxvodiQ0ZzTGNXl/T4G6G
 lIwxDAPb7iOdmOTAOr8EWK0Ft9y1PGeDxzKv3+7nQmoNNFpDtRnz81jcoO/bIylt6J
 4PD+if+ZwMakaHD1N3UztTt6/0xSDvkzPh0fOlpMDPgEaHqwPAiBjsQON55CJWp1oH
 RHtat/J3ugloAf66Q9HTkVigGPJD6E9bwBwOwm8a28zr5WEwukXPOWa2bQUPUSpUFM
 4ICAuWaUZ43Ig==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C1B2CC41613; Tue, 15 Jul 2025 03:41:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 220339] New: Use-After-Free in vmw_surface_unref_ioctl() in
 vmwgfx DRM Driver via Stale Surface Handle Dereference
Date: Tue, 15 Jul 2025 03:41:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lewischarlie2571@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220339-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220339

            Bug ID: 220339
           Summary: Use-After-Free in vmw_surface_unref_ioctl() in vmwgfx
                    DRM Driver via Stale Surface Handle Dereference
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: lewischarlie2571@gmail.com
        Regression: No

Vulnerability Summary

A local use-after-free (UAF) vulnerability exists in the VMware graphics dr=
iver
(vmwgfx) within the Linux kernel. Specifically, the bug lies in the
vmw_surface_unref_ioctl() handler in drivers/gpu/drm/vmwgfx/vmwgfx_surface.=
c.
This function may invoke a function pointer on a freed surface object, lead=
ing
to a NULL dereference or controlled RIP hijack depending on heap state. Und=
er
controlled conditions, this can result in full local privilege escalation
(LPE).


Affected Component

Subsystem: drivers/gpu/drm/vmwgfx/

File: vmwgfx_surface.c

Function: vmw_surface_unref_ioctl()

Kernel Version: Confirmed on 6.11.2-amd64 (Kali Linux)

Upstream Impact: Likely still present upstream if no recent logic changes w=
ere
made in the unref path


Vulnerability Details

The vmw_surface_unref_ioctl() function is responsible for unreferencing sur=
face
objects allocated by vmw_surface_define_ioctl(). Internally, each surface is
tracked via struct vmw_surface, which embeds a struct vmw_resource. This
resource structure contains a function pointer table (res.func) used for
cleanup operations.

If a surface is freed (e.g., via multiple unref calls or race conditions), =
but
the object is still referenced and later used, the kernel may dereference a
dangling function pointer via:


surface->res.func->destroy(&surface->res, file_priv);

This results in:

NULL pointer dereference (if the function pointer is cleared)

Controlled RIP hijack (if the heap is sprayed with a fake struct vmw_resour=
ce
pointing into userland)

Local Privilege Escalation


Exploit Conditions

Access Vector: Local

Privileges Required: Access to /dev/dri/card0 (being in the video group whi=
ch
is unlikely for alot of users in systems but still possible)

Exploitation Primitives:

Predictable heap layout via object spraying

Memory mapped fake surface object (e.g., at 0xdead000)

Controlled overwrite of res.func or related pointers


Proof-of-Concept Summary

// PoC behavior:
1. mmap(0xdead000, ...)
2. Write fake ROP chain and fake function pointer table
3. Spray surface objects to groom heap
4. Trigger unref via ioctl()
5. RIP hijack or kernel crash


Kernel Output (dmesg):

[ 4111.830421] uaf[4350]: segfault at 0 ip 0000000000000000 sp 00007ffedac8=
4fc0
error 14 in uaf[400000+1000]
[ 4111.830485] Code: Unable to access opcode bytes at 0xffffffffffffffd6.


Root Cause

// vmw_surface_unref_ioctl() pseudocode:
surface =3D vmw_surface_lookup(dev_priv, sid);  // May return freed object
...
surface->res.func->destroy(&surface->res, file_priv);  // Dangling pointer
deref
If surface has been freed and memory is reallocated or attacker-controlled,
this dereference leads to a segfault or arbitrary code execution in kernel
mode.

Impact

Denial of Service (DoS): via NULL pointer dereference

Privilege Escalation (LPE): via RIP hijack and controlled ROP chain executi=
on
in kernel


Recommended Fix

Validate surface->res.func before use

Implement reference count protection on vmw_surface

Apply lock or RCU logic to guard against stale pointer dereference


Adittional Info:

Im waiting on the Linux Kernel to finish Building with Kasan to get the Kas=
an
Report. Once completed I will add as an attachment / comment.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
