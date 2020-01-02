Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC50F12E443
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2020 10:11:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401358959D;
	Thu,  2 Jan 2020 09:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C17048959D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2020 09:11:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 201957] amdgpu: ring gfx timeout
Date: Thu, 02 Jan 2020 09:11:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: janpieter.sollie@dommel.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-201957-2300-nUrT7qaNA8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-201957-2300@https.bugzilla.kernel.org/>
References: <bug-201957-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=201957

--- Comment #25 from Janpieter Sollie (janpieter.sollie@dommel.be) ---
Created attachment 286575
  --> https://bugzilla.kernel.org/attachment.cgi?id=286575&action=edit
kernel config 5.4.7 Fiji

Some additional info for my case:
- Running kernel 5.4.7 (vanilla), firmware 20191108 on gentoo
- Dmesg | grep -E "(drm)|(amdgpu)":
[    3.930023] [drm] amdgpu kernel modesetting enabled.
[    3.930217] amdgpu 0000:0a:00.0: remove_conflicting_pci_framebuffers: bar 0:
0xe0000000 -> 0xefffffff
[    3.930219] amdgpu 0000:0a:00.0: remove_conflicting_pci_framebuffers: bar 2:
0xf0000000 -> 0xf01fffff
[    3.930221] amdgpu 0000:0a:00.0: remove_conflicting_pci_framebuffers: bar 5:
0xfce00000 -> 0xfce3ffff
[    3.930224] fb0: switching to amdgpudrmfb from EFI VGA
[    3.930475] [drm] initializing kernel modesetting (FIJI 0x1002:0x7300
0x1002:0x0B36 0xCA).
[    3.930486] [drm] register mmio base: 0xFCE00000
[    3.930486] [drm] register mmio size: 262144
[    3.930495] [drm] add ip block number 0 <vi_common>
[    3.930495] [drm] add ip block number 1 <gmc_v8_0>
[    3.930496] [drm] add ip block number 2 <tonga_ih>
[    3.930497] [drm] add ip block number 3 <gfx_v8_0>
[    3.930498] [drm] add ip block number 4 <sdma_v3_0>
[    3.930498] [drm] add ip block number 5 <powerplay>
[    3.930499] [drm] add ip block number 6 <dm>
[    3.930500] [drm] add ip block number 7 <uvd_v6_0>
[    3.930500] [drm] add ip block number 8 <vce_v3_0>
[    3.930715] [drm] UVD is enabled in physical mode
[    3.930715] [drm] VCE enabled in physical mode
[    3.930743] [drm] vm size is 64 GB, 2 levels, block size is 10-bit, fragment
size is 9-bit
[    3.930751] amdgpu 0000:0a:00.0: VRAM: 4096M 0x000000F400000000 -
0x000000F4FFFFFFFF (4096M used)
[    3.930753] amdgpu 0000:0a:00.0: GART: 1024M 0x000000FF00000000 -
0x000000FF3FFFFFFF
[    3.930758] [drm] Detected VRAM RAM=4096M, BAR=256M
[    3.930759] [drm] RAM width 512bits HBM
[    3.930838] [drm] amdgpu: 4096M of VRAM memory ready
[    3.930841] [drm] amdgpu: 4096M of GTT memory ready.
[    3.930860] [drm] GART: num cpu pages 262144, num gpu pages 262144
[    3.930928] [drm] PCIE GART of 1024M enabled (table at 0x000000F4001D5000).
[    3.934174] [drm] Chained IB support enabled!
[    3.940198] amdgpu: [powerplay] hwmgr_sw_init smu backed is fiji_smu
[    3.941748] [drm] Found UVD firmware Version: 1.91 Family ID: 12
[    3.941752] [drm] UVD ENC is disabled
[    3.943542] [drm] Found VCE firmware Version: 55.2 Binary ID: 3
[    4.009146] [drm] dce110_link_encoder_construct: Failed to get
encoder_cap_info from VBIOS with error code 4!
[    4.040084] [drm] Display Core initialized with v3.2.48!
[    4.040542] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    4.040543] [drm] Driver supports precise vblank timestamp query.
[    4.067774] [drm] UVD initialized successfully.
[    4.168780] [drm] VCE initialized successfully.
[    4.170163] [drm] Cannot find any crtc or sizes
[    4.171948] [drm] Initialized amdgpu 3.35.0 20150101 for 0000:0a:00.0 on
minor 0
[    7.280062] amdgpu 0000:0a:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR*
IB test failed on uvd (-110).
[    8.400365] amdgpu 0000:0a:00.0: [drm:amdgpu_ib_ring_tests [amdgpu]] *ERROR*
IB test failed on vce0 (-110).
[    8.400370] [drm:process_one_work] *ERROR* ib ring test failed (-110).

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
