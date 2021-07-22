Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7CA3D2D16
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jul 2021 22:03:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D776E957;
	Thu, 22 Jul 2021 20:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8A36EC8C
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:03:35 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id DFB5E60EB1
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jul 2021 20:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626984214;
 bh=iNNNhiuAwGAknCYIt9HOBBsfkKHuHvAvHNfxeoH6iGA=;
 h=From:To:Subject:Date:From;
 b=srJoKQGQaedlhzouUKvYlH2ie0if1K9R+NyIXQpNydBYg+8M0xlQ0RcITZe4kSwnl
 2HoWaDsaXaVCzIfz4ekk4K5q8S3ANPyMjKv93n8Ok59nC+zKiect1Im/sCFYu4p931
 CkyVZeXvKIdg/vpEmARIKCOP7YcO9Vbr/DXI/z1tBXAbSmehC826GApHA0otS4UD8/
 VYwaJZu8ri4jImEhunntB2KDzHM4GKetQGQZaOUUjSQdA4+CraN9+eWBB8Ihnmt9q+
 YYHJvAVcJVyxJTTOIPmE6U6qRU6lgFQh59vBU7FfYjswAZExwtpcTwf9jpMj8EYZ2J
 kxRVy0XnEJIQg==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id D441560237; Thu, 22 Jul 2021 20:03:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213823] New: Broken power management for amdgpu
Date: Thu, 22 Jul 2021 20:03:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bruno.n.pagani@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-213823-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213823

            Bug ID: 213823
           Summary: Broken power management for amdgpu
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.13.4
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: bruno.n.pagani@gmail.com
        Regression: No

Created attachment 298003
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298003&action=3Dedit
amdgpu dmesg output on 5.12

After upgrading to kernel 5.13.4 (from 5.12.15, on Arch Linux), I=E2=80=99v=
e realized
my AMD dGPU was not powering off anymore resulting in increased power
consumption, heat and noise (because of the fan trying to dissipate the hea=
t).

I=E2=80=99ve compared kernel dmesg on both kernels, and I=E2=80=99ve found =
related differences:

@@ -1,4 +1,6 @@
 [drm] amdgpu kernel modesetting enabled.
+amdgpu: CRAT table not found
+amdgpu: Virtual CRAT table created for CPU
 amdgpu: Topology: Add CPU node
 fb0: switching to amdgpudrmfb from EFI VGA
 amdgpu 0000:01:00.0: enabling device (0006 -> 0007)
@@ -14,7 +16,10 @@ amdgpu 0000:01:00.0: amdgpu: GART: 256M 0x000000FF000000=
00 -
0x000000FF0FFFFFFF
 [drm] amdgpu: 4096M of VRAM memory ready
 [drm] amdgpu: 4096M of GTT memory ready.
 amdgpu: hwmgr_sw_init smu backed is vegam_smu
+kfd kfd: amdgpu: Allocated 3969056 bytes on gart
+amdgpu: Virtual CRAT table created for GPU
 amdgpu: Topology: Add dGPU node [0x694f:0x1002]
+kfd kfd: amdgpu: added device 1002:694f
 amdgpu 0000:01:00.0: amdgpu: SE 4, SH per SE 1, CU per SH 6, active_cu_num=
ber
20
-amdgpu 0000:01:00.0: amdgpu: Using ATPX for runtime pm
-[drm] Initialized amdgpu 3.40.0 20150101 for 0000:01:00.0 on minor 1
+amdgpu 0000:01:00.0: amdgpu: Using BOCO for runtime pm
+[drm] Initialized amdgpu 3.41.0 20150101 for 0000:01:00.0 on minor 1

I=E2=80=99ve attached both excerpt matching the diff above.

FWIW, this is a Dell Precision 5530 2-in-1 with a Kaby Lake-G CPU, which ha=
s an
Intel HD 630 iGPU as well as an AMD Polaris 22 MGL XL [Radeon Pro WX Vega M=
 GL]
dGPU.

Please tell me if there is anything else that I can provide in order to fix
this.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
