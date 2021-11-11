Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 174DD44E396
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 10:03:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC17E6EB42;
	Fri, 12 Nov 2021 09:03:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37AB26E446
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 14:21:58 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r8so7109658iog.7
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 06:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20210112.gappssmtp.com; s=20210112;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=EKmFgG+cgSKbRgFxTZ4Z0n/ivv2X9oycFWZWg6SRZdw=;
 b=ZA+Xu0vUrdE2kMUGufmGqeSc9EM4heQdp0N43qlAMwYyxD/HmwUldZ1szFPBShteuU
 8/BODaww2JqzT4aah9NINB9yrfgMTbfXFa0xxAeUUX5RL48qQXL0+Pz4dUZFVwKCnC3l
 hNOKqhwGtsl8tTy+MVgGcUBAYgrDczda8PmY4XDQTUJHglc8uQmVBUdgYkqrIPyn7vTo
 aaXo2macmUyGazvYXYEICRQHST2hEgkBG7X+dY4orEj6lHNDNSqyEFyBidt9/yE9IO5w
 9AE+ba/Y5qBvz684p/cvxkGK4cHd5P0doKgzeKvnFCqNA5HdAUeOyywQq56ks9Qwi96k
 D6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-language:content-transfer-encoding;
 bh=EKmFgG+cgSKbRgFxTZ4Z0n/ivv2X9oycFWZWg6SRZdw=;
 b=QrfgnNISV+SbKx+ujs6Kf2BYVYrgBMyrmE+UslpV0tn3Dp7U7mwf1fH5is76sUWnEp
 lDlZ/kT7o3E20+ootpDQJe1LOeynvx3uA6e0LIwEz+wQ81D2dMs9JWOQTMC5FcDy/qXj
 MzbX2i9ZhlkGQdch3TYu/XlOl/rLNXS/CHFwtmlTg06p/RZoxdDfnH9AT3vQRaEXb1Su
 5s7Z6989cjKdDD0Gxq9Vx61vK7FWSirmxaZAG6quI9NbXV1rB/bqyuwWQOfyFeZNDcyR
 grIOibO3vikNZEumhAPb7j6WgpVke6t2JUgWUyh2HMDzvEpu2tsY6bSRFlIh8RPQMqy+
 p7Jg==
X-Gm-Message-State: AOAM533dIy/3MAn4hKIYuxgRZB1+p7cV2OOe0o36uLNF6+fNV3aUigl3
 XX4HN05XZqIv6PVRIcZnwbTjtOZ1ssSQOdCe
X-Google-Smtp-Source: ABdhPJyHEJqvN8ZCswOE1hTNP/xjafm72+WUT7j2OsjSkiaUC63XNBab42ZomWnSFDVG0RaS1Wvn4Q==
X-Received: by 2002:a05:6602:158b:: with SMTP id
 e11mr5113227iow.191.1636640517223; 
 Thu, 11 Nov 2021 06:21:57 -0800 (PST)
Received: from [192.168.1.30] ([207.135.234.126])
 by smtp.gmail.com with ESMTPSA id d7sm1784745iom.37.2021.11.11.06.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:21:56 -0800 (PST)
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>
From: Jens Axboe <axboe@kernel.dk>
Subject: ____i915_gem_object_get_pages() -> shmem_get_pages() crash in -git
Message-ID: <c19e9907-4651-7503-915e-60f4df530e95@kernel.dk>
Date: Thu, 11 Nov 2021 07:21:55 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Fri, 12 Nov 2021 09:03:36 +0000
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

Hi,

Running -git as of a day or two ago on my laptop, and I've hit this resume
crash a few times:

OOM killer enabled.
Restarting tasks ... done.
thermal thermal_zone7: failed to read out thermal zone (-61)
xfs filesystem being remounted at /run/systemd/unit-root/var/cache/private/fwupdmgr supports timestamps until 2038 (0x7fffffff)
PM: suspend exit
BUG: unable to handle page fault for address: fffffffffffffff4
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 21360b067 P4D 21360b067 PUD 21360d067 PMD 0 
Oops: 0000 [#1] PREEMPT SMP
CPU: 7 PID: 3687 Comm: Xorg Tainted: G S                5.15.0+ #12136
Hardware name: LENOVO 20XWCTO1WW/20XWCTO1WW, BIOS N32ET72W (1.48 ) 10/08/2021
RIP: 0010:shmem_read_mapping_page_gfp+0x53/0x90
Code: af 75 5b 41 89 d0 6a 00 45 31 c9 b9 02 00 00 00 6a 00 48 8d 55 f0 4c 89 d7 e8 89 f6 ff ff 5a 85 c0 59 74 2b 48 98 48 89 45 f0 <48> 8b 10 f7 c2 00 00 80 00 48 c7 c2 fb ff ff ff 48 0f 45 c2 48 8b
RSP: 0018:ffffa01940ec7c18 EFLAGS: 00010282
RAX: fffffffffffffff4 RBX: 00000000000002f3 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffffffffffff RDI: ffffffffaff0a3c0
RBP: ffffa01940ec7c28 R08: 0000000000000000 R09: 0000000000000f00
R10: 0000000000000002 R11: 0000000000000000 R12: 00000000001120d2
R13: ffff8c6b0648a200 R14: ffff8c69a45472c0 R15: ffff8c69ba412c10
FS:  00007ffae02f3a40(0000) GS:ffff8c6b8f7c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffffffffff4 CR3: 000000010efb5001 CR4: 0000000000570ee0
PKRU: 55555554
Call Trace:
 <TASK>
 shmem_get_pages+0x242/0x640 [i915]
 ? drm_vma_node_allow+0xb7/0xe0 [drm]
 ? drm_gem_handle_create_tail+0xca/0x1a0 [drm]
 ____i915_gem_object_get_pages+0x20/0x50 [i915]
 __i915_gem_object_get_pages+0x35/0x40 [i915]
 i915_gem_set_domain_ioctl+0x255/0x2d0 [i915]
 ? i915_gem_object_set_to_cpu_domain+0xb0/0xb0 [i915]
 drm_ioctl_kernel+0xb4/0x140 [drm]
 drm_ioctl+0x22d/0x440 [drm]
 ? i915_gem_object_set_to_cpu_domain+0xb0/0xb0 [i915]
 ? __fget_files+0x74/0xa0
 __x64_sys_ioctl+0x8e/0xc0
 do_syscall_64+0x35/0xb0
 entry_SYSCALL_64_after_hwframe+0x44/0xae
RIP: 0033:0x7ffae065350b
Code: 0f 1e fa 48 8b 05 85 39 0d 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 55 39 0d 00 f7 d8 64 89 01 48
RSP: 002b:00007ffe8b906c88 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00005611c921d0b0 RCX: 00007ffae065350b
RDX: 00007ffe8b906cd4 RSI: 00000000400c645f RDI: 0000000000000011
RBP: 00007ffe8b906d60 R08: 00005611ca9f7360 R09: 00005611cb62e920
R10: 00005611c9167010 R11: 0000000000000246 R12: 00005611ca9f7360
R13: 00005611c921d0c8 R14: 00007ffe8b906cd4 R15: 0000000000000011
 </TASK>
Modules linked in: rfcomm ccm cmac bnep iwlmvm mac80211 btusb btrtl binfmt_misc btbcm uvcvideo btintel bluetooth x86_pkg_temp_thermal videobuf2_vmalloc videobuf2_memops videobuf2_v4l2 videobuf2_common videodev nls_iso8859_1 intel_powerclamp mc coretemp ecdh_generic ecc libarc4 kvm_intel wmi_bmof iwlwifi snd_hda_codec_hdmi kvm snd_ctl_led snd_hda_codec_realtek snd_hda_codec_generic cfg80211 irqbypass snd_hda_intel snd_intel_dspcfg snd_hda_codec intel_cstate input_leds snd_hwdep thinkpad_acpi snd_hda_core serio_raw hid_multitouch nvram ledtrig_audio mei_me platform_profile snd_seq snd_pcm mei snd_timer processor_thermal_device_pci_legacy snd_seq_device intel_soc_dts_iosf processor_thermal_device processor_thermal_rfim snd ucsi_acpi typec_ucsi processor_thermal_mbox typec processor_thermal_rapl intel_rapl_common soundcore int3403_thermal int340x_thermal_zone int3400_thermal wmi acpi_thermal_rel acpi_pad sch_fq_codel msr ip_tables x_tables usbhid i915 hid_generic i2c_algo_bit
 ttm drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm crct10dif_pclmul crc32_pclmul nvme ghash_clmulni_intel aesni_intel nvme_core intel_lpss_pci crypto_simd intel_lpss cryptd idma64 virt_dma video
CR2: fffffffffffffff4
---[ end trace f26a0d7d10ef13d6 ]---
RIP: 0010:shmem_read_mapping_page_gfp+0x53/0x90
Code: af 75 5b 41 89 d0 6a 00 45 31 c9 b9 02 00 00 00 6a 00 48 8d 55 f0 4c 89 d7 e8 89 f6 ff ff 5a 85 c0 59 74 2b 48 98 48 89 45 f0 <48> 8b 10 f7 c2 00 00 80 00 48 c7 c2 fb ff ff ff 48 0f 45 c2 48 8b
RSP: 0018:ffffa01940ec7c18 EFLAGS: 00010282
RAX: fffffffffffffff4 RBX: 00000000000002f3 RCX: 0000000000000000
RDX: 0000000000000000 RSI: ffffffffffffffff RDI: ffffffffaff0a3c0
RBP: ffffa01940ec7c28 R08: 0000000000000000 R09: 0000000000000f00
R10: 0000000000000002 R11: 0000000000000000 R12: 00000000001120d2
R13: ffff8c6b0648a200 R14: ffff8c69a45472c0 R15: ffff8c69ba412c10
FS:  00007ffae02f3a40(0000) GS:ffff8c6b8f7c0000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: fffffffffffffff4 CR3: 000000010efb5001 CR4: 0000000000570ee0
PKRU: 55555554

Ring a bell for anyone? This is an X1 gen9 laptop, intel graphics.

-- 
Jens Axboe

