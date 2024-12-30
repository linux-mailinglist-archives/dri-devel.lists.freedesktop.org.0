Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EF79FEA41
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 20:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4E610E392;
	Mon, 30 Dec 2024 19:13:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A292F10E392;
 Mon, 30 Dec 2024 19:13:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 069BCA40F21;
 Mon, 30 Dec 2024 19:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 248D5C4CED0;
 Mon, 30 Dec 2024 19:13:31 +0000 (UTC)
Date: Mon, 30 Dec 2024 14:13:29 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Genes Lists <lists@sapience.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, stable@vger.kernel.org,
 regressions@lists.linux.dev, Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION][BISECTED] Re: 6.12.7 stable new error: event
 xe_bo_move has unsafe dereference of argument 4
Message-ID: <20241230141329.5f698715@batman.local.home>
In-Reply-To: <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
References: <2e9332ab19c44918dbaacecd8c039fb0bbe6e1db.camel@sapience.com>
 <9dee19b6185d325d0e6fa5f7cbba81d007d99166.camel@sapience.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 30 Dec 2024 13:55:00 -0500
Genes Lists <lists@sapience.com> wrote:

> On Fri, 2024-12-27 at 11:15 -0500, Genes Lists wrote:
> > I have not had a chance to bisect this yet but since its in stable
> > thought it best to share sooner than later.
> >=20
> > If noone spots anything, I will do a bisect soon as I can. Boot
> > completes and aside from this error things seem fine.
> >=20
> > =C2=A0- Does not happen with 6.12.6.
> > =C2=A0- Does happen with Mainline + patch for different drm bug
> > =C2=A0=C2=A0=C2=A0 mainline commit : d6ef8b40d075c425f548002d2f35ae3f06=
e9cf96
> > =C2=A0=C2=A0=C2=A0 Patch: https://patchwork.freedesktop.org/series/1419=
11/
> > =C2=A0=C2=A0=C2=A0 Patch fixes drm bug reported here (patch not yet in =
mainline):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=20
> > https://lore.kernel.org/lkml/3b097dddd7095bccabe6791b90899c689f271a35
> > .camel@sapience.com/
> >=20
> > Graphics h/w:
> > =C2=A0 00:02.0 VGA compatible controller: Intel Corporation Raptor Lake=
-P
> > [Iris Xe Graphics] (rev 04)
> >=20
> > Trace below and full dmesg attached.
> >=20
> > gene
> >=20
> > [=C2=A0 +0.143567] ------------[ cut here ]------------
> > [=C2=A0 +0.000003] WARNING: CPU: 6 PID: 344 at
> > kernel/trace/trace_events.c:577 trace_event_raw_init+0x159/0x660
> > [=C2=A0 +0.000005] Modules linked in: xe(+) drm_ttm_helper gpu_sched
> > drm_suballoc_helper drm_gpuvm drm_exec typec_displayport usbhid
> > hid_sensor_custom hid_sensor_hub intel_ishtp_hid nvme
> > spi_pxa2xx_platform hid_multitouch dw_dmac nvme_core 8250_dw
> > spi_pxa2xx_core i915 crct10dif_pclmul crc32_pclmul i2c_algo_bit
> > crc32c_intel psmouse polyval_clmulni serio_raw polyval_generic
> > drm_buddy atkbd ghash_clmulni_intel libps2 vivaldi_fmap ttm
> > sha512_ssse3 sha256_ssse3 intel_gtt sha1_ssse3 aesni_intel gf128mul
> > drm_display_helper ucsi_acpi crypto_simd typec_ucsi intel_lpss_pci
> > intel_ish_ipc cryptd intel_lpss roles intel_ishtp idma64 cec vmd
> > typec
> > i2c_hid_acpi i8042 video i2c_hid serio wmi pkcs8_key_parser wireguard
> > curve25519_x86_64 libchacha20poly1305 chacha_x86_64 poly1305_x86_64
> > ip6_udp_tunnel udp_tunnel libcurve25519_generic libchacha loop sg
> > crypto_user
> > [=C2=A0 +0.000022] CPU: 6 UID: 0 PID: 344 Comm: (udev-worker) Not taint=
ed
> > 6.12.7-stable-1 #16 8ef5eca39d52f9e2c5a50ace761c4a6858369a18
> > [=C2=A0 +0.000003] Hardware name: Dell Inc. XPS 9320/0CR6NC, BIOS 2.16.1
> > 09/11/2024
> > [=C2=A0 +0.000001] RIP: 0010:trace_event_raw_init+0x159/0x660
> > [=C2=A0 +0.000002] Code: 89 ea 0f 83 3b 04 00 00 e8 84 db ff ff 84 c0 74
> > 10
> > 8b 0c 24 48 c7 c0 fe ff ff ff 48 d3 c0 49 21 c6 4d 85 f6 0f 84 d6 fe
> > ff
> > ff <0f> 0b bb 01 00 00 00 41 f6 c6 01 0f 85 f3 78 bf 00 66 0f 1f 44
> > 00
> > [=C2=A0 +0.000001] RSP: 0018:ffffa3c8007bb980 EFLAGS: 00010206
> > [=C2=A0 +0.000001] RAX: ffffffffffffffdf RBX: ffffffffc0ef8731 RCX:
> > 0000000000000005
> > [=C2=A0 +0.000001] RDX: 0000000000000002 RSI: 0000000000000001 RDI:
> > ffffffffc0ef8727
> > [=C2=A0 +0.000001] RBP: ffffffffc0ef8640 R08: 0000000000000039 R09:
> > 0000000000000000
> > [=C2=A0 +0.000000] R10: 0000000000000076 R11: 000000000000004e R12:
> > 00000000000000f2
> > [=C2=A0 +0.000001] R13: ffffffffc0ef9760 R14: 0000000000000018 R15:
> > 0000000000000000
> > [=C2=A0 +0.000001] FS:=C2=A0 000075f6c10d0880(0000) GS:ffff96b92f500000=
(0000)
> > knlGS:0000000000000000
> > [=C2=A0 +0.000001] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000800500=
33
> > [=C2=A0 +0.000000] CR2: 00007be641f52f70 CR3: 000000010cffe000 CR4:
> > 0000000000f50ef0
> > [=C2=A0 +0.000001] PKRU: 55555554
> > [=C2=A0 +0.000001] Call Trace:
> > [=C2=A0 +0.000001]=C2=A0 <TASK>
> > [=C2=A0 +0.000000]=C2=A0 ? trace_event_raw_init+0x159/0x660
> > [=C2=A0 +0.000002]=C2=A0 ? __warn.cold+0x93/0xf6
> > [=C2=A0 +0.000001]=C2=A0 ? trace_event_raw_init+0x159/0x660
> > [=C2=A0 +0.000003]=C2=A0 ? report_bug+0xff/0x140
> > [=C2=A0 +0.000002]=C2=A0 ? handle_bug+0x58/0x90
> > [=C2=A0 +0.000001]=C2=A0 ? exc_invalid_op+0x17/0x70
> > [=C2=A0 +0.000002]=C2=A0 ? asm_exc_invalid_op+0x1a/0x20
> > [=C2=A0 +0.000003]=C2=A0 ? trace_event_raw_init+0x159/0x660
> > [=C2=A0 +0.000002]=C2=A0 event_init+0x28/0x70
> > [=C2=A0 +0.000002]=C2=A0 trace_module_notify+0x19a/0x250
> > [=C2=A0 +0.000001]=C2=A0 notifier_call_chain+0x5a/0xd0
> > [=C2=A0 +0.000002]=C2=A0 blocking_notifier_call_chain_robust+0x65/0xc0
> > [=C2=A0 +0.000002]=C2=A0 load_module+0x1818/0x1ce0
> > [=C2=A0 +0.000004]=C2=A0 ? init_module_from_file+0x89/0xe0
> > [=C2=A0 +0.000001]=C2=A0 init_module_from_file+0x89/0xe0
> > [=C2=A0 +0.000002]=C2=A0 idempotent_init_module+0x11e/0x310
> > [=C2=A0 +0.000002]=C2=A0 __x64_sys_finit_module+0x5e/0xb0
> > [=C2=A0 +0.000002]=C2=A0 do_syscall_64+0x82/0x160
> > [=C2=A0 +0.000002]=C2=A0 ? syscall_exit_to_user_mode+0x10/0x200
> > [=C2=A0 +0.000001]=C2=A0 ? do_syscall_64+0x8e/0x160
> > [=C2=A0 +0.000001]=C2=A0 ? syscall_exit_to_user_mode+0x10/0x200
> > [=C2=A0 +0.000001]=C2=A0 ? do_syscall_64+0x8e/0x160
> > [=C2=A0 +0.000001]=C2=A0 ? do_sys_openat2+0x9c/0xe0
> > [=C2=A0 +0.000002]=C2=A0 ? syscall_exit_to_user_mode+0x10/0x200
> > [=C2=A0 +0.000001]=C2=A0 ? do_syscall_64+0x8e/0x160
> > [=C2=A0 +0.000001]=C2=A0 ? do_sys_openat2+0x9c/0xe0
> > [=C2=A0 +0.000002]=C2=A0 ? syscall_exit_to_user_mode+0x10/0x200
> > [=C2=A0 +0.000001]=C2=A0 ? do_syscall_64+0x8e/0x160
> > [=C2=A0 +0.000001]=C2=A0 ? exc_page_fault+0x7e/0x180
> > [=C2=A0 +0.000001]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > [=C2=A0 +0.000002] RIP: 0033:0x75f6c18c71fd
> > [=C2=A0 +0.000011] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e
> > fa
> > 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08
> > 0f
> > 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d e3 fa 0c 00 f7 d8 64 89 01
> > 48
> > [=C2=A0 +0.000001] RSP: 002b:00007ffdec463948 EFLAGS: 00000246 ORIG_RAX:
> > 0000000000000139
> > [=C2=A0 +0.000001] RAX: ffffffffffffffda RBX: 000057194ec1c5c0 RCX:
> > 000075f6c18c71fd
> > [=C2=A0 +0.000001] RDX: 0000000000000004 RSI: 000075f6c10ca05d RDI:
> > 000000000000002b
> > [=C2=A0 +0.000000] RBP: 00007ffdec463a00 R08: 0000000000000001 R09:
> > 00007ffdec463990
> > [=C2=A0 +0.000001] R10: 0000000000000040 R11: 0000000000000246 R12:
> > 000075f6c10ca05d
> > [=C2=A0 +0.000000] R13: 0000000000020000 R14: 000057194ec1dc40 R15:
> > 000057194ec1e900
> > [=C2=A0 +0.000001]=C2=A0 </TASK>
> > [=C2=A0 +0.000001] ---[ end trace 0000000000000000 ]---
> > [=C2=A0 +0.000000] event xe_bo_move has unsafe dereference of argument 4
> > [=C2=A0 +0.000001] print_fmt: "move_lacks_source:%s, migrate object %p
> > [size
> > %zu] from %s to %s device_id:%s", REC->move_lacks_source ? "yes" :
> > "no", REC->bo, REC->size, xe_mem_type_to_name[REC->old_placement],
> > xe_mem_type_to_name[REC->new_placement], __get_str(device_id)
> >  =20

Yep. That's a false positive :-(

We stopped doing runtime checks of '%s' as it required using va_list
"hacks", so the checks have been moved to the boot up code. The above has:

TRACE_EVENT(xe_bo_move,
            TP_PROTO(struct xe_bo *bo, uint32_t new_placement, uint32_t old=
_placement,
                     bool move_lacks_source),
            TP_ARGS(bo, new_placement, old_placement, move_lacks_source),
            TP_STRUCT__entry(
                     __field(struct xe_bo *, bo)
                     __field(size_t, size)
                     __field(u32, new_placement)
                     __field(u32, old_placement)
                     __string(device_id, __dev_name_bo(bo))
                     __field(bool, move_lacks_source)
                        ),

            TP_fast_assign(
                   __entry->bo      =3D bo;
                   __entry->size =3D bo->size;
                   __entry->new_placement =3D new_placement;
                   __entry->old_placement =3D old_placement;
                   __assign_str(device_id);
                   __entry->move_lacks_source =3D move_lacks_source;
                   ),
            TP_printk("move_lacks_source:%s, migrate object %p [size %zu] f=
rom %s to %s device_id:%s",
                      __entry->move_lacks_source ? "yes" : "no", __entry->b=
o, __entry->size,
                      xe_mem_type_to_name[__entry->old_placement],
                      xe_mem_type_to_name[__entry->new_placement], __get_st=
r(device_id))

Where the xe_mem_type_to_name is an array of strings, that I assume
will always be there for the file of the module.

I guess the "fix" would be to have the check code ignore pointer to
arrays, assuming they are "ok".

The check is mostly to catch the naive use of:

   TP_fast_assign(
	__entry->str =3D passed_in_string;
   )

   TP_printk("str=3D%s", __entry->str)

Which was 99% of the bugs that this would catch. I would think if we have:

   TP_fast_assign(
	__entry->idx =3D passed_in_idx;
   )

   TP_printk("str=3D%s", some_array[__entry->idx])

Would 99% be OK. For the 1% it's not, oh well, that would be a false
negative. Still better than not having this check.

-- Steve


>=20
>  1) rc5 has the same issue.
>=20
>  2) Result of git bisect starting with 6.12.6 is :
>=20
> gene
>=20
>=20
> git bisect good
> 683eccacc02d2eb25d1c34b8fb0363fcc7e08f64 is the first bad commit
> commit 683eccacc02d2eb25d1c34b8fb0363fcc7e08f64
> Author: Steven Rostedt <rostedt@goodmis.org>
> Date:   Mon Dec 16 21:41:21 2024 -0500
>=20
>     tracing: Add "%s" check in test_event_printk()
>    =20
>     commit 65a25d9f7ac02e0cf361356e834d1c71d36acca9 upstream.
>    =20
>     The test_event_printk() code makes sure that when a trace event is
>     registered, any dereferenced pointers in from the event's
> TP_printk() are
>     pointing to content in the ring buffer. But currently it does not
> handle
>     "%s", as there's cases where the string pointer saved in the ring
> buffer
>     points to a static string in the kernel that will never be freed.
> As that
>     is a valid case, the pointer needs to be checked at runtime.
>    =20
>     Currently the runtime check is done via trace_check_vprintf(), but
> to not
>     have to replicate everything in vsnprintf() it does some logic with
> the
>     va_list that may not be reliable across architectures. In order to
> get rid
>     of that logic, more work in the test_event_printk() needs to be
> done. Some
>     of the strings can be validated at this time when it is obvious the
> string
>     is valid because the string will be saved in the ring buffer
> content.
>    =20
>     Do all the validation of strings in the ring buffer at boot in
>     test_event_printk(), and make sure that the field of the strings
> that
>     point into the kernel are accessible. This will allow adding checks
> at
>     runtime that will validate the fields themselves and not rely on
> paring
>     the TP_printk() format at runtime.
>    =20
>     Cc: stable@vger.kernel.org
>     Cc: Masami Hiramatsu <mhiramat@kernel.org>
>     Cc: Mark Rutland <mark.rutland@arm.com>
>     Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
>     Cc: Andrew Morton <akpm@linux-foundation.org>
>     Cc: Al Viro <viro@ZenIV.linux.org.uk>
>     Cc: Linus Torvalds <torvalds@linux-foundation.org>
>     Link: https://lore.kernel.org/20241217024720.685917008@goodmis.org
>     Fixes: 5013f454a352c ("tracing: Add check of trace event print fmts
> for dereferencing pointers")
>     Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>=20
>  kernel/trace/trace_events.c | 104
> +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----
> --------
>  1 file changed, 89 insertions(+), 15 deletions(-)
>=20
> 3) The git bisect log is:
>=20
>    git bisect start
>    # status: waiting for both good and bad commits
>    # good: [e9d65b48ce1aba50e9ec7eab6d9f73d1ba88420e] Linux 6.12.6
>    git bisect good e9d65b48ce1aba50e9ec7eab6d9f73d1ba88420e
>    # bad: [319addc2ad901dac4d6cc931d77ef35073e0942f] Linux 6.12.7
>    git bisect bad 319addc2ad901dac4d6cc931d77ef35073e0942f
>    # good: [ced29f2149c9b65ca01008ba64d9db993ad8fad1] USB: serial:
>    option: add Telit FE910C04 rmnet compositions
>    git bisect good ced29f2149c9b65ca01008ba64d9db993ad8fad1
>    # good: [b2f23a1c7181f8c562ea06d3ea14879334d6bdf4] drm/amdgpu/gfx12:
>    fix IP version check
>    git bisect good b2f23a1c7181f8c562ea06d3ea14879334d6bdf4
>    # bad: [2976661ed4de10bd1945e7cca0d7363b44f240dd] of/irq: Fix
>    interrupt-map cell length check in of_irq_parse_imap_parent()
>    git bisect bad 2976661ed4de10bd1945e7cca0d7363b44f240dd
>    # good: [3985cd30472a6a67bfe3f0b42ad23b59fa824033] tracing: Fix
>    test_event_printk() to process entire print argument
>    git bisect good 3985cd30472a6a67bfe3f0b42ad23b59fa824033
>    # bad: [416226eb3f3a3008456903fc3695b0efa8ceafa1] selftests/bpf: Use
>    asm constraint "m" for LoongArch
>    git bisect bad 416226eb3f3a3008456903fc3695b0efa8ceafa1
>    # bad: [683eccacc02d2eb25d1c34b8fb0363fcc7e08f64] tracing: Add "%s"
>    check in test_event_printk()
>    git bisect bad 683eccacc02d2eb25d1c34b8fb0363fcc7e08f64
>    # good: [71a613ceac1ad6235e164aea34abcddb258296af] tracing: Add
>    missing helper functions in event pointer dereference check
>    git bisect good 71a613ceac1ad6235e164aea34abcddb258296af
>    # first bad commit: [683eccacc02d2eb25d1c34b8fb0363fcc7e08f64]
>    tracing: Add "%s" check in test_event_printk()
>   =20
>=20

