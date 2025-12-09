Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B975CB12D6
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 22:25:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66AD110E1E6;
	Tue,  9 Dec 2025 21:25:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.b="YIasVt4n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9473D10E1E6;
 Tue,  9 Dec 2025 21:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org; 
 s=smtpauto.stravinsky;
 h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=YRT4W2ujwFFMsrHRkCRnR/xGZxGaxe7ARGv7L/it8q0=; b=YIasVt4nlttzf2Ulx2ktObKV/t
 4ahAGa4cB7vsG8maIMzSDLUCrQ0d/7+XmIC2b7/Hn+8tjBRtHH++A7XndaWxe9YyZT4Og5YvKi4wz
 HxpPPpd+WalFjiL1hj5Q9DjWJvtq25t1sBCGhzktVv1tSm5lG8xVwAVI+mfwJjQ9RWGV7GBzZn09r
 4ZvwxIV6n74bN1jgGyFQi1d/QfMgxNTr5Kl/5BOLRz3g+2Gq1GDO7kq+5GY8j9TAsIJklPqcwLuAZ
 2P2L6c1cJxGF//3ozOlfpVV2kVQzhyCnv+i+2vqYareuEHy7dWCNaMnaAgALqpDRYB08C6W8y0ACJ
 pywJhTUA==;
Received: from authenticated user by stravinsky.debian.org with esmtpsa
 (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2) (envelope-from <carnil@debian.org>)
 id 1vT5CQ-007QCK-6s; Tue, 09 Dec 2025 21:24:46 +0000
Received: by eldamar.lan (Postfix, from userid 1000)
 id DD34ABE2EE7; Tue, 09 Dec 2025 22:24:44 +0100 (CET)
Date: Tue, 9 Dec 2025 22:24:44 +0100
From: Salvatore Bonaccorso <carnil@debian.org>
To: Matt Marjanovic <maddog@mir.com>, 1054514@bugs.debian.org,
 Maxime Ripard <mripard@kernel.org>
Cc: Alex Constantino <dreaming.about.electric.sheep@gmail.com>,
 airlied@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, kraxel@redhat.com,
 linux-kernel@vger.kernel.org, maarten.lankhorst@linux.intel.com,
 regressions@lists.linux.dev, spice-devel@lists.freedesktop.org,
 timo.lindfors@iki.fi, tzimmermann@suse.de,
 virtualization@lists.linux-foundation.org
Subject: Re: Bug#1054514: linux-image-6.1.0-13-amd64: Debian VM with qxl
 graphics freezes frequently
Message-ID: <aTiTnENWsCoTbT3U@eldamar.lan>
References: <alpine.DEB.2.20.2310242308150.28457@mail.home>
 <b8b1497f-789e-4bb7-be17-9d3ebb30c143@mir.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b8b1497f-789e-4bb7-be17-9d3ebb30c143@mir.com>
X-Debian-User: carnil
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

Control: tags -1 + moreinfo

Hi Matt,

On Tue, Dec 09, 2025 at 10:33:24AM -0800, Matt Marjanovic wrote:
> Package: src:linux
> Version: 6.12.57-1
> Followup-For: Bug #1054514
> 
> Dear Maintainer,
> 
> This is back in trixie --- unsurprisingly, because the kernel commit which
> had originally caused this bug, and was subsequently reverted, was reapplied
> to the kernel in 6.8.10:
> 
>   https://www.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.8.10
>   (Reapply "drm/qxl: simplify qxl_fence_wait")
> 
> In addition to making the remote graphics freeze (which is annoying but
> tolerable), the graphics driver hang also appears to cause systemd tasks
> to hang... which leads to problems with remote login via ssh, and also
> the inability to do a clean reboot/shutdown (which is intolerable).
> 
> Sample of the kernel log for hung systemd task (bookended by the telltale
> "Buffer eviction failed" every 15 seconds):
> 
> [413120.319715] INFO: task systemd:1 blocked for more than 1208 seconds.
> [413120.319718]       Not tainted 6.12.57+deb13-amd64 #1 Debian 6.12.57-1
> [413120.319719] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> [413120.319720] task:systemd         state:D stack:0     pid:1     tgid:1     ppid:0      flags:0x00000002
> [413120.319723] Call Trace:
> [413120.319724]  <TASK>
> [413120.319726]  __schedule+0x505/0xc00
> [413120.319730]  schedule+0x27/0xf0
> [413120.319732]  schedule_preempt_disabled+0x15/0x30
> [413120.319733]  __ww_mutex_lock.constprop.0+0x4f6/0x9a0
> [413120.319736]  drm_modeset_lock+0x42/0xe0 [drm]
> [413120.319765]  drm_atomic_get_plane_state+0x7f/0x180 [drm]
> [413120.319777]  drm_client_modeset_commit_atomic+0xbf/0x250 [drm]
> [413120.319793]  ? do_sys_poll+0x4e1/0x600
> [413120.319796]  drm_client_modeset_commit_locked+0x5a/0x160 [drm]
> [413120.319810]  drm_fb_helper_pan_display+0xf2/0x240 [drm_kms_helper]
> [413120.319819]  fb_pan_display+0x89/0x140
> [413120.319821]  bit_update_start+0x1e/0x40
> [413120.319822]  fbcon_switch+0x421/0x5b0
> [413120.319825]  csi_J+0x286/0x2d0
> [413120.319826]  do_con_write+0x1368/0x2440
> [413120.319828]  ? tomoyo_path_number_perm+0x8c/0x1f0
> [413120.319830]  ? _prb_read_valid+0x298/0x310
> [413120.319832]  con_write+0x13/0x50
> [413120.319833]  n_tty_write+0x15a/0x500
> [413120.319835]  ? __pfx_woken_wake_function+0x10/0x10
> [413120.319837]  file_tty_write.isra.0+0x172/0x2c0
> [413120.319840]  vfs_write+0x28c/0x440
> [413120.319842]  ksys_write+0x6d/0xf0
> [413120.319844]  do_syscall_64+0x82/0x190
> [413120.319845]  ? tty_ioctl+0x145/0x8a0
> [413120.319847]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0xa0
> [413120.319850]  ? syscall_exit_to_user_mode+0x37/0x1b0
> [413120.319851]  ? do_syscall_64+0x8e/0x190
> [413120.319852]  ? do_sys_openat2+0x9c/0xe0
> [413120.319853]  ? do_syscall_64+0x8e/0x190
> [413120.319854]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0xa0
> [413120.319856]  ? syscall_exit_to_user_mode+0x37/0x1b0
> [413120.319857]  ? do_syscall_64+0x8e/0x190
> [413120.319858]  ? __x64_sys_ppoll+0xf4/0x160
> [413120.319859]  ? arch_exit_to_user_mode_prepare.isra.0+0x16/0xa0
> [413120.319861]  ? syscall_exit_to_user_mode+0x37/0x1b0
> [413120.319862]  ? do_syscall_64+0x8e/0x190
> [413120.319862]  ? clear_bhb_loop+0x40/0x90
> [413120.319864]  ? clear_bhb_loop+0x40/0x90
> [413120.319865]  ? clear_bhb_loop+0x40/0x90
> [413120.319866]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [413120.319869] RIP: 0033:0x7f38ba499687
> [413120.319878] RSP: 002b:00007ffd7e321560 EFLAGS: 00000202 ORIG_RAX: 0000000000000001
> [413120.319879] RAX: ffffffffffffffda RBX: 00007f38baa3ee00 RCX: 00007f38ba499687
> [413120.319880] RDX: 000000000000000c RSI: 00007f38ba927cc4 RDI: 0000000000000025
> [413120.319881] RBP: 0000000000000025 R08: 0000000000000000 R09: 0000000000000000
> [413120.319881] R10: 0000000000000000 R11: 0000000000000202 R12: 00000000000186a0
> [413120.319882] R13: 0000005fe7e4b3fb R14: 000000000000000c R15: 0000000000000025
> [413120.319883]  </TASK>
> [413120.319884] Future hung task reports are suppressed, see sysctl kernel.hung_task_warnings
> [413123.903768] [TTM] Buffer eviction failed
> [413139.007582] [TTM] Buffer eviction failed
> [413154.111473] [TTM] Buffer eviction failed
> [413169.215198] [TTM] Buffer eviction failed
> [413184.319084] [TTM] Buffer eviction failed
> [413199.422894] [TTM] Buffer eviction failed
> [413214.526697] [TTM] Buffer eviction failed

I guess it is very unlikely that the commit get reverted again, given
the reasons explained in the commit message on the re-apply.

But can you please confirm that reverting the commit on top of 6.12.y
fixes the issue again for you?

Note that it has even be re-applied to 6.1.y, actually form 6.9 back
to 6.8.10, 6.6.31, 6.1.91 and 5.15.159.

Is the issue still as well triggerable in 6.17.11 and mainline?

Regards,
Salvatore
