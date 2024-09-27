Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E04D988B66
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 22:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABAE810ED1C;
	Fri, 27 Sep 2024 20:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gt1VeaYy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6061B10E45D;
 Fri, 27 Sep 2024 20:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GuZAX9m3+/QbkPmGtriZ2VKrK2/vbNA3fkcHfIWqehg=; b=gt1VeaYyAmD8wQK3EvKBcbk+EB
 bnMWWkiheFtnBhdrulujtecEOHvecSW1R9tob+FhhBLVz5sh/FZOrJvTU+XBHF5Z+7vzC2K8Knfxb
 VKd7RYxj1tOVabRi0efzpnArifziXe3XBfwgKx0IAyRf348YL/PX3wVsjOWKasUjM3+uBTds19lqu
 yD53XmRntCGzrQlxLjlYDJf8xrCS22KIeLK/F3TvVNgW1ICGIWd/WdJ2GoFXgMkbeFAkxA4wc+qsg
 NKukrWFwyU7L4scpy+FaShFfjJbdiNL+SkKe8E+O3oednho1j6dBLkOOX+X1A3AqvelRRkngsKYk3
 V29Ferhg==;
Received: from [189.6.17.125] (helo=[192.168.0.55])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1suHq5-001vFb-29; Fri, 27 Sep 2024 22:45:21 +0200
Message-ID: <a25b04c2-6fe9-4819-9587-6b8764cdca38@igalia.com>
Date: Fri, 27 Sep 2024 17:45:13 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 00/10] drm/amd/display: Use drm_edid for more code
To: Alex Hung <alex.hung@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Alexander Deucher <alexander.deucher@amd.com>
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, harry.wentland@amd.com, sunpeng.li@amd.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Broadworth, Mark" <Mark.Broadworth@amd.com>,
 "Wheeler, Daniel" <Daniel.Wheeler@amd.com>
References: <20240918213845.158293-1-mario.limonciello@amd.com>
 <c15c189d-08c0-4f7f-b4a5-7e58d530ea3e@amd.com>
Content-Language: en-US
From: Melissa Wen <mwen@igalia.com>
In-Reply-To: <c15c189d-08c0-4f7f-b4a5-7e58d530ea3e@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Hi Alex,

Thanks for the intensive testing.

I'll need some time to reproduce and debug these regressions.

So, we can divide this series into four steps:
1-2 are the basis for drm_edid migration
3-4 are code cleanups
5-9 are drm_edid_product_id migration
10 is for ACPI EDID feature.

Bearing this and the reported regressions around the product_id part in 
mind, I wonder if we can start by applying the drm_edid migration and 
the ACPI EDID feature, which means applying patches 1-4 and 10. And then 
let the second part of product_id migration for the next iteration.
IMHO it seems a smoother transition.

WDYT?

Melissa


On 27/09/2024 15:48, Alex Hung wrote:
> Hi Mario and Melissa,
>
> There are three regressions identified during the test, and 
> improvement is required before the patches can be merged. Please see 
> details below.
>
> 1. null pointer when hot-plugging a dsc hub (+ three 4k60 monitors).
>
> This may point to "drm/amd/display: use drm_edid_product_id for 
> parsing EDID product info" since that's the only patch calling 
> drm_edid_get_product_id.
>
>
> [  227.797361] RIP: 0010:drm_edid_get_product_id+0x1d/0x50 [drm]
> [  227.797388] Code: 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 44 
> 00 00 55 48 89 e5 48 85 ff 74 24 48 8b 47 08 48 85 c0 74 1b 48 83 3f 
> 7f 76 15 <48> 8b 50 08 5d 48 89 16 0f b7 40 10 66 89 46 08 e9 a9 47 ee 
> ce 31
> [  227.797391] RSP: 0018:ffffac58126f7930 EFLAGS: 00010216
> [  227.797394] RAX: 000000000000372d RBX: ffff8eaeaf8ac808 RCX: 
> ffff8eaeaf8ac107
> [  227.797396] RDX: 0000000000000002 RSI: ffffac58126f7944 RDI: 
> ffff8eaeeeaf9f80
> [  227.797398] RBP: ffffac58126f7930 R08: ffff8eae8e500d00 R09: 
> 0000000000000001
> [  227.797400] R10: ffffac58126f7978 R11: 000000000017f81b R12: 
> ffff8eae84cb0000
> [  227.797402] R13: ffff8eaeeeaf9f80 R14: 0000000000000000 R15: 
> 0000000000000100
> [  227.797405] FS:  00007f031a616ac0(0000) GS:ffff8eb57cd80000(0000) 
> knlGS:0000000000000000
> [  227.797407] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  227.797409] CR2: 0000000000003735 CR3: 000000014decc000 CR4: 
> 0000000000750ef0
> [  227.797411] PKRU: 55555554
> [  227.797413] Call Trace:
> [  227.797415]  <TASK>
> [  227.797417]  ? show_regs+0x64/0x70
> [  227.797423]  ? __die+0x24/0x70
> [  227.797427]  ? page_fault_oops+0x160/0x520
> [  227.797435]  ? do_user_addr_fault+0x2e9/0x6a0
> [  227.797438]  ? dc_link_add_remote_sink+0x20/0x30 [amdgpu]
> [  227.797654]  ? dm_dp_mst_get_modes+0xee/0x520 [amdgpu]
> [  227.797882]  ? drm_helper_probe_single_connector_modes+0x1b5/0x670 
> [drm_kms_helper]
> [  227.797894]  ? exc_page_fault+0x7f/0x190
> [  227.797899]  ? asm_exc_page_fault+0x27/0x30
> [  227.797906]  ? drm_edid_get_product_id+0x1d/0x50 [drm]
> [  227.797932]  dm_helpers_parse_edid_caps+0x69/0x260 [amdgpu]
> [  227.798139] amdgpu 0000:0b:00.0: [drm:drm_dp_dpcd_write 
> [drm_display_helper]] AMDGPU DM aux hw bus 2: 0x02003 AUX <- (ret=  1) 10
> [  227.798158]  link_add_remote_sink+0xa8/0x1a0 [amdgpu]
> [  227.798402]  dc_link_add_remote_sink+0x20/0x30 [amdgpu]
> [  227.798615]  dm_dp_mst_get_modes+0xee/0x520 [amdgpu]
> [  227.798843]  ? srso_alias_return_thunk+0x5/0xfbef5
> [  227.798848] drm_helper_probe_single_connector_modes+0x1b5/0x670 
> [drm_kms_helper]
>
>
> 2. DP2 Display is not listed as an audio device
>
> Steps to reproduce:
> - Attach display to system.
> - Boot to Desktop (Wayland)
> - Attempt to select display as an audio device.
>
> This points to patch "drm/amd/display: get SAD from drm_eld when 
> parsing EDID caps"
>
>
> 3. IGT amd_mem_leak'sconnector-suspend-resume fails on Navi 31.
>
> This points to the patch "drm/amd/display: remove dc_edid handler from 
> dm_helpers_parse_edid_caps".
>
>
> Using IGT_SRANDOM=1727192429 for randomisation
> Opened device: /dev/dri/card0
> Starting subtest: connector-suspend-resume
> [cmd] rtcwake: assuming RTC uses UTC ...
> rtcwake: wakeup from "mem" using /dev/rtc0 at Tue Sep 24 15:40:50 2024
> unreferenced object 0xffff95c683517b00 (size 256):
>   comm "kworker/u64:30", pid 3636, jiffies 4295452761
>   hex dump (first 32 bytes):
>     00 ff ff ff ff ff ff 00 22 0e c2 36 00 00 00 00 ........"..6....
>     33 1d 01 04 b5 3c 22 78 3b 28 91 a7 55 4e a3 26 3....<"x;(..UN.&
>   backtrace (crc 5800a91d):
>     [<ffffffffbb73502a>] kmemleak_alloc+0x4a/0x80
>     [<ffffffffbabbde07>] kmalloc_node_track_caller_noprof+0x337/0x410
>     [<ffffffffbab631f8>] krealloc_noprof+0x58/0xb0
>     [<ffffffffc04e8e38>] _drm_do_get_edid+0x138/0x410 [drm]
>     [<ffffffffc04e9155>] drm_edid_read_custom+0x35/0xd0 [drm]
>     [<ffffffffc04e9244>] drm_edid_read_ddc+0x44/0x80 [drm]
>     [<ffffffffc1061808>] dm_helpers_read_local_edid+0x1d8/0x340 [amdgpu]
>     [<ffffffffc11b7446>] detect_link_and_local_sink+0x356/0x1230 [amdgpu]
>     [<ffffffffc11b8366>] link_detect+0x36/0x4f0 [amdgpu]
>     [<ffffffffc13667a0>] dc_link_detect+0x20/0x30 [amdgpu]
>     [<ffffffffc10536f0>] dm_resume+0x1e0/0x7d0 [amdgpu]
>     [<ffffffffc0d25908>] amdgpu_device_ip_resume_phase2+0x58/0xd0 
> [amdgpu]
>     [<ffffffffc0d29cb7>] amdgpu_device_resume+0xa7/0x2e0 [amdgpu]
>     [<ffffffffc0d2467c>] amdgpu_pmops_resume+0x4c/0x90 [amdgpu]
>     [<ffffffffbb02e121>] pci_pm_resume+0x71/0x100
>     [<ffffffffbb22c551>] dpm_run_callback+0x91/0x1e0
> unreferenced object 0xffff95c6c58dd0c0 (size 16):
>   comm "kworker/u64:30", pid 3636, jiffies 4295452764
>   hex dump (first 16 bytes):
>     00 01 00 00 00 00 00 00 00 7b 51 83 c6 95 ff ff .........{Q.....
>   backtrace (crc 70d89717):
>     [<ffffffffbb73502a>] kmemleak_alloc+0x4a/0x80
>     [<ffffffffbabbbf3e>] kmalloc_trace_noprof+0x28e/0x300
>     [<ffffffffc04e6845>] _drm_edid_alloc+0x35/0x60 [drm]
>     [<ffffffffc04e9175>] drm_edid_read_custom+0x55/0xd0 [drm]
>     [<ffffffffc04e9244>] drm_edid_read_ddc+0x44/0x80 [drm]
>     [<ffffffffc1061808>] dm_helpers_read_local_edid+0x1d8/0x340 [amdgpu]
>     [<ffffffffc11b7446>] detect_link_and_local_sink+0x356/0x1230 [amdgpu]
>     [<ffffffffc11b8366>] link_detect+0x36/0x4f0 [amdgpu]
>     [<ffffffffc13667a0>] dc_link_detect+0x20/0x30 [amdgpu]
>     [<ffffffffc10536f0>] dm_resume+0x1e0/0x7d0 [amdgpu]
>     [<ffffffffc0d25908>] amdgpu_device_ip_resume_phase2+0x58/0xd0 
> [amdgpu]
>     [<ffffffffc0d29cb7>] amdgpu_device_resume+0xa7/0x2e0 [amdgpu]
>     [<ffffffffc0d2467c>] amdgpu_pmops_resume+0x4c/0x90 [amdgpu]
>     [<ffffffffbb02e121>] pci_pm_resume+0x71/0x100
>     [<ffffffffbb22c551>] dpm_run_callback+0x91/0x1e0
>     [<ffffffffbb22ca76>] device_resume+0xb6/0x2c0
> Stack trace:
>   #0 ../lib/igt_core.c:2051 __igt_fail_assert()
>   #1 ../tests/amdgpu/amd_mem_leak.c:202 __igt_unique____real_main208()
>   #2 ../tests/amdgpu/amd_mem_leak.c:208 main()
>   #3 ../sysdeps/nptl/libc_start_call_main.h:74 __libc_start_call_main()
>   #4 ../csu/libc-start.c:128 __libc_start_main@@GLIBC_2.34()
>   #5 [_start+0x25]
> Subtest connector-suspend-resume: FAIL (9.535s)
>
> On 9/18/24 15:38, Mario Limonciello wrote:
>> This is the successor of Melissa's v5 series that was posted [1] as well
>> as my series that was posted [2].
>>
>> Melissa's patches are mostly unmodified from v5, but the series has been
>> rebase on the new 6.10 based amd-staging-drm-next.
>>
>> As were both touching similar code for fetching the EDID, I've merged 
>> the
>> pertinent parts of my series into this one in allowing the connector to
>> fetch the EDID from _DDC if available for eDP as well.
>>
>> There are still some remaining uses of drm_edid_raw() but they touch 
>> pure
>> DC code, so a wrapper or macro will probably be needed to convert them.
>> This can be for follow ups later on.
>>
>> Link: 
>> https://lore.kernel.org/amd-gfx/20240807203207.2830-1-mwen@igalia.com/ 
>> [1]
>> Link: 
>> https://lore.kernel.org/dri-devel/20240214215756.6530-1-mario.limonciello@amd.com/ 
>> [2]
>>
>> v7:
>>   * Rebase on amd-staging-drm-next which is now 6.10 based
>>   * Fix the two LKP robot reported issues
>>
>> Mario Limonciello (1):
>>    drm/amd/display: Fetch the EDID from _DDC if available for eDP
>>
>> Melissa Wen (9):
>>    drm/amd/display: switch amdgpu_dm_connector to use struct drm_edid
>>    drm/amd/display: switch to setting physical address directly
>>    drm/amd/display: always call connector_update when parsing
>>      freesync_caps
>>    drm/amd/display: remove redundant freesync parser for DP
>>    drm/amd/display: use drm_edid_product_id for parsing EDID product 
>> info
>>    drm/amd/display: parse display name from drm_eld
>>    drm/amd/display: get SAD from drm_eld when parsing EDID caps
>>    drm/amd/display: get SADB from drm_eld when parsing EDID caps
>>    drm/amd/display: remove dc_edid handler from
>>      dm_helpers_parse_edid_caps
>>
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 200 ++++++------------
>>   .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
>>   .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 172 +++++++++------
>>   .../display/amdgpu_dm/amdgpu_dm_mst_types.c   |  34 +--
>>   drivers/gpu/drm/amd/display/dc/dm_helpers.h   |   1 -
>>   .../drm/amd/display/dc/link/link_detection.c  |   6 +-
>>   drivers/gpu/drm/amd/include/amd_shared.h      |   5 +
>>   7 files changed, 200 insertions(+), 222 deletions(-)
>>
>>
>> base-commit: 0569603f945225067d963c8ba4fda31d967ab584
>

