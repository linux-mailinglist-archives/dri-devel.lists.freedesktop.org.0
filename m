Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EFD2F73DA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 08:50:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D94D6E175;
	Fri, 15 Jan 2021 07:50:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15CD6E165;
 Fri, 15 Jan 2021 07:50:35 +0000 (UTC)
IronPort-SDR: WK6QJFiOI5c4hwBLlPBb7xEDPjecvkVWzON6JFLJt4z8Lo8gViHH1VYQC9Bkucv4pZJZ0LwRnj
 zPYWjqIrHexQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9864"; a="178600141"
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="178600141"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 23:50:32 -0800
IronPort-SDR: sE+wicejpdjwI5sz3rL5UivRYWPuYpz0Sz9m2SC0oCkt7LnNQVNXOCiFK41XEwO6phK9OHXeQ3
 nR4jMXqTPgaA==
X-IronPort-AV: E=Sophos;i="5.79,348,1602572400"; d="scan'208";a="382575810"
Received: from bmkierna-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.213.221.58])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jan 2021 23:50:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: Re: [BUG] on reboot: bisected to: drm/i915: Shut down displays
 gracefully on reboot
In-Reply-To: <20210114163435.767ccbb0@gandalf.local.home>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210114163206.4a562d82@gandalf.local.home>
 <20210114163435.767ccbb0@gandalf.local.home>
Date: Fri, 15 Jan 2021 09:50:25 +0200
Message-ID: <87mtxaprjy.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, chris@chris-wilson.co.uk,
 Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 14 Jan 2021, Steven Rostedt <rostedt@goodmis.org> wrote:
> [ Forgot to add those on the commit itself ]
>
> -- Steve
>
>
> On Thu, 14 Jan 2021 16:32:06 -0500
> Steven Rostedt <rostedt@goodmis.org> wrote:
>
>> On reboot, one of my test boxes now triggers the following warning:
>> 
>>  ------------[ cut here ]------------
>>  RPM raw-wakeref not held
>>  WARNING: CPU: 4 PID: 1 at drivers/gpu/drm/i915/intel_runtime_pm.h:106 gen6_write32+0x1bc/0x2a0 [i915]
>>  Modules linked in: ebtable_filter ebtables bridge stp llc ip6t_REJECT nf_reject_ipv6 vsock vmw_vmci xt_state xt_conntrack nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 ip6table_filter ip6_tables snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic le
>> 15 snd_hda_intel snd_intel_dspcfg snd_hda_codec snd_hwdep i2c_algo_bit snd_hda_core snd_seq intel_rapl_msr snd_seq_device intel_rapl_common snd_pcm x86_pkg_temp_thermal intel_powerclamp snd_timer snd coretemp kvm_intel soundcore kvm mei_wdt irqbypass joydev 
>> _pmc_bxt hp_wmi wmi_bmof sparse_keymap rfkill iTCO_vendor_support crct10dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel drm_kms_helper i2c_i801 cec drm rapl intel_cstate intel_uncore mei_me i2c_smbus e1000e tpm_infineon wmi serio_raw mei video lpc_i
>> 
>>  CPU: 4 PID: 1 Comm: systemd-shutdow Not tainted 5.9.0-rc4-test+ #861
>>  Hardware name: Hewlett-Packard HP Compaq Pro 6300 SFF/339A, BIOS K01 v03.03 07/14/2016
>>  RIP: 0010:gen6_write32+0x1bc/0x2a0 [i915]
>>  Code: 5d 82 e0 0f 0b e9 b5 fe ff ff 80 3d 95 6b 22 00 00 0f 85 b2 fe ff ff 48 c7 c7 04 d2 a4 c0 c6 05 81 6b 22 00 01 e8 f6 5c 82 e0 <0f> 0b e9 98 fe ff ff 80 3d 6d 6b 22 00 00 0f 85 95 fe ff ff 48 c7
>>  RSP: 0018:ffffb9c1c002fd08 EFLAGS: 00010296
>>  RAX: 0000000000000018 RBX: ffff99aec8881010 RCX: ffff99aeda400000
>>  RDX: 0000000000000000 RSI: ffffffffa115d9ef RDI: ffffffffa115d9ef
>>  RBP: 0000000000044004 R08: 0000000000000001 R09: 0000000000000000
>>  R10: 0000000000000001 R11: 0000000000000001 R12: 0000000000000000
>>  R13: 0000000000000001 R14: 00000000ffffffff R15: 0000000000000000
>>  FS:  00007f91257a9940(0000) GS:ffff99aeda400000(0000) knlGS:0000000000000000
>>  CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>>  CR2: 00007f9126829400 CR3: 00000001088f0006 CR4: 00000000001706e0
>>  Call Trace:
>>   gen3_irq_reset+0x2e/0xd0 [i915]
>>   intel_irq_reset+0x59/0x6a0 [i915]
>>   intel_runtime_pm_disable_interrupts+0xe/0x30 [i915]
>>   i915_driver_shutdown+0x2e/0x40 [i915]
>>   pci_device_shutdown+0x34/0x60
>>   device_shutdown+0x15d/0x1b3
>>   kernel_restart+0xe/0x30
>>   __do_sys_reboot+0x1d7/0x210
>>   ? vfs_writev+0x9d/0xe0
>>   ? syscall_enter_from_user_mode+0x1d/0x70
>>   ? trace_hardirqs_on+0x2c/0xe0
>>   do_syscall_64+0x33/0x40
>>   entry_SYSCALL_64_after_hwframe+0x44/0xa9
>>  RIP: 0033:0x7f912675f2d7
>>  Code: 64 89 01 48 83 c8 ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 89 fa be 69 19 12 28 bf ad de e1 fe b8 a9 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 8b 15 81 8b 0c 00 f7 d8 64 89 02 b8
>>  RSP: 002b:00007ffeca28e148 EFLAGS: 00000206 ORIG_RAX: 00000000000000a9
>>  RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f912675f2d7
>>  RDX: 0000000001234567 RSI: 0000000028121969 RDI: 00000000fee1dead
>>  RBP: 00007ffeca28e3d0 R08: 000000000000000a R09: 0000000000000000
>>  R10: 0000000000000232 R11: 0000000000000206 R12: 0000000000000001
>>  R13: 0000000000000000 R14: 0000000000000000 R15: 00007ffeca28e4b8
>>  ---[ end trace 2ed17eabd3ab6938 ]---
>>  ------------[ cut here ]------------
>> 
>> The bisect came to this commit:
>> 
>>   fe0f1e3bfdfeb53e18f1206aea4f40b9bd1f291c
>>   ("drm/i915: Shut down displays gracefully on reboot")
>> 
>> Which makes sense, as it happens on shutdown.

Please try this pull, heading to -rc4, which cointains "drm/i915:
Disable RPM wakeref assertions during driver shutdown":

http://lore.kernel.org/r/87sg73pz42.fsf@intel.com


BR,
Jani.

>> 
>> -- Steve
>

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
