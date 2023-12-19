Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C81818B6F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Dec 2023 16:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D648510E16A;
	Tue, 19 Dec 2023 15:42:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www61.your-server.de (www61.your-server.de [213.133.104.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396B210E16A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Dec 2023 15:42:15 +0000 (UTC)
Received: from sslproxy01.your-server.de ([78.46.139.224])
 by www61.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.94.2) (envelope-from <stefan.hoffmeister@econos.de>)
 id 1rFcEW-0006md-Sf; Tue, 19 Dec 2023 16:42:12 +0100
Received: from [192.168.0.30] (helo=webmail.your-server.de)
 by sslproxy01.your-server.de with esmtpsa
 (TLSv1.2:ECDHE-RSA-CHACHA20-POLY1305:256) (Exim 4.92)
 (envelope-from <stefan.hoffmeister@econos.de>)
 id 1rFcEW-000GwU-I1; Tue, 19 Dec 2023 16:42:12 +0100
Received: from [2a02:1210:249e:f00:24d4:59da:a98b:e722]
 ([2a02:1210:249e:f00:24d4:59da:a98b:e722]) by webmail.your-server.de (Horde
 Framework) with HTTPS; Tue, 19 Dec 2023 16:42:12 +0100
Date: Tue, 19 Dec 2023 16:42:12 +0100
Message-ID: <20231219164212.Horde.zexl-kniXSfQ5tdu8TCITYL@webmail.your-server.de>
From: Stefan Hoffmeister <stefan.hoffmeister@econos.de>
To: dri-devel@lists.freedesktop.org, Zack Rusin <zackr@vmware.com>, ";
 VMware Graphics Reviewers" <linux-graphics-maintainer@vmware.com>
Subject: Re: BUG [vmwgfx] kernel oops atomic cursors /
 vmw_du_cursor_plane_cleanup_fb / KDE Plasma 6
In-Reply-To: <20231214122709.Horde.5IIbIXWYbtITSEoTi0k2e1H@webmail.your-server.de>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
X-Authenticated-Sender: stefan.hoffmeister@econos.de
X-Virus-Scanned: Clear (ClamAV 0.103.10/27128/Tue Dec 19 10:36:48 2023)
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


Resending with all MAINTAINTERS cc'ed because no ACK.

Quoting Stefan Hoffmeister <stefan.hoffmeister@econos.de>:

> Previously reported at  
> https://gitlab.freedesktop.org/drm/misc/-/issues/34 and  
> https://bugs.kde.org/show_bug.cgi?id=478308
>
> vmwgfx runs into kernel oops related to atomic cursors with KDE  
> Plasma 6. I am able to reproduce this with
>
> * VMware Workstation 17.5 (on Windows 11 Professional) at CPL0
> * install Fedora Rawhide (40) + KDE Plasma 6 beta 1 as offered by  
> Fedora (kernel 6.7.0-rc5 at the time of this writing)
> * echo "KWIN_DRM_NO_AMS=0" >> /etc/environment to explicitly enable  
> use of atomic mode-setting from within KDE
> * reboot
> * log into a Wayland session
> * use system (e.g. start Visual Studio Code, which is X11)
>
> ---> oops
>
> Note that I am explicitly atomic mode-setting now, because in a few  
> weeks time DRM cursor plane hotspot improvements are supposed to be  
> released into kernel 6.8 - and then KDE Plasma 6 will automatically  
> switch to the atomic mode-setting code path.
>
> Regardless of KDE does, the kernel should not oops.
>
> Oops is
> ************
> BUG: kernel NULL pointer dereference, address: 0000000000000028
> #PF: supervisor read access in kernel mode
> #PF: error_code(0x0000) - not-present page
> PGD 0 P4D 0
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> Hardware name: VMware, Inc. VMware20,1/440BX Desktop Reference  
> Platform, BIOS VMW201.00V.21805430.B64.2305221830 05/22/2023
> Workqueue: events_unbound commit_work
> RIP: 0010:vmw_du_cursor_plane_cleanup_fb  
> (/usr/src/debug/kernel-6.7-rc4-111-g5e3f5b81de80/linux-6.7.0-0.rc4.20231208git5e3f5b81de80.38.fc40.x86_64/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:649)  
> vmwgfx
> Code: 00 00 00 00 00 00 48 8b 44 24 08 65 48 2b 04 25 28 00 00 00 75  
> 29 48 83 c4 10 5b 5d 41 5c c3 cc cc cc cc 48 8b 86 98 00 00 00 <48>  
> 8b 78 28 e8 0a f1 00 00 c6 83 c0 00 00 00 00 e9 d2 fe ff ff e8
> All code
> ========
>    0:   00 00                   add    %al,(%rax)
>    2:   00 00                   add    %al,(%rax)
>    4:   00 00                   add    %al,(%rax)
>    6:   48 8b 44 24 08          mov    0x8(%rsp),%rax
>    b:   65 48 2b 04 25 28 00    sub    %gs:0x28,%rax
>   12:   00 00
>   14:   75 29                   jne    0x3f
>   16:   48 83 c4 10             add    $0x10,%rsp
>   1a:   5b                      pop    %rbx
>   1b:   5d                      pop    %rbp
>   1c:   41 5c                   pop    %r12
>   1e:   c3                      ret
>   1f:   cc                      int3
>   20:   cc                      int3
>   21:   cc                      int3
>   22:   cc                      int3
>   23:   48 8b 86 98 00 00 00    mov    0x98(%rsi),%rax
>   2a:*  48 8b 78 28             mov    0x28(%rax),%rdi          <--  
> trapping instruction
>   2e:   e8 0a f1 00 00          call   0xf13d
>   33:   c6 83 c0 00 00 00 00    movb   $0x0,0xc0(%rbx)
>   3a:   e9 d2 fe ff ff          jmp    0xffffffffffffff11
>   3f:   e8                      .byte 0xe8
>
> Code starting with the faulting instruction
> ===========================================
>    0:   48 8b 78 28             mov    0x28(%rax),%rdi
>    4:   e8 0a f1 00 00          call   0xf113
>    9:   c6 83 c0 00 00 00 00    movb   $0x0,0xc0(%rbx)
>   10:   e9 d2 fe ff ff          jmp    0xfffffffffffffee7
>   15:   e8                      .byte 0xe8
> RSP: 0018:ffffc9000008be00 EFLAGS: 00010202
> RAX: 0000000000000000 RBX: ffff88818e889300 RCX: 0000000000000000
> RDX: ffff888109c10000 RSI: ffff88818e889300 RDI: ffff888111974c38
> RBP: ffff888111974c38 R08: ffff88812a668ae0 R09: 0000000000000040
> R10: 000000000000000f R11: fefefefefefefeff R12: 0000000000000000
> R13: 0000000000000000 R14: ffff8881001cc405 R15: ffff888106e1f4e0
> FS:  0000000000000000(0000) GS:ffff88842dfc0000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 0000000000000028 CR3: 00000001484c0005 CR4: 0000000000f70ef0
> PKRU: 55555554
> Call Trace:
> <TASK>
> ? __die+0x23/0x70
> ? page_fault_oops+0x171/0x4e0
> ? wb_over_bg_thresh+0x283/0x2a0
> ? exc_page_fault+0x7f/0x180
> ? asm_exc_page_fault+0x26/0x30
> ? vmw_du_cursor_plane_cleanup_fb  
> (/usr/src/debug/kernel-6.7-rc4-111-g5e3f5b81de80/linux-6.7.0-0.rc4.20231208git5e3f5b81de80.38.fc40.x86_64/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c:649)  
> vmwgfx
> drm_atomic_helper_cleanup_planes+0x9b/0xc0
> commit_tail+0xd1/0x130
> process_one_work+0x171/0x340
> worker_thread+0x27b/0x3a0
> ? __pfx_worker_thread+0x10/0x10
> kthread+0xe5/0x120
> ? __pfx_kthread+0x10/0x10
> ret_from_fork+0x31/0x50
> ? __pfx_kthread+0x10/0x10
> ret_from_fork_asm+0x1b/0x30
> </TASK>
> Modules linked in: uinput snd_seq_dummy snd_hrtimer  
> nf_conntrack_netbios_ns nf_conntrack_broadcast nft_fib_inet  
> nft_fib_ipv4 nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4  
> nf_reject_ipv6 nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack  
> nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink qrtr  
> snd_seq_midi snd_seq_midi_event sunrpc vsock_loopback  
> vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock  
> snd_ens1371 intel_rapl_msr snd_ac97_codec intel_rapl_common  
> snd_rawmidi vmw_balloon rapl gameport ac97_bus snd_seq  
> snd_seq_device snd_pcm vfat pcspkr snd_timer fat snd soundcore  
> pktcdvd vmw_vmci i2c_piix4 joydev loop zram crct10dif_pclmul  
> crc32_pclmul crc32c_intel polyval_clmulni polyval_generic  
> ghash_clmulni_intel nvme vmwgfx sha512_ssse3 sha256_ssse3 sha1_ssse3  
> nvme_core drm_ttm_helper ttm vmxnet3 serio_raw ata_generic pata_acpi  
> fuse
> CR2: 0000000000000028
>
> *****************
>
> This maps to
> ***********
> void
> vmw_du_cursor_plane_cleanup_fb(struct drm_plane *plane,
> 			       struct drm_plane_state *old_state)
> {
> 	struct vmw_cursor_plane *vcp = vmw_plane_to_vcp(plane);
> 	struct vmw_plane_state *vps = vmw_plane_state_to_vps(old_state);
> 	bool is_iomem;
>
> 	if (vps->surf_mapped) {
> 		vmw_bo_unmap(vps->surf->res.guest_memory_bo);     
> <------------------ affected line
> 		vps->surf_mapped = false;
> 	}
>
> **************
>
> Note that close to that oops there was also
>
>
> **************
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE)
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) glamor0: GL  
> error: GL_OUT_OF_MEMORY in glTexSubImage
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE)
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) Backtrace:
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 0:  
> /usr/bin/Xwayland (0x55befed80000+0x17a432) [0x55befeefa432]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 1:  
> /usr/lib64/dri/vmwgfx_dri.so (0x7f1d1a400000+0x36e0ef)  
> [0x7f1d1a76e0ef]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 2:  
> /usr/lib64/dri/vmwgfx_dri.so (0x7f1d1a400000+0x1aff13)  
> [0x7f1d1a5aff13]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 3:  
> /usr/lib64/dri/vmwgfx_dri.so (0x7f1d1a400000+0x1c2bf8)  
> [0x7f1d1a5c2bf8]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 4:  
> /usr/lib64/dri/vmwgfx_dri.so (0x7f1d1a400000+0x1953ba)  
> [0x7f1d1a5953ba]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 5:  
> /usr/lib64/dri/vmwgfx_dri.so (0x7f1d1a400000+0x198903)  
> [0x7f1d1a598903]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 6:  
> /usr/lib64/dri/vmwgfx_dri.so (0x7f1d1a400000+0x19f1b9)  
> [0x7f1d1a59f1b9]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 7:  
> /usr/bin/Xwayland (0x55befed80000+0x729f7) [0x55befedf29f7]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 8:  
> /usr/bin/Xwayland (0x55befed80000+0x6117a) [0x55befede117a]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 9:  
> /usr/bin/Xwayland (0x55befed80000+0x61911) [0x55befede1911]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 10:  
> /usr/bin/Xwayland (0x55befed80000+0x1b9ff5) [0x55befef39ff5]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 11:  
> /usr/bin/Xwayland (0x55befed80000+0x1ba748) [0x55befef3a748]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 12:  
> /usr/bin/Xwayland (0x55befed80000+0x5cb37) [0x55befeddcb37]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 13:  
> /usr/bin/Xwayland (0x55befed80000+0xff76b) [0x55befee7f76b]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 14:  
> /usr/bin/Xwayland (0x55befed80000+0x11b17a) [0x55befee9b17a]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 15:  
> /usr/bin/Xwayland (0x55befed80000+0xb5887) [0x55befee35887]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 16:  
> /usr/bin/Xwayland (0x55befed80000+0x3b840) [0x55befedbb840]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 17:  
> /lib64/libc.so.6 (0x7f1d2741d000+0x2814a) [0x7f1d2744514a]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 18:  
> /lib64/libc.so.6 (__libc_start_main+0x8b) [0x7f1d2744520b]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE) 19:  
> /usr/bin/Xwayland (0x55befed80000+0x3d255) [0x55befedbd255]
> Dec 12 12:34:58 fedora kwin_wayland_wrapper[1716]: (EE)
> *************
> 0x17a432 is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../os/backtrace.c:200:19
> 0x36e0ef is  
> /usr/src/debug/mesa-23.3.0-1.fc40.x86_64/redhat-linux-build/../src/mesa/main/errors.c:326:10
> 0x1aff13 is  
> /usr/src/debug/mesa-23.3.0-1.fc40.x86_64/redhat-linux-build/../src/mesa/main/texstore.c:1105:4
> 0x1c2bf8 is  
> /usr/src/debug/mesa-23.3.0-1.fc40.x86_64/redhat-linux-build/../src/mesa/state_tracker/st_cb_texture.c:2342:4
> 0x1953ba is  
> /usr/src/debug/mesa-23.3.0-1.fc40.x86_64/redhat-linux-build/../src/mesa/main/teximage.c:2893:7
> 0x198903 is  
> /usr/src/debug/mesa-23.3.0-1.fc40.x86_64/redhat-linux-build/../src/mesa/main/teximage.c:3829:4
> 0x19f1b9 is  
> /usr/src/debug/mesa-23.3.0-1.fc40.x86_64/redhat-linux-build/../src/mesa/main/teximage.c:4055:1
> 0x729f7 is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../glamor/glamor_transfer.c:97:17
> 0x6117a is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../glamor/glamor_copy.c:269:9
> 0x61911 is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../glamor/glamor_copy.c:741:8
> 0x1b9ff5 is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../mi/micopy.c:126:5
> 0x1ba748 is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../mi/micopy.c:294:9
> 0x5cb37 is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../glamor/glamor_copy.c:753:1
> 0xff76b is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../miext/damage/damage.c:777:5
> 0x11b17a is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../dix/pixmap.c:76:19
> 0xb5887 is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../dix/dispatch.c:550:20
> 0x3b840 is  
> /usr/src/debug/xorg-x11-server-Xwayland-23.2.2-2.fc40.x86_64/redhat-linux-build/../dix/devices.c:1124:14
> 0x2814a is  
> /usr/src/debug/glibc-2.38.9000-26.fc40.x86_64/csu/../sysdeps/nptl/libc_start_call_main.h:74:3
> 0x3d255 is ??:0
> **********
>
> All this is getting spammed very regularly on KDE Wayland when  
> interacting with an Xwayland window (above, that is Visual Studio  
> Code, which is running as an X11 application).



