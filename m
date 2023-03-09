Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 073976B2A5D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 17:07:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF21410E180;
	Thu,  9 Mar 2023 16:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36F0310E188
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:07:45 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6A1C61C40
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:07:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 690DBC433EF
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Mar 2023 16:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1678378064;
 bh=FafPvJlGoCLnPeKY0wGjLcSzRYX3ZndUDyw4uheNIuw=;
 h=From:To:Subject:Date:From;
 b=rC8mBhTZgrxtRgH5FB3F5T1RTo2BZhJDW9ZLA9GKh3FUVJhWNfq33CDy8s3GfNAaS
 EIPA46mJrZect1VshT/jMMze3452ji9Ac4bB1+2viJIFmizoYrXrKenA/1EfGyinAL
 qH45qUBMHbmn53/KBSlJQraj4fEDJd/aRRa6PjJSSnk9IiBMnjlKaE28JzNQx5ldJV
 IRkwn4BG8oR4z4iFrgTwwt69NZzNAgoFzgnHdveqTwxNoq59KKJd4U8jZUfoP5jcdY
 jEbfnn4jGh6xgeYOX7G1glJmTVZx+NzpzGZYiOTX7Jk+TTBOUkgiZ6MoRLyb2LMUXe
 vlsFrW9rdUnoA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 541C9C43143; Thu,  9 Mar 2023 16:07:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 217168] New: mmap length not validated in drm_gem_dma_mmap()
Date: Thu, 09 Mar 2023 16:07:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mk@maintech.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-217168-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217168

            Bug ID: 217168
           Summary: mmap length not validated in drm_gem_dma_mmap()
           Product: Drivers
           Version: 2.5
    Kernel Version: 6.2
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: mk@maintech.de
        Regression: No

In the drm_gem_dma_mmap() function (drm_gem_cma_mmap() for kernel versions
before 6.1), the length of the requested mapping does not get validated aga=
inst
the length of the GEM buffer object. Therefore the user can gain full acces=
s to
the physical memory after the GEM buffer by just mmap-ing the buffer with a
larger length.


I *think* the correct way to fix this issue is to pass the actual size of t=
he
buffer as 'size' argument to the dma_mmap_wc/dma_mmap_pages function, inste=
ad
of the user-requested length. (=3D> replace "vma->vm_end - vma->vm_start" by
"dma_obj->base.size"). These functions then will validate the requested len=
gth
against the buffer size and return -ENXIO if the length is too large. But I=
 am
in no means an expert in this area, so somebody with more experience should
definitely confirm this.=20


I have discovered this issue by using mmap on on an fbdev (/dev/fb0) create=
d by
the Xilinx 'ZynqMP DisplayPort Subsystem' DRM driver
(/drivers/gpu/drm/xlnx/zynqmp_dpsub.c) and validated that I can actually use
this to gain access to the physical memory behind the framebuffer. But as t=
his
is an generic helper function of the DRM GEM framework used by many differe=
nt
DRM drivers, I assume other DRM drivers are affected in a similar way.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
