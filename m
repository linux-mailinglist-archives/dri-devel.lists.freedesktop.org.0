Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DA1421AD7
	for <lists+dri-devel@lfdr.de>; Tue,  5 Oct 2021 01:46:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85DE6E28B;
	Mon,  4 Oct 2021 23:46:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0AB6E28B
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:46:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 52FFC611C3
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Oct 2021 23:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1633391201;
 bh=KbMnOlHfjzINYiZNvDV/fpz/C20OOu9Sld3yROmxw6k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lGk9fVFmW2L0HY3jKhmJOLLVfQMW6JswVao2xQL4RddtbrBB9K3tV82W7PwjsRFKe
 /YWzLpaoZO5AUd5RWp69ES0udVyQVUJhBHJ1DHt8oRWfvpgPKSeg2Rpsz/nSdz3YH5
 z8U0s4fBdubRYMSn8yh2xfnAcUXA3TKeJ6uqgu0P9Jv+MYP6YXhskhEnCiLq6T5bdl
 7CU584/000F9uMvxf89soZPFO+i6Np4o9RKeUeyjDNxdcmNd0Snxih6mLqj9iptN+Q
 B3r2Kef0mmPByDFEGLwDgvHbhUgtPtNU8UbrX37Oa+tuyFu6onNNtarCthIR0CvkAw
 nFTBhmZkk1bWA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4A49461104; Mon,  4 Oct 2021 23:46:41 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 213201] [KAVERI] memory leak - unreferenced object
 0xffff8881700cf988 (size 56)
Date: Mon, 04 Oct 2021 23:46:40 +0000
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
Message-ID: <bug-213201-2300-vKEv6pFWpY@https.bugzilla.kernel.org/>
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

--- Comment #14 from Erhard F. (erhard_f@mailbox.org) ---
Created attachment 299101
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D299101&action=3Dedit
utput of /sys/kernel/debug/kmemleak (kernel 5.15-rc4, AMD PRO A10-8750B)

Same board, another CPU:

 # cat /sys/kernel/debug/kmemleak
unreferenced object 0xffff8881010b5278 (size 56):
  comm "systemd-udevd", pid 198, jiffies 4294881523 (age 926.930s)
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 0d 01 70 00 00 00 00 00  ..........p.....
    4b 5f 02 00 00 c9 ff ff 00 00 00 00 00 00 00 00  K_..............
  backtrace:
    [<ffffffff9df51ae1>] acpi_ps_alloc_op+0x8b/0x1c4
    [<ffffffff9df4ec89>] acpi_ps_create_op+0x48c/0x8ca
    [<ffffffff9df4d7b9>] acpi_ps_parse_loop+0x401/0x1062
    [<ffffffff9df50a3e>] acpi_ps_parse_aml+0x1cd/0x6ea
    [<ffffffff9df5255e>] acpi_ps_execute_method+0x51f/0x57b
    [<ffffffff9df42193>] acpi_ns_evaluate+0x64b/0x885
    [<ffffffff9df4a12f>] acpi_evaluate_object+0x333/0x68d
    [<ffffffffc15b70f9>] amdgpu_atcs_call.constprop.0+0x129/0x1f0 [amdgpu]
    [<ffffffffc15b7b79>] amdgpu_atcs_pci_probe_handle.isra.0+0x159/0x2d0
[amdgpu]
    [<ffffffffc15b8950>] amdgpu_acpi_detect+0xb0/0x470 [amdgpu]
    [<ffffffffc243b0a8>] chacha_2block_xor_avx2+0xa8/0x220 [chacha_x86_64]
    [<ffffffff9d001b0b>] do_one_initcall+0xbb/0x3e0
    [<ffffffff9d2a7509>] do_init_module+0x1c9/0x6e0
    [<ffffffff9d2af427>] load_module+0x78c7/0x9bb0
    [<ffffffff9d2b1a40>] __do_sys_finit_module+0x110/0x180
    [<ffffffff9e7f1836>] do_syscall_64+0x66/0x90
unreferenced object 0xffff8881010b5c38 (size 56):
  comm "systemd-udevd", pid 198, jiffies 4294881523 (age 926.930s)
  hex dump (first 32 bytes):
    78 52 0b 01 81 88 ff ff 0d 01 2d 00 00 00 00 00  xR........-.....
    4c 5f 02 00 00 c9 ff ff 00 00 00 00 00 00 00 00  L_..............
  backtrace:
    [<ffffffff9df51ae1>] acpi_ps_alloc_op+0x8b/0x1c4
    [<ffffffff9df4ec89>] acpi_ps_create_op+0x48c/0x8ca
    [<ffffffff9df4d7b9>] acpi_ps_parse_loop+0x401/0x1062
    [<ffffffff9df50a3e>] acpi_ps_parse_aml+0x1cd/0x6ea
    [<ffffffff9df5255e>] acpi_ps_execute_method+0x51f/0x57b
    [<ffffffff9df42193>] acpi_ns_evaluate+0x64b/0x885
    [<ffffffff9df4a12f>] acpi_evaluate_object+0x333/0x68d
    [<ffffffffc15b70f9>] amdgpu_atcs_call.constprop.0+0x129/0x1f0 [amdgpu]
    [<ffffffffc15b7b79>] amdgpu_atcs_pci_probe_handle.isra.0+0x159/0x2d0
[amdgpu]
    [<ffffffffc15b8950>] amdgpu_acpi_detect+0xb0/0x470 [amdgpu]
    [<ffffffffc243b0a8>] chacha_2block_xor_avx2+0xa8/0x220 [chacha_x86_64]
    [<ffffffff9d001b0b>] do_one_initcall+0xbb/0x3e0
    [<ffffffff9d2a7509>] do_init_module+0x1c9/0x6e0
    [<ffffffff9d2af427>] load_module+0x78c7/0x9bb0
    [<ffffffff9d2b1a40>] __do_sys_finit_module+0x110/0x180
    [<ffffffff9e7f1836>] do_syscall_64+0x66/0x90

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
