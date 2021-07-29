Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31E083D9A00
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:12:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0326E218;
	Thu, 29 Jul 2021 00:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8FD6E218
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 00:12:54 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id EB8DB60F43
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 00:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627517574;
 bh=OCE5tyeb7l1if9Bhf8DyCpuBRx0KbwprbbPZRvS7WzM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jIoSlsEHhC4q5treoRfu7aZlyNQEoMH3l4aeDFM5ow9AC7ulb+29zP1TWyd6/zH2h
 p1l/b9+plB1MTj4OafMu0jlghUio2yUeizpLF8079MLCJuEmcDqK/i8/xRr9eTU213
 eO2D/9vgVsZkQTfTX4mlGNc1Xt5QexjU6++Jz4U4JIwSAi8QoFhKE4hVBvHmmUJZsW
 +GYDy5U6pX+79+5Yuvxi2BfMgwGtzbWGfsqSvlbjLeKEYqUxVCJPwWVPuRe/tT+dz0
 gNAY08prxMVsNhWLyGYylcgIputORsLmk4xxvbKt+R1pFQZHpS9W6jjj8IULkA8rO4
 4H6CjeswPqK3g==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id DFAE960ED6; Thu, 29 Jul 2021 00:12:53 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213373] [drm] [radeon] memory leak at parsing
 radeon_atombios_parse_power_table
Date: Thu, 29 Jul 2021 00:12:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-213373-2300-P3nKt7B6IL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213373-2300@https.bugzilla.kernel.org/>
References: <bug-213373-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213373

Erhard F. (erhard_f@mailbox.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #297249|0                           |1
        is obsolete|                            |

--- Comment #4 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 298097
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D298097&action=3Dedit
kernel dmesg (5.14-rc3, eMachines E620)

output of /sys/kernel/debug/kmemleak on kernel v5.14-rc3:

unreferenced object 0xffff8881098e35a8 (size 96):
  comm "systemd-udevd", pid 128, jiffies 4294889391 (age 6947.280s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 00 7d 24 01 81 88 ff ff  .........}$.....
    01 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffffa23f427c>] __kmalloc+0x16d/0x1df
    [<ffffffffc0a61447>] radeon_atombios_parse_power_table_1_3+0x446/0x1b26
[radeon]
    [<ffffffffc0a6f8db>] radeon_atombios_get_power_modes+0x149/0x188d [rade=
on]
    [<ffffffffc0b19ade>] radeon_pm_init+0x1002/0x18d1 [radeon]
    [<ffffffffc0aec0b5>] rs690_init+0x763/0x83f [radeon]
    [<ffffffffc0a59459>] radeon_device_init+0x1c1a/0x21c1 [radeon]
    [<ffffffffc0a5c24a>] radeon_driver_load_kms+0x1ef/0x408 [radeon]
    [<ffffffffc03d90f4>] drm_dev_register+0x255/0x4a0 [drm]
    [<ffffffffc0a55405>] radeon_pci_probe+0x132/0x15e [radeon]
    [<ffffffffa2a96484>] pci_device_probe+0x1aa/0x294
    [<ffffffffa2bc91aa>] really_probe+0x28f/0x76b
    [<ffffffffa2bc9825>] __driver_probe_device+0x19f/0x1ee
    [<ffffffffa2bc98b8>] driver_probe_device+0x44/0xbb
    [<ffffffffa2bca212>] __driver_attach+0x1a2/0x1d4
    [<ffffffffa2bc4cc7>] bus_for_each_dev+0xfa/0x146
    [<ffffffffa2bc6d81>] bus_add_driver+0x2b3/0x447
unreferenced object 0xffff888101247d00 (size 64):
  comm "systemd-udevd", pid 128, jiffies 4294889391 (age 6947.280s)
  hex dump (first 32 bytes):
    00 00 00 00 40 9c 00 00 00 00 00 00 00 00 00 00  ....@...........
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<ffffffffa23f4407>] kmem_cache_alloc_trace+0x119/0x169
    [<ffffffffc0a6154e>] radeon_atombios_parse_power_table_1_3+0x54d/0x1b26
[radeon]
    [<ffffffffc0a6f8db>] radeon_atombios_get_power_modes+0x149/0x188d [rade=
on]
    [<ffffffffc0b19ade>] radeon_pm_init+0x1002/0x18d1 [radeon]
    [<ffffffffc0aec0b5>] rs690_init+0x763/0x83f [radeon]
    [<ffffffffc0a59459>] radeon_device_init+0x1c1a/0x21c1 [radeon]
    [<ffffffffc0a5c24a>] radeon_driver_load_kms+0x1ef/0x408 [radeon]
    [<ffffffffc03d90f4>] drm_dev_register+0x255/0x4a0 [drm]
    [<ffffffffc0a55405>] radeon_pci_probe+0x132/0x15e [radeon]
    [<ffffffffa2a96484>] pci_device_probe+0x1aa/0x294
    [<ffffffffa2bc91aa>] really_probe+0x28f/0x76b
    [<ffffffffa2bc9825>] __driver_probe_device+0x19f/0x1ee
    [<ffffffffa2bc98b8>] driver_probe_device+0x44/0xbb
    [<ffffffffa2bca212>] __driver_attach+0x1a2/0x1d4
    [<ffffffffa2bc4cc7>] bus_for_each_dev+0xfa/0x146
    [<ffffffffa2bc6d81>] bus_add_driver+0x2b3/0x447

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
