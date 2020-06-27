Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4516120BE5F
	for <lists+dri-devel@lfdr.de>; Sat, 27 Jun 2020 06:37:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FFD26E51B;
	Sat, 27 Jun 2020 04:37:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A2CA6E51B
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Jun 2020 04:37:19 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: dri-devel@lists.freedesktop.org
Subject: [Bug 207383] [Regression] 5.7 amdgpu/polaris11 gpf:
 amdgpu_atomic_commit_tail
Date: Sat, 27 Jun 2020 04:37:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Video(DRI - non Intel)
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rtmasura+kernel@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_video-dri@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-207383-2300-H2mEtP2xfC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-207383-2300@https.bugzilla.kernel.org/>
References: <bug-207383-2300@https.bugzilla.kernel.org/>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

https://bugzilla.kernel.org/show_bug.cgi?id=207383

--- Comment #24 from rtmasura+kernel@hotmail.com ---
I've been up and stable on XFCE4 since that last message, but just crashed
today with a bit of a different error. This happened after I turned on a screen
tear fix:

xfconf-query -c xfwm4 -p /general/vblank_mode -s glx

I also didn't reboot to activate it, I just hot loaded it with:

xfwm4 --replace --vblank=glx &

Don't think that changes anything, but just in case. Not sure if it's related,
I had a game idling on my monitor while I was cooking, and it's the first time
I had played it. It was Battle of Wesnoth. Anyway, here's the log:


Jun 26 21:08:03 abiggun kernel: general protection fault, probably for
non-canonical address 0x3b963e011fb9f84: 0000 [#1] PREEMPT SMP NOPTI
Jun 26 21:08:03 abiggun kernel: CPU: 4 PID: 362093 Comm: kworker/u12:1 Not
tainted 5.7.4-arch1-1 #1
Jun 26 21:08:03 abiggun kernel: Hardware name: System manufacturer System
Product Name/Crosshair IV Formula, BIOS 1102    08/24/2010
Jun 26 21:08:03 abiggun kernel: Workqueue: events_unbound commit_work
[drm_kms_helper]
Jun 26 21:08:03 abiggun kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x2aa/0x2310 [amdgpu]
Jun 26 21:08:03 abiggun kernel: Code: 4f 08 8b 81 e0 02 00 00 41 83 c5 01 44 39
e8 0f 87 46 ff ff ff 48 83 bd f0 fc ff ff 00 0f 84 03 01 00 00 48 8b bd f0 fc
ff ff <80> bf b0 01 00 00 01 0f 86 ac 00 00 00 48 b9 00 00 00 00 01 00 00
Jun 26 21:08:03 abiggun kernel: RSP: 0018:ffff993cc4037af8 EFLAGS: 00010206
Jun 26 21:08:03 abiggun kernel: RAX: 0000000000000006 RBX: ffff931ae09c0800
RCX: ffff931bfe478000
Jun 26 21:08:03 abiggun kernel: RDX: ffff931bf2dd2600 RSI: ffffffffc10a51a0
RDI: 03b963e011fb9f84
Jun 26 21:08:03 abiggun kernel: RBP: ffff993cc4037e60 R08: 0000000000000001
R09: 0000000000000001
Jun 26 21:08:03 abiggun kernel: R10: 0000000000000018 R11: 0000000000000018
R12: 0000000000000000
Jun 26 21:08:03 abiggun kernel: R13: 0000000000000006 R14: ffff931bd0450c00
R15: ffff931b3574dc80
Jun 26 21:08:03 abiggun kernel: FS:  0000000000000000(0000)
GS:ffff931c3fd00000(0000) knlGS:0000000000000000
Jun 26 21:08:03 abiggun kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 26 21:08:03 abiggun kernel: CR2: 00007fe602dc0008 CR3: 0000000418080000
CR4: 00000000000006e0
Jun 26 21:08:03 abiggun kernel: Call Trace:
Jun 26 21:08:03 abiggun kernel:  ? tomoyo_write_self+0x100/0x1d0
Jun 26 21:08:03 abiggun kernel:  ? __switch_to_asm+0x34/0x70
Jun 26 21:08:03 abiggun kernel:  ? __switch_to_asm+0x40/0x70
Jun 26 21:08:03 abiggun kernel:  ? __switch_to_asm+0x34/0x70
Jun 26 21:08:03 abiggun kernel:  ? __switch_to_asm+0x40/0x70
Jun 26 21:08:03 abiggun kernel:  ? rescuer_thread+0x3f0/0x3f0
Jun 26 21:08:03 abiggun kernel:  commit_tail+0x94/0x130 [drm_kms_helper]
Jun 26 21:08:03 abiggun kernel:  process_one_work+0x1da/0x3d0
Jun 26 21:08:03 abiggun kernel:  ? rescuer_thread+0x3f0/0x3f0
Jun 26 21:08:03 abiggun kernel:  worker_thread+0x4d/0x3e0
Jun 26 21:08:03 abiggun kernel:  ? rescuer_thread+0x3f0/0x3f0
Jun 26 21:08:03 abiggun kernel:  kthread+0x13e/0x160
Jun 26 21:08:03 abiggun kernel:  ? __kthread_bind_mask+0x60/0x60
Jun 26 21:08:03 abiggun kernel:  ret_from_fork+0x22/0x40
Jun 26 21:08:03 abiggun kernel: Modules linked in: snd_usb_audio
snd_usbmidi_lib snd_rawmidi snd_seq_device mc hid_plantronics macvtap macvlan
vhost_net vhost tap vhost_iotlb fuse xt_CHECKSUM xt_MASQUERADE xt_conntrack
ipt_REJECT nf_reject_ipv4 xt_tcpudp ip6table_mangle ip6table_nat iptable_mangle
iptable_nat nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ebtable_filter
ebtables ip6table_filter ip6_tables iptable_filter bridge stp llc rfkill tun
lm92 hwmon_vid input_leds amdgpu squashfs nouveau loop edac_mce_amd kvm_amd ccp
rng_core mxm_wmi snd_hda_codec_via gpu_sched snd_hda_codec_generic
snd_hda_codec_hdmi ledtrig_audio kvm ttm snd_hda_intel snd_intel_dspcfg
wmi_bmof snd_hda_codec drm_kms_helper snd_hda_core pcspkr sp5100_tco k10temp
snd_hwdep snd_pcm cec i2c_piix4 joydev rc_core mousedev igb syscopyarea
snd_timer sysfillrect snd sysimgblt i2c_algo_bit dca fb_sys_fops soundcore
asus_atk0110 evdev mac_hid wmi drm crypto_user agpgart ip_tables x_tables ext4
crc16 mbcache jbd2 ecb crypto_simd cryptd
Jun 26 21:08:03 abiggun kernel:  glue_helper xts hid_generic usbhid hid
dm_crypt raid456 libcrc32c crc32c_generic async_raid6_recov async_memcpy
async_pq async_xor xor async_tx ohci_pci raid6_pq md_mod ehci_pci ehci_hcd
ohci_hcd xhci_pci xhci_hcd ata_generic pata_acpi pata_jmicron vfio_pci
irqbypass vfio_virqfd vfio_iommu_type1 vfio dm_mod
Jun 26 21:08:03 abiggun kernel: ---[ end trace 4e7c8ad2195077a2 ]---
Jun 26 21:08:03 abiggun kernel: RIP:
0010:amdgpu_dm_atomic_commit_tail+0x2aa/0x2310 [amdgpu]
Jun 26 21:08:03 abiggun kernel: Code: 4f 08 8b 81 e0 02 00 00 41 83 c5 01 44 39
e8 0f 87 46 ff ff ff 48 83 bd f0 fc ff ff 00 0f 84 03 01 00 00 48 8b bd f0 fc
ff ff <80> bf b0 01 00 00 01 0f 86 ac 00 00 00 48 b9 00 00 00 00 01 00 00
Jun 26 21:08:03 abiggun kernel: RSP: 0018:ffff993cc4037af8 EFLAGS: 00010206
Jun 26 21:08:03 abiggun kernel: RAX: 0000000000000006 RBX: ffff931ae09c0800
RCX: ffff931bfe478000
Jun 26 21:08:03 abiggun kernel: RDX: ffff931bf2dd2600 RSI: ffffffffc10a51a0
RDI: 03b963e011fb9f84
Jun 26 21:08:03 abiggun kernel: RBP: ffff993cc4037e60 R08: 0000000000000001
R09: 0000000000000001
Jun 26 21:08:03 abiggun kernel: R10: 0000000000000018 R11: 0000000000000018
R12: 0000000000000000
Jun 26 21:08:03 abiggun kernel: R13: 0000000000000006 R14: ffff931bd0450c00
R15: ffff931b3574dc80
Jun 26 21:08:03 abiggun kernel: FS:  0000000000000000(0000)
GS:ffff931c3fd00000(0000) knlGS:0000000000000000
Jun 26 21:08:03 abiggun kernel: CS:  0010 DS: 0000 ES: 0000 CR0:
0000000080050033
Jun 26 21:08:03 abiggun kernel: CR2: 00007fe602dc0008 CR3: 0000000418080000
CR4: 00000000000006e0
Jun 26 21:08:23 abiggun Thunar[3946]: 2020-06-27T04:08:23.137Z - debug:
[REPOSITORY] fetch request: /cytrus.json
Jun 26 21:08:23 abiggun Thunar[3946]: 2020-06-27T04:08:23.138Z - debug:
[REPOSITORY] request: /cytrus.json
Jun 26 21:08:23 abiggun Thunar[3946]: { repository:
'https://launcher.cdn.ankama.com' }
Jun 26 21:08:23 abiggun Thunar[3946]: 2020-06-27T04:08:23.155Z - debug:
[REPOSITORY] fetchJson: Parsing data for /cytrus.json
Jun 26 21:08:23 abiggun Thunar[3946]: 2020-06-27T04:08:23.156Z - debug:
[REGISTRY] update
Jun 26 21:08:23 abiggun Thunar[3946]: 2020-06-27T04:08:23.156Z - debug:
[REGISTRY] Parse repository Data
Jun 26 21:08:40 abiggun audit[241624]: ANOM_ABEND auid=1000 uid=1000 gid=985
ses=2 subj==unconfined pid=241624 comm="GpuWatchdog"
exe="/opt/google/chrome/chrome" sig=11 res=1
Jun 26 21:08:40 abiggun kernel: GpuWatchdog[241650]: segfault at 0 ip
0000556ef31897ad sp 00007f11132a95d0 error 6 in chrome[556eeeadc000+785b000]
Jun 26 21:08:40 abiggun kernel: Code: 00 79 09 48 8b 7d b0 e8 f1 95 6c fe c7 45
b0 aa aa aa aa 0f ae f0 41 8b 84 24 e0 00 00 00 89 45 b0 48 8d 7d b0 e8 f3 5a
ba fb <c7> 04 25 00 00 00 00 37 13 00 00 48 83 c4 38 5b 41 5c 41 5d 41 5e
Jun 26 21:08:40 abiggun audit: BPF prog-id=71 op=LOAD
Jun 26 21:08:40 abiggun audit: BPF prog-id=72 op=LOAD
Jun 26 21:08:40 abiggun systemd[1]: Started Process Core Dump (PID 362491/UID
0).
Jun 26 21:08:40 abiggun audit[1]: SERVICE_START pid=1 uid=0 auid=4294967295
ses=4294967295 subj==unconfined msg='unit=systemd-coredump@4-362491-0
comm="systemd" exe="/usr/lib/systemd/systemd" hostname=? addr=? terminal=?
res=success'
Jun 26 21:08:45 abiggun systemd-coredump[362492]: Process 241624 (chrome) of
user 1000 dumped core.

                                                  Stack trace of thread 241650:
                                                  #0  0x0000556ef31897ad n/a
(chrome + 0x62b07ad)
                                                  #1  0x0000556ef17e5c93 n/a
(chrome + 0x490cc93)
                                                  #2  0x0000556ef17f7199 n/a
(chrome + 0x491e199)
                                                  #3  0x0000556ef17ad6cf n/a
(chrome + 0x48d46cf)
                                                  #4  0x0000556ef17f795c n/a
(chrome + 0x491e95c)
                                                  #5  0x0000556ef17d08b9 n/a
(chrome + 0x48f78b9)
                                                  #6  0x0000556ef180ea1b n/a
(chrome + 0x4935a1b)
                                                  #7  0x0000556ef184ae78 n/a
(chrome + 0x4971e78)
                                                  #8  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #9  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241624:
                                                  #0  0x00007f1117c2a05f __poll
(libc.so.6 + 0xf505f)
                                                  #1  0x00007f11190c663b n/a
(libxcb.so.1 + 0xc63b)
                                                  #2  0x00007f11190c845b
xcb_wait_for_special_event (libxcb.so.1 + 0xe45b)
                                                  #3  0x00007f11128cd381 n/a
(libGLX_mesa.so.0 + 0x57381)
                                                  #4  0x00007f11128c132b n/a
(libGLX_mesa.so.0 + 0x4b32b)
                                                  #5  0x0000556ef295706e n/a
(chrome + 0x5a7e06e)
                                                  #6  0x0000556ef2955cb8 n/a
(chrome + 0x5a7ccb8)
                                                  #7  0x0000556ef17e5c93 n/a
(chrome + 0x490cc93)
                                                  #8  0x0000556ef17f7199 n/a
(chrome + 0x491e199)
                                                  #9  0x0000556ef17ad999 n/a
(chrome + 0x48d4999)
                                                  #10 0x0000556ef17f795c n/a
(chrome + 0x491e95c)
                                                  #11 0x0000556ef17d08b9 n/a
(chrome + 0x48f78b9)
                                                  #12 0x0000556ef59a9ed9 n/a
(chrome + 0x8ad0ed9)
                                                  #13 0x0000556ef13329b4 n/a
(chrome + 0x44599b4)
                                                  #14 0x0000556ef139addd n/a
(chrome + 0x44c1ddd)
                                                  #15 0x0000556ef1330901 n/a
(chrome + 0x4457901)
                                                  #16 0x0000556eeede80ce
ChromeMain (chrome + 0x1f0f0ce)
                                                  #17 0x00007f1117b5c002
__libc_start_main (libc.so.6 + 0x27002)
                                                  #18 0x0000556eeeadc6aa _start
(chrome + 0x1c036aa)

                                                  Stack trace of thread 241636:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241642:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241644:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241643:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 359981:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241651:
                                                  #0  0x00007f1117c34f3e
epoll_wait (libc.so.6 + 0xfff3e)
                                                  #1  0x0000556ef192ea1a n/a
(chrome + 0x4a55a1a)
                                                  #2  0x0000556ef192c227 n/a
(chrome + 0x4a53227)
                                                  #3  0x0000556ef18588d0 n/a
(chrome + 0x497f8d0)
                                                  #4  0x0000556ef17f795c n/a
(chrome + 0x491e95c)
                                                  #5  0x0000556ef17d08b9 n/a
(chrome + 0x48f78b9)
                                                  #6  0x0000556ef1809624 n/a
(chrome + 0x4930624)
                                                  #7  0x0000556ef180ea1b n/a
(chrome + 0x4935a1b)
                                                  #8  0x0000556ef184ae78 n/a
(chrome + 0x4971e78)
                                                  #9  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #10 0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241655:
                                                  #0  0x00007f1119245158
pthread_cond_timedwait@@GLIBC_2.3.2 (libpthread.so.0 + 0x10158)
                                                  #1  0x0000556ef1846f60 n/a
(chrome + 0x496df60)
                                                  #2  0x0000556ef18475b0 n/a
(chrome + 0x496e5b0)
                                                  #3  0x0000556ef17ad716 n/a
(chrome + 0x48d4716)
                                                  #4  0x0000556ef17f795c n/a
(chrome + 0x491e95c)
                                                  #5  0x0000556ef17d08b9 n/a
(chrome + 0x48f78b9)
                                                  #6  0x0000556ef180ea1b n/a
(chrome + 0x4935a1b)
                                                  #7  0x0000556ef184ae78 n/a
(chrome + 0x4971e78)
                                                  #8  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #9  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241656:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 242011:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241646:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241657:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241658:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 351071:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 351072:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 359972:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241659:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 361357:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241647:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241652:
                                                  #0  0x00007f1119245158
pthread_cond_timedwait@@GLIBC_2.3.2 (libpthread.so.0 + 0x10158)
                                                  #1  0x0000556ef1846f60 n/a
(chrome + 0x496df60)
                                                  #2  0x0000556ef18475b0 n/a
(chrome + 0x496e5b0)
                                                  #3  0x0000556ef1809c6a n/a
(chrome + 0x4930c6a)
                                                  #4  0x0000556ef180a54c n/a
(chrome + 0x493154c)
                                                  #5  0x0000556ef180a234 n/a
(chrome + 0x4931234)
                                                  #6  0x0000556ef184ae78 n/a
(chrome + 0x4971e78)
                                                  #7  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #8  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241653:
                                                  #0  0x00007f1117c34f3e
epoll_wait (libc.so.6 + 0xfff3e)
                                                  #1  0x0000556ef192ea1a n/a
(chrome + 0x4a55a1a)
                                                  #2  0x0000556ef192c227 n/a
(chrome + 0x4a53227)
                                                  #3  0x0000556ef18588d0 n/a
(chrome + 0x497f8d0)
                                                  #4  0x0000556ef17f795c n/a
(chrome + 0x491e95c)
                                                  #5  0x0000556ef17d08b9 n/a
(chrome + 0x48f78b9)
                                                  #6  0x0000556ef180ea1b n/a
(chrome + 0x4935a1b)
                                                  #7  0x0000556ef184ae78 n/a
(chrome + 0x4971e78)
                                                  #8  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #9  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241660:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241661:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241662:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241665:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241666:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241663:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241667:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241664:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241851:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241852:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241853:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 245560:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x0000556ef1846e48 n/a
(chrome + 0x496de48)
                                                  #2  0x0000556ef18475d9 n/a
(chrome + 0x496e5d9)
                                                  #3  0x0000556ef184739f n/a
(chrome + 0x496e39f)
                                                  #4  0x0000556ef17ad751 n/a
(chrome + 0x48d4751)
                                                  #5  0x0000556ef17f795c n/a
(chrome + 0x491e95c)
                                                  #6  0x0000556ef17d08b9 n/a
(chrome + 0x48f78b9)
                                                  #7  0x0000556ef180ea1b n/a
(chrome + 0x4935a1b)
                                                  #8  0x0000556ef184ae78 n/a
(chrome + 0x4971e78)
                                                  #9  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #10 0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241862:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 361354:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 361028:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241902:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 361345:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 361358:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241645:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241638:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241639:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241640:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241641:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241750:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241855:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 309100:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 359991:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

                                                  Stack trace of thread 241637:
                                                  #0  0x00007f1119244e32
pthread_cond_wait@@GLIBC_2.3.2 (libpthread.so.0 + 0xfe32)
                                                  #1  0x00007f111158e3bc n/a
(radeonsi_dri.so + 0x4ae3bc)
                                                  #2  0x00007f111158cdb8 n/a
(radeonsi_dri.so + 0x4acdb8)
                                                  #3  0x00007f111923e422
start_thread (libpthread.so.0 + 0x9422)
                                                  #4  0x00007f1117c34bf3
__clone (libc.so.6 + 0xffbf3)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
