Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8834581496
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 15:55:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D6FF92E1C;
	Tue, 26 Jul 2022 13:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 014AF8EB4F
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jul 2022 13:55:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 468296155E;
 Tue, 26 Jul 2022 13:55:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E885C433D7;
 Tue, 26 Jul 2022 13:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658843733;
 bh=duMR/lU6RYk5Sl/UEoofxjcGntKnOf+Mgv7nNGc1OEE=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=F+u4LeMncsXp7hVo2SUB2QrlE4E/iHUEgVuxbixqjkZrsNSPBoivEa0ZmyWhq7McR
 EOjnmgWiPRAq6mzsgQSTGr1DkdkxyIH23ZdfdsJrb9X4Rk4WAmSwe9DHAtRs1hDow3
 xqXxzauLHutov9n1ww3nTldZBxPp8byLNeoKJWCOxn43STEl4bhDSsFbxrxm425XJu
 og+8KBS6+YiNlLzBVRnt5HgacFF0tZHqgsddRJ/H25J9bY65Qtrd2LV6syiGl8wnti
 cJL5Jq4+gj63UJIOO6ArJCLaWJBjXIOLuhQ2OXdxlCBa73W7t3LR81loTTCkfkutq9
 MykjFxFfkgA8Q==
Message-ID: <7614df1720c5cd5b35fc18d14114d1aba2144f98.camel@kernel.org>
Subject: Re: [fs/lock]  0064b3d9f9: BUG:kernel_NULL_pointer_dereference,address
From: Jeff Layton <jlayton@kernel.org>
To: kernel test robot <oliver.sang@intel.com>, Kuniyuki Iwashima
 <kuniyu@amazon.com>
Date: Tue, 26 Jul 2022 09:55:31 -0400
In-Reply-To: <Yt/oonNim732exkh@xsang-OptiPlex-9020>
References: <Yt/oonNim732exkh@xsang-OptiPlex-9020>
Content-Type: text/plain; charset="ISO-8859-15"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 (3.44.3-1.fc36) 
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
Cc: lkp@intel.com, lkp@lists.01.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 linux-fsdevel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

(cc'ing dri-devel)

This looks like it died down in the DRM code. It seems doubtful that the
flock code would be affecting this, but let me know if I'm incorrect
here.

Thanks,
Jeff

On Tue, 2022-07-26 at 21:14 +0800, kernel test robot wrote:
> Greeting,
>=20
> FYI, we noticed the following commit (built with clang-15):
>=20
> commit: 0064b3d9f96f3dc466e44a6fc716910cea56dbbf ("fs/lock: Rearrange ops=
 in flock syscall.")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master
>=20
> in testcase: boot
>=20
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m =
4G
>=20
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):
>=20
>=20
>=20
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>=20
>=20
> [    3.564403][    T1] BUG: kernel NULL pointer dereference, address: 000=
00b2c
> [    3.565351][    T1] #PF: supervisor read access in kernel mode
> [    3.565351][    T1] #PF: error_code(0x0000) - not-present page
> [    3.565351][    T1] *pde =3D 00000000
> [    3.565351][    T1] Oops: 0000 [#1]
> [    3.565351][    T1] CPU: 0 PID: 1 Comm: swapper Tainted: G            =
    T 5.19.0-rc6-00004-g0064b3d9f96f #1
> [    3.565351][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [ 3.565351][ T1] EIP: drm_atomic_helper_setup_commit (??:?)=20
> [ 3.565351][ T1] Code: 45 ec eb b5 89 d8 83 c4 0c 5e 5f 5b 5d 31 c9 31 d2=
 c3 90 90 90 90 90 90 90 55 89 e5 53 57 56 83 ec 38 89 55 d4 89 c2 8b 40 04=
 <8b> 88 2c 07 00 00 89 4d c4 83 b8 30 05 00 00 00 89 55 ec 0f 8e fa
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	45 ec                	rex.RB in (%dx),%al
>    2:	eb b5                	jmp    0xffffffffffffffb9
>    4:	89 d8                	mov    %ebx,%eax
>    6:	83 c4 0c             	add    $0xc,%esp
>    9:	5e                   	pop    %rsi
>    a:	5f                   	pop    %rdi
>    b:	5b                   	pop    %rbx
>    c:	5d                   	pop    %rbp
>    d:	31 c9                	xor    %ecx,%ecx
>    f:	31 d2                	xor    %edx,%edx
>   11:	c3                   	retq  =20
>   12:	90                   	nop
>   13:	90                   	nop
>   14:	90                   	nop
>   15:	90                   	nop
>   16:	90                   	nop
>   17:	90                   	nop
>   18:	90                   	nop
>   19:	55                   	push   %rbp
>   1a:	89 e5                	mov    %esp,%ebp
>   1c:	53                   	push   %rbx
>   1d:	57                   	push   %rdi
>   1e:	56                   	push   %rsi
>   1f:	83 ec 38             	sub    $0x38,%esp
>   22:	89 55 d4             	mov    %edx,-0x2c(%rbp)
>   25:	89 c2                	mov    %eax,%edx
>   27:	8b 40 04             	mov    0x4(%rax),%eax
>   2a:*	8b 88 2c 07 00 00    	mov    0x72c(%rax),%ecx		<-- trapping instru=
ction
>   30:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
>   33:	83 b8 30 05 00 00 00 	cmpl   $0x0,0x530(%rax)
>   3a:	89 55 ec             	mov    %edx,-0x14(%rbp)
>   3d:	0f                   	.byte 0xf
>   3e:	8e fa                	mov    %edx,%?
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	8b 88 2c 07 00 00    	mov    0x72c(%rax),%ecx
>    6:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
>    9:	83 b8 30 05 00 00 00 	cmpl   $0x0,0x530(%rax)
>   10:	89 55 ec             	mov    %edx,-0x14(%rbp)
>   13:	0f                   	.byte 0xf
>   14:	8e fa                	mov    %edx,%?
> [    3.565351][    T1] EAX: 00000400 EBX: 401ebc64 ECX: 414f8750 EDX: 401=
ebc64
> [    3.565351][    T1] ESI: 401ebc64 EDI: 414f8750 EBP: 401ebbc8 ESP: 401=
ebb84
> [    3.565351][    T1] DS: 007b ES: 007b FS: 0000 GS: 0000 SS: 0068 EFLAG=
S: 00010206
> [    3.565351][    T1] CR0: 80050033 CR2: 00000b2c CR3: 02e5b000 CR4: 000=
406d0
> [    3.565351][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 000=
00000
> [    3.565351][    T1] DR6: fffe0ff0 DR7: 00000400
> [    3.565351][    T1] Call Trace:
> [ 3.565351][ T1] ? __lock_acquire (lockdep.c:?)=20
> [ 3.565351][ T1] ? drm_atomic_helper_async_commit (??:?)=20
> [ 3.565351][ T1] ? drm_atomic_helper_commit (??:?)=20
> [ 3.565351][ T1] ? drm_get_format_info (??:?)=20
> [ 3.565351][ T1] ? drm_internal_framebuffer_create (??:?)=20
> [ 3.565351][ T1] ? lock_is_held_type (??:?)=20
> [ 3.565351][ T1] ? drm_mode_addfb2 (??:?)=20
> [ 3.565351][ T1] ? sched_clock (??:?)=20
> [ 3.565351][ T1] ? drm_mode_addfb (??:?)=20
> [ 3.565351][ T1] ? drm_client_framebuffer_create (??:?)=20
> [ 3.565351][ T1] ? drm_fb_helper_generic_probe (drm_fb_helper.c:?)=20
> [ 3.565351][ T1] ? __drm_fb_helper_initial_config_and_unlock (drm_fb_help=
er.c:?)=20
> [ 3.565351][ T1] ? drm_fbdev_client_hotplug (drm_fb_helper.c:?)=20
> [ 3.565351][ T1] ? drm_fbdev_generic_setup (??:?)=20
> [ 3.565351][ T1] ? vkms_init (vkms_drv.c:?)=20
> [ 3.565351][ T1] ? drm_sched_fence_slab_init (vkms_drv.c:?)=20
> [ 3.565351][ T1] ? do_one_initcall (??:?)=20
> [ 3.565351][ T1] ? drm_sched_fence_slab_init (vkms_drv.c:?)=20
> [ 3.565351][ T1] ? tick_program_event (??:?)=20
> [ 3.565351][ T1] ? error_context (??:?)=20
> [ 3.565351][ T1] ? trace_hardirqs_on (??:?)=20
> [ 3.565351][ T1] ? irqentry_exit (??:?)=20
> [ 3.565351][ T1] ? sysvec_apic_timer_interrupt (??:?)=20
> [ 3.565351][ T1] ? handle_exception (init_task.c:?)=20
> [ 3.565351][ T1] ? parse_args (??:?)=20
> [ 3.565351][ T1] ? error_context (??:?)=20
> [ 3.565351][ T1] ? parse_args (??:?)=20
> [ 3.565351][ T1] ? do_initcall_level (main.c:?)=20
> [ 3.565351][ T1] ? rest_init (main.c:?)=20
> [ 3.565351][ T1] ? do_initcalls (main.c:?)=20
> [ 3.565351][ T1] ? do_basic_setup (main.c:?)=20
> [ 3.565351][ T1] ? kernel_init_freeable (main.c:?)=20
> [ 3.565351][ T1] ? kernel_init (main.c:?)=20
> [ 3.565351][ T1] ? ret_from_fork (??:?)=20
> [    3.565351][    T1] Modules linked in:
> [    3.565351][    T1] CR2: 0000000000000b2c
> [    3.565351][    T1] ---[ end trace 0000000000000000 ]---
> [ 3.565351][ T1] EIP: drm_atomic_helper_setup_commit (??:?)=20
> [ 3.565351][ T1] Code: 45 ec eb b5 89 d8 83 c4 0c 5e 5f 5b 5d 31 c9 31 d2=
 c3 90 90 90 90 90 90 90 55 89 e5 53 57 56 83 ec 38 89 55 d4 89 c2 8b 40 04=
 <8b> 88 2c 07 00 00 89 4d c4 83 b8 30 05 00 00 00 89 55 ec 0f 8e fa
> All code
> =3D=3D=3D=3D=3D=3D=3D=3D
>    0:	45 ec                	rex.RB in (%dx),%al
>    2:	eb b5                	jmp    0xffffffffffffffb9
>    4:	89 d8                	mov    %ebx,%eax
>    6:	83 c4 0c             	add    $0xc,%esp
>    9:	5e                   	pop    %rsi
>    a:	5f                   	pop    %rdi
>    b:	5b                   	pop    %rbx
>    c:	5d                   	pop    %rbp
>    d:	31 c9                	xor    %ecx,%ecx
>    f:	31 d2                	xor    %edx,%edx
>   11:	c3                   	retq  =20
>   12:	90                   	nop
>   13:	90                   	nop
>   14:	90                   	nop
>   15:	90                   	nop
>   16:	90                   	nop
>   17:	90                   	nop
>   18:	90                   	nop
>   19:	55                   	push   %rbp
>   1a:	89 e5                	mov    %esp,%ebp
>   1c:	53                   	push   %rbx
>   1d:	57                   	push   %rdi
>   1e:	56                   	push   %rsi
>   1f:	83 ec 38             	sub    $0x38,%esp
>   22:	89 55 d4             	mov    %edx,-0x2c(%rbp)
>   25:	89 c2                	mov    %eax,%edx
>   27:	8b 40 04             	mov    0x4(%rax),%eax
>   2a:*	8b 88 2c 07 00 00    	mov    0x72c(%rax),%ecx		<-- trapping instru=
ction
>   30:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
>   33:	83 b8 30 05 00 00 00 	cmpl   $0x0,0x530(%rax)
>   3a:	89 55 ec             	mov    %edx,-0x14(%rbp)
>   3d:	0f                   	.byte 0xf
>   3e:	8e fa                	mov    %edx,%?
>=20
> Code starting with the faulting instruction
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    0:	8b 88 2c 07 00 00    	mov    0x72c(%rax),%ecx
>    6:	89 4d c4             	mov    %ecx,-0x3c(%rbp)
>    9:	83 b8 30 05 00 00 00 	cmpl   $0x0,0x530(%rax)
>   10:	89 55 ec             	mov    %edx,-0x14(%rbp)
>   13:	0f                   	.byte 0xf
>   14:	8e fa                	mov    %edx,%?
>=20
>=20
> To reproduce:
>=20
>         # build kernel
> 	cd linux
> 	cp config-5.19.0-rc6-00004-g0064b3d9f96f .config
> 	make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Di386 olddefconfig prepare mo=
dules_prepare bzImage modules
> 	make HOSTCC=3Dclang-15 CC=3Dclang-15 ARCH=3Di386 INSTALL_MOD_PATH=3D<mod=
-install-dir> modules_install
> 	cd <mod-install-dir>
> 	find lib/ | cpio -o -H newc --quiet | gzip > modules.cgz
>=20
>=20
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp qemu -k <bzImage> -m modules.cgz job-script # job-script =
is attached in this email
>=20
>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
>=20
>=20
>=20

--=20
Jeff Layton <jlayton@kernel.org>
