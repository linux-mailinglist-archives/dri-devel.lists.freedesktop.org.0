Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B339AF161
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 21:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E776E105;
	Tue, 10 Sep 2019 19:03:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 790FB6E105
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 19:03:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 7198172167; Tue, 10 Sep 2019 19:03:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111633] amdgpu driver crash with kernel NULL pointer dereference
Date: Tue, 10 Sep 2019 19:03:17 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: vakevk+freedesktopbugzilla@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111633-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2077341175=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2077341175==
Content-Type: multipart/alternative; boundary="15681421970.87b324.18646"
Content-Transfer-Encoding: 7bit


--15681421970.87b324.18646
Date: Tue, 10 Sep 2019 19:03:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111633

            Bug ID: 111633
           Summary: amdgpu driver crash with kernel NULL pointer
                    dereference
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: vakevk+freedesktopbugzilla@gmail.com

I am running on arch linux: Linux arch 5.2.13-arch1-1-ARCH #1 SMP PREEMPT F=
ri
Sep 6 17:52:33 UTC 2019 x86_64 GNU/Linux

I am running wayland via sway.

My gpu is a Radeon RX Vega 64.

While in my sway session the image on my screen froze but audio from a video
continued to play. I was able to ssh in from a different machine and found =
this
message with dmesg:

BUG: kernel NULL pointer dereference, address: 0000000000000360
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 0 P4D 0
Oops: 0002 [#1] PREEMPT SMP PTI
CPU: 1 PID: 12766 Comm: kworker/u16:0 Not tainted 5.2.11-arch1-1-ARCH #1
Hardware name: ASUS All Series/Z87-PLUS, BIOS 2103 08/15/2014
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dc_stream_retain+0x5/0x20 [amdgpu]
<Code and registers omitted. Can post if important and someone reassures me
that it doesn't sensitive information since it looks like a memory dump.>
Call Trace:
 dc_resource_state_copy_construct+0xa0/0xf0 [amdgpu]
 dc_commit_updates_for_stream+0xa63/0xc20 [amdgpu]
 amdgpu_dm_atomic_commit_tail+0xabe/0x19a0 [amdgpu]
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 process_one_work+0x1d1/0x3e0
 worker_thread+0x4a/0x3d0
 kthread+0xfb/0x130
 ? process_one_work+0x3e0/0x3e0
 ? kthread_park+0x80/0x80
 ret_from_fork+0x35/0x40
Modules linked in: snd_seq_dummy snd_seq tun nft_ct nf_conntrack nf_defrag_=
ipv6
nf_defrag_ipv4 libcrc32c nf_tables_set cfg80211 nf_tables nfnetlink 8021q g=
arp
mrp stp llc intel_rapl nls_iso8859_1 nls_cp437 vfat fat snd_hda_codec_realt=
ek
snd_hda_codec_generic fuse ledtrig_audio ofpart snd_hda_codec_hdmi cmdlinep=
art
btusb intel_spi_platform snd_hda_intel btrtl x86_pkg_temp_thermal intel_spi
btbcm intel_powerclamp spi_nor btintel eeepc_wmi snd_usb_audio coretemp
snd_hda_codec uvcvideo asus_wmi bluetooth snd_usbmidi_lib iTCO_wdt kvm_intel
snd_hda_core videobuf2_vmalloc mei_hdcp mtd iTCO_vendor_support mxm_wmi
wmi_bmof sparse_keymap snd_hwdep snd_rawmidi snd_seq_device videobuf2_memops
snd_pcm videobuf2_v4l2 snd_timer videobuf2_common snd videodev kvm irqbypass
input_leds ecdh_generic intel_cstate mousedev rfkill intel_uncore mei_me jo=
ydev
cdc_acm media ecc e1000e intel_rapl_perf mei soundcore pcc_cpufreq i2c_i801
lpc_ich pcspkr wmi evdev mac_hid ip_tables x_tables ext4
 crc32c_generic crc16 mbcache jbd2 hid_generic usbhid hid dm_crypt dm_mod
sd_mod crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel ahci
libahci aesni_intel libata aes_x86_64 xhci_pci crypto_simd cryptd glue_help=
er
xhci_hcd scsi_mod ehci_pci ehci_hcd amdgpu gpu_sched i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
CR2: 0000000000000360
---[ end trace 08eaa2e1d713ba4d ]---

At this point I tried killing the sway process but did not succeed even with
`kill -9`. Not even `sudo reboot` completed despite killing the ssh session=
. I
had to hard reset the machine.

Potentially related is that since roughly a week I have been experiencing
intermittent screen freezes from time to time that would resolve themselves
after about 10 seconds with a message like this in dmesg:

drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
[drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-0] hw_done or
flip_done timed out

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681421970.87b324.18646
Date: Tue, 10 Sep 2019 19:03:17 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - amdgpu driver crash with kernel NULL pointer dereference"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111633">111633</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>amdgpu driver crash with kernel NULL pointer dereference
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>vakevk+freedesktopbugzilla&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I am running on arch linux: Linux arch 5.2.13-arch1-1-ARCH #1 =
SMP PREEMPT Fri
Sep 6 17:52:33 UTC 2019 x86_64 GNU/Linux

I am running wayland via sway.

My gpu is a Radeon RX Vega 64.

While in my sway session the image on my screen froze but audio from a video
continued to play. I was able to ssh in from a different machine and found =
this
message with dmesg:

BUG: kernel NULL pointer dereference, address: 0000000000000360
#PF: supervisor write access in kernel mode
#PF: error_code(0x0002) - not-present page
PGD 0 P4D 0
Oops: 0002 [#1] PREEMPT SMP PTI
CPU: 1 PID: 12766 Comm: kworker/u16:0 Not tainted 5.2.11-arch1-1-ARCH #1
Hardware name: ASUS All Series/Z87-PLUS, BIOS 2103 08/15/2014
Workqueue: events_unbound commit_work [drm_kms_helper]
RIP: 0010:dc_stream_retain+0x5/0x20 [amdgpu]
&lt;Code and registers omitted. Can post if important and someone reassures=
 me
that it doesn't sensitive information since it looks like a memory dump.&gt;
Call Trace:
 dc_resource_state_copy_construct+0xa0/0xf0 [amdgpu]
 dc_commit_updates_for_stream+0xa63/0xc20 [amdgpu]
 amdgpu_dm_atomic_commit_tail+0xabe/0x19a0 [amdgpu]
 ? commit_tail+0x3c/0x70 [drm_kms_helper]
 commit_tail+0x3c/0x70 [drm_kms_helper]
 process_one_work+0x1d1/0x3e0
 worker_thread+0x4a/0x3d0
 kthread+0xfb/0x130
 ? process_one_work+0x3e0/0x3e0
 ? kthread_park+0x80/0x80
 ret_from_fork+0x35/0x40
Modules linked in: snd_seq_dummy snd_seq tun nft_ct nf_conntrack nf_defrag_=
ipv6
nf_defrag_ipv4 libcrc32c nf_tables_set cfg80211 nf_tables nfnetlink 8021q g=
arp
mrp stp llc intel_rapl nls_iso8859_1 nls_cp437 vfat fat snd_hda_codec_realt=
ek
snd_hda_codec_generic fuse ledtrig_audio ofpart snd_hda_codec_hdmi cmdlinep=
art
btusb intel_spi_platform snd_hda_intel btrtl x86_pkg_temp_thermal intel_spi
btbcm intel_powerclamp spi_nor btintel eeepc_wmi snd_usb_audio coretemp
snd_hda_codec uvcvideo asus_wmi bluetooth snd_usbmidi_lib iTCO_wdt kvm_intel
snd_hda_core videobuf2_vmalloc mei_hdcp mtd iTCO_vendor_support mxm_wmi
wmi_bmof sparse_keymap snd_hwdep snd_rawmidi snd_seq_device videobuf2_memops
snd_pcm videobuf2_v4l2 snd_timer videobuf2_common snd videodev kvm irqbypass
input_leds ecdh_generic intel_cstate mousedev rfkill intel_uncore mei_me jo=
ydev
cdc_acm media ecc e1000e intel_rapl_perf mei soundcore pcc_cpufreq i2c_i801
lpc_ich pcspkr wmi evdev mac_hid ip_tables x_tables ext4
 crc32c_generic crc16 mbcache jbd2 hid_generic usbhid hid dm_crypt dm_mod
sd_mod crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel ahci
libahci aesni_intel libata aes_x86_64 xhci_pci crypto_simd cryptd glue_help=
er
xhci_hcd scsi_mod ehci_pci ehci_hcd amdgpu gpu_sched i2c_algo_bit ttm
drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm agpgart
CR2: 0000000000000360
---[ end trace 08eaa2e1d713ba4d ]---

At this point I tried killing the sway process but did not succeed even with
`kill -9`. Not even `sudo reboot` completed despite killing the ssh session=
. I
had to hard reset the machine.

Potentially related is that since roughly a week I have been experiencing
intermittent screen freezes from time to time that would resolve themselves
after about 10 seconds with a message like this in dmesg:

drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]] *ERROR*
[CRTC:47:crtc-0] flip_done timed out
[drm:amdgpu_dm_atomic_check [amdgpu]] *ERROR* [CRTC:47:crtc-0] hw_done or
flip_done timed out</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681421970.87b324.18646--

--===============2077341175==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2077341175==--
