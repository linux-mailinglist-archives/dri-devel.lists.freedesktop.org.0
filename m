Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52371B08097
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jul 2025 00:41:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00A8410E145;
	Wed, 16 Jul 2025 22:41:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="YVQLKCxh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 431 seconds by postgrey-1.36 at gabe;
 Wed, 16 Jul 2025 22:41:51 UTC
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4E010E145
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 22:41:51 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4bj9pj0y2qz9tGT;
 Thu, 17 Jul 2025 00:34:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1752705277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=fxT/mDeH3WRwxcJ0CLSrCrKwE0YRPrfMAftiS4T3wFY=;
 b=YVQLKCxhIsmnzv35Ug4y5UvESSsAKWC37u2mJGiMHFt6IHArvhW6567GdDd/TPPephDAwE
 2A4B8z4zi2t7rW4i7Uh+tbUwkDgeOORPjIcVwHGWQRnm6gP4b5sn2XDwYvExJaCMbm15CP
 ht20UBqinQcmxGpVrefF8NrkCPHF8rJuJTK48Rg8u+eM1lMpKos/7pFn+evxvKTPsFLT+Y
 Zmx5rKN4mhYv3LdgwIoK47+fjUvfvg4xBOLN0PqO2e/ga/4g4kM3eEcdVk73DPD4QhI4vQ
 QXfxNrXzCGvc0jgMH5jwz+myiiTUHXXEPfbID2y2Cz3rEtjqzbgdudGNR06v1Q==
Content-Type: multipart/mixed; boundary="------------YLYL0yEjb1B0QaqUkhYaFCUx"
Message-ID: <eb932190-6358-4e9f-8bd2-ed34e4f71605@mailbox.org>
Date: Thu, 17 Jul 2025 00:34:35 +0200
MIME-Version: 1.0
Content-Language: en-US, de-DE
To: dri-devel@lists.freedesktop.org
From: Erhard Furtner <erhard_f@mailbox.org>
Cc: linux-kernel@vger.kernel.org
Subject: WARNING on drm_framebuffer_test, drm_rect_test, drm_gem_shmem_test,
 e.g. WARNING: CPU: 1 PID: 1379 at drivers/gpu/drm/drm_gem_shmem_helper.c:180
 drm_gem_shmem_free+0x2f0/0x308 [drm_shmem_helper] (kernel v6.16-rc6)
X-MBO-RS-META: 3izsgwrjxc5oi6cd7jj588d9kxfjkxgn
X-MBO-RS-ID: 0cbf6543c372655bbbd
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

This is a multi-part message in MIME format.
--------------YLYL0yEjb1B0QaqUkhYaFCUx
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Greetings!

I noticed this at running in-kernel drm tests on my Thinkpad T60 and 
also on my PowerMac G4 DP.

drm_framebuffer_test, drm_rect_test, drm_gem_shmem_test tests pass, but 
show warnings and a stacktace:

[...]
KTAP version 1
1..1
     KTAP version 1
     # Subtest: drm_framebuffer
     # module: drm_framebuffer_test
     1..10
         KTAP version 1
         # Subtest: drm_test_framebuffer_check_src_coords
         ok 1 Success: source fits into fb
         ok 2 Fail: overflowing fb with x-axis coordinate
         ok 3 Fail: overflowing fb with y-axis coordinate
         ok 4 Fail: overflowing fb with source width
         ok 5 Fail: overflowing fb with source height
     # drm_test_framebuffer_check_src_coords: pass:5 fail:0 skip:0 total:5
     ok 1 drm_test_framebuffer_check_src_coords
     ok 2 drm_test_framebuffer_cleanup
         KTAP version 1
         # Subtest: drm_test_framebuffer_create
         ok 1 ABGR8888 normal sizes
         ok 2 ABGR8888 max sizes
         ok 3 ABGR8888 pitch greater than min required
         ok 4 ABGR8888 pitch less than min required
         ok 5 ABGR8888 Invalid width
         ok 6 ABGR8888 Invalid buffer handle
         ok 7 No pixel format
         ok 8 ABGR8888 Width 0
         ok 9 ABGR8888 Height 0
         ok 10 ABGR8888 Out of bound height * pitch combination
         ok 11 ABGR8888 Large buffer offset
         ok 12 ABGR8888 Buffer offset for inexistent plane
         ok 13 ABGR8888 Invalid flag
         ok 14 ABGR8888 Set DRM_MODE_FB_MODIFIERS without modifiers
         ok 15 ABGR8888 Valid buffer modifier
         ok 16 ABGR8888 Invalid buffer 
modifier(DRM_FORMAT_MOD_SAMSUNG_64_32_TILE)
         ok 17 ABGR8888 Extra pitches without DRM_MODE_FB_MODIFIERS
         ok 18 ABGR8888 Extra pitches with DRM_MODE_FB_MODIFIERS
         ok 19 NV12 Normal sizes
         ok 20 NV12 Max sizes
         ok 21 NV12 Invalid pitch
         ok 22 NV12 Invalid modifier/missing DRM_MODE_FB_MODIFIERS flag
         ok 23 NV12 different  modifier per-plane
         ok 24 NV12 with DRM_FORMAT_MOD_SAMSUNG_64_32_TILE
         ok 25 NV12 Valid modifiers without DRM_MODE_FB_MODIFIERS
         ok 26 NV12 Modifier for inexistent plane
         ok 27 NV12 Handle for inexistent plane
         ok 28 NV12 Handle for inexistent plane without 
DRM_MODE_FB_MODIFIERS
         ok 29 YVU420 DRM_MODE_FB_MODIFIERS set without modifier
         ok 30 YVU420 Normal sizes
         ok 31 YVU420 Max sizes
         ok 32 YVU420 Invalid pitch
         ok 33 YVU420 Different pitches
         ok 34 YVU420 Different buffer offsets/pitches
         ok 35 YVU420 Modifier set just for plane 0, without 
DRM_MODE_FB_MODIFIERS
         ok 36 YVU420 Modifier set just for planes 0, 1, without 
DRM_MODE_FB_MODIFIERS
         ok 37 YVU420 Modifier set just for plane 0, 1, with 
DRM_MODE_FB_MODIFIERS
         ok 38 YVU420 Valid modifier
         ok 39 YVU420 Different modifiers per plane
         ok 40 YVU420 Modifier for inexistent plane
         ok 41 YUV420_10BIT Invalid modifier(DRM_FORMAT_MOD_LINEAR)
         ok 42 X0L2 Normal sizes
         ok 43 X0L2 Max sizes
         ok 44 X0L2 Invalid pitch
         ok 45 X0L2 Pitch greater than minimum required
         ok 46 X0L2 Handle for inexistent plane
         ok 47 X0L2 Offset for inexistent plane, without 
DRM_MODE_FB_MODIFIERS set
         ok 48 X0L2 Modifier without DRM_MODE_FB_MODIFIERS set
         ok 49 X0L2 Valid modifier
         ok 50 X0L2 Modifier for inexistent plane
     # drm_test_framebuffer_create: pass:50 fail:0 skip:0 total:50
     ok 3 drm_test_framebuffer_create
------------[ cut here ]------------
drm-kunit-mock-device drm_test_framebuffer_free.drm-kunit-mock-device: 
[drm] drm_WARN_ON(!list_empty(&fb->filp_head))
WARNING: CPU: 1 PID: 816 at drivers/gpu/drm/drm_framebuffer.c:832 
drm_framebuffer_free+0x70/0x74
Modules linked in: drm_framebuffer_test drm_kunit_helpers drm_buddy_test 
drm_buddy kunit ghash_generic gf128mul gcm ccm algif_aead des_generic 
libdes ctr cbc ecb algif_skcipher aes_generic libaes cmac sha3_generic 
sha512_generic sha1_generic md5 af_packet iwl3945 iwlegacy mac80211 
libarc4 radeon uhci_hcd acpi_cpufreq snd_hda_intel ehci_pci ehci_hcd 
snd_intel_dspcfg snd_hda_codec thinkpad_acpi usbcore cfg80211 
drm_suballoc_helper drm_ttm_helper ttm snd_hwdep i2c_algo_bit nvram 
platform_profile drm_exec sparse_keymap rfkill drm_display_helper 
snd_hda_core usb_common video snd_pcm input_leds wmi processor snd_timer 
ac backlight joydev evdev battery snd thermal button soundcore 
pkcs8_key_parser coretemp hwmon fuse loop dm_mod configfs
CPU: 1 UID: 0 PID: 816 Comm: kunit_try_catch Tainted: G 
N  6.16.0-rc6-P3 #1 PREEMPTLAZY
Tainted: [N]=TEST
Hardware name: LENOVO 2007F2G/2007F2G, BIOS 79ETE7WW (2.27 ) 03/21/2011
EIP: drm_framebuffer_free+0x70/0x74
Code: 53 08 eb 09 31 c0 e8 fb f8 02 00 31 d2 8b 4a 2c 85 c9 75 02 8b 0a 
68 4c d7 83 cc 51 50 68 03 10 7c cc e8 f7 15 a6 ff 83 c4 10 <0f> 0b eb 
a4 55 89 e5 53 57 56 83 ec 10 39 02 74 13 0f 0b b8 ea ff
EAX: 00000000 EBX: c4e08800 ECX: 00000000 EDX: 00000000
ESI: c7371e58 EDI: c7371e70 EBP: c7371e3c ESP: c7371e30
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: 0089d010 CR3: 06c90000 CR4: 000006f0
Call Trace:
  drm_test_framebuffer_free+0x77/0x1e8 [drm_framebuffer_test]
  kunit_try_run_case+0x70/0x184 [kunit]
  ? __switch_to_asm+0x2f/0xf0
  ? schedule+0x52/0x78
  ? _raw_spin_unlock_irqrestore+0xb/0x2c
  kunit_generic_run_threadfn_adapter+0x18/0x2c [kunit]
  kthread+0x197/0x1c4
  ? _raw_spin_unlock_irq+0x8/0x20
  ? kunit_try_catch_run+0x1c4/0x1c4 [kunit]
  ? calculate_sigpending+0x2a/0x30
  ? kthread_blkcg+0x24/0x24
  ? kthread_blkcg+0x24/0x24
  ret_from_fork+0x79/0xcc
  ret_from_fork_asm+0x12/0x18
  entry_INT80_32+0xf0/0xf0
---[ end trace 0000000000000000 ]---
     ok 4 drm_test_framebuffer_free
     ok 5 drm_test_framebuffer_init
------------[ cut here ]------------
WARNING: CPU: 1 PID: 820 at drivers/gpu/drm/drm_framebuffer.c:869 
drm_framebuffer_init+0xd/0x20c
Modules linked in: drm_framebuffer_test drm_kunit_helpers drm_buddy_test 
drm_buddy kunit ghash_generic gf128mul gcm ccm algif_aead des_generic 
libdes ctr cbc ecb algif_skcipher aes_generic libaes cmac sha3_generic 
sha512_generic sha1_generic md5 af_packet iwl3945 iwlegacy mac80211 
libarc4 radeon uhci_hcd acpi_cpufreq snd_hda_intel ehci_pci ehci_hcd 
snd_intel_dspcfg snd_hda_codec thinkpad_acpi usbcore cfg80211 
drm_suballoc_helper drm_ttm_helper ttm snd_hwdep i2c_algo_bit nvram 
platform_profile drm_exec sparse_keymap rfkill drm_display_helper 
snd_hda_core usb_common video snd_pcm input_leds wmi processor snd_timer 
ac backlight joydev evdev battery snd thermal button soundcore 
pkcs8_key_parser coretemp hwmon fuse loop dm_mod configfs
CPU: 1 UID: 0 PID: 820 Comm: kunit_try_catch Tainted: G        W 
N  6.16.0-rc6-P3 #1 PREEMPTLAZY
Tainted: [W]=WARN, [N]=TEST
Hardware name: LENOVO 2007F2G/2007F2G, BIOS 79ETE7WW (2.27 ) 03/21/2011
EIP: drm_framebuffer_init+0xd/0x20c
Code: c9 75 02 8b 0a 68 4c d7 83 cc 51 50 68 03 10 7c cc e8 f7 15 a6 ff 
83 c4 10 0f 0b eb a4 55 89 e5 53 57 56 83 ec 10 39 02 74 13 <0f> 0b b8 
ea ff ff ff 83 c4 10 5e 5f 5b 5d 31 c9 31 d2 c3 89 d6 8b
EAX: c4aea000 EBX: 00000000 ECX: c737de4c EDX: 00000000
ESI: c737de58 EDI: c4aea000 EBP: c737de30 ESP: c737de14
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010246
CR0: 80050033 CR2: b66bf950 CR3: 06c96000 CR4: 000006f0
Call Trace:
  drm_test_framebuffer_init_bad_format+0x51/0xcc [drm_framebuffer_test]
  kunit_try_run_case+0x70/0x184 [kunit]
  ? __switch_to_asm+0x2f/0xf0
  ? schedule+0x52/0x78
  ? _raw_spin_unlock_irqrestore+0xb/0x2c
  kunit_generic_run_threadfn_adapter+0x18/0x2c [kunit]
  kthread+0x197/0x1c4
  ? _raw_spin_unlock_irq+0x8/0x20
  ? kunit_try_catch_run+0x1c4/0x1c4 [kunit]
  ? calculate_sigpending+0x2a/0x30
  ? kthread_blkcg+0x24/0x24
  ? kthread_blkcg+0x24/0x24
  ret_from_fork+0x79/0xcc
  ret_from_fork_asm+0x12/0x18
  entry_INT80_32+0xf0/0xf0
---[ end trace 0000000000000000 ]---
     ok 6 drm_test_framebuffer_init_bad_format
     ok 7 drm_test_framebuffer_init_dev_mismatch
     ok 8 drm_test_framebuffer_lookup
     ok 9 drm_test_framebuffer_lookup_inexistent
     ok 10 drm_test_framebuffer_modifiers_not_supported
# drm_framebuffer: pass:10 fail:0 skip:0 total:10
# Totals: pass:63 fail:0 skip:0 total:63
ok 1 drm_framebuffer
KTAP version 1
1..1
     KTAP version 1
     # Subtest: drm_rect
     # module: drm_rect_test
     1..9
     ok 1 drm_test_rect_clip_scaled_div_by_zero
     ok 2 drm_test_rect_clip_scaled_not_clipped
     ok 3 drm_test_rect_clip_scaled_clipped
     ok 4 drm_test_rect_clip_scaled_signed_vs_unsigned
         KTAP version 1
         # Subtest: drm_test_rect_intersect
         ok 1 top-left x bottom-right: 2x2+1+1 x 2x2+0+0
         ok 2 top-right x bottom-left: 2x2+0+0 x 2x2+1-1
         ok 3 bottom-left x top-right: 2x2+1-1 x 2x2+0+0
         ok 4 bottom-right x top-left: 2x2+0+0 x 2x2+1+1
         ok 5 right x left: 2x1+0+0 x 3x1+1+0
         ok 6 left x right: 3x1+1+0 x 2x1+0+0
         ok 7 up x bottom: 1x2+0+0 x 1x3+0-1
         ok 8 bottom x up: 1x3+0-1 x 1x2+0+0
         ok 9 touching corner: 1x1+0+0 x 2x2+1+1
         ok 10 touching side: 1x1+0+0 x 1x1+1+0
         ok 11 equal rects: 2x2+0+0 x 2x2+0+0
         ok 12 inside another: 2x2+0+0 x 1x1+1+1
         ok 13 far away: 1x1+0+0 x 1x1+3+6
         ok 14 points intersecting: 0x0+5+10 x 0x0+5+10
         ok 15 points not intersecting: 0x0+0+0 x 0x0+5+10
     # drm_test_rect_intersect: pass:15 fail:0 skip:0 total:15
     ok 5 drm_test_rect_intersect
         KTAP version 1
         # Subtest: drm_test_rect_calc_hscale
         ok 1 normal use
         ok 2 out of max range
         ok 3 out of min range
         ok 4 zero dst
------------[ cut here ]------------
WARNING: CPU: 1 PID: 882 at drivers/gpu/drm/drm_rect.c:137 
drm_rect_calc_hscale+0x6c/0x78
Modules linked in: drm_rect_test drm_framebuffer_test drm_kunit_helpers 
drm_buddy_test drm_buddy kunit ghash_generic gf128mul gcm ccm algif_aead 
des_generic libdes ctr cbc ecb algif_skcipher aes_generic libaes cmac 
sha3_generic sha512_generic sha1_generic md5 af_packet iwl3945 iwlegacy 
mac80211 libarc4 radeon uhci_hcd acpi_cpufreq snd_hda_intel ehci_pci 
ehci_hcd snd_intel_dspcfg snd_hda_codec thinkpad_acpi usbcore cfg80211 
drm_suballoc_helper drm_ttm_helper ttm snd_hwdep i2c_algo_bit nvram 
platform_profile drm_exec sparse_keymap rfkill drm_display_helper 
snd_hda_core usb_common video snd_pcm input_leds wmi processor snd_timer 
ac backlight joydev evdev battery snd thermal button soundcore 
pkcs8_key_parser coretemp hwmon fuse loop dm_mod configfs
CPU: 1 UID: 0 PID: 882 Comm: kunit_try_catch Tainted: G        W 
N  6.16.0-rc6-P3 #1 PREEMPTLAZY
Tainted: [W]=WARN, [N]=TEST
Hardware name: LENOVO 2007F2G/2007F2G, BIOS 79ETE7WW (2.27 ) 03/21/2011
EIP: drm_rect_calc_hscale+0x6c/0x78
Code: 39 d0 be de ff ff ff 89 c2 0f 4f d6 3b 45 f0 0f 4c d6 85 c0 0f 48 
d0 39 cf 0f 44 d0 89 d0 83 c4 04 5e 5f 5b 5d 31 c9 31 d2 c3 <0f> 0b b8 
ea ff ff ff eb cd 90 90 90 55 89 e5 53 57 56 50 89 4d f0
EAX: ffff0000 EBX: 00010000 ECX: 00000000 EDX: 7fffffff
ESI: ffff0000 EDI: 00010000 EBP: c6c85ec8 ESP: c6c85eb8
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: b63b8010 CR3: 01276000 CR4: 000006f0
Call Trace:
  drm_test_rect_calc_hscale+0x1e/0x80 [drm_rect_test]
  ? __switch_to_asm+0x59/0xf0
  ? __switch_to_asm+0x53/0xf0
  kunit_try_run_case+0x70/0x184 [kunit]
  ? __switch_to_asm+0x2f/0xf0
  ? schedule+0x52/0x78
  ? _raw_spin_unlock_irqrestore+0xb/0x2c
  kunit_generic_run_threadfn_adapter+0x18/0x2c [kunit]
  kthread+0x197/0x1c4
  ? _raw_spin_unlock_irq+0x8/0x20
  ? kunit_try_catch_run+0x1c4/0x1c4 [kunit]
  ? calculate_sigpending+0x2a/0x30
  ? kthread_blkcg+0x24/0x24
  ? kthread_blkcg+0x24/0x24
  ret_from_fork+0x79/0xcc
  ret_from_fork_asm+0x12/0x18
  entry_INT80_32+0xf0/0xf0
---[ end trace 0000000000000000 ]---
         ok 5 negative src
------------[ cut here ]------------
WARNING: CPU: 1 PID: 884 at drivers/gpu/drm/drm_rect.c:137 
drm_rect_calc_hscale+0x6c/0x78
Modules linked in: drm_rect_test drm_framebuffer_test drm_kunit_helpers 
drm_buddy_test drm_buddy kunit ghash_generic gf128mul gcm ccm algif_aead 
des_generic libdes ctr cbc ecb algif_skcipher aes_generic libaes cmac 
sha3_generic sha512_generic sha1_generic md5 af_packet iwl3945 iwlegacy 
mac80211 libarc4 radeon uhci_hcd acpi_cpufreq snd_hda_intel ehci_pci 
ehci_hcd snd_intel_dspcfg snd_hda_codec thinkpad_acpi usbcore cfg80211 
drm_suballoc_helper drm_ttm_helper ttm snd_hwdep i2c_algo_bit nvram 
platform_profile drm_exec sparse_keymap rfkill drm_display_helper 
snd_hda_core usb_common video snd_pcm input_leds wmi processor snd_timer 
ac backlight joydev evdev battery snd thermal button soundcore 
pkcs8_key_parser coretemp hwmon fuse loop dm_mod configfs
CPU: 1 UID: 0 PID: 884 Comm: kunit_try_catch Tainted: G        W 
N  6.16.0-rc6-P3 #1 PREEMPTLAZY
Tainted: [W]=WARN, [N]=TEST
Hardware name: LENOVO 2007F2G/2007F2G, BIOS 79ETE7WW (2.27 ) 03/21/2011
EIP: drm_rect_calc_hscale+0x6c/0x78
Code: 39 d0 be de ff ff ff 89 c2 0f 4f d6 3b 45 f0 0f 4c d6 85 c0 0f 48 
d0 39 cf 0f 44 d0 89 d0 83 c4 04 5e 5f 5b 5d 31 c9 31 d2 c3 <0f> 0b b8 
ea ff ff ff eb cd 90 90 90 55 89 e5 53 57 56 50 89 4d f0
EAX: ffff0000 EBX: ffff0000 ECX: 00000000 EDX: 7fffffff
ESI: 00010000 EDI: ffff0000 EBP: c5057ec8 ESP: c5057eb8
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: b63b8010 CR3: 01276000 CR4: 000006f0
Call Trace:
  drm_test_rect_calc_hscale+0x1e/0x80 [drm_rect_test]
  ? __switch_to_asm+0x59/0xf0
  ? __switch_to_asm+0x53/0xf0
  kunit_try_run_case+0x70/0x184 [kunit]
  ? __switch_to_asm+0x2f/0xf0
  ? schedule+0x52/0x78
  ? _raw_spin_unlock_irqrestore+0xb/0x2c
  kunit_generic_run_threadfn_adapter+0x18/0x2c [kunit]
  kthread+0x197/0x1c4
  ? _raw_spin_unlock_irq+0x8/0x20
  ? kunit_try_catch_run+0x1c4/0x1c4 [kunit]
  ? calculate_sigpending+0x2a/0x30
  ? kthread_blkcg+0x24/0x24
  ? kthread_blkcg+0x24/0x24
  ret_from_fork+0x79/0xcc
  ret_from_fork_asm+0x12/0x18
  entry_INT80_32+0xf0/0xf0
---[ end trace 0000000000000000 ]---
         ok 6 negative dst
     # drm_test_rect_calc_hscale: pass:6 fail:0 skip:0 total:6
     ok 6 drm_test_rect_calc_hscale
         KTAP version 1
         # Subtest: drm_test_rect_calc_vscale
         ok 1 normal use
         ok 2 out of max range
         ok 3 out of min range
         ok 4 zero dst
------------[ cut here ]------------
WARNING: CPU: 1 PID: 894 at drivers/gpu/drm/drm_rect.c:137 
drm_rect_calc_vscale+0x6e/0x78
Modules linked in: drm_rect_test drm_framebuffer_test drm_kunit_helpers 
drm_buddy_test drm_buddy kunit ghash_generic gf128mul gcm ccm algif_aead 
des_generic libdes ctr cbc ecb algif_skcipher aes_generic libaes cmac 
sha3_generic sha512_generic sha1_generic md5 af_packet iwl3945 iwlegacy 
mac80211 libarc4 radeon uhci_hcd acpi_cpufreq snd_hda_intel ehci_pci 
ehci_hcd snd_intel_dspcfg snd_hda_codec thinkpad_acpi usbcore cfg80211 
drm_suballoc_helper drm_ttm_helper ttm snd_hwdep i2c_algo_bit nvram 
platform_profile drm_exec sparse_keymap rfkill drm_display_helper 
snd_hda_core usb_common video snd_pcm input_leds wmi processor snd_timer 
ac backlight joydev evdev battery snd thermal button soundcore 
pkcs8_key_parser coretemp hwmon fuse loop dm_mod configfs
CPU: 1 UID: 0 PID: 894 Comm: kunit_try_catch Tainted: G        W 
N  6.16.0-rc6-P3 #1 PREEMPTLAZY
Tainted: [W]=WARN, [N]=TEST
Hardware name: LENOVO 2007F2G/2007F2G, BIOS 79ETE7WW (2.27 ) 03/21/2011
EIP: drm_rect_calc_vscale+0x6e/0x78
Code: 39 d0 be de ff ff ff 89 c2 0f 4f d6 3b 45 f0 0f 4c d6 85 c0 0f 48 
d0 39 cf 0f 44 d0 89 d0 83 c4 04 5e 5f 5b 5d 31 c9 31 d2 c3 <0f> 0b b8 
ea ff ff ff eb cd 90 55 89 e5 53 57 56 83 ec 10 8b 32 8b
EAX: ffff0000 EBX: 00010000 ECX: 00000000 EDX: 7fffffff
ESI: ffff0000 EDI: 00010000 EBP: c5053ec8 ESP: c5053eb8
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: b63b8010 CR3: 01276000 CR4: 000006f0
Call Trace:
  drm_test_rect_calc_vscale+0x1e/0x80 [drm_rect_test]
  ? __switch_to_asm+0x59/0xf0
  ? __switch_to_asm+0x53/0xf0
  kunit_try_run_case+0x70/0x184 [kunit]
  ? __switch_to_asm+0x2f/0xf0
  ? schedule+0x52/0x78
  ? _raw_spin_unlock_irqrestore+0xb/0x2c
  kunit_generic_run_threadfn_adapter+0x18/0x2c [kunit]
  kthread+0x197/0x1c4
  ? _raw_spin_unlock_irq+0x8/0x20
  ? kunit_try_catch_run+0x1c4/0x1c4 [kunit]
  ? calculate_sigpending+0x2a/0x30
  ? kthread_blkcg+0x24/0x24
  ? kthread_blkcg+0x24/0x24
  ret_from_fork+0x79/0xcc
  ret_from_fork_asm+0x12/0x18
  entry_INT80_32+0xf0/0xf0
---[ end trace 0000000000000000 ]---
         ok 5 negative src
------------[ cut here ]------------
WARNING: CPU: 0 PID: 896 at drivers/gpu/drm/drm_rect.c:137 
drm_rect_calc_vscale+0x6e/0x78
Modules linked in: drm_rect_test drm_framebuffer_test drm_kunit_helpers 
drm_buddy_test drm_buddy kunit ghash_generic gf128mul gcm ccm algif_aead 
des_generic libdes ctr cbc ecb algif_skcipher aes_generic libaes cmac 
sha3_generic sha512_generic sha1_generic md5 af_packet iwl3945 iwlegacy 
mac80211 libarc4 radeon uhci_hcd acpi_cpufreq snd_hda_intel ehci_pci 
ehci_hcd snd_intel_dspcfg snd_hda_codec thinkpad_acpi usbcore cfg80211 
drm_suballoc_helper drm_ttm_helper ttm snd_hwdep i2c_algo_bit nvram 
platform_profile drm_exec sparse_keymap rfkill drm_display_helper 
snd_hda_core usb_common video snd_pcm input_leds wmi processor snd_timer 
ac backlight joydev evdev battery snd thermal button soundcore 
pkcs8_key_parser coretemp hwmon fuse loop dm_mod configfs
CPU: 0 UID: 0 PID: 896 Comm: kunit_try_catch Tainted: G        W 
N  6.16.0-rc6-P3 #1 PREEMPTLAZY
Tainted: [W]=WARN, [N]=TEST
Hardware name: LENOVO 2007F2G/2007F2G, BIOS 79ETE7WW (2.27 ) 03/21/2011
EIP: drm_rect_calc_vscale+0x6e/0x78
Code: 39 d0 be de ff ff ff 89 c2 0f 4f d6 3b 45 f0 0f 4c d6 85 c0 0f 48 
d0 39 cf 0f 44 d0 89 d0 83 c4 04 5e 5f 5b 5d 31 c9 31 d2 c3 <0f> 0b b8 
ea ff ff ff eb cd 90 55 89 e5 53 57 56 83 ec 10 8b 32 8b
EAX: ffff0000 EBX: ffff0000 ECX: 00000000 EDX: 7fffffff
ESI: 00010000 EDI: ffff0000 EBP: c7361ec8 ESP: c7361eb8
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: b7c9fcd6 CR3: 01276000 CR4: 000006f0
Call Trace:
  drm_test_rect_calc_vscale+0x1e/0x80 [drm_rect_test]
  ? __switch_to_asm+0x59/0xf0
  ? __switch_to_asm+0x53/0xf0
  kunit_try_run_case+0x70/0x184 [kunit]
  ? __switch_to_asm+0x2f/0xf0
  ? schedule+0x52/0x78
  ? _raw_spin_unlock_irqrestore+0xb/0x2c
  kunit_generic_run_threadfn_adapter+0x18/0x2c [kunit]
  kthread+0x197/0x1c4
  ? _raw_spin_unlock_irq+0x8/0x20
  ? kunit_try_catch_run+0x1c4/0x1c4 [kunit]
  ? calculate_sigpending+0x2a/0x30
  ? kthread_blkcg+0x24/0x24
  ? kthread_blkcg+0x24/0x24
  ret_from_fork+0x79/0xcc
  ret_from_fork_asm+0x12/0x18
  entry_INT80_32+0xf0/0xf0
---[ end trace 0000000000000000 ]---
         ok 6 negative dst
     # drm_test_rect_calc_vscale: pass:6 fail:0 skip:0 total:6
     ok 7 drm_test_rect_calc_vscale
         KTAP version 1
         # Subtest: drm_test_rect_rotate
         ok 1 reflect-x
         ok 2 reflect-y
         ok 3 rotate-0
         ok 4 rotate-90
         ok 5 rotate-180
         ok 6 rotate-270
     # drm_test_rect_rotate: pass:6 fail:0 skip:0 total:6
     ok 8 drm_test_rect_rotate
         KTAP version 1
         # Subtest: drm_test_rect_rotate_inv
         ok 1 reflect-x
         ok 2 reflect-y
         ok 3 rotate-0
         ok 4 rotate-90
         ok 5 rotate-180
         ok 6 rotate-270
     # drm_test_rect_rotate_inv: pass:6 fail:0 skip:0 total:6
     ok 9 drm_test_rect_rotate_inv
# drm_rect: pass:9 fail:0 skip:0 total:9
# Totals: pass:43 fail:0 skip:0 total:43
ok 1 drm_rect
KTAP version 1
1..1
     KTAP version 1
     # Subtest: drm_gem_shmem
     # module: drm_gem_shmem_test
     1..8
     ok 1 drm_gem_shmem_test_obj_create
     ok 2 drm_gem_shmem_test_obj_create_private
     ok 3 drm_gem_shmem_test_pin_pages
     ok 4 drm_gem_shmem_test_vmap
------------[ cut here ]------------
drm-kunit-mock-device 
drm_gem_shmem_test_get_pages_sgt.drm-kunit-mock-device: [drm] 
drm_WARN_ON(refcount_read(&shmem->pages_pin_count))
WARNING: CPU: 0 PID: 937 at drivers/gpu/drm/drm_gem_shmem_helper.c:180 
drm_gem_shmem_free+0x16c/0x19c
Modules linked in: drm_gem_shmem_test drm_rect_test drm_framebuffer_test 
drm_kunit_helpers drm_buddy_test drm_buddy kunit ghash_generic gf128mul 
gcm ccm algif_aead des_generic libdes ctr cbc ecb algif_skcipher 
aes_generic libaes cmac sha3_generic sha512_generic sha1_generic md5 
af_packet iwl3945 iwlegacy mac80211 libarc4 radeon uhci_hcd acpi_cpufreq 
snd_hda_intel ehci_pci ehci_hcd snd_intel_dspcfg snd_hda_codec 
thinkpad_acpi usbcore cfg80211 drm_suballoc_helper drm_ttm_helper ttm 
snd_hwdep i2c_algo_bit nvram platform_profile drm_exec sparse_keymap 
rfkill drm_display_helper snd_hda_core usb_common video snd_pcm 
input_leds wmi processor snd_timer ac backlight joydev evdev battery snd 
thermal button soundcore pkcs8_key_parser coretemp hwmon fuse loop 
dm_mod configfs
CPU: 0 UID: 0 PID: 937 Comm: kunit_try_catch Tainted: G        W 
N  6.16.0-rc6-P3 #1 PREEMPTLAZY
Tainted: [W]=WARN, [N]=TEST
Hardware name: LENOVO 2007F2G/2007F2G, BIOS 79ETE7WW (2.27 ) 03/21/2011
EIP: drm_gem_shmem_free+0x16c/0x19c
Code: 32 01 00 8b 4e 08 85 c9 74 03 8b 79 08 8b 4f 2c 85 c9 75 02 8b 0f 
68 21 b6 7b cc 51 50 68 03 10 7c cc e8 53 4f a4 ff 83 c4 10 <0f> 0b e9 
28 ff ff ff 31 c9 8b 51 2c 85 d2 75 02 8b 11 68 4a 1d 80
EAX: 00000000 EBX: c5c23710 ECX: 00000000 EDX: 00000000
ESI: c64f8e00 EDI: c64f9a00 EBP: c7357f08 ESP: c7357f00
DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010286
CR0: 80050033 CR2: b644ee20 CR3: 07350000 CR4: 000006f0
Call Trace:
  drm_gem_shmem_free_wrapper+0x8/0x3d0 [drm_gem_shmem_test]
  __kunit_action_free+0xe/0x14 [kunit]
  kunit_remove_resource+0x69/0x9c [kunit]
  kunit_cleanup+0x38/0x70 [kunit]
  kunit_try_run_case_cleanup+0x2e/0x38 [kunit]
  kunit_generic_run_threadfn_adapter+0x18/0x2c [kunit]
  kthread+0x197/0x1c4
  ? _raw_spin_unlock_irq+0x8/0x20
  ? kunit_try_catch_run+0x1c4/0x1c4 [kunit]
  ? calculate_sigpending+0x2a/0x30
  ? kthread_blkcg+0x24/0x24
  ? kthread_blkcg+0x24/0x24
  ret_from_fork+0x79/0xcc
  ret_from_fork_asm+0x12/0x18
  entry_INT80_32+0xf0/0xf0
---[ end trace 0000000000000000 ]---
     ok 5 drm_gem_shmem_test_get_pages_sgt
     ok 6 drm_gem_shmem_test_get_sg_table
     ok 7 drm_gem_shmem_test_madvise
     ok 8 drm_gem_shmem_test_purge
# drm_gem_shmem: pass:8 fail:0 skip:0 total:8
# Totals: pass:8 fail:0 skip:0 total:8
ok 1 drm_gem_shmem
[...]

The other drm_* tests pass (or fail), but without showing these warnings.

Kernel .config attached.

Regards,
Erhard
--------------YLYL0yEjb1B0QaqUkhYaFCUx
Content-Type: text/plain; charset=UTF-8; name="config_616-rc6_p3"
Content-Disposition: attachment; filename="config_616-rc6_p3"
Content-Transfer-Encoding: base64

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4
L3g4NiA2LjE2LjAtcmM2IEtlcm5lbCBDb25maWd1cmF0aW9uCiMKQ09ORklHX0NDX1ZFUlNJ
T05fVEVYVD0iY2xhbmcgdmVyc2lvbiAyMC4xLjciCkNPTkZJR19HQ0NfVkVSU0lPTj0wCkNP
TkZJR19DQ19JU19DTEFORz15CkNPTkZJR19DTEFOR19WRVJTSU9OPTIwMDEwNwpDT05GSUdf
QVNfSVNfTExWTT15CkNPTkZJR19BU19WRVJTSU9OPTIwMDEwNwpDT05GSUdfTERfVkVSU0lP
Tj0wCkNPTkZJR19MRF9JU19MTEQ9eQpDT05GSUdfTExEX1ZFUlNJT049MjAwMTA3CkNPTkZJ
R19SVVNUQ19WRVJTSU9OPTEwODcwMApDT05GSUdfUlVTVENfTExWTV9WRVJTSU9OPTIwMDEw
MQpDT05GSUdfQ0NfQ0FOX0xJTks9eQpDT05GSUdfQ0NfSEFTX0FTTV9HT1RPX09VVFBVVD15
CkNPTkZJR19DQ19IQVNfQVNNX0dPVE9fVElFRF9PVVRQVVQ9eQpDT05GSUdfVE9PTFNfU1VQ
UE9SVF9SRUxSPXkKQ09ORklHX0NDX0hBU19BU01fSU5MSU5FPXkKQ09ORklHX0NDX0hBU19O
T19QUk9GSUxFX0ZOX0FUVFI9eQpDT05GSUdfQ0NfSEFTX0NPVU5URURfQlk9eQpDT05GSUdf
UlVTVENfSEFTX0NPRVJDRV9QT0lOVEVFPXkKQ09ORklHX1BBSE9MRV9WRVJTSU9OPTEzMApD
T05GSUdfSVJRX1dPUks9eQpDT05GSUdfQlVJTERUSU1FX1RBQkxFX1NPUlQ9eQpDT05GSUdf
VEhSRUFEX0lORk9fSU5fVEFTSz15CgojCiMgR2VuZXJhbCBzZXR1cAojCkNPTkZJR19JTklU
X0VOVl9BUkdfTElNSVQ9MzIKIyBDT05GSUdfQ09NUElMRV9URVNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfV0VSUk9SIGlzIG5vdCBzZXQKQ09ORklHX0xPQ0FMVkVSU0lPTj0iLVAzIgojIENP
TkZJR19MT0NBTFZFUlNJT05fQVVUTyBpcyBub3Qgc2V0CkNPTkZJR19CVUlMRF9TQUxUPSIi
CkNPTkZJR19IQVZFX0tFUk5FTF9HWklQPXkKQ09ORklHX0hBVkVfS0VSTkVMX0JaSVAyPXkK
Q09ORklHX0hBVkVfS0VSTkVMX0xaTUE9eQpDT05GSUdfSEFWRV9LRVJORUxfWFo9eQpDT05G
SUdfSEFWRV9LRVJORUxfTFpPPXkKQ09ORklHX0hBVkVfS0VSTkVMX0xaND15CkNPTkZJR19I
QVZFX0tFUk5FTF9aU1REPXkKIyBDT05GSUdfS0VSTkVMX0daSVAgaXMgbm90IHNldAojIENP
TkZJR19LRVJORUxfQlpJUDIgaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfTFpNQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9YWiBpcyBub3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9M
Wk8gaXMgbm90IHNldAojIENPTkZJR19LRVJORUxfTFo0IGlzIG5vdCBzZXQKQ09ORklHX0tF
Uk5FTF9aU1REPXkKQ09ORklHX0RFRkFVTFRfSU5JVD0iIgpDT05GSUdfREVGQVVMVF9IT1NU
TkFNRT0iKG5vbmUpIgpDT05GSUdfU1lTVklQQz15CkNPTkZJR19TWVNWSVBDX1NZU0NUTD15
CkNPTkZJR19QT1NJWF9NUVVFVUU9eQpDT05GSUdfUE9TSVhfTVFVRVVFX1NZU0NUTD15CkNP
TkZJR19XQVRDSF9RVUVVRT15CkNPTkZJR19DUk9TU19NRU1PUllfQVRUQUNIPXkKIyBDT05G
SUdfQVVESVQgaXMgbm90IHNldApDT05GSUdfSEFWRV9BUkNIX0FVRElUU1lTQ0FMTD15Cgoj
CiMgSVJRIHN1YnN5c3RlbQojCkNPTkZJR19HRU5FUklDX0lSUV9QUk9CRT15CkNPTkZJR19H
RU5FUklDX0lSUV9TSE9XPXkKQ09ORklHX0dFTkVSSUNfSVJRX0VGRkVDVElWRV9BRkZfTUFT
Sz15CkNPTkZJR19HRU5FUklDX1BFTkRJTkdfSVJRPXkKQ09ORklHX0dFTkVSSUNfSVJRX01J
R1JBVElPTj15CkNPTkZJR19IQVJESVJRU19TV19SRVNFTkQ9eQpDT05GSUdfSVJRX0RPTUFJ
Tj15CkNPTkZJR19JUlFfRE9NQUlOX0hJRVJBUkNIWT15CkNPTkZJR19HRU5FUklDX01TSV9J
UlE9eQpDT05GSUdfR0VORVJJQ19JUlFfTUFUUklYX0FMTE9DQVRPUj15CkNPTkZJR19HRU5F
UklDX0lSUV9SRVNFUlZBVElPTl9NT0RFPXkKQ09ORklHX0lSUV9GT1JDRURfVEhSRUFESU5H
PXkKQ09ORklHX1NQQVJTRV9JUlE9eQojIENPTkZJR19HRU5FUklDX0lSUV9ERUJVR0ZTIGlz
IG5vdCBzZXQKIyBlbmQgb2YgSVJRIHN1YnN5c3RlbQoKQ09ORklHX0NMT0NLU09VUkNFX1dB
VENIRE9HPXkKQ09ORklHX0FSQ0hfQ0xPQ0tTT1VSQ0VfSU5JVD15CkNPTkZJR19HRU5FUklD
X1RJTUVfVlNZU0NBTEw9eQpDT05GSUdfR0VORVJJQ19DTE9DS0VWRU5UUz15CkNPTkZJR19H
RU5FUklDX0NMT0NLRVZFTlRTX0JST0FEQ0FTVD15CkNPTkZJR19HRU5FUklDX0NMT0NLRVZF
TlRTX0JST0FEQ0FTVF9JRExFPXkKQ09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFNfTUlOX0FE
SlVTVD15CkNPTkZJR19HRU5FUklDX0NNT1NfVVBEQVRFPXkKQ09ORklHX0hBVkVfUE9TSVhf
Q1BVX1RJTUVSU19UQVNLX1dPUks9eQpDT05GSUdfUE9TSVhfQ1BVX1RJTUVSU19UQVNLX1dP
Uks9eQpDT05GSUdfVElNRV9LVU5JVF9URVNUPW0KQ09ORklHX0NPTlRFWFRfVFJBQ0tJTkc9
eQpDT05GSUdfQ09OVEVYVF9UUkFDS0lOR19JRExFPXkKCiMKIyBUaW1lcnMgc3Vic3lzdGVt
CiMKQ09ORklHX1RJQ0tfT05FU0hPVD15CkNPTkZJR19OT19IWl9DT01NT049eQojIENPTkZJ
R19IWl9QRVJJT0RJQyBpcyBub3Qgc2V0CkNPTkZJR19OT19IWl9JRExFPXkKIyBDT05GSUdf
Tk9fSFogaXMgbm90IHNldApDT05GSUdfSElHSF9SRVNfVElNRVJTPXkKQ09ORklHX0NMT0NL
U09VUkNFX1dBVENIRE9HX01BWF9TS0VXX1VTPTEwMAojIGVuZCBvZiBUaW1lcnMgc3Vic3lz
dGVtCgpDT05GSUdfQlBGPXkKQ09ORklHX0hBVkVfRUJQRl9KSVQ9eQoKIwojIEJQRiBzdWJz
eXN0ZW0KIwpDT05GSUdfQlBGX1NZU0NBTEw9eQpDT05GSUdfQlBGX0pJVD15CkNPTkZJR19C
UEZfSklUX0FMV0FZU19PTj15CkNPTkZJR19CUEZfSklUX0RFRkFVTFRfT049eQpDT05GSUdf
QlBGX1VOUFJJVl9ERUZBVUxUX09GRj15CiMgQ09ORklHX0JQRl9QUkVMT0FEIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgQlBGIHN1YnN5c3RlbQoKQ09ORklHX1BSRUVNUFRfQlVJTEQ9eQpDT05G
SUdfQVJDSF9IQVNfUFJFRU1QVF9MQVpZPXkKIyBDT05GSUdfUFJFRU1QVF9OT05FIGlzIG5v
dCBzZXQKIyBDT05GSUdfUFJFRU1QVF9WT0xVTlRBUlkgaXMgbm90IHNldAojIENPTkZJR19Q
UkVFTVBUIGlzIG5vdCBzZXQKQ09ORklHX1BSRUVNUFRfTEFaWT15CiMgQ09ORklHX1BSRUVN
UFRfUlQgaXMgbm90IHNldApDT05GSUdfUFJFRU1QVF9DT1VOVD15CkNPTkZJR19QUkVFTVBU
SU9OPXkKIyBDT05GSUdfUFJFRU1QVF9EWU5BTUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NI
RURfQ09SRSBpcyBub3Qgc2V0CgojCiMgQ1BVL1Rhc2sgdGltZSBhbmQgc3RhdHMgYWNjb3Vu
dGluZwojCkNPTkZJR19USUNLX0NQVV9BQ0NPVU5USU5HPXkKIyBDT05GSUdfSVJRX1RJTUVf
QUNDT1VOVElORyBpcyBub3Qgc2V0CkNPTkZJR19CU0RfUFJPQ0VTU19BQ0NUPXkKQ09ORklH
X0JTRF9QUk9DRVNTX0FDQ1RfVjM9eQpDT05GSUdfVEFTS1NUQVRTPXkKQ09ORklHX1RBU0tf
REVMQVlfQUNDVD15CkNPTkZJR19UQVNLX1hBQ0NUPXkKQ09ORklHX1RBU0tfSU9fQUNDT1VO
VElORz15CiMgQ09ORklHX1BTSSBpcyBub3Qgc2V0CiMgZW5kIG9mIENQVS9UYXNrIHRpbWUg
YW5kIHN0YXRzIGFjY291bnRpbmcKCkNPTkZJR19DUFVfSVNPTEFUSU9OPXkKCiMKIyBSQ1Ug
U3Vic3lzdGVtCiMKQ09ORklHX1RSRUVfUkNVPXkKIyBDT05GSUdfUkNVX0VYUEVSVCBpcyBu
b3Qgc2V0CkNPTkZJR19UUkVFX1NSQ1U9eQpDT05GSUdfVEFTS1NfUkNVX0dFTkVSSUM9eQpD
T05GSUdfTkVFRF9UQVNLU19SQ1U9eQpDT05GSUdfVEFTS1NfUkNVPXkKQ09ORklHX1RBU0tT
X1RSQUNFX1JDVT15CkNPTkZJR19SQ1VfU1RBTExfQ09NTU9OPXkKQ09ORklHX1JDVV9ORUVE
X1NFR0NCTElTVD15CiMgZW5kIG9mIFJDVSBTdWJzeXN0ZW0KCiMgQ09ORklHX0lLQ09ORklH
IGlzIG5vdCBzZXQKIyBDT05GSUdfSUtIRUFERVJTIGlzIG5vdCBzZXQKQ09ORklHX0xPR19C
VUZfU0hJRlQ9MTYKQ09ORklHX0xPR19DUFVfTUFYX0JVRl9TSElGVD0xMwojIENPTkZJR19Q
UklOVEtfSU5ERVggaXMgbm90IHNldApDT05GSUdfSEFWRV9VTlNUQUJMRV9TQ0hFRF9DTE9D
Sz15CgojCiMgU2NoZWR1bGVyIGZlYXR1cmVzCiMKIyBDT05GSUdfVUNMQU1QX1RBU0sgaXMg
bm90IHNldAojIGVuZCBvZiBTY2hlZHVsZXIgZmVhdHVyZXMKCkNPTkZJR19BUkNIX1dBTlRf
QkFUQ0hFRF9VTk1BUF9UTEJfRkxVU0g9eQpDT05GSUdfQ0NfSU1QTElDSVRfRkFMTFRIUk9V
R0g9Ii1XaW1wbGljaXQtZmFsbHRocm91Z2giCkNPTkZJR19HQ0MxMF9OT19BUlJBWV9CT1VO
RFM9eQpDT05GSUdfR0NDX05PX1NUUklOR09QX09WRVJGTE9XPXkKQ09ORklHX1NMQUJfT0JK
X0VYVD15CkNPTkZJR19DR1JPVVBTPXkKQ09ORklHX1BBR0VfQ09VTlRFUj15CiMgQ09ORklH
X0NHUk9VUF9GQVZPUl9EWU5NT0RTIGlzIG5vdCBzZXQKQ09ORklHX01FTUNHPXkKIyBDT05G
SUdfTUVNQ0dfVjEgaXMgbm90IHNldApDT05GSUdfQkxLX0NHUk9VUD15CkNPTkZJR19DR1JP
VVBfV1JJVEVCQUNLPXkKQ09ORklHX0NHUk9VUF9TQ0hFRD15CkNPTkZJR19HUk9VUF9TQ0hF
RF9XRUlHSFQ9eQpDT05GSUdfRkFJUl9HUk9VUF9TQ0hFRD15CiMgQ09ORklHX0NGU19CQU5E
V0lEVEggaXMgbm90IHNldAojIENPTkZJR19SVF9HUk9VUF9TQ0hFRCBpcyBub3Qgc2V0CkNP
TkZJR19TQ0hFRF9NTV9DSUQ9eQpDT05GSUdfQ0dST1VQX1BJRFM9eQpDT05GSUdfQ0dST1VQ
X1JETUE9eQpDT05GSUdfQ0dST1VQX0RNRU09eQpDT05GSUdfQ0dST1VQX0ZSRUVaRVI9eQoj
IENPTkZJR19DR1JPVVBfSFVHRVRMQiBpcyBub3Qgc2V0CkNPTkZJR19DUFVTRVRTPXkKIyBD
T05GSUdfQ1BVU0VUU19WMSBpcyBub3Qgc2V0CkNPTkZJR19DR1JPVVBfREVWSUNFPXkKQ09O
RklHX0NHUk9VUF9DUFVBQ0NUPXkKQ09ORklHX0NHUk9VUF9QRVJGPXkKQ09ORklHX0NHUk9V
UF9CUEY9eQpDT05GSUdfQ0dST1VQX01JU0M9eQojIENPTkZJR19DR1JPVVBfREVCVUcgaXMg
bm90IHNldApDT05GSUdfU09DS19DR1JPVVBfREFUQT15CkNPTkZJR19OQU1FU1BBQ0VTPXkK
Q09ORklHX1VUU19OUz15CkNPTkZJR19USU1FX05TPXkKQ09ORklHX0lQQ19OUz15CkNPTkZJ
R19VU0VSX05TPXkKQ09ORklHX1BJRF9OUz15CkNPTkZJR19ORVRfTlM9eQojIENPTkZJR19D
SEVDS1BPSU5UX1JFU1RPUkUgaXMgbm90IHNldApDT05GSUdfU0NIRURfQVVUT0dST1VQPXkK
IyBDT05GSUdfUkVMQVkgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9JTklUUkQ9eQpDT05G
SUdfSU5JVFJBTUZTX1NPVVJDRT0iIgpDT05GSUdfUkRfR1pJUD15CiMgQ09ORklHX1JEX0Ja
SVAyIGlzIG5vdCBzZXQKIyBDT05GSUdfUkRfTFpNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1JE
X1haIGlzIG5vdCBzZXQKIyBDT05GSUdfUkRfTFpPIGlzIG5vdCBzZXQKIyBDT05GSUdfUkRf
TFo0IGlzIG5vdCBzZXQKQ09ORklHX1JEX1pTVEQ9eQojIENPTkZJR19CT09UX0NPTkZJRyBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOSVRSQU1GU19QUkVTRVJWRV9NVElNRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0NDX09QVElNSVpFX0ZPUl9QRVJGT1JNQU5DRSBpcyBub3Qgc2V0CkNPTkZJ
R19DQ19PUFRJTUlaRV9GT1JfU0laRT15CkNPTkZJR19MRF9PUlBIQU5fV0FSTj15CkNPTkZJ
R19MRF9PUlBIQU5fV0FSTl9MRVZFTD0id2FybiIKQ09ORklHX1NZU0NUTD15CkNPTkZJR19I
QVZFX1VJRDE2PXkKQ09ORklHX1NZU0NUTF9FWENFUFRJT05fVFJBQ0U9eQojIENPTkZJR19T
WVNGU19TWVNDQUxMIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfUENTUEtSX1BMQVRGT1JNPXkK
Q09ORklHX0VYUEVSVD15CkNPTkZJR19VSUQxNj15CkNPTkZJR19NVUxUSVVTRVI9eQojIENP
TkZJR19TR0VUTUFTS19TWVNDQUxMIGlzIG5vdCBzZXQKQ09ORklHX0ZIQU5ETEU9eQpDT05G
SUdfUE9TSVhfVElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNPTkZJR19CVUc9eQpDT05GSUdf
RUxGX0NPUkU9eQojIENPTkZJR19QQ1NQS1JfUExBVEZPUk0gaXMgbm90IHNldApDT05GSUdf
QkFTRV9TTUFMTD15CkNPTkZJR19GVVRFWD15CkNPTkZJR19GVVRFWF9QST15CkNPTkZJR19F
UE9MTD15CkNPTkZJR19TSUdOQUxGRD15CkNPTkZJR19USU1FUkZEPXkKQ09ORklHX0VWRU5U
RkQ9eQpDT05GSUdfU0hNRU09eQpDT05GSUdfQUlPPXkKQ09ORklHX0lPX1VSSU5HPXkKQ09O
RklHX0FEVklTRV9TWVNDQUxMUz15CkNPTkZJR19NRU1CQVJSSUVSPXkKQ09ORklHX0tDTVA9
eQpDT05GSUdfUlNFUT15CiMgQ09ORklHX0RFQlVHX1JTRVEgaXMgbm90IHNldApDT05GSUdf
Q0FDSEVTVEFUX1NZU0NBTEw9eQojIENPTkZJR19QQzEwNCBpcyBub3Qgc2V0CkNPTkZJR19L
QUxMU1lNUz15CiMgQ09ORklHX0tBTExTWU1TX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfS0FMTFNZTVNfQUxMIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX01FTUJBUlJJRVJf
U1lOQ19DT1JFPXkKQ09ORklHX0hBVkVfUEVSRl9FVkVOVFM9eQoKIwojIEtlcm5lbCBQZXJm
b3JtYW5jZSBFdmVudHMgQW5kIENvdW50ZXJzCiMKQ09ORklHX1BFUkZfRVZFTlRTPXkKIyBD
T05GSUdfREVCVUdfUEVSRl9VU0VfVk1BTExPQyBpcyBub3Qgc2V0CiMgZW5kIG9mIEtlcm5l
bCBQZXJmb3JtYW5jZSBFdmVudHMgQW5kIENvdW50ZXJzCgpDT05GSUdfU1lTVEVNX0RBVEFf
VkVSSUZJQ0FUSU9OPXkKIyBDT05GSUdfUFJPRklMSU5HIGlzIG5vdCBzZXQKCiMKIyBLZXhl
YyBhbmQgY3Jhc2ggZmVhdHVyZXMKIwojIENPTkZJR19LRVhFQyBpcyBub3Qgc2V0CiMgZW5k
IG9mIEtleGVjIGFuZCBjcmFzaCBmZWF0dXJlcwojIGVuZCBvZiBHZW5lcmFsIHNldHVwCgoj
IENPTkZJR182NEJJVCBpcyBub3Qgc2V0CkNPTkZJR19YODZfMzI9eQpDT05GSUdfWDg2PXkK
Q09ORklHX0lOU1RSVUNUSU9OX0RFQ09ERVI9eQpDT05GSUdfT1VUUFVUX0ZPUk1BVD0iZWxm
MzItaTM4NiIKQ09ORklHX0xPQ0tERVBfU1VQUE9SVD15CkNPTkZJR19TVEFDS1RSQUNFX1NV
UFBPUlQ9eQpDT05GSUdfTU1VPXkKQ09ORklHX0FSQ0hfTU1BUF9STkRfQklUU19NSU49OApD
T05GSUdfQVJDSF9NTUFQX1JORF9CSVRTX01BWD0xNgpDT05GSUdfQVJDSF9NTUFQX1JORF9D
T01QQVRfQklUU19NSU49OApDT05GSUdfQVJDSF9NTUFQX1JORF9DT01QQVRfQklUU19NQVg9
MTYKQ09ORklHX0dFTkVSSUNfSVNBX0RNQT15CkNPTkZJR19HRU5FUklDX0JVRz15CkNPTkZJ
R19BUkNIX01BWV9IQVZFX1BDX0ZEQz15CkNPTkZJR19HRU5FUklDX0NBTElCUkFURV9ERUxB
WT15CkNPTkZJR19BUkNIX0hBU19DUFVfUkVMQVg9eQpDT05GSUdfQVJDSF9ISUJFUk5BVElP
Tl9QT1NTSUJMRT15CkNPTkZJR19BUkNIX1NVU1BFTkRfUE9TU0lCTEU9eQpDT05GSUdfQVJD
SF9TVVBQT1JUU19VUFJPQkVTPXkKQ09ORklHX0ZJWF9FQVJMWUNPTl9NRU09eQpDT05GSUdf
UEdUQUJMRV9MRVZFTFM9MwoKIwojIFByb2Nlc3NvciB0eXBlIGFuZCBmZWF0dXJlcwojCkNP
TkZJR19TTVA9eQpDT05GSUdfWDg2X01QUEFSU0U9eQojIENPTkZJR19YODZfQ1BVX1JFU0NU
UkwgaXMgbm90IHNldAojIENPTkZJR19YODZfRVhURU5ERURfUExBVEZPUk0gaXMgbm90IHNl
dAojIENPTkZJR19YODZfSU5URUxfTFBTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9BTURf
UExBVEZPUk1fREVWSUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfSU9TRl9NQkkgaXMgbm90IHNl
dApDT05GSUdfWDg2X1NVUFBPUlRTX01FTU9SWV9GQUlMVVJFPXkKIyBDT05GSUdfWDg2XzMy
X0lSSVMgaXMgbm90IHNldApDT05GSUdfU0NIRURfT01JVF9GUkFNRV9QT0lOVEVSPXkKQ09O
RklHX0hZUEVSVklTT1JfR1VFU1Q9eQojIENPTkZJR19QQVJBVklSVCBpcyBub3Qgc2V0CkNP
TkZJR19BUkNIX0NQVUlETEVfSEFMVFBPTEw9eQojIENPTkZJR19QVkggaXMgbm90IHNldAoj
IENPTkZJR19NNDg2U1ggaXMgbm90IHNldAojIENPTkZJR19NNDg2IGlzIG5vdCBzZXQKIyBD
T05GSUdfTTU4NiBpcyBub3Qgc2V0CiMgQ09ORklHX001ODZUU0MgaXMgbm90IHNldAojIENP
TkZJR19NNTg2TU1YIGlzIG5vdCBzZXQKIyBDT05GSUdfTTY4NiBpcyBub3Qgc2V0CiMgQ09O
RklHX01QRU5USVVNSUkgaXMgbm90IHNldApDT05GSUdfTVBFTlRJVU1JSUk9eQojIENPTkZJ
R19NUEVOVElVTU0gaXMgbm90IHNldAojIENPTkZJR19NUEVOVElVTTQgaXMgbm90IHNldAoj
IENPTkZJR19NSzYgaXMgbm90IHNldAojIENPTkZJR19NSzcgaXMgbm90IHNldAojIENPTkZJ
R19NQ1JVU09FIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVGRklDRU9OIGlzIG5vdCBzZXQKIyBD
T05GSUdfTVdJTkNISVBDNiBpcyBub3Qgc2V0CiMgQ09ORklHX01XSU5DSElQM0QgaXMgbm90
IHNldAojIENPTkZJR19NRUxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX01HRU9ERUdYMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01HRU9ERV9MWCBpcyBub3Qgc2V0CiMgQ09ORklHX01DWVJJWElJ
SSBpcyBub3Qgc2V0CiMgQ09ORklHX01WSUFDM18yIGlzIG5vdCBzZXQKIyBDT05GSUdfTVZJ
QUM3IGlzIG5vdCBzZXQKIyBDT05GSUdfTUFUT00gaXMgbm90IHNldApDT05GSUdfQ0NfSEFT
X01BUkNIX05BVElWRT15CiMgQ09ORklHX1g4Nl9HRU5FUklDIGlzIG5vdCBzZXQKQ09ORklH
X1g4Nl9JTlRFUk5PREVfQ0FDSEVfU0hJRlQ9NQpDT05GSUdfWDg2X0wxX0NBQ0hFX1NISUZU
PTUKQ09ORklHX1g4Nl9JTlRFTF9VU0VSQ09QWT15CkNPTkZJR19YODZfVVNFX1BQUk9fQ0hF
Q0tTVU09eQpDT05GSUdfWDg2X1RTQz15CkNPTkZJR19YODZfSEFWRV9QQUU9eQpDT05GSUdf
WDg2X0NYOD15CkNPTkZJR19YODZfQ01PVj15CkNPTkZJR19YODZfTUlOSU1VTV9DUFVfRkFN
SUxZPTYKQ09ORklHX1g4Nl9ERUJVR0NUTE1TUj15CkNPTkZJR19JQTMyX0ZFQVRfQ1RMPXkK
Q09ORklHX1g4Nl9WTVhfRkVBVFVSRV9OQU1FUz15CkNPTkZJR19QUk9DRVNTT1JfU0VMRUNU
PXkKQ09ORklHX0NQVV9TVVBfSU5URUw9eQojIENPTkZJR19DUFVfU1VQX0NZUklYXzMyIGlz
IG5vdCBzZXQKIyBDT05GSUdfQ1BVX1NVUF9BTUQgaXMgbm90IHNldAojIENPTkZJR19DUFVf
U1VQX0hZR09OIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX1NVUF9DRU5UQVVSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1BVX1NVUF9UUkFOU01FVEFfMzIgaXMgbm90IHNldAojIENPTkZJR19D
UFVfU1VQX1VNQ18zMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9TVVBfWkhBT1hJTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NQVV9TVVBfVk9SVEVYXzMyIGlzIG5vdCBzZXQKQ09ORklHX0hQ
RVRfVElNRVI9eQpDT05GSUdfSFBFVF9FTVVMQVRFX1JUQz15CkNPTkZJR19ETUk9eQpDT05G
SUdfQk9PVF9WRVNBX1NVUFBPUlQ9eQpDT05GSUdfTlJfQ1BVU19SQU5HRV9CRUdJTj0yCkNP
TkZJR19OUl9DUFVTX1JBTkdFX0VORD04CkNPTkZJR19OUl9DUFVTX0RFRkFVTFQ9OApDT05G
SUdfTlJfQ1BVUz0yCiMgQ09ORklHX1NDSEVEX0NMVVNURVIgaXMgbm90IHNldApDT05GSUdf
U0NIRURfU01UPXkKQ09ORklHX1NDSEVEX01DPXkKIyBDT05GSUdfU0NIRURfTUNfUFJJTyBp
cyBub3Qgc2V0CkNPTkZJR19YODZfTE9DQUxfQVBJQz15CkNPTkZJR19YODZfSU9fQVBJQz15
CiMgQ09ORklHX1g4Nl9SRVJPVVRFX0ZPUl9CUk9LRU5fQk9PVF9JUlFTIGlzIG5vdCBzZXQK
Q09ORklHX1g4Nl9NQ0U9eQojIENPTkZJR19YODZfTUNFTE9HX0xFR0FDWSBpcyBub3Qgc2V0
CkNPTkZJR19YODZfTUNFX0lOVEVMPXkKIyBDT05GSUdfWDg2X01DRV9BTUQgaXMgbm90IHNl
dAojIENPTkZJR19YODZfQU5DSUVOVF9NQ0UgaXMgbm90IHNldApDT05GSUdfWDg2X01DRV9U
SFJFU0hPTEQ9eQojIENPTkZJR19YODZfTUNFX0lOSkVDVCBpcyBub3Qgc2V0CgojCiMgUGVy
Zm9ybWFuY2UgbW9uaXRvcmluZwojCkNPTkZJR19QRVJGX0VWRU5UU19JTlRFTF9VTkNPUkU9
eQpDT05GSUdfUEVSRl9FVkVOVFNfSU5URUxfUkFQTD15CkNPTkZJR19QRVJGX0VWRU5UU19J
TlRFTF9DU1RBVEU9eQojIGVuZCBvZiBQZXJmb3JtYW5jZSBtb25pdG9yaW5nCgojIENPTkZJ
R19YODZfTEVHQUNZX1ZNODYgaXMgbm90IHNldAojIENPTkZJR19YODZfSU9QTF9JT1BFUk0g
aXMgbm90IHNldAojIENPTkZJR19UT1NISUJBIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X1JF
Qk9PVEZJWFVQUyBpcyBub3Qgc2V0CkNPTkZJR19NSUNST0NPREU9eQpDT05GSUdfTUlDUk9D
T0RFX0lOSVRSRDMyPXkKIyBDT05GSUdfTUlDUk9DT0RFX0xBVEVfTE9BRElORyBpcyBub3Qg
c2V0CiMgQ09ORklHX1g4Nl9NU1IgaXMgbm90IHNldApDT05GSUdfWDg2X0NQVUlEPW0KQ09O
RklHX0hJR0hNRU00Rz15CkNPTkZJR19WTVNQTElUXzNHPXkKIyBDT05GSUdfVk1TUExJVF8y
RyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNU1BMSVRfMUcgaXMgbm90IHNldApDT05GSUdfUEFH
RV9PRkZTRVQ9MHhDMDAwMDAwMApDT05GSUdfSElHSE1FTT15CkNPTkZJR19YODZfUEFFPXkK
IyBDT05GSUdfWDg2X0NQQV9TVEFUSVNUSUNTIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfRkxB
VE1FTV9FTkFCTEU9eQpDT05GSUdfQVJDSF9TUEFSU0VNRU1fRU5BQkxFPXkKQ09ORklHX0FS
Q0hfU0VMRUNUX01FTU9SWV9NT0RFTD15CkNPTkZJR19JTExFR0FMX1BPSU5URVJfVkFMVUU9
MAojIENPTkZJR19YODZfUE1FTV9MRUdBQ1kgaXMgbm90IHNldAojIENPTkZJR19YODZfQ0hF
Q0tfQklPU19DT1JSVVBUSU9OIGlzIG5vdCBzZXQKQ09ORklHX01UUlI9eQpDT05GSUdfTVRS
Ul9TQU5JVElaRVI9eQpDT05GSUdfTVRSUl9TQU5JVElaRVJfRU5BQkxFX0RFRkFVTFQ9MQpD
T05GSUdfTVRSUl9TQU5JVElaRVJfU1BBUkVfUkVHX05SX0RFRkFVTFQ9MQpDT05GSUdfWDg2
X1BBVD15CiMgQ09ORklHX1g4Nl9VTUlQIGlzIG5vdCBzZXQKQ09ORklHX0NDX0hBU19JQlQ9
eQpDT05GSUdfQVJDSF9QS0VZX0JJVFM9NApDT05GSUdfWDg2X0lOVEVMX1RTWF9NT0RFX09G
Rj15CiMgQ09ORklHX1g4Nl9JTlRFTF9UU1hfTU9ERV9PTiBpcyBub3Qgc2V0CiMgQ09ORklH
X1g4Nl9JTlRFTF9UU1hfTU9ERV9BVVRPIGlzIG5vdCBzZXQKIyBDT05GSUdfRUZJIGlzIG5v
dCBzZXQKIyBDT05GSUdfSFpfMTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSFpfMjUwIGlzIG5v
dCBzZXQKQ09ORklHX0haXzMwMD15CiMgQ09ORklHX0haXzEwMDAgaXMgbm90IHNldApDT05G
SUdfSFo9MzAwCkNPTkZJR19TQ0hFRF9IUlRJQ0s9eQpDT05GSUdfQVJDSF9TVVBQT1JUU19L
RVhFQz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tFWEVDX1BVUkdBVE9SWT15CkNPTkZJR19B
UkNIX1NVUFBPUlRTX0tFWEVDX1NJRz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tFWEVDX1NJ
R19GT1JDRT15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tFWEVDX0JaSU1BR0VfVkVSSUZZX1NJ
Rz15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tFWEVDX0pVTVA9eQpDT05GSUdfQVJDSF9TVVBQ
T1JUU19DUkFTSF9EVU1QPXkKQ09ORklHX0FSQ0hfREVGQVVMVF9DUkFTSF9EVU1QPXkKQ09O
RklHX0FSQ0hfU1VQUE9SVFNfQ1JBU0hfSE9UUExVRz15CkNPTkZJR19QSFlTSUNBTF9TVEFS
VD0weDEwMDAwMDAKQ09ORklHX1JFTE9DQVRBQkxFPXkKQ09ORklHX1JBTkRPTUlaRV9CQVNF
PXkKQ09ORklHX1g4Nl9ORUVEX1JFTE9DUz15CkNPTkZJR19QSFlTSUNBTF9BTElHTj0weDIw
MDAwMApDT05GSUdfSE9UUExVR19DUFU9eQojIENPTkZJR19DT01QQVRfVkRTTyBpcyBub3Qg
c2V0CiMgQ09ORklHX0NNRExJTkVfQk9PTCBpcyBub3Qgc2V0CiMgQ09ORklHX01PRElGWV9M
RFRfU1lTQ0FMTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUUklDVF9TSUdBTFRTVEFDS19TSVpF
IGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0JVU19MT0NLX0RFVEVDVCBpcyBub3Qgc2V0CiMg
ZW5kIG9mIFByb2Nlc3NvciB0eXBlIGFuZCBmZWF0dXJlcwoKQ09ORklHX0NDX0hBU19OQU1F
RF9BU19GSVhFRF9TQU5JVElaRVJTPXkKQ09ORklHX0NDX0hBU19TTFM9eQpDT05GSUdfQ0Nf
SEFTX1JFVFVSTl9USFVOSz15CkNPTkZJR19DQ19IQVNfRU5UUllfUEFERElORz15CkNPTkZJ
R19GVU5DVElPTl9QQURESU5HX0NGST0wCkNPTkZJR19GVU5DVElPTl9QQURESU5HX0JZVEVT
PTQKQ09ORklHX0NQVV9NSVRJR0FUSU9OUz15CkNPTkZJR19NSVRJR0FUSU9OX1BBR0VfVEFC
TEVfSVNPTEFUSU9OPXkKQ09ORklHX01JVElHQVRJT05fUkVUUE9MSU5FPXkKIyBDT05GSUdf
TUlUSUdBVElPTl9SRVRIVU5LIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlUSUdBVElPTl9HRFMg
aXMgbm90IHNldAojIENPTkZJR19NSVRJR0FUSU9OX1JGRFMgaXMgbm90IHNldAojIENPTkZJ
R19NSVRJR0FUSU9OX1NQRUNUUkVfQkhJIGlzIG5vdCBzZXQKQ09ORklHX01JVElHQVRJT05f
TURTPXkKIyBDT05GSUdfTUlUSUdBVElPTl9UQUEgaXMgbm90IHNldAojIENPTkZJR19NSVRJ
R0FUSU9OX01NSU9fU1RBTEVfREFUQSBpcyBub3Qgc2V0CkNPTkZJR19NSVRJR0FUSU9OX0wx
VEY9eQojIENPTkZJR19NSVRJR0FUSU9OX1JFVEJMRUVEIGlzIG5vdCBzZXQKQ09ORklHX01J
VElHQVRJT05fU1BFQ1RSRV9WMT15CkNPTkZJR19NSVRJR0FUSU9OX1NQRUNUUkVfVjI9eQoj
IENPTkZJR19NSVRJR0FUSU9OX1NSQkRTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlUSUdBVElP
Tl9TU0IgaXMgbm90IHNldAoKIwojIFBvd2VyIG1hbmFnZW1lbnQgYW5kIEFDUEkgb3B0aW9u
cwojCkNPTkZJR19TVVNQRU5EPXkKQ09ORklHX1NVU1BFTkRfRlJFRVpFUj15CiMgQ09ORklH
X1NVU1BFTkRfU0tJUF9TWU5DIGlzIG5vdCBzZXQKIyBDT05GSUdfSElCRVJOQVRJT04gaXMg
bm90IHNldApDT05GSUdfUE1fU0xFRVA9eQpDT05GSUdfUE1fU0xFRVBfU01QPXkKQ09ORklH
X1BNX0FVVE9TTEVFUD15CiMgQ09ORklHX1BNX1VTRVJTUEFDRV9BVVRPU0xFRVAgaXMgbm90
IHNldAojIENPTkZJR19QTV9XQUtFTE9DS1MgaXMgbm90IHNldApDT05GSUdfUE09eQojIENP
TkZJR19QTV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19QTV9DTEs9eQpDT05GSUdfV1FfUE9X
RVJfRUZGSUNJRU5UX0RFRkFVTFQ9eQpDT05GSUdfRU5FUkdZX01PREVMPXkKQ09ORklHX0FS
Q0hfU1VQUE9SVFNfQUNQST15CkNPTkZJR19BQ1BJPXkKQ09ORklHX0FDUElfTEVHQUNZX1RB
QkxFU19MT09LVVA9eQpDT05GSUdfQVJDSF9NSUdIVF9IQVZFX0FDUElfUERDPXkKQ09ORklH
X0FDUElfU1lTVEVNX1BPV0VSX1NUQVRFU19TVVBQT1JUPXkKQ09ORklHX0FDUElfVEhFUk1B
TF9MSUI9eQojIENPTkZJR19BQ1BJX0RFQlVHR0VSIGlzIG5vdCBzZXQKQ09ORklHX0FDUElf
U1BDUl9UQUJMRT15CkNPTkZJR19BQ1BJX1NMRUVQPXkKIyBDT05GSUdfQUNQSV9SRVZfT1ZF
UlJJREVfUE9TU0lCTEUgaXMgbm90IHNldApDT05GSUdfQUNQSV9FQz15CiMgQ09ORklHX0FD
UElfRUNfREVCVUdGUyBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0FDPW0KQ09ORklHX0FDUElf
QkFUVEVSWT1tCkNPTkZJR19BQ1BJX0JVVFRPTj1tCiMgQ09ORklHX0FDUElfVElOWV9QT1dF
Ul9CVVRUT04gaXMgbm90IHNldApDT05GSUdfQUNQSV9WSURFTz1tCkNPTkZJR19BQ1BJX0ZB
Tj1tCiMgQ09ORklHX0FDUElfVEFEIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9ET0NLIGlz
IG5vdCBzZXQKQ09ORklHX0FDUElfQ1BVX0ZSRVFfUFNTPXkKQ09ORklHX0FDUElfUFJPQ0VT
U09SX0NTVEFURT15CkNPTkZJR19BQ1BJX1BST0NFU1NPUl9JRExFPXkKQ09ORklHX0FDUElf
UFJPQ0VTU09SPW0KQ09ORklHX0FDUElfSE9UUExVR19DUFU9eQojIENPTkZJR19BQ1BJX1BS
T0NFU1NPUl9BR0dSRUdBVE9SIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfVEhFUk1BTD1tCkNP
TkZJR19BQ1BJX1BMQVRGT1JNX1BST0ZJTEU9bQpDT05GSUdfQVJDSF9IQVNfQUNQSV9UQUJM
RV9VUEdSQURFPXkKQ09ORklHX0FDUElfVEFCTEVfVVBHUkFERT15CiMgQ09ORklHX0FDUElf
REVCVUcgaXMgbm90IHNldAojIENPTkZJR19BQ1BJX1BDSV9TTE9UIGlzIG5vdCBzZXQKQ09O
RklHX0FDUElfQ09OVEFJTkVSPXkKQ09ORklHX0FDUElfSE9UUExVR19JT0FQSUM9eQpDT05G
SUdfQUNQSV9TQlM9bQojIENPTkZJR19BQ1BJX0hFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0FD
UElfUkVEVUNFRF9IQVJEV0FSRV9PTkxZIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfTkhMVD15
CkNPTkZJR19IQVZFX0FDUElfQVBFST15CkNPTkZJR19IQVZFX0FDUElfQVBFSV9OTUk9eQoj
IENPTkZJR19BQ1BJX0FQRUkgaXMgbm90IHNldAojIENPTkZJR19BQ1BJX0RQVEYgaXMgbm90
IHNldAojIENPTkZJR19BQ1BJX0NPTkZJR0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNQSV9G
RkggaXMgbm90IHNldAojIENPTkZJR19QTUlDX09QUkVHSU9OIGlzIG5vdCBzZXQKQ09ORklH
X1g4Nl9QTV9USU1FUj15CiMgQ09ORklHX0FQTSBpcyBub3Qgc2V0CgojCiMgQ1BVIEZyZXF1
ZW5jeSBzY2FsaW5nCiMKQ09ORklHX0NQVV9GUkVRPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9B
VFRSX1NFVD15CiMgQ09ORklHX0NQVV9GUkVRX1NUQVQgaXMgbm90IHNldAojIENPTkZJR19D
UFVfRlJFUV9ERUZBVUxUX0dPVl9QRVJGT1JNQU5DRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQ
VV9GUkVRX0RFRkFVTFRfR09WX1BPV0VSU0FWRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9G
UkVRX0RFRkFVTFRfR09WX1VTRVJTUEFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVR
X0RFRkFVTFRfR09WX09OREVNQU5EIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVG
QVVMVF9HT1ZfQ09OU0VSVkFUSVZFIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9GUkVRX0RFRkFV
TFRfR09WX1NDSEVEVVRJTD15CkNPTkZJR19DUFVfRlJFUV9HT1ZfUEVSRk9STUFOQ0U9eQoj
IENPTkZJR19DUFVfRlJFUV9HT1ZfUE9XRVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BV
X0ZSRVFfR09WX1VTRVJTUEFDRSBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0dPVl9P
TkRFTUFORCBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVV9GUkVRX0dPVl9DT05TRVJWQVRJVkUg
aXMgbm90IHNldApDT05GSUdfQ1BVX0ZSRVFfR09WX1NDSEVEVVRJTD15CgojCiMgQ1BVIGZy
ZXF1ZW5jeSBzY2FsaW5nIGRyaXZlcnMKIwojIENPTkZJR19YODZfSU5URUxfUFNUQVRFIGlz
IG5vdCBzZXQKIyBDT05GSUdfWDg2X1BDQ19DUFVGUkVRIGlzIG5vdCBzZXQKIyBDT05GSUdf
WDg2X0FNRF9QU1RBVEUgaXMgbm90IHNldApDT05GSUdfWDg2X0FDUElfQ1BVRlJFUT1tCiMg
Q09ORklHX1g4Nl9QT1dFUk5PV19LNiBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9QT1dFUk5P
V19LNyBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9QT1dFUk5PV19LOCBpcyBub3Qgc2V0CiMg
Q09ORklHX1g4Nl9HWF9TVVNQTU9EIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X1NQRUVEU1RF
UF9DRU5UUklOTyBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9TUEVFRFNURVBfSUNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfWDg2X1NQRUVEU1RFUF9TTUkgaXMgbm90IHNldAojIENPTkZJR19Y
ODZfUDRfQ0xPQ0tNT0QgaXMgbm90IHNldAojIENPTkZJR19YODZfQ1BVRlJFUV9ORk9SQ0Uy
IGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0xPTkdSVU4gaXMgbm90IHNldAojIENPTkZJR19Y
ODZfTE9OR0hBVUwgaXMgbm90IHNldAojIENPTkZJR19YODZfRV9QT1dFUlNBVkVSIGlzIG5v
dCBzZXQKCiMKIyBzaGFyZWQgb3B0aW9ucwojCiMgQ09ORklHX0NQVUZSRVFfQVJDSF9DVVJf
RlJFUSBpcyBub3Qgc2V0CiMgZW5kIG9mIENQVSBGcmVxdWVuY3kgc2NhbGluZwoKIwojIENQ
VSBJZGxlCiMKQ09ORklHX0NQVV9JRExFPXkKIyBDT05GSUdfQ1BVX0lETEVfR09WX0xBRERF
UiBpcyBub3Qgc2V0CkNPTkZJR19DUFVfSURMRV9HT1ZfTUVOVT15CiMgQ09ORklHX0NQVV9J
RExFX0dPVl9URU8gaXMgbm90IHNldAojIGVuZCBvZiBDUFUgSWRsZQoKQ09ORklHX0lOVEVM
X0lETEU9eQojIGVuZCBvZiBQb3dlciBtYW5hZ2VtZW50IGFuZCBBQ1BJIG9wdGlvbnMKCiMK
IyBCdXMgb3B0aW9ucyAoUENJIGV0Yy4pCiMKIyBDT05GSUdfUENJX0dPQklPUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1BDSV9HT01NQ09ORklHIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX0dP
RElSRUNUIGlzIG5vdCBzZXQKQ09ORklHX1BDSV9HT0FOWT15CkNPTkZJR19QQ0lfQklPUz15
CkNPTkZJR19QQ0lfRElSRUNUPXkKQ09ORklHX1BDSV9NTUNPTkZJRz15CiMgQ09ORklHX1BD
SV9DTkIyMExFX1FVSVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfSVNBX0JVUyBpcyBub3Qgc2V0
CkNPTkZJR19JU0FfRE1BX0FQST15CiMgQ09ORklHX0lTQSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDeDIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0FMSVggaXMgbm90IHNldAojIENPTkZJR19O
RVQ1NTAxIGlzIG5vdCBzZXQKIyBDT05GSUdfR0VPUyBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1
cyBvcHRpb25zIChQQ0kgZXRjLikKCiMKIyBCaW5hcnkgRW11bGF0aW9ucwojCkNPTkZJR19D
T01QQVRfMzI9eQojIGVuZCBvZiBCaW5hcnkgRW11bGF0aW9ucwoKQ09ORklHX0hBVkVfQVRP
TUlDX0lPTUFQPXkKIyBDT05GSUdfVklSVFVBTElaQVRJT04gaXMgbm90IHNldApDT05GSUdf
WDg2X1JFUVVJUkVEX0ZFQVRVUkVfQUxXQVlTPXkKQ09ORklHX1g4Nl9SRVFVSVJFRF9GRUFU
VVJFX0NYOD15CkNPTkZJR19YODZfUkVRVUlSRURfRkVBVFVSRV9DTU9WPXkKQ09ORklHX1g4
Nl9SRVFVSVJFRF9GRUFUVVJFX0ZQVT15CkNPTkZJR19YODZfUkVRVUlSRURfRkVBVFVSRV9Q
QUU9eQpDT05GSUdfWDg2X0RJU0FCTEVEX0ZFQVRVUkVfVU1JUD15CkNPTkZJR19YODZfRElT
QUJMRURfRkVBVFVSRV9QQ0lEPXkKQ09ORklHX1g4Nl9ESVNBQkxFRF9GRUFUVVJFX1BLVT15
CkNPTkZJR19YODZfRElTQUJMRURfRkVBVFVSRV9PU1BLRT15CkNPTkZJR19YODZfRElTQUJM
RURfRkVBVFVSRV9SRVRIVU5LPXkKQ09ORklHX1g4Nl9ESVNBQkxFRF9GRUFUVVJFX1VOUkVU
PXkKQ09ORklHX1g4Nl9ESVNBQkxFRF9GRUFUVVJFX0NBTExfREVQVEg9eQpDT05GSUdfWDg2
X0RJU0FCTEVEX0ZFQVRVUkVfTEFNPXkKQ09ORklHX1g4Nl9ESVNBQkxFRF9GRUFUVVJFX0VO
UUNNRD15CkNPTkZJR19YODZfRElTQUJMRURfRkVBVFVSRV9TR1g9eQpDT05GSUdfWDg2X0RJ
U0FCTEVEX0ZFQVRVUkVfWEVOUFY9eQpDT05GSUdfWDg2X0RJU0FCTEVEX0ZFQVRVUkVfVERY
X0dVRVNUPXkKQ09ORklHX1g4Nl9ESVNBQkxFRF9GRUFUVVJFX1VTRVJfU0hTVEs9eQpDT05G
SUdfWDg2X0RJU0FCTEVEX0ZFQVRVUkVfSUJUPXkKQ09ORklHX1g4Nl9ESVNBQkxFRF9GRUFU
VVJFX0ZSRUQ9eQpDT05GSUdfWDg2X0RJU0FCTEVEX0ZFQVRVUkVfU0VWX1NOUD15CkNPTkZJ
R19YODZfRElTQUJMRURfRkVBVFVSRV9JTlZMUEdCPXkKQ09ORklHX0FTX0FWWDUxMj15CkNP
TkZJR19BU19HRk5JPXkKQ09ORklHX0FTX1ZBRVM9eQpDT05GSUdfQVNfVlBDTE1VTFFEUT15
CkNPTkZJR19BU19XUlVTUz15CkNPTkZJR19BUkNIX0NPTkZJR1VSRVNfQ1BVX01JVElHQVRJ
T05TPXkKCiMKIyBHZW5lcmFsIGFyY2hpdGVjdHVyZS1kZXBlbmRlbnQgb3B0aW9ucwojCkNP
TkZJR19IT1RQTFVHX1NNVD15CkNPTkZJR19IT1RQTFVHX0NPUkVfU1lOQz15CkNPTkZJR19I
T1RQTFVHX0NPUkVfU1lOQ19ERUFEPXkKQ09ORklHX0hPVFBMVUdfQ09SRV9TWU5DX0ZVTEw9
eQpDT05GSUdfSE9UUExVR19TUExJVF9TVEFSVFVQPXkKQ09ORklHX0dFTkVSSUNfRU5UUlk9
eQojIENPTkZJR19LUFJPQkVTIGlzIG5vdCBzZXQKQ09ORklHX0pVTVBfTEFCRUw9eQojIENP
TkZJR19TVEFUSUNfS0VZU19TRUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQVRJQ19D
QUxMX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfRUZGSUNJRU5UX1VOQUxJR05F
RF9BQ0NFU1M9eQpDT05GSUdfQVJDSF9VU0VfQlVJTFRJTl9CU1dBUD15CkNPTkZJR19IQVZF
X0lPUkVNQVBfUFJPVD15CkNPTkZJR19IQVZFX0tQUk9CRVM9eQpDT05GSUdfSEFWRV9LUkVU
UFJPQkVTPXkKQ09ORklHX0hBVkVfT1BUUFJPQkVTPXkKQ09ORklHX0hBVkVfS1BST0JFU19P
Tl9GVFJBQ0U9eQpDT05GSUdfQVJDSF9DT1JSRUNUX1NUQUNLVFJBQ0VfT05fS1JFVFBST0JF
PXkKQ09ORklHX0hBVkVfRlVOQ1RJT05fRVJST1JfSU5KRUNUSU9OPXkKQ09ORklHX0hBVkVf
Tk1JPXkKQ09ORklHX1RSQUNFX0lSUUZMQUdTX1NVUFBPUlQ9eQpDT05GSUdfVFJBQ0VfSVJR
RkxBR1NfTk1JX1NVUFBPUlQ9eQpDT05GSUdfSEFWRV9BUkNIX1RSQUNFSE9PSz15CkNPTkZJ
R19IQVZFX0RNQV9DT05USUdVT1VTPXkKQ09ORklHX0dFTkVSSUNfU01QX0lETEVfVEhSRUFE
PXkKQ09ORklHX0FSQ0hfSEFTX0ZPUlRJRllfU09VUkNFPXkKQ09ORklHX0FSQ0hfSEFTX1NF
VF9NRU1PUlk9eQpDT05GSUdfQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVA9eQpDT05GSUdfQVJD
SF9IQVNfQ1BVX0ZJTkFMSVpFX0lOSVQ9eQpDT05GSUdfSEFWRV9BUkNIX1RIUkVBRF9TVFJV
Q1RfV0hJVEVMSVNUPXkKQ09ORklHX0FSQ0hfV0FOVFNfRFlOQU1JQ19UQVNLX1NUUlVDVD15
CkNPTkZJR19BUkNIX1dBTlRTX05PX0lOU1RSPXkKQ09ORklHX0FSQ0hfMzJCSVRfT0ZGX1Q9
eQpDT05GSUdfSEFWRV9BU01fTU9EVkVSU0lPTlM9eQpDT05GSUdfSEFWRV9SRUdTX0FORF9T
VEFDS19BQ0NFU1NfQVBJPXkKQ09ORklHX0hBVkVfUlNFUT15CkNPTkZJR19IQVZFX0ZVTkNU
SU9OX0FSR19BQ0NFU1NfQVBJPXkKQ09ORklHX0hBVkVfSFdfQlJFQUtQT0lOVD15CkNPTkZJ
R19IQVZFX01JWEVEX0JSRUFLUE9JTlRTX1JFR1M9eQpDT05GSUdfSEFWRV9VU0VSX1JFVFVS
Tl9OT1RJRklFUj15CkNPTkZJR19IQVZFX1BFUkZfRVZFTlRTX05NST15CkNPTkZJR19IQVZF
X0hBUkRMT0NLVVBfREVURUNUT1JfUEVSRj15CkNPTkZJR19IQVZFX1BFUkZfUkVHUz15CkNP
TkZJR19IQVZFX1BFUkZfVVNFUl9TVEFDS19EVU1QPXkKQ09ORklHX0hBVkVfQVJDSF9KVU1Q
X0xBQkVMPXkKQ09ORklHX0hBVkVfQVJDSF9KVU1QX0xBQkVMX1JFTEFUSVZFPXkKQ09ORklH
X01NVV9HQVRIRVJfVEFCTEVfRlJFRT15CkNPTkZJR19NTVVfR0FUSEVSX1JDVV9UQUJMRV9G
UkVFPXkKQ09ORklHX01NVV9HQVRIRVJfTUVSR0VfVk1BUz15CkNPTkZJR19BUkNIX1dBTlRf
SVJRU19PRkZfQUNUSVZBVEVfTU09eQpDT05GSUdfTU1VX0xBWllfVExCX1JFRkNPVU5UPXkK
Q09ORklHX0FSQ0hfSEFWRV9OTUlfU0FGRV9DTVBYQ0hHPXkKQ09ORklHX0FSQ0hfSEFWRV9F
WFRSQV9FTEZfTk9URVM9eQpDT05GSUdfQVJDSF9IQVNfTk1JX1NBRkVfVEhJU19DUFVfT1BT
PXkKQ09ORklHX0hBVkVfQUxJR05FRF9TVFJVQ1RfUEFHRT15CkNPTkZJR19IQVZFX0NNUFhD
SEdfTE9DQUw9eQpDT05GSUdfSEFWRV9DTVBYQ0hHX0RPVUJMRT15CkNPTkZJR19BUkNIX1dB
TlRfSVBDX1BBUlNFX1ZFUlNJT049eQpDT05GSUdfSEFWRV9BUkNIX1NFQ0NPTVA9eQpDT05G
SUdfSEFWRV9BUkNIX1NFQ0NPTVBfRklMVEVSPXkKQ09ORklHX1NFQ0NPTVA9eQpDT05GSUdf
U0VDQ09NUF9GSUxURVI9eQojIENPTkZJR19TRUNDT01QX0NBQ0hFX0RFQlVHIGlzIG5vdCBz
ZXQKQ09ORklHX0hBVkVfQVJDSF9TVEFDS0xFQUs9eQpDT05GSUdfSEFWRV9TVEFDS1BST1RF
Q1RPUj15CkNPTkZJR19TVEFDS1BST1RFQ1RPUj15CiMgQ09ORklHX1NUQUNLUFJPVEVDVE9S
X1NUUk9ORyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX1NVUFBPUlRTX0xUT19DTEFORz15CkNP
TkZJR19BUkNIX1NVUFBPUlRTX0xUT19DTEFOR19USElOPXkKQ09ORklHX0hBU19MVE9fQ0xB
Tkc9eQpDT05GSUdfTFRPX05PTkU9eQojIENPTkZJR19MVE9fQ0xBTkdfRlVMTCBpcyBub3Qg
c2V0CiMgQ09ORklHX0xUT19DTEFOR19USElOIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfU1VQ
UE9SVFNfQVVUT0ZET19DTEFORz15CiMgQ09ORklHX0FVVE9GRE9fQ0xBTkcgaXMgbm90IHNl
dApDT05GSUdfSEFWRV9DRklfSUNBTExfTk9STUFMSVpFX0lOVEVHRVJTX0NMQU5HPXkKQ09O
RklHX0hBVkVfQ0ZJX0lDQUxMX05PUk1BTElaRV9JTlRFR0VSU19SVVNUQz15CkNPTkZJR19I
QVZFX0FSQ0hfV0lUSElOX1NUQUNLX0ZSQU1FUz15CkNPTkZJR19IQVZFX0lSUV9USU1FX0FD
Q09VTlRJTkc9eQpDT05GSUdfSEFWRV9NT1ZFX1BVRD15CkNPTkZJR19IQVZFX01PVkVfUE1E
PXkKQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRT15CkNPTkZJR19IQVZF
X0FSQ0hfSFVHRV9WTUFQPXkKQ09ORklHX0FSQ0hfV0FOVF9QTURfTUtXUklURT15CkNPTkZJ
R19IQVZFX01PRF9BUkNIX1NQRUNJRklDPXkKQ09ORklHX01PRFVMRVNfVVNFX0VMRl9SRUw9
eQpDT05GSUdfSEFWRV9TT0ZUSVJRX09OX09XTl9TVEFDSz15CkNPTkZJR19TT0ZUSVJRX09O
X09XTl9TVEFDSz15CkNPTkZJR19BUkNIX0hBU19FTEZfUkFORE9NSVpFPXkKQ09ORklHX0hB
VkVfQVJDSF9NTUFQX1JORF9CSVRTPXkKQ09ORklHX0hBVkVfRVhJVF9USFJFQUQ9eQpDT05G
SUdfQVJDSF9NTUFQX1JORF9CSVRTPTgKQ09ORklHX0hBVkVfUEFHRV9TSVpFXzRLQj15CkNP
TkZJR19QQUdFX1NJWkVfNEtCPXkKQ09ORklHX1BBR0VfU0laRV9MRVNTX1RIQU5fNjRLQj15
CkNPTkZJR19QQUdFX1NJWkVfTEVTU19USEFOXzI1NktCPXkKQ09ORklHX1BBR0VfU0hJRlQ9
MTIKQ09ORklHX0NMT05FX0JBQ0tXQVJEUz15CkNPTkZJR19PTERfU0lHU1VTUEVORDM9eQpD
T05GSUdfT0xEX1NJR0FDVElPTj15CkNPTkZJR19DT01QQVRfMzJCSVRfVElNRT15CkNPTkZJ
R19BUkNIX1NVUFBPUlRTX1JUPXkKQ09ORklHX0hBVkVfQVJDSF9SQU5ET01JWkVfS1NUQUNL
X09GRlNFVD15CkNPTkZJR19SQU5ET01JWkVfS1NUQUNLX09GRlNFVD15CkNPTkZJR19SQU5E
T01JWkVfS1NUQUNLX09GRlNFVF9ERUZBVUxUPXkKQ09ORklHX0FSQ0hfSEFTX1NUUklDVF9L
RVJORUxfUldYPXkKQ09ORklHX1NUUklDVF9LRVJORUxfUldYPXkKQ09ORklHX0FSQ0hfSEFT
X1NUUklDVF9NT0RVTEVfUldYPXkKQ09ORklHX1NUUklDVF9NT0RVTEVfUldYPXkKQ09ORklH
X0hBVkVfQVJDSF9QUkVMMzJfUkVMT0NBVElPTlM9eQojIENPTkZJR19MT0NLX0VWRU5UX0NP
VU5UUyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19NRU1fRU5DUllQVD15CkNPTkZJR19I
QVZFX1NUQVRJQ19DQUxMPXkKQ09ORklHX0hBVkVfUFJFRU1QVF9EWU5BTUlDPXkKQ09ORklH
X0hBVkVfUFJFRU1QVF9EWU5BTUlDX0NBTEw9eQpDT05GSUdfQVJDSF9XQU5UX0xEX09SUEhB
Tl9XQVJOPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfREVCVUdfUEFHRUFMTE9DPXkKQ09ORklH
X0FSQ0hfU1BMSVRfQVJHNjQ9eQpDT05GSUdfQVJDSF9IQVNfUEFSQU5PSURfTDFEX0ZMVVNI
PXkKQ09ORklHX0RZTkFNSUNfU0lHRlJBTUU9eQpDT05GSUdfQVJDSF9IQVNfSFdfUFRFX1lP
VU5HPXkKQ09ORklHX0FSQ0hfSEFTX05PTkxFQUZfUE1EX1lPVU5HPXkKQ09ORklHX0FSQ0hf
SEFTX0tFUk5FTF9GUFVfU1VQUE9SVD15CkNPTkZJR19BUkNIX1ZNTElOVVhfTkVFRFNfUkVM
T0NTPXkKCiMKIyBHQ09WLWJhc2VkIGtlcm5lbCBwcm9maWxpbmcKIwojIENPTkZJR19HQ09W
X0tFUk5FTCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19HQ09WX1BST0ZJTEVfQUxMPXkK
IyBlbmQgb2YgR0NPVi1iYXNlZCBrZXJuZWwgcHJvZmlsaW5nCgpDT05GSUdfSEFWRV9HQ0Nf
UExVR0lOUz15CkNPTkZJR19GVU5DVElPTl9BTElHTk1FTlRfNEI9eQpDT05GSUdfRlVOQ1RJ
T05fQUxJR05NRU5UPTQKQ09ORklHX0NDX0hBU19TQU5FX0ZVTkNUSU9OX0FMSUdOTUVOVD15
CiMgZW5kIG9mIEdlbmVyYWwgYXJjaGl0ZWN0dXJlLWRlcGVuZGVudCBvcHRpb25zCgpDT05G
SUdfUlRfTVVURVhFUz15CkNPTkZJR19NT0RVTEVTPXkKIyBDT05GSUdfTU9EVUxFX0RFQlVH
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX0ZPUkNFX0xPQUQgaXMgbm90IHNldApDT05G
SUdfTU9EVUxFX1VOTE9BRD15CkNPTkZJR19NT0RVTEVfRk9SQ0VfVU5MT0FEPXkKIyBDT05G
SUdfTU9EVUxFX1VOTE9BRF9UQUlOVF9UUkFDS0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX01P
RFZFUlNJT05TIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX1NSQ1ZFUlNJT05fQUxMIGlz
IG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX1NJRyBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVM
RV9DT01QUkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9BTExPV19NSVNTSU5HX05B
TUVTUEFDRV9JTVBPUlRTIGlzIG5vdCBzZXQKQ09ORklHX01PRFBST0JFX1BBVEg9Ii9zYmlu
L21vZHByb2JlIgojIENPTkZJR19UUklNX1VOVVNFRF9LU1lNUyBpcyBub3Qgc2V0CkNPTkZJ
R19NT0RVTEVTX1RSRUVfTE9PS1VQPXkKQ09ORklHX0JMT0NLPXkKQ09ORklHX0JMT0NLX0xF
R0FDWV9BVVRPTE9BRD15CkNPTkZJR19CTEtfQ0dST1VQX1BVTlRfQklPPXkKQ09ORklHX0JM
S19ERVZfQlNHX0NPTU1PTj15CiMgQ09ORklHX0JMS19ERVZfQlNHTElCIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkxLX0RFVl9JTlRFR1JJVFkgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVW
X1dSSVRFX01PVU5URUQgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX1pPTkVEIGlzIG5v
dCBzZXQKIyBDT05GSUdfQkxLX0RFVl9USFJPVFRMSU5HIGlzIG5vdCBzZXQKQ09ORklHX0JM
S19XQlQ9eQpDT05GSUdfQkxLX1dCVF9NUT15CiMgQ09ORklHX0JMS19DR1JPVVBfSU9MQVRF
TkNZIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0NHUk9VUF9JT0NPU1QgaXMgbm90IHNldAoj
IENPTkZJR19CTEtfQ0dST1VQX0lPUFJJTyBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVCVUdf
RlM9eQojIENPTkZJR19CTEtfU0VEX09QQUwgaXMgbm90IHNldAojIENPTkZJR19CTEtfSU5M
SU5FX0VOQ1JZUFRJT04gaXMgbm90IHNldAoKIwojIFBhcnRpdGlvbiBUeXBlcwojCkNPTkZJ
R19QQVJUSVRJT05fQURWQU5DRUQ9eQojIENPTkZJR19BQ09STl9QQVJUSVRJT04gaXMgbm90
IHNldAojIENPTkZJR19BSVhfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfT1NGX1BB
UlRJVElPTiBpcyBub3Qgc2V0CkNPTkZJR19BTUlHQV9QQVJUSVRJT049eQojIENPTkZJR19B
VEFSSV9QQVJUSVRJT04gaXMgbm90IHNldApDT05GSUdfTUFDX1BBUlRJVElPTj15CkNPTkZJ
R19NU0RPU19QQVJUSVRJT049eQpDT05GSUdfQlNEX0RJU0tMQUJFTD15CiMgQ09ORklHX01J
TklYX1NVQlBBUlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1NPTEFSSVNfWDg2X1BBUlRJ
VElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1VOSVhXQVJFX0RJU0tMQUJFTCBpcyBub3Qgc2V0
CkNPTkZJR19MRE1fUEFSVElUSU9OPXkKIyBDT05GSUdfTERNX0RFQlVHIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0dJX1BBUlRJVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1VMVFJJWF9QQVJU
SVRJT04gaXMgbm90IHNldAojIENPTkZJR19TVU5fUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBD
T05GSUdfS0FSTUFfUEFSVElUSU9OIGlzIG5vdCBzZXQKQ09ORklHX0VGSV9QQVJUSVRJT049
eQojIENPTkZJR19TWVNWNjhfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01ETElO
RV9QQVJUSVRJT04gaXMgbm90IHNldAojIGVuZCBvZiBQYXJ0aXRpb24gVHlwZXMKCkNPTkZJ
R19CTEtfUE09eQpDT05GSUdfQkxPQ0tfSE9MREVSX0RFUFJFQ0FURUQ9eQpDT05GSUdfQkxL
X01RX1NUQUNLSU5HPXkKCiMKIyBJTyBTY2hlZHVsZXJzCiMKQ09ORklHX01RX0lPU0NIRURf
REVBRExJTkU9eQojIENPTkZJR19NUV9JT1NDSEVEX0tZQkVSIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU9TQ0hFRF9CRlEgaXMgbm90IHNldAojIGVuZCBvZiBJTyBTY2hlZHVsZXJzCgpDT05G
SUdfUEFEQVRBPXkKQ09ORklHX0FTTjE9eQpDT05GSUdfVU5JTkxJTkVfU1BJTl9VTkxPQ0s9
eQpDT05GSUdfQVJDSF9TVVBQT1JUU19BVE9NSUNfUk1XPXkKQ09ORklHX01VVEVYX1NQSU5f
T05fT1dORVI9eQpDT05GSUdfUldTRU1fU1BJTl9PTl9PV05FUj15CkNPTkZJR19MT0NLX1NQ
SU5fT05fT1dORVI9eQpDT05GSUdfQVJDSF9VU0VfUVVFVUVEX1NQSU5MT0NLUz15CkNPTkZJ
R19RVUVVRURfU1BJTkxPQ0tTPXkKQ09ORklHX0FSQ0hfVVNFX1FVRVVFRF9SV0xPQ0tTPXkK
Q09ORklHX1FVRVVFRF9SV0xPQ0tTPXkKQ09ORklHX0FSQ0hfSEFTX05PTl9PVkVSTEFQUElO
R19BRERSRVNTX1NQQUNFPXkKQ09ORklHX0FSQ0hfSEFTX1NZTkNfQ09SRV9CRUZPUkVfVVNF
Uk1PREU9eQpDT05GSUdfQVJDSF9IQVNfU1lTQ0FMTF9XUkFQUEVSPXkKQ09ORklHX0ZSRUVa
RVI9eQoKIwojIEV4ZWN1dGFibGUgZmlsZSBmb3JtYXRzCiMKQ09ORklHX0JJTkZNVF9FTEY9
eQpDT05GSUdfRUxGQ09SRT15CkNPTkZJR19DT1JFX0RVTVBfREVGQVVMVF9FTEZfSEVBREVS
Uz15CkNPTkZJR19CSU5GTVRfU0NSSVBUPXkKQ09ORklHX0JJTkZNVF9NSVNDPXkKQ09ORklH
X0NPUkVEVU1QPXkKIyBlbmQgb2YgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMKCiMKIyBNZW1v
cnkgTWFuYWdlbWVudCBvcHRpb25zCiMKQ09ORklHX1pQT09MPXkKQ09ORklHX1NXQVA9eQpD
T05GSUdfWlNXQVA9eQpDT05GSUdfWlNXQVBfREVGQVVMVF9PTj15CkNPTkZJR19aU1dBUF9T
SFJJTktFUl9ERUZBVUxUX09OPXkKIyBDT05GSUdfWlNXQVBfQ09NUFJFU1NPUl9ERUZBVUxU
X0RFRkxBVEUgaXMgbm90IHNldAojIENPTkZJR19aU1dBUF9DT01QUkVTU09SX0RFRkFVTFRf
TFpPIGlzIG5vdCBzZXQKIyBDT05GSUdfWlNXQVBfQ09NUFJFU1NPUl9ERUZBVUxUXzg0MiBp
cyBub3Qgc2V0CiMgQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVF9MWjQgaXMgbm90
IHNldAojIENPTkZJR19aU1dBUF9DT01QUkVTU09SX0RFRkFVTFRfTFo0SEMgaXMgbm90IHNl
dApDT05GSUdfWlNXQVBfQ09NUFJFU1NPUl9ERUZBVUxUX1pTVEQ9eQpDT05GSUdfWlNXQVBf
Q09NUFJFU1NPUl9ERUZBVUxUPSJ6c3RkIgpDT05GSUdfWlNXQVBfWlBPT0xfREVGQVVMVF9a
U01BTExPQz15CkNPTkZJR19aU1dBUF9aUE9PTF9ERUZBVUxUPSJ6c21hbGxvYyIKQ09ORklH
X1pTTUFMTE9DPXkKIyBDT05GSUdfWlNNQUxMT0NfU1RBVCBpcyBub3Qgc2V0CkNPTkZJR19a
U01BTExPQ19DSEFJTl9TSVpFPTgKCiMKIyBTbGFiIGFsbG9jYXRvciBvcHRpb25zCiMKQ09O
RklHX1NMVUI9eQpDT05GSUdfS1ZGUkVFX1JDVV9CQVRDSEVEPXkKIyBDT05GSUdfU0xVQl9U
SU5ZIGlzIG5vdCBzZXQKQ09ORklHX1NMQUJfTUVSR0VfREVGQVVMVD15CkNPTkZJR19TTEFC
X0ZSRUVMSVNUX1JBTkRPTT15CkNPTkZJR19TTEFCX0ZSRUVMSVNUX0hBUkRFTkVEPXkKQ09O
RklHX1NMQUJfQlVDS0VUUz15CiMgQ09ORklHX1NMVUJfU1RBVFMgaXMgbm90IHNldAojIENP
TkZJR19TTFVCX0NQVV9QQVJUSUFMIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFORE9NX0tNQUxM
T0NfQ0FDSEVTIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2xhYiBhbGxvY2F0b3Igb3B0aW9ucwoK
Q09ORklHX1NIVUZGTEVfUEFHRV9BTExPQ0FUT1I9eQojIENPTkZJR19DT01QQVRfQlJLIGlz
IG5vdCBzZXQKQ09ORklHX1NFTEVDVF9NRU1PUllfTU9ERUw9eQpDT05GSUdfRkxBVE1FTV9N
QU5VQUw9eQojIENPTkZJR19TUEFSU0VNRU1fTUFOVUFMIGlzIG5vdCBzZXQKQ09ORklHX0ZM
QVRNRU09eQpDT05GSUdfU1BBUlNFTUVNX1NUQVRJQz15CkNPTkZJR19IQVZFX0dVUF9GQVNU
PXkKQ09ORklHX0VYQ0xVU0lWRV9TWVNURU1fUkFNPXkKQ09ORklHX0FSQ0hfTUhQX01FTU1B
UF9PTl9NRU1PUllfRU5BQkxFPXkKQ09ORklHX0FSQ0hfRU5BQkxFX1NQTElUX1BNRF9QVExP
Q0s9eQpDT05GSUdfQ09NUEFDVElPTj15CkNPTkZJR19DT01QQUNUX1VORVZJQ1RBQkxFX0RF
RkFVTFQ9MQpDT05GSUdfUEFHRV9SRVBPUlRJTkc9eQpDT05GSUdfTUlHUkFUSU9OPXkKQ09O
RklHX1BDUF9CQVRDSF9TQ0FMRV9NQVg9NQpDT05GSUdfUEhZU19BRERSX1RfNjRCSVQ9eQpD
T05GSUdfQk9VTkNFPXkKQ09ORklHX01NVV9OT1RJRklFUj15CkNPTkZJR19LU009eQpDT05G
SUdfREVGQVVMVF9NTUFQX01JTl9BRERSPTMyNzY4CkNPTkZJR19BUkNIX1NVUFBPUlRTX01F
TU9SWV9GQUlMVVJFPXkKIyBDT05GSUdfTUVNT1JZX0ZBSUxVUkUgaXMgbm90IHNldApDT05G
SUdfQVJDSF9XQU5UX0dFTkVSQUxfSFVHRVRMQj15CkNPTkZJR19NTV9JRD15CkNPTkZJR19U
UkFOU1BBUkVOVF9IVUdFUEFHRT15CiMgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFX0FM
V0FZUyBpcyBub3Qgc2V0CkNPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRV9NQURWSVNFPXkK
IyBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBBR0VfTkVWRVIgaXMgbm90IHNldAojIENPTkZJ
R19SRUFEX09OTFlfVEhQX0ZPUl9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX05PX1BBR0VfTUFQ
Q09VTlQgaXMgbm90IHNldApDT05GSUdfUEFHRV9NQVBDT1VOVD15CkNPTkZJR19QR1RBQkxF
X0hBU19IVUdFX0xFQVZFUz15CkNPTkZJR19ORUVEX1BFUl9DUFVfRU1CRURfRklSU1RfQ0hV
Tks9eQpDT05GSUdfTkVFRF9QRVJfQ1BVX1BBR0VfRklSU1RfQ0hVTks9eQpDT05GSUdfSEFW
RV9TRVRVUF9QRVJfQ1BVX0FSRUE9eQojIENPTkZJR19DTUEgaXMgbm90IHNldApDT05GSUdf
UEFHRV9CTE9DS19PUkRFUj0xMApDT05GSUdfR0VORVJJQ19FQVJMWV9JT1JFTUFQPXkKQ09O
RklHX1BBR0VfSURMRV9GTEFHPXkKQ09ORklHX0lETEVfUEFHRV9UUkFDS0lORz15CkNPTkZJ
R19BUkNIX0hBU19DQUNIRV9MSU5FX1NJWkU9eQpDT05GSUdfQVJDSF9IQVNfQ1VSUkVOVF9T
VEFDS19QT0lOVEVSPXkKQ09ORklHX0FSQ0hfSEFTX1pPTkVfRE1BX1NFVD15CkNPTkZJR19a
T05FX0RNQT15CkNPTkZJR19HRVRfRlJFRV9SRUdJT049eQpDT05GSUdfVk1BUF9QRk49eQpD
T05GSUdfQVJDSF9VU0VTX1BHX0FSQ0hfMj15CkNPTkZJR19WTV9FVkVOVF9DT1VOVEVSUz15
CiMgQ09ORklHX1BFUkNQVV9TVEFUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0dVUF9URVNUIGlz
IG5vdCBzZXQKQ09ORklHX0dVUF9HRVRfUFhYX0xPV19ISUdIPXkKIyBDT05GSUdfRE1BUE9P
TF9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMPXkKQ09ORklH
X0tNQVBfTE9DQUw9eQpDT05GSUdfTUVNRkRfQ1JFQVRFPXkKQ09ORklHX1NFQ1JFVE1FTT15
CiMgQ09ORklHX0FOT05fVk1BX05BTUUgaXMgbm90IHNldApDT05GSUdfVVNFUkZBVUxURkQ9
eQpDT05GSUdfTFJVX0dFTj15CkNPTkZJR19MUlVfR0VOX0VOQUJMRUQ9eQojIENPTkZJR19M
UlVfR0VOX1NUQVRTIGlzIG5vdCBzZXQKQ09ORklHX0xSVV9HRU5fV0FMS1NfTU1VPXkKQ09O
RklHX0xPQ0tfTU1fQU5EX0ZJTkRfVk1BPXkKQ09ORklHX0VYRUNNRU09eQoKIwojIERhdGEg
QWNjZXNzIE1vbml0b3JpbmcKIwojIENPTkZJR19EQU1PTiBpcyBub3Qgc2V0CiMgZW5kIG9m
IERhdGEgQWNjZXNzIE1vbml0b3JpbmcKIyBlbmQgb2YgTWVtb3J5IE1hbmFnZW1lbnQgb3B0
aW9ucwoKQ09ORklHX05FVD15CkNPTkZJR19ORVRfSU5HUkVTUz15CkNPTkZJR19ORVRfRUdS
RVNTPXkKQ09ORklHX05FVF9YR1JFU1M9eQpDT05GSUdfU0tCX0RFQ1JZUFRFRD15CkNPTkZJ
R19TS0JfRVhURU5TSU9OUz15CkNPTkZJR19ORVRfREVWTUVNPXkKQ09ORklHX05FVF9DUkMz
MkM9eQoKIwojIE5ldHdvcmtpbmcgb3B0aW9ucwojCkNPTkZJR19QQUNLRVQ9bQpDT05GSUdf
UEFDS0VUX0RJQUc9bQpDT05GSUdfVU5JWD15CkNPTkZJR19BRl9VTklYX09PQj15CkNPTkZJ
R19VTklYX0RJQUc9bQpDT05GSUdfVExTPW0KQ09ORklHX1RMU19ERVZJQ0U9eQojIENPTkZJ
R19UTFNfVE9FIGlzIG5vdCBzZXQKQ09ORklHX1hGUk09eQpDT05GSUdfWEZSTV9BTEdPPW0K
Q09ORklHX1hGUk1fVVNFUj1tCiMgQ09ORklHX1hGUk1fSU5URVJGQUNFIGlzIG5vdCBzZXQK
IyBDT05GSUdfWEZSTV9TVUJfUE9MSUNZIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZSTV9NSUdS
QVRFIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZSTV9TVEFUSVNUSUNTIGlzIG5vdCBzZXQKQ09O
RklHX1hGUk1fQUg9bQpDT05GSUdfWEZSTV9FU1A9bQpDT05GSUdfWEZSTV9JUENPTVA9bQpD
T05GSUdfTkVUX0tFWT1tCiMgQ09ORklHX05FVF9LRVlfTUlHUkFURSBpcyBub3Qgc2V0CiMg
Q09ORklHX1hGUk1fSVBURlMgaXMgbm90IHNldAojIENPTkZJR19YRFBfU09DS0VUUyBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfSEFORFNIQUtFX0tVTklUX1RFU1Q9bQpDT05GSUdfSU5FVD15
CiMgQ09ORklHX0lQX01VTFRJQ0FTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX0FEVkFOQ0VE
X1JPVVRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX1BOUCBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9JUElQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0lQR1JFX0RFTVVYIGlzIG5vdCBz
ZXQKQ09ORklHX05FVF9JUF9UVU5ORUw9bQpDT05GSUdfU1lOX0NPT0tJRVM9eQojIENPTkZJ
R19ORVRfSVBWVEkgaXMgbm90IHNldApDT05GSUdfTkVUX1VEUF9UVU5ORUw9bQojIENPTkZJ
R19ORVRfRk9VIGlzIG5vdCBzZXQKQ09ORklHX0lORVRfQUg9bQpDT05GSUdfSU5FVF9FU1A9
bQojIENPTkZJR19JTkVUX0VTUF9PRkZMT0FEIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5FVF9F
U1BJTlRDUCBpcyBub3Qgc2V0CkNPTkZJR19JTkVUX0lQQ09NUD1tCkNPTkZJR19JTkVUX1RB
QkxFX1BFUlRVUkJfT1JERVI9MTYKQ09ORklHX0lORVRfWEZSTV9UVU5ORUw9bQpDT05GSUdf
SU5FVF9UVU5ORUw9bQojIENPTkZJR19JTkVUX0RJQUcgaXMgbm90IHNldApDT05GSUdfVENQ
X0NPTkdfQURWQU5DRUQ9eQojIENPTkZJR19UQ1BfQ09OR19CSUMgaXMgbm90IHNldAojIENP
TkZJR19UQ1BfQ09OR19DVUJJQyBpcyBub3Qgc2V0CkNPTkZJR19UQ1BfQ09OR19XRVNUV09P
RD15CiMgQ09ORklHX1RDUF9DT05HX0hUQ1AgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09O
R19IU1RDUCBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX0hZQkxBIGlzIG5vdCBzZXQK
IyBDT05GSUdfVENQX0NPTkdfVkVHQVMgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19O
ViBpcyBub3Qgc2V0CiMgQ09ORklHX1RDUF9DT05HX1NDQUxBQkxFIGlzIG5vdCBzZXQKIyBD
T05GSUdfVENQX0NPTkdfTFAgaXMgbm90IHNldAojIENPTkZJR19UQ1BfQ09OR19WRU5PIGlz
IG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfWUVBSCBpcyBub3Qgc2V0CiMgQ09ORklHX1RD
UF9DT05HX0lMTElOT0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfVENQX0NPTkdfRENUQ1AgaXMg
bm90IHNldAojIENPTkZJR19UQ1BfQ09OR19DREcgaXMgbm90IHNldAojIENPTkZJR19UQ1Bf
Q09OR19CQlIgaXMgbm90IHNldApDT05GSUdfREVGQVVMVF9XRVNUV09PRD15CiMgQ09ORklH
X0RFRkFVTFRfUkVOTyBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX1RDUF9DT05HPSJ3ZXN0
d29vZCIKIyBDT05GSUdfVENQX01ENVNJRyBpcyBub3Qgc2V0CkNPTkZJR19JUFY2PXkKIyBD
T05GSUdfSVBWNl9ST1VURVJfUFJFRiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfT1BUSU1J
U1RJQ19EQUQgaXMgbm90IHNldApDT05GSUdfSU5FVDZfQUg9bQpDT05GSUdfSU5FVDZfRVNQ
PW0KIyBDT05GSUdfSU5FVDZfRVNQX09GRkxPQUQgaXMgbm90IHNldAojIENPTkZJR19JTkVU
Nl9FU1BJTlRDUCBpcyBub3Qgc2V0CkNPTkZJR19JTkVUNl9JUENPTVA9bQojIENPTkZJR19J
UFY2X01JUDYgaXMgbm90IHNldApDT05GSUdfSU5FVDZfWEZSTV9UVU5ORUw9bQpDT05GSUdf
SU5FVDZfVFVOTkVMPW0KIyBDT05GSUdfSVBWNl9WVEkgaXMgbm90IHNldAojIENPTkZJR19J
UFY2X1NJVCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfVFVOTkVMIGlzIG5vdCBzZXQKIyBD
T05GSUdfSVBWNl9NVUxUSVBMRV9UQUJMRVMgaXMgbm90IHNldAojIENPTkZJR19JUFY2X01S
T1VURSBpcyBub3Qgc2V0CiMgQ09ORklHX0lQVjZfU0VHNl9MV1RVTk5FTCBpcyBub3Qgc2V0
CiMgQ09ORklHX0lQVjZfU0VHNl9ITUFDIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBWNl9SUExf
TFdUVU5ORUwgaXMgbm90IHNldAojIENPTkZJR19JUFY2X0lPQU02X0xXVFVOTkVMIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUTEFCRUwgaXMgbm90IHNldAojIENPTkZJR19NUFRDUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVFdPUktfU0VDTUFSSyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VFdPUktfUEhZX1RJTUVTVEFNUElORyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVEZJTFRFUiBp
cyBub3Qgc2V0CkNPTkZJR19JUF9TQ1RQPW0KIyBDT05GSUdfU0NUUF9EQkdfT0JKQ05UIGlz
IG5vdCBzZXQKQ09ORklHX1NDVFBfREVGQVVMVF9DT09LSUVfSE1BQ19NRDU9eQojIENPTkZJ
R19TQ1RQX0RFRkFVTFRfQ09PS0lFX0hNQUNfU0hBMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ND
VFBfREVGQVVMVF9DT09LSUVfSE1BQ19OT05FIGlzIG5vdCBzZXQKQ09ORklHX1NDVFBfQ09P
S0lFX0hNQUNfTUQ1PXkKIyBDT05GSUdfU0NUUF9DT09LSUVfSE1BQ19TSEExIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkRTIGlzIG5vdCBzZXQKIyBDT05GSUdfVElQQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0FUTSBpcyBub3Qgc2V0CiMgQ09ORklHX0wyVFAgaXMgbm90IHNldApDT05GSUdf
U1RQPW0KQ09ORklHX0JSSURHRT1tCkNPTkZJR19CUklER0VfSUdNUF9TTk9PUElORz15CiMg
Q09ORklHX0JSSURHRV9NUlAgaXMgbm90IHNldAojIENPTkZJR19CUklER0VfQ0ZNIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX0RTQSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZMQU5fODAyMVEg
aXMgbm90IHNldApDT05GSUdfTExDPW0KIyBDT05GSUdfTExDMiBpcyBub3Qgc2V0CiMgQ09O
RklHX0FUQUxLIGlzIG5vdCBzZXQKIyBDT05GSUdfWDI1IGlzIG5vdCBzZXQKIyBDT05GSUdf
TEFQQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIT05FVCBpcyBub3Qgc2V0CiMgQ09ORklHXzZM
T1dQQU4gaXMgbm90IHNldAojIENPTkZJR19JRUVFODAyMTU0IGlzIG5vdCBzZXQKQ09ORklH
X05FVF9TQ0hFRD15CgojCiMgUXVldWVpbmcvU2NoZWR1bGluZwojCiMgQ09ORklHX05FVF9T
Q0hfSFRCIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9IRlNDIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1NDSF9QUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9NVUxUSVEg
aXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1JFRCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9TQ0hfU0ZCIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9TRlEgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfU0NIX1RFUUwgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1RCRiBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfQ0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1NDSF9FVEYgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1RBUFJJTyBpcyBub3Qgc2V0
CiMgQ09ORklHX05FVF9TQ0hfR1JFRCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hfTkVU
RU0gaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0RSUiBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9TQ0hfTVFQUklPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9TS0JQUklPIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9DSE9LRSBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9TQ0hfUUZRIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9DT0RFTCBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfU0NIX0ZRX0NPREVMPXkKIyBDT05GSUdfTkVUX1NDSF9DQUtFIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkVUX1NDSF9GUSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQ0hf
SEhGIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1NDSF9QSUUgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfU0NIX1BMVUcgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX0VUUyBpcyBub3Qg
c2V0CkNPTkZJR19ORVRfU0NIX0RFRkFVTFQ9eQpDT05GSUdfREVGQVVMVF9GUV9DT0RFTD15
CiMgQ09ORklHX0RFRkFVTFRfUEZJRk9fRkFTVCBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxU
X05FVF9TQ0g9ImZxX2NvZGVsIgoKIwojIENsYXNzaWZpY2F0aW9uCiMKIyBDT05GSUdfTkVU
X0NMU19CQVNJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfUk9VVEU0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX0NMU19GVyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9DTFNfVTMy
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NMU19GTE9XIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX0NMU19DR1JPVVAgaXMgbm90IHNldAojIENPTkZJR19ORVRfQ0xTX0JQRiBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9DTFNfRkxPV0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0NM
U19NQVRDSEFMTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9FTUFUQ0ggaXMgbm90IHNldAoj
IENPTkZJR19ORVRfQ0xTX0FDVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfU0NIX0ZJRk89eQoj
IENPTkZJR19EQ0IgaXMgbm90IHNldApDT05GSUdfRE5TX1JFU09MVkVSPW0KIyBDT05GSUdf
QkFUTUFOX0FEViBpcyBub3Qgc2V0CiMgQ09ORklHX09QRU5WU1dJVENIIGlzIG5vdCBzZXQK
Q09ORklHX1ZTT0NLRVRTPW0KQ09ORklHX1ZTT0NLRVRTX0RJQUc9bQojIENPTkZJR19WU09D
S0VUU19MT09QQkFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJUlRJT19WU09DS0VUUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVExJTktfRElBRyBpcyBub3Qgc2V0CiMgQ09ORklHX01QTFMg
aXMgbm90IHNldAojIENPTkZJR19ORVRfTlNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSFNSIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1NXSVRDSERFViBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9MM19NQVNURVJfREVWIGlzIG5vdCBzZXQKIyBDT05GSUdfUVJUUiBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9OQ1NJIGlzIG5vdCBzZXQKQ09ORklHX1BDUFVfREVWX1JFRkNOVD15CkNP
TkZJR19NQVhfU0tCX0ZSQUdTPTE3CkNPTkZJR19SUFM9eQpDT05GSUdfUkZTX0FDQ0VMPXkK
Q09ORklHX1NPQ0tfUlhfUVVFVUVfTUFQUElORz15CkNPTkZJR19YUFM9eQojIENPTkZJR19D
R1JPVVBfTkVUX1BSSU8gaXMgbm90IHNldApDT05GSUdfQ0dST1VQX05FVF9DTEFTU0lEPXkK
Q09ORklHX05FVF9SWF9CVVNZX1BPTEw9eQpDT05GSUdfQlFMPXkKQ09ORklHX0JQRl9TVFJF
QU1fUEFSU0VSPXkKQ09ORklHX05FVF9GTE9XX0xJTUlUPXkKCiMKIyBOZXR3b3JrIHRlc3Rp
bmcKIwojIENPTkZJR19ORVRfUEtUR0VOIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29yayB0
ZXN0aW5nCiMgZW5kIG9mIE5ldHdvcmtpbmcgb3B0aW9ucwoKIyBDT05GSUdfSEFNUkFESU8g
aXMgbm90IHNldAojIENPTkZJR19DQU4gaXMgbm90IHNldApDT05GSUdfQlQ9bQpDT05GSUdf
QlRfQlJFRFI9eQpDT05GSUdfQlRfUkZDT01NPW0KQ09ORklHX0JUX1JGQ09NTV9UVFk9eQpD
T05GSUdfQlRfQk5FUD1tCkNPTkZJR19CVF9CTkVQX01DX0ZJTFRFUj15CkNPTkZJR19CVF9C
TkVQX1BST1RPX0ZJTFRFUj15CkNPTkZJR19CVF9ISURQPW0KQ09ORklHX0JUX0xFPXkKQ09O
RklHX0JUX0xFX0wyQ0FQX0VDUkVEPXkKQ09ORklHX0JUX0xFRFM9eQpDT05GSUdfQlRfTVNG
VEVYVD15CkNPTkZJR19CVF9BT1NQRVhUPXkKQ09ORklHX0JUX0RFQlVHRlM9eQojIENPTkZJ
R19CVF9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19CVF9GRUFUVVJFX0RFQlVHPXkKCiMK
IyBCbHVldG9vdGggZGV2aWNlIGRyaXZlcnMKIwpDT05GSUdfQlRfSU5URUw9bQpDT05GSUdf
QlRfQkNNPW0KQ09ORklHX0JUX1JUTD1tCkNPTkZJR19CVF9NVEs9bQpDT05GSUdfQlRfSENJ
QlRVU0I9bQpDT05GSUdfQlRfSENJQlRVU0JfQVVUT1NVU1BFTkQ9eQpDT05GSUdfQlRfSENJ
QlRVU0JfUE9MTF9TWU5DPXkKQ09ORklHX0JUX0hDSUJUVVNCX0JDTT15CkNPTkZJR19CVF9I
Q0lCVFVTQl9NVEs9eQpDT05GSUdfQlRfSENJQlRVU0JfUlRMPXkKQ09ORklHX0JUX0hDSVVB
UlQ9bQpDT05GSUdfQlRfSENJVUFSVF9IND15CkNPTkZJR19CVF9IQ0lVQVJUX0JDU1A9eQpD
T05GSUdfQlRfSENJVUFSVF9BVEgzSz15CiMgQ09ORklHX0JUX0hDSVVBUlRfSU5URUwgaXMg
bm90IHNldApDT05GSUdfQlRfSENJVUFSVF9BRzZYWD15CkNPTkZJR19CVF9IQ0lCQ00yMDNY
PW0KIyBDT05GSUdfQlRfSENJQkNNNDM3NyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUX0hDSUJQ
QTEwWCBpcyBub3Qgc2V0CkNPTkZJR19CVF9IQ0lCRlVTQj1tCiMgQ09ORklHX0JUX0hDSURU
TDEgaXMgbm90IHNldAojIENPTkZJR19CVF9IQ0lCVDNDIGlzIG5vdCBzZXQKIyBDT05GSUdf
QlRfSENJQkxVRUNBUkQgaXMgbm90IHNldAojIENPTkZJR19CVF9IQ0lWSENJIGlzIG5vdCBz
ZXQKQ09ORklHX0JUX01SVkw9bQpDT05GSUdfQlRfQVRIM0s9bQojIENPTkZJR19CVF9WSVJU
SU8gaXMgbm90IHNldAojIENPTkZJR19CVF9JTlRFTF9QQ0lFIGlzIG5vdCBzZXQKIyBlbmQg
b2YgQmx1ZXRvb3RoIGRldmljZSBkcml2ZXJzCgojIENPTkZJR19BRl9SWFJQQyBpcyBub3Qg
c2V0CiMgQ09ORklHX0FGX0tDTSBpcyBub3Qgc2V0CkNPTkZJR19TVFJFQU1fUEFSU0VSPXkK
IyBDT05GSUdfTUNUUCBpcyBub3Qgc2V0CkNPTkZJR19XSVJFTEVTUz15CkNPTkZJR19DRkc4
MDIxMT1tCiMgQ09ORklHX05MODAyMTFfVEVTVE1PREUgaXMgbm90IHNldAojIENPTkZJR19D
Rkc4MDIxMV9ERVZFTE9QRVJfV0FSTklOR1MgaXMgbm90IHNldAojIENPTkZJR19DRkc4MDIx
MV9DRVJUSUZJQ0FUSU9OX09OVVMgaXMgbm90IHNldApDT05GSUdfQ0ZHODAyMTFfUkVRVUlS
RV9TSUdORURfUkVHREI9eQpDT05GSUdfQ0ZHODAyMTFfVVNFX0tFUk5FTF9SRUdEQl9LRVlT
PXkKQ09ORklHX0NGRzgwMjExX0RFRkFVTFRfUFM9eQojIENPTkZJR19DRkc4MDIxMV9ERUJV
R0ZTIGlzIG5vdCBzZXQKQ09ORklHX0NGRzgwMjExX0NSREFfU1VQUE9SVD15CiMgQ09ORklH
X0NGRzgwMjExX1dFWFQgaXMgbm90IHNldApDT05GSUdfQ0ZHODAyMTFfS1VOSVRfVEVTVD1t
CkNPTkZJR19NQUM4MDIxMT1tCkNPTkZJR19NQUM4MDIxMV9IQVNfUkM9eQpDT05GSUdfTUFD
ODAyMTFfUkNfTUlOU1RSRUw9eQpDT05GSUdfTUFDODAyMTFfUkNfREVGQVVMVF9NSU5TVFJF
TD15CkNPTkZJR19NQUM4MDIxMV9SQ19ERUZBVUxUPSJtaW5zdHJlbF9odCIKQ09ORklHX01B
QzgwMjExX0tVTklUX1RFU1Q9bQojIENPTkZJR19NQUM4MDIxMV9NRVNIIGlzIG5vdCBzZXQK
Q09ORklHX01BQzgwMjExX0xFRFM9eQojIENPTkZJR19NQUM4MDIxMV9ERUJVR19NRU5VIGlz
IG5vdCBzZXQKQ09ORklHX01BQzgwMjExX1NUQV9IQVNIX01BWF9TSVpFPTAKQ09ORklHX1JG
S0lMTD1tCkNPTkZJR19SRktJTExfTEVEUz15CiMgQ09ORklHX1JGS0lMTF9JTlBVVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1JGS0lMTF9HUElPIGlzIG5vdCBzZXQKQ09ORklHX05FVF85UD15
CkNPTkZJR19ORVRfOVBfRkQ9eQpDT05GSUdfTkVUXzlQX1ZJUlRJTz15CiMgQ09ORklHX05F
VF85UF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0NBSUYgaXMgbm90IHNldAojIENPTkZJ
R19DRVBIX0xJQiBpcyBub3Qgc2V0CiMgQ09ORklHX05GQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1BTQU1QTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfSUZFIGlzIG5vdCBzZXQKIyBDT05G
SUdfTFdUVU5ORUwgaXMgbm90IHNldApDT05GSUdfRFNUX0NBQ0hFPXkKQ09ORklHX0dST19D
RUxMUz15CkNPTkZJR19TT0NLX1ZBTElEQVRFX1hNSVQ9eQpDT05GSUdfTkVUX1NPQ0tfTVNH
PXkKQ09ORklHX1BBR0VfUE9PTD15CiMgQ09ORklHX1BBR0VfUE9PTF9TVEFUUyBpcyBub3Qg
c2V0CkNPTkZJR19GQUlMT1ZFUj15CkNPTkZJR19FVEhUT09MX05FVExJTks9eQpDT05GSUdf
TkVUREVWX0FERFJfTElTVF9URVNUPW0KQ09ORklHX05FVF9URVNUPW0KCiMKIyBEZXZpY2Ug
RHJpdmVycwojCkNPTkZJR19IQVZFX0VJU0E9eQojIENPTkZJR19FSVNBIGlzIG5vdCBzZXQK
Q09ORklHX0hBVkVfUENJPXkKQ09ORklHX0dFTkVSSUNfUENJX0lPTUFQPXkKQ09ORklHX1BD
ST15CkNPTkZJR19QQ0lfRE9NQUlOUz15CkNPTkZJR19QQ0lFUE9SVEJVUz15CkNPTkZJR19Q
Q0lFQUVSPXkKIyBDT05GSUdfUENJRUFFUl9JTkpFQ1QgaXMgbm90IHNldAojIENPTkZJR19Q
Q0lFX0VDUkMgaXMgbm90IHNldApDT05GSUdfUENJRUFTUE09eQpDT05GSUdfUENJRUFTUE1f
REVGQVVMVD15CiMgQ09ORklHX1BDSUVBU1BNX1BPV0VSU0FWRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BDSUVBU1BNX1BPV0VSX1NVUEVSU0FWRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVB
U1BNX1BFUkZPUk1BTkNFIGlzIG5vdCBzZXQKQ09ORklHX1BDSUVfUE1FPXkKIyBDT05GSUdf
UENJRV9EUEMgaXMgbm90IHNldAojIENPTkZJR19QQ0lFX1BUTSBpcyBub3Qgc2V0CkNPTkZJ
R19QQ0lfTVNJPXkKQ09ORklHX1BDSV9RVUlSS1M9eQojIENPTkZJR19QQ0lfREVCVUcgaXMg
bm90IHNldAojIENPTkZJR19QQ0lfU1RVQiBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSV9ET0Ug
aXMgbm90IHNldApDT05GSUdfUENJX0xPQ0tMRVNTX0NPTkZJRz15CiMgQ09ORklHX1BDSV9J
T1YgaXMgbm90IHNldAojIENPTkZJR19QQ0lfTlBFTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BD
SV9QUkkgaXMgbm90IHNldAojIENPTkZJR19QQ0lfUEFTSUQgaXMgbm90IHNldApDT05GSUdf
UENJRV9UUEg9eQpDT05GSUdfUENJX0xBQkVMPXkKIyBDT05GSUdfUENJRV9CVVNfVFVORV9P
RkYgaXMgbm90IHNldApDT05GSUdfUENJRV9CVVNfREVGQVVMVD15CiMgQ09ORklHX1BDSUVf
QlVTX1NBRkUgaXMgbm90IHNldAojIENPTkZJR19QQ0lFX0JVU19QRVJGT1JNQU5DRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BDSUVfQlVTX1BFRVIyUEVFUiBpcyBub3Qgc2V0CkNPTkZJR19W
R0FfQVJCPXkKQ09ORklHX1ZHQV9BUkJfTUFYX0dQVVM9NAojIENPTkZJR19IT1RQTFVHX1BD
SSBpcyBub3Qgc2V0CgojCiMgUENJIGNvbnRyb2xsZXIgZHJpdmVycwojCgojCiMgQ2FkZW5j
ZS1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCiMKIyBlbmQgb2YgQ2FkZW5jZS1iYXNlZCBQQ0ll
IGNvbnRyb2xsZXJzCgojCiMgRGVzaWduV2FyZS1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCiMK
IyBDT05GSUdfUENJX01FU09OIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJRV9EV19QTEFUX0hP
U1QgaXMgbm90IHNldAojIGVuZCBvZiBEZXNpZ25XYXJlLWJhc2VkIFBDSWUgY29udHJvbGxl
cnMKCiMKIyBNb2JpdmVpbC1iYXNlZCBQQ0llIGNvbnRyb2xsZXJzCiMKIyBlbmQgb2YgTW9i
aXZlaWwtYmFzZWQgUENJZSBjb250cm9sbGVycwoKIwojIFBMREEtYmFzZWQgUENJZSBjb250
cm9sbGVycwojCiMgZW5kIG9mIFBMREEtYmFzZWQgUENJZSBjb250cm9sbGVycwojIGVuZCBv
ZiBQQ0kgY29udHJvbGxlciBkcml2ZXJzCgojCiMgUENJIEVuZHBvaW50CiMKIyBDT05GSUdf
UENJX0VORFBPSU5UIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIEVuZHBvaW50CgojCiMgUENJ
IHN3aXRjaCBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJR19QQ0lfU1dfU1dJVENIVEVD
IGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIHN3aXRjaCBjb250cm9sbGVyIGRyaXZlcnMKCkNP
TkZJR19QQ0lfUFdSQ1RSTD1tCkNPTkZJR19QQ0lfUFdSQ1RSTF9TTE9UPW0KIyBDT05GSUdf
Q1hMX0JVUyBpcyBub3Qgc2V0CkNPTkZJR19QQ0NBUkQ9eQpDT05GSUdfUENNQ0lBPXkKIyBD
T05GSUdfUENNQ0lBX0xPQURfQ0lTIGlzIG5vdCBzZXQKQ09ORklHX0NBUkRCVVM9eQoKIwoj
IFBDLWNhcmQgYnJpZGdlcwojCkNPTkZJR19ZRU5UQT15CiMgQ09ORklHX1lFTlRBX08yIGlz
IG5vdCBzZXQKIyBDT05GSUdfWUVOVEFfUklDT0ggaXMgbm90IHNldAojIENPTkZJR19ZRU5U
QV9USSBpcyBub3Qgc2V0CiMgQ09ORklHX1lFTlRBX1RPU0hJQkEgaXMgbm90IHNldAojIENP
TkZJR19QRDY3MjkgaXMgbm90IHNldAojIENPTkZJR19JODIwOTIgaXMgbm90IHNldApDT05G
SUdfUENDQVJEX05PTlNUQVRJQz15CiMgQ09ORklHX1JBUElESU8gaXMgbm90IHNldAoKIwoj
IEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKIwojIENPTkZJR19VRVZFTlRfSEVMUEVSIGlzIG5v
dCBzZXQKQ09ORklHX0RFVlRNUEZTPXkKQ09ORklHX0RFVlRNUEZTX01PVU5UPXkKQ09ORklH
X0RFVlRNUEZTX1NBRkU9eQpDT05GSUdfU1RBTkRBTE9ORT15CkNPTkZJR19QUkVWRU5UX0ZJ
Uk1XQVJFX0JVSUxEPXkKCiMKIyBGaXJtd2FyZSBsb2FkZXIKIwpDT05GSUdfRldfTE9BREVS
PXkKQ09ORklHX0VYVFJBX0ZJUk1XQVJFPSIiCiMgQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hF
TFBFUiBpcyBub3Qgc2V0CkNPTkZJR19GV19MT0FERVJfQ09NUFJFU1M9eQojIENPTkZJR19G
V19MT0FERVJfQ09NUFJFU1NfWFogaXMgbm90IHNldApDT05GSUdfRldfTE9BREVSX0NPTVBS
RVNTX1pTVEQ9eQpDT05GSUdfRldfQ0FDSEU9eQojIENPTkZJR19GV19VUExPQUQgaXMgbm90
IHNldAojIGVuZCBvZiBGaXJtd2FyZSBsb2FkZXIKCkNPTkZJR19BTExPV19ERVZfQ09SRURV
TVA9eQojIENPTkZJR19ERUJVR19EUklWRVIgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19E
RVZSRVMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19URVNUX0RSSVZFUl9SRU1PVkUgaXMg
bm90IHNldAojIENPTkZJR19URVNUX0FTWU5DX0RSSVZFUl9QUk9CRSBpcyBub3Qgc2V0CkNP
TkZJR19ETV9LVU5JVF9URVNUPW0KQ09ORklHX0RSSVZFUl9QRV9LVU5JVF9URVNUPW0KQ09O
RklHX0dFTkVSSUNfQ1BVX0RFVklDRVM9eQpDT05GSUdfR0VORVJJQ19DUFVfQVVUT1BST0JF
PXkKQ09ORklHX0dFTkVSSUNfQ1BVX1ZVTE5FUkFCSUxJVElFUz15CkNPTkZJR19SRUdNQVA9
eQpDT05GSUdfUkVHTUFQX0tVTklUPW0KIyBDT05GSUdfUkVHTUFQX0JVSUxEIGlzIG5vdCBz
ZXQKQ09ORklHX1JFR01BUF9SQU09bQpDT05GSUdfRE1BX1NIQVJFRF9CVUZGRVI9eQpDT05G
SUdfRE1BX0ZFTkNFX1RSQUNFPXkKIyBDT05GSUdfRldfREVWTElOS19TWU5DX1NUQVRFX1RJ
TUVPVVQgaXMgbm90IHNldAojIGVuZCBvZiBHZW5lcmljIERyaXZlciBPcHRpb25zCgojCiMg
QnVzIGRldmljZXMKIwojIENPTkZJR19NSElfQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUhJ
X0JVU19FUCBpcyBub3Qgc2V0CiMgZW5kIG9mIEJ1cyBkZXZpY2VzCgojCiMgQ2FjaGUgRHJp
dmVycwojCiMgZW5kIG9mIENhY2hlIERyaXZlcnMKCkNPTkZJR19DT05ORUNUT1I9bQoKIwoj
IEZpcm13YXJlIERyaXZlcnMKIwoKIwojIEFSTSBTeXN0ZW0gQ29udHJvbCBhbmQgTWFuYWdl
bWVudCBJbnRlcmZhY2UgUHJvdG9jb2wKIwojIGVuZCBvZiBBUk0gU3lzdGVtIENvbnRyb2wg
YW5kIE1hbmFnZW1lbnQgSW50ZXJmYWNlIFByb3RvY29sCgojIENPTkZJR19FREQgaXMgbm90
IHNldApDT05GSUdfRklSTVdBUkVfTUVNTUFQPXkKQ09ORklHX0RNSUlEPXkKQ09ORklHX0RN
SV9TWVNGUz15CkNPTkZJR19ETUlfU0NBTl9NQUNISU5FX05PTl9FRklfRkFMTEJBQ0s9eQoj
IENPTkZJR19JU0NTSV9JQkZUIGlzIG5vdCBzZXQKQ09ORklHX0ZXX0NGR19TWVNGUz1tCiMg
Q09ORklHX0ZXX0NGR19TWVNGU19DTURMSU5FIGlzIG5vdCBzZXQKQ09ORklHX1NZU0ZCPXkK
Q09ORklHX1NZU0ZCX1NJTVBMRUZCPXkKIyBDT05GSUdfR09PR0xFX0ZJUk1XQVJFIGlzIG5v
dCBzZXQKCiMKIyBRdWFsY29tbSBmaXJtd2FyZSBkcml2ZXJzCiMKIyBlbmQgb2YgUXVhbGNv
bW0gZmlybXdhcmUgZHJpdmVycwoKIwojIFRlZ3JhIGZpcm13YXJlIGRyaXZlcgojCiMgZW5k
IG9mIFRlZ3JhIGZpcm13YXJlIGRyaXZlcgojIGVuZCBvZiBGaXJtd2FyZSBEcml2ZXJzCgpD
T05GSUdfRldDVEw9bQojIENPTkZJR19HTlNTIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREIGlz
IG5vdCBzZXQKQ09ORklHX0RUQz15CiMgQ09ORklHX09GIGlzIG5vdCBzZXQKQ09ORklHX0FS
Q0hfTUlHSFRfSEFWRV9QQ19QQVJQT1JUPXkKIyBDT05GSUdfUEFSUE9SVCBpcyBub3Qgc2V0
CkNPTkZJR19QTlA9eQojIENPTkZJR19QTlBfREVCVUdfTUVTU0FHRVMgaXMgbm90IHNldAoK
IwojIFByb3RvY29scwojCkNPTkZJR19QTlBBQ1BJPXkKQ09ORklHX0JMS19ERVY9eQojIENP
TkZJR19CTEtfREVWX05VTExfQkxLIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl9GRCBp
cyBub3Qgc2V0CkNPTkZJR19DRFJPTT15CiMgQ09ORklHX0JMS19ERVZfUENJRVNTRF9NVElQ
MzJYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1pSQU0gaXMgbm90IHNldApDT05GSUdfQkxLX0RF
Vl9MT09QPW0KQ09ORklHX0JMS19ERVZfTE9PUF9NSU5fQ09VTlQ9OAojIENPTkZJR19CTEtf
REVWX0RSQkQgaXMgbm90IHNldAojIENPTkZJR19CTEtfREVWX05CRCBpcyBub3Qgc2V0CiMg
Q09ORklHX0JMS19ERVZfUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0RST01fUEtUQ0RWRCBp
cyBub3Qgc2V0CiMgQ09ORklHX0FUQV9PVkVSX0VUSCBpcyBub3Qgc2V0CkNPTkZJR19WSVJU
SU9fQkxLPXkKIyBDT05GSUdfQkxLX0RFVl9SQkQgaXMgbm90IHNldAojIENPTkZJR19CTEtf
REVWX1VCTEsgaXMgbm90IHNldAoKIwojIE5WTUUgU3VwcG9ydAojCiMgQ09ORklHX0JMS19E
RVZfTlZNRSBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVfRkMgaXMgbm90IHNldAojIENPTkZJ
R19OVk1FX1RDUCBpcyBub3Qgc2V0CiMgQ09ORklHX05WTUVfVEFSR0VUIGlzIG5vdCBzZXQK
IyBlbmQgb2YgTlZNRSBTdXBwb3J0CgojCiMgTWlzYyBkZXZpY2VzCiMKIyBDT05GSUdfQUQ1
MjVYX0RQT1QgaXMgbm90IHNldAojIENPTkZJR19EVU1NWV9JUlEgaXMgbm90IHNldAojIENP
TkZJR19JQk1fQVNNIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhBTlRPTSBpcyBub3Qgc2V0CiMg
Q09ORklHX1RJX0ZQQzIwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1RJRk1fQ09SRSBpcyBub3Qg
c2V0CiMgQ09ORklHX0lDUzkzMlM0MDEgaXMgbm90IHNldAojIENPTkZJR19FTkNMT1NVUkVf
U0VSVklDRVMgaXMgbm90IHNldAojIENPTkZJR19IUF9JTE8gaXMgbm90IHNldAojIENPTkZJ
R19BUERTOTgwMkFMUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lTTDI5MDAzIGlzIG5vdCBzZXQK
IyBDT05GSUdfSVNMMjkwMjAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RTTDI1NTAg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0JIMTc3MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfQVBEUzk5MFggaXMgbm90IHNldAojIENPTkZJR19ITUM2MzUyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFMxNjgyIGlzIG5vdCBzZXQKIyBDT05GSUdfUENIX1BIVUIgaXMgbm90
IHNldAojIENPTkZJR19TUkFNIGlzIG5vdCBzZXQKIyBDT05GSUdfRFdfWERBVEFfUENJRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1BDSV9FTkRQT0lOVF9URVNUIGlzIG5vdCBzZXQKIyBDT05G
SUdfWElMSU5YX1NERkVDIGlzIG5vdCBzZXQKIyBDT05GSUdfTlRTWU5DIGlzIG5vdCBzZXQK
IyBDT05GSUdfTlNNIGlzIG5vdCBzZXQKIyBDT05GSUdfQzJQT1JUIGlzIG5vdCBzZXQKCiMK
IyBFRVBST00gc3VwcG9ydAojCiMgQ09ORklHX0VFUFJPTV9BVDI0IGlzIG5vdCBzZXQKIyBD
T05GSUdfRUVQUk9NX01BWDY4NzUgaXMgbm90IHNldApDT05GSUdfRUVQUk9NXzkzQ1g2PW0K
IyBDT05GSUdfRUVQUk9NX0lEVF84OUhQRVNYIGlzIG5vdCBzZXQKIyBDT05GSUdfRUVQUk9N
X0VFMTAwNCBpcyBub3Qgc2V0CiMgZW5kIG9mIEVFUFJPTSBzdXBwb3J0CgojIENPTkZJR19D
QjcxMF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MSVMzX0kyQyBpcyBub3Qg
c2V0CiMgQ09ORklHX0FMVEVSQV9TVEFQTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX01F
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNV0FSRV9WTUNJIGlzIG5vdCBzZXQKIyBDT05GSUdf
QkNNX1ZLIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlTQ19BTENPUl9QQ0kgaXMgbm90IHNldAoj
IENPTkZJR19NSVNDX1JUU1hfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlTQ19SVFNYX1VT
QiBpcyBub3Qgc2V0CkNPTkZJR19QVlBBTklDPXkKIyBDT05GSUdfUFZQQU5JQ19NTUlPIGlz
IG5vdCBzZXQKIyBDT05GSUdfUFZQQU5JQ19QQ0kgaXMgbm90IHNldAojIENPTkZJR19HUF9Q
Q0kxWFhYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0FNRF9TQlJNSV9JMkMgaXMgbm90IHNldAoj
IGVuZCBvZiBNaXNjIGRldmljZXMKCiMKIyBTQ1NJIGRldmljZSBzdXBwb3J0CiMKQ09ORklH
X1NDU0lfTU9EPXkKIyBDT05GSUdfUkFJRF9BVFRSUyBpcyBub3Qgc2V0CkNPTkZJR19TQ1NJ
X0NPTU1PTj15CkNPTkZJR19TQ1NJPXkKQ09ORklHX1NDU0lfRE1BPXkKIyBDT05GSUdfU0NT
SV9QUk9DX0ZTIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfTElCX0tVTklUX1RFU1Q9bQoKIwoj
IFNDU0kgc3VwcG9ydCB0eXBlIChkaXNrLCB0YXBlLCBDRC1ST00pCiMKQ09ORklHX0JMS19E
RVZfU0Q9eQojIENPTkZJR19DSFJfREVWX1NUIGlzIG5vdCBzZXQKQ09ORklHX0JMS19ERVZf
U1I9eQpDT05GSUdfQ0hSX0RFVl9TRz1tCkNPTkZJR19CTEtfREVWX0JTRz15CiMgQ09ORklH
X0NIUl9ERVZfU0NIIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfQ09OU1RBTlRTPXkKIyBDT05G
SUdfU0NTSV9MT0dHSU5HIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfU0NBTl9BU1lOQz15CkNP
TkZJR19TQ1NJX1BST1RPX1RFU1Q9bQoKIwojIFNDU0kgVHJhbnNwb3J0cwojCiMgQ09ORklH
X1NDU0lfU1BJX0FUVFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9GQ19BVFRSUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfSVNDU0lfQVRUUlMgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX1NBU19BVFRSUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU0FTX0xJQlNBUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDU0lfU1JQX0FUVFJTIGlzIG5vdCBzZXQKIyBlbmQgb2YgU0NT
SSBUcmFuc3BvcnRzCgpDT05GSUdfU0NTSV9MT1dMRVZFTD15CiMgQ09ORklHX0lTQ1NJX1RD
UCBpcyBub3Qgc2V0CiMgQ09ORklHX0lTQ1NJX0JPT1RfU1lTRlMgaXMgbm90IHNldAojIENP
TkZJR19TQ1NJX0NYR0IzX0lTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9DWEdCNF9J
U0NTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQk5YMl9JU0NTSSBpcyBub3Qgc2V0CiMg
Q09ORklHX0JFMklTQ1NJIGlzIG5vdCBzZXQKIyBDT05GSUdfQkxLX0RFVl8zV19YWFhYX1JB
SUQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0hQU0EgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJXzNXXzlYWFggaXMgbm90IHNldAojIENPTkZJR19TQ1NJXzNXX1NBUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfQUNBUkQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FBQ1JBSUQg
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FJQzdYWFggaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0FJQzc5WFggaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FJQzk0WFggaXMgbm90IHNl
dAojIENPTkZJR19TQ1NJX01WU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NVlVNSSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQURWQU5TWVMgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0FSQ01TUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfRVNBUzJSIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUVHQVJBSURfTkVXR0VOIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVHQVJBSURf
TEVHQUNZIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVHQVJBSURfU0FTIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NTSV9NUFQzU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NUFQyU0FTIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NUEkzTVIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X1NNQVJUUFFJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9IUFRJT1AgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX0JVU0xPR0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NWVJCIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NWVJTIGlzIG5vdCBzZXQKIyBDT05GSUdfVk1XQVJF
X1BWU0NTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU05JQyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NDU0lfRE1YMzE5MUQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0ZET01BSU5fUENJ
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JU0NJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NT
SV9JUFMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lOSVRJTyBpcyBub3Qgc2V0CiMgQ09O
RklHX1NDU0lfSU5JQTEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfU1RFWCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDU0lfU1lNNTNDOFhYXzIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X0lQUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUUxPR0lDXzEyODAgaXMgbm90IHNldAoj
IENPTkZJR19TQ1NJX1FMQV9JU0NTSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfREMzOTV4
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BTTUzQzk3NCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfTlNQMzIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1dENzE5WCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1BNQ1JBSUQg
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX1BNODAwMSBpcyBub3Qgc2V0CkNPTkZJR19TQ1NJ
X1ZJUlRJTz1tCiMgQ09ORklHX1NDU0lfTE9XTEVWRUxfUENNQ0lBIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0NTSV9ESCBpcyBub3Qgc2V0CiMgZW5kIG9mIFNDU0kgZGV2aWNlIHN1cHBvcnQK
CkNPTkZJR19BVEE9eQpDT05GSUdfU0FUQV9IT1NUPXkKQ09ORklHX1BBVEFfVElNSU5HUz15
CkNPTkZJR19BVEFfVkVSQk9TRV9FUlJPUj15CiMgQ09ORklHX0FUQV9GT1JDRSBpcyBub3Qg
c2V0CkNPTkZJR19BVEFfQUNQST15CkNPTkZJR19TQVRBX1pQT0REPXkKIyBDT05GSUdfU0FU
QV9QTVAgaXMgbm90IHNldAoKIwojIENvbnRyb2xsZXJzIHdpdGggbm9uLVNGRiBuYXRpdmUg
aW50ZXJmYWNlCiMKQ09ORklHX1NBVEFfQUhDST15CkNPTkZJR19TQVRBX01PQklMRV9MUE1f
UE9MSUNZPTAKIyBDT05GSUdfU0FUQV9BSENJX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05G
SUdfQUhDSV9EV0MgaXMgbm90IHNldAojIENPTkZJR19TQVRBX0lOSUMxNjJYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0FUQV9BQ0FSRF9BSENJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9T
SUwyNCBpcyBub3Qgc2V0CkNPTkZJR19BVEFfU0ZGPXkKCiMKIyBTRkYgY29udHJvbGxlcnMg
d2l0aCBjdXN0b20gRE1BIGludGVyZmFjZQojCiMgQ09ORklHX1BEQ19BRE1BIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0FUQV9RU1RPUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfU1g0IGlz
IG5vdCBzZXQKQ09ORklHX0FUQV9CTURNQT15CgojCiMgU0FUQSBTRkYgY29udHJvbGxlcnMg
d2l0aCBCTURNQQojCkNPTkZJR19BVEFfUElJWD15CiMgQ09ORklHX1NBVEFfTVYgaXMgbm90
IHNldAojIENPTkZJR19TQVRBX05WIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9QUk9NSVNF
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9TSUwgaXMgbm90IHNldAojIENPTkZJR19TQVRB
X1NJUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfU1ZXIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0FUQV9VTEkgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1ZJQSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NBVEFfVklURVNTRSBpcyBub3Qgc2V0CgojCiMgUEFUQSBTRkYgY29udHJvbGxlcnMg
d2l0aCBCTURNQQojCiMgQ09ORklHX1BBVEFfQUxJIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9BTUQgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0FSVE9QIGlzIG5vdCBzZXQKIyBDT05G
SUdfUEFUQV9BVElJWFAgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0FUUDg2N1ggaXMgbm90
IHNldAojIENPTkZJR19QQVRBX0NNRDY0WCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQ1M1
NTIwIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9DUzU1MzAgaXMgbm90IHNldAojIENPTkZJ
R19QQVRBX0NTNTUzNSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQ1M1NTM2IGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEFUQV9DWVBSRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9FRkFS
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9IUFQzNjYgaXMgbm90IHNldAojIENPTkZJR19Q
QVRBX0hQVDM3WCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfSFBUM1gyTiBpcyBub3Qgc2V0
CiMgQ09ORklHX1BBVEFfSFBUM1gzIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9JVDgyMTMg
aXMgbm90IHNldAojIENPTkZJR19QQVRBX0lUODIxWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BB
VEFfSk1JQ1JPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTUFSVkVMTCBpcyBub3Qgc2V0
CiMgQ09ORklHX1BBVEFfTkVUQ0VMTCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTklOSkEz
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfTlM4NzQxNSBpcyBub3Qgc2V0CiMgQ09ORklH
X1BBVEFfT0xEUElJWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfT1BUSURNQSBpcyBub3Qg
c2V0CiMgQ09ORklHX1BBVEFfUERDMjAyN1ggaXMgbm90IHNldAojIENPTkZJR19QQVRBX1BE
Q19PTEQgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1JBRElTWVMgaXMgbm90IHNldAojIENP
TkZJR19QQVRBX1JEQyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfU0MxMjAwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEFUQV9TQ0ggaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NFUlZFUldP
UktTIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9TSUw2ODAgaXMgbm90IHNldAojIENPTkZJ
R19QQVRBX1NJUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfVE9TSElCQSBpcyBub3Qgc2V0
CiMgQ09ORklHX1BBVEFfVFJJRkxFWCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfVklBIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEFUQV9XSU5CT05EIGlzIG5vdCBzZXQKCiMKIyBQSU8tb25s
eSBTRkYgY29udHJvbGxlcnMKIwojIENPTkZJR19QQVRBX0NNRDY0MF9QQ0kgaXMgbm90IHNl
dAojIENPTkZJR19QQVRBX01QSUlYIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9OUzg3NDEw
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9PUFRJIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9QQ01DSUEgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1JaMTAwMCBpcyBub3Qgc2V0Cgoj
CiMgR2VuZXJpYyBmYWxsYmFjayAvIGxlZ2FjeSBkcml2ZXJzCiMKIyBDT05GSUdfUEFUQV9B
Q1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfQVRBX0dFTkVSSUMgaXMgbm90IHNldAojIENPTkZJ
R19QQVRBX0xFR0FDWSBpcyBub3Qgc2V0CkNPTkZJR19NRD15CiMgQ09ORklHX0JMS19ERVZf
TUQgaXMgbm90IHNldAojIENPTkZJR19NRF9CSVRNQVBfRklMRSBpcyBub3Qgc2V0CiMgQ09O
RklHX0JDQUNIRSBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVWX0RNX0JVSUxUSU49eQpDT05G
SUdfQkxLX0RFVl9ETT1tCkNPTkZJR19ETV9ERUJVRz15CkNPTkZJR19ETV9CVUZJTz1tCkNP
TkZJR19ETV9ERUJVR19CTE9DS19NQU5BR0VSX0xPQ0tJTkc9eQojIENPTkZJR19ETV9ERUJV
R19CTE9DS19TVEFDS19UUkFDSU5HIGlzIG5vdCBzZXQKQ09ORklHX0RNX0JJT19QUklTT049
bQpDT05GSUdfRE1fUEVSU0lTVEVOVF9EQVRBPW0KIyBDT05GSUdfRE1fVU5TVFJJUEVEIGlz
IG5vdCBzZXQKQ09ORklHX0RNX0NSWVBUPW0KIyBDT05GSUdfRE1fU05BUFNIT1QgaXMgbm90
IHNldApDT05GSUdfRE1fVEhJTl9QUk9WSVNJT05JTkc9bQojIENPTkZJR19ETV9DQUNIRSBp
cyBub3Qgc2V0CiMgQ09ORklHX0RNX1dSSVRFQ0FDSEUgaXMgbm90IHNldAojIENPTkZJR19E
TV9FUkEgaXMgbm90IHNldAojIENPTkZJR19ETV9DTE9ORSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RNX01JUlJPUiBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX1JBSUQgaXMgbm90IHNldAojIENP
TkZJR19ETV9aRVJPIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1fTVVMVElQQVRIIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRE1fREVMQVkgaXMgbm90IHNldAojIENPTkZJR19ETV9EVVNUIGlzIG5v
dCBzZXQKQ09ORklHX0RNX1VFVkVOVD15CiMgQ09ORklHX0RNX0ZMQUtFWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0RNX1ZFUklUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RNX1NXSVRDSCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0RNX0xPR19XUklURVMgaXMgbm90IHNldAojIENPTkZJR19ETV9J
TlRFR1JJVFkgaXMgbm90IHNldAojIENPTkZJR19UQVJHRVRfQ09SRSBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZVU0lPTiBpcyBub3Qgc2V0CgojCiMgSUVFRSAxMzk0IChGaXJlV2lyZSkgc3Vw
cG9ydAojCiMgQ09ORklHX0ZJUkVXSVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfRklSRVdJUkVf
Tk9TWSBpcyBub3Qgc2V0CiMgZW5kIG9mIElFRUUgMTM5NCAoRmlyZVdpcmUpIHN1cHBvcnQK
CiMgQ09ORklHX01BQ0lOVE9TSF9EUklWRVJTIGlzIG5vdCBzZXQKQ09ORklHX05FVERFVklD
RVM9eQpDT05GSUdfTkVUX0NPUkU9eQojIENPTkZJR19CT05ESU5HIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFVNTVkgaXMgbm90IHNldApDT05GSUdfV0lSRUdVQVJEPW0KIyBDT05GSUdfV0lS
RUdVQVJEX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfT1ZQTiBpcyBub3Qgc2V0CiMgQ09O
RklHX0VRVUFMSVpFUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9GQyBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9URUFNIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFDVkxBTiBpcyBub3Qgc2V0
CiMgQ09ORklHX0lQVkxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZYTEFOIGlzIG5vdCBzZXQK
IyBDT05GSUdfR0VORVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFSRVVEUCBpcyBub3Qgc2V0
CiMgQ09ORklHX0dUUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BGQ1AgaXMgbm90IHNldAojIENP
TkZJR19NQUNTRUMgaXMgbm90IHNldApDT05GSUdfTkVUQ09OU09MRT15CiMgQ09ORklHX05F
VENPTlNPTEVfRVhURU5ERURfTE9HIGlzIG5vdCBzZXQKQ09ORklHX05FVFBPTEw9eQpDT05G
SUdfTkVUX1BPTExfQ09OVFJPTExFUj15CkNPTkZJR19UVU49bQojIENPTkZJR19UVU5fVk5F
VF9DUk9TU19MRSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZFVEggaXMgbm90IHNldApDT05GSUdf
VklSVElPX05FVD15CiMgQ09ORklHX05MTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUS0lU
IGlzIG5vdCBzZXQKIyBDT05GSUdfQVJDTkVUIGlzIG5vdCBzZXQKQ09ORklHX0VUSEVSTkVU
PXkKIyBDT05GSUdfTkVUX1ZFTkRPUl8zQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9BREFQVEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BR0VSRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQUxBQ1JJVEVDSCBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9WRU5ET1JfQUxURU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQUxURVJBX1RTRSBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQU1BWk9OIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX1ZFTkRPUl9BTUQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FRVUFO
VElBIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BUkMgaXMgbm90IHNldAojIENP
TkZJR19ORVRfVkVORE9SX0FTSVggaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0FU
SEVST1MgaXMgbm90IHNldAojIENPTkZJR19DWF9FQ0FUIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX1ZFTkRPUl9CUk9BRENPTSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQ0FE
RU5DRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQ0FWSVVNIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1ZFTkRPUl9DSEVMU0lPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9DSVNDTyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQ09SVElOQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfREFWSUNPTSBpcyBub3Qgc2V0CiMgQ09ORklH
X0RORVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX0RFQyBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9WRU5ET1JfRExJTksgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9S
X0VNVUxFWCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfRU5HTEVERVIgaXMgbm90
IHNldAojIENPTkZJR19ORVRfVkVORE9SX0VaQ0hJUCBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
VkVORE9SX0ZVSklUU1U9eQojIENPTkZJR19QQ01DSUFfRk1WSjE4WCBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9WRU5ET1JfRlVOR0lCTEUgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX0dPT0dMRSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfSElTSUxJQ09OIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9IVUFXRUkgaXMgbm90IHNldAojIENPTkZJ
R19ORVRfVkVORE9SX0k4MjVYWCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0lOVEVM
PXkKIyBDT05GSUdfRTEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0UxMDAwIGlzIG5vdCBzZXQK
Q09ORklHX0UxMDAwRT15CkNPTkZJR19FMTAwMEVfSFdUUz15CiMgQ09ORklHX0lHQiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lHQlZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSVhHQkUgaXMgbm90
IHNldAojIENPTkZJR19JWEdCRVZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSTQwRSBpcyBub3Qg
c2V0CiMgQ09ORklHX0k0MEVWRiBpcyBub3Qgc2V0CiMgQ09ORklHX0lDRSBpcyBub3Qgc2V0
CiMgQ09ORklHX0ZNMTBLIGlzIG5vdCBzZXQKIyBDT05GSUdfSUdDIGlzIG5vdCBzZXQKIyBD
T05GSUdfSURQRiBpcyBub3Qgc2V0CiMgQ09ORklHX0pNRSBpcyBub3Qgc2V0CiMgQ09ORklH
X05FVF9WRU5ET1JfTElURVggaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01BUlZF
TEwgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01FTExBTk9YIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkVUX1ZFTkRPUl9NRVRBIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9NSUNSRUwgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX01JQ1JPQ0hJUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTUlDUk9TRU1JIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVUX1ZFTkRPUl9NSUNST1NPRlQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9S
X01ZUkkgaXMgbm90IHNldAojIENPTkZJR19GRUFMTlggaXMgbm90IHNldAojIENPTkZJR19O
RVRfVkVORE9SX05JIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9OQVRTRU1JIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9ORVRFUklPTiBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9WRU5ET1JfTkVUUk9OT01FIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9OVklESUEgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX09LSSBpcyBub3Qgc2V0
CiMgQ09ORklHX0VUSE9DIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9QQUNLRVRf
RU5HSU5FUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUEVOU0FORE8gaXMgbm90
IHNldAojIENPTkZJR19ORVRfVkVORE9SX1FMT0dJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfQlJPQ0FERSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUVVBTENP
TU0gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1JEQyBpcyBub3Qgc2V0CiMgQ09O
RklHX05FVF9WRU5ET1JfUkVBTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1Jf
UkVORVNBUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfUk9DS0VSIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TQU1TVU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9TRUVRIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TSUxBTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU0lTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVU
X1ZFTkRPUl9TT0xBUkZMQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TTVND
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TT0NJT05FWFQgaXMgbm90IHNldAoj
IENPTkZJR19ORVRfVkVORE9SX1NUTUlDUk8gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX1NVTiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU1lOT1BTWVMgaXMgbm90
IHNldAojIENPTkZJR19ORVRfVkVORE9SX1RFSFVUSSBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfVEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1ZFUlRFWENPTSBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfVklBIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkVUX1ZFTkRPUl9XQU5HWFVOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9XSVpO
RVQgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1hJTElOWCBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfVkVORE9SX1hJUkNPTT15CiMgQ09ORklHX1BDTUNJQV9YSVJDMlBTIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkRESSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJUFBJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEhZTElCIGlzIG5vdCBzZXQKIyBDT05GSUdfTURJT19CVVMgaXMgbm90
IHNldAoKIwojIFBDUyBkZXZpY2UgZHJpdmVycwojCiMgQ09ORklHX1BDU19YUENTIGlzIG5v
dCBzZXQKIyBlbmQgb2YgUENTIGRldmljZSBkcml2ZXJzCgojIENPTkZJR19QUFAgaXMgbm90
IHNldAojIENPTkZJR19TTElQIGlzIG5vdCBzZXQKCiMKIyBIb3N0LXNpZGUgVVNCIHN1cHBv
cnQgaXMgbmVlZGVkIGZvciBVU0IgTmV0d29yayBBZGFwdGVyIHN1cHBvcnQKIwojIENPTkZJ
R19VU0JfTkVUX0RSSVZFUlMgaXMgbm90IHNldApDT05GSUdfV0xBTj15CiMgQ09ORklHX1dM
QU5fVkVORE9SX0FETVRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX0FUSCBp
cyBub3Qgc2V0CiMgQ09ORklHX1dMQU5fVkVORE9SX0FUTUVMIGlzIG5vdCBzZXQKIyBDT05G
SUdfV0xBTl9WRU5ET1JfQlJPQURDT00gaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1Jf
SU5URUw9eQojIENPTkZJR19JUFcyMTAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSVBXMjIwMCBp
cyBub3Qgc2V0CkNPTkZJR19JV0xFR0FDWT1tCiMgQ09ORklHX0lXTDQ5NjUgaXMgbm90IHNl
dApDT05GSUdfSVdMMzk0NT1tCgojCiMgaXdsMzk0NSAvIGl3bDQ5NjUgRGVidWdnaW5nIE9w
dGlvbnMKIwojIENPTkZJR19JV0xFR0FDWV9ERUJVRyBpcyBub3Qgc2V0CiMgZW5kIG9mIGl3
bDM5NDUgLyBpd2w0OTY1IERlYnVnZ2luZyBPcHRpb25zCgojIENPTkZJR19JV0xXSUZJIGlz
IG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfSU5URVJTSUwgaXMgbm90IHNldAojIENP
TkZJR19XTEFOX1ZFTkRPUl9NQVJWRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5E
T1JfTUVESUFURUsgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9NSUNST0NISVAg
aXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9QVVJFTElGSSBpcyBub3Qgc2V0CiMg
Q09ORklHX1dMQU5fVkVORE9SX1JBTElOSyBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRP
Ul9SRUFMVEVLPXkKIyBDT05GSUdfUlRMODE4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUTDgx
ODcgaXMgbm90IHNldAojIENPTkZJR19SVExfQ0FSRFMgaXMgbm90IHNldApDT05GSUdfUlRM
OFhYWFU9bQojIENPTkZJR19SVEw4WFhYVV9VTlRFU1RFRCBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUVzg4IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRXODkgaXMgbm90IHNldAojIENPTkZJR19X
TEFOX1ZFTkRPUl9SU0kgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9TSUxBQlMg
aXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9TVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1dMQU5fVkVORE9SX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfWllEQVMg
aXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9RVUFOVEVOTkEgaXMgbm90IHNldAoj
IENPTkZJR19NQUM4MDIxMV9IV1NJTSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJUlRfV0lGSSBp
cyBub3Qgc2V0CiMgQ09ORklHX1dBTiBpcyBub3Qgc2V0CgojCiMgV2lyZWxlc3MgV0FOCiMK
IyBDT05GSUdfV1dBTiBpcyBub3Qgc2V0CiMgZW5kIG9mIFdpcmVsZXNzIFdBTgoKIyBDT05G
SUdfVk1YTkVUMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZVSklUU1VfRVMgaXMgbm90IHNldAoj
IENPTkZJR19ORVRERVZTSU0gaXMgbm90IHNldApDT05GSUdfTkVUX0ZBSUxPVkVSPXkKIyBD
T05GSUdfSVNETiBpcyBub3Qgc2V0CgojCiMgSW5wdXQgZGV2aWNlIHN1cHBvcnQKIwpDT05G
SUdfSU5QVVQ9eQpDT05GSUdfSU5QVVRfTEVEUz1tCkNPTkZJR19JTlBVVF9GRl9NRU1MRVNT
PW0KQ09ORklHX0lOUFVUX1NQQVJTRUtNQVA9bQojIENPTkZJR19JTlBVVF9NQVRSSVhLTUFQ
IGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX1ZJVkFMRElGTUFQPXkKCiMKIyBVc2VybGFuZCBp
bnRlcmZhY2VzCiMKIyBDT05GSUdfSU5QVVRfTU9VU0VERVYgaXMgbm90IHNldApDT05GSUdf
SU5QVVRfSk9ZREVWPW0KQ09ORklHX0lOUFVUX0VWREVWPW0KQ09ORklHX0lOUFVUX0tVTklU
X1RFU1Q9bQoKIwojIElucHV0IERldmljZSBEcml2ZXJzCiMKQ09ORklHX0lOUFVUX0tFWUJP
QVJEPXkKIyBDT05GSUdfS0VZQk9BUkRfQURQNTU4OCBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX0FEUDU1ODkgaXMgbm90IHNldApDT05GSUdfS0VZQk9BUkRfQVRLQkQ9eQojIENP
TkZJR19LRVlCT0FSRF9RVDEwNTAgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9RVDEw
NzAgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9RVDIxNjAgaXMgbm90IHNldAojIENP
TkZJR19LRVlCT0FSRF9ETElOS19ESVI2ODUgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FS
RF9MS0tCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0dQSU8gaXMgbm90IHNldAoj
IENPTkZJR19LRVlCT0FSRF9HUElPX1BPTExFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJP
QVJEX1RDQTY0MTYgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9UQ0E4NDE4IGlzIG5v
dCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTUFUUklYIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZ
Qk9BUkRfTE04MzIzIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTE04MzMzIGlzIG5v
dCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTUFYNzM1OSBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX01QUjEyMSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX05FV1RPTiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX09QRU5DT1JFUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0tFWUJPQVJEX1NBTVNVTkcgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9TVE9XQVdB
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1NVTktCRCBpcyBub3Qgc2V0CiMgQ09O
RklHX0tFWUJPQVJEX1RNMl9UT1VDSEtFWSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJE
X1hUS0JEIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfQ1lQUkVTU19TRiBpcyBub3Qg
c2V0CkNPTkZJR19JTlBVVF9NT1VTRT15CkNPTkZJR19NT1VTRV9QUzI9eQojIENPTkZJR19N
T1VTRV9QUzJfQUxQUyBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9CWUQgaXMgbm90
IHNldAojIENPTkZJR19NT1VTRV9QUzJfTE9HSVBTMlBQIGlzIG5vdCBzZXQKQ09ORklHX01P
VVNFX1BTMl9TWU5BUFRJQ1M9eQojIENPTkZJR19NT1VTRV9QUzJfU1lOQVBUSUNTX1NNQlVT
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfUFMyX0NZUFJFU1MgaXMgbm90IHNldAojIENP
TkZJR19NT1VTRV9QUzJfTElGRUJPT0sgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9QUzJf
VFJBQ0tQT0lOVCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9FTEFOVEVDSCBpcyBu
b3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9TRU5URUxJQyBpcyBub3Qgc2V0CiMgQ09ORklH
X01PVVNFX1BTMl9UT1VDSEtJVCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1BTMl9GT0NB
TFRFQ0ggaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9QUzJfVk1NT1VTRSBpcyBub3Qgc2V0
CiMgQ09ORklHX01PVVNFX1NFUklBTCBpcyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX0FQUExF
VE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9CQ001OTc0IGlzIG5vdCBzZXQKIyBD
T05GSUdfTU9VU0VfQ1lBUEEgaXMgbm90IHNldAojIENPTkZJR19NT1VTRV9FTEFOX0kyQyBp
cyBub3Qgc2V0CiMgQ09ORklHX01PVVNFX1ZTWFhYQUEgaXMgbm90IHNldAojIENPTkZJR19N
T1VTRV9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTU9VU0VfU1lOQVBUSUNTX0kyQyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01PVVNFX1NZTkFQVElDU19VU0IgaXMgbm90IHNldApDT05GSUdf
SU5QVVRfSk9ZU1RJQ0s9eQojIENPTkZJR19KT1lTVElDS19BTkFMT0cgaXMgbm90IHNldAoj
IENPTkZJR19KT1lTVElDS19BM0QgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19BREkg
aXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19DT0JSQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0pPWVNUSUNLX0dGMksgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19HUklQIGlzIG5v
dCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfR1JJUF9NUCBpcyBub3Qgc2V0CiMgQ09ORklHX0pP
WVNUSUNLX0dVSUxMRU1PVCBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0lOVEVSQUNU
IGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfU0lERVdJTkRFUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0pPWVNUSUNLX1RNREMgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19JRk9S
Q0UgaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19XQVJSSU9SIGlzIG5vdCBzZXQKIyBD
T05GSUdfSk9ZU1RJQ0tfTUFHRUxMQU4gaXMgbm90IHNldAojIENPTkZJR19KT1lTVElDS19T
UEFDRU9SQiBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX1NQQUNFQkFMTCBpcyBub3Qg
c2V0CiMgQ09ORklHX0pPWVNUSUNLX1NUSU5HRVIgaXMgbm90IHNldAojIENPTkZJR19KT1lT
VElDS19UV0lESk9ZIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfWkhFTkhVQSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0pPWVNUSUNLX0FTNTAxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0pP
WVNUSUNLX0pPWURVTVAgaXMgbm90IHNldApDT05GSUdfSk9ZU1RJQ0tfWFBBRD1tCiMgQ09O
RklHX0pPWVNUSUNLX1hQQURfRkYgaXMgbm90IHNldApDT05GSUdfSk9ZU1RJQ0tfWFBBRF9M
RURTPXkKIyBDT05GSUdfSk9ZU1RJQ0tfUFhSQyBpcyBub3Qgc2V0CiMgQ09ORklHX0pPWVNU
SUNLX1FXSUlDIGlzIG5vdCBzZXQKIyBDT05GSUdfSk9ZU1RJQ0tfRlNJQTZCIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSk9ZU1RJQ0tfU0VOU0VIQVQgaXMgbm90IHNldAojIENPTkZJR19KT1lT
VElDS19TRUVTQVcgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9UQUJMRVQgaXMgbm90IHNl
dAojIENPTkZJR19JTlBVVF9UT1VDSFNDUkVFTiBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9N
SVNDPXkKIyBDT05GSUdfSU5QVVRfQUQ3MTRYIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRf
Qk1BMTUwIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRTNYMF9CVVRUT04gaXMgbm90IHNl
dAojIENPTkZJR19JTlBVVF9NTUE4NDUwIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfQVBB
TkVMIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfR1BJT19CRUVQRVIgaXMgbm90IHNldAoj
IENPTkZJR19JTlBVVF9HUElPX0RFQ09ERVIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9H
UElPX1ZJQlJBIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfV0lTVFJPTl9CVE5TIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU5QVVRfQVRMQVNfQlROUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lO
UFVUX0FUSV9SRU1PVEUyIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfS0VZU1BBTl9SRU1P
VEUgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9LWFRKOSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lOUFVUX1BPV0VSTUFURSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1lFQUxJTksgaXMg
bm90IHNldAojIENPTkZJR19JTlBVVF9DTTEwOSBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9V
SU5QVVQ9bQojIENPTkZJR19JTlBVVF9QQ0Y4NTc0IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5Q
VVRfR1BJT19ST1RBUllfRU5DT0RFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0RBNzI4
MF9IQVBUSUNTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfQURYTDM0WCBpcyBub3Qgc2V0
CiMgQ09ORklHX0lOUFVUX0lNU19QQ1UgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9JUVMy
NjlBIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSVFTNjI2QSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOUFVUX0lRUzcyMjIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9DTUEzMDAwIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSURFQVBBRF9TTElERUJBUiBpcyBub3Qgc2V0CiMg
Q09ORklHX0lOUFVUX0RSVjI2MFhfSEFQVElDUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVU
X0RSVjI2NjVfSEFQVElDUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0RSVjI2NjdfSEFQ
VElDUyBpcyBub3Qgc2V0CiMgQ09ORklHX1JNSTRfQ09SRSBpcyBub3Qgc2V0CgojCiMgSGFy
ZHdhcmUgSS9PIHBvcnRzCiMKQ09ORklHX1NFUklPPXkKQ09ORklHX0FSQ0hfTUlHSFRfSEFW
RV9QQ19TRVJJTz15CkNPTkZJR19TRVJJT19JODA0Mj15CiMgQ09ORklHX1NFUklPX1NFUlBP
UlQgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19DVDgyQzcxMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFUklPX1BDSVBTMiBpcyBub3Qgc2V0CkNPTkZJR19TRVJJT19MSUJQUzI9eQojIENP
TkZJR19TRVJJT19SQVcgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19BTFRFUkFfUFMyIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VSSU9fUFMyTVVMVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
UklPX0FSQ19QUzIgaXMgbm90IHNldAojIENPTkZJR19TRVJJT19HUElPX1BTMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTRVJJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0dBTUVQT1JUIGlzIG5v
dCBzZXQKIyBlbmQgb2YgSGFyZHdhcmUgSS9PIHBvcnRzCiMgZW5kIG9mIElucHV0IGRldmlj
ZSBzdXBwb3J0CgojCiMgQ2hhcmFjdGVyIGRldmljZXMKIwpDT05GSUdfVFRZPXkKQ09ORklH
X1ZUPXkKQ09ORklHX0NPTlNPTEVfVFJBTlNMQVRJT05TPXkKQ09ORklHX1ZUX0NPTlNPTEU9
eQpDT05GSUdfVlRfQ09OU09MRV9TTEVFUD15CkNPTkZJR19WVF9IV19DT05TT0xFX0JJTkRJ
Tkc9eQpDT05GSUdfVU5JWDk4X1BUWVM9eQojIENPTkZJR19MRUdBQ1lfUFRZUyBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFR0FDWV9USU9DU1RJIGlzIG5vdCBzZXQKQ09ORklHX0xESVNDX0FV
VE9MT0FEPXkKCiMKIyBTZXJpYWwgZHJpdmVycwojCkNPTkZJR19TRVJJQUxfRUFSTFlDT049
eQpDT05GSUdfU0VSSUFMXzgyNTA9eQojIENPTkZJR19TRVJJQUxfODI1MF9ERVBSRUNBVEVE
X09QVElPTlMgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfODI1MF9QTlAgaXMgbm90IHNl
dAojIENPTkZJR19TRVJJQUxfODI1MF8xNjU1MEFfVkFSSUFOVFMgaXMgbm90IHNldAojIENP
TkZJR19TRVJJQUxfODI1MF9GSU5URUsgaXMgbm90IHNldApDT05GSUdfU0VSSUFMXzgyNTBf
Q09OU09MRT15CiMgQ09ORklHX1NFUklBTF84MjUwX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFUklBTF84MjUwX0VYQVIgaXMgbm90IHNldApDT05GSUdfU0VSSUFMXzgyNTBfQ1M9eQpD
T05GSUdfU0VSSUFMXzgyNTBfTlJfVUFSVFM9OApDT05GSUdfU0VSSUFMXzgyNTBfUlVOVElN
RV9VQVJUUz04CiMgQ09ORklHX1NFUklBTF84MjUwX0VYVEVOREVEIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VSSUFMXzgyNTBfUENJMVhYWFggaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxf
ODI1MF9EVyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF84MjUwX1JUMjg4WCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFUklBTF84MjUwX0xQU1MgaXMgbm90IHNldAojIENPTkZJR19TRVJJ
QUxfODI1MF9NSUQgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfODI1MF9QRVJJQ09NIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfTkkgaXMgbm90IHNldAoKIwojIE5vbi04
MjUwIHNlcmlhbCBwb3J0IHN1cHBvcnQKIwojIENPTkZJR19TRVJJQUxfVUFSVExJVEUgaXMg
bm90IHNldApDT05GSUdfU0VSSUFMX0NPUkU9eQpDT05GSUdfU0VSSUFMX0NPUkVfQ09OU09M
RT15CiMgQ09ORklHX1NFUklBTF9KU00gaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfTEFO
VElRIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX1NDQ05YUCBpcyBub3Qgc2V0CiMgQ09O
RklHX1NFUklBTF9TQzE2SVM3WFggaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfVElNQkVS
REFMRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9BTFRFUkFfSlRBR1VBUlQgaXMgbm90
IHNldAojIENPTkZJR19TRVJJQUxfQUxURVJBX1VBUlQgaXMgbm90IHNldAojIENPTkZJR19T
RVJJQUxfUENIX1VBUlQgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfQVJDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VSSUFMX1JQMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9GU0xf
TFBVQVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0ZTTF9MSU5GTEVYVUFSVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TUFJEIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2VyaWFs
IGRyaXZlcnMKCkNPTkZJR19TRVJJQUxfTUNUUkxfR1BJTz15CiMgQ09ORklHX1NFUklBTF9O
T05TVEFOREFSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQV0lSRUxFU1MgaXMgbm90IHNldAoj
IENPTkZJR19OX0dTTSBpcyBub3Qgc2V0CiMgQ09ORklHX05PWk9NSSBpcyBub3Qgc2V0CiMg
Q09ORklHX05VTExfVFRZIGlzIG5vdCBzZXQKQ09ORklHX0hWQ19EUklWRVI9eQojIENPTkZJ
R19TRVJJQUxfREVWX0JVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RUWV9QUklOVEsgaXMgbm90
IHNldApDT05GSUdfVklSVElPX0NPTlNPTEU9eQojIENPTkZJR19JUE1JX0hBTkRMRVIgaXMg
bm90IHNldApDT05GSUdfSFdfUkFORE9NPW0KIyBDT05GSUdfSFdfUkFORE9NX1RJTUVSSU9N
RU0gaXMgbm90IHNldAojIENPTkZJR19IV19SQU5ET01fSU5URUwgaXMgbm90IHNldAojIENP
TkZJR19IV19SQU5ET01fQU1EIGlzIG5vdCBzZXQKIyBDT05GSUdfSFdfUkFORE9NX0JBNDMx
IGlzIG5vdCBzZXQKIyBDT05GSUdfSFdfUkFORE9NX0dFT0RFIGlzIG5vdCBzZXQKIyBDT05G
SUdfSFdfUkFORE9NX1ZJQSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fVklSVElPPW0K
IyBDT05GSUdfSFdfUkFORE9NX1hJUEhFUkEgaXMgbm90IHNldAojIENPTkZJR19BUFBMSUNP
TSBpcyBub3Qgc2V0CiMgQ09ORklHX1NPTllQSSBpcyBub3Qgc2V0CiMgQ09ORklHX01XQVZF
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEM4NzM2eF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdf
TlNDX0dQSU8gaXMgbm90IHNldApDT05GSUdfREVWTUVNPXkKQ09ORklHX05WUkFNPW0KQ09O
RklHX0RFVlBPUlQ9eQojIENPTkZJR19IUEVUIGlzIG5vdCBzZXQKIyBDT05GSUdfSEFOR0NI
RUNLX1RJTUVSIGlzIG5vdCBzZXQKIyBDT05GSUdfVENHX1RQTSBpcyBub3Qgc2V0CiMgQ09O
RklHX1RFTENMT0NLIGlzIG5vdCBzZXQKIyBDT05GSUdfWElMTFlCVVMgaXMgbm90IHNldAoj
IENPTkZJR19YSUxMWVVTQiBpcyBub3Qgc2V0CiMgZW5kIG9mIENoYXJhY3RlciBkZXZpY2Vz
CgojCiMgSTJDIHN1cHBvcnQKIwpDT05GSUdfSTJDPXkKQ09ORklHX0FDUElfSTJDX09QUkVH
SU9OPXkKQ09ORklHX0kyQ19CT0FSRElORk89eQpDT05GSUdfSTJDX0NIQVJERVY9eQojIENP
TkZJR19JMkNfTVVYIGlzIG5vdCBzZXQKQ09ORklHX0kyQ19IRUxQRVJfQVVUTz15CkNPTkZJ
R19JMkNfU01CVVM9eQpDT05GSUdfSTJDX0FMR09CSVQ9bQoKIwojIEkyQyBIYXJkd2FyZSBC
dXMgc3VwcG9ydAojCgojCiMgUEMgU01CdXMgaG9zdCBjb250cm9sbGVyIGRyaXZlcnMKIwoj
IENPTkZJR19JMkNfQUxJMTUzNSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTEkxNTYzIGlz
IG5vdCBzZXQKIyBDT05GSUdfSTJDX0FMSTE1WDMgaXMgbm90IHNldAojIENPTkZJR19JMkNf
QU1ENzU2IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0FNRDgxMTEgaXMgbm90IHNldAojIENP
TkZJR19JMkNfQU1EX01QMiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTURfQVNGIGlzIG5v
dCBzZXQKQ09ORklHX0kyQ19JODAxPXkKIyBDT05GSUdfSTJDX0lTQ0ggaXMgbm90IHNldAoj
IENPTkZJR19JMkNfSVNNVCBpcyBub3Qgc2V0CkNPTkZJR19JMkNfUElJWDQ9eQojIENPTkZJ
R19JMkNfTkZPUkNFMiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19OVklESUFfR1BVIGlzIG5v
dCBzZXQKIyBDT05GSUdfSTJDX1NJUzU1OTUgaXMgbm90IHNldAojIENPTkZJR19JMkNfU0lT
NjMwIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJUzk2WCBpcyBub3Qgc2V0CiMgQ09ORklH
X0kyQ19WSUEgaXMgbm90IHNldAojIENPTkZJR19JMkNfVklBUFJPIGlzIG5vdCBzZXQKIyBD
T05GSUdfSTJDX1pIQU9YSU4gaXMgbm90IHNldAoKIwojIEFDUEkgZHJpdmVycwojCkNPTkZJ
R19JMkNfU0NNST1tCgojCiMgSTJDIHN5c3RlbSBidXMgZHJpdmVycyAobW9zdGx5IGVtYmVk
ZGVkIC8gc3lzdGVtLW9uLWNoaXApCiMKIyBDT05GSUdfSTJDX0NCVVNfR1BJTyBpcyBub3Qg
c2V0CiMgQ09ORklHX0kyQ19ERVNJR05XQVJFX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19J
MkNfRUcyMFQgaXMgbm90IHNldAojIENPTkZJR19JMkNfRU1FVjIgaXMgbm90IHNldAojIENP
TkZJR19JMkNfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19PQ09SRVMgaXMgbm90IHNl
dAojIENPTkZJR19JMkNfUENBX1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX1NJ
TVRFQyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19YSUxJTlggaXMgbm90IHNldAoKIwojIEV4
dGVybmFsIEkyQy9TTUJ1cyBhZGFwdGVyIGRyaXZlcnMKIwojIENPTkZJR19JMkNfRElPTEFO
X1UyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19DUDI2MTUgaXMgbm90IHNldAojIENPTkZJ
R19JMkNfUENJMVhYWFggaXMgbm90IHNldAojIENPTkZJR19JMkNfUk9CT1RGVVpaX09TSUYg
aXMgbm90IHNldAojIENPTkZJR19JMkNfVEFPU19FVk0gaXMgbm90IHNldAojIENPTkZJR19J
MkNfVElOWV9VU0IgaXMgbm90IHNldAoKIwojIE90aGVyIEkyQy9TTUJ1cyBidXMgZHJpdmVy
cwojCiMgQ09ORklHX1NDeDIwMF9BQ0IgaXMgbm90IHNldApDT05GSUdfSTJDX1ZJUlRJTz1t
CiMgZW5kIG9mIEkyQyBIYXJkd2FyZSBCdXMgc3VwcG9ydAoKIyBDT05GSUdfSTJDX1NUVUIg
aXMgbm90IHNldAojIENPTkZJR19JMkNfU0xBVkUgaXMgbm90IHNldAojIENPTkZJR19JMkNf
REVCVUdfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJVR19BTEdPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSTJDX0RFQlVHX0JVUyBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBzdXBw
b3J0CgojIENPTkZJR19JM0MgaXMgbm90IHNldAojIENPTkZJR19TUEkgaXMgbm90IHNldAoj
IENPTkZJR19TUE1JIGlzIG5vdCBzZXQKIyBDT05GSUdfSFNJIGlzIG5vdCBzZXQKIyBDT05G
SUdfUFBTIGlzIG5vdCBzZXQKCiMKIyBQVFAgY2xvY2sgc3VwcG9ydAojCiMgQ09ORklHX1BU
UF8xNTg4X0NMT0NLIGlzIG5vdCBzZXQKQ09ORklHX1BUUF8xNTg4X0NMT0NLX09QVElPTkFM
PXkKCiMKIyBFbmFibGUgUEhZTElCIGFuZCBORVRXT1JLX1BIWV9USU1FU1RBTVBJTkcgdG8g
c2VlIHRoZSBhZGRpdGlvbmFsIGNsb2Nrcy4KIwojIGVuZCBvZiBQVFAgY2xvY2sgc3VwcG9y
dAoKIyBDT05GSUdfUElOQ1RSTCBpcyBub3Qgc2V0CkNPTkZJR19HUElPTElCPXkKQ09ORklH
X0dQSU9MSUJfRkFTVFBBVEhfTElNSVQ9NTEyCkNPTkZJR19HUElPX0FDUEk9eQpDT05GSUdf
R1BJT0xJQl9JUlFDSElQPXkKIyBDT05GSUdfREVCVUdfR1BJTyBpcyBub3Qgc2V0CiMgQ09O
RklHX0dQSU9fU1lTRlMgaXMgbm90IHNldApDT05GSUdfR1BJT19DREVWPXkKQ09ORklHX0dQ
SU9fQ0RFVl9WMT15CgojCiMgTWVtb3J5IG1hcHBlZCBHUElPIGRyaXZlcnMKIwojIENPTkZJ
R19HUElPX0FMVEVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQU1EUFQgaXMgbm90IHNl
dAojIENPTkZJR19HUElPX0RXQVBCIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19HRU5FUklD
X1BMQVRGT1JNIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19HUkFOSVRFUkFQSURTIGlzIG5v
dCBzZXQKIyBDT05GSUdfR1BJT19NQjg2UzdYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19Q
T0xBUkZJUkVfU09DIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19YSUxJTlggaXMgbm90IHNl
dAojIENPTkZJR19HUElPX0FNRF9GQ0ggaXMgbm90IHNldAojIGVuZCBvZiBNZW1vcnkgbWFw
cGVkIEdQSU8gZHJpdmVycwoKIwojIFBvcnQtbWFwcGVkIEkvTyBHUElPIGRyaXZlcnMKIwoj
IENPTkZJR19HUElPX1ZYODU1IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19GNzE4OFggaXMg
bm90IHNldAojIENPTkZJR19HUElPX0lUODcgaXMgbm90IHNldAojIENPTkZJR19HUElPX1ND
SDMxMVggaXMgbm90IHNldAojIENPTkZJR19HUElPX1dJTkJPTkQgaXMgbm90IHNldAojIENP
TkZJR19HUElPX1dTMTZDNDggaXMgbm90IHNldAojIGVuZCBvZiBQb3J0LW1hcHBlZCBJL08g
R1BJTyBkcml2ZXJzCgojCiMgSTJDIEdQSU8gZXhwYW5kZXJzCiMKIyBDT05GSUdfR1BJT19G
WEw2NDA4IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19EUzQ1MjAgaXMgbm90IHNldAojIENP
TkZJR19HUElPX01BWDczMDAgaXMgbm90IHNldAojIENPTkZJR19HUElPX01BWDczMlggaXMg
bm90IHNldAojIENPTkZJR19HUElPX1BDQTk1M1ggaXMgbm90IHNldAojIENPTkZJR19HUElP
X1BDQTk1NzAgaXMgbm90IHNldAojIENPTkZJR19HUElPX1BDRjg1N1ggaXMgbm90IHNldAoj
IENPTkZJR19HUElPX1RQSUMyODEwIGlzIG5vdCBzZXQKIyBlbmQgb2YgSTJDIEdQSU8gZXhw
YW5kZXJzCgojCiMgTUZEIEdQSU8gZXhwYW5kZXJzCiMKIyBDT05GSUdfR1BJT19FTEtIQVJU
TEFLRSBpcyBub3Qgc2V0CiMgZW5kIG9mIE1GRCBHUElPIGV4cGFuZGVycwoKIwojIFBDSSBH
UElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQU1EODExMSBpcyBub3Qgc2V0CiMgQ09O
RklHX0dQSU9fQlQ4WFggaXMgbm90IHNldAojIENPTkZJR19HUElPX01MX0lPSCBpcyBub3Qg
c2V0CiMgQ09ORklHX0dQSU9fUENIIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0lfSURJ
T18xNiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fUENJRV9JRElPXzI0IGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19SREMzMjFYIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIEdQSU8gZXhw
YW5kZXJzCgojCiMgVVNCIEdQSU8gZXhwYW5kZXJzCiMKIyBDT05GSUdfR1BJT19NUFNTRSBp
cyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBHUElPIGV4cGFuZGVycwoKIwojIFZpcnR1YWwgR1BJ
TyBkcml2ZXJzCiMKQ09ORklHX0dQSU9fQUdHUkVHQVRPUj1tCiMgQ09ORklHX0dQSU9fTEFU
Q0ggaXMgbm90IHNldAojIENPTkZJR19HUElPX01PQ0tVUCBpcyBub3Qgc2V0CkNPTkZJR19H
UElPX1ZJUlRJTz1tCiMgQ09ORklHX0dQSU9fU0lNIGlzIG5vdCBzZXQKIyBlbmQgb2YgVmly
dHVhbCBHUElPIGRyaXZlcnMKCiMKIyBHUElPIERlYnVnZ2luZyB1dGlsaXRpZXMKIwojIENP
TkZJR19HUElPX1NMT1BQWV9MT0dJQ19BTkFMWVpFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQ
SU9fVklSVFVTRVIgaXMgbm90IHNldAojIGVuZCBvZiBHUElPIERlYnVnZ2luZyB1dGlsaXRp
ZXMKCkNPTkZJR19ERVZfU1lOQ19QUk9CRT1tCiMgQ09ORklHX1cxIGlzIG5vdCBzZXQKQ09O
RklHX1BPV0VSX1JFU0VUPXkKIyBDT05GSUdfUE9XRVJfUkVTRVRfUkVTVEFSVCBpcyBub3Qg
c2V0CiMgQ09ORklHX1BPV0VSX1JFU0VUX1RPUkFERVhfRUMgaXMgbm90IHNldAojIENPTkZJ
R19QT1dFUl9TRVFVRU5DSU5HIGlzIG5vdCBzZXQKQ09ORklHX1BPV0VSX1NVUFBMWT15CiMg
Q09ORklHX1BPV0VSX1NVUFBMWV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQNVhYWF9Q
T1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfUE9XRVIgaXMgbm90IHNldAojIENPTkZJ
R19DSEFSR0VSX0FEUDUwNjEgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0NIQUdBTEwg
aXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0NXMjAxNSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JBVFRFUllfRFMyNzgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9EUzI3ODEgaXMg
bm90IHNldAojIENPTkZJR19CQVRURVJZX0RTMjc4MiBpcyBub3Qgc2V0CiMgQ09ORklHX0JB
VFRFUllfU0FNU1VOR19TREkgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX1NCUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfU0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVS
WV9CUTI3WFhYIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9NQVgxNzA0MiBpcyBub3Qg
c2V0CiMgQ09ORklHX0JBVFRFUllfTUFYMTcyMFggaXMgbm90IHNldAojIENPTkZJR19DSEFS
R0VSX01BWDg5MDMgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0xQODcyNyBpcyBub3Qg
c2V0CiMgQ09ORklHX0NIQVJHRVJfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJf
TFQzNjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9MVEM0MTYyTCBpcyBub3Qgc2V0
CiMgQ09ORklHX0NIQVJHRVJfTUFYNzc5NzYgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VS
X01BWDg5NzEgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjQxNVggaXMgbm90IHNl
dAojIENPTkZJR19DSEFSR0VSX0JRMjQyNTcgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VS
X0JRMjQ3MzUgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjUxNVggaXMgbm90IHNl
dAojIENPTkZJR19DSEFSR0VSX0JRMjU4OTAgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VS
X0JRMjU5ODAgaXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX0JRMjU2WFggaXMgbm90IHNl
dAojIENPTkZJR19CQVRURVJZX0dBVUdFX0xUQzI5NDEgaXMgbm90IHNldAojIENPTkZJR19C
QVRURVJZX0dPTERGSVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9SVDUwMzMgaXMg
bm90IHNldAojIENPTkZJR19DSEFSR0VSX1JUOTQ1NSBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfQkQ5OTk1NCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfVUczMTA1IGlzIG5v
dCBzZXQKIyBDT05GSUdfRlVFTF9HQVVHRV9NTTgwMTMgaXMgbm90IHNldApDT05GSUdfSFdN
T049bQpDT05GSUdfSFdNT05fREVCVUdfQ0hJUD15CgojCiMgTmF0aXZlIGRyaXZlcnMKIwoj
IENPTkZJR19TRU5TT1JTX0FCSVRVR1VSVSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
QUJJVFVHVVJVMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQUQ3NDE0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19BRDc0MTggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0FETTEwMjUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTEwMjYgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FETTEwMjkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0FETTEwMzEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FETTExNzcgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FETTkyNDAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0FEVDc0MTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDc0MTEgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FEVDc0NjIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0FEVDc0NzAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0FEVDc0NzUgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FIVDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19B
UVVBQ09NUFVURVJfRDVORVhUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BUzM3MCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVNDNzYyMSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfQVNVU19ST0dfUllVSklOIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19B
WElfRkFOX0NPTlRST0wgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0s4VEVNUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVBQTEVTTUMgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0FTQjEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVRYUDEgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0NISVBDQVAyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VO
U09SU19DT1JTQUlSX0NQUk8gaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0NPUlNBSVJf
UFNVIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfRFJJVkVURU1QPW0KIyBDT05GSUdfU0VO
U09SU19EUzYyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRFMxNjIxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19ERUxMX1NNTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfSTVLX0FNQiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRjcxODA1RiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfRjcxODgyRkcgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0Y3NTM3NVMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0ZTQ0hNRCBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfR0lHQUJZVEVfV0FURVJGT1JDRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NFTlNPUlNfR0w1MThTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfR0w1
MjBTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRzc2MEEgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0c3NjIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0hJSDYxMzAg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0hTMzAwMSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfSFRVMzEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0k1NTAwIGlzIG5v
dCBzZXQKQ09ORklHX1NFTlNPUlNfQ09SRVRFTVA9bQojIENPTkZJR19TRU5TT1JTX0lTTDI4
MDIyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JVDg3IGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19KQzQyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19QT1dFUlogaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1BPV1IxMjIwIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19MRU5PVk9fRUMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xJTkVBR0Ug
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xUQzI5NDUgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX0xUQzI5NDdfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEMy
OTkwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEMyOTkxIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19MVEMyOTkyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0
MTUxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0MjE1IGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19MVEM0MjIyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0
MjQ1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0MjYwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19MVEM0MjYxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEM0
MjgyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgxMjcgaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX01BWDE2MDY1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgx
NjE5IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgxNjY4IGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19NQVgxOTcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01BWDMx
NzMwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVgzMTc2MCBpcyBub3Qgc2V0CiMg
Q09ORklHX01BWDMxODI3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVg2NjIwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVg2NjIxIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19NQVg2NjM5IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVg2NjUwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQVg2Njk3IGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19NQVgzMTc5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUMzNFZSNTAw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19NQ1AzMDIxIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19UQzY1NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVFBTMjM4NjEg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX01SNzUyMDMgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX0xNNjMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNNzMgaXMgbm90
IHNldAojIENPTkZJR19TRU5TT1JTX0xNNzUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0xNNzcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNNzggaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX0xNODAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNODMgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNODUgaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0xNODcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTAgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0xNOTIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTMg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTUyMzQgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX0xNOTUyNDEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xNOTUyNDUg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1BDODczNjAgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1BDODc0MjcgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05DVDY2ODMg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05DVDY3NzUgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX05DVDY3NzVfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OQ1Q3
MzYzIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OQ1Q3ODAyIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19OUENNN1hYIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19OWlhU
X0tSQUtFTjIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX05aWFRfS1JBS0VOMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTlpYVF9TTUFSVDIgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX09DQ19QOF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1BDRjg1
OTEgaXMgbm90IHNldAojIENPTkZJR19QTUJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfUFQ1MTYxTCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0JUU0kgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX1NIVDE1IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19T
SFQyMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0hUM3ggaXMgbm90IHNldAojIENP
TkZJR19TRU5TT1JTX1NIVDR4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TSFRDMSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU0lTNTU5NSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfRE1FMTczNyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRU1DMTQwMyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRU1DMjEwMyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfRU1DMjMwNSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfRU1DNlcyMDEg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1NNU0M0N00xIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19TTVNDNDdNMTkyIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TTVND
NDdCMzk3IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19TVFRTNzUxIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19BREMxMjhEODE4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09S
U19BRFM3ODI4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BTUM2ODIxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VOU09SU19JTkEyMDkgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0lOQTJYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSU5BMjM4IGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19JTkEzMjIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19T
UEQ1MTE4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UQzc0IGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VOU09SU19USE1DNTAgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDEw
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QMTAzIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19UTVAxMDggaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDQwMSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVE1QNDIxIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19UTVA0NjQgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RNUDUxMyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVklBX0NQVVRFTVAgaXMgbm90IHNldAojIENPTkZJ
R19TRU5TT1JTX1ZJQTY4NkEgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1ZUMTIxMSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfVlQ4MjMxIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19XODM3NzNHIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3ODFEIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3OTFEIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19XODM3OTJEIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODM3OTMgaXMg
bm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4Mzc5NSBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfVzgzTDc4NVRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19XODNMNzg2Tkcg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1c4MzYyN0hGIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19XODM2MjdFSEYgaXMgbm90IHNldAoKIwojIEFDUEkgZHJpdmVycwojCiMg
Q09ORklHX1NFTlNPUlNfQUNQSV9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
QVRLMDExMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVNVU19XTUkgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX0FTVVNfRUMgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JT
X0hQX1dNSSBpcyBub3Qgc2V0CkNPTkZJR19USEVSTUFMPXkKQ09ORklHX1RIRVJNQUxfTkVU
TElOSz15CiMgQ09ORklHX1RIRVJNQUxfU1RBVElTVElDUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1RIRVJNQUxfREVCVUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxfQ09SRV9URVNU
SU5HIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfRU1FUkdFTkNZX1BPV0VST0ZGX0RFTEFZ
X01TPTAKQ09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1ZfU1RFUF9XSVNFPXkKIyBDT05GSUdf
VEhFUk1BTF9ERUZBVUxUX0dPVl9GQUlSX1NIQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhF
Uk1BTF9ERUZBVUxUX0dPVl9VU0VSX1NQQUNFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhFUk1B
TF9ERUZBVUxUX0dPVl9CQU5HX0JBTkcgaXMgbm90IHNldAojIENPTkZJR19USEVSTUFMX0dP
Vl9GQUlSX1NIQVJFIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfR09WX1NURVBfV0lTRT15
CkNPTkZJR19USEVSTUFMX0dPVl9CQU5HX0JBTkc9eQpDT05GSUdfVEhFUk1BTF9HT1ZfVVNF
Ul9TUEFDRT15CiMgQ09ORklHX1RIRVJNQUxfR09WX1BPV0VSX0FMTE9DQVRPUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1BDSUVfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09ORklHX1RIRVJNQUxf
RU1VTEFUSU9OIGlzIG5vdCBzZXQKCiMKIyBJbnRlbCB0aGVybWFsIGRyaXZlcnMKIwojIENP
TkZJR19JTlRFTF9QT1dFUkNMQU1QIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9USEVSTUFMX1ZF
Q1RPUj15CkNPTkZJR19JTlRFTF9UQ0M9eQpDT05GSUdfWDg2X1BLR19URU1QX1RIRVJNQUw9
bQojIENPTkZJR19JTlRFTF9TT0NfRFRTX1RIRVJNQUwgaXMgbm90IHNldAoKIwojIEFDUEkg
SU5UMzQwWCB0aGVybWFsIGRyaXZlcnMKIwojIGVuZCBvZiBBQ1BJIElOVDM0MFggdGhlcm1h
bCBkcml2ZXJzCgojIENPTkZJR19JTlRFTF9QQ0hfVEhFUk1BTCBpcyBub3Qgc2V0CiMgQ09O
RklHX0lOVEVMX1RDQ19DT09MSU5HIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfSEZJX1RI
RVJNQUwgaXMgbm90IHNldAojIGVuZCBvZiBJbnRlbCB0aGVybWFsIGRyaXZlcnMKCiMgQ09O
RklHX1dBVENIRE9HIGlzIG5vdCBzZXQKQ09ORklHX1NTQl9QT1NTSUJMRT15CiMgQ09ORklH
X1NTQiBpcyBub3Qgc2V0CkNPTkZJR19CQ01BX1BPU1NJQkxFPXkKIyBDT05GSUdfQkNNQSBp
cyBub3Qgc2V0CgojCiMgTXVsdGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwojCiMgQ09ORklH
X01GRF9DUzU1MzUgaXMgbm90IHNldAojIENPTkZJR19NRkRfQVMzNzExIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX1NNUFJPIGlzIG5vdCBzZXQKIyBDT05GSUdfUE1JQ19BRFA1NTIwIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0FBVDI4NzBfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklH
X01GRF9CQ001OTBYWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9CRDk1NzFNV1YgaXMgbm90
IHNldAojIENPTkZJR19NRkRfQVhQMjBYX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9D
R0JDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0NTNDJMNDNfSTJDIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX01BREVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BNSUNfREE5MDNYIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX0RBOTA1Ml9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRf
REE5MDU1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTA2MiBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9EQTkwNjMgaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MTUwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX0RMTjIgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUMxM1hYWF9J
MkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTVAyNjI5IGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX0lOVEVMX1FVQVJLX0kyQ19HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTFBDX0lDSCBp
cyBub3Qgc2V0CiMgQ09ORklHX0xQQ19TQ0ggaXMgbm90IHNldAojIENPTkZJR19NRkRfSU5U
RUxfTFBTU19BQ1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX0xQU1NfUENJIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX1BNQ19CWFQgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfSVFTNjJYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0pBTlpfQ01PRElPIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX0tFTVBMRCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF84OFBN
ODAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEXzg4UE04MDUgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfODhQTTg2MFggaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYMTQ1NzcgaXMgbm90
IHNldAojIENPTkZJR19NRkRfTUFYNzc1NDEgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFY
Nzc2OTMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYNzc3MDUgaXMgbm90IHNldAojIENP
TkZJR19NRkRfTUFYNzc4NDMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODkwNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTI1IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01B
WDg5OTcgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFYODk5OCBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9NVDYzNjAgaXMgbm90IHNldAojIENPTkZJR19NRkRfTVQ2MzcwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX01UNjM5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NRU5GMjFC
TUMgaXMgbm90IHNldAojIENPTkZJR19NRkRfVklQRVJCT0FSRCBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9SRVRVIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NZNzYzNkEgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfUkRDMzIxWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SVDQ4MzEg
aXMgbm90IHNldAojIENPTkZJR19NRkRfUlQ1MDMzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1JUNTEyMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9SQzVUNTgzIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX1NJNDc2WF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1NNNTAxIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1NLWTgxNDUyIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1NZU0NPTiBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MUDM5NDMgaXMgbm90IHNldAojIENP
TkZJR19NRkRfTFA4Nzg4IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0xNVSBpcyBub3Qg
c2V0CiMgQ09ORklHX01GRF9QQUxNQVMgaXMgbm90IHNldAojIENPTkZJR19UUFM2MTA1WCBp
cyBub3Qgc2V0CiMgQ09ORklHX1RQUzY1MDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfVFBTNjUw
N1ggaXMgbm90IHNldAojIENPTkZJR19NRkRfVFBTNjUwODYgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfVFBTNjUwOTAgaXMgbm90IHNldAojIENPTkZJR19NRkRfVElfTFA4NzNYIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1ODZYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQ
UzY1OTEwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1OTEyX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX01GRF9UUFM2NTk0X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RXTDQwMzBf
Q09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RXTDYwNDBfQ09SRSBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9XTDEyNzNfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9MTTM1MzMgaXMg
bm90IHNldAojIENPTkZJR19NRkRfVElNQkVSREFMRSBpcyBub3Qgc2V0CiMgQ09ORklHX01G
RF9UUU1YODYgaXMgbm90IHNldAojIENPTkZJR19NRkRfVlg4NTUgaXMgbm90IHNldAojIENP
TkZJR19NRkRfQVJJWk9OQV9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004NDAwIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1dNODMxWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19N
RkRfV004MzUwX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTg5OTQgaXMgbm90IHNl
dAojIENPTkZJR19NRkRfQVRDMjYwWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfQ1M0
MEw1MF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfVVBCT0FSRF9GUEdBIGlzIG5vdCBz
ZXQKIyBlbmQgb2YgTXVsdGlmdW5jdGlvbiBkZXZpY2UgZHJpdmVycwoKIyBDT05GSUdfUkVH
VUxBVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNfQ09SRSBpcyBub3Qgc2V0CgojCiMgQ0VD
IHN1cHBvcnQKIwojIENPTkZJR19NRURJQV9DRUNfU1VQUE9SVCBpcyBub3Qgc2V0CiMgZW5k
IG9mIENFQyBzdXBwb3J0CgojIENPTkZJR19NRURJQV9TVVBQT1JUIGlzIG5vdCBzZXQKCiMK
IyBHcmFwaGljcyBzdXBwb3J0CiMKQ09ORklHX0FQRVJUVVJFX0hFTFBFUlM9eQpDT05GSUdf
U0NSRUVOX0lORk89eQpDT05GSUdfVklERU89eQojIENPTkZJR19BVVhESVNQTEFZIGlzIG5v
dCBzZXQKIyBDT05GSUdfQUdQIGlzIG5vdCBzZXQKIyBDT05GSUdfVkdBX1NXSVRDSEVST08g
aXMgbm90IHNldApDT05GSUdfRFJNPXkKCiMKIyBEUk0gZGVidWdnaW5nIG9wdGlvbnMKIwpD
T05GSUdfRFJNX1dFUlJPUj15CiMgQ09ORklHX0RSTV9ERUJVR19NTSBpcyBub3Qgc2V0CkNP
TkZJR19EUk1fS1VOSVRfVEVTVF9IRUxQRVJTPW0KQ09ORklHX0RSTV9LVU5JVF9URVNUPW0K
Q09ORklHX0RSTV9TQ0hFRF9LVU5JVF9URVNUPW0KQ09ORklHX0RSTV9FWFBPUlRfRk9SX1RF
U1RTPXkKIyBlbmQgb2YgRFJNIGRlYnVnZ2luZyBvcHRpb25zCgpDT05GSUdfRFJNX0tNU19I
RUxQRVI9eQpDT05GSUdfRFJNX0RSQVc9eQpDT05GSUdfRFJNX1BBTklDPXkKQ09ORklHX0RS
TV9QQU5JQ19GT1JFR1JPVU5EX0NPTE9SPTB4ZmZmZmZmCkNPTkZJR19EUk1fUEFOSUNfQkFD
S0dST1VORF9DT0xPUj0weDAwMDAwMAojIENPTkZJR19EUk1fUEFOSUNfREVCVUcgaXMgbm90
IHNldApDT05GSUdfRFJNX1BBTklDX1NDUkVFTj0idXNlciIKIyBDT05GSUdfRFJNX0RFQlVH
X0RQX01TVF9UT1BPTE9HWV9SRUZTIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9ERUJVR19NT0RF
U0VUX0xPQ0s9eQpDT05GSUdfRFJNX0NMSUVOVD15CkNPTkZJR19EUk1fQ0xJRU5UX0xJQj15
CkNPTkZJR19EUk1fQ0xJRU5UX1NFTEVDVElPTj15CkNPTkZJR19EUk1fQ0xJRU5UX1NFVFVQ
PXkKCiMKIyBTdXBwb3J0ZWQgRFJNIGNsaWVudHMKIwpDT05GSUdfRFJNX0ZCREVWX0VNVUxB
VElPTj15CkNPTkZJR19EUk1fRkJERVZfT1ZFUkFMTE9DPTEwMAojIENPTkZJR19EUk1fRkJE
RVZfTEVBS19QSFlTX1NNRU0gaXMgbm90IHNldApDT05GSUdfRFJNX0NMSUVOVF9MT0c9eQpD
T05GSUdfRFJNX0NMSUVOVF9ERUZBVUxUX0ZCREVWPXkKIyBDT05GSUdfRFJNX0NMSUVOVF9E
RUZBVUxUX0xPRyBpcyBub3Qgc2V0CkNPTkZJR19EUk1fQ0xJRU5UX0RFRkFVTFQ9ImZiZGV2
IgojIGVuZCBvZiBTdXBwb3J0ZWQgRFJNIGNsaWVudHMKCiMgQ09ORklHX0RSTV9MT0FEX0VE
SURfRklSTVdBUkUgaXMgbm90IHNldApDT05GSUdfRFJNX0RJU1BMQVlfSEVMUEVSPW0KQ09O
RklHX0RSTV9CUklER0VfQ09OTkVDVE9SPXkKIyBDT05GSUdfRFJNX0RJU1BMQVlfRFBfQVVY
X0NFQyBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9ESVNQTEFZX0RQX0FVWF9DSEFSREVWIGlz
IG5vdCBzZXQKQ09ORklHX0RSTV9ESVNQTEFZX0RQX0hFTFBFUj15CkNPTkZJR19EUk1fRElT
UExBWV9IRE1JX0FVRElPX0hFTFBFUj15CkNPTkZJR19EUk1fRElTUExBWV9IRE1JX0hFTFBF
Uj15CkNPTkZJR19EUk1fRElTUExBWV9IRE1JX1NUQVRFX0hFTFBFUj15CkNPTkZJR19EUk1f
VFRNPW0KQ09ORklHX0RSTV9FWEVDPW0KQ09ORklHX0RSTV9CVUREWT1tCkNPTkZJR19EUk1f
VFRNX0hFTFBFUj1tCkNPTkZJR19EUk1fR0VNX1NITUVNX0hFTFBFUj15CkNPTkZJR19EUk1f
U1VCQUxMT0NfSEVMUEVSPW0KQ09ORklHX0RSTV9TQ0hFRD1tCgojCiMgRHJpdmVycyBmb3Ig
c3lzdGVtIGZyYW1lYnVmZmVycwojCkNPTkZJR19EUk1fU1lTRkJfSEVMUEVSPXkKQ09ORklH
X0RSTV9TSU1QTEVEUk09eQojIGVuZCBvZiBEcml2ZXJzIGZvciBzeXN0ZW0gZnJhbWVidWZm
ZXJzCgojCiMgQVJNIGRldmljZXMKIwojIGVuZCBvZiBBUk0gZGV2aWNlcwoKQ09ORklHX0RS
TV9SQURFT049bQpDT05GSUdfRFJNX1JBREVPTl9VU0VSUFRSPXkKIyBDT05GSUdfRFJNX0FN
REdQVSBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9OT1VWRUFVIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFJNX0k5MTUgaXMgbm90IHNldAojIENPTkZJR19EUk1fWEUgaXMgbm90IHNldApDT05G
SUdfRFJNX1ZHRU09bQojIENPTkZJR19EUk1fVktNUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RS
TV9WTVdHRlggaXMgbm90IHNldAojIENPTkZJR19EUk1fR01BNTAwIGlzIG5vdCBzZXQKIyBD
T05GSUdfRFJNX1VETCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9BU1QgaXMgbm90IHNldAoj
IENPTkZJR19EUk1fTUdBRzIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9RWEwgaXMgbm90
IHNldApDT05GSUdfRFJNX1ZJUlRJT19HUFU9bQpDT05GSUdfRFJNX1ZJUlRJT19HUFVfS01T
PXkKQ09ORklHX0RSTV9QQU5FTD15CgojCiMgRGlzcGxheSBQYW5lbHMKIwojIGVuZCBvZiBE
aXNwbGF5IFBhbmVscwoKQ09ORklHX0RSTV9CUklER0U9eQpDT05GSUdfRFJNX1BBTkVMX0JS
SURHRT15CgojCiMgRGlzcGxheSBJbnRlcmZhY2UgQnJpZGdlcwojCiMgQ09ORklHX0RSTV9J
MkNfTlhQX1REQTk5OFggaXMgbm90IHNldAojIENPTkZJR19EUk1fQU5BTE9HSVhfQU5YNzhY
WCBpcyBub3Qgc2V0CiMgZW5kIG9mIERpc3BsYXkgSW50ZXJmYWNlIEJyaWRnZXMKCiMgQ09O
RklHX0RSTV9FVE5BVklWIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX0hJU0lfSElCTUMgaXMg
bm90IHNldAojIENPTkZJR19EUk1fQVBQTEVUQkRSTSBpcyBub3Qgc2V0CkNPTkZJR19EUk1f
Qk9DSFM9bQojIENPTkZJR19EUk1fQ0lSUlVTX1FFTVUgaXMgbm90IHNldAojIENPTkZJR19E
Uk1fR00xMlUzMjAgaXMgbm90IHNldAojIENPTkZJR19EUk1fVkJPWFZJREVPIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFJNX0dVRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RSTV9TVDc1NzFfSTJD
IGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1NTRDEzMFggaXMgbm90IHNldApDT05GSUdfRFJN
X0xJQl9SQU5ET009eQpDT05GSUdfRFJNX1BSSVZBQ1lfU0NSRUVOPXkKQ09ORklHX0RSTV9Q
QU5FTF9PUklFTlRBVElPTl9RVUlSS1M9eQoKIwojIEZyYW1lIGJ1ZmZlciBEZXZpY2VzCiMK
Q09ORklHX0ZCPXkKIyBDT05GSUdfRkJfQ0lSUlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
UE0yIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQ1lCRVIyMDAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfQVJDIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQVNJTElBTlQgaXMgbm90IHNldAoj
IENPTkZJR19GQl9JTVNUVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZHQTE2IGlzIG5vdCBz
ZXQKIyBDT05GSUdfRkJfVVZFU0EgaXMgbm90IHNldApDT05GSUdfRkJfVkVTQT15CiMgQ09O
RklHX0ZCX040MTEgaXMgbm90IHNldAojIENPTkZJR19GQl9IR0EgaXMgbm90IHNldAojIENP
TkZJR19GQl9PUEVOQ09SRVMgaXMgbm90IHNldAojIENPTkZJR19GQl9TMUQxM1hYWCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX05WSURJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1JJVkEg
aXMgbm90IHNldAojIENPTkZJR19GQl9JNzQwIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfTUFU
Uk9YIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfUkFERU9OIGlzIG5vdCBzZXQKIyBDT05GSUdf
RkJfQVRZMTI4IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQVRZIGlzIG5vdCBzZXQKIyBDT05G
SUdfRkJfUzMgaXMgbm90IHNldAojIENPTkZJR19GQl9TQVZBR0UgaXMgbm90IHNldAojIENP
TkZJR19GQl9TSVMgaXMgbm90IHNldAojIENPTkZJR19GQl9WSUEgaXMgbm90IHNldAojIENP
TkZJR19GQl9ORU9NQUdJQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0tZUk8gaXMgbm90IHNl
dAojIENPTkZJR19GQl8zREZYIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVk9PRE9PMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0ZCX1ZUODYyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RSSURF
TlQgaXMgbm90IHNldAojIENPTkZJR19GQl9BUksgaXMgbm90IHNldAojIENPTkZJR19GQl9Q
TTMgaXMgbm90IHNldAojIENPTkZJR19GQl9DQVJNSU5FIGlzIG5vdCBzZXQKIyBDT05GSUdf
RkJfR0VPREUgaXMgbm90IHNldAojIENPTkZJR19GQl9TTVNDVUZYIGlzIG5vdCBzZXQKIyBD
T05GSUdfRkJfSUJNX0dYVDQ1MDAgaXMgbm90IHNldAojIENPTkZJR19GQl9WSVJUVUFMIGlz
IG5vdCBzZXQKIyBDT05GSUdfRkJfTUVUUk9OT01FIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
TUI4NjJYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NTRDEzMDcgaXMgbm90IHNldAojIENP
TkZJR19GQl9TTTcxMiBpcyBub3Qgc2V0CkNPTkZJR19GQl9DT1JFPXkKQ09ORklHX0ZCX05P
VElGWT15CiMgQ09ORklHX0ZJUk1XQVJFX0VESUQgaXMgbm90IHNldAojIENPTkZJR19GQl9E
RVZJQ0UgaXMgbm90IHNldApDT05GSUdfRkJfQ0ZCX0ZJTExSRUNUPXkKQ09ORklHX0ZCX0NG
Ql9DT1BZQVJFQT15CkNPTkZJR19GQl9DRkJfSU1BR0VCTElUPXkKQ09ORklHX0ZCX1NZU19G
SUxMUkVDVD15CkNPTkZJR19GQl9TWVNfQ09QWUFSRUE9eQpDT05GSUdfRkJfU1lTX0lNQUdF
QkxJVD15CiMgQ09ORklHX0ZCX0ZPUkVJR05fRU5ESUFOIGlzIG5vdCBzZXQKQ09ORklHX0ZC
X1NZU01FTV9GT1BTPXkKQ09ORklHX0ZCX0RFRkVSUkVEX0lPPXkKQ09ORklHX0ZCX0lPTUVN
X0ZPUFM9eQpDT05GSUdfRkJfSU9NRU1fSEVMUEVSUz15CkNPTkZJR19GQl9TWVNNRU1fSEVM
UEVSUz15CkNPTkZJR19GQl9TWVNNRU1fSEVMUEVSU19ERUZFUlJFRD15CiMgQ09ORklHX0ZC
X01PREVfSEVMUEVSUyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1RJTEVCTElUVElORyBpcyBu
b3Qgc2V0CiMgZW5kIG9mIEZyYW1lIGJ1ZmZlciBEZXZpY2VzCgojCiMgQmFja2xpZ2h0ICYg
TENEIGRldmljZSBzdXBwb3J0CiMKIyBDT05GSUdfTENEX0NMQVNTX0RFVklDRSBpcyBub3Qg
c2V0CkNPTkZJR19CQUNLTElHSFRfQ0xBU1NfREVWSUNFPW0KIyBDT05GSUdfQkFDS0xJR0hU
X0tURDI1MyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9LVEQyODAxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQkFDS0xJR0hUX0tUWjg4NjYgaXMgbm90IHNldAojIENPTkZJR19CQUNL
TElHSFRfQVBQTEUgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfUUNPTV9XTEVEIGlz
IG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX1NBSEFSQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JBQ0tMSUdIVF9BRFA4ODYwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0FEUDg4
NzAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTE0zNTA5IGlzIG5vdCBzZXQKIyBD
T05GSUdfQkFDS0xJR0hUX0xNMzYzOSBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9H
UElPIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0xWNTIwN0xQIGlzIG5vdCBzZXQK
IyBDT05GSUdfQkFDS0xJR0hUX0JENjEwNyBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tMSUdI
VF9BUkNYQ05OIGlzIG5vdCBzZXQKIyBlbmQgb2YgQmFja2xpZ2h0ICYgTENEIGRldmljZSBz
dXBwb3J0CgpDT05GSUdfSERNST15CgojCiMgQ29uc29sZSBkaXNwbGF5IGRyaXZlciBzdXBw
b3J0CiMKQ09ORklHX1ZHQV9DT05TT0xFPXkKQ09ORklHX0RVTU1ZX0NPTlNPTEU9eQpDT05G
SUdfRFVNTVlfQ09OU09MRV9DT0xVTU5TPTgwCkNPTkZJR19EVU1NWV9DT05TT0xFX1JPV1M9
MjUKQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQojIENPTkZJR19GUkFNRUJVRkZFUl9D
T05TT0xFX0xFR0FDWV9BQ0NFTEVSQVRJT04gaXMgbm90IHNldApDT05GSUdfRlJBTUVCVUZG
RVJfQ09OU09MRV9ERVRFQ1RfUFJJTUFSWT15CiMgQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNP
TEVfUk9UQVRJT04gaXMgbm90IHNldAojIENPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX0RF
RkVSUkVEX1RBS0VPVkVSIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ29uc29sZSBkaXNwbGF5IGRy
aXZlciBzdXBwb3J0CgojIENPTkZJR19MT0dPIGlzIG5vdCBzZXQKIyBlbmQgb2YgR3JhcGhp
Y3Mgc3VwcG9ydAoKIyBDT05GSUdfRFJNX0FDQ0VMIGlzIG5vdCBzZXQKQ09ORklHX1NPVU5E
PW0KQ09ORklHX1NORD1tCkNPTkZJR19TTkRfVElNRVI9bQpDT05GSUdfU05EX1BDTT1tCkNP
TkZJR19TTkRfSFdERVA9bQpDT05GSUdfU05EX1NFUV9ERVZJQ0U9bQpDT05GSUdfU05EX1JB
V01JREk9bQpDT05GSUdfU05EX0NPUkVfVEVTVD1tCkNPTkZJR19TTkRfSkFDSz15CkNPTkZJ
R19TTkRfSkFDS19JTlBVVF9ERVY9eQojIENPTkZJR19TTkRfT1NTRU1VTCBpcyBub3Qgc2V0
CkNPTkZJR19TTkRfUENNX1RJTUVSPXkKQ09ORklHX1NORF9IUlRJTUVSPW0KQ09ORklHX1NO
RF9EWU5BTUlDX01JTk9SUz15CkNPTkZJR19TTkRfTUFYX0NBUkRTPTYKIyBDT05GSUdfU05E
X1NVUFBPUlRfT0xEX0FQSSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfUFJPQ19GUz15CkNPTkZJ
R19TTkRfVkVSQk9TRV9QUk9DRlM9eQojIENPTkZJR19TTkRfQ1RMX0ZBU1RfTE9PS1VQIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1NORF9DVExf
SU5QVVRfVkFMSURBVElPTj15CiMgQ09ORklHX1NORF9VVElNRVIgaXMgbm90IHNldApDT05G
SUdfU05EX1ZNQVNURVI9eQpDT05GSUdfU05EX0RNQV9TR0JVRj15CkNPTkZJR19TTkRfU0VR
VUVOQ0VSPW0KIyBDT05GSUdfU05EX1NFUV9EVU1NWSBpcyBub3Qgc2V0CkNPTkZJR19TTkRf
U0VRX0hSVElNRVJfREVGQVVMVD15CkNPTkZJR19TTkRfU0VRX01JRElfRVZFTlQ9bQpDT05G
SUdfU05EX1NFUV9NSURJPW0KQ09ORklHX1NORF9TRVFfVklSTUlEST1tCiMgQ09ORklHX1NO
RF9TRVFfVU1QIGlzIG5vdCBzZXQKQ09ORklHX1NORF9NUFU0MDFfVUFSVD1tCkNPTkZJR19T
TkRfRFJJVkVSUz15CkNPTkZJR19TTkRfRFVNTVk9bQpDT05GSUdfU05EX0FMT09QPW0KIyBD
T05GSUdfU05EX1BDTVRFU1QgaXMgbm90IHNldApDT05GSUdfU05EX1ZJUk1JREk9bQojIENP
TkZJR19TTkRfTVRQQVYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU0VSSUFMX1UxNjU1MCBp
cyBub3Qgc2V0CkNPTkZJR19TTkRfTVBVNDAxPW0KQ09ORklHX1NORF9QQ0k9eQojIENPTkZJ
R19TTkRfQUQxODg5IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FMUzMwMCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9BTFM0MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FMSTU0NTEg
aXMgbm90IHNldAojIENPTkZJR19TTkRfQVNJSFBJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0FUSUlYUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVElJWFBfTU9ERU0gaXMgbm90IHNl
dAojIENPTkZJR19TTkRfQVU4ODEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FVODgyMCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9BVTg4MzAgaXMgbm90IHNldAojIENPTkZJR19TTkRf
QVcyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0FaVDMzMjggaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQlQ4N1ggaXMgbm90IHNldAojIENPTkZJR19TTkRfQ0EwMTA2IGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX0NNSVBDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9PWFlHRU4gaXMg
bm90IHNldAojIENPTkZJR19TTkRfQ1M0MjgxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0NT
NDZYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9DUzU1MzAgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQ1M1NTM1QVVESU8gaXMgbm90IHNldAojIENPTkZJR19TTkRfQ1RYRkkgaXMgbm90
IHNldAojIENPTkZJR19TTkRfREFSTEEyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9HSU5B
MjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfTEFZTEEyMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9EQVJMQTI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0dJTkEyNCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NORF9MQVlMQTI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01PTkEgaXMg
bm90IHNldAojIENPTkZJR19TTkRfTUlBIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VDSE8z
RyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9JTkRJR08gaXMgbm90IHNldAojIENPTkZJR19T
TkRfSU5ESUdPSU8gaXMgbm90IHNldAojIENPTkZJR19TTkRfSU5ESUdPREogaXMgbm90IHNl
dAojIENPTkZJR19TTkRfSU5ESUdPSU9YIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lORElH
T0RKWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FTVUxMEsxIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0VNVTEwSzFYIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0VOUzEzNzAgaXMgbm90
IHNldAojIENPTkZJR19TTkRfRU5TMTM3MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9FUzE5
MzggaXMgbm90IHNldAojIENPTkZJR19TTkRfRVMxOTY4IGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX0ZNODAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEU1AgaXMgbm90IHNldAojIENP
TkZJR19TTkRfSERTUE0gaXMgbm90IHNldAojIENPTkZJR19TTkRfSUNFMTcxMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9JQ0UxNzI0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lOVEVM
OFgwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0lOVEVMOFgwTSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NORF9LT1JHMTIxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9MT0xBIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX0xYNjQ2NEVTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01BRVNU
Uk8zIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX01JWEFSVCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9OTTI1NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9QQ1hIUiBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9SSVBUSURFIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1JNRTMyIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1JNRTk2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1JNRTk2
NTIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU0U2WCBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9TSVM3MDE5IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPTklDVklCRVMgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfVFJJREVOVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9WSUE4MlhY
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1ZJQTgyWFhfTU9ERU0gaXMgbm90IHNldAojIENP
TkZJR19TTkRfVklSVFVPU08gaXMgbm90IHNldAojIENPTkZJR19TTkRfVlgyMjIgaXMgbm90
IHNldAojIENPTkZJR19TTkRfWU1GUENJIGlzIG5vdCBzZXQKCiMKIyBIRC1BdWRpbwojCkNP
TkZJR19TTkRfSERBPW0KQ09ORklHX1NORF9IREFfSU5URUw9bQojIENPTkZJR19TTkRfSERB
X0FDUEkgaXMgbm90IHNldApDT05GSUdfU05EX0hEQV9IV0RFUD15CkNPTkZJR19TTkRfSERB
X1JFQ09ORklHPXkKIyBDT05GSUdfU05EX0hEQV9JTlBVVF9CRUVQIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX0hEQV9QQVRDSF9MT0FERVIgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERB
X0NPREVDX1JFQUxURUsgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX0FOQUxP
RyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfU0lHTUFURUwgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfSERBX0NPREVDX1ZJQSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9I
REFfQ09ERUNfSERNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ0lSUlVT
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RFQ19DUzg0MDkgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfSERBX0NPREVDX0NPTkVYQU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0hEQV9DT0RFQ19TRU5BUllURUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0hEQV9DT0RF
Q19DQTAxMTAgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0NPREVDX0NBMDEzMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9IREFfQ09ERUNfQ01FRElBIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX0hEQV9DT0RFQ19TSTMwNTQgaXMgbm90IHNldAojIENPTkZJR19TTkRfSERBX0dF
TkVSSUMgaXMgbm90IHNldApDT05GSUdfU05EX0hEQV9QT1dFUl9TQVZFX0RFRkFVTFQ9MAoj
IENPTkZJR19TTkRfSERBX0lOVEVMX0hETUlfU0lMRU5UX1NUUkVBTSBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9IREFfQ1RMX0RFVl9JRCBpcyBub3Qgc2V0CiMgZW5kIG9mIEhELUF1ZGlv
CgpDT05GSUdfU05EX0hEQV9DT1JFPW0KQ09ORklHX1NORF9IREFfQ09NUE9ORU5UPXkKQ09O
RklHX1NORF9IREFfUFJFQUxMT0NfU0laRT0wCkNPTkZJR19TTkRfSU5URUxfTkhMVD15CkNP
TkZJR19TTkRfSU5URUxfRFNQX0NPTkZJRz1tCkNPTkZJR19TTkRfSU5URUxfU09VTkRXSVJF
X0FDUEk9bQojIENPTkZJR19TTkRfVVNCIGlzIG5vdCBzZXQKQ09ORklHX1NORF9QQ01DSUE9
eQojIENPTkZJR19TTkRfVlhQT0NLRVQgaXMgbm90IHNldAojIENPTkZJR19TTkRfUERBVURJ
T0NGIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NO
RF9YODYgaXMgbm90IHNldAojIENPTkZJR19TTkRfVklSVElPIGlzIG5vdCBzZXQKQ09ORklH
X0hJRF9TVVBQT1JUPXkKQ09ORklHX0hJRD1tCkNPTkZJR19ISURfQkFUVEVSWV9TVFJFTkdU
SD15CkNPTkZJR19ISURSQVc9eQpDT05GSUdfVUhJRD1tCkNPTkZJR19ISURfR0VORVJJQz1t
CgojCiMgU3BlY2lhbCBISUQgZHJpdmVycwojCiMgQ09ORklHX0hJRF9BNFRFQ0ggaXMgbm90
IHNldAojIENPTkZJR19ISURfQUNDVVRPVUNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FD
UlVYIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FQUExFIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX0FQUExFSVIgaXMgbm90IHNldAojIENPTkZJR19ISURfQVBQTEVUQl9CTCBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9BUFBMRVRCX0tCRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9B
U1VTIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0FVUkVBTCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9CRUxLSU4gaXMgbm90IHNldAojIENPTkZJR19ISURfQkVUT1BfRkYgaXMgbm90IHNl
dAojIENPTkZJR19ISURfQklHQkVOX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NIRVJS
WSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9DSElDT05ZIGlzIG5vdCBzZXQKIyBDT05GSUdf
SElEX0NPUlNBSVIgaXMgbm90IHNldAojIENPTkZJR19ISURfQ09VR0FSIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX01BQ0FMTFkgaXMgbm90IHNldAojIENPTkZJR19ISURfUFJPRElLRVlT
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NNRURJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9DUDIxMTIgaXMgbm90IHNldAojIENPTkZJR19ISURfQ1JFQVRJVkVfU0IwNTQwIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX0NZUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19ISURfRFJB
R09OUklTRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTVNfRkYgaXMgbm90IHNldAojIENP
TkZJR19ISURfRUxBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9FTEVDT00gaXMgbm90IHNl
dAojIENPTkZJR19ISURfRUxPIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0VWSVNJT04gaXMg
bm90IHNldAojIENPTkZJR19ISURfRVpLRVkgaXMgbm90IHNldAojIENPTkZJR19ISURfRlQy
NjAgaXMgbm90IHNldAojIENPTkZJR19ISURfR0VNQklSRCBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9HRlJNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0dMT1JJT1VTIGlzIG5vdCBzZXQK
IyBDT05GSUdfSElEX0hPTFRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9HT09HTEVfU1RB
RElBX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1ZJVkFMREkgaXMgbm90IHNldAojIENP
TkZJR19ISURfR1Q2ODNSIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0tFWVRPVUNIIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX0tZRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9LWVNPTkEg
aXMgbm90IHNldApDT05GSUdfSElEX1VDTE9HSUM9bQojIENPTkZJR19ISURfV0FMVE9QIGlz
IG5vdCBzZXQKIyBDT05GSUdfSElEX1ZJRVdTT05JQyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9WUkMyIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1hJQU9NSSBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9HWVJBVElPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9JQ0FERSBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9JVEUgaXMgbm90IHNldAojIENPTkZJR19ISURfSkFCUkEgaXMg
bm90IHNldAojIENPTkZJR19ISURfVFdJTkhBTiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9L
RU5TSU5HVE9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0xDUE9XRVIgaXMgbm90IHNldAoj
IENPTkZJR19ISURfTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0xFTk9WTyBpcyBub3Qg
c2V0CiMgQ09ORklHX0hJRF9MRVRTS0VUQ0ggaXMgbm90IHNldAojIENPTkZJR19ISURfTUFH
SUNNT1VTRSBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9NQUxUUk9OIGlzIG5vdCBzZXQKIyBD
T05GSUdfSElEX01BWUZMQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01FR0FXT1JMRF9G
RiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRURSQUdPTiBpcyBub3Qgc2V0CkNPTkZJR19I
SURfTUlDUk9TT0ZUPW0KIyBDT05GSUdfSElEX01PTlRFUkVZIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX01VTFRJVE9VQ0ggaXMgbm90IHNldApDT05GSUdfSElEX05JTlRFTkRPPW0KIyBD
T05GSUdfTklOVEVORE9fRkYgaXMgbm90IHNldAojIENPTkZJR19ISURfTlRJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX05UUklHIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX05WSURJQV9T
SElFTEQgaXMgbm90IHNldAojIENPTkZJR19ISURfT1JURUsgaXMgbm90IHNldAojIENPTkZJ
R19ISURfUEFOVEhFUkxPUkQgaXMgbm90IHNldAojIENPTkZJR19ISURfUEVOTU9VTlQgaXMg
bm90IHNldAojIENPTkZJR19ISURfUEVUQUxZTlggaXMgbm90IHNldAojIENPTkZJR19ISURf
UElDT0xDRCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9QTEFOVFJPTklDUyBpcyBub3Qgc2V0
CiMgQ09ORklHX0hJRF9QWFJDIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1JBWkVSIGlzIG5v
dCBzZXQKIyBDT05GSUdfSElEX1BSSU1BWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9SRVRS
T0RFIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9ST0NDQVQ9bQojIENPTkZJR19ISURfU0FJVEVL
IGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NBTVNVTkcgaXMgbm90IHNldAojIENPTkZJR19I
SURfU0VNSVRFSyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9TSUdNQU1JQ1JPIGlzIG5vdCBz
ZXQKQ09ORklHX0hJRF9TT05ZPW0KIyBDT05GSUdfU09OWV9GRiBpcyBub3Qgc2V0CiMgQ09O
RklHX0hJRF9TUEVFRExJTksgaXMgbm90IHNldAojIENPTkZJR19ISURfU1RFQU0gaXMgbm90
IHNldAojIENPTkZJR19ISURfU1RFRUxTRVJJRVMgaXMgbm90IHNldAojIENPTkZJR19ISURf
U1VOUExVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9STUkgaXMgbm90IHNldAojIENPTkZJ
R19ISURfR1JFRU5BU0lBIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NNQVJUSk9ZUExVUyBp
cyBub3Qgc2V0CiMgQ09ORklHX0hJRF9USVZPIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RP
UFNFRUQgaXMgbm90IHNldAojIENPTkZJR19ISURfVE9QUkUgaXMgbm90IHNldAojIENPTkZJ
R19ISURfVEhJTkdNIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1RIUlVTVE1BU1RFUiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0hJRF9VRFJBV19QUzMgaXMgbm90IHNldAojIENPTkZJR19ISURf
VTJGWkVSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9XQUNPTSBpcyBub3Qgc2V0CkNPTkZJ
R19ISURfV0lJTU9URT1tCiMgQ09ORklHX0hJRF9XSU5XSU5HIGlzIG5vdCBzZXQKIyBDT05G
SUdfSElEX1hJTk1PIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1pFUk9QTFVTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSElEX1pZREFDUk9OIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1NFTlNP
Ul9IVUIgaXMgbm90IHNldAojIENPTkZJR19ISURfQUxQUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0hJRF9NQ1AyMjAwIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX01DUDIyMjEgaXMgbm90IHNl
dApDT05GSUdfSElEX0tVTklUX1RFU1Q9bQojIGVuZCBvZiBTcGVjaWFsIEhJRCBkcml2ZXJz
CgojCiMgSElELUJQRiBzdXBwb3J0CiMKIyBlbmQgb2YgSElELUJQRiBzdXBwb3J0CgojIENP
TkZJR19JMkNfSElEIGlzIG5vdCBzZXQKCiMKIyBVU0IgSElEIHN1cHBvcnQKIwpDT05GSUdf
VVNCX0hJRD1tCiMgQ09ORklHX0hJRF9QSUQgaXMgbm90IHNldApDT05GSUdfVVNCX0hJRERF
Vj15CgojCiMgVVNCIEhJRCBCb290IFByb3RvY29sIGRyaXZlcnMKIwojIENPTkZJR19VU0Jf
S0JEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01PVVNFIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
VVNCIEhJRCBCb290IFByb3RvY29sIGRyaXZlcnMKIyBlbmQgb2YgVVNCIEhJRCBzdXBwb3J0
CgpDT05GSUdfVVNCX09IQ0lfTElUVExFX0VORElBTj15CkNPTkZJR19VU0JfU1VQUE9SVD15
CkNPTkZJR19VU0JfQ09NTU9OPW0KIyBDT05GSUdfVVNCX0xFRF9UUklHIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1VMUElfQlVTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NPTk5fR1BJ
TyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQVJDSF9IQVNfSENEPXkKQ09ORklHX1VTQj1tCkNP
TkZJR19VU0JfUENJPXkKIyBDT05GSUdfVVNCX1BDSV9BTUQgaXMgbm90IHNldApDT05GSUdf
VVNCX0FOTk9VTkNFX05FV19ERVZJQ0VTPXkKCiMKIyBNaXNjZWxsYW5lb3VzIFVTQiBvcHRp
b25zCiMKQ09ORklHX1VTQl9ERUZBVUxUX1BFUlNJU1Q9eQojIENPTkZJR19VU0JfRkVXX0lO
SVRfUkVUUklFUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9EWU5BTUlDX01JTk9SUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1VTQl9PVEcgaXMgbm90IHNldAojIENPTkZJR19VU0JfT1RHX1BS
T0RVQ1RMSVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09UR19ESVNBQkxFX0VYVEVSTkFM
X0hVQiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MRURTX1RSSUdHRVJfVVNCUE9SVCBpcyBu
b3Qgc2V0CkNPTkZJR19VU0JfQVVUT1NVU1BFTkRfREVMQVk9MgpDT05GSUdfVVNCX0RFRkFV
TFRfQVVUSE9SSVpBVElPTl9NT0RFPTEKQ09ORklHX1VTQl9NT049bQoKIwojIFVTQiBIb3N0
IENvbnRyb2xsZXIgRHJpdmVycwojCiMgQ09ORklHX1VTQl9DNjdYMDBfSENEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX1hIQ0lfSENEIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9FSENJX0hD
RD1tCkNPTkZJR19VU0JfRUhDSV9ST09UX0hVQl9UVD15CkNPTkZJR19VU0JfRUhDSV9UVF9O
RVdTQ0hFRD15CkNPTkZJR19VU0JfRUhDSV9QQ0k9bQojIENPTkZJR19VU0JfRUhDSV9GU0wg
aXMgbm90IHNldAojIENPTkZJR19VU0JfRUhDSV9IQ0RfUExBVEZPUk0gaXMgbm90IHNldAoj
IENPTkZJR19VU0JfT1hVMjEwSFBfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0lTUDEx
NlhfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX09IQ0lfSENEIGlzIG5vdCBzZXQKQ09O
RklHX1VTQl9VSENJX0hDRD1tCiMgQ09ORklHX1VTQl9TTDgxMV9IQ0QgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfUjhBNjY1OTdfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hDRF9U
RVNUX01PREUgaXMgbm90IHNldAoKIwojIFVTQiBEZXZpY2UgQ2xhc3MgZHJpdmVycwojCiMg
Q09ORklHX1VTQl9BQ00gaXMgbm90IHNldAojIENPTkZJR19VU0JfUFJJTlRFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9XRE0gaXMgbm90IHNldAojIENPTkZJR19VU0JfVE1DIGlzIG5v
dCBzZXQKCiMKIyBOT1RFOiBVU0JfU1RPUkFHRSBkZXBlbmRzIG9uIFNDU0kgYnV0IEJMS19E
RVZfU0QgbWF5IGFsc28gYmUgbmVlZGVkOyBzZWUgVVNCX1NUT1JBR0UgSGVscCBmb3IgbW9y
ZSBpbmZvCiMKQ09ORklHX1VTQl9TVE9SQUdFPW0KIyBDT05GSUdfVVNCX1NUT1JBR0VfREVC
VUcgaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9SRUFMVEVLIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NUT1JBR0VfREFUQUZBQiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9T
VE9SQUdFX0ZSRUVDT00gaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9JU0QyMDAg
aXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9VU0JBVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9TVE9SQUdFX1NERFIwOSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdF
X1NERFI1NSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX0pVTVBTSE9UIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX1NUT1JBR0VfQUxBVURBIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NUT1JBR0VfT05FVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9L
QVJNQSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TVE9SQUdFX0NZUFJFU1NfQVRBQ0IgaXMg
bm90IHNldAojIENPTkZJR19VU0JfU1RPUkFHRV9FTkVfVUI2MjUwIGlzIG5vdCBzZXQKQ09O
RklHX1VTQl9VQVM9bQoKIwojIFVTQiBJbWFnaW5nIGRldmljZXMKIwojIENPTkZJR19VU0Jf
TURDODAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01JQ1JPVEVLIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCSVBfQ09SRSBpcyBub3Qgc2V0CgojCiMgVVNCIGR1YWwtbW9kZSBjb250cm9s
bGVyIGRyaXZlcnMKIwojIENPTkZJR19VU0JfQ0ROU19TVVBQT1JUIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX01VU0JfSERSQyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9EV0MzIGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0RXQzIgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ0hJUElE
RUEgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVNQMTc2MCBpcyBub3Qgc2V0CgojCiMgVVNC
IHBvcnQgZHJpdmVycwojCkNPTkZJR19VU0JfU0VSSUFMPW0KIyBDT05GSUdfVVNCX1NFUklB
TF9HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9TSU1QTEUgaXMgbm90
IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0FJUkNBQkxFIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1NFUklBTF9BUkszMTE2IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9CRUxL
SU4gaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0NIMzQxIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX1NFUklBTF9XSElURUhFQVQgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VS
SUFMX0RJR0lfQUNDRUxFUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfQ1Ay
MTBYIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9DWVBSRVNTX004IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX1NFUklBTF9FTVBFRyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0VS
SUFMX0ZURElfU0lPPW0KIyBDT05GSUdfVVNCX1NFUklBTF9WSVNPUiBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9TRVJJQUxfSVBBUSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxf
SVIgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0VER0VQT1JUIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NFUklBTF9FREdFUE9SVF9USSBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9TRVJJQUxfRjgxMjMyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9GODE1M1gg
aXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0dBUk1JTiBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9TRVJJQUxfSVBXIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9JVVUg
aXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX0tFWVNQQU5fUERBIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NFUklBTF9LRVlTUEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NF
UklBTF9LTFNJIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9LT0JJTF9TQ1QgaXMg
bm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX01DVF9VMjMyIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX1NFUklBTF9NRVRSTyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTU9T
NzcyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfTU9TNzg0MCBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TRVJJQUxfTVhVUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9T
RVJJQUxfTkFWTUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9QTDIzMDMgaXMg
bm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX09USTY4NTggaXMgbm90IHNldAojIENPTkZJ
R19VU0JfU0VSSUFMX1FDQVVYIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9RVUFM
Q09NTSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfU1BDUDhYNSBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TRVJJQUxfU0FGRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJ
QUxfU0lFUlJBV0lSRUxFU1MgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1NZTUJP
TCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfVEkgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfU0VSSUFMX0NZQkVSSkFDSyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxf
T1BUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9PTU5JTkVUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX1NFUklBTF9PUFRJQ09OIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNC
X1NFUklBTF9YU0VOU19NVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9TRVJJQUxfV0lTSEJP
TkUgaXMgbm90IHNldAojIENPTkZJR19VU0JfU0VSSUFMX1NTVTEwMCBpcyBub3Qgc2V0CiMg
Q09ORklHX1VTQl9TRVJJQUxfUVQyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9V
UEQ3OEYwNzMwIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NFUklBTF9YUiBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9TRVJJQUxfREVCVUcgaXMgbm90IHNldAoKIwojIFVTQiBNaXNjZWxs
YW5lb3VzIGRyaXZlcnMKIwojIENPTkZJR19VU0JfRU1JNjIgaXMgbm90IHNldAojIENPTkZJ
R19VU0JfRU1JMjYgaXMgbm90IHNldAojIENPTkZJR19VU0JfQURVVFVYIGlzIG5vdCBzZXQK
IyBDT05GSUdfVVNCX1NFVlNFRyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MRUdPVE9XRVIg
aXMgbm90IHNldAojIENPTkZJR19VU0JfTENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NZ
UFJFU1NfQ1k3QzYzIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0NZVEhFUk0gaXMgbm90IHNl
dAojIENPTkZJR19VU0JfSURNT1VTRSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9BUFBMRURJ
U1BMQVkgaXMgbm90IHNldAojIENPTkZJR19BUFBMRV9NRklfRkFTVENIQVJHRSBpcyBub3Qg
c2V0CiMgQ09ORklHX1VTQl9MSkNBIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NJU1VTQlZH
QSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9U
UkFOQ0VWSUJSQVRPUiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JT1dBUlJJT1IgaXMgbm90
IHNldAojIENPTkZJR19VU0JfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FSFNFVF9U
RVNUX0ZJWFRVUkUgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVNJR0hURlcgaXMgbm90IHNl
dAojIENPTkZJR19VU0JfWVVSRVggaXMgbm90IHNldAojIENPTkZJR19VU0JfRVpVU0JfRlgy
IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0hVQl9VU0IyNTFYQiBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9IU0lDX1VTQjM1MDMgaXMgbm90IHNldAojIENPTkZJR19VU0JfSFNJQ19VU0I0
NjA0IGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0xJTktfTEFZRVJfVEVTVCBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9DSEFPU0tFWSBpcyBub3Qgc2V0CgojCiMgVVNCIFBoeXNpY2FsIExh
eWVyIGRyaXZlcnMKIwojIENPTkZJR19OT1BfVVNCX1hDRUlWIGlzIG5vdCBzZXQKIyBDT05G
SUdfVVNCX0dQSU9fVkJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9JU1AxMzAxIGlzIG5v
dCBzZXQKIyBlbmQgb2YgVVNCIFBoeXNpY2FsIExheWVyIGRyaXZlcnMKCiMgQ09ORklHX1VT
Ql9HQURHRVQgaXMgbm90IHNldAojIENPTkZJR19UWVBFQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1VTQl9ST0xFX1NXSVRDSCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NDU0lfVUZTSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVNU1RJQ0sgaXMgbm90
IHNldApDT05GSUdfTkVXX0xFRFM9eQpDT05GSUdfTEVEU19DTEFTUz15CiMgQ09ORklHX0xF
RFNfQ0xBU1NfRkxBU0ggaXMgbm90IHNldAojIENPTkZJR19MRURTX0NMQVNTX01VTFRJQ09M
T1IgaXMgbm90IHNldApDT05GSUdfTEVEU19CUklHSFRORVNTX0hXX0NIQU5HRUQ9eQpDT05G
SUdfTEVEU19LVU5JVF9URVNUPW0KCiMKIyBMRUQgZHJpdmVycwojCiMgQ09ORklHX0xFRFNf
QVBVIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19BVzIwMFhYIGlzIG5vdCBzZXQKIyBDT05G
SUdfTEVEU19MTTM1MzAgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xNMzUzMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFRFNfTE0zNjQyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19QQ0E5
NTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdf
TEVEU19MUDM5NDQgaXMgbm90IHNldAojIENPTkZJR19MRURTX0xQMzk1MiBpcyBub3Qgc2V0
CiMgQ09ORklHX0xFRFNfUENBOTU1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTYz
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTk1WCBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfQkQyNjA2TVZWIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19CRDI4MDIgaXMgbm90
IHNldAojIENPTkZJR19MRURTX0lOVEVMX1NTNDIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0xF
RFNfTFQzNTkzIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UQ0E2NTA3IGlzIG5vdCBzZXQK
IyBDT05GSUdfTEVEU19UTEM1OTFYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTE0zNTV4
IGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19PVDIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0xF
RFNfSVMzMUZMMzE5WCBpcyBub3Qgc2V0CgojCiMgTEVEIGRyaXZlciBmb3IgYmxpbmsoMSkg
VVNCIFJHQiBMRUQgaXMgdW5kZXIgU3BlY2lhbCBISUQgZHJpdmVycyAoSElEX1RISU5HTSkK
IwojIENPTkZJR19MRURTX0JMSU5LTSBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTUxYQ1BM
RCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTUxYUkVHIGlzIG5vdCBzZXQKIyBDT05GSUdf
TEVEU19VU0VSIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19OSUM3OEJYIGlzIG5vdCBzZXQK
CiMKIyBGbGFzaCBhbmQgVG9yY2ggTEVEIGRyaXZlcnMKIwoKIwojIFJHQiBMRUQgZHJpdmVy
cwojCgojCiMgTEVEIFRyaWdnZXJzCiMKQ09ORklHX0xFRFNfVFJJR0dFUlM9eQojIENPTkZJ
R19MRURTX1RSSUdHRVJfVElNRVIgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdHRVJf
T05FU0hPVCBpcyBub3Qgc2V0CkNPTkZJR19MRURTX1RSSUdHRVJfRElTSz15CiMgQ09ORklH
X0xFRFNfVFJJR0dFUl9IRUFSVEJFQVQgaXMgbm90IHNldAojIENPTkZJR19MRURTX1RSSUdH
RVJfQkFDS0xJR0hUIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX0NQVSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9BQ1RJVklUWSBpcyBub3Qgc2V0CiMgQ09O
RklHX0xFRFNfVFJJR0dFUl9HUElPIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfVFJJR0dFUl9E
RUZBVUxUX09OPXkKCiMKIyBpcHRhYmxlcyB0cmlnZ2VyIGlzIHVuZGVyIE5ldGZpbHRlciBj
b25maWcgKExFRCB0YXJnZXQpCiMKIyBDT05GSUdfTEVEU19UUklHR0VSX1RSQU5TSUVOVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9DQU1FUkEgaXMgbm90IHNldApDT05G
SUdfTEVEU19UUklHR0VSX1BBTklDPXkKIyBDT05GSUdfTEVEU19UUklHR0VSX05FVERFViBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9QQVRURVJOIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEVEU19UUklHR0VSX1RUWSBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dF
Ul9JTlBVVF9FVkVOVFMgaXMgbm90IHNldAoKIwojIFNpbWF0aWMgTEVEIGRyaXZlcnMKIwoj
IENPTkZJR19BQ0NFU1NJQklMSVRZIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5GSU5JQkFORCBp
cyBub3Qgc2V0CkNPTkZJR19FREFDX0FUT01JQ19TQ1JVQj15CkNPTkZJR19FREFDX1NVUFBP
UlQ9eQojIENPTkZJR19FREFDIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19MSUI9eQpDT05GSUdf
UlRDX01DMTQ2ODE4X0xJQj15CkNPTkZJR19SVENfQ0xBU1M9eQojIENPTkZJR19SVENfSENU
T1NZUyBpcyBub3Qgc2V0CkNPTkZJR19SVENfU1lTVE9IQz15CkNPTkZJR19SVENfU1lTVE9I
Q19ERVZJQ0U9InJ0YzAiCiMgQ09ORklHX1JUQ19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19S
VENfTElCX0tVTklUX1RFU1Q9bQpDT05GSUdfUlRDX05WTUVNPXkKCiMKIyBSVEMgaW50ZXJm
YWNlcwojCkNPTkZJR19SVENfSU5URl9TWVNGUz15CkNPTkZJR19SVENfSU5URl9QUk9DPXkK
Q09ORklHX1JUQ19JTlRGX0RFVj15CiMgQ09ORklHX1JUQ19JTlRGX0RFVl9VSUVfRU1VTCBp
cyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfVEVTVCBpcyBub3Qgc2V0CgojCiMgSTJDIFJU
QyBkcml2ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9BQkI1WkVTMyBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUQ19EUlZfQUJFT1o5IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9BQlg4MFgg
aXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTMwNyBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfRFMxMzc0IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE2NzIgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX01BWDY5MDAgaXMgbm90IHNldAojIENPTkZJR19S
VENfRFJWX01BWDMxMzM1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SUzVDMzcyIGlz
IG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9JU0wxMjA4IGlzIG5vdCBzZXQKIyBDT05GSUdf
UlRDX0RSVl9JU0wxMjAyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfWDEyMDUgaXMg
bm90IHNldAojIENPTkZJR19SVENfRFJWX1BDRjg1MjMgaXMgbm90IHNldAojIENPTkZJR19S
VENfRFJWX1BDRjg1MDYzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTM2MyBp
cyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUENGODU2MyBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfUENGODU4MyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTTQxVDgwIGlz
IG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9CUTMySyBpcyBub3Qgc2V0CiMgQ09ORklHX1JU
Q19EUlZfUzM1MzkwQSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRk0zMTMwIGlzIG5v
dCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SWDgwMTAgaXMgbm90IHNldAojIENPTkZJR19SVENf
RFJWX1JYODExMSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlg4NTgxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRDX0RSVl9SWDgwMjUgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X0VNMzAyNyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlYzMDI4IGlzIG5vdCBzZXQK
IyBDT05GSUdfUlRDX0RSVl9SVjMwMzIgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JW
ODgwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfU0QyNDA1QUwgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX1NEMzA3OCBpcyBub3Qgc2V0CgojCiMgU1BJIFJUQyBkcml2ZXJz
CiMKQ09ORklHX1JUQ19JMkNfQU5EX1NQST15CgojCiMgU1BJIGFuZCBJMkMgUlRDIGRyaXZl
cnMKIwojIENPTkZJR19SVENfRFJWX0RTMzIzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19E
UlZfUENGMjEyNyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfUlYzMDI5QzIgaXMgbm90
IHNldAojIENPTkZJR19SVENfRFJWX1JYNjExMCBpcyBub3Qgc2V0CgojCiMgUGxhdGZvcm0g
UlRDIGRyaXZlcnMKIwpDT05GSUdfUlRDX0RSVl9DTU9TPXkKIyBDT05GSUdfUlRDX0RSVl9E
UzEyODYgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTUxMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1JUQ19EUlZfRFMxNTUzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE2
ODVfRkFNSUxZIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9EUzE3NDIgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX0RTMjQwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
U1RLMTdUQTggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX000OFQ4NiBpcyBub3Qgc2V0
CiMgQ09ORklHX1JUQ19EUlZfTTQ4VDM1IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9N
NDhUNTkgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX01TTTYyNDIgaXMgbm90IHNldAoj
IENPTkZJR19SVENfRFJWX1JQNUMwMSBpcyBub3Qgc2V0CgojCiMgb24tQ1BVIFJUQyBkcml2
ZXJzCiMKIyBDT05GSUdfUlRDX0RSVl9GVFJUQzAxMCBpcyBub3Qgc2V0CgojCiMgSElEIFNl
bnNvciBSVEMgZHJpdmVycwojCiMgQ09ORklHX1JUQ19EUlZfR09MREZJU0ggaXMgbm90IHNl
dAojIENPTkZJR19ETUFERVZJQ0VTIGlzIG5vdCBzZXQKCiMKIyBETUFCVUYgb3B0aW9ucwoj
CkNPTkZJR19TWU5DX0ZJTEU9eQojIENPTkZJR19TV19TWU5DIGlzIG5vdCBzZXQKQ09ORklH
X1VETUFCVUY9eQojIENPTkZJR19ETUFCVUZfTU9WRV9OT1RJRlkgaXMgbm90IHNldApDT05G
SUdfRE1BQlVGX0RFQlVHPXkKQ09ORklHX0RNQUJVRl9TRUxGVEVTVFM9bQpDT05GSUdfRE1B
QlVGX0hFQVBTPXkKIyBDT05GSUdfRE1BQlVGX1NZU0ZTX1NUQVRTIGlzIG5vdCBzZXQKQ09O
RklHX0RNQUJVRl9IRUFQU19TWVNURU09eQojIGVuZCBvZiBETUFCVUYgb3B0aW9ucwoKIyBD
T05GSUdfVUlPIGlzIG5vdCBzZXQKIyBDT05GSUdfVkZJTyBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJUlRfRFJJVkVSUyBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fQU5DSE9SPXkKQ09ORklH
X1ZJUlRJTz15CkNPTkZJR19WSVJUSU9fUENJX0xJQj15CkNPTkZJR19WSVJUSU9fUENJX0xJ
Ql9MRUdBQ1k9eQpDT05GSUdfVklSVElPX01FTlU9eQpDT05GSUdfVklSVElPX1BDST15CkNP
TkZJR19WSVJUSU9fUENJX0FETUlOX0xFR0FDWT15CkNPTkZJR19WSVJUSU9fUENJX0xFR0FD
WT15CiMgQ09ORklHX1ZJUlRJT19CQUxMT09OIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVElP
X0lOUFVUIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVElPX01NSU8gaXMgbm90IHNldApDT05G
SUdfVklSVElPX0RNQV9TSEFSRURfQlVGRkVSPW0KIyBDT05GSUdfVklSVElPX0RFQlVHIGlz
IG5vdCBzZXQKIyBDT05GSUdfVklSVElPX1JUQyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZEUEEg
aXMgbm90IHNldApDT05GSUdfVkhPU1RfSU9UTEI9bQpDT05GSUdfVkhPU1RfVEFTSz15CkNP
TkZJR19WSE9TVD1tCkNPTkZJR19WSE9TVF9NRU5VPXkKQ09ORklHX1ZIT1NUX05FVD1tCiMg
Q09ORklHX1ZIT1NUX1ZTT0NLIGlzIG5vdCBzZXQKIyBDT05GSUdfVkhPU1RfQ1JPU1NfRU5E
SUFOX0xFR0FDWSBpcyBub3Qgc2V0CgojCiMgTWljcm9zb2Z0IEh5cGVyLVYgZ3Vlc3Qgc3Vw
cG9ydAojCiMgQ09ORklHX0hZUEVSViBpcyBub3Qgc2V0CiMgZW5kIG9mIE1pY3Jvc29mdCBI
eXBlci1WIGd1ZXN0IHN1cHBvcnQKCiMgQ09ORklHX0dSRVlCVVMgaXMgbm90IHNldAojIENP
TkZJR19DT01FREkgaXMgbm90IHNldAojIENPTkZJR19TVEFHSU5HIGlzIG5vdCBzZXQKIyBD
T05GSUdfR09MREZJU0ggaXMgbm90IHNldAojIENPTkZJR19DSFJPTUVfUExBVEZPUk1TIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUVMTEFOT1hfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJ
R19TVVJGQUNFX1BMQVRGT1JNUyBpcyBub3Qgc2V0CkNPTkZJR19YODZfUExBVEZPUk1fREVW
SUNFUz15CkNPTkZJR19BQ1BJX1dNST1tCiMgQ09ORklHX1dNSV9CTU9GIGlzIG5vdCBzZXQK
IyBDT05GSUdfSFVBV0VJX1dNSSBpcyBub3Qgc2V0CiMgQ09ORklHX01YTV9XTUkgaXMgbm90
IHNldAojIENPTkZJR19OVklESUFfV01JX0VDX0JBQ0tMSUdIVCBpcyBub3Qgc2V0CiMgQ09O
RklHX1hJQU9NSV9XTUkgaXMgbm90IHNldAojIENPTkZJR19HSUdBQllURV9XTUkgaXMgbm90
IHNldAojIENPTkZJR19ZT0dBQk9PSyBpcyBub3Qgc2V0CiMgQ09ORklHX0FDRVJIREYgaXMg
bm90IHNldAojIENPTkZJR19BQ0VSX1dJUkVMRVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNF
Ul9XTUkgaXMgbm90IHNldAojIENPTkZJR19BTURfV0JSRiBpcyBub3Qgc2V0CiMgQ09ORklH
X0FEVl9TV0JVVFRPTiBpcyBub3Qgc2V0CiMgQ09ORklHX0FQUExFX0dNVVggaXMgbm90IHNl
dAojIENPTkZJR19BU1VTX0xBUFRPUCBpcyBub3Qgc2V0CiMgQ09ORklHX0FTVVNfV0lSRUxF
U1MgaXMgbm90IHNldAojIENPTkZJR19BU1VTX1RGMTAzQ19ET0NLIGlzIG5vdCBzZXQKIyBD
T05GSUdfWDg2X1BMQVRGT1JNX0RSSVZFUlNfREVMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0FN
SUxPX1JGS0lMTCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZVSklUU1VfTEFQVE9QIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRlVKSVRTVV9UQUJMRVQgaXMgbm90IHNldAojIENPTkZJR19HUERfUE9D
S0VUX0ZBTiBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9QTEFURk9STV9EUklWRVJTX0hQIGlz
IG5vdCBzZXQKIyBDT05GSUdfV0lSRUxFU1NfSE9US0VZIGlzIG5vdCBzZXQKIyBDT05GSUdf
SUJNX1JUTCBpcyBub3Qgc2V0CiMgQ09ORklHX0lERUFQQURfTEFQVE9QIGlzIG5vdCBzZXQK
Q09ORklHX0xFTk9WT19XTUlfSE9US0VZX1VUSUxJVElFUz1tCkNPTkZJR19TRU5TT1JTX0hE
QVBTPW0KQ09ORklHX1RISU5LUEFEX0FDUEk9bQpDT05GSUdfVEhJTktQQURfQUNQSV9BTFNB
X1NVUFBPUlQ9eQojIENPTkZJR19USElOS1BBRF9BQ1BJX0RFQlVHRkFDSUxJVElFUyBpcyBu
b3Qgc2V0CkNPTkZJR19USElOS1BBRF9BQ1BJX0RFQlVHPXkKIyBDT05GSUdfVEhJTktQQURf
QUNQSV9VTlNBRkVfTEVEUyBpcyBub3Qgc2V0CiMgQ09ORklHX1RISU5LUEFEX0FDUElfVklE
RU8gaXMgbm90IHNldAojIENPTkZJR19USElOS1BBRF9BQ1BJX0hPVEtFWV9QT0xMIGlzIG5v
dCBzZXQKQ09ORklHX1RISU5LUEFEX0xNST1tCiMgQ09ORklHX0lOVEVMX1NBUl9JTlQxMDky
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfV01JX1NCTF9GV19VUERBVEUgaXMgbm90IHNl
dAojIENPTkZJR19JTlRFTF9XTUlfVEhVTkRFUkJPTFQgaXMgbm90IHNldAojIENPTkZJR19J
TlRFTF9ISURfRVZFTlQgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9WQlROIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5URUxfSU5UMDAwMl9WR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0lO
VEVMX09BS1RSQUlMIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfUFVOSVRfSVBDIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU5URUxfUlNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfU01B
UlRDT05ORUNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfVlNFQyBpcyBub3Qgc2V0CiMg
Q09ORklHX0FDUElfUVVJQ0tTVEFSVCBpcyBub3Qgc2V0CiMgQ09ORklHX01FRUdPUEFEX0FO
WDc0MjggaXMgbm90IHNldAojIENPTkZJR19NU0lfRUMgaXMgbm90IHNldAojIENPTkZJR19N
U0lfTEFQVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfTVNJX1dNSSBpcyBub3Qgc2V0CiMgQ09O
RklHX01TSV9XTUlfUExBVEZPUk0gaXMgbm90IHNldAojIENPTkZJR19QQ0VOR0lORVNfQVBV
MiBpcyBub3Qgc2V0CiMgQ09ORklHX0JBUkNPX1A1MF9HUElPIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0FNU1VOR19HQUxBWFlCT09LIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FNU1VOR19MQVBU
T1AgaXMgbm90IHNldAojIENPTkZJR19TQU1TVU5HX1ExMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1RPU0hJQkFfQlRfUkZLSUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9TSElCQV9IQVBTIGlz
IG5vdCBzZXQKIyBDT05GSUdfVE9TSElCQV9XTUkgaXMgbm90IHNldAojIENPTkZJR19BQ1BJ
X0NNUEMgaXMgbm90IHNldAojIENPTkZJR19DT01QQUxfTEFQVE9QIGlzIG5vdCBzZXQKIyBD
T05GSUdfTEdfTEFQVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFOQVNPTklDX0xBUFRPUCBp
cyBub3Qgc2V0CiMgQ09ORklHX1NPTllfTEFQVE9QIGlzIG5vdCBzZXQKIyBDT05GSUdfU1lT
VEVNNzZfQUNQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPUFNUQVJfTEFQVE9QIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VSSUFMX01VTFRJX0lOU1RBTlRJQVRFIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5TUFVSX1BMQVRGT1JNX1BST0ZJTEUgaXMgbm90IHNldAojIENPTkZJR19MRU5PVk9f
V01JX0NBTUVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RBU0hBUk9fQUNQSSBpcyBub3Qgc2V0
CkNPTkZJR19GV19BVFRSX0NMQVNTPW0KIyBDT05GSUdfSU5URUxfSVBTIGlzIG5vdCBzZXQK
IyBDT05GSUdfSU5URUxfU0NVX1BDSSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1NDVV9Q
TEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX1NJRU1FTlNfU0lNQVRJQ19JUEMgaXMgbm90
IHNldAojIENPTkZJR19XSU5NQVRFX0ZNMDdfS0VZUyBpcyBub3Qgc2V0CiMgQ09ORklHX09Y
UF9FQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RVWEVET19OQjA0X1dNSV9BQiBpcyBub3Qgc2V0
CkNPTkZJR19QMlNCPXkKQ09ORklHX0hBVkVfQ0xLPXkKQ09ORklHX0hBVkVfQ0xLX1BSRVBB
UkU9eQpDT05GSUdfQ09NTU9OX0NMSz15CiMgQ09ORklHX0NPTU1PTl9DTEtfTUFYOTQ4NSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfU0k1MzQxIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ09NTU9OX0NMS19TSTUzNTEgaXMgbm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1NJ
NTQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19DRENFNzA2IGlzIG5vdCBzZXQK
IyBDT05GSUdfQ09NTU9OX0NMS19DUzIwMDBfQ1AgaXMgbm90IHNldAojIENPTkZJR19YSUxJ
TlhfVkNVIGlzIG5vdCBzZXQKQ09ORklHX0NMS19LVU5JVF9URVNUPW0KQ09ORklHX0NMS19G
SVhFRF9SQVRFX0tVTklUX1RFU1Q9bQpDT05GSUdfQ0xLX0dBVEVfS1VOSVRfVEVTVD1tCkNP
TkZJR19DTEtfRkRfS1VOSVRfVEVTVD1tCiMgQ09ORklHX0hXU1BJTkxPQ0sgaXMgbm90IHNl
dAoKIwojIENsb2NrIFNvdXJjZSBkcml2ZXJzCiMKQ09ORklHX0NMS1NSQ19JODI1Mz15CkNP
TkZJR19DTEtFVlRfSTgyNTM9eQpDT05GSUdfQ0xLQkxEX0k4MjUzPXkKIyBlbmQgb2YgQ2xv
Y2sgU291cmNlIGRyaXZlcnMKCiMgQ09ORklHX01BSUxCT1ggaXMgbm90IHNldAojIENPTkZJ
R19JT01NVV9TVVBQT1JUIGlzIG5vdCBzZXQKCiMKIyBSZW1vdGVwcm9jIGRyaXZlcnMKIwoj
IENPTkZJR19SRU1PVEVQUk9DIGlzIG5vdCBzZXQKIyBlbmQgb2YgUmVtb3RlcHJvYyBkcml2
ZXJzCgojCiMgUnBtc2cgZHJpdmVycwojCiMgQ09ORklHX1JQTVNHX1ZJUlRJTyBpcyBub3Qg
c2V0CiMgZW5kIG9mIFJwbXNnIGRyaXZlcnMKCiMKIyBTT0MgKFN5c3RlbSBPbiBDaGlwKSBz
cGVjaWZpYyBEcml2ZXJzCiMKCiMKIyBBbWxvZ2ljIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2Yg
QW1sb2dpYyBTb0MgZHJpdmVycwoKIwojIEJyb2FkY29tIFNvQyBkcml2ZXJzCiMKIyBlbmQg
b2YgQnJvYWRjb20gU29DIGRyaXZlcnMKCiMKIyBOWFAvRnJlZXNjYWxlIFFvcklRIFNvQyBk
cml2ZXJzCiMKIyBlbmQgb2YgTlhQL0ZyZWVzY2FsZSBRb3JJUSBTb0MgZHJpdmVycwoKIwoj
IGZ1aml0c3UgU29DIGRyaXZlcnMKIwojIGVuZCBvZiBmdWppdHN1IFNvQyBkcml2ZXJzCgoj
CiMgaS5NWCBTb0MgZHJpdmVycwojCiMgZW5kIG9mIGkuTVggU29DIGRyaXZlcnMKCiMKIyBF
bmFibGUgTGl0ZVggU29DIEJ1aWxkZXIgc3BlY2lmaWMgZHJpdmVycwojCiMgZW5kIG9mIEVu
YWJsZSBMaXRlWCBTb0MgQnVpbGRlciBzcGVjaWZpYyBkcml2ZXJzCgojIENPTkZJR19XUENN
NDUwX1NPQyBpcyBub3Qgc2V0CgojCiMgUXVhbGNvbW0gU29DIGRyaXZlcnMKIwojIGVuZCBv
ZiBRdWFsY29tbSBTb0MgZHJpdmVycwoKIyBDT05GSUdfU09DX1RJIGlzIG5vdCBzZXQKCiMK
IyBYaWxpbnggU29DIGRyaXZlcnMKIwojIGVuZCBvZiBYaWxpbnggU29DIGRyaXZlcnMKIyBl
bmQgb2YgU09DIChTeXN0ZW0gT24gQ2hpcCkgc3BlY2lmaWMgRHJpdmVycwoKIwojIFBNIERv
bWFpbnMKIwoKIwojIEFtbG9naWMgUE0gRG9tYWlucwojCiMgZW5kIG9mIEFtbG9naWMgUE0g
RG9tYWlucwoKIwojIEJyb2FkY29tIFBNIERvbWFpbnMKIwojIGVuZCBvZiBCcm9hZGNvbSBQ
TSBEb21haW5zCgojCiMgaS5NWCBQTSBEb21haW5zCiMKIyBlbmQgb2YgaS5NWCBQTSBEb21h
aW5zCgojCiMgUXVhbGNvbW0gUE0gRG9tYWlucwojCiMgZW5kIG9mIFF1YWxjb21tIFBNIERv
bWFpbnMKIyBlbmQgb2YgUE0gRG9tYWlucwoKIyBDT05GSUdfUE1fREVWRlJFUSBpcyBub3Qg
c2V0CiMgQ09ORklHX0VYVENPTiBpcyBub3Qgc2V0CiMgQ09ORklHX01FTU9SWSBpcyBub3Qg
c2V0CiMgQ09ORklHX0lJTyBpcyBub3Qgc2V0CiMgQ09ORklHX05UQiBpcyBub3Qgc2V0CiMg
Q09ORklHX1BXTSBpcyBub3Qgc2V0CgojCiMgSVJRIGNoaXAgc3VwcG9ydAojCiMgZW5kIG9m
IElSUSBjaGlwIHN1cHBvcnQKCiMgQ09ORklHX0lQQUNLX0JVUyBpcyBub3Qgc2V0CiMgQ09O
RklHX1JFU0VUX0NPTlRST0xMRVIgaXMgbm90IHNldAoKIwojIFBIWSBTdWJzeXN0ZW0KIwoj
IENPTkZJR19HRU5FUklDX1BIWSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9MR01fUEhZIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEhZX0NBTl9UUkFOU0NFSVZFUiBpcyBub3Qgc2V0CgojCiMg
UEhZIGRyaXZlcnMgZm9yIEJyb2FkY29tIHBsYXRmb3JtcwojCiMgQ09ORklHX0JDTV9LT05B
X1VTQjJfUEhZIGlzIG5vdCBzZXQKIyBlbmQgb2YgUEhZIGRyaXZlcnMgZm9yIEJyb2FkY29t
IHBsYXRmb3JtcwoKIyBDT05GSUdfUEhZX1BYQV8yOE5NX0hTSUMgaXMgbm90IHNldAojIENP
TkZJR19QSFlfUFhBXzI4Tk1fVVNCMiBpcyBub3Qgc2V0CiMgQ09ORklHX1BIWV9JTlRFTF9M
R01fRU1NQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFBIWSBTdWJzeXN0ZW0KCiMgQ09ORklHX1BP
V0VSQ0FQIGlzIG5vdCBzZXQKIyBDT05GSUdfTUNCIGlzIG5vdCBzZXQKCiMKIyBQZXJmb3Jt
YW5jZSBtb25pdG9yIHN1cHBvcnQKIwojIENPTkZJR19EV0NfUENJRV9QTVUgaXMgbm90IHNl
dAojIGVuZCBvZiBQZXJmb3JtYW5jZSBtb25pdG9yIHN1cHBvcnQKCkNPTkZJR19SQVM9eQoj
IENPTkZJR19VU0I0IGlzIG5vdCBzZXQKCiMKIyBBbmRyb2lkCiMKIyBDT05GSUdfQU5EUk9J
RF9CSU5ERVJfSVBDIGlzIG5vdCBzZXQKIyBlbmQgb2YgQW5kcm9pZAoKIyBDT05GSUdfTElC
TlZESU1NIGlzIG5vdCBzZXQKIyBDT05GSUdfREFYIGlzIG5vdCBzZXQKQ09ORklHX05WTUVN
PXkKQ09ORklHX05WTUVNX1NZU0ZTPXkKIyBDT05GSUdfTlZNRU1fTEFZT1VUUyBpcyBub3Qg
c2V0CiMgQ09ORklHX05WTUVNX1JNRU0gaXMgbm90IHNldAoKIwojIEhXIHRyYWNpbmcgc3Vw
cG9ydAojCiMgQ09ORklHX1NUTSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVMX1RIIGlzIG5v
dCBzZXQKIyBlbmQgb2YgSFcgdHJhY2luZyBzdXBwb3J0CgojIENPTkZJR19GUEdBIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0lPWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NMSU1CVVMgaXMgbm90
IHNldAojIENPTkZJR19JTlRFUkNPTk5FQ1QgaXMgbm90IHNldAojIENPTkZJR19DT1VOVEVS
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1BFQ0kgaXMg
bm90IHNldAojIENPTkZJR19IVEUgaXMgbm90IHNldAojIGVuZCBvZiBEZXZpY2UgRHJpdmVy
cwoKIwojIEZpbGUgc3lzdGVtcwojCkNPTkZJR19EQ0FDSEVfV09SRF9BQ0NFU1M9eQpDT05G
SUdfVkFMSURBVEVfRlNfUEFSU0VSPXkKQ09ORklHX0ZTX0lPTUFQPXkKQ09ORklHX0ZTX1NU
QUNLPXkKQ09ORklHX0JVRkZFUl9IRUFEPXkKQ09ORklHX0xFR0FDWV9ESVJFQ1RfSU89eQoj
IENPTkZJR19FWFQyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRVhUM19GUyBpcyBub3Qgc2V0
CkNPTkZJR19FWFQ0X0ZTPXkKQ09ORklHX0VYVDRfVVNFX0ZPUl9FWFQyPXkKQ09ORklHX0VY
VDRfRlNfUE9TSVhfQUNMPXkKIyBDT05GSUdfRVhUNF9GU19TRUNVUklUWSBpcyBub3Qgc2V0
CiMgQ09ORklHX0VYVDRfREVCVUcgaXMgbm90IHNldApDT05GSUdfRVhUNF9LVU5JVF9URVNU
Uz1tCkNPTkZJR19KQkQyPXkKIyBDT05GSUdfSkJEMl9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJ
R19GU19NQkNBQ0hFPXkKIyBDT05GSUdfSkZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX1hGU19G
Uz1tCiMgQ09ORklHX1hGU19TVVBQT1JUX1Y0IGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX1NV
UFBPUlRfQVNDSUlfQ0kgaXMgbm90IHNldAojIENPTkZJR19YRlNfUVVPVEEgaXMgbm90IHNl
dApDT05GSUdfWEZTX1BPU0lYX0FDTD15CiMgQ09ORklHX1hGU19SVCBpcyBub3Qgc2V0CiMg
Q09ORklHX1hGU19PTkxJTkVfU0NSVUIgaXMgbm90IHNldAojIENPTkZJR19YRlNfV0FSTiBp
cyBub3Qgc2V0CiMgQ09ORklHX1hGU19ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0dGUzJf
RlMgaXMgbm90IHNldAojIENPTkZJR19PQ0ZTMl9GUyBpcyBub3Qgc2V0CkNPTkZJR19CVFJG
U19GUz15CkNPTkZJR19CVFJGU19GU19QT1NJWF9BQ0w9eQojIENPTkZJR19CVFJGU19GU19S
VU5fU0FOSVRZX1RFU1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRSRlNfREVCVUcgaXMgbm90
IHNldAojIENPTkZJR19CVFJGU19BU1NFUlQgaXMgbm90IHNldAojIENPTkZJR19CVFJGU19F
WFBFUklNRU5UQUwgaXMgbm90IHNldAojIENPTkZJR19CVFJGU19GU19SRUZfVkVSSUZZIGlz
IG5vdCBzZXQKIyBDT05GSUdfTklMRlMyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfRjJGU19G
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0JDQUNIRUZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0ZT
X1BPU0lYX0FDTD15CkNPTkZJR19FWFBPUlRGUz15CiMgQ09ORklHX0VYUE9SVEZTX0JMT0NL
X09QUyBpcyBub3Qgc2V0CkNPTkZJR19GSUxFX0xPQ0tJTkc9eQojIENPTkZJR19GU19FTkNS
WVBUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfRlNfVkVSSVRZIGlzIG5vdCBzZXQKQ09ORklH
X0ZTTk9USUZZPXkKQ09ORklHX0ROT1RJRlk9eQpDT05GSUdfSU5PVElGWV9VU0VSPXkKQ09O
RklHX0ZBTk9USUZZPXkKIyBDT05GSUdfRkFOT1RJRllfQUNDRVNTX1BFUk1JU1NJT05TIGlz
IG5vdCBzZXQKIyBDT05GSUdfUVVPVEEgaXMgbm90IHNldApDT05GSUdfQVVUT0ZTX0ZTPXkK
Q09ORklHX0ZVU0VfRlM9bQojIENPTkZJR19DVVNFIGlzIG5vdCBzZXQKQ09ORklHX1ZJUlRJ
T19GUz1tCkNPTkZJR19GVVNFX1BBU1NUSFJPVUdIPXkKQ09ORklHX0ZVU0VfSU9fVVJJTkc9
eQojIENPTkZJR19PVkVSTEFZX0ZTIGlzIG5vdCBzZXQKCiMKIyBDYWNoZXMKIwpDT05GSUdf
TkVURlNfU1VQUE9SVD15CiMgQ09ORklHX05FVEZTX1NUQVRTIGlzIG5vdCBzZXQKIyBDT05G
SUdfTkVURlNfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19GU0NBQ0hFIGlzIG5vdCBzZXQK
IyBlbmQgb2YgQ2FjaGVzCgojCiMgQ0QtUk9NL0RWRCBGaWxlc3lzdGVtcwojCkNPTkZJR19J
U085NjYwX0ZTPXkKQ09ORklHX0pPTElFVD15CkNPTkZJR19aSVNPRlM9eQpDT05GSUdfVURG
X0ZTPW0KIyBlbmQgb2YgQ0QtUk9NL0RWRCBGaWxlc3lzdGVtcwoKIwojIERPUy9GQVQvRVhG
QVQvTlQgRmlsZXN5c3RlbXMKIwpDT05GSUdfRkFUX0ZTPW0KQ09ORklHX01TRE9TX0ZTPW0K
Q09ORklHX1ZGQVRfRlM9bQpDT05GSUdfRkFUX0RFRkFVTFRfQ09ERVBBR0U9NDM3CkNPTkZJ
R19GQVRfREVGQVVMVF9JT0NIQVJTRVQ9Imlzbzg4NTktMTUiCkNPTkZJR19GQVRfREVGQVVM
VF9VVEY4PXkKQ09ORklHX0ZBVF9LVU5JVF9URVNUPW0KQ09ORklHX0VYRkFUX0ZTPW0KQ09O
RklHX0VYRkFUX0RFRkFVTFRfSU9DSEFSU0VUPSJ1dGY4IgpDT05GSUdfTlRGUzNfRlM9bQpD
T05GSUdfTlRGUzNfTFpYX1hQUkVTUz15CiMgQ09ORklHX05URlMzX0ZTX1BPU0lYX0FDTCBp
cyBub3Qgc2V0CiMgQ09ORklHX05URlNfRlMgaXMgbm90IHNldAojIGVuZCBvZiBET1MvRkFU
L0VYRkFUL05UIEZpbGVzeXN0ZW1zCgojCiMgUHNldWRvIGZpbGVzeXN0ZW1zCiMKQ09ORklH
X1BST0NfRlM9eQojIENPTkZJR19QUk9DX0tDT1JFIGlzIG5vdCBzZXQKQ09ORklHX1BST0Nf
U1lTQ1RMPXkKQ09ORklHX1BST0NfUEFHRV9NT05JVE9SPXkKIyBDT05GSUdfUFJPQ19DSElM
RFJFTiBpcyBub3Qgc2V0CkNPTkZJR19QUk9DX1BJRF9BUkNIX1NUQVRVUz15CkNPTkZJR19L
RVJORlM9eQpDT05GSUdfU1lTRlM9eQpDT05GSUdfVE1QRlM9eQpDT05GSUdfVE1QRlNfUE9T
SVhfQUNMPXkKQ09ORklHX1RNUEZTX1hBVFRSPXkKIyBDT05GSUdfVE1QRlNfUVVPVEEgaXMg
bm90IHNldApDT05GSUdfSFVHRVRMQkZTPXkKQ09ORklHX0hVR0VUTEJfUEFHRT15CkNPTkZJ
R19DT05GSUdGU19GUz1tCiMgZW5kIG9mIFBzZXVkbyBmaWxlc3lzdGVtcwoKQ09ORklHX01J
U0NfRklMRVNZU1RFTVM9eQojIENPTkZJR19PUkFOR0VGU19GUyBpcyBub3Qgc2V0CiMgQ09O
RklHX0FERlNfRlMgaXMgbm90IHNldApDT05GSUdfQUZGU19GUz1tCiMgQ09ORklHX0VDUllQ
VF9GUyBpcyBub3Qgc2V0CkNPTkZJR19IRlNfRlM9bQpDT05GSUdfSEZTUExVU19GUz1tCkNP
TkZJR19CRUZTX0ZTPW0KQ09ORklHX0JFRlNfREVCVUc9eQojIENPTkZJR19CRlNfRlMgaXMg
bm90IHNldAojIENPTkZJR19FRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19DUkFNRlMgaXMg
bm90IHNldAojIENPTkZJR19TUVVBU0hGUyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZYRlNfRlMg
aXMgbm90IHNldAojIENPTkZJR19NSU5JWF9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX09NRlNf
RlMgaXMgbm90IHNldAojIENPTkZJR19IUEZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfUU5Y
NEZTX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfUU5YNkZTX0ZTIGlzIG5vdCBzZXQKIyBDT05G
SUdfUk9NRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19QU1RPUkUgaXMgbm90IHNldAojIENP
TkZJR19VRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19FUk9GU19GUyBpcyBub3Qgc2V0CkNP
TkZJR19ORVRXT1JLX0ZJTEVTWVNURU1TPXkKIyBDT05GSUdfTkZTX0ZTIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkZTRCBpcyBub3Qgc2V0CiMgQ09ORklHX0NFUEhfRlMgaXMgbm90IHNldApD
T05GSUdfQ0lGUz1tCiMgQ09ORklHX0NJRlNfU1RBVFMyIGlzIG5vdCBzZXQKIyBDT05GSUdf
Q0lGU19BTExPV19JTlNFQ1VSRV9MRUdBQ1kgaXMgbm90IHNldAojIENPTkZJR19DSUZTX1VQ
Q0FMTCBpcyBub3Qgc2V0CkNPTkZJR19DSUZTX1hBVFRSPXkKQ09ORklHX0NJRlNfREVCVUc9
eQojIENPTkZJR19DSUZTX0RFQlVHMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NJRlNfREVCVUdf
RFVNUF9LRVlTIGlzIG5vdCBzZXQKQ09ORklHX0NJRlNfREZTX1VQQ0FMTD15CkNPTkZJR19D
SUZTX1NXTl9VUENBTEw9eQojIENPTkZJR19DSUZTX0NPTVBSRVNTSU9OIGlzIG5vdCBzZXQK
IyBDT05GSUdfU01CX1NFUlZFUiBpcyBub3Qgc2V0CkNPTkZJR19TTUJGUz1tCiMgQ09ORklH
X0NPREFfRlMgaXMgbm90IHNldAojIENPTkZJR19BRlNfRlMgaXMgbm90IHNldApDT05GSUdf
OVBfRlM9eQpDT05GSUdfOVBfRlNfUE9TSVhfQUNMPXkKIyBDT05GSUdfOVBfRlNfU0VDVVJJ
VFkgaXMgbm90IHNldApDT05GSUdfTkxTPXkKQ09ORklHX05MU19ERUZBVUxUPSJ1dGY4IgpD
T05GSUdfTkxTX0NPREVQQUdFXzQzNz1tCiMgQ09ORklHX05MU19DT0RFUEFHRV83MzcgaXMg
bm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfNzc1IGlzIG5vdCBzZXQKQ09ORklHX05M
U19DT0RFUEFHRV84NTA9bQojIENPTkZJR19OTFNfQ09ERVBBR0VfODUyIGlzIG5vdCBzZXQK
IyBDT05GSUdfTkxTX0NPREVQQUdFXzg1NSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19DT0RF
UEFHRV84NTcgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2MSBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19D
T0RFUEFHRV84NjIgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODYzIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2NCBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19DT0RFUEFHRV84NjUgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfODY2IGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzg2OSBpcyBub3Qgc2V0CiMgQ09ORklH
X05MU19DT0RFUEFHRV85MzYgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0VfOTUw
IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0NPREVQQUdFXzkzMiBpcyBub3Qgc2V0CiMgQ09O
RklHX05MU19DT0RFUEFHRV85NDkgaXMgbm90IHNldAojIENPTkZJR19OTFNfQ09ERVBBR0Vf
ODc0IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfOCBpcyBub3Qgc2V0CkNPTkZJ
R19OTFNfQ09ERVBBR0VfMTI1MD1tCiMgQ09ORklHX05MU19DT0RFUEFHRV8xMjUxIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkxTX0FTQ0lJIGlzIG5vdCBzZXQKQ09ORklHX05MU19JU084ODU5
XzE9bQojIENPTkZJR19OTFNfSVNPODg1OV8yIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lT
Tzg4NTlfMyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzQgaXMgbm90IHNldAoj
IENPTkZJR19OTFNfSVNPODg1OV81IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlf
NiBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19JU084ODU5XzcgaXMgbm90IHNldAojIENPTkZJ
R19OTFNfSVNPODg1OV85IGlzIG5vdCBzZXQKIyBDT05GSUdfTkxTX0lTTzg4NTlfMTMgaXMg
bm90IHNldAojIENPTkZJR19OTFNfSVNPODg1OV8xNCBpcyBub3Qgc2V0CkNPTkZJR19OTFNf
SVNPODg1OV8xNT1tCiMgQ09ORklHX05MU19LT0k4X1IgaXMgbm90IHNldAojIENPTkZJR19O
TFNfS09JOF9VIGlzIG5vdCBzZXQKQ09ORklHX05MU19NQUNfUk9NQU49bQojIENPTkZJR19O
TFNfTUFDX0NFTFRJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfQ0VOVEVVUk8gaXMg
bm90IHNldAojIENPTkZJR19OTFNfTUFDX0NST0FUSUFOIGlzIG5vdCBzZXQKIyBDT05GSUdf
TkxTX01BQ19DWVJJTExJQyBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfR0FFTElDIGlz
IG5vdCBzZXQKIyBDT05GSUdfTkxTX01BQ19HUkVFSyBpcyBub3Qgc2V0CiMgQ09ORklHX05M
U19NQUNfSUNFTEFORCBpcyBub3Qgc2V0CiMgQ09ORklHX05MU19NQUNfSU5VSVQgaXMgbm90
IHNldAojIENPTkZJR19OTFNfTUFDX1JPTUFOSUFOIGlzIG5vdCBzZXQKIyBDT05GSUdfTkxT
X01BQ19UVVJLSVNIIGlzIG5vdCBzZXQKQ09ORklHX05MU19VVEY4PXkKQ09ORklHX05MU19V
Q1MyX1VUSUxTPW0KIyBDT05GSUdfRExNIGlzIG5vdCBzZXQKQ09ORklHX1VOSUNPREU9bQpD
T05GSUdfVU5JQ09ERV9OT1JNQUxJWkFUSU9OX0tVTklUX1RFU1Q9bQpDT05GSUdfSU9fV1E9
eQojIGVuZCBvZiBGaWxlIHN5c3RlbXMKCiMKIyBTZWN1cml0eSBvcHRpb25zCiMKQ09ORklH
X0tFWVM9eQpDT05GSUdfS0VZU19SRVFVRVNUX0NBQ0hFPXkKIyBDT05GSUdfUEVSU0lTVEVO
VF9LRVlSSU5HUyBpcyBub3Qgc2V0CiMgQ09ORklHX0JJR19LRVlTIGlzIG5vdCBzZXQKIyBD
T05GSUdfVFJVU1RFRF9LRVlTIGlzIG5vdCBzZXQKIyBDT05GSUdfRU5DUllQVEVEX0tFWVMg
aXMgbm90IHNldApDT05GSUdfS0VZX0RIX09QRVJBVElPTlM9eQpDT05GSUdfS0VZX05PVElG
SUNBVElPTlM9eQojIENPTkZJR19TRUNVUklUWV9ETUVTR19SRVNUUklDVCBpcyBub3Qgc2V0
CkNPTkZJR19QUk9DX01FTV9BTFdBWVNfRk9SQ0U9eQojIENPTkZJR19QUk9DX01FTV9GT1JD
RV9QVFJBQ0UgaXMgbm90IHNldAojIENPTkZJR19QUk9DX01FTV9OT19GT1JDRSBpcyBub3Qg
c2V0CkNPTkZJR19TRUNVUklUWT15CiMgQ09ORklHX1NFQ1VSSVRZRlMgaXMgbm90IHNldAoj
IENPTkZJR19TRUNVUklUWV9ORVRXT1JLIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlf
UEFUSCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQVRJQ19VU0VSTU9ERUhFTFBFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFQ1VSSVRZX1NNQUNLIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJ
VFlfVE9NT1lPIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfQVBQQVJNT1IgaXMgbm90
IHNldAojIENPTkZJR19TRUNVUklUWV9MT0FEUElOIGlzIG5vdCBzZXQKQ09ORklHX1NFQ1VS
SVRZX1lBTUE9eQojIENPTkZJR19TRUNVUklUWV9TQUZFU0VUSUQgaXMgbm90IHNldAojIENP
TkZJR19TRUNVUklUWV9MT0NLRE9XTl9MU00gaXMgbm90IHNldAojIENPTkZJR19TRUNVUklU
WV9MQU5ETE9DSyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVHUklUWSBpcyBub3Qgc2V0CkNP
TkZJR19ERUZBVUxUX1NFQ1VSSVRZX0RBQz15CkNPTkZJR19MU009ImxhbmRsb2NrLGxvY2tk
b3duLHlhbWEsbG9hZHBpbixzYWZlc2V0aWQsaW50ZWdyaXR5LHNlbGludXgsc21hY2ssdG9t
b3lvLGFwcGFybW9yLGJwZiIKCiMKIyBLZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIwoKIwoj
IE1lbW9yeSBpbml0aWFsaXphdGlvbgojCkNPTkZJR19DQ19IQVNfQVVUT19WQVJfSU5JVF9Q
QVRURVJOPXkKQ09ORklHX0NDX0hBU19BVVRPX1ZBUl9JTklUX1pFUk9fQkFSRT15CkNPTkZJ
R19DQ19IQVNfQVVUT19WQVJfSU5JVF9aRVJPPXkKIyBDT05GSUdfSU5JVF9TVEFDS19OT05F
IGlzIG5vdCBzZXQKQ09ORklHX0lOSVRfU1RBQ0tfQUxMX1BBVFRFUk49eQojIENPTkZJR19J
TklUX1NUQUNLX0FMTF9aRVJPIGlzIG5vdCBzZXQKQ09ORklHX0lOSVRfT05fQUxMT0NfREVG
QVVMVF9PTj15CiMgQ09ORklHX0lOSVRfT05fRlJFRV9ERUZBVUxUX09OIGlzIG5vdCBzZXQK
Q09ORklHX0NDX0hBU19aRVJPX0NBTExfVVNFRF9SRUdTPXkKQ09ORklHX1pFUk9fQ0FMTF9V
U0VEX1JFR1M9eQojIGVuZCBvZiBNZW1vcnkgaW5pdGlhbGl6YXRpb24KCiMKIyBCb3VuZHMg
Y2hlY2tpbmcKIwpDT05GSUdfRk9SVElGWV9TT1VSQ0U9eQpDT05GSUdfSEFSREVORURfVVNF
UkNPUFk9eQpDT05GSUdfSEFSREVORURfVVNFUkNPUFlfREVGQVVMVF9PTj15CiMgZW5kIG9m
IEJvdW5kcyBjaGVja2luZwoKIwojIEhhcmRlbmluZyBvZiBrZXJuZWwgZGF0YSBzdHJ1Y3R1
cmVzCiMKQ09ORklHX0xJU1RfSEFSREVORUQ9eQpDT05GSUdfQlVHX09OX0RBVEFfQ09SUlVQ
VElPTj15CiMgZW5kIG9mIEhhcmRlbmluZyBvZiBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCgpD
T05GSUdfQ0NfSEFTX1JBTkRTVFJVQ1Q9eQpDT05GSUdfUkFORFNUUlVDVF9OT05FPXkKIyBD
T05GSUdfUkFORFNUUlVDVF9GVUxMIGlzIG5vdCBzZXQKIyBlbmQgb2YgS2VybmVsIGhhcmRl
bmluZyBvcHRpb25zCiMgZW5kIG9mIFNlY3VyaXR5IG9wdGlvbnMKCkNPTkZJR19YT1JfQkxP
Q0tTPXkKQ09ORklHX0NSWVBUTz15CgojCiMgQ3J5cHRvIGNvcmUgb3IgaGVscGVyCiMKQ09O
RklHX0NSWVBUT19BTEdBUEk9eQpDT05GSUdfQ1JZUFRPX0FMR0FQSTI9eQpDT05GSUdfQ1JZ
UFRPX0FFQUQ9bQpDT05GSUdfQ1JZUFRPX0FFQUQyPXkKQ09ORklHX0NSWVBUT19TSUc9eQpD
T05GSUdfQ1JZUFRPX1NJRzI9eQpDT05GSUdfQ1JZUFRPX1NLQ0lQSEVSPW0KQ09ORklHX0NS
WVBUT19TS0NJUEhFUjI9eQpDT05GSUdfQ1JZUFRPX0hBU0g9eQpDT05GSUdfQ1JZUFRPX0hB
U0gyPXkKQ09ORklHX0NSWVBUT19STkc9bQpDT05GSUdfQ1JZUFRPX1JORzI9eQpDT05GSUdf
Q1JZUFRPX1JOR19ERUZBVUxUPW0KQ09ORklHX0NSWVBUT19BS0NJUEhFUjI9eQpDT05GSUdf
Q1JZUFRPX0FLQ0lQSEVSPXkKQ09ORklHX0NSWVBUT19LUFAyPXkKQ09ORklHX0NSWVBUT19L
UFA9eQpDT05GSUdfQ1JZUFRPX0FDT01QMj15CkNPTkZJR19DUllQVE9fTUFOQUdFUj15CkNP
TkZJR19DUllQVE9fTUFOQUdFUjI9eQpDT05GSUdfQ1JZUFRPX1VTRVI9bQpDT05GSUdfQ1JZ
UFRPX1NFTEZURVNUUz15CkNPTkZJR19DUllQVE9fU0VMRlRFU1RTX0ZVTEw9eQpDT05GSUdf
Q1JZUFRPX05VTEw9bQpDT05GSUdfQ1JZUFRPX1BDUllQVD1tCkNPTkZJR19DUllQVE9fQ1JZ
UFREPW0KQ09ORklHX0NSWVBUT19BVVRIRU5DPW0KIyBDT05GSUdfQ1JZUFRPX0tSQjVFTkMg
aXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0JFTkNITUFSSz1tCkNPTkZJR19DUllQVE9fRU5H
SU5FPW0KIyBlbmQgb2YgQ3J5cHRvIGNvcmUgb3IgaGVscGVyCgojCiMgUHVibGljLWtleSBj
cnlwdG9ncmFwaHkKIwpDT05GSUdfQ1JZUFRPX1JTQT15CkNPTkZJR19DUllQVE9fREg9eQoj
IENPTkZJR19DUllQVE9fREhfUkZDNzkxOV9HUk9VUFMgaXMgbm90IHNldApDT05GSUdfQ1JZ
UFRPX0VDQz1tCkNPTkZJR19DUllQVE9fRUNESD1tCiMgQ09ORklHX0NSWVBUT19FQ0RTQSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19FQ1JEU0EgaXMgbm90IHNldAojIENPTkZJR19D
UllQVE9fQ1VSVkUyNTUxOSBpcyBub3Qgc2V0CiMgZW5kIG9mIFB1YmxpYy1rZXkgY3J5cHRv
Z3JhcGh5CgojCiMgQmxvY2sgY2lwaGVycwojCkNPTkZJR19DUllQVE9fQUVTPW0KIyBDT05G
SUdfQ1JZUFRPX0FFU19USSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BUklBIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX0JMT1dGSVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0NBTUVMTElBIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0NBU1Q1IGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JZUFRPX0NBU1Q2IGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVM9
bQojIENPTkZJR19DUllQVE9fRkNSWVBUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1NF
UlBFTlQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fU000X0dFTkVSSUMgaXMgbm90IHNl
dApDT05GSUdfQ1JZUFRPX1RXT0ZJU0g9bQpDT05GSUdfQ1JZUFRPX1RXT0ZJU0hfQ09NTU9O
PW0KIyBlbmQgb2YgQmxvY2sgY2lwaGVycwoKIwojIExlbmd0aC1wcmVzZXJ2aW5nIGNpcGhl
cnMgYW5kIG1vZGVzCiMKQ09ORklHX0NSWVBUT19BRElBTlRVTT1tCkNPTkZJR19DUllQVE9f
Q0hBQ0hBMjA9bQpDT05GSUdfQ1JZUFRPX0NCQz1tCkNPTkZJR19DUllQVE9fQ1RSPW0KIyBD
T05GSUdfQ1JZUFRPX0NUUyBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fRUNCPW0KIyBDT05G
SUdfQ1JZUFRPX0hDVFIyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0xSVyBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSWVBUT19QQ0JDIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19YVFM9
bQpDT05GSUdfQ1JZUFRPX05IUE9MWTEzMDU9bQojIGVuZCBvZiBMZW5ndGgtcHJlc2Vydmlu
ZyBjaXBoZXJzIGFuZCBtb2RlcwoKIwojIEFFQUQgKGF1dGhlbnRpY2F0ZWQgZW5jcnlwdGlv
biB3aXRoIGFzc29jaWF0ZWQgZGF0YSkgY2lwaGVycwojCiMgQ09ORklHX0NSWVBUT19BRUdJ
UzEyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19DSEFDSEEyMFBPTFkxMzA1IGlzIG5v
dCBzZXQKQ09ORklHX0NSWVBUT19DQ009bQpDT05GSUdfQ1JZUFRPX0dDTT1tCkNPTkZJR19D
UllQVE9fR0VOSVY9bQpDT05GSUdfQ1JZUFRPX1NFUUlWPW0KQ09ORklHX0NSWVBUT19FQ0hB
SU5JVj1tCkNPTkZJR19DUllQVE9fRVNTSVY9bQojIGVuZCBvZiBBRUFEIChhdXRoZW50aWNh
dGVkIGVuY3J5cHRpb24gd2l0aCBhc3NvY2lhdGVkIGRhdGEpIGNpcGhlcnMKCiMKIyBIYXNo
ZXMsIGRpZ2VzdHMsIGFuZCBNQUNzCiMKQ09ORklHX0NSWVBUT19CTEFLRTJCPXkKQ09ORklH
X0NSWVBUT19DTUFDPW0KQ09ORklHX0NSWVBUT19HSEFTSD1tCkNPTkZJR19DUllQVE9fSE1B
Qz15CiMgQ09ORklHX0NSWVBUT19NRDQgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX01ENT1t
CiMgQ09ORklHX0NSWVBUT19NSUNIQUVMX01JQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBU
T19STUQxNjAgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1NIQTE9bQpDT05GSUdfQ1JZUFRP
X1NIQTI1Nj15CkNPTkZJR19DUllQVE9fU0hBNTEyPW0KQ09ORklHX0NSWVBUT19TSEEzPW0K
IyBDT05GSUdfQ1JZUFRPX1NNM19HRU5FUklDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRP
X1NUUkVFQk9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1dQNTEyIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1JZUFRPX1hDQkMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1hYSEFTSD15
CiMgZW5kIG9mIEhhc2hlcywgZGlnZXN0cywgYW5kIE1BQ3MKCiMKIyBDUkNzIChjeWNsaWMg
cmVkdW5kYW5jeSBjaGVja3MpCiMKQ09ORklHX0NSWVBUT19DUkMzMkM9eQojIENPTkZJR19D
UllQVE9fQ1JDMzIgaXMgbm90IHNldAojIGVuZCBvZiBDUkNzIChjeWNsaWMgcmVkdW5kYW5j
eSBjaGVja3MpCgojCiMgQ29tcHJlc3Npb24KIwpDT05GSUdfQ1JZUFRPX0RFRkxBVEU9bQoj
IENPTkZJR19DUllQVE9fTFpPIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPXzg0MiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19MWjQgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9f
TFo0SEMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1pTVEQ9eQojIGVuZCBvZiBDb21wcmVz
c2lvbgoKIwojIFJhbmRvbSBudW1iZXIgZ2VuZXJhdGlvbgojCiMgQ09ORklHX0NSWVBUT19B
TlNJX0NQUk5HIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19EUkJHX01FTlU9bQpDT05GSUdf
Q1JZUFRPX0RSQkdfSE1BQz15CiMgQ09ORklHX0NSWVBUT19EUkJHX0hBU0ggaXMgbm90IHNl
dAojIENPTkZJR19DUllQVE9fRFJCR19DVFIgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RS
Qkc9bQpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFk9bQpDT05GSUdfQ1JZUFRPX0pJVFRF
UkVOVFJPUFlfTUVNT1JZX0JMT0NLUz02NApDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFlf
TUVNT1JZX0JMT0NLU0laRT0zMgpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFlfT1NSPTEK
Q09ORklHX0NSWVBUT19LREY4MDAxMDhfQ1RSPXkKIyBlbmQgb2YgUmFuZG9tIG51bWJlciBn
ZW5lcmF0aW9uCgojCiMgVXNlcnNwYWNlIGludGVyZmFjZQojCkNPTkZJR19DUllQVE9fVVNF
Ul9BUEk9eQpDT05GSUdfQ1JZUFRPX1VTRVJfQVBJX0hBU0g9eQpDT05GSUdfQ1JZUFRPX1VT
RVJfQVBJX1NLQ0lQSEVSPW0KQ09ORklHX0NSWVBUT19VU0VSX0FQSV9STkc9bQojIENPTkZJ
R19DUllQVE9fVVNFUl9BUElfUk5HX0NBVlAgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1VT
RVJfQVBJX0FFQUQ9bQojIENPTkZJR19DUllQVE9fVVNFUl9BUElfRU5BQkxFX09CU09MRVRF
IGlzIG5vdCBzZXQKIyBlbmQgb2YgVXNlcnNwYWNlIGludGVyZmFjZQoKQ09ORklHX0NSWVBU
T19IQVNIX0lORk89eQoKIwojIEFjY2VsZXJhdGVkIENyeXB0b2dyYXBoaWMgQWxnb3JpdGht
cyBmb3IgQ1BVICh4ODYpCiMKIyBDT05GSUdfQ1JZUFRPX0FFU19OSV9JTlRFTCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSWVBUT19TRVJQRU5UX1NTRTJfNTg2IGlzIG5vdCBzZXQKQ09ORklH
X0NSWVBUT19UV09GSVNIXzU4Nj1tCiMgZW5kIG9mIEFjY2VsZXJhdGVkIENyeXB0b2dyYXBo
aWMgQWxnb3JpdGhtcyBmb3IgQ1BVICh4ODYpCgpDT05GSUdfQ1JZUFRPX0hXPXkKIyBDT05G
SUdfQ1JZUFRPX0RFVl9QQURMT0NLIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9H
RU9ERSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQVRNRUxfRUNDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9BVE1FTF9TSEEyMDRBIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ1JZUFRPX0RFVl9DQ1AgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX1FBVF9E
SDg5NXhDQyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfUUFUX0MzWFhYIGlzIG5v
dCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9RQVRfQzYyWCBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19ERVZfUUFUXzRYWFggaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fREVWX1FB
VF80MjBYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfUUFUXzZYWFggaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fREVWX1FBVF9ESDg5NXhDQ1ZGIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX0RFVl9RQVRfQzNYWFhWRiBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBU
T19ERVZfUUFUX0M2MlhWRiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fREVWX1ZJUlRJTz1t
CiMgQ09ORklHX0NSWVBUT19ERVZfU0FGRVhDRUwgaXMgbm90IHNldAojIENPTkZJR19DUllQ
VE9fREVWX0FNTE9HSUNfR1hMIGlzIG5vdCBzZXQKQ09ORklHX0FTWU1NRVRSSUNfS0VZX1RZ
UEU9eQpDT05GSUdfQVNZTU1FVFJJQ19QVUJMSUNfS0VZX1NVQlRZUEU9eQpDT05GSUdfWDUw
OV9DRVJUSUZJQ0FURV9QQVJTRVI9eQpDT05GSUdfUEtDUzhfUFJJVkFURV9LRVlfUEFSU0VS
PW0KQ09ORklHX1BLQ1M3X01FU1NBR0VfUEFSU0VSPXkKIyBDT05GSUdfUEtDUzdfVEVTVF9L
RVkgaXMgbm90IHNldAojIENPTkZJR19TSUdORURfUEVfRklMRV9WRVJJRklDQVRJT04gaXMg
bm90IHNldAojIENPTkZJR19GSVBTX1NJR05BVFVSRV9TRUxGVEVTVCBpcyBub3Qgc2V0Cgoj
CiMgQ2VydGlmaWNhdGVzIGZvciBzaWduYXR1cmUgY2hlY2tpbmcKIwpDT05GSUdfU1lTVEVN
X1RSVVNURURfS0VZUklORz15CkNPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlTPSIiCiMgQ09O
RklHX1NZU1RFTV9FWFRSQV9DRVJUSUZJQ0FURSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ09O
REFSWV9UUlVTVEVEX0tFWVJJTkcgaXMgbm90IHNldAojIENPTkZJR19TWVNURU1fQkxBQ0tM
SVNUX0tFWVJJTkcgaXMgbm90IHNldAojIGVuZCBvZiBDZXJ0aWZpY2F0ZXMgZm9yIHNpZ25h
dHVyZSBjaGVja2luZwoKIyBDT05GSUdfQ1JZUFRPX0tSQjUgaXMgbm90IHNldApDT05GSUdf
QklOQVJZX1BSSU5URj15CgojCiMgTGlicmFyeSByb3V0aW5lcwojCkNPTkZJR19SQUlENl9Q
UT15CkNPTkZJR19SQUlENl9QUV9CRU5DSE1BUks9eQpDT05GSUdfTElORUFSX1JBTkdFUz1t
CiMgQ09ORklHX1BBQ0tJTkcgaXMgbm90IHNldApDT05GSUdfQklUUkVWRVJTRT15CkNPTkZJ
R19HRU5FUklDX1NUUk5DUFlfRlJPTV9VU0VSPXkKQ09ORklHX0dFTkVSSUNfU1RSTkxFTl9V
U0VSPXkKQ09ORklHX0dFTkVSSUNfTkVUX1VUSUxTPXkKIyBDT05GSUdfQ09SRElDIGlzIG5v
dCBzZXQKQ09ORklHX1BSSU1FX05VTUJFUlM9bQpDT05GSUdfUkFUSU9OQUw9eQpDT05GSUdf
R0VORVJJQ19JT01BUD15CkNPTkZJR19BUkNIX1VTRV9DTVBYQ0hHX0xPQ0tSRUY9eQpDT05G
SUdfQVJDSF9IQVNfRkFTVF9NVUxUSVBMSUVSPXkKQ09ORklHX0FSQ0hfVVNFX1NZTV9BTk5P
VEFUSU9OUz15CgojCiMgQ3J5cHRvIGxpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfQ1JZUFRP
X0xJQl9VVElMUz15CkNPTkZJR19DUllQVE9fTElCX0FFUz1tCkNPTkZJR19DUllQVE9fTElC
X0FSQzQ9bQpDT05GSUdfQ1JZUFRPX0xJQl9HRjEyOE1VTD1tCkNPTkZJR19DUllQVE9fTElC
X0JMQUtFMlNfR0VORVJJQz15CkNPTkZJR19DUllQVE9fTElCX0NIQUNIQV9HRU5FUklDPW0K
Q09ORklHX0NSWVBUT19MSUJfQ0hBQ0hBPW0KQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUyNTUx
OV9HRU5FUklDPW0KQ09ORklHX0NSWVBUT19MSUJfQ1VSVkUyNTUxOV9JTlRFUk5BTD1tCkNP
TkZJR19DUllQVE9fTElCX0NVUlZFMjU1MTk9bQpDT05GSUdfQ1JZUFRPX0xJQl9ERVM9bQpD
T05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNV9SU0laRT0xCkNPTkZJR19DUllQVE9fTElCX1BP
TFkxMzA1X0dFTkVSSUM9bQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNT1tCkNPTkZJR19D
UllQVE9fTElCX0NIQUNIQTIwUE9MWTEzMDU9bQpDT05GSUdfQ1JZUFRPX0xJQl9TSEExPXkK
Q09ORklHX0NSWVBUT19MSUJfU0hBMjU2PXkKQ09ORklHX0NSWVBUT19MSUJfU0hBMjU2X0dF
TkVSSUM9eQojIGVuZCBvZiBDcnlwdG8gbGlicmFyeSByb3V0aW5lcwoKQ09ORklHX0NSQzE2
PXkKQ09ORklHX0NSQ19UMTBESUY9bQpDT05GSUdfQVJDSF9IQVNfQ1JDX1QxMERJRj15CkNP
TkZJR19DUkNfVDEwRElGX0FSQ0g9bQpDT05GSUdfQ1JDX0lUVV9UPW0KQ09ORklHX0NSQzMy
PXkKQ09ORklHX0FSQ0hfSEFTX0NSQzMyPXkKQ09ORklHX0NSQzMyX0FSQ0g9eQpDT05GSUdf
Q1JDNjQ9bQpDT05GSUdfQ1JDNz1tCkNPTkZJR19DUkNfT1BUSU1JWkFUSU9OUz15CkNPTkZJ
R19YWEhBU0g9eQojIENPTkZJR19SQU5ET00zMl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJ
R19aTElCX0lORkxBVEU9eQpDT05GSUdfWkxJQl9ERUZMQVRFPXkKQ09ORklHX0xaT19DT01Q
UkVTUz15CkNPTkZJR19MWk9fREVDT01QUkVTUz15CkNPTkZJR19aU1REX0NPTU1PTj15CkNP
TkZJR19aU1REX0NPTVBSRVNTPXkKQ09ORklHX1pTVERfREVDT01QUkVTUz15CiMgQ09ORklH
X1haX0RFQyBpcyBub3Qgc2V0CkNPTkZJR19ERUNPTVBSRVNTX0daSVA9eQpDT05GSUdfREVD
T01QUkVTU19aU1REPXkKQ09ORklHX0dFTkVSSUNfQUxMT0NBVE9SPXkKQ09ORklHX1JFRURf
U09MT01PTj1tCkNPTkZJR19SRUVEX1NPTE9NT05fRU5DMTY9eQpDT05GSUdfUkVFRF9TT0xP
TU9OX0RFQzE2PXkKQ09ORklHX0lOVEVSVkFMX1RSRUU9eQpDT05GSUdfWEFSUkFZX01VTFRJ
PXkKQ09ORklHX0FTU09DSUFUSVZFX0FSUkFZPXkKQ09ORklHX0hBU19JT01FTT15CkNPTkZJ
R19IQVNfSU9QT1JUPXkKQ09ORklHX0hBU19JT1BPUlRfTUFQPXkKQ09ORklHX0hBU19ETUE9
eQpDT05GSUdfTkVFRF9TR19ETUFfTEVOR1RIPXkKQ09ORklHX0FSQ0hfRE1BX0FERFJfVF82
NEJJVD15CiMgQ09ORklHX0RNQV9BUElfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19ETUFf
TUFQX0JFTkNITUFSSyBpcyBub3Qgc2V0CkNPTkZJR19TR0xfQUxMT0M9eQpDT05GSUdfQ0hF
Q0tfU0lHTkFUVVJFPXkKQ09ORklHX0NQVV9STUFQPXkKQ09ORklHX0RRTD15CkNPTkZJR19H
TE9CPXkKIyBDT05GSUdfR0xPQl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19OTEFUVFI9
eQpDT05GSUdfQ0xaX1RBQj15CiMgQ09ORklHX0lSUV9QT0xMIGlzIG5vdCBzZXQKQ09ORklH
X01QSUxJQj15CkNPTkZJR19ESU1MSUI9eQpDT05GSUdfT0lEX1JFR0lTVFJZPXkKQ09ORklH
X0hBVkVfR0VORVJJQ19WRFNPPXkKQ09ORklHX0dFTkVSSUNfR0VUVElNRU9GREFZPXkKQ09O
RklHX0dFTkVSSUNfVkRTT18zMj15CkNPTkZJR19HRU5FUklDX1ZEU09fVElNRV9OUz15CkNP
TkZJR19HRU5FUklDX1ZEU09fT1ZFUkZMT1dfUFJPVEVDVD15CkNPTkZJR19HRU5FUklDX1ZE
U09fREFUQV9TVE9SRT15CkNPTkZJR19GT05UX1NVUFBPUlQ9eQojIENPTkZJR19GT05UUyBp
cyBub3Qgc2V0CkNPTkZJR19GT05UXzh4OD15CkNPTkZJR19GT05UXzh4MTY9eQpDT05GSUdf
U0dfUE9PTD15CkNPTkZJR19BUkNIX0hBU19DUFVfQ0FDSEVfSU5WQUxJREFURV9NRU1SRUdJ
T049eQpDT05GSUdfQVJDSF9TVEFDS1dBTEs9eQpDT05GSUdfU1RBQ0tERVBPVD15CkNPTkZJ
R19TVEFDS0RFUE9UX01BWF9GUkFNRVM9NjQKQ09ORklHX1NCSVRNQVA9eQojIENPTkZJR19M
V1FfVEVTVCBpcyBub3Qgc2V0CiMgZW5kIG9mIExpYnJhcnkgcm91dGluZXMKCkNPTkZJR19G
SVJNV0FSRV9UQUJMRT15CkNPTkZJR19VTklPTl9GSU5EPXkKCiMKIyBLZXJuZWwgaGFja2lu
ZwojCgojCiMgcHJpbnRrIGFuZCBkbWVzZyBvcHRpb25zCiMKQ09ORklHX1BSSU5US19USU1F
PXkKIyBDT05GSUdfUFJJTlRLX0NBTExFUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NUQUNLVFJB
Q0VfQlVJTERfSUQgaXMgbm90IHNldApDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9ERUZBVUxU
PTcKQ09ORklHX0NPTlNPTEVfTE9HTEVWRUxfUVVJRVQ9NApDT05GSUdfTUVTU0FHRV9MT0dM
RVZFTF9ERUZBVUxUPTQKIyBDT05GSUdfQk9PVF9QUklOVEtfREVMQVkgaXMgbm90IHNldAoj
IENPTkZJR19EWU5BTUlDX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRFlOQU1JQ19ERUJV
R19DT1JFIGlzIG5vdCBzZXQKQ09ORklHX1NZTUJPTElDX0VSUk5BTUU9eQpDT05GSUdfREVC
VUdfQlVHVkVSQk9TRT15CiMgZW5kIG9mIHByaW50ayBhbmQgZG1lc2cgb3B0aW9ucwoKQ09O
RklHX0RFQlVHX0tFUk5FTD15CiMgQ09ORklHX0RFQlVHX01JU0MgaXMgbm90IHNldAoKIwoj
IENvbXBpbGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMKIwpDT05GSUdfQVNf
SEFTX05PTl9DT05TVF9VTEVCMTI4PXkKQ09ORklHX0RFQlVHX0lORk9fTk9ORT15CiMgQ09O
RklHX0RFQlVHX0lORk9fRFdBUkZfVE9PTENIQUlOX0RFRkFVTFQgaXMgbm90IHNldAojIENP
TkZJR19ERUJVR19JTkZPX0RXQVJGNCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0lORk9f
RFdBUkY1IGlzIG5vdCBzZXQKQ09ORklHX0ZSQU1FX1dBUk49MTAyNApDT05GSUdfU1RSSVBf
QVNNX1NZTVM9eQojIENPTkZJR19IRUFERVJTX0lOU1RBTEwgaXMgbm90IHNldApDT05GSUdf
U0VDVElPTl9NSVNNQVRDSF9XQVJOX09OTFk9eQpDT05GSUdfQVJDSF9XQU5UX0ZSQU1FX1BP
SU5URVJTPXkKQ09ORklHX0ZSQU1FX1BPSU5URVI9eQojIENPTkZJR19WTUxJTlVYX01BUCBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0ZPUkNFX1dFQUtfUEVSX0NQVSBpcyBub3Qgc2V0
CiMgZW5kIG9mIENvbXBpbGUtdGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMKCiMK
IyBHZW5lcmljIEtlcm5lbCBEZWJ1Z2dpbmcgSW5zdHJ1bWVudHMKIwojIENPTkZJR19NQUdJ
Q19TWVNSUSBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19GUz15CkNPTkZJR19ERUJVR19GU19B
TExPV19BTEw9eQojIENPTkZJR19ERUJVR19GU19ESVNBTExPV19NT1VOVCBpcyBub3Qgc2V0
CiMgQ09ORklHX0RFQlVHX0ZTX0FMTE9XX05PTkUgaXMgbm90IHNldApDT05GSUdfSEFWRV9B
UkNIX0tHREI9eQojIENPTkZJR19LR0RCIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1VC
U0FOPXkKIyBDT05GSUdfVUJTQU4gaXMgbm90IHNldApDT05GSUdfSEFWRV9LQ1NBTl9DT01Q
SUxFUj15CiMgZW5kIG9mIEdlbmVyaWMgS2VybmVsIERlYnVnZ2luZyBJbnN0cnVtZW50cwoK
IwojIE5ldHdvcmtpbmcgRGVidWdnaW5nCiMKIyBDT05GSUdfTkVUX0RFVl9SRUZDTlRfVFJB
Q0tFUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9OU19SRUZDTlRfVFJBQ0tFUiBpcyBub3Qg
c2V0CiMgQ09ORklHX0RFQlVHX05FVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX05FVF9T
TUFMTF9SVE5MIGlzIG5vdCBzZXQKIyBlbmQgb2YgTmV0d29ya2luZyBEZWJ1Z2dpbmcKCiMK
IyBNZW1vcnkgRGVidWdnaW5nCiMKQ09ORklHX1BBR0VfRVhURU5TSU9OPXkKQ09ORklHX0RF
QlVHX1BBR0VBTExPQz15CiMgQ09ORklHX0RFQlVHX1BBR0VBTExPQ19FTkFCTEVfREVGQVVM
VCBpcyBub3Qgc2V0CkNPTkZJR19TTFVCX0RFQlVHPXkKIyBDT05GSUdfU0xVQl9ERUJVR19P
TiBpcyBub3Qgc2V0CkNPTkZJR19QQUdFX09XTkVSPXkKQ09ORklHX1BBR0VfUE9JU09OSU5H
PXkKQ09ORklHX0RFQlVHX1JPREFUQV9URVNUPXkKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1dY
PXkKQ09ORklHX0hBVkVfREVCVUdfS01FTUxFQUs9eQojIENPTkZJR19ERUJVR19LTUVNTEVB
SyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX09CSkVDVFMgaXMgbm90IHNldAojIENPTkZJ
R19TSFJJTktFUl9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1NUQUNLX1VTQUdF
IGlzIG5vdCBzZXQKQ09ORklHX1NDSEVEX1NUQUNLX0VORF9DSEVDSz15CiMgQ09ORklHX0RF
QlVHX1ZGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1ZNIGlzIG5vdCBzZXQKQ09ORklH
X0FSQ0hfSEFTX0RFQlVHX1ZJUlRVQUw9eQojIENPTkZJR19ERUJVR19WSVJUVUFMIGlzIG5v
dCBzZXQKQ09ORklHX0RFQlVHX01FTU9SWV9JTklUPXkKIyBDT05GSUdfREVCVUdfUEVSX0NQ
VV9NQVBTIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfS01BUF9MT0NBTCBpcyBub3Qgc2V0
CkNPTkZJR19BUkNIX1NVUFBPUlRTX0tNQVBfTE9DQUxfRk9SQ0VfTUFQPXkKIyBDT05GSUdf
REVCVUdfS01BUF9MT0NBTF9GT1JDRV9NQVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19I
SUdITUVNIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfREVCVUdfU1RBQ0tPVkVSRkxPVz15CiMg
Q09ORklHX0RFQlVHX1NUQUNLT1ZFUkZMT1cgaXMgbm90IHNldApDT05GSUdfQ09ERV9UQUdH
SU5HPXkKQ09ORklHX01FTV9BTExPQ19QUk9GSUxJTkc9eQpDT05GSUdfTUVNX0FMTE9DX1BS
T0ZJTElOR19FTkFCTEVEX0JZX0RFRkFVTFQ9eQpDT05GSUdfTUVNX0FMTE9DX1BST0ZJTElO
R19ERUJVRz15CkNPTkZJR19DQ19IQVNfS0FTQU5fR0VORVJJQz15CkNPTkZJR19DQ19IQVNf
S0FTQU5fU1dfVEFHUz15CkNPTkZJR19DQ19IQVNfV09SS0lOR19OT1NBTklUSVpFX0FERFJF
U1M9eQpDT05GSUdfSEFWRV9BUkNIX0tGRU5DRT15CkNPTkZJR19LRkVOQ0U9eQpDT05GSUdf
S0ZFTkNFX1NBTVBMRV9JTlRFUlZBTD0xMDAKQ09ORklHX0tGRU5DRV9OVU1fT0JKRUNUUz0y
NTUKQ09ORklHX0tGRU5DRV9ERUZFUlJBQkxFPXkKIyBDT05GSUdfS0ZFTkNFX1NUQVRJQ19L
RVlTIGlzIG5vdCBzZXQKQ09ORklHX0tGRU5DRV9TVFJFU1NfVEVTVF9GQVVMVFM9MApDT05G
SUdfSEFWRV9LTVNBTl9DT01QSUxFUj15CiMgZW5kIG9mIE1lbW9yeSBEZWJ1Z2dpbmcKCiMg
Q09ORklHX0RFQlVHX1NISVJRIGlzIG5vdCBzZXQKCiMKIyBEZWJ1ZyBPb3BzLCBMb2NrdXBz
IGFuZCBIYW5ncwojCiMgQ09ORklHX1BBTklDX09OX09PUFMgaXMgbm90IHNldApDT05GSUdf
UEFOSUNfT05fT09QU19WQUxVRT0wCkNPTkZJR19QQU5JQ19USU1FT1VUPTQwCkNPTkZJR19M
T0NLVVBfREVURUNUT1I9eQpDT05GSUdfU09GVExPQ0tVUF9ERVRFQ1RPUj15CkNPTkZJR19C
T09UUEFSQU1fU09GVExPQ0tVUF9QQU5JQz15CkNPTkZJR19IQVZFX0hBUkRMT0NLVVBfREVU
RUNUT1JfQlVERFk9eQpDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUj15CiMgQ09ORklHX0hB
UkRMT0NLVVBfREVURUNUT1JfUFJFRkVSX0JVRERZIGlzIG5vdCBzZXQKQ09ORklHX0hBUkRM
T0NLVVBfREVURUNUT1JfUEVSRj15CiMgQ09ORklHX0hBUkRMT0NLVVBfREVURUNUT1JfQlVE
RFkgaXMgbm90IHNldAojIENPTkZJR19IQVJETE9DS1VQX0RFVEVDVE9SX0FSQ0ggaXMgbm90
IHNldApDT05GSUdfSEFSRExPQ0tVUF9ERVRFQ1RPUl9DT1VOVFNfSFJUSU1FUj15CkNPTkZJ
R19CT09UUEFSQU1fSEFSRExPQ0tVUF9QQU5JQz15CkNPTkZJR19ERVRFQ1RfSFVOR19UQVNL
PXkKQ09ORklHX0RFRkFVTFRfSFVOR19UQVNLX1RJTUVPVVQ9NjAKIyBDT05GSUdfQk9PVFBB
UkFNX0hVTkdfVEFTS19QQU5JQyBpcyBub3Qgc2V0CkNPTkZJR19ERVRFQ1RfSFVOR19UQVNL
X0JMT0NLRVI9eQpDT05GSUdfV1FfV0FUQ0hET0c9eQojIENPTkZJR19XUV9DUFVfSU5URU5T
SVZFX1JFUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfTE9DS1VQIGlzIG5vdCBzZXQK
IyBlbmQgb2YgRGVidWcgT29wcywgTG9ja3VwcyBhbmQgSGFuZ3MKCiMKIyBTY2hlZHVsZXIg
RGVidWdnaW5nCiMKQ09ORklHX1NDSEVEX0lORk89eQojIENPTkZJR19TQ0hFRFNUQVRTIGlz
IG5vdCBzZXQKIyBlbmQgb2YgU2NoZWR1bGVyIERlYnVnZ2luZwoKIyBDT05GSUdfREVCVUdf
UFJFRU1QVCBpcyBub3Qgc2V0CgojCiMgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2NrcywgbXV0
ZXhlcywgZXRjLi4uKQojCkNPTkZJR19MT0NLX0RFQlVHR0lOR19TVVBQT1JUPXkKIyBDT05G
SUdfUFJPVkVfTE9DS0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX0xPQ0tfU1RBVCBpcyBub3Qg
c2V0CkNPTkZJR19ERUJVR19SVF9NVVRFWEVTPXkKQ09ORklHX0RFQlVHX1NQSU5MT0NLPXkK
Q09ORklHX0RFQlVHX01VVEVYRVM9eQojIENPTkZJR19ERUJVR19XV19NVVRFWF9TTE9XUEFU
SCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19SV1NFTVM9eQojIENPTkZJR19ERUJVR19MT0NL
X0FMTE9DIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfQVRPTUlDX1NMRUVQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfREVCVUdfTE9DS0lOR19BUElfU0VMRlRFU1RTIGlzIG5vdCBzZXQKIyBD
T05GSUdfTE9DS19UT1JUVVJFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19XV19NVVRFWF9T
RUxGVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDRl9UT1JUVVJFX1RFU1QgaXMgbm90IHNl
dAojIGVuZCBvZiBMb2NrIERlYnVnZ2luZyAoc3BpbmxvY2tzLCBtdXRleGVzLCBldGMuLi4p
CgpDT05GSUdfTk1JX0NIRUNLX0NQVT15CiMgQ09ORklHX0RFQlVHX0lSUUZMQUdTIGlzIG5v
dCBzZXQKQ09ORklHX1NUQUNLVFJBQ0U9eQojIENPTkZJR19XQVJOX0FMTF9VTlNFRURFRF9S
QU5ET00gaXMgbm90IHNldAojIENPTkZJR19ERUJVR19LT0JKRUNUIGlzIG5vdCBzZXQKCiMK
IyBEZWJ1ZyBrZXJuZWwgZGF0YSBzdHJ1Y3R1cmVzCiMKQ09ORklHX0RFQlVHX0xJU1Q9eQoj
IENPTkZJR19ERUJVR19QTElTVCBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19TRz15CkNPTkZJ
R19ERUJVR19OT1RJRklFUlM9eQpDT05GSUdfREVCVUdfTUFQTEVfVFJFRT15CiMgZW5kIG9m
IERlYnVnIGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMKCiMKIyBSQ1UgRGVidWdnaW5nCiMKIyBD
T05GSUdfUkNVX1NDQUxFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19SQ1VfVE9SVFVSRV9U
RVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNVX1JFRl9TQ0FMRV9URVNUIGlzIG5vdCBzZXQK
Q09ORklHX1JDVV9DUFVfU1RBTExfVElNRU9VVD02MApDT05GSUdfUkNVX0VYUF9DUFVfU1RB
TExfVElNRU9VVD0wCkNPTkZJR19SQ1VfQ1BVX1NUQUxMX0NQVVRJTUU9eQojIENPTkZJR19S
Q1VfVFJBQ0UgaXMgbm90IHNldAojIENPTkZJR19SQ1VfRVFTX0RFQlVHIGlzIG5vdCBzZXQK
IyBlbmQgb2YgUkNVIERlYnVnZ2luZwoKIyBDT05GSUdfREVCVUdfV1FfRk9SQ0VfUlJfQ1BV
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0hPVFBMVUdfU1RBVEVfQ09OVFJPTCBpcyBub3Qg
c2V0CiMgQ09ORklHX0xBVEVOQ1lUT1AgaXMgbm90IHNldApDT05GSUdfVVNFUl9TVEFDS1RS
QUNFX1NVUFBPUlQ9eQpDT05GSUdfSEFWRV9SRVRIT09LPXkKQ09ORklHX0hBVkVfRlVOQ1RJ
T05fVFJBQ0VSPXkKQ09ORklHX0hBVkVfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSPXkKQ09ORklH
X0hBVkVfRlVOQ1RJT05fR1JBUEhfRlJFR1M9eQpDT05GSUdfSEFWRV9GVFJBQ0VfR1JBUEhf
RlVOQz15CkNPTkZJR19IQVZFX0RZTkFNSUNfRlRSQUNFPXkKQ09ORklHX0hBVkVfRFlOQU1J
Q19GVFJBQ0VfV0lUSF9SRUdTPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9E
SVJFQ1RfQ0FMTFM9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRV9OT19QQVRDSEFCTEU9
eQpDT05GSUdfSEFWRV9GVFJBQ0VfTUNPVU5UX1JFQ09SRD15CkNPTkZJR19IQVZFX1NZU0NB
TExfVFJBQ0VQT0lOVFM9eQpDT05GSUdfSEFWRV9DX1JFQ09SRE1DT1VOVD15CkNPTkZJR19I
QVZFX0JVSUxEVElNRV9NQ09VTlRfU09SVD15CkNPTkZJR19UUkFDSU5HX1NVUFBPUlQ9eQoj
IENPTkZJR19GVFJBQ0UgaXMgbm90IHNldAojIENPTkZJR19QUk9WSURFX09IQ0kxMzk0X0RN
QV9JTklUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FNUExFUyBpcyBub3Qgc2V0CkNPTkZJR19B
UkNIX0hBU19ERVZNRU1fSVNfQUxMT1dFRD15CkNPTkZJR19TVFJJQ1RfREVWTUVNPXkKQ09O
RklHX0lPX1NUUklDVF9ERVZNRU09eQoKIwojIHg4NiBEZWJ1Z2dpbmcKIwpDT05GSUdfWDg2
X1ZFUkJPU0VfQk9PVFVQPXkKIyBDT05GSUdfRUFSTFlfUFJJTlRLIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVCVUdfVExCRkxVU0ggaXMgbm90IHNldApDT05GSUdfSEFWRV9NTUlPVFJBQ0Vf
U1VQUE9SVD15CiMgQ09ORklHX1g4Nl9ERUNPREVSX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBD
T05GSUdfSU9fREVMQVlfMFg4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lPX0RFTEFZXzBYRUQg
aXMgbm90IHNldApDT05GSUdfSU9fREVMQVlfVURFTEFZPXkKIyBDT05GSUdfSU9fREVMQVlf
Tk9ORSBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0JPT1RfUEFSQU1TIGlzIG5vdCBzZXQK
IyBDT05GSUdfQ1BBX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfRU5UUlkgaXMg
bm90IHNldAojIENPTkZJR19ERUJVR19OTUlfU0VMRlRFU1QgaXMgbm90IHNldAojIENPTkZJ
R19YODZfREVCVUdfRlBVIGlzIG5vdCBzZXQKIyBDT05GSUdfUFVOSVRfQVRPTV9ERUJVRyBp
cyBub3Qgc2V0CkNPTkZJR19VTldJTkRFUl9GUkFNRV9QT0lOVEVSPXkKIyBlbmQgb2YgeDg2
IERlYnVnZ2luZwoKIwojIEtlcm5lbCBUZXN0aW5nIGFuZCBDb3ZlcmFnZQojCkNPTkZJR19L
VU5JVD1tCkNPTkZJR19LVU5JVF9ERUJVR0ZTPXkKIyBDT05GSUdfS1VOSVRfRkFVTFRfVEVT
VCBpcyBub3Qgc2V0CkNPTkZJR19LVU5JVF9URVNUPW0KIyBDT05GSUdfS1VOSVRfRVhBTVBM
RV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfS1VOSVRfQUxMX1RFU1RTIGlzIG5vdCBzZXQK
Q09ORklHX0tVTklUX0RFRkFVTFRfRU5BQkxFRD15CkNPTkZJR19LVU5JVF9BVVRPUlVOX0VO
QUJMRUQ9eQojIENPTkZJR19OT1RJRklFUl9FUlJPUl9JTkpFQ1RJT04gaXMgbm90IHNldAoj
IENPTkZJR19GQVVMVF9JTkpFQ1RJT04gaXMgbm90IHNldApDT05GSUdfUlVOVElNRV9URVNU
SU5HX01FTlU9eQojIENPTkZJR19URVNUX0RIUlkgaXMgbm90IHNldAojIENPTkZJR19MS0RU
TSBpcyBub3Qgc2V0CkNPTkZJR19DUFVNQVNLX0tVTklUX1RFU1Q9bQpDT05GSUdfVEVTVF9M
SVNUX1NPUlQ9bQpDT05GSUdfVEVTVF9NSU5fSEVBUD1tCkNPTkZJR19URVNUX1NPUlQ9bQpD
T05GSUdfVEVTVF9ESVY2ND1tCkNPTkZJR19URVNUX01VTERJVjY0PXkKQ09ORklHX1RFU1Rf
SU9WX0lURVI9bQpDT05GSUdfQkFDS1RSQUNFX1NFTEZfVEVTVD1tCiMgQ09ORklHX1RFU1Rf
UkVGX1RSQUNLRVIgaXMgbm90IHNldApDT05GSUdfUkJUUkVFX1RFU1Q9bQpDT05GSUdfUkVF
RF9TT0xPTU9OX1RFU1Q9bQpDT05GSUdfSU5URVJWQUxfVFJFRV9URVNUPW0KQ09ORklHX1BF
UkNQVV9URVNUPW0KQ09ORklHX0FUT01JQzY0X1NFTEZURVNUPXkKIyBDT05GSUdfVEVTVF9I
RVhEVU1QIGlzIG5vdCBzZXQKQ09ORklHX1BSSU5URl9LVU5JVF9URVNUPW0KQ09ORklHX1ND
QU5GX0tVTklUX1RFU1Q9bQpDT05GSUdfU1RSSU5HX0tVTklUX1RFU1Q9bQpDT05GSUdfU1RS
SU5HX0hFTFBFUlNfS1VOSVRfVEVTVD1tCkNPTkZJR19URVNUX0tTVFJUT1g9eQpDT05GSUdf
VEVTVF9CSVRNQVA9bQpDT05GSUdfVEVTVF9VVUlEPW0KQ09ORklHX1RFU1RfWEFSUkFZPW0K
Q09ORklHX1RFU1RfTUFQTEVfVFJFRT1tCiMgQ09ORklHX1RFU1RfUkhBU0hUQUJMRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RFU1RfSURBIGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfTUlTQ19N
SU5PUj1tCiMgQ09ORklHX1RFU1RfTEtNIGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfQklUT1BT
PW0KQ09ORklHX1RFU1RfVk1BTExPQz1tCkNPTkZJR19URVNUX0JQRj1tCkNPTkZJR19GSU5E
X0JJVF9CRU5DSE1BUks9bQojIENPTkZJR19URVNUX0ZJUk1XQVJFIGlzIG5vdCBzZXQKQ09O
RklHX1RFU1RfU1lTQ1RMPW0KQ09ORklHX0JJVEZJRUxEX0tVTklUPW0KQ09ORklHX0NIRUNL
U1VNX0tVTklUPW0KQ09ORklHX1VUSUxfTUFDUk9TX0tVTklUPW0KQ09ORklHX0hBU0hfS1VO
SVRfVEVTVD1tCkNPTkZJR19SRVNPVVJDRV9LVU5JVF9URVNUPW0KQ09ORklHX1NZU0NUTF9L
VU5JVF9URVNUPW0KQ09ORklHX0tGSUZPX0tVTklUX1RFU1Q9bQpDT05GSUdfTElTVF9LVU5J
VF9URVNUPW0KQ09ORklHX0hBU0hUQUJMRV9LVU5JVF9URVNUPW0KQ09ORklHX0xJTkVBUl9S
QU5HRVNfVEVTVD1tCkNPTkZJR19DTURMSU5FX0tVTklUX1RFU1Q9bQpDT05GSUdfQklUU19U
RVNUPW0KQ09ORklHX1NMVUJfS1VOSVRfVEVTVD1tCiMgQ09ORklHX1JBVElPTkFMX0tVTklU
X1RFU1QgaXMgbm90IHNldApDT05GSUdfTUVNQ1BZX0tVTklUX1RFU1Q9bQpDT05GSUdfSVNf
U0lHTkVEX1RZUEVfS1VOSVRfVEVTVD1tCkNPTkZJR19PVkVSRkxPV19LVU5JVF9URVNUPW0K
Q09ORklHX1JBTkRTVFJVQ1RfS1VOSVRfVEVTVD1tCkNPTkZJR19TVEFDS0lOSVRfS1VOSVRf
VEVTVD1tCkNPTkZJR19GT1JUSUZZX0tVTklUX1RFU1Q9bQpDT05GSUdfQ1JDX0tVTklUX1RF
U1Q9bQpDT05GSUdfQ1JDX0JFTkNITUFSSz15CkNPTkZJR19TSVBIQVNIX0tVTklUX1RFU1Q9
bQpDT05GSUdfVVNFUkNPUFlfS1VOSVRfVEVTVD1tCiMgQ09ORklHX0JMQUNLSE9MRV9ERVZf
S1VOSVRfVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19URVNUX1VERUxBWT1tCiMgQ09ORklHX1RF
U1RfU1RBVElDX0tFWVMgaXMgbm90IHNldAojIENPTkZJR19URVNUX0tNT0QgaXMgbm90IHNl
dAojIENPTkZJR19URVNUX0tBTExTWU1TIGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfTUVNQ0FU
X1A9bQpDT05GSUdfVEVTVF9NRU1JTklUPW0KQ09ORklHX1RFU1RfRlJFRV9QQUdFUz1tCkNP
TkZJR19URVNUX0ZQVT1tCiMgQ09ORklHX1RFU1RfQ0xPQ0tTT1VSQ0VfV0FUQ0hET0cgaXMg
bm90IHNldApDT05GSUdfVEVTVF9PQkpQT09MPW0KQ09ORklHX0lOVF9QT1dfS1VOSVRfVEVT
VD1tCkNPTkZJR19JTlRfU1FSVF9LVU5JVF9URVNUPW0KQ09ORklHX0lOVF9MT0dfS1VOSVRf
VEVTVD1tCkNPTkZJR19HQ0RfS1VOSVRfVEVTVD1tCkNPTkZJR19QUklNRV9OVU1CRVJTX0tV
TklUX1RFU1Q9bQpDT05GSUdfQVJDSF9VU0VfTUVNVEVTVD15CiMgQ09ORklHX01FTVRFU1Qg
aXMgbm90IHNldAojIGVuZCBvZiBLZXJuZWwgVGVzdGluZyBhbmQgQ292ZXJhZ2UKCiMKIyBS
dXN0IGhhY2tpbmcKIwojIGVuZCBvZiBSdXN0IGhhY2tpbmcKIyBlbmQgb2YgS2VybmVsIGhh
Y2tpbmcKCkNPTkZJR19JT19VUklOR19aQ1JYPXkK

--------------YLYL0yEjb1B0QaqUkhYaFCUx--
