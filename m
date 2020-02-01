Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D50314F8BA
	for <lists+dri-devel@lfdr.de>; Sat,  1 Feb 2020 16:52:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13F186E512;
	Sat,  1 Feb 2020 15:52:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80AA16E512
 for <dri-devel@lists.freedesktop.org>; Sat,  1 Feb 2020 15:51:59 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 206383] New: [drm] [amdgpu] [TTM] memory leak/out of memory
Date: Sat, 01 Feb 2020 15:51:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: info@aloisnespor.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206383-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=206383

            Bug ID: 206383
           Summary: [drm] [amdgpu] [TTM] memory leak/out of memory
           Product: Drivers
           Version: 2.5
    Kernel Version: 5.5.0
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Video(DRI - non Intel)
          Assignee: drivers_video-dri@kernel-bugs.osdl.org
          Reporter: info@aloisnespor.info
        Regression: No

Created attachment 287053
  --> https://bugzilla.kernel.org/attachment.cgi?id=287053&action=edit
dmesg

Hi all,
i bought new computer with AMD Ryzen 5 3400G and try some 'older' (2015+) linux
native games via native Steam or GOG. But mostly in all cases ended all with
memory leak (out of memory) and freezing my computer.

I try for example Cities:Skylines, Metro 2033 Redux, Metro: Last Light, Witcher
2 EE, but all ended with :

[  399.837627] [TTM] Failed to find memory space for buffer 0x0000000057dc96d3
eviction
[  399.837630] [TTM]  No space for 0000000057dc96d3 (22457 pages, 89828K, 87M)
[  399.837631] [TTM]    placement[0]=0x00060002 (1)
[  399.837632] [TTM]      has_type: 1
[  399.837632] [TTM]      use_type: 1
[  399.837633] [TTM]      flags: 0x0000000A
[  399.837634] [TTM]      gpu_offset: 0x00000000
[  399.837634] [TTM]      size: 786432
[  399.837635] [TTM]      available_caching: 0x00070000
[  399.837640] [TTM]      default_caching: 0x00010000
[  399.837641] [TTM]  0x0000000000000400-0x0000000000000401: 1: used
[  399.837642] [TTM]  0x0000000000000401-0x0000000000000443: 66: used
[  399.837643] [TTM]  0x0000000000000443-0x0000000000000445: 2: used
[  399.837644] [TTM]  0x0000000000000445-0x0000000000000447: 2: used
[  399.837644] [TTM]  0x0000000000000447-0x0000000000000449: 2: used
[  399.837645] [TTM]  0x0000000000000449-0x000000000000044b: 2: used
[  399.837646] [TTM]  0x000000000000044b-0x000000000000044d: 2: used
[  399.837647] [TTM]  0x000000000000044d-0x000000000000044f: 2: used
[  399.837648] [TTM]  0x000000000000044f-0x0000000000000451: 2: used
[  399.837649] [TTM]  0x0000000000000451-0x0000000000000453: 2: used
[  399.837649] [TTM]  0x0000000000000453-0x0000000000000455: 2: used
[  399.837650] [TTM]  0x0000000000000455-0x0000000000000456: 1: used
[  399.837651] [TTM]  0x0000000000000456-0x0000000000000556: 256: used
[  399.837651] [TTM]  0x0000000000000556-0x0000000000000557: 1: used
[  399.837652] [TTM]  0x0000000000000557-0x0000000000000558: 1: used
[  399.837653] [TTM]  0x0000000000000558-0x0000000000000559: 1: used
[  399.837653] [TTM]  0x0000000000000559-0x000000000000055a: 1: used
[  399.837654] [TTM]  0x000000000000055a-0x000000000000055b: 1: used
[  399.837654] [TTM]  0x000000000000055b-0x000000000000055c: 1: used
[  399.837655] [TTM]  0x000000000000055c-0x000000000000055d: 1: used
[  399.837656] [TTM]  0x000000000000055d-0x000000000000055e: 1: used
[  399.837656] [TTM]  0x000000000000055e-0x0000000000000560: 2: used
[  399.837657] [TTM]  0x0000000000000560-0x0000000000000561: 1: used
[  399.837658] [TTM]  0x0000000000000561-0x0000000000000562: 1: used
[  399.837659] [TTM]  0x0000000000000562-0x0000000000000563: 1: used
[  399.837659] [TTM]  0x0000000000000563-0x0000000000000565: 2: used
[  399.837660] [TTM]  0x0000000000000565-0x0000000000000665: 256: used
[  399.837661] [TTM]  0x0000000000000665-0x0000000000000766: 257: used
[  399.837661] [TTM]  0x0000000000000766-0x0000000000000767: 1: used
[  399.837662] [TTM]  0x0000000000000767-0x0000000000000800: 153: free
[  399.837663] [TTM]  0x0000000000000800-0x0000000000000900: 256: used
[  399.837663] [TTM]  0x0000000000000900-0x0000000000000cca: 970: used
[  399.837664] [TTM]  0x0000000000000cca-0x0000000000040000: 258870: free
[  399.837665] [TTM]  total: 261120, used 2097 free 259023
[  399.837669] [TTM]  man size:786432 pages, gtt available:1900 pages,
usage:3064MB
[  399.837734] [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Not enough memory for
command submission!

My configuration:
AMD Ryzen 3400G, 16GB RAM (tested by memtest86+, so should be no problem here),
HP m01-F000 series with newest BIOS AGESA 1.0.0.4.

Kernel linux-zen 5.5.zen1-1, linux-firmware-20200122.1eb2408,
mesa-19.3.3,libdrm-2.4.100

lspci, dmesg you can see in attachment


I see, i am not alone, who have this problem:
https://bbs.archlinux.org/viewtopic.php?pid=1885581

Maybe is that bug of mesa, i dont know...but i begin here. Thanks!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
