Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C0CF5B50C3
	for <lists+dri-devel@lfdr.de>; Sun, 11 Sep 2022 21:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD0610E0EA;
	Sun, 11 Sep 2022 19:01:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BD310E471;
 Sun, 11 Sep 2022 14:00:16 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k9so11390593wri.0;
 Sun, 11 Sep 2022 07:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date; bh=KTzxVtZCtkXwV1gxjjq7enqBLKrwyXCe1zj1CTk4CjM=;
 b=IRicu+PjkWFRfC9U0PE6pC3BHSVJ49zzZvGHfVi0YCoDALz1HpXggT+c7NUU1awA5Z
 XVeuoTpPt3sHdGWohC6Z1kva/qjeCOSjr4dcYvY1eqRZKWM7tbJWp+ExuaddO49J1iiQ
 0d4+dvqD0N7OUC280gMCSrBdeMkSs6Cee2h7kycM2oDLeSMAWOa+9cIla4tKbeJcr4uq
 5un5fMSf/PX5miqRKZOGM9ZXzuCsbmqQ9QS6IiGUjBm4oVqBeBArct5m9H4KpJb6vqmZ
 TVyV0dJWAvHLyHq8zBX3mVjSRXMkzFQFD6UyU81Vp1d693Ujm6EUA9dmiM2fCtvLU61U
 hQVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=KTzxVtZCtkXwV1gxjjq7enqBLKrwyXCe1zj1CTk4CjM=;
 b=pAg3eaBaZqdH9j9f9aZDf+CYK7ud4g1vDfIsAKx6S8pA+VlojVBY9ehs5ENo8+le5o
 9RZeOVjQDCsohVUXk6FA3lyxeikAhNWICxlLZnooOxrwT/Bor0a2ZUR57AW6kurM82yZ
 mrbHuRzzpVM8zPrxlojSd/IKO0RJLiimfQoA6vQjJXEpiWdfxhcBSr8liVOf1P88VOhO
 mcXrei8dOMTind7QRODCxZO6d9NnC0C7CUZrXJHpZM36kVGbiiuWActABRYbIKygXYlE
 UiDcgdensU9hNhCxi3uPeFsmMZ5yLgoTGTT8NWHO3cGaNWUfQ0BMfXrQBv739TOHAPOT
 zvtw==
X-Gm-Message-State: ACgBeo3G3OQ4Oj2RKhkq5/kn4hLDdBPgg2AT6R7nEnKNB1AGJoTAZqXi
 0NJTsGM38qcTCPvqJqB7GUpYqWIKO7xQI5h5gkE=
X-Google-Smtp-Source: AA6agR7C+C2ccl9vNqnkTx19Ya9vdRB6VWyRYSfCK7G2fyKU6cAwh21E2w7bf++uwa8huGbqf/ntphLbDihEw3sGoao=
X-Received: by 2002:a05:6000:110d:b0:228:db67:75c4 with SMTP id
 z13-20020a056000110d00b00228db6775c4mr12963464wrw.217.1662904814856; Sun, 11
 Sep 2022 07:00:14 -0700 (PDT)
MIME-Version: 1.0
From: Maxim Mikityanskiy <maxtram95@gmail.com>
Date: Sun, 11 Sep 2022 16:59:48 +0300
Message-ID: <CAKErNvr_GNRT+PpUOBocAooHkKrjGTjeoDg1MriBwivLAeHZOA@mail.gmail.com>
Subject: NULL pointer dereference in i915 in i915_gem_do_execbuffer,
 eb_lookup_vmas
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Chris Wilson <chris@chris-wilson.co.uk>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 11 Sep 2022 19:01:28 +0000
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Matthew Auld <matthew.auld@intel.com>,
 John Harrison <john.c.harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

I experience periodic crashes on HP Elite Dragonfly G2 (i7-1165G7)
which, I believe, are related to a bug in the i915 driver. I collected
a stacktrace and a kdump on 5.19.8 compiled with KASAN. This time the
screen was frozen, but I could SSH into the machine. Sometimes a
kernel panic happens.

I will appreciate it if this can be fixed. Please find the decoded
stack trace below:

[ +13,386280] general protection fault, probably for non-canonical
address 0xdffffc00000000ec: 0000 [#1] PREEMPT SMP DEBUG_PAGEALLOC
KASAN NOPTI
[  +0,000024] KASAN: null-ptr-deref in range
[0x0000000000000760-0x0000000000000767]
[  +0,000017] Hardware name: HP HP Elite Dragonfly G2 Notebook
PC/8716, BIOS T90 Ver. 01.01.04 01/03/2021
[   +0,000006] RIP: 0010:i915_gem_do_execbuffer
(./drivers/gpu/drm/i915/gem/i915_gem_object.h:632
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:921
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3391) i915
[ +0,000207] Code: b8 00 00 00 48 89 f8 48 c1 e8 03 80 3c 28 00 0f 85
5d 3f 00 00 4d 8b af b8 00 00 00 49 8d bd 60 07 00 00 48 89 f8 48 c1
e8 03 <80> 3c 28 00 0f 85 34 3f 00 00 49 83 bd 60 07 00 00 00 74 6c 4c
89
All code
========
   0:    b8 00 00 00 48           mov    $0x48000000,%eax
   5:    89 f8                    mov    %edi,%eax
   7:    48 c1 e8 03              shr    $0x3,%rax
   b:    80 3c 28 00              cmpb   $0x0,(%rax,%rbp,1)
   f:    0f 85 5d 3f 00 00        jne    0x3f72
  15:    4d 8b af b8 00 00 00     mov    0xb8(%r15),%r13
  1c:    49 8d bd 60 07 00 00     lea    0x760(%r13),%rdi
  23:    48 89 f8                 mov    %rdi,%rax
  26:    48 c1 e8 03              shr    $0x3,%rax
  2a:*    80 3c 28 00              cmpb   $0x0,(%rax,%rbp,1)
<-- trapping instruction
  2e:    0f 85 34 3f 00 00        jne    0x3f68
  34:    49 83 bd 60 07 00 00     cmpq   $0x0,0x760(%r13)
  3b:    00
  3c:    74 6c                    je     0xaa
  3e:    4c                       rex.WR
  3f:    89                       .byte 0x89

Code starting with the faulting instruction
===========================================
   0:    80 3c 28 00              cmpb   $0x0,(%rax,%rbp,1)
   4:    0f 85 34 3f 00 00        jne    0x3f3e
   a:    49 83 bd 60 07 00 00     cmpq   $0x0,0x760(%r13)
  11:    00
  12:    74 6c                    je     0x80
  14:    4c                       rex.WR
  15:    89                       .byte 0x89
[  +0,000008] RSP: 0018:ffffc9000a74f7e8 EFLAGS: 00010202
[  +0,000009] RAX: 00000000000000ec RBX: 0000000000000008 RCX: 0000000000000000
[  +0,000006] RDX: 0000000000000001 RSI: ffffc9000a74f880 RDI: 0000000000000760
[  +0,000005] RBP: dffffc0000000000 R08: ffff888135ae8000 R09: 0000000000000000
[  +0,000005] R10: fffffbfff5b2f5a4 R11: ffffffffc16145cb R12: 0000000000000008
[  +0,000005] R13: 0000000000000000 R14: 000000000000001c R15: ffff88813513d640
[  +0,000005] FS:  00007f1329fced00(0000) GS:ffff888810000000(0000)
knlGS:0000000000000000
[  +0,000007] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0,000005] CR2: 00007f5c6ff8f80c CR3: 000000011493e005 CR4: 0000000000f70ef0
[  +0,000006] PKRU: 55555554
[  +0,000004] Call Trace:
[  +0,000005]  <TASK>
[   +0,000010] ? parse_timeline_fences
(drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3292) i915
[   +0,000193] ? kernel_text_address (kernel/extable.c:125 kernel/extable.c:94)
[   +0,000039] ? reacquire_held_locks (kernel/locking/lockdep.c:5674)
[   +0,000009] ? __schedule_bug (kernel/sched/core.c:9820)
[   +0,000014] i915_gem_execbuffer2_ioctl
(drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3543) i915
[   +0,000184] ? i915_gem_do_execbuffer
(drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3503) i915
[   +0,000177] drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:782)
[   +0,000009] ? drm_version (drivers/gpu/drm/drm_ioctl.c:767)
[   +0,000011] drm_ioctl (drivers/gpu/drm/drm_ioctl.c:886)
[   +0,000008] ? i915_gem_do_execbuffer
(drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3503) i915
[   +0,000174] ? drm_ioctl_kernel (drivers/gpu/drm/drm_ioctl.c:807)
[   +0,000006] ? lock_release (./include/trace/events/lock.h:69
kernel/locking/lockdep.c:5677)
[   +0,000008] ? lock_downgrade (kernel/locking/lockdep.c:5634)
[   +0,000007] ? ktime_get_coarse_real_ts64
(./include/linux/seqlock.h:274 kernel/time/timekeeping.c:2261)
[   +0,000019] __x64_sys_ioctl (fs/ioctl.c:51 fs/ioctl.c:870
fs/ioctl.c:856 fs/ioctl.c:856)
[   +0,000009] do_syscall_64 (arch/x86/entry/common.c:50
arch/x86/entry/common.c:80)
[   +0,000008] ? do_syscall_64 (arch/x86/entry/common.c:87)
[   +0,000007] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:120)
[  +0,000008] RIP: 0033:0x7f132a9579ef
[ +0,000006] Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10
00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00
0f 05 <89> c2 3d 00 f0 ff ff 77 18 48 8b 44 24 18 64 48 2b 04 25 28 00
00
All code
========
   0:    00 48 89                 add    %cl,-0x77(%rax)
   3:    44 24 18                 rex.R and $0x18,%al
   6:    31 c0                    xor    %eax,%eax
   8:    48 8d 44 24 60           lea    0x60(%rsp),%rax
   d:    c7 04 24 10 00 00 00     movl   $0x10,(%rsp)
  14:    48 89 44 24 08           mov    %rax,0x8(%rsp)
  19:    48 8d 44 24 20           lea    0x20(%rsp),%rax
  1e:    48 89 44 24 10           mov    %rax,0x10(%rsp)
  23:    b8 10 00 00 00           mov    $0x10,%eax
  28:    0f 05                    syscall
  2a:*    89 c2                    mov    %eax,%edx        <--
trapping instruction
  2c:    3d 00 f0 ff ff           cmp    $0xfffff000,%eax
  31:    77 18                    ja     0x4b
  33:    48 8b 44 24 18           mov    0x18(%rsp),%rax
  38:    64                       fs
  39:    48                       rex.W
  3a:    2b                       .byte 0x2b
  3b:    04 25                    add    $0x25,%al
  3d:    28 00                    sub    %al,(%rax)
    ...

Code starting with the faulting instruction
===========================================
   0:    89 c2                    mov    %eax,%edx
   2:    3d 00 f0 ff ff           cmp    $0xfffff000,%eax
   7:    77 18                    ja     0x21
   9:    48 8b 44 24 18           mov    0x18(%rsp),%rax
   e:    64                       fs
   f:    48                       rex.W
  10:    2b                       .byte 0x2b
  11:    04 25                    add    $0x25,%al
  13:    28 00                    sub    %al,(%rax)
    ...
[  +0,000007] RSP: 002b:00007ffdbe2d22a0 EFLAGS: 00000246 ORIG_RAX:
0000000000000010
[  +0,000008] RAX: ffffffffffffffda RBX: 000000000000000e RCX: 00007f132a9579ef
[  +0,000006] RDX: 00007ffdbe2d2360 RSI: 0000000040406469 RDI: 000000000000000e
[  +0,000005] RBP: 00007ffdbe2d23f0 R08: 000000000000000f R09: 0000564e1cdfd460
[  +0,000004] R10: 0000564e1db43990 R11: 0000000000000246 R12: 0000000000000000
[  +0,000005] R13: 00007ffdbe2d2360 R14: 0000564e1cdbe498 R15: 000000000000000f
[  +0,000012]  </TASK>
[  +0,000004] Modules linked in: uinput rfcomm ccm cmac algif_hash
algif_skcipher af_alg snd_ctl_led snd_soc_skl_hda_dsp
snd_soc_intel_hda_dsp_common snd_sof_probes snd_soc_hdac_hdmi
hid_sensor_custom_intel_hinge snd_hda_codec_hdmi snd_hda_codec_realtek
snd_soc_dmic snd_hda_codec_generic ledtrig_audio hid_sensor_gyro_3d
hid_sensor_als hid_sensor_accel_3d hid_sensor_incl_3d
hid_sensor_rotation hid_sensor_magn_3d snd_sof_pci_intel_tgl
hid_sensor_trigger industrialio_triggered_buffer
snd_sof_intel_hda_common kfifo_buf hid_sensor_iio_common industrialio
hid_sensor_custom soundwire_intel soundwire_generic_allocation
soundwire_cadence snd_sof_intel_hda snd_sof_pci bnep
snd_sof_xtensa_dsp snd_sof snd_sof_utils snd_soc_hdac_hda
hid_sensor_hub snd_hda_ext_core snd_soc_acpi_intel_match snd_soc_acpi
joydev iTCO_wdt soundwire_bus spi_nor intel_pmc_bxt intel_tcc_cooling
snd_soc_core x86_pkg_temp_thermal mousedev mtd iTCO_vendor_support
intel_powerclamp intel_ishtp_hid snd_compress wacom hp_wmi
[  +0,000140]  coretemp ac97_bus wmi_bmof platform_profile usbhid
snd_pcm_dmaengine snd_hda_intel hid_multitouch kvm_intel
snd_intel_dspcfg pmt_telemetry snd_intel_sdw_acpi mei_pxp mei_hdcp
uvcvideo intel_rapl_msr pmt_class kvm snd_hda_codec btusb
videobuf2_vmalloc snd_hda_core btrtl irqbypass videobuf2_memops
snd_hwdep btbcm videobuf2_v4l2 intel_cstate btintel snd_pcm
videobuf2_common intel_uncore btmtk pcspkr snd_timer videodev snd
i2c_i801 spi_intel_pci iosm soundcore bluetooth ucsi_acpi spi_intel
i2c_smbus mc typec_ucsi qrtr ecdh_generic typec crc16 iwlmvm roles wmi
int3403_thermal mac80211 soc_button_array i2c_hid_acpi i2c_hid libarc4
i915 iwlwifi vfat fat iwlmei processor_thermal_device_pci_legacy
drm_buddy processor_thermal_device processor_thermal_rfim video
processor_thermal_mbox cfg80211 intel_hid ttm mac_hid
processor_thermal_rapl sparse_keymap mei_me int3400_thermal
acpi_thermal_rel wireless_hotkey drm_display_helper rfkill
intel_rapl_common intel_lpss_pci intel_ish_ipc
[  +0,000187]  thunderbolt mei intel_lpss acpi_pad cec intel_ishtp
intel_vsec idma64 int340x_thermal_zone igen6_edac intel_gtt
intel_soc_dts_iosf dm_multipath sg crypto_user fuse ip_tables x_tables
btrfs blake2b_generic libcrc32c crc32c_generic xor raid6_pq dm_crypt
cbc encrypted_keys trusted asn1_encoder tee dm_mod crct10dif_pclmul
crc32_pclmul nvme crc32c_intel ghash_clmulni_intel serio_raw
aesni_intel atkbd nvme_core crypto_simd libps2 cryptd vivaldi_fmap vmd
xhci_pci xhci_pci_renesas i8042 serio tpm_crb tpm_tis tpm_tis_core tpm
rng_core
[  +0,000115] Unloaded tainted modules: acpi_cpufreq():1
acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1
acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1
pcc_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1
pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1
acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1
acpi_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1
pcc_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1
pcc_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1 fjes():1
pcc_cpufreq():1 fjes():1 acpi_cpufreq():1 pcc_cpufreq():1
asus_ec_sensors():1 acpi_cpufreq():1 fjes():1 pcc_cpufreq():1
acpi_cpufreq():1 pcc_cpufreq():1 acpi_cpufreq():1 fjes():1
acpi_cpufreq():1 pcc_cpufreq():1 fjes():1 pcc_cpufreq():1
acpi_cpufreq():1 fjes():1 acpi_cpufreq():1 pcc_cpufreq():1
pcc_cpufreq():1 fjes():1 acpi_cpufreq():1 asus_ec_sensors():1 fjes():1
pcc_cpufreq():1 acpi_cpufreq():1 acpi_cpufreq():1
[  +0,000168]  pcc_cpufreq():1 acpi_cpufreq():1 pcc_cpufreq():1
acpi_cpufreq():1 acpi_cpufreq():1
[  +0,000024] ---[ end trace 0000000000000000 ]---
[   +0,000006] RIP: 0010:i915_gem_do_execbuffer
(./drivers/gpu/drm/i915/gem/i915_gem_object.h:632
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:921
drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c:3391) i915
[ +0,000221] Code: b8 00 00 00 48 89 f8 48 c1 e8 03 80 3c 28 00 0f 85
5d 3f 00 00 4d 8b af b8 00 00 00 49 8d bd 60 07 00 00 48 89 f8 48 c1
e8 03 <80> 3c 28 00 0f 85 34 3f 00 00 49 83 bd 60 07 00 00 00 74 6c 4c
89
All code
========
   0:    b8 00 00 00 48           mov    $0x48000000,%eax
   5:    89 f8                    mov    %edi,%eax
   7:    48 c1 e8 03              shr    $0x3,%rax
   b:    80 3c 28 00              cmpb   $0x0,(%rax,%rbp,1)
   f:    0f 85 5d 3f 00 00        jne    0x3f72
  15:    4d 8b af b8 00 00 00     mov    0xb8(%r15),%r13
  1c:    49 8d bd 60 07 00 00     lea    0x760(%r13),%rdi
  23:    48 89 f8                 mov    %rdi,%rax
  26:    48 c1 e8 03              shr    $0x3,%rax
  2a:*    80 3c 28 00              cmpb   $0x0,(%rax,%rbp,1)
<-- trapping instruction
  2e:    0f 85 34 3f 00 00        jne    0x3f68
  34:    49 83 bd 60 07 00 00     cmpq   $0x0,0x760(%r13)
  3b:    00
  3c:    74 6c                    je     0xaa
  3e:    4c                       rex.WR
  3f:    89                       .byte 0x89

Code starting with the faulting instruction
===========================================
   0:    80 3c 28 00              cmpb   $0x0,(%rax,%rbp,1)
   4:    0f 85 34 3f 00 00        jne    0x3f3e
   a:    49 83 bd 60 07 00 00     cmpq   $0x0,0x760(%r13)
  11:    00
  12:    74 6c                    je     0x80
  14:    4c                       rex.WR
  15:    89                       .byte 0x89
[  +0,000007] RSP: 0018:ffffc9000a74f7e8 EFLAGS: 00010202
[  +0,000007] RAX: 00000000000000ec RBX: 0000000000000008 RCX: 0000000000000000
[  +0,000005] RDX: 0000000000000001 RSI: ffffc9000a74f880 RDI: 0000000000000760
[  +0,000006] RBP: dffffc0000000000 R08: ffff888135ae8000 R09: 0000000000000000
[  +0,000005] R10: fffffbfff5b2f5a4 R11: ffffffffc16145cb R12: 0000000000000008
[  +0,000004] R13: 0000000000000000 R14: 000000000000001c R15: ffff88813513d640
[  +0,000005] FS:  00007f1329fced00(0000) GS:ffff888810000000(0000)
knlGS:0000000000000000
[  +0,000006] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  +0,000006] CR2: 00007f5c6ff8f80c CR3: 000000011493e005 CR4: 0000000000f70ef0
[  +0,000005] PKRU: 55555554
