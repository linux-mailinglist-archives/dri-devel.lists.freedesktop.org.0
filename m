Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7D321996C
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jul 2020 09:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59B3D6EA3A;
	Thu,  9 Jul 2020 07:05:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 533 seconds by postgrey-1.36 at gabe;
 Thu, 09 Jul 2020 05:50:43 UTC
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D57576E9A5
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jul 2020 05:50:43 +0000 (UTC)
Received: from [192.168.0.6] (ip5f5af27e.dynamic.kabel-deutschland.de
 [95.90.242.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 5D15920646095;
 Thu,  9 Jul 2020 07:41:47 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: drm: BUG: unable to handle page fault for address: 17ec6000
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 LKML <linux-kernel@vger.kernel.org>
Message-ID: <10b8419e-9e98-56c4-f4ab-9463cccd8f60@molgen.mpg.de>
Date: Thu, 9 Jul 2020 07:41:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Language: en-US
X-Mailman-Approved-At: Thu, 09 Jul 2020 07:05:06 +0000
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
Cc: Nathan Chancellor <natechancellor@gmail.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dear Linux folks,


Building Linux v5.8-rc4-25-gbfe91da29bfad with Clang/LLD 
1:11~++20200701093119+ffee8040534-1~exp1 from Debian experimental for 
32-bit (`ARCH=i386`), starting Weston (Wayland) or X.Org Server results 
in non-working screen, and Linux shows the trace below [1].

> [  502.044997] BUG: unable to handle page fault for address: 17ec6000
> [  502.045650] #PF: supervisor write access in kernel mode
> [  502.046301] #PF: error_code(0x0002) - not-present page
> [  502.046956] *pde = 00000000 
> [  502.047612] Oops: 0002 [#1] SMP
> [  502.048269] CPU: 0 PID: 2125 Comm: Xorg.wrap Not tainted 5.8.0-rc4-00105-g4da71f1ee6263 #141
> [  502.048967] Hardware name: System manufacturer System Product Name/F2A85-M PRO, BIOS 6601 11/25/2014
> [  502.049686] EIP: __srcu_read_lock+0x11/0x20
> [  502.050413] Code: 83 e0 03 50 56 68 72 c6 99 dd 68 46 c6 99 dd e8 3a c8 fe ff 83 c4 10 eb ce 0f 1f 44 00 00 55 89 e5 8b 48 68 8b 40 7c 83 e1 01 <64> ff 04 88 f0 83 44 24 fc 00 89 c8 5d c3 90 0f 1f 44 00 00 55 89
> [  502.052027] EAX: 00000000 EBX: f36671b8 ECX: 00000000 EDX: 00000286
> [  502.052856] ESI: f3f94eb8 EDI: f3e51c00 EBP: f303dd9c ESP: f303dd9c
> [  502.053695] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010246
> [  502.054543] CR0: 80050033 CR2: 17ec6000 CR3: 2eea2000 CR4: 000406d0
> [  502.055402] Call Trace:
> [  502.056275]  drm_minor_acquire+0x6f/0x140 [drm]
> [  502.057162]  drm_stub_open+0x2e/0x110 [drm]
> [  502.058049]  chrdev_open+0xdd/0x1e0
> [  502.058937]  do_dentry_open+0x21d/0x330
> [  502.059828]  vfs_open+0x23/0x30
> [  502.060718]  path_openat+0x947/0xd60
> [  502.061610]  ? unlink_anon_vmas+0x53/0x120
> [  502.062504]  do_filp_open+0x6d/0x100
> [  502.063404]  ? __alloc_fd+0x73/0x140
> [  502.064305]  do_sys_openat2+0x1b3/0x2a0
> [  502.065217]  __ia32_sys_openat+0x90/0xb0
> [  502.066128]  ? prepare_exit_to_usermode+0xa/0x20
> [  502.067046]  do_fast_syscall_32+0x68/0xd0
> [  502.067970]  do_SYSENTER_32+0x12/0x20
> [  502.068902]  entry_SYSENTER_32+0x9f/0xf2
> [  502.069839] EIP: 0xb7ef14f9
> [  502.070764] Code: Bad RIP value.
> [  502.071689] EAX: ffffffda EBX: ffffff9c ECX: bfa6a2ac EDX: 00008002
> [  502.072654] ESI: 00000000 EDI: b7ed1000 EBP: bfa6b2c8 ESP: bfa6a1c0
> [  502.073630] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000246
> [  502.074615] Modules linked in: af_packet k10temp r8169 realtek i2c_piix4 snd_hda_codec_realtek snd_hda_codec_generic ohci_pci ohci_hcd ehci_pci snd_hda_codec_hdmi ehci_hcd radeon i2c_algo_bit snd_hda_intel ttm snd_intel_dspcfg snd_hda_codec drm_kms_helper snd_hda_core snd_pcm cfbimgblt cfbcopyarea cfbfillrect snd_timer sysimgblt syscopyarea sysfillrect snd fb_sys_fops xhci_pci xhci_hcd soundcore acpi_cpufreq drm drm_panel_orientation_quirks agpgart ipv6 nf_defrag_ipv6
> [  502.077895] CR2: 0000000017ec6000
> [  502.079050] ---[ end trace ced4517b63a6db26 ]---
> [  502.080214] EIP: __srcu_read_lock+0x11/0x20
> [  502.081392] Code: 83 e0 03 50 56 68 72 c6 99 dd 68 46 c6 99 dd e8 3a c8 fe ff 83 c4 10 eb ce 0f 1f 44 00 00 55 89 e5 8b 48 68 8b 40 7c 83 e1 01 <64> ff 04 88 f0 83 44 24 fc 00 89 c8 5d c3 90 0f 1f 44 00 00 55 89
> [  502.083891] EAX: 00000000 EBX: f36671b8 ECX: 00000000 EDX: 00000286
> [  502.085148] ESI: f3f94eb8 EDI: f3e51c00 EBP: f303dd9c ESP: f303dd9c
> [  502.086406] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010246
> [  502.087675] CR0: 80050033 CR2: 17ec6000 CR3: 2eea2000 CR4: 000406d0

> $ dmesg | ./scripts/decodecode
> [ 55.784870] Code: 83 e0 03 50 56 68 ca c6 99 cf 68 9e c6 99 cf e8 3a c8 fe ff 83 c4 10 eb ce 0f 1f 44 00 00 55 89 e5 8b 48 68 8b 40 7c 83 e1 01 <64> ff 04 88 f0 83 44 24 fc 00 89 c8 5d c3 90 0f 1f 44 00 00 55 89
> All code
> ========
>    0:	83 e0 03             	and    $0x3,%eax
>    3:	50                   	push   %eax
>    4:	56                   	push   %esi
>    5:	68 ca c6 99 cf       	push   $0xcf99c6ca
>    a:	68 9e c6 99 cf       	push   $0xcf99c69e
>    f:	e8 3a c8 fe ff       	call   0xfffec84e
>   14:	83 c4 10             	add    $0x10,%esp
>   17:	eb ce                	jmp    0xffffffe7
>   19:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
>   1e:	55                   	push   %ebp
>   1f:	89 e5                	mov    %esp,%ebp
>   21:	8b 48 68             	mov    0x68(%eax),%ecx
>   24:	8b 40 7c             	mov    0x7c(%eax),%eax
>   27:	83 e1 01             	and    $0x1,%ecx
>   2a:*	64 ff 04 88          	incl   %fs:(%eax,%ecx,4)		<-- trapping instruction
>   2e:	f0 83 44 24 fc 00    	lock addl $0x0,-0x4(%esp)
>   34:	89 c8                	mov    %ecx,%eax
>   36:	5d                   	pop    %ebp
>   37:	c3                   	ret    
>   38:	90                   	nop
>   39:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
>   3e:	55                   	push   %ebp
>   3f:	89                   	.byte 0x89
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	64 ff 04 88          	incl   %fs:(%eax,%ecx,4)
>    4:	f0 83 44 24 fc 00    	lock addl $0x0,-0x4(%esp)
>    a:	89 c8                	mov    %ecx,%eax
>    c:	5d                   	pop    %ebp
>    d:	c3                   	ret    
>    e:	90                   	nop
>    f:	0f 1f 44 00 00       	nopl   0x0(%eax,%eax,1)
>   14:	55                   	push   %ebp
>   15:	89                   	.byte 0x89


Kind regards,

Paul


[1]: https://github.com/ClangBuiltLinux/linux/issues/1081
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
