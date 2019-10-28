Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36464E70DB
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 12:57:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57C796E0AB;
	Mon, 28 Oct 2019 11:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C9E1C6E624
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Oct 2019 11:57:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C73C0720E2; Mon, 28 Oct 2019 11:57:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111659] Kernel panic when waking up after screens go to dpms
 sleep
Date: Mon, 28 Oct 2019 11:57:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: brad@fnarfbargle.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111659-502-oxrSa7TVIP@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111659-502@http.bugs.freedesktop.org/>
References: <bug-111659-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============1877047959=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1877047959==
Content-Type: multipart/alternative; boundary="15722638611.Cea646C.20371"
Content-Transfer-Encoding: 7bit


--15722638611.Cea646C.20371
Date: Mon, 28 Oct 2019 11:57:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111659

--- Comment #6 from Brad Campbell <brad@fnarfbargle.com> ---
I thought given these generally result in a stack canary I'd try something
different. Upgraded to latest linus-git and disabled the stack protector.

It did take a bit longer to hit, but we got there.

[ 8044.605803] do_IRQ: 2.205 No irq handler for vector
[ 8044.605814] do_IRQ: 2.233 No irq handler for vector
[ 8044.605821] invalid opcode: 0000 [#1] SMP
[ 8044.605824] CPU: 2 PID: 1476 Comm: kworker/2:2 Not tainted 5.4.0-rc4-bkc=
1+
#3
[ 8044.605826] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BIOS
82.0.0.0.0 09/25/2018
[ 8044.605847] Workqueue: events radeon_dp_work_func [radeon]
[ 8044.605866] RIP: 0010:atom_op_move+0x124/0x1d0 [radeon]
[ 8044.605869] Code: 20 c0 e8 03 83 e0 07 74 2e 8d 4a 03 83 c2 02 3c 04 0f =
42
d1 41 89 14 24 eb 07 83 c2 02 41 89 14 24 c7 44 24 08 cd cd cd cd e9 <42> f=
f ff
ff 83 c2 03 41 89 14 24 eb ea 83 c2 05 41 89 14 24 eb e1
[ 8044.605871] RSP: 0018:ffffc9000034fe50 EFLAGS: 00010292
[ 8044.605880] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[ 8044.605881] RDX: 0000000000000000 RSI: 0000000000000004 RDI:
ffffc9000034fe3a
[ 8044.605883] RBP: ffff8882633d0000 R08: ffffffffa0201837 R09:
0000000000000006
[ 8044.605884] R10: 0000000000000006 R11: 000000000001a800 R12:
ffff8882658eb1a0
[ 8044.605886] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[ 8044.605887] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[ 8044.605889] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 8044.605890] CR2: 000031fd52e7a000 CR3: 00000001d1197002 CR4:
00000000000606a0
[ 8044.605892] Call Trace:
[ 8044.605907]  ? radeon_dp_work_func+0x28/0x40 [radeon]
[ 8044.605911]  ? process_one_work+0x1b4/0x330
[ 8044.605913]  ? worker_thread+0x44/0x3d0
[ 8044.605923]  ? set_worker_desc+0x90/0x90
[ 8044.605925]  ? kthread+0xec/0x120
[ 8044.605927]  ? kthread_create_worker_on_cpu+0x40/0x40
[ 8044.605930]  ? ret_from_fork+0x1f/0x30
[ 8044.605932] Modules linked in: cpufreq_userspace cpufreq_powersave
cpufreq_conservative nfsv4 nfsd auth_rpcgss nfs_acl nfs lockd grace fscache
sunrpc af_packet dm_crypt dm_mod dax coretemp applesmc input_polldev kvm_in=
tel
led_class kvm irqbypass btusb btbcm uvcvideo btintel bluetooth
videobuf2_vmalloc snd_usb_aud
io videobuf2_memops rfkill videobuf2_v4l2 videodev snd_usbmidi_lib ecdh_gen=
eric
videobuf2_common ecc joydev snd_hda_codec_cirrus snd_rawmidi snd_hda_codec_=
hdmi
snd_hda_codec_generic evdev snd_hda_intel snd_intel_nhlt snd_hda_codec
snd_hwdep snd_hda_core snd_pcm snd_timer snd soundcore button apple_bl ext4
crc32c_gen
eric crc16 mbcache jbd2 netconsole configfs hid_apple hid_appleir usb_stora=
ge
hid_generic usbhid hid sg sr_mod cdrom sd_mod aesni_intel glue_helper
crypto_simd cryptd ahci libahci radeon xhci_pci xhci_hcd i2c_algo_bit backl=
ight
drm_kms_helper syscopyarea tg3 sysfillrect sysimgblt fb_sys_fops ehci_pci
uhci_hcd libphy
 ttm ehci_hcd firewire_ohci firewire_core drm crc_itu_t
[ 8044.605961]  usbcore usb_common i2c_core
[ 8044.605967] ---[ end trace 78992a27b7291279 ]---
[ 8044.605977] RIP: 0010:atom_op_move+0x124/0x1d0 [radeon]
[ 8044.605979] Code: 20 c0 e8 03 83 e0 07 74 2e 8d 4a 03 83 c2 02 3c 04 0f =
42
d1 41 89 14 24 eb 07 83 c2 02 41 89 14 24 c7 44 24 08 cd cd cd cd e9 <42> f=
f ff
ff 83 c2 03 41 89 14 24 eb ea 83 c2 05 41 89 14 24 eb e1
[ 8044.605980] RSP: 0018:ffffc9000034fe50 EFLAGS: 00010292
[ 8044.605983] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[ 8044.605985] RDX: 0000000000000000 RSI: 0000000000000004 RDI:
ffffc9000034fe3a
[ 8044.605986] RBP: ffff8882633d0000 R08: ffffffffa0201837 R09:
0000000000000006
[ 8044.605987] R10: 0000000000000006 R11: 000000000001a800 R12:
ffff8882658eb1a0
[ 8044.605989] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[ 8044.605990] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[ 8044.605991] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 8044.605993] CR2: 000031fd52e7a000 CR3: 00000001d1197002 CR4:
00000000000606a0
[ 8044.605994] Kernel panic - not syncing: Fatal exception
[ 8044.606020] Kernel Offset: disabled
[ 8044.606022] Rebooting in 10 seconds..
[ 8054.606406] ACPI MEMORY or I/O RESET_REG.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15722638611.Cea646C.20371
Date: Mon, 28 Oct 2019 11:57:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel panic when waking up after screens go to dpms slee=
p"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Kernel panic when waking up after screens go to dpms slee=
p"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111659">bug 11165=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
brad&#64;fnarfbargle.com" title=3D"Brad Campbell &lt;brad&#64;fnarfbargle.c=
om&gt;"> <span class=3D"fn">Brad Campbell</span></a>
</span></b>
        <pre>I thought given these generally result in a stack canary I'd t=
ry something
different. Upgraded to latest linus-git and disabled the stack protector.

It did take a bit longer to hit, but we got there.

[ 8044.605803] do_IRQ: 2.205 No irq handler for vector
[ 8044.605814] do_IRQ: 2.233 No irq handler for vector
[ 8044.605821] invalid opcode: 0000 [#1] SMP
[ 8044.605824] CPU: 2 PID: 1476 Comm: kworker/2:2 Not tainted 5.4.0-rc4-bkc=
1+
#3
[ 8044.605826] Hardware name: Apple Inc. iMac12,2/Mac-942B59F58194171B, BIOS
82.0.0.0.0 09/25/2018
[ 8044.605847] Workqueue: events radeon_dp_work_func [radeon]
[ 8044.605866] RIP: 0010:atom_op_move+0x124/0x1d0 [radeon]
[ 8044.605869] Code: 20 c0 e8 03 83 e0 07 74 2e 8d 4a 03 83 c2 02 3c 04 0f =
42
d1 41 89 14 24 eb 07 83 c2 02 41 89 14 24 c7 44 24 08 cd cd cd cd e9 &lt;42=
&gt; ff ff
ff 83 c2 03 41 89 14 24 eb ea 83 c2 05 41 89 14 24 eb e1
[ 8044.605871] RSP: 0018:ffffc9000034fe50 EFLAGS: 00010292
[ 8044.605880] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[ 8044.605881] RDX: 0000000000000000 RSI: 0000000000000004 RDI:
ffffc9000034fe3a
[ 8044.605883] RBP: ffff8882633d0000 R08: ffffffffa0201837 R09:
0000000000000006
[ 8044.605884] R10: 0000000000000006 R11: 000000000001a800 R12:
ffff8882658eb1a0
[ 8044.605886] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[ 8044.605887] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[ 8044.605889] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 8044.605890] CR2: 000031fd52e7a000 CR3: 00000001d1197002 CR4:
00000000000606a0
[ 8044.605892] Call Trace:
[ 8044.605907]  ? radeon_dp_work_func+0x28/0x40 [radeon]
[ 8044.605911]  ? process_one_work+0x1b4/0x330
[ 8044.605913]  ? worker_thread+0x44/0x3d0
[ 8044.605923]  ? set_worker_desc+0x90/0x90
[ 8044.605925]  ? kthread+0xec/0x120
[ 8044.605927]  ? kthread_create_worker_on_cpu+0x40/0x40
[ 8044.605930]  ? ret_from_fork+0x1f/0x30
[ 8044.605932] Modules linked in: cpufreq_userspace cpufreq_powersave
cpufreq_conservative nfsv4 nfsd auth_rpcgss nfs_acl nfs lockd grace fscache
sunrpc af_packet dm_crypt dm_mod dax coretemp applesmc input_polldev kvm_in=
tel
led_class kvm irqbypass btusb btbcm uvcvideo btintel bluetooth
videobuf2_vmalloc snd_usb_aud
io videobuf2_memops rfkill videobuf2_v4l2 videodev snd_usbmidi_lib ecdh_gen=
eric
videobuf2_common ecc joydev snd_hda_codec_cirrus snd_rawmidi snd_hda_codec_=
hdmi
snd_hda_codec_generic evdev snd_hda_intel snd_intel_nhlt snd_hda_codec
snd_hwdep snd_hda_core snd_pcm snd_timer snd soundcore button apple_bl ext4
crc32c_gen
eric crc16 mbcache jbd2 netconsole configfs hid_apple hid_appleir usb_stora=
ge
hid_generic usbhid hid sg sr_mod cdrom sd_mod aesni_intel glue_helper
crypto_simd cryptd ahci libahci radeon xhci_pci xhci_hcd i2c_algo_bit backl=
ight
drm_kms_helper syscopyarea tg3 sysfillrect sysimgblt fb_sys_fops ehci_pci
uhci_hcd libphy
 ttm ehci_hcd firewire_ohci firewire_core drm crc_itu_t
[ 8044.605961]  usbcore usb_common i2c_core
[ 8044.605967] ---[ end trace 78992a27b7291279 ]---
[ 8044.605977] RIP: 0010:atom_op_move+0x124/0x1d0 [radeon]
[ 8044.605979] Code: 20 c0 e8 03 83 e0 07 74 2e 8d 4a 03 83 c2 02 3c 04 0f =
42
d1 41 89 14 24 eb 07 83 c2 02 41 89 14 24 c7 44 24 08 cd cd cd cd e9 &lt;42=
&gt; ff ff
ff 83 c2 03 41 89 14 24 eb ea 83 c2 05 41 89 14 24 eb e1
[ 8044.605980] RSP: 0018:ffffc9000034fe50 EFLAGS: 00010292
[ 8044.605983] RAX: 0000000000000000 RBX: 0000000000000000 RCX:
0000000000000004
[ 8044.605985] RDX: 0000000000000000 RSI: 0000000000000004 RDI:
ffffc9000034fe3a
[ 8044.605986] RBP: ffff8882633d0000 R08: ffffffffa0201837 R09:
0000000000000006
[ 8044.605987] R10: 0000000000000006 R11: 000000000001a800 R12:
ffff8882658eb1a0
[ 8044.605989] R13: 0000000000000000 R14: ffff888267b22c00 R15:
0000000000000000
[ 8044.605990] FS:  0000000000000000(0000) GS:ffff888267b00000(0000)
knlGS:0000000000000000
[ 8044.605991] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 8044.605993] CR2: 000031fd52e7a000 CR3: 00000001d1197002 CR4:
00000000000606a0
[ 8044.605994] Kernel panic - not syncing: Fatal exception
[ 8044.606020] Kernel Offset: disabled
[ 8044.606022] Rebooting in 10 seconds..
[ 8054.606406] ACPI MEMORY or I/O RESET_REG.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15722638611.Cea646C.20371--

--===============1877047959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1877047959==--
