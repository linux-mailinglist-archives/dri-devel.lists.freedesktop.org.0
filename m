Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8866C40C65F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 15:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C100B89D43;
	Wed, 15 Sep 2021 13:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C0BE89E41;
 Wed, 15 Sep 2021 13:26:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10107"; a="220441184"
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="220441184"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 06:26:43 -0700
X-IronPort-AV: E=Sophos;i="5.85,295,1624345200"; d="scan'208";a="544926616"
Received: from ajoisx-mobl.gar.corp.intel.com (HELO [10.252.49.163])
 ([10.252.49.163])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2021 06:26:42 -0700
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add mmap lock around vma_lookup()
 to prevent lockdep splats
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20210915105946.394412-1-maarten.lankhorst@linux.intel.com>
 <CAM0jSHNFcYSvSgPuxdq-it-V9ARkOLbndTqJT3wK8awEZ_dqWA@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <7cf435cf-d319-db11-2f30-95135464193c@linux.intel.com>
Date: Wed, 15 Sep 2021 15:26:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNFcYSvSgPuxdq-it-V9ARkOLbndTqJT3wK8awEZ_dqWA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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

Op 15-09-2021 om 15:19 schreef Matthew Auld:
> On Wed, 15 Sept 2021 at 12:00, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> Fixes the following splat:
>>
>> i915: Running i915_gem_mman_live_selftests/igt_mmap
>> ------------[ cut here ]------------
>> WARNING: CPU: 3 PID: 5654 at include/linux/mmap_lock.h:164 find_vma+0x4e/0xb0
>> Modules linked in: i915(+) vgem fuse snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic ledtrig_audio mei_hdcp x86_pkg_temp_thermal coretemp crct10dif_pclmul crc32_pclmul ghash_clmulni_intel snd_intel_dspcfg snd_hda_codec snd_hwdep e1000e snd_hda_core ptp snd_pcm ttm mei_me pps_core i2c_i801 prime_numbers i2c_smbus mei [last unloaded: i915]
>> CPU: 3 PID: 5654 Comm: i915_selftest Tainted: G     U            5.15.0-rc1-CI-Trybot_7984+ #1
>> Hardware name: Micro-Star International Co., Ltd. MS-7B54/Z370M MORTAR (MS-7B54), BIOS 1.00 10/31/2017
>> RIP: 0010:find_vma+0x4e/0xb0
>> Code: de 48 89 ef e8 d3 94 fe ff 48 85 c0 74 34 48 83 c4 08 5b 5d c3 48 8d bf 28 01 00 00 be ff ff ff ff e8 d6 46 8b 00 85 c0 75 c8 <0f> 0b 48 8b 85 b8 00 00 00 48 85 c0 75 c6 48 89 ef e8 12 26 87 00
>> RSP: 0018:ffffc900013df980 EFLAGS: 00010246
>> RAX: 0000000000000000 RBX: 00007f9df2b80000 RCX: 0000000000000000
>> RDX: 0000000000000001 RSI: ffffffff822e314c RDI: ffffffff8233c83f
>> RBP: ffff88811bafc840 R08: ffff888107d0ddb8 R09: 00000000fffffffe
>> R10: 0000000000000001 R11: 00000000ffbae7ba R12: 0000000000000000
>> R13: 0000000000000000 R14: ffff88812a710000 R15: ffff888114fa42c0
>> FS:  00007f9def9d4c00(0000) GS:ffff888266580000(0000) knlGS:0000000000000000
>> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> CR2: 00007f799627fe50 CR3: 000000011bbc2006 CR4: 00000000003706e0
>> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
>> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
>> Call Trace:
>>  __igt_mmap+0xe0/0x490 [i915]
>>  igt_mmap+0xd2/0x160 [i915]
>>  ? __trace_bprintk+0x6e/0x80
>>  __i915_subtests.cold.7+0x42/0x92 [i915]
>>  ? i915_perf_selftests+0x20/0x20 [i915]
>>  ? __i915_nop_setup+0x10/0x10 [i915]
>>  __run_selftests.part.3+0x10d/0x172 [i915]
>>  i915_live_selftests.cold.5+0x1f/0x47 [i915]
>>  i915_pci_probe+0x93/0x1d0 [i915]
>>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/intel/issues/4129
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>

Thanks, pushed to gt-next. :)

