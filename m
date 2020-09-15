Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EBC26A740
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 16:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F4589F97;
	Tue, 15 Sep 2020 14:38:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 492 seconds by postgrey-1.36 at gabe;
 Tue, 15 Sep 2020 13:06:48 UTC
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF126E29B
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Sep 2020 13:06:48 +0000 (UTC)
Received: from [141.14.220.45] (g45.guest.molgen.mpg.de [141.14.220.45])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id CD3A620646200;
 Tue, 15 Sep 2020 14:58:33 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: General protection fault: RIP: 0010:free_block+0xdc/0x1f0
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <7766386a-3a62-d7d9-9ff5-4283b72113ca@molgen.mpg.de>
Date: Tue, 15 Sep 2020 14:58:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="------------55B37117B98BC846E92EE0B2"
Content-Language: en-US
X-Mailman-Approved-At: Tue, 15 Sep 2020 14:38:31 +0000
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
Cc: linux-mm@kvack.org, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--------------55B37117B98BC846E92EE0B2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear Andrew folks, dear Linux folks,


With Linux 5.9-rc4 on a Dell OptiPlex 5080 with Intel Core i7-10700 CPU 
@ 2.90GHz, and external

     01:00.0 VGA compatible controller [0300]: Advanced Micro Devices, 
Inc. [AMD/ATI] Oland [Radeon HD 8570 / R7 240/340 OEM] [1002:6611] (rev 87)

running graphical demanding applications glmark2 [1] and the Phoronix 
Test Suite [2] benchmark *pts/desktop-graphics* [3]

     $ git describe --tags
     v10.0.0m1-13-g0b5ddc3c0

I got three general protection faults, and it restarted or froze (no 
input devices working, screen froze and even network card (no ping)).

Here the system restarted itself:

> kernel: general protection fault, probably for non-canonical address 0xdead000000000100: 0000 [#1] SMP NOPTI
> kernel: CPU: 2 PID: 9702 Comm: glmark2 Kdump: loaded Not tainted 5.9.0-rc4.mx64.343 #1
> kernel: Hardware name: Dell Inc. OptiPlex 5080/032W55, BIOS 1.1.7 08/17/2020
> kernel: RIP: 0010:free_block+0xdc/0x1f0

Here it froze:

> [14639.665745] general protection fault, probably for non-canonical address 0xdead000000000100: 0000 [#1] SMP NOPTI
> [14639.675917] CPU: 15 PID: 23094 Comm: pvpython Kdump: loaded Not tainted 5.9.0-rc4.mx64.343 #1
> [14639.684431] Hardware name: Dell Inc. OptiPlex 5080/032W55, BIOS 1.1.7 08/17/2020
> [14639.691823] RIP: 0010:free_block+0xdc/0x1f0

Here it froze:

> kernel: general protection fault, probably for non-canonical address 0xdead000000000100: 0000 [#1] SMP NOPTI
> kernel: CPU: 15 PID: 23094 Comm: pvpython Kdump: loaded Not tainted 5.9.0-rc4.mx64.343 #1
> kernel: Hardware name: Dell Inc. OptiPlex 5080/032W55, BIOS 1.1.7 08/17/2020
> kernel: RIP: 0010:free_block+0xdc/0x1f0

Running `scripts/decode_stacktrace.sh`:

> linux-5.9_rc4-343.x86_64/source$ scripts/decode_stacktrace.sh vmlinux < optiplex-5080-linux-5.9-rc4-gp-pvpython.txt
> [14528.718656] cgroup: fork rejected by pids controller in /user.slice/user-5272.slice/session-c6.scope
> [14639.665745] general protection fault, probably for non-canonical address 0xdead000000000100: 0000 [#1] SMP NOPTI
> [14639.675917] CPU: 15 PID: 23094 Comm: pvpython Kdump: loaded Not tainted 5.9.0-rc4.mx64.343 #1
> [14639.684431] Hardware name: Dell Inc. OptiPlex 5080/032W55, BIOS 1.1.7 08/17/2020
> [14639.691823] RIP: 0010:free_block (./include/linux/list.h:112 ./include/linux/list.h:135 ./include/linux/list.h:146 mm/slab.c:3336) 
> [14639.696006] Code: 00 48 01 d0 48 c1 e8 0c 48 c1 e0 06 4c 01 e8 48 8b 50 08 48 8d 4a ff 83 e2 01 48 0f 45 c1 48 8b 48 08 48 8b 50 10 4c 8d 78 08 <48> 89 51 08 48 89 0a 4c 89 da 48 2b 50 28 4c 89 60 08 48 89 68 10
> All code
> ========
>    0:	00 48 01             	add    %cl,0x1(%rax)
>    3:	d0 48 c1             	rorb   -0x3f(%rax)
>    6:	e8 0c 48 c1 e0       	callq  0xffffffffe0c14817
>    b:	06                   	(bad)  
>    c:	4c 01 e8             	add    %r13,%rax
>    f:	48 8b 50 08          	mov    0x8(%rax),%rdx
>   13:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
>   17:	83 e2 01             	and    $0x1,%edx
>   1a:	48 0f 45 c1          	cmovne %rcx,%rax
>   1e:	48 8b 48 08          	mov    0x8(%rax),%rcx
>   22:	48 8b 50 10          	mov    0x10(%rax),%rdx
>   26:	4c 8d 78 08          	lea    0x8(%rax),%r15
>   2a:*	48 89 51 08          	mov    %rdx,0x8(%rcx)		<-- trapping instruction
>   2e:	48 89 0a             	mov    %rcx,(%rdx)
>   31:	4c 89 da             	mov    %r11,%rdx
>   34:	48 2b 50 28          	sub    0x28(%rax),%rdx
>   38:	4c 89 60 08          	mov    %r12,0x8(%rax)
>   3c:	48 89 68 10          	mov    %rbp,0x10(%rax)
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	48 89 51 08          	mov    %rdx,0x8(%rcx)
>    4:	48 89 0a             	mov    %rcx,(%rdx)
>    7:	4c 89 da             	mov    %r11,%rdx
>    a:	48 2b 50 28          	sub    0x28(%rax),%rdx
>    e:	4c 89 60 08          	mov    %r12,0x8(%rax)
>   12:	48 89 68 10          	mov    %rbp,0x10(%rax)
> [14639.714747] RSP: 0018:ffffc9001c26fab8 EFLAGS: 00010046
> [14639.719970] RAX: ffffea000d193600 RBX: 0000000080000000 RCX: dead000000000100
> [14639.727099] RDX: dead000000000122 RSI: ffff88842d5f3ef0 RDI: ffff88842b440300
> [14639.734225] RBP: dead000000000122 R08: ffffc9001c26fb30 R09: ffff88842b441280
> [14639.741351] R10: 000000000000000f R11: ffff8883464d80c0 R12: dead000000000100
> [14639.748477] R13: ffffea0000000000 R14: ffff88842d5f3ff0 R15: ffffea000d193608
> [14639.755604] FS:  00007fd3b7e8f040(0000) GS:ffff88842d5c0000(0000) knlGS:0000000000000000
> [14639.763692] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [14639.769430] CR2: 00007fd344233548 CR3: 00000002f46aa003 CR4: 00000000007706e0
> [14639.776556] PKRU: 55555554
> [14639.779265] Call Trace:
> [14639.781717] ___cache_free (mm/slab.c:3389 mm/slab.c:3455) 
> [14639.785463] kfree (./arch/x86/include/asm/irqflags.h:41 ./arch/x86/include/asm/irqflags.h:84 mm/slab.c:3757) 
> [14639.788432] kmem_freepages (mm/slab.h:266 mm/slab.h:437 mm/slab.c:1406) 
> [14639.792093] slab_destroy (mm/slab.c:1631) 
> [14639.795579] slabs_destroy (mm/slab.c:1639 (discriminator 12)) 
> [14639.799152] ___cache_free (mm/slab.c:3406 mm/slab.c:3455) 
> [14639.802902] ? _cond_resched (kernel/sched/core.c:6123) 
> [14639.806650] kfree (./arch/x86/include/asm/irqflags.h:41 ./arch/x86/include/asm/irqflags.h:84 mm/slab.c:3757) 
> [14639.809644] amdgpu_vram_mgr_del (drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c:439) amdgpu
> [14639.814524] ttm_bo_cleanup_memtype_use (drivers/gpu/drm/ttm/ttm_bo.c:866 drivers/gpu/drm/ttm/ttm_bo.c:367) ttm
> [14639.819748] ttm_bo_put (./include/linux/dma-resv.h:226 drivers/gpu/drm/ttm/ttm_bo.c:612 ./include/linux/kref.h:65 drivers/gpu/drm/ttm/ttm_bo.c:624) ttm
> [14639.823768] amdgpu_bo_unref (drivers/gpu/drm/amd/amdgpu/amdgpu_object.c:861) amdgpu
> [14639.828313] amdgpu_vm_free_table (drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:953) amdgpu
> [14639.833293] amdgpu_vm_free_pts (drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:975) amdgpu
> [14639.838097] amdgpu_vm_fini (drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c:3119) amdgpu
> [14639.842727] amdgpu_driver_postclose_kms (drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c:1116) amdgpu
> [14639.848387] drm_file_free.part.9 (drivers/gpu/drm/drm_file.c:292) drm
> [14639.853263] drm_release (./arch/x86/include/asm/atomic.h:123 ./include/asm-generic/atomic-instrumented.h:749 drivers/gpu/drm/drm_file.c:496) drm
> [14639.857183] __fput (fs/file_table.c:282) 
> [14639.860238] task_work_run (kernel/task_work.c:143 (discriminator 1)) 
> [14639.863811] exit_to_user_mode_prepare (./include/linux/tracehook.h:188 kernel/entry/common.c:163 kernel/entry/common.c:190) 
> [14639.868602] syscall_exit_to_user_mode (./arch/x86/include/asm/atomic.h:29 ./include/asm-generic/atomic-instrumented.h:28 ./include/linux/jump_label.h:254 ./arch/x86/include/asm/nospec-branch.h:288 ./arch/x86/include/asm/entry-common.h:80 kernel/entry/common.c:131 kernel/entry/common.c:267) 
> [14639.873304] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:125) 
> [14639.878353] RIP: 0033:0x7fd3d715cb5f
> [14639.881925] Code: 20 00 f7 d8 64 89 02 b8 ff ff ff ff c3 66 0f 1f 44 00 00 53 89 fb 48 83 ec 10 e8 bc fb ff ff 89 df 89 c2 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 15 89 d7 89 44 24 0c e8 fe fb ff ff 8b 44 24
> All code
> ========
>    0:	20 00                	and    %al,(%rax)
>    2:	f7 d8                	neg    %eax
>    4:	64 89 02             	mov    %eax,%fs:(%rdx)
>    7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
>    c:	c3                   	retq   
>    d:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
>   13:	53                   	push   %rbx
>   14:	89 fb                	mov    %edi,%ebx
>   16:	48 83 ec 10          	sub    $0x10,%rsp
>   1a:	e8 bc fb ff ff       	callq  0xfffffffffffffbdb
>   1f:	89 df                	mov    %ebx,%edi
>   21:	89 c2                	mov    %eax,%edx
>   23:	b8 03 00 00 00       	mov    $0x3,%eax
>   28:	0f 05                	syscall 
>   2a:*	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax		<-- trapping instruction
>   30:	77 15                	ja     0x47
>   32:	89 d7                	mov    %edx,%edi
>   34:	89 44 24 0c          	mov    %eax,0xc(%rsp)
>   38:	e8 fe fb ff ff       	callq  0xfffffffffffffc3b
>   3d:	8b                   	.byte 0x8b
>   3e:	44                   	rex.R
>   3f:	24                   	.byte 0x24
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	48 3d 00 f0 ff ff    	cmp    $0xfffffffffffff000,%rax
>    6:	77 15                	ja     0x1d
>    8:	89 d7                	mov    %edx,%edi
>    a:	89 44 24 0c          	mov    %eax,0xc(%rsp)
>    e:	e8 fe fb ff ff       	callq  0xfffffffffffffc11
>   13:	8b                   	.byte 0x8b
>   14:	44                   	rex.R
>   15:	24                   	.byte 0x24
> [14639.900667] RSP: 002b:00007fff07ed2f40 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
> [14639.908229] RAX: 0000000000000000 RBX: 0000000000000008 RCX: 00007fd3d715cb5f
> [14639.915354] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000008
> [14639.922480] RBP: 0000000000000000 R08: 0000000000000000 R09: 000000000000000e
> [14639.929607] R10: 000000000000000c R11: 0000000000000293 R12: 0000000005168450
> [14639.936732] R13: 0000000000000008 R14: 00000000007c8290 R15: 00007fff07ed31c0
> [14639.943859] Modules linked in: rpcsec_gss_krb5 nfsv4 nfs 8021q garp stp mrp llc snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio i915 amdgpu gpu_sched ttm input_leds x86_pkg_temp_thermal iosf_mbi led_class drm_kms_helper kvm_intel snd_hda_codec_hdmi drm snd_hda_intel intel_gtt snd_intel_dspcfg kvm fb_sys_fops syscopyarea snd_hda_codec snd_hda_core sysfillrect wmi_bmof sysimgblt snd_pcm irqbypass wmi snd_timer snd deflate iTCO_wdt soundcore iTCO_vendor_support crc32c_intel efi_pstore video pstore nfsd auth_rpcgss nfs_acl lockd grace sunrpc efivarfs ip_tables x_tables unix ipv6 autofs4
> [14639.996237] ---[ end trace c4d9d5f7e4b117a6 ]---
> [14640.705681] RIP: 0010:free_block (./include/linux/list.h:112 ./include/linux/list.h:135 ./include/linux/list.h:146 mm/slab.c:3336) 
> [14640.709874] Code: 00 48 01 d0 48 c1 e8 0c 48 c1 e0 06 4c 01 e8 48 8b 50 08 48 8d 4a ff 83 e2 01 48 0f 45 c1 48 8b 48 08 48 8b 50 10 4c 8d 78 08 <48> 89 51 08 48 89 0a 4c 89 da 48 2b 50 28 4c 89 60 08 48 89 68 10
> All code
> ========
>    0:	00 48 01             	add    %cl,0x1(%rax)
>    3:	d0 48 c1             	rorb   -0x3f(%rax)
>    6:	e8 0c 48 c1 e0       	callq  0xffffffffe0c14817
>    b:	06                   	(bad)  
>    c:	4c 01 e8             	add    %r13,%rax
>    f:	48 8b 50 08          	mov    0x8(%rax),%rdx
>   13:	48 8d 4a ff          	lea    -0x1(%rdx),%rcx
>   17:	83 e2 01             	and    $0x1,%edx
>   1a:	48 0f 45 c1          	cmovne %rcx,%rax
>   1e:	48 8b 48 08          	mov    0x8(%rax),%rcx
>   22:	48 8b 50 10          	mov    0x10(%rax),%rdx
>   26:	4c 8d 78 08          	lea    0x8(%rax),%r15
>   2a:*	48 89 51 08          	mov    %rdx,0x8(%rcx)		<-- trapping instruction
>   2e:	48 89 0a             	mov    %rcx,(%rdx)
>   31:	4c 89 da             	mov    %r11,%rdx
>   34:	48 2b 50 28          	sub    0x28(%rax),%rdx
>   38:	4c 89 60 08          	mov    %r12,0x8(%rax)
>   3c:	48 89 68 10          	mov    %rbp,0x10(%rax)
> 
> Code starting with the faulting instruction
> ===========================================
>    0:	48 89 51 08          	mov    %rdx,0x8(%rcx)
>    4:	48 89 0a             	mov    %rcx,(%rdx)
>    7:	4c 89 da             	mov    %r11,%rdx
>    a:	48 2b 50 28          	sub    0x28(%rax),%rdx
>    e:	4c 89 60 08          	mov    %r12,0x8(%rax)
>   12:	48 89 68 10          	mov    %rbp,0x10(%rax)
> [14640.728612] RSP: 0018:ffffc9001c26fab8 EFLAGS: 00010046
> [14640.733834] RAX: ffffea000d193600 RBX: 0000000080000000 RCX: dead000000000100
> [14640.740962] RDX: dead000000000122 RSI: ffff88842d5f3ef0 RDI: ffff88842b440300
> [14640.748092] RBP: dead000000000122 R08: ffffc9001c26fb30 R09: ffff88842b441280
> [14640.755218] R10: 000000000000000f R11: ffff8883464d80c0 R12: dead000000000100
> [14640.762348] R13: ffffea0000000000 R14: ffff88842d5f3ff0 R15: ffffea000d193608
> [14640.769478] FS:  00007fd3b7e8f040(0000) GS:ffff88842d5c0000(0000) knlGS:0000000000000000
> [14640.777558] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [14640.783327] CR2: 00007fd344233548 CR3: 00000002f46aa003 CR4: 00000000007706e0
> [14640.790476] PKRU: 55555554
> [14661.818409] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [14661.824340] rcu:     6-...0: (1 GPs behind) idle=83a/1/0x4000000000000000 softirq=545426/545427 fqs=1448
> [14661.833636]  (detected by 10, t=21025 jiffies, g=3736877, q=2158)
> [14661.839726] Task dump for CPU 6:
> [14661.842952] task:kworker/6:2     state:R  running task     stack:    0 pid: 7383 ppid:     2 flags:0x00004008
> [14661.852856] Workqueue: events cache_reap
> [14661.856779] Call Trace:
> [14661.859230] ? cache_reap (mm/slab.c:3978) 
> [14661.862804] ? process_one_work (./arch/x86/include/asm/atomic.h:29 ./include/asm-generic/atomic-instrumented.h:28 ./include/linux/jump_label.h:254 ./include/linux/jump_label.h:264 ./include/trace/events/workqueue.h:108 kernel/workqueue.c:2274) 
> [14661.866987] ? cancel_delayed_work (kernel/workqueue.c:2358) 
> [14661.871254] ? worker_thread (./include/linux/list.h:282 kernel/workqueue.c:2416) 
> [14661.875087] ? cancel_delayed_work (kernel/workqueue.c:2358) 
> [14661.879354] ? kthread (kernel/kthread.c:292) 
> [14661.882756] ? kthread_use_mm (kernel/kthread.c:245) 
> [14661.886589] ? ret_from_fork (arch/x86/entry/entry_64.S:294) 
> [14726.905632] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [14726.911561] rcu:     6-...0: (1 GPs behind) idle=83a/1/0x4000000000000000 softirq=545426/545427 fqs=1735
> [14726.920856]  (detected by 10, t=86112 jiffies, g=3736877, q=3398)
> [14726.926946] Task dump for CPU 6:
> [14726.930172] task:kworker/6:2     state:R  running task     stack:    0 pid: 7383 ppid:     2 flags:0x00004008
> [14726.940076] Workqueue: events cache_reap
> [14726.943994] Call Trace:
> [14726.946445] ? cache_reap (mm/slab.c:3978) 
> [14726.950019] ? process_one_work (./arch/x86/include/asm/atomic.h:29 ./include/asm-generic/atomic-instrumented.h:28 ./include/linux/jump_label.h:254 ./include/linux/jump_label.h:264 ./include/trace/events/workqueue.h:108 kernel/workqueue.c:2274) 
> [14726.954203] ? cancel_delayed_work (kernel/workqueue.c:2358) 
> [14726.958470] ? worker_thread (./include/linux/list.h:282 kernel/workqueue.c:2416) 
> [14726.962307] ? cancel_delayed_work (kernel/workqueue.c:2358) 
> [14726.966575] ? kthread (kernel/kthread.c:292) 
> [14726.969976] ? kthread_use_mm (kernel/kthread.c:245) 
> [14726.973809] ? ret_from_fork (arch/x86/entry/entry_64.S:294)

Is that a known issue? Reproducing the problem often takes several 
hours, so some guidance on what to try would be great.


Kind regards,

Paul


[1]: https://github.com/glmark2/glmark2
[2]: https://phoronix-test-suite.com/
[3]: https://openbenchmarking.org/suite/pts/desktop-graphics

--------------55B37117B98BC846E92EE0B2
Content-Type: text/plain; charset=UTF-8;
 name="optiplex-5080-linux-5.9-rc4-gp-pvpython-2.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="optiplex-5080-linux-5.9-rc4-gp-pvpython-2.txt"

LS0gTG9ncyBiZWdpbiBhdCBGcmkgMjAyMC0wOS0xMSAxNDo1NjoxMSBDRVNULCBlbmQgYXQg
VHVlIDIwMjAtMDktMTUgMTQ6MDg6MDggQ0VTVC4gLS0KU2VwIDE0IDEzOjM4OjA0IGZlbmNo
dXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogTGludXggdmVyc2lvbiA1LjkuMC1yYzQubXg2
NC4zNDMgKHJvb3RAdGhlaW50ZXJuZXQubW9sZ2VuLm1wZy5kZSkgKGdjYyAoR0NDKSA3LjUu
MCwgR05VIGxkIChHTlUgQmludXRpbHMpIDIuMzIpICMxIFNNUCBUdWUgU2VwIDggMTY6MjI6
MDEgQ0VTVCAyMDIwClNlcCAxNCAxMzozODowNCBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBr
ZXJuZWw6IENvbW1hbmQgbGluZTogQk9PVF9JTUFHRT0vYm9vdC9iekltYWdlLTUuOS4wLXJj
NC5teDY0LjM0MyByb290PUxBQkVMPXJvb3Qgcm8gY3Jhc2hrZXJuZWw9MjU2TSBjb25zb2xl
PXR0eVMwLDExNTIwMG44IGNvbnNvbGU9dHR5MCBpbml0PS9iaW4vc3lzdGVtZCBhdWRpdD0w
IHJhbmRvbS50cnVzdF9jcHU9b24KW+KApl0KU2VwIDE0IDE3OjQwOjA0IGZlbmNodXJjaC5t
b2xnZW4ubXBnLmRlIGtlcm5lbDogY2dyb3VwOiBmb3JrIHJlamVjdGVkIGJ5IHBpZHMgY29u
dHJvbGxlciBpbiAvdXNlci5zbGljZS91c2VyLTUyNzIuc2xpY2Uvc2Vzc2lvbi1jNi5zY29w
ZQpTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiBnZW5l
cmFsIHByb3RlY3Rpb24gZmF1bHQsIHByb2JhYmx5IGZvciBub24tY2Fub25pY2FsIGFkZHJl
c3MgMHhkZWFkMDAwMDAwMDAwMTAwOiAwMDAwIFsjMV0gU01QIE5PUFRJClNlcCAxNCAxNzo0
MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IENQVTogMTUgUElEOiAyMzA5
NCBDb21tOiBwdnB5dGhvbiBLZHVtcDogbG9hZGVkIE5vdCB0YWludGVkIDUuOS4wLXJjNC5t
eDY0LjM0MyAjMQpTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2Vy
bmVsOiBIYXJkd2FyZSBuYW1lOiBEZWxsIEluYy4gT3B0aVBsZXggNTA4MC8wMzJXNTUsIEJJ
T1MgMS4xLjcgMDgvMTcvMjAyMApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5t
cGcuZGUga2VybmVsOiBSSVA6IDAwMTA6ZnJlZV9ibG9jaysweGRjLzB4MWYwClNlcCAxNCAx
Nzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IENvZGU6IDAwIDQ4IDAx
IGQwIDQ4IGMxIGU4IDBjIDQ4IGMxIGUwIDA2IDRjIDAxIGU4IDQ4IDhiIDUwIDA4IDQ4IDhk
IDRhIGZmIDgzIGUyIDAxIDQ4IDBmIDQ1IGMxIDQ4IDhiIDQ4IDA4IDQ4IDhiIDUwIDEwIDRj
IDhkIDc4IDA4IDw0OD4gODkgNTEgMDggNDggODkgMGEgNGMgODkgZGEgNDggMmIgNTAgMjgg
NGMgODkgNjAgMDggNDggODkgNjggMTAKU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xn
ZW4ubXBnLmRlIGtlcm5lbDogUlNQOiAwMDE4OmZmZmZjOTAwMWMyNmZhYjggRUZMQUdTOiAw
MDAxMDA0NgpTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVs
OiBSQVg6IGZmZmZlYTAwMGQxOTM2MDAgUkJYOiAwMDAwMDAwMDgwMDAwMDAwIFJDWDogZGVh
ZDAwMDAwMDAwMDEwMApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUg
a2VybmVsOiBSRFg6IGRlYWQwMDAwMDAwMDAxMjIgUlNJOiBmZmZmODg4NDJkNWYzZWYwIFJE
STogZmZmZjg4ODQyYjQ0MDMwMApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5t
cGcuZGUga2VybmVsOiBSQlA6IGRlYWQwMDAwMDAwMDAxMjIgUjA4OiBmZmZmYzkwMDFjMjZm
YjMwIFIwOTogZmZmZjg4ODQyYjQ0MTI4MApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1v
bGdlbi5tcGcuZGUga2VybmVsOiBSMTA6IDAwMDAwMDAwMDAwMDAwMGYgUjExOiBmZmZmODg4
MzQ2NGQ4MGMwIFIxMjogZGVhZDAwMDAwMDAwMDEwMApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1
cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiBSMTM6IGZmZmZlYTAwMDAwMDAwMDAgUjE0OiBm
ZmZmODg4NDJkNWYzZmYwIFIxNTogZmZmZmVhMDAwZDE5MzYwOApTZXAgMTQgMTc6NDE6NTYg
ZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiBGUzogIDAwMDA3ZmQzYjdlOGYwNDAo
MDAwMCkgR1M6ZmZmZjg4ODQyZDVjMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAw
ClNlcCAxNCAxNzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IENTOiAg
MDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKU2VwIDE0IDE3
OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogQ1IyOiAwMDAwN2ZkMzQ0
MjMzNTQ4IENSMzogMDAwMDAwMDJmNDZhYTAwMyBDUjQ6IDAwMDAwMDAwMDA3NzA2ZTAKU2Vw
IDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogUEtSVTogNTU1
NTU1NTQKU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDog
Q2FsbCBUcmFjZToKU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtl
cm5lbDogIF9fX2NhY2hlX2ZyZWUrMHgyZjAvMHg0OTAKU2VwIDE0IDE3OjQxOjU2IGZlbmNo
dXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogIGtmcmVlKzB4OTAvMHgxMjAKU2VwIDE0IDE3
OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogIGttZW1fZnJlZXBhZ2Vz
KzB4YTUvMHhmMApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2Vy
bmVsOiAgc2xhYl9kZXN0cm95KzB4MTkvMHg1MApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNo
Lm1vbGdlbi5tcGcuZGUga2VybmVsOiAgc2xhYnNfZGVzdHJveSsweDU1LzB4ODAKU2VwIDE0
IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogIF9fX2NhY2hlX2Zy
ZWUrMHgzMGIvMHg0OTAKU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRl
IGtlcm5lbDogID8gX2NvbmRfcmVzY2hlZCsweDE1LzB4NDAKU2VwIDE0IDE3OjQxOjU2IGZl
bmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogIGtmcmVlKzB4OTAvMHgxMjAKU2VwIDE0
IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogIGFtZGdwdV92cmFt
X21ncl9kZWwrMHhjMS8weGUwIFthbWRncHVdClNlcCAxNCAxNzo0MTo1NiBmZW5jaHVyY2gu
bW9sZ2VuLm1wZy5kZSBrZXJuZWw6ICB0dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZSsweDdh
LzB4YTAgW3R0bV0KU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtl
cm5lbDogIHR0bV9ib19wdXQrMHgxYzAvMHgzYTAgW3R0bV0KU2VwIDE0IDE3OjQxOjU2IGZl
bmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogIGFtZGdwdV9ib191bnJlZisweDFhLzB4
MzAgW2FtZGdwdV0KU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtl
cm5lbDogIGFtZGdwdV92bV9mcmVlX3RhYmxlKzB4NWIvMHg3MCBbYW1kZ3B1XQpTZXAgMTQg
MTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiAgYW1kZ3B1X3ZtX2Zy
ZWVfcHRzKzB4N2MvMHhmMCBbYW1kZ3B1XQpTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1v
bGdlbi5tcGcuZGUga2VybmVsOiAgYW1kZ3B1X3ZtX2ZpbmkrMHgxZWEvMHg0NTAgW2FtZGdw
dV0KU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogIGFt
ZGdwdV9kcml2ZXJfcG9zdGNsb3NlX2ttcysweGRlLzB4MjQwIFthbWRncHVdClNlcCAxNCAx
Nzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6ICBkcm1fZmlsZV9mcmVl
LnBhcnQuOSsweDI1ZS8weDJiMCBbZHJtXQpTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1v
bGdlbi5tcGcuZGUga2VybmVsOiAgZHJtX3JlbGVhc2UrMHg2NS8weGUwIFtkcm1dClNlcCAx
NCAxNzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6ICBfX2ZwdXQrMHg5
My8weDI0MApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVs
OiAgdGFza193b3JrX3J1bisweDZjLzB4YTAKU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5t
b2xnZW4ubXBnLmRlIGtlcm5lbDogIGV4aXRfdG9fdXNlcl9tb2RlX3ByZXBhcmUrMHgxNDUv
MHgxNTAKU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDog
IHN5c2NhbGxfZXhpdF90b191c2VyX21vZGUrMHgyNi8weDE3MApTZXAgMTQgMTc6NDE6NTYg
ZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiAgZW50cnlfU1lTQ0FMTF82NF9hZnRl
cl9od2ZyYW1lKzB4NDQvMHhhOQpTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5t
cGcuZGUga2VybmVsOiBSSVA6IDAwMzM6MHg3ZmQzZDcxNWNiNWYKU2VwIDE0IDE3OjQxOjU2
IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogQ29kZTogMjAgMDAgZjcgZDggNjQg
ODkgMDIgYjggZmYgZmYgZmYgZmYgYzMgNjYgMGYgMWYgNDQgMDAgMDAgNTMgODkgZmIgNDgg
ODMgZWMgMTAgZTggYmMgZmIgZmYgZmYgODkgZGYgODkgYzIgYjggMDMgMDAgMDAgMDAgMGYg
MDUgPDQ4PiAzZCAwMCBmMCBmZiBmZiA3NyAxNSA4OSBkNyA4OSA0NCAyNCAwYyBlOCBmZSBm
YiBmZiBmZiA4YiA0NCAyNApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcu
ZGUga2VybmVsOiBSU1A6IDAwMmI6MDAwMDdmZmYwN2VkMmY0MCBFRkxBR1M6IDAwMDAwMjkz
IE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMDAzClNlcCAxNCAxNzo0MTo1NiBmZW5jaHVyY2gu
bW9sZ2VuLm1wZy5kZSBrZXJuZWw6IFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IDAwMDAw
MDAwMDAwMDAwMDggUkNYOiAwMDAwN2ZkM2Q3MTVjYjVmClNlcCAxNCAxNzo0MTo1NiBmZW5j
aHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6
IDAwMDAwMDAwMDAwMDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDA4ClNlcCAxNCAxNzo0MTo1
NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IFJCUDogMDAwMDAwMDAwMDAwMDAw
MCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAwMDAwMDAwMDAwMDBlClNlcCAxNCAx
Nzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IFIxMDogMDAwMDAwMDAw
MDAwMDAwYyBSMTE6IDAwMDAwMDAwMDAwMDAyOTMgUjEyOiAwMDAwMDAwMDA1MTY4NDUwClNl
cCAxNCAxNzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IFIxMzogMDAw
MDAwMDAwMDAwMDAwOCBSMTQ6IDAwMDAwMDAwMDA3YzgyOTAgUjE1OiAwMDAwN2ZmZjA3ZWQz
MWMwClNlcCAxNCAxNzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IE1v
ZHVsZXMgbGlua2VkIGluOiBycGNzZWNfZ3NzX2tyYjUgbmZzdjQgbmZzIDgwMjFxIGdhcnAg
c3RwIG1ycCBsbGMgc25kX2hkYV9jb2RlY19yZWFsdGVrIHNuZF9oZGFfY29kZWNfZ2VuZXJp
YyBsZWR0cmlnX2F1ZGlvIGk5MTUgYW1kZ3B1IGdwdV9zY2hlZCB0dG0gaW5wdXRfbGVkcyB4
ODZfcGtnX3RlbXBfdGhlcm1hbCBpb3NmX21iaSBsZWRfY2xhc3MgZHJtX2ttc19oZWxwZXIg
a3ZtX2ludGVsIHNuZF9oZGFfY29kZWNfaGRtaSBkcm0gc25kX2hkYV9pbnRlbCBpbnRlbF9n
dHQgc25kX2ludGVsX2RzcGNmZyBrdm0gZmJfc3lzX2ZvcHMgc3lzY29weWFyZWEgc25kX2hk
YV9jb2RlYyBzbmRfaGRhX2NvcmUgc3lzZmlsbHJlY3Qgd21pX2Jtb2Ygc3lzaW1nYmx0IHNu
ZF9wY20gaXJxYnlwYXNzIHdtaSBzbmRfdGltZXIgc25kIGRlZmxhdGUgaVRDT193ZHQgc291
bmRjb3JlIGlUQ09fdmVuZG9yX3N1cHBvcnQgY3JjMzJjX2ludGVsIGVmaV9wc3RvcmUgdmlk
ZW8gcHN0b3JlIG5mc2QgYXV0aF9ycGNnc3MgbmZzX2FjbCBsb2NrZCBncmFjZSBzdW5ycGMg
ZWZpdmFyZnMgaXBfdGFibGVzIHhfdGFibGVzIHVuaXggaXB2NiBhdXRvZnM0ClNlcCAxNCAx
Nzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IC0tLVsgZW5kIHRyYWNl
IGM0ZDlkNWY3ZTRiMTE3YTYgXS0tLQpTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdl
bi5tcGcuZGUga2VybmVsOiBSSVA6IDAwMTA6ZnJlZV9ibG9jaysweGRjLzB4MWYwClNlcCAx
NCAxNzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IENvZGU6IDAwIDQ4
IDAxIGQwIDQ4IGMxIGU4IDBjIDQ4IGMxIGUwIDA2IDRjIDAxIGU4IDQ4IDhiIDUwIDA4IDQ4
IDhkIDRhIGZmIDgzIGUyIDAxIDQ4IDBmIDQ1IGMxIDQ4IDhiIDQ4IDA4IDQ4IDhiIDUwIDEw
IDRjIDhkIDc4IDA4IDw0OD4gODkgNTEgMDggNDggODkgMGEgNGMgODkgZGEgNDggMmIgNTAg
MjggNGMgODkgNjAgMDggNDggODkgNjggMTAKU2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5t
b2xnZW4ubXBnLmRlIGtlcm5lbDogUlNQOiAwMDE4OmZmZmZjOTAwMWMyNmZhYjggRUZMQUdT
OiAwMDAxMDA0NgpTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2Vy
bmVsOiBSQVg6IGZmZmZlYTAwMGQxOTM2MDAgUkJYOiAwMDAwMDAwMDgwMDAwMDAwIFJDWDog
ZGVhZDAwMDAwMDAwMDEwMApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcu
ZGUga2VybmVsOiBSRFg6IGRlYWQwMDAwMDAwMDAxMjIgUlNJOiBmZmZmODg4NDJkNWYzZWYw
IFJESTogZmZmZjg4ODQyYjQ0MDMwMApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNoLm1vbGdl
bi5tcGcuZGUga2VybmVsOiBSQlA6IGRlYWQwMDAwMDAwMDAxMjIgUjA4OiBmZmZmYzkwMDFj
MjZmYjMwIFIwOTogZmZmZjg4ODQyYjQ0MTI4MApTZXAgMTQgMTc6NDE6NTYgZmVuY2h1cmNo
Lm1vbGdlbi5tcGcuZGUga2VybmVsOiBSMTA6IDAwMDAwMDAwMDAwMDAwMGYgUjExOiBmZmZm
ODg4MzQ2NGQ4MGMwIFIxMjogZGVhZDAwMDAwMDAwMDEwMApTZXAgMTQgMTc6NDE6NTYgZmVu
Y2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiBSMTM6IGZmZmZlYTAwMDAwMDAwMDAgUjE0
OiBmZmZmODg4NDJkNWYzZmYwIFIxNTogZmZmZmVhMDAwZDE5MzYwOApTZXAgMTQgMTc6NDE6
NTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiBGUzogIDAwMDA3ZmQzYjdlOGYw
NDAoMDAwMCkgR1M6ZmZmZjg4ODQyZDVjMDAwMCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAw
MDAwClNlcCAxNCAxNzo0MTo1NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IENT
OiAgMDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKU2VwIDE0
IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogQ1IyOiAwMDAwN2Zk
MzQ0MjMzNTQ4IENSMzogMDAwMDAwMDJmNDZhYTAwMyBDUjQ6IDAwMDAwMDAwMDA3NzA2ZTAK
U2VwIDE0IDE3OjQxOjU2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogUEtSVTog
NTU1NTU1NTQKU2VwIDE0IDE3OjQyOjE3IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5l
bDogcmN1OiBJTkZPOiByY3Vfc2NoZWQgZGV0ZWN0ZWQgc3RhbGxzIG9uIENQVXMvdGFza3M6
ClNlcCAxNCAxNzo0MjoxNyBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IHJjdTog
CTYtLi4uMDogKDEgR1BzIGJlaGluZCkgaWRsZT04M2EvMS8weDQwMDAwMDAwMDAwMDAwMDAg
c29mdGlycT01NDU0MjYvNTQ1NDI3IGZxcz0xNDQ4IApTZXAgMTQgMTc6NDI6MTcgZmVuY2h1
cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiAJKGRldGVjdGVkIGJ5IDEwLCB0PTIxMDI1IGpp
ZmZpZXMsIGc9MzczNjg3NywgcT0yMTU4KQpTZXAgMTQgMTc6NDI6MTcgZmVuY2h1cmNoLm1v
bGdlbi5tcGcuZGUga2VybmVsOiBUYXNrIGR1bXAgZm9yIENQVSA2OgpTZXAgMTQgMTc6NDI6
MTcgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiB0YXNrOmt3b3JrZXIvNjoyICAg
ICBzdGF0ZTpSICBydW5uaW5nIHRhc2sgICAgIHN0YWNrOiAgICAwIHBpZDogNzM4MyBwcGlk
OiAgICAgMiBmbGFnczoweDAwMDA0MDA4ClNlcCAxNCAxNzo0MjoxNyBmZW5jaHVyY2gubW9s
Z2VuLm1wZy5kZSBrZXJuZWw6IFdvcmtxdWV1ZTogZXZlbnRzIGNhY2hlX3JlYXAKU2VwIDE0
IDE3OjQyOjE3IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogQ2FsbCBUcmFjZToK
U2VwIDE0IDE3OjQyOjE3IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogID8gY2Fj
aGVfcmVhcCsweGMyLzB4MjAwClNlcCAxNCAxNzo0MjoxNyBmZW5jaHVyY2gubW9sZ2VuLm1w
Zy5kZSBrZXJuZWw6ICA/IHByb2Nlc3Nfb25lX3dvcmsrMHgxZTUvMHg0MjAKU2VwIDE0IDE3
OjQyOjE3IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogID8gY2FuY2VsX2RlbGF5
ZWRfd29yaysweDkwLzB4OTAKU2VwIDE0IDE3OjQyOjE3IGZlbmNodXJjaC5tb2xnZW4ubXBn
LmRlIGtlcm5lbDogID8gd29ya2VyX3RocmVhZCsweDJkLzB4M2IwClNlcCAxNCAxNzo0Mjox
NyBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6ICA/IGNhbmNlbF9kZWxheWVkX3dv
cmsrMHg5MC8weDkwClNlcCAxNCAxNzo0MjoxNyBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBr
ZXJuZWw6ICA/IGt0aHJlYWQrMHgxMTgvMHgxMzAKU2VwIDE0IDE3OjQyOjE3IGZlbmNodXJj
aC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogID8ga3RocmVhZF91c2VfbW0rMHhlMC8weGUwClNl
cCAxNCAxNzo0MjoxNyBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6ICA/IHJldF9m
cm9tX2ZvcmsrMHgxZi8weDMwClNlcCAxNCAxNzo0MzoyMyBmZW5jaHVyY2gubW9sZ2VuLm1w
Zy5kZSBrZXJuZWw6IHJjdTogSU5GTzogcmN1X3NjaGVkIGRldGVjdGVkIHN0YWxscyBvbiBD
UFVzL3Rhc2tzOgpTZXAgMTQgMTc6NDM6MjMgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2Vy
bmVsOiByY3U6IAk2LS4uLjA6ICgxIEdQcyBiZWhpbmQpIGlkbGU9ODNhLzEvMHg0MDAwMDAw
MDAwMDAwMDAwIHNvZnRpcnE9NTQ1NDI2LzU0NTQyNyBmcXM9MTczNSAKU2VwIDE0IDE3OjQz
OjIzIGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogCShkZXRlY3RlZCBieSAxMCwg
dD04NjExMiBqaWZmaWVzLCBnPTM3MzY4NzcsIHE9MzM5OCkKU2VwIDE0IDE3OjQzOjIzIGZl
bmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogVGFzayBkdW1wIGZvciBDUFUgNjoKU2Vw
IDE0IDE3OjQzOjIzIGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIGtlcm5lbDogdGFzazprd29y
a2VyLzY6MiAgICAgc3RhdGU6UiAgcnVubmluZyB0YXNrICAgICBzdGFjazogICAgMCBwaWQ6
IDczODMgcHBpZDogICAgIDIgZmxhZ3M6MHgwMDAwNDAwOApTZXAgMTQgMTc6NDM6MjMgZmVu
Y2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiBXb3JrcXVldWU6IGV2ZW50cyBjYWNoZV9y
ZWFwClNlcCAxNCAxNzo0MzoyMyBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6IENh
bGwgVHJhY2U6ClNlcCAxNCAxNzo0MzoyMyBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJu
ZWw6ICA/IGNhY2hlX3JlYXArMHhjMi8weDIwMApTZXAgMTQgMTc6NDM6MjMgZmVuY2h1cmNo
Lm1vbGdlbi5tcGcuZGUga2VybmVsOiAgPyBwcm9jZXNzX29uZV93b3JrKzB4MWU1LzB4NDIw
ClNlcCAxNCAxNzo0MzoyMyBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6ICA/IGNh
bmNlbF9kZWxheWVkX3dvcmsrMHg5MC8weDkwClNlcCAxNCAxNzo0MzoyMyBmZW5jaHVyY2gu
bW9sZ2VuLm1wZy5kZSBrZXJuZWw6ICA/IHdvcmtlcl90aHJlYWQrMHgyZC8weDNiMApTZXAg
MTQgMTc6NDM6MjMgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVsOiAgPyBjYW5jZWxf
ZGVsYXllZF93b3JrKzB4OTAvMHg5MApTZXAgMTQgMTc6NDM6MjMgZmVuY2h1cmNoLm1vbGdl
bi5tcGcuZGUga2VybmVsOiAgPyBrdGhyZWFkKzB4MTE4LzB4MTMwClNlcCAxNCAxNzo0Mzoy
MyBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBrZXJuZWw6ICA/IGt0aHJlYWRfdXNlX21tKzB4
ZTAvMHhlMApTZXAgMTQgMTc6NDM6MjMgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUga2VybmVs
OiAgPyByZXRfZnJvbV9mb3JrKzB4MWYvMHgzMApTZXAgMTQgMTc6NDU6MTYgZmVuY2h1cmNo
Lm1vbGdlbi5tcGcuZGUgc3lzdGVtZFsxXTogc3lzdGVtZC11ZGV2ZC5zZXJ2aWNlOiBXYXRj
aGRvZyB0aW1lb3V0IChsaW1pdCAzbWluKSEKU2VwIDE0IDE3OjQ1OjE2IGZlbmNodXJjaC5t
b2xnZW4ubXBnLmRlIHN5c3RlbWRbMV06IHN5c3RlbWQtdWRldmQuc2VydmljZTogS2lsbGlu
ZyBwcm9jZXNzIDIyOCAoc3lzdGVtZC11ZGV2ZCkgd2l0aCBzaWduYWwgU0lHQUJSVC4KU2Vw
IDE0IDE3OjQ1OjE2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIHN5c3RlbWRbMV06IHN5c3Rl
bWQtdWRldmQuc2VydmljZTogTWFpbiBwcm9jZXNzIGV4aXRlZCwgY29kZT1kdW1wZWQsIHN0
YXR1cz02L0FCUlQKU2VwIDE0IDE3OjQ1OjE2IGZlbmNodXJjaC5tb2xnZW4ubXBnLmRlIHN5
c3RlbWRbMV06IHN5c3RlbWQtdWRldmQuc2VydmljZTogS2lsbGluZyBwcm9jZXNzIDIzMTY2
IChzeXN0ZW1kLXVkZXZkKSB3aXRoIHNpZ25hbCBTSUdLSUxMLgpTZXAgMTQgMTc6NDU6MTYg
ZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUgc3lzdGVtZFsxXTogc3lzdGVtZC11ZGV2ZC5zZXJ2
aWNlOiBLaWxsaW5nIHByb2Nlc3MgMjMxNjcgKHN5c3RlbWQtdWRldmQpIHdpdGggc2lnbmFs
IFNJR0tJTEwuClNlcCAxNCAxNzo0NToxNiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBzeXN0
ZW1kWzFdOiBzeXN0ZW1kLXVkZXZkLnNlcnZpY2U6IEtpbGxpbmcgcHJvY2VzcyAyMzE2OCAo
c3lzdGVtZC11ZGV2ZCkgd2l0aCBzaWduYWwgU0lHS0lMTC4KU2VwIDE0IDE3OjQ1OjE2IGZl
bmNodXJjaC5tb2xnZW4ubXBnLmRlIHN5c3RlbWRbMV06IHN5c3RlbWQtdWRldmQuc2Vydmlj
ZTogS2lsbGluZyBwcm9jZXNzIDIzMTY5IChzeXN0ZW1kLXVkZXZkKSB3aXRoIHNpZ25hbCBT
SUdLSUxMLgpTZXAgMTQgMTc6NDU6MTYgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUgc3lzdGVt
ZFsxXTogc3lzdGVtZC11ZGV2ZC5zZXJ2aWNlOiBLaWxsaW5nIHByb2Nlc3MgMjMxNzAgKHN5
c3RlbWQtdWRldmQpIHdpdGggc2lnbmFsIFNJR0tJTEwuClNlcCAxNCAxNzo0Njo0NiBmZW5j
aHVyY2gubW9sZ2VuLm1wZy5kZSBzeXN0ZW1kWzFdOiBzeXN0ZW1kLXVkZXZkLnNlcnZpY2U6
IFByb2Nlc3NlcyBzdGlsbCBhcm91bmQgYWZ0ZXIgZmluYWwgU0lHS0lMTC4gRW50ZXJpbmcg
ZmFpbGVkIG1vZGUuClNlcCAxNCAxNzo0Njo0NiBmZW5jaHVyY2gubW9sZ2VuLm1wZy5kZSBz
eXN0ZW1kWzFdOiBzeXN0ZW1kLXVkZXZkLnNlcnZpY2U6IEZhaWxlZCB3aXRoIHJlc3VsdCAn
d2F0Y2hkb2cnLgpTZXAgMTQgMTc6NDY6NDcgZmVuY2h1cmNoLm1vbGdlbi5tcGcuZGUgc3lz
dGVtZFsxXTogc3lzdGVtZC11ZGV2ZC5zZXJ2aWNlOiBGYWlsZWQgdG8gZGVzdHJveSBjZ3Jv
dXAgL3N5c3RlbS5zbGljZS9zeXN0ZW1kLXVkZXZkLnNlcnZpY2UsIGlnbm9yaW5nOiBEZXZp
Y2Ugb3IgcmVzb3VyY2UgYnVzeQpTZXAgMTQgMTc6NDY6NDcgZmVuY2h1cmNoLm1vbGdlbi5t
cGcuZGUgc3lzdGVtZFsxXTogc3lzdGVtZC11ZGV2ZC5zZXJ2aWNlOiBTZXJ2aWNlIGhhcyBu
byBob2xkLW9mZiB0aW1lIChSZXN0YXJ0U2VjPTApLCBzY2hlZHVsaW5nIHJlc3RhcnQuCg==
--------------55B37117B98BC846E92EE0B2
Content-Type: text/plain; charset=UTF-8;
 name="optiplex-5080-linux-5.9-rc4-gp-pvpython.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="optiplex-5080-linux-5.9-rc4-gp-pvpython.txt"

WzE0NTI4LjcxODY1Nl0gY2dyb3VwOiBmb3JrIHJlamVjdGVkIGJ5IHBpZHMgY29udHJvbGxl
ciBpbiAvdXNlci5zbGljZS91c2VyLTUyNzIuc2xpY2Uvc2Vzc2lvbi1jNi5zY29wZQpbMTQ2
MzkuNjY1NzQ1XSBnZW5lcmFsIHByb3RlY3Rpb24gZmF1bHQsIHByb2JhYmx5IGZvciBub24t
Y2Fub25pY2FsIGFkZHJlc3MgMHhkZWFkMDAwMDAwMDAwMTAwOiAwMDAwIFsjMV0gU01QIE5P
UFRJClsxNDYzOS42NzU5MTddIENQVTogMTUgUElEOiAyMzA5NCBDb21tOiBwdnB5dGhvbiBL
ZHVtcDogbG9hZGVkIE5vdCB0YWludGVkIDUuOS4wLXJjNC5teDY0LjM0MyAjMQpbMTQ2Mzku
Njg0NDMxXSBIYXJkd2FyZSBuYW1lOiBEZWxsIEluYy4gT3B0aVBsZXggNTA4MC8wMzJXNTUs
IEJJT1MgMS4xLjcgMDgvMTcvMjAyMApbMTQ2MzkuNjkxODIzXSBSSVA6IDAwMTA6ZnJlZV9i
bG9jaysweGRjLzB4MWYwClsxNDYzOS42OTYwMDZdIENvZGU6IDAwIDQ4IDAxIGQwIDQ4IGMx
IGU4IDBjIDQ4IGMxIGUwIDA2IDRjIDAxIGU4IDQ4IDhiIDUwIDA4IDQ4IDhkIDRhIGZmIDgz
IGUyIDAxIDQ4IDBmIDQ1IGMxIDQ4IDhiIDQ4IDA4IDQ4IDhiIDUwIDEwIDRjIDhkIDc4IDA4
IDw0OD4gODkgNTEgMDggNDggODkgMGEgNGMgODkgZGEgNDggMmIgNTAgMjggNGMgODkgNjAg
MDggNDggODkgNjggMTAKWzE0NjM5LjcxNDc0N10gUlNQOiAwMDE4OmZmZmZjOTAwMWMyNmZh
YjggRUZMQUdTOiAwMDAxMDA0NgpbMTQ2MzkuNzE5OTcwXSBSQVg6IGZmZmZlYTAwMGQxOTM2
MDAgUkJYOiAwMDAwMDAwMDgwMDAwMDAwIFJDWDogZGVhZDAwMDAwMDAwMDEwMApbMTQ2Mzku
NzI3MDk5XSBSRFg6IGRlYWQwMDAwMDAwMDAxMjIgUlNJOiBmZmZmODg4NDJkNWYzZWYwIFJE
STogZmZmZjg4ODQyYjQ0MDMwMApbMTQ2MzkuNzM0MjI1XSBSQlA6IGRlYWQwMDAwMDAwMDAx
MjIgUjA4OiBmZmZmYzkwMDFjMjZmYjMwIFIwOTogZmZmZjg4ODQyYjQ0MTI4MApbMTQ2Mzku
NzQxMzUxXSBSMTA6IDAwMDAwMDAwMDAwMDAwMGYgUjExOiBmZmZmODg4MzQ2NGQ4MGMwIFIx
MjogZGVhZDAwMDAwMDAwMDEwMApbMTQ2MzkuNzQ4NDc3XSBSMTM6IGZmZmZlYTAwMDAwMDAw
MDAgUjE0OiBmZmZmODg4NDJkNWYzZmYwIFIxNTogZmZmZmVhMDAwZDE5MzYwOApbMTQ2Mzku
NzU1NjA0XSBGUzogIDAwMDA3ZmQzYjdlOGYwNDAoMDAwMCkgR1M6ZmZmZjg4ODQyZDVjMDAw
MCgwMDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsxNDYzOS43NjM2OTJdIENTOiAgMDAx
MCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWzE0NjM5Ljc2OTQz
MF0gQ1IyOiAwMDAwN2ZkMzQ0MjMzNTQ4IENSMzogMDAwMDAwMDJmNDZhYTAwMyBDUjQ6IDAw
MDAwMDAwMDA3NzA2ZTAKWzE0NjM5Ljc3NjU1Nl0gUEtSVTogNTU1NTU1NTQKWzE0NjM5Ljc3
OTI2NV0gQ2FsbCBUcmFjZToKWzE0NjM5Ljc4MTcxN10gIF9fX2NhY2hlX2ZyZWUrMHgyZjAv
MHg0OTAKWzE0NjM5Ljc4NTQ2M10gIGtmcmVlKzB4OTAvMHgxMjAKWzE0NjM5Ljc4ODQzMl0g
IGttZW1fZnJlZXBhZ2VzKzB4YTUvMHhmMApbMTQ2MzkuNzkyMDkzXSAgc2xhYl9kZXN0cm95
KzB4MTkvMHg1MApbMTQ2MzkuNzk1NTc5XSAgc2xhYnNfZGVzdHJveSsweDU1LzB4ODAKWzE0
NjM5Ljc5OTE1Ml0gIF9fX2NhY2hlX2ZyZWUrMHgzMGIvMHg0OTAKWzE0NjM5LjgwMjkwMl0g
ID8gX2NvbmRfcmVzY2hlZCsweDE1LzB4NDAKWzE0NjM5LjgwNjY1MF0gIGtmcmVlKzB4OTAv
MHgxMjAKWzE0NjM5LjgwOTY0NF0gIGFtZGdwdV92cmFtX21ncl9kZWwrMHhjMS8weGUwIFth
bWRncHVdClsxNDYzOS44MTQ1MjRdICB0dG1fYm9fY2xlYW51cF9tZW10eXBlX3VzZSsweDdh
LzB4YTAgW3R0bV0KWzE0NjM5LjgxOTc0OF0gIHR0bV9ib19wdXQrMHgxYzAvMHgzYTAgW3R0
bV0KWzE0NjM5LjgyMzc2OF0gIGFtZGdwdV9ib191bnJlZisweDFhLzB4MzAgW2FtZGdwdV0K
WzE0NjM5LjgyODMxM10gIGFtZGdwdV92bV9mcmVlX3RhYmxlKzB4NWIvMHg3MCBbYW1kZ3B1
XQpbMTQ2MzkuODMzMjkzXSAgYW1kZ3B1X3ZtX2ZyZWVfcHRzKzB4N2MvMHhmMCBbYW1kZ3B1
XQpbMTQ2MzkuODM4MDk3XSAgYW1kZ3B1X3ZtX2ZpbmkrMHgxZWEvMHg0NTAgW2FtZGdwdV0K
WzE0NjM5Ljg0MjcyN10gIGFtZGdwdV9kcml2ZXJfcG9zdGNsb3NlX2ttcysweGRlLzB4MjQw
IFthbWRncHVdClsxNDYzOS44NDgzODddICBkcm1fZmlsZV9mcmVlLnBhcnQuOSsweDI1ZS8w
eDJiMCBbZHJtXQpbMTQ2MzkuODUzMjYzXSAgZHJtX3JlbGVhc2UrMHg2NS8weGUwIFtkcm1d
ClsxNDYzOS44NTcxODNdICBfX2ZwdXQrMHg5My8weDI0MApbMTQ2MzkuODYwMjM4XSAgdGFz
a193b3JrX3J1bisweDZjLzB4YTAKWzE0NjM5Ljg2MzgxMV0gIGV4aXRfdG9fdXNlcl9tb2Rl
X3ByZXBhcmUrMHgxNDUvMHgxNTAKWzE0NjM5Ljg2ODYwMl0gIHN5c2NhbGxfZXhpdF90b191
c2VyX21vZGUrMHgyNi8weDE3MApbMTQ2MzkuODczMzA0XSAgZW50cnlfU1lTQ0FMTF82NF9h
ZnRlcl9od2ZyYW1lKzB4NDQvMHhhOQpbMTQ2MzkuODc4MzUzXSBSSVA6IDAwMzM6MHg3ZmQz
ZDcxNWNiNWYKWzE0NjM5Ljg4MTkyNV0gQ29kZTogMjAgMDAgZjcgZDggNjQgODkgMDIgYjgg
ZmYgZmYgZmYgZmYgYzMgNjYgMGYgMWYgNDQgMDAgMDAgNTMgODkgZmIgNDggODMgZWMgMTAg
ZTggYmMgZmIgZmYgZmYgODkgZGYgODkgYzIgYjggMDMgMDAgMDAgMDAgMGYgMDUgPDQ4PiAz
ZCAwMCBmMCBmZiBmZiA3NyAxNSA4OSBkNyA4OSA0NCAyNCAwYyBlOCBmZSBmYiBmZiBmZiA4
YiA0NCAyNApbMTQ2MzkuOTAwNjY3XSBSU1A6IDAwMmI6MDAwMDdmZmYwN2VkMmY0MCBFRkxB
R1M6IDAwMDAwMjkzIE9SSUdfUkFYOiAwMDAwMDAwMDAwMDAwMDAzClsxNDYzOS45MDgyMjld
IFJBWDogMDAwMDAwMDAwMDAwMDAwMCBSQlg6IDAwMDAwMDAwMDAwMDAwMDggUkNYOiAwMDAw
N2ZkM2Q3MTVjYjVmClsxNDYzOS45MTUzNTRdIFJEWDogMDAwMDAwMDAwMDAwMDAwMCBSU0k6
IDAwMDAwMDAwMDAwMDAwMDAgUkRJOiAwMDAwMDAwMDAwMDAwMDA4ClsxNDYzOS45MjI0ODBd
IFJCUDogMDAwMDAwMDAwMDAwMDAwMCBSMDg6IDAwMDAwMDAwMDAwMDAwMDAgUjA5OiAwMDAw
MDAwMDAwMDAwMDBlClsxNDYzOS45Mjk2MDddIFIxMDogMDAwMDAwMDAwMDAwMDAwYyBSMTE6
IDAwMDAwMDAwMDAwMDAyOTMgUjEyOiAwMDAwMDAwMDA1MTY4NDUwClsxNDYzOS45MzY3MzJd
IFIxMzogMDAwMDAwMDAwMDAwMDAwOCBSMTQ6IDAwMDAwMDAwMDA3YzgyOTAgUjE1OiAwMDAw
N2ZmZjA3ZWQzMWMwClsxNDYzOS45NDM4NTldIE1vZHVsZXMgbGlua2VkIGluOiBycGNzZWNf
Z3NzX2tyYjUgbmZzdjQgbmZzIDgwMjFxIGdhcnAgc3RwIG1ycCBsbGMgc25kX2hkYV9jb2Rl
Y19yZWFsdGVrIHNuZF9oZGFfY29kZWNfZ2VuZXJpYyBsZWR0cmlnX2F1ZGlvIGk5MTUgYW1k
Z3B1IGdwdV9zY2hlZCB0dG0gaW5wdXRfbGVkcyB4ODZfcGtnX3RlbXBfdGhlcm1hbCBpb3Nm
X21iaSBsZWRfY2xhc3MgZHJtX2ttc19oZWxwZXIga3ZtX2ludGVsIHNuZF9oZGFfY29kZWNf
aGRtaSBkcm0gc25kX2hkYV9pbnRlbCBpbnRlbF9ndHQgc25kX2ludGVsX2RzcGNmZyBrdm0g
ZmJfc3lzX2ZvcHMgc3lzY29weWFyZWEgc25kX2hkYV9jb2RlYyBzbmRfaGRhX2NvcmUgc3lz
ZmlsbHJlY3Qgd21pX2Jtb2Ygc3lzaW1nYmx0IHNuZF9wY20gaXJxYnlwYXNzIHdtaSBzbmRf
dGltZXIgc25kIGRlZmxhdGUgaVRDT193ZHQgc291bmRjb3JlIGlUQ09fdmVuZG9yX3N1cHBv
cnQgY3JjMzJjX2ludGVsIGVmaV9wc3RvcmUgdmlkZW8gcHN0b3JlIG5mc2QgYXV0aF9ycGNn
c3MgbmZzX2FjbCBsb2NrZCBncmFjZSBzdW5ycGMgZWZpdmFyZnMgaXBfdGFibGVzIHhfdGFi
bGVzIHVuaXggaXB2NiBhdXRvZnM0ClsxNDYzOS45OTYyMzddIC0tLVsgZW5kIHRyYWNlIGM0
ZDlkNWY3ZTRiMTE3YTYgXS0tLQpbMTQ2NDAuNzA1NjgxXSBSSVA6IDAwMTA6ZnJlZV9ibG9j
aysweGRjLzB4MWYwClsxNDY0MC43MDk4NzRdIENvZGU6IDAwIDQ4IDAxIGQwIDQ4IGMxIGU4
IDBjIDQ4IGMxIGUwIDA2IDRjIDAxIGU4IDQ4IDhiIDUwIDA4IDQ4IDhkIDRhIGZmIDgzIGUy
IDAxIDQ4IDBmIDQ1IGMxIDQ4IDhiIDQ4IDA4IDQ4IDhiIDUwIDEwIDRjIDhkIDc4IDA4IDw0
OD4gODkgNTEgMDggNDggODkgMGEgNGMgODkgZGEgNDggMmIgNTAgMjggNGMgODkgNjAgMDgg
NDggODkgNjggMTAKWzE0NjQwLjcyODYxMl0gUlNQOiAwMDE4OmZmZmZjOTAwMWMyNmZhYjgg
RUZMQUdTOiAwMDAxMDA0NgpbMTQ2NDAuNzMzODM0XSBSQVg6IGZmZmZlYTAwMGQxOTM2MDAg
UkJYOiAwMDAwMDAwMDgwMDAwMDAwIFJDWDogZGVhZDAwMDAwMDAwMDEwMApbMTQ2NDAuNzQw
OTYyXSBSRFg6IGRlYWQwMDAwMDAwMDAxMjIgUlNJOiBmZmZmODg4NDJkNWYzZWYwIFJESTog
ZmZmZjg4ODQyYjQ0MDMwMApbMTQ2NDAuNzQ4MDkyXSBSQlA6IGRlYWQwMDAwMDAwMDAxMjIg
UjA4OiBmZmZmYzkwMDFjMjZmYjMwIFIwOTogZmZmZjg4ODQyYjQ0MTI4MApbMTQ2NDAuNzU1
MjE4XSBSMTA6IDAwMDAwMDAwMDAwMDAwMGYgUjExOiBmZmZmODg4MzQ2NGQ4MGMwIFIxMjog
ZGVhZDAwMDAwMDAwMDEwMApbMTQ2NDAuNzYyMzQ4XSBSMTM6IGZmZmZlYTAwMDAwMDAwMDAg
UjE0OiBmZmZmODg4NDJkNWYzZmYwIFIxNTogZmZmZmVhMDAwZDE5MzYwOApbMTQ2NDAuNzY5
NDc4XSBGUzogIDAwMDA3ZmQzYjdlOGYwNDAoMDAwMCkgR1M6ZmZmZjg4ODQyZDVjMDAwMCgw
MDAwKSBrbmxHUzowMDAwMDAwMDAwMDAwMDAwClsxNDY0MC43Nzc1NThdIENTOiAgMDAxMCBE
UzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKWzE0NjQwLjc4MzMyN10g
Q1IyOiAwMDAwN2ZkMzQ0MjMzNTQ4IENSMzogMDAwMDAwMDJmNDZhYTAwMyBDUjQ6IDAwMDAw
MDAwMDA3NzA2ZTAKWzE0NjQwLjc5MDQ3Nl0gUEtSVTogNTU1NTU1NTQKWzE0NjYxLjgxODQw
OV0gcmN1OiBJTkZPOiByY3Vfc2NoZWQgZGV0ZWN0ZWQgc3RhbGxzIG9uIENQVXMvdGFza3M6
ClsxNDY2MS44MjQzNDBdIHJjdTogICAgIDYtLi4uMDogKDEgR1BzIGJlaGluZCkgaWRsZT04
M2EvMS8weDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT01NDU0MjYvNTQ1NDI3IGZxcz0xNDQ4
ClsxNDY2MS44MzM2MzZdICAoZGV0ZWN0ZWQgYnkgMTAsIHQ9MjEwMjUgamlmZmllcywgZz0z
NzM2ODc3LCBxPTIxNTgpClsxNDY2MS44Mzk3MjZdIFRhc2sgZHVtcCBmb3IgQ1BVIDY6Clsx
NDY2MS44NDI5NTJdIHRhc2s6a3dvcmtlci82OjIgICAgIHN0YXRlOlIgIHJ1bm5pbmcgdGFz
ayAgICAgc3RhY2s6ICAgIDAgcGlkOiA3MzgzIHBwaWQ6ICAgICAyIGZsYWdzOjB4MDAwMDQw
MDgKWzE0NjYxLjg1Mjg1Nl0gV29ya3F1ZXVlOiBldmVudHMgY2FjaGVfcmVhcApbMTQ2NjEu
ODU2Nzc5XSBDYWxsIFRyYWNlOgpbMTQ2NjEuODU5MjMwXSAgPyBjYWNoZV9yZWFwKzB4YzIv
MHgyMDAKWzE0NjYxLjg2MjgwNF0gID8gcHJvY2Vzc19vbmVfd29yaysweDFlNS8weDQyMApb
MTQ2NjEuODY2OTg3XSAgPyBjYW5jZWxfZGVsYXllZF93b3JrKzB4OTAvMHg5MApbMTQ2NjEu
ODcxMjU0XSAgPyB3b3JrZXJfdGhyZWFkKzB4MmQvMHgzYjAKWzE0NjYxLjg3NTA4N10gID8g
Y2FuY2VsX2RlbGF5ZWRfd29yaysweDkwLzB4OTAKWzE0NjYxLjg3OTM1NF0gID8ga3RocmVh
ZCsweDExOC8weDEzMApbMTQ2NjEuODgyNzU2XSAgPyBrdGhyZWFkX3VzZV9tbSsweGUwLzB4
ZTAKWzE0NjYxLjg4NjU4OV0gID8gcmV0X2Zyb21fZm9yaysweDFmLzB4MzAKWzE0NzI2Ljkw
NTYzMl0gcmN1OiBJTkZPOiByY3Vfc2NoZWQgZGV0ZWN0ZWQgc3RhbGxzIG9uIENQVXMvdGFz
a3M6ClsxNDcyNi45MTE1NjFdIHJjdTogICAgIDYtLi4uMDogKDEgR1BzIGJlaGluZCkgaWRs
ZT04M2EvMS8weDQwMDAwMDAwMDAwMDAwMDAgc29mdGlycT01NDU0MjYvNTQ1NDI3IGZxcz0x
NzM1ClsxNDcyNi45MjA4NTZdICAoZGV0ZWN0ZWQgYnkgMTAsIHQ9ODYxMTIgamlmZmllcywg
Zz0zNzM2ODc3LCBxPTMzOTgpClsxNDcyNi45MjY5NDZdIFRhc2sgZHVtcCBmb3IgQ1BVIDY6
ClsxNDcyNi45MzAxNzJdIHRhc2s6a3dvcmtlci82OjIgICAgIHN0YXRlOlIgIHJ1bm5pbmcg
dGFzayAgICAgc3RhY2s6ICAgIDAgcGlkOiA3MzgzIHBwaWQ6ICAgICAyIGZsYWdzOjB4MDAw
MDQwMDgKWzE0NzI2Ljk0MDA3Nl0gV29ya3F1ZXVlOiBldmVudHMgY2FjaGVfcmVhcApbMTQ3
MjYuOTQzOTk0XSBDYWxsIFRyYWNlOgpbMTQ3MjYuOTQ2NDQ1XSAgPyBjYWNoZV9yZWFwKzB4
YzIvMHgyMDAKWzE0NzI2Ljk1MDAxOV0gID8gcHJvY2Vzc19vbmVfd29yaysweDFlNS8weDQy
MApbMTQ3MjYuOTU0MjAzXSAgPyBjYW5jZWxfZGVsYXllZF93b3JrKzB4OTAvMHg5MApbMTQ3
MjYuOTU4NDcwXSAgPyB3b3JrZXJfdGhyZWFkKzB4MmQvMHgzYjAKWzE0NzI2Ljk2MjMwN10g
ID8gY2FuY2VsX2RlbGF5ZWRfd29yaysweDkwLzB4OTAKWzE0NzI2Ljk2NjU3NV0gID8ga3Ro
cmVhZCsweDExOC8weDEzMApbMTQ3MjYuOTY5OTc2XSAgPyBrdGhyZWFkX3VzZV9tbSsweGUw
LzB4ZTAKWzE0NzI2Ljk3MzgwOV0gID8gcmV0X2Zyb21fZm9yaysweDFmLzB4MzAK
--------------55B37117B98BC846E92EE0B2
Content-Type: text/plain; charset=UTF-8;
 name="optiplex-5080-linux-5.9-rc4-gp-glmark2.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="optiplex-5080-linux-5.9-rc4-gp-glmark2.txt"

a2VybmVsOiBjZ3JvdXA6IGZvcmsgcmVqZWN0ZWQgYnkgcGlkcyBjb250cm9sbGVyIGluIC91
c2VyLnNsaWNlL3VzZXItNTI3Mi5zbGljZS9zZXNzaW9uLWMyLnNjb3BlCmtlcm5lbDogZ2Vu
ZXJhbCBwcm90ZWN0aW9uIGZhdWx0LCBwcm9iYWJseSBmb3Igbm9uLWNhbm9uaWNhbCBhZGRy
ZXNzIDB4ZGVhZDAwMDAwMDAwMDEwMDogMDAwMCBbIzFdIFNNUCBOT1BUSQprZXJuZWw6IENQ
VTogMiBQSUQ6IDk3MDIgQ29tbTogZ2xtYXJrMiBLZHVtcDogbG9hZGVkIE5vdCB0YWludGVk
IDUuOS4wLXJjNC5teDY0LjM0MyAjMQprZXJuZWw6IEhhcmR3YXJlIG5hbWU6IERlbGwgSW5j
LiBPcHRpUGxleCA1MDgwLzAzMlc1NSwgQklPUyAxLjEuNyAwOC8xNy8yMDIwCmtlcm5lbDog
UklQOiAwMDEwOmZyZWVfYmxvY2srMHhkYy8weDFmMAprZXJuZWw6IENvZGU6IDAwIDQ4IDAx
IGQwIDQ4IGMxIGU4IDBjIDQ4IGMxIGUwIDA2IDRjIDAxIGU4IDQ4IDhiIDUwIDA4IDQ4IDhk
IDRhIGZmIDgzIGUyIDAxIDQ4IDBmIDQ1IGMxIDQ4IDhiIDQ4IDA4IDQ4IDhiIDUwIDEwIDRj
IDhkIDc4IDA4IDw0OD4gODkgNTEgMDggNDggODkgMGEgNGMgODkgZGEgNDggMmIgNTAgMjgg
NGMgODkgNjAgMDggNDggODkgNjggMTAKa2VybmVsOiBSU1A6IDAwMTg6ZmZmZmM5MDAwY2Yx
N2FmMCBFRkxBR1M6IDAwMDEwMDQ2Cmtlcm5lbDogUkFYOiBmZmZmZWEwMDA5NjU0YzAwIFJC
WDogMDAwMDAwMDA4MDAwMDAwMCBSQ1g6IGRlYWQwMDAwMDAwMDAxMDAKa2VybmVsOiBSRFg6
IGRlYWQwMDAwMDAwMDAxMjIgUlNJOiBmZmZmODg4NDJkMmIzZmMwIFJESTogZmZmZjg4ODQy
YjQ0MDMwMAprZXJuZWw6IFJCUDogZGVhZDAwMDAwMDAwMDEyMiBSMDg6IGZmZmZjOTAwMGNm
MTdiNjggUjA5OiBmZmZmODg4NDJiNDQxMjgwCmtlcm5lbDogUjEwOiAwMDAwMDAwMDAwMDAw
MDAyIFIxMTogZmZmZjg4ODI1OTUzMGQ4MCBSMTI6IGRlYWQwMDAwMDAwMDAxMDAKa2VybmVs
OiBSMTM6IGZmZmZlYTAwMDAwMDAwMDAgUjE0OiBmZmZmODg4NDJkMmIzZmYwIFIxNTogZmZm
ZmVhMDAwOTY1NGMwOAprZXJuZWw6IEZTOiAgMDAwMDAwMDAwMDAwMDAwMCgwMDAwKSBHUzpm
ZmZmODg4NDJkMjgwMDAwKDAwMDApIGtubEdTOjAwMDAwMDAwMDAwMDAwMDAKa2VybmVsOiBD
UzogIDAwMTAgRFM6IDAwMDAgRVM6IDAwMDAgQ1IwOiAwMDAwMDAwMDgwMDUwMDMzCmtlcm5l
bDogQ1IyOiAwMDAwN2ZmMjI4YjhjMDgwIENSMzogMDAwMDAwMDAwNDQwYTAwNCBDUjQ6IDAw
MDAwMDAwMDA3NzA2ZTAKa2VybmVsOiBQS1JVOiA1NTU1NTU1NAprZXJuZWw6IENhbGwgVHJh
Y2U6Cmtlcm5lbDogIF9fX2NhY2hlX2ZyZWUrMHgyZjAvMHg0OTAKa2VybmVsOiAga2ZyZWUr
MHg5MC8weDEyMAprZXJuZWw6ICBrbWVtX2ZyZWVwYWdlcysweGE1LzB4ZjAKa2VybmVsOiAg
c2xhYl9kZXN0cm95KzB4MTkvMHg1MAprZXJuZWw6ICBzbGFic19kZXN0cm95KzB4NTUvMHg4
MAprZXJuZWw6ICBfX19jYWNoZV9mcmVlKzB4MzBiLzB4NDkwCmtlcm5lbDogIGtmcmVlKzB4
OTAvMHgxMjAKa2VybmVsOiAga21lbV9mcmVlcGFnZXMrMHhhNS8weGYwCmtlcm5lbDogIHNs
YWJfZGVzdHJveSsweDE5LzB4NTAKa2VybmVsOiAgc2xhYnNfZGVzdHJveSsweDU1LzB4ODAK
a2VybmVsOiAgX19fY2FjaGVfZnJlZSsweDMwYi8weDQ5MAprZXJuZWw6ICBrbWVtX2NhY2hl
X2ZyZWUucGFydC42NysweDE5LzB4ODAKa2VybmVsOiAgcmVtb3ZlX3ZtYSsweDVhLzB4NjAK
a2VybmVsOiAgZXhpdF9tbWFwKzB4ZDUvMHgxODAKa2VybmVsOiAgbW1wdXQrMHg0MC8weGYw
Cmtlcm5lbDogIGRvX2V4aXQrMHgzMTkvMHhiNzAKa2VybmVsOiAgZG9fZ3JvdXBfZXhpdCsw
eDNhLzB4OTAKa2VybmVsOiAgX194NjRfc3lzX2V4aXRfZ3JvdXArMHgxNC8weDIwCmtlcm5l
bDogIGRvX3N5c2NhbGxfNjQrMHgzMy8weDQwCmtlcm5lbDogIGVudHJ5X1NZU0NBTExfNjRf
YWZ0ZXJfaHdmcmFtZSsweDQ0LzB4YTkKa2VybmVsOiBSSVA6IDAwMzM6MHg3ZmYyMjg2OTRl
MzYKa2VybmVsOiBDb2RlOiBCYWQgUklQIHZhbHVlLgprZXJuZWw6IFJTUDogMDAyYjowMDAw
N2ZmZGEzZWM0OGI4IEVGTEFHUzogMDAwMDAyNDYgT1JJR19SQVg6IDAwMDAwMDAwMDAwMDAw
ZTcKa2VybmVsOiBSQVg6IGZmZmZmZmZmZmZmZmZmZGEgUkJYOiAwMDAwN2ZmMjI4OTdmNzQw
IFJDWDogMDAwMDdmZjIyODY5NGUzNgprZXJuZWw6IFJEWDogMDAwMDAwMDAwMDAwMDAwMCBS
U0k6IDAwMDAwMDAwMDAwMDAwM2MgUkRJOiAwMDAwMDAwMDAwMDAwMDAwCmtlcm5lbDogUkJQ
OiAwMDAwMDAwMDAwMDAwMDAwIFIwODogMDAwMDAwMDAwMDAwMDBlNyBSMDk6IGZmZmZmZmZm
ZmZmZmZmODAKa2VybmVsOiBSMTA6IDAwMDAwMDAwMDAwMDA3OWEgUjExOiAwMDAwMDAwMDAw
MDAwMjQ2IFIxMjogMDAwMDdmZjIyODk3Zjc0MAprZXJuZWw6IFIxMzogMDAwMDAwMDAwMDAw
MDAwMSBSMTQ6IDAwMDA3ZmYyMjg5ODg2MjggUjE1OiAwMDAwMDAwMDAwMDAwMDAwCmtlcm5l
bDogTW9kdWxlcyBsaW5rZWQgaW46IHJwY3NlY19nc3Nfa3JiNSBuZnN2NCBuZnMgODAyMXEg
Z2FycCBzdHAgbXJwIGxsYyBzbmRfaGRhX2NvZGVjX3JlYWx0ZWsgc25kX2hkYV9jb2RlY19n
ZW5lcmljIGxlZHRyaWdfYXVkaW8gYW1kZ3B1IGk5MTUgZ3B1X3NjaGVkIHR0bSBpb3NmX21i
aSBkcm1fa21zX2hlbHBlciBkcm0gaW5wdXRfbGVkcyBzbmRfaGRhX2NvZGVjX2hkbWkgc25k
X2hkYV9pbnRlbCBsZWRfY2xhc3Mgc25kX2ludGVsX2RzcGNmZyBzbmRfaGRhX2NvZGVjIGlu
dGVsX2d0dCBzbmRfaGRhX2NvcmUgZmJfc3lzX2ZvcHMgeDg2X3BrZ190ZW1wX3RoZXJtYWwg
c25kX3BjbSBzbmRfdGltZXIga3ZtX2ludGVsIHN5c2NvcHlhcmVhIHN5c2ZpbGxyZWN0IHdt
aV9ibW9mIGlUQ09fd2R0IHNuZCBkZWZsYXRlIGt2bSBpVENPX3ZlbmRvcl9zdXBwb3J0IHN5
c2ltZ2JsdCBlZmlfcHN0b3JlIGlycWJ5cGFzcyB3bWkgc291bmRjb3JlIGNyYzMyY19pbnRl
bCB2aWRlbyBwc3RvcmUgbmZzZCBhdXRoX3JwY2dzcyBuZnNfYWNsIGxvY2tkIGdyYWNlIHN1
bnJwYyBlZml2YXJmcyBpcF90YWJsZXMgeF90YWJsZXMgdW5peCBpcHY2IGF1dG9mczQKa2Vy
bmVsOiAtLS1bIGVuZCB0cmFjZSA5OWQwY2Q1MmQxYzk4NmYzIF0tLS0Ka2VybmVsOiBSSVA6
IDAwMTA6ZnJlZV9ibG9jaysweGRjLzB4MWYwCmtlcm5lbDogQ29kZTogMDAgNDggMDEgZDAg
NDggYzEgZTggMGMgNDggYzEgZTAgMDYgNGMgMDEgZTggNDggOGIgNTAgMDggNDggOGQgNGEg
ZmYgODMgZTIgMDEgNDggMGYgNDUgYzEgNDggOGIgNDggMDggNDggOGIgNTAgMTAgNGMgOGQg
NzggMDggPDQ4PiA4OSA1MSAwOCA0OCA4OSAwYSA0YyA4OSBkYSA0OCAyYiA1MCAyOCA0YyA4
OSA2MCAwOCA0OCA4OSA2OCAxMAprZXJuZWw6IFJTUDogMDAxODpmZmZmYzkwMDBjZjE3YWYw
IEVGTEFHUzogMDAwMTAwNDYKa2VybmVsOiBSQVg6IGZmZmZlYTAwMDk2NTRjMDAgUkJYOiAw
MDAwMDAwMDgwMDAwMDAwIFJDWDogZGVhZDAwMDAwMDAwMDEwMAprZXJuZWw6IFJEWDogZGVh
ZDAwMDAwMDAwMDEyMiBSU0k6IGZmZmY4ODg0MmQyYjNmYzAgUkRJOiBmZmZmODg4NDJiNDQw
MzAwCmtlcm5lbDogUkJQOiBkZWFkMDAwMDAwMDAwMTIyIFIwODogZmZmZmM5MDAwY2YxN2I2
OCBSMDk6IGZmZmY4ODg0MmI0NDEyODAKa2VybmVsOiBSMTA6IDAwMDAwMDAwMDAwMDAwMDIg
UjExOiBmZmZmODg4MjU5NTMwZDgwIFIxMjogZGVhZDAwMDAwMDAwMDEwMAprZXJuZWw6IFIx
MzogZmZmZmVhMDAwMDAwMDAwMCBSMTQ6IGZmZmY4ODg0MmQyYjNmZjAgUjE1OiBmZmZmZWEw
MDA5NjU0YzA4Cmtlcm5lbDogRlM6ICAwMDAwMDAwMDAwMDAwMDAwKDAwMDApIEdTOmZmZmY4
ODg0MmQyODAwMDAoMDAwMCkga25sR1M6MDAwMDAwMDAwMDAwMDAwMAprZXJuZWw6IENTOiAg
MDAxMCBEUzogMDAwMCBFUzogMDAwMCBDUjA6IDAwMDAwMDAwODAwNTAwMzMKa2VybmVsOiBD
UjI6IDAwMDA3ZmYyMjhiOGMwODAgQ1IzOiAwMDAwMDAwMzQ4MzUyMDA1IENSNDogMDAwMDAw
MDAwMDc3MDZlMAprZXJuZWw6IFBLUlU6IDU1NTU1NTU0Cmtlcm5lbDogRml4aW5nIHJlY3Vy
c2l2ZSBmYXVsdCBidXQgcmVib290IGlzIG5lZWRlZCEK
--------------55B37117B98BC846E92EE0B2
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--------------55B37117B98BC846E92EE0B2--
