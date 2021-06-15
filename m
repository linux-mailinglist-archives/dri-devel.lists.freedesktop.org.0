Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17C73A8995
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 21:33:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7AE289BC0;
	Tue, 15 Jun 2021 19:33:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2318189BC0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 19:33:37 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id B24A6613B3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 19:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623785616;
 bh=HRB3i+yRi9I8dYXw+UKP8qfRcjQCnHdCasWw+yFMXkM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=l+h2oFpc3EGzO/vJ7SWTszjOAY75k01m8cpAyz0nEgkteOmBKQqHZ9IJala1WuEYa
 a1LxKmj+T51D56OWAywZcdike05lwzFJJyZZIk+V+JH5CjA0gOjaNozU/w3iYBbmyb
 SrwzVxcSfHOTuANroZOxWKpBl7iYgecqQ5Kiy8n+NryfCLcgFmxCZ54CjuPXFmUyGR
 VxxmF8LTuopNbc0i9uIm4uXrU0h/QMSAxQHv/GwTjnMg5InWjSIG/r47YJTNucusvN
 k9Pjb7uXz78gmPs03NegydMNV8xQnDWFYN8OA0xnN+/0ljKm66/4cETzL2XorK/wI5
 7HoNM7ulGSC9A==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id AA7DC612A2; Tue, 15 Jun 2021 19:33:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Tue, 15 Jun 2021 19:33:36 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-213201-2300-4ql6bVCIQw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213201-2300@https.bugzilla.kernel.org/>
References: <bug-213201-2300@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213201

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 297375
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D297375&action=3Dedit
kernel dmesg (4.4.271, AMD A10 PRO-7800B)

Bisecting was no success, but I traced the memory leak back to kernel 4.4.x
series.

Kernels v4.3.6 and v4.2.8 won't boot on the machine. But probably the leak =
has
been there since amdgpu got first introduced in kernel 4.2 anyhow.

[...]
unreferenced object 0xffff8803ecbef380 (size 56):
  comm "systemd-udevd", pid 222, jiffies 4294880256 (age 1158.457s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 0d 01 70 00 00 00 00 00  ..........p.....
    7b 58 01 00 00 c9 ff ff 00 00 00 00 00 00 00 00  {X..............
  backtrace:
    [<ffffffffa110c0c9>] create_object+0x162/0x280
    [<ffffffffa13d741a>] kmemleak_alloc+0x20/0x3c
    [<ffffffffa10fa921>] slab_post_alloc_hook+0x44/0x65
    [<ffffffffa10fc73a>] kmem_cache_alloc+0xbf/0xe2
    [<ffffffffa1263026>] acpi_os_acquire_object+0x28/0x2a
    [<ffffffffa126306f>] acpi_ps_alloc_op+0x39/0x69
    [<ffffffffa12622ff>] acpi_ps_create_op+0x105/0x234
    [<ffffffffa1261cf2>] acpi_ps_parse_loop+0x1db/0x586
    [<ffffffffa1262b62>] acpi_ps_parse_aml+0x93/0x265
    [<ffffffffa126335c>] acpi_ps_execute_method+0x14e/0x185
    [<ffffffffa125d96c>] acpi_ns_evaluate+0x1bf/0x25b
    [<ffffffffa12604a9>] acpi_evaluate_object+0x13c/0x24c
    [<ffffffffc075864e>] amdgpu_atcs_call+0x83/0xd9 [amdgpu]
    [<ffffffffc0758bdf>] amdgpu_acpi_init+0x62/0x4ef [amdgpu]
    [<ffffffffc06f6028>] amdgpu_driver_load_kms+0x83/0x103 [amdgpu]
    [<ffffffffc04445f1>] drm_dev_register+0x6d/0xae [drm]
unreferenced object 0xffff8803ecbeef00 (size 56):
  comm "systemd-udevd", pid 222, jiffies 4294880256 (age 1158.457s)
  hex dump (first 32 bytes):
    80 f3 be ec 03 88 ff ff 0d 01 2d 00 00 00 00 00  ..........-.....
    7c 58 01 00 00 c9 ff ff 00 00 00 00 00 00 00 00  |X..............
  backtrace:
    [<ffffffffa110c0c9>] create_object+0x162/0x280
    [<ffffffffa13d741a>] kmemleak_alloc+0x20/0x3c
    [<ffffffffa10fa921>] slab_post_alloc_hook+0x44/0x65
    [<ffffffffa10fc73a>] kmem_cache_alloc+0xbf/0xe2
    [<ffffffffa1263026>] acpi_os_acquire_object+0x28/0x2a
    [<ffffffffa126306f>] acpi_ps_alloc_op+0x39/0x69
    [<ffffffffa12622ff>] acpi_ps_create_op+0x105/0x234
    [<ffffffffa1261cf2>] acpi_ps_parse_loop+0x1db/0x586
    [<ffffffffa1262b62>] acpi_ps_parse_aml+0x93/0x265
    [<ffffffffa126335c>] acpi_ps_execute_method+0x14e/0x185
    [<ffffffffa125d96c>] acpi_ns_evaluate+0x1bf/0x25b
    [<ffffffffa12604a9>] acpi_evaluate_object+0x13c/0x24c
    [<ffffffffc075864e>] amdgpu_atcs_call+0x83/0xd9 [amdgpu]
    [<ffffffffc0758bdf>] amdgpu_acpi_init+0x62/0x4ef [amdgpu]
    [<ffffffffc06f6028>] amdgpu_driver_load_kms+0x83/0x103 [amdgpu]
    [<ffffffffc04445f1>] drm_dev_register+0x6d/0xae [drm]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
