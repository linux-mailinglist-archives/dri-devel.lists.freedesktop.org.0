Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0940CA0895F
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 08:47:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62D3F10EFF6;
	Fri, 10 Jan 2025 07:47:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xhidj8xh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 747BE10EFF8;
 Fri, 10 Jan 2025 07:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736495254; x=1768031254;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=z3U7S8oADWyc3HBC83TzL41/Y1BQTyDmhJTg7zCRlvA=;
 b=Xhidj8xhxpQu/k4U5Y/7A8L+prJs6bn9d5C0JnTzMoUT262QUgPRhGHm
 tmSUrTqjXhAWw/0pvOEydQZgDmww79W/hAB3RIVa3WSS2VHIR1fFbi1Tz
 UzeAAb51YgS+c+j0bUZAfZH/kI/BeBk5Gj/gUMasyVF5UxhGv5zbjKZSV
 2yQ9reVIjtCLpRoiNzebQPRVgGGPYYtUkrEypILoOqYgVQYrUwLzHGfna
 njmXtwbWCSmhm0pTxLLdh9q2mHDHN2ADeUNgEQQ5ALkaNwvrGDfrADQmv
 UcXRdlO9bxteiU/jhDwHgfuaovDMW2yvZFabaqA6uC1TBHpfWgULU0GiC w==;
X-CSE-ConnectionGUID: lCGwr7P0SAix52Fsv+L1qw==
X-CSE-MsgGUID: oioYQrfOSg6TdxKemHx7Zg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="37012516"
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="37012516"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 23:47:34 -0800
X-CSE-ConnectionGUID: E+TtP7rLSdOwFS41z4V4DA==
X-CSE-MsgGUID: wPmrHsxJQOCK/imvcwo/PA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,303,1728975600"; d="scan'208";a="103845167"
Received: from psantos-mobl1.ger.corp.intel.com (HELO [10.246.21.18])
 ([10.246.21.18])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 23:47:32 -0800
Message-ID: <732d1d7a-23fb-4d8d-bd91-10b3c6c6d285@linux.intel.com>
Date: Fri, 10 Jan 2025 08:47:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915: Add VM_DONTEXPAND to exported buffers
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, karol.wachowski@intel.com,
 tomasz.rusinowicz@intel.com
References: <20250108105346.240103-1-jacek.lawrynowicz@linux.intel.com>
 <173642283773.28201.13348625605034220367@jlahtine-mobl.ger.corp.intel.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <173642283773.28201.13348625605034220367@jlahtine-mobl.ger.corp.intel.com>
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

Sure, the test does the following:
1. Create a Vulkan buffer using VK_STRUCTURE_TYPE_EXPORT_MEMORY_ALLOCATE_=
INFO and VK_EXTERNAL_MEMORY_HANDLE_TYPE_DMA_BUF_BIT_EXT
2. Get Vulkan buffer FD using vkGetMemoryFdKHR()
3. Import the Vulcan buffer to intel_vpu using DRM_IOCTL_PRIME_FD_TO_HAND=
LE
4. Call mmap() on the imported buffer

Seems like there was no use case for importing and mmaping buffers from i=
915.
The key factor here is that i915 buffer has to imported by other device t=
hat uses GEM.

Regards,
Jacek

On 1/9/2025 12:40 PM, Joonas Lahtinen wrote:
> Hi,
>=20
> Could you elaborate a bit more on which testcase or usecase this pops u=
p with?
>=20
> The check has been in place since 2019 so quite surprising that it's
> only popping up now.
>=20
> Regards, Joonas
>=20
> Quoting Jacek Lawrynowicz (2025-01-08 12:53:46)
>> drm_gem_mmap_obj() expects VM_DONTEXPAND flag to be set after mmap
>> callback is executed. Set this flag at the end of i915_gem_dmabuf_mmap=
()
>> to prevent WARN on mmap in buffers imported from i915 e.g.,
>>
>> [  283.623215] WARNING: CPU: 1 PID: 12693 at drivers/gpu/drm/drm_gem.c=
:1087 drm_gem_mmap_obj+0x196/0x1c0
>> [  283.623221] Modules linked in: intel_vpu(OE) cmac nls_utf8 cifs cif=
s_arc4 nls_ucs2_utils cifs_md4 netfs overlay nls_iso8859_1 binfmt_misc in=
tel_uncore_frequency intel_uncore_frequency_common x86_pkg_temp_thermal i=
ntel_powerclamp intel_rapl_msr coretemp rapl intel_cstate kvm_intel wmi_b=
mof input_leds kvm processor_thermal_device_pci processor_thermal_device =
processor_thermal_wt_hint processor_thermal_rfim processor_thermal_rapl i=
ntel_rapl_common processor_thermal_wt_req intel_vsec processor_thermal_st=
c processor_thermal_power_floor igen6_edac processor_thermal_mbox pac1934=
 industrialio int3403_thermal int340x_thermal_zone intel_pmc_core int3400=
_thermal pmt_telemetry intel_hid pmt_class acpi_thermal_rel sparse_keymap=
 acpi_tad acpi_pad efi_pstore autofs4 btrfs blake2b_generic raid10 raid45=
6 async_raid6_recov async_memcpy async_pq async_xor async_tx xor raid6_pq=
 libcrc32c raid1 raid0 xe drm_ttm_helper drm_suballoc_helper drm_gpuvm dr=
m_exec hid_sensor_custom hid_sensor_hub intel_ishtp_hid hid_generic usbhi=
d hid i915
>> [  283.623254]  crct10dif_pclmul i2c_algo_bit crc32_pclmul drm_buddy g=
hash_clmulni_intel ttm sha512_ssse3 sha256_ssse3 e1000e drm_display_helpe=
r nvme sha1_ssse3 intel_lpss_pci thunderbolt intel_ish_ipc intel_lpss vmd=
 intel_ishtp idma64 nvme_core drm_kms_helper video wmi pinctrl_meteorlake=
 backlight pinctrl_intel aesni_intel crypto_simd cryptd [last unloaded: i=
ntel_vpu(OE)]
>> [  283.623267] CPU: 1 UID: 0 PID: 12693 Comm: npu-kmd-test Tainted: G =
    U     OE      6.12.0-performance-20241122-11972534541 #1 f86ee8132c28=
3cf158e9fd89cc84f4adeb3b79b7
>> [  283.623269] Tainted: [U]=3DUSER, [O]=3DOOT_MODULE, [E]=3DUNSIGNED_M=
ODULE
>> [  283.623270] Hardware name: Intel Corporation Meteor Lake Client Pla=
tform/MTL-P DDR5 SODIMM SBS RVP, BIOS MTLPFWI1.R00.4122.D21.2408281317 08=
/28/2024
>> [  283.623271] RIP: 0010:drm_gem_mmap_obj+0x196/0x1c0
>> [  283.623273] Code: 49 8b 94 24 40 01 00 00 48 8b 12 48 85 d2 74 31 8=
9 45 ec 4c 89 e7 ff d2 0f 1f 00 8b 45 ec e9 f8 fe ff ff 0f 0b e9 54 ff ff=
 ff <0f> 0b e9 ea fe ff ff b8 ea ff ff ff 31 d2 31 f6 31 ff c3 cc cc cc
>> [  283.623274] RSP: 0018:ffffc90004103b20 EFLAGS: 00010246
>> [  283.623275] RAX: 0000000000000000 RBX: ffff888313ebafd0 RCX: 000000=
0000000000
>> [  283.623276] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000000=
0000000000
>> [  283.623276] RBP: ffffc90004103b38 R08: 0000000000000000 R09: ffffc9=
0004103bd8
>> [  283.623277] R10: 0000000000000000 R11: 0000000000000000 R12: ffff88=
8108b95400
>> [  283.623277] R13: ffff888108b95400 R14: ffff88815ee50000 R15: ffff88=
830133b000
>> [  283.623278] FS:  00007fcbf9063740(0000) GS:ffff88846fe40000(0000) k=
nlGS:0000000000000000
>> [  283.623279] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
>> [  283.623280] CR2: 00007fcbeb15d460 CR3: 00000001076a2002 CR4: 000000=
0000f72ef0
>> [  283.623280] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 000000=
0000000000
>> [  283.623281] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 000000=
0000000400
>> [  283.623281] PKRU: 55555554
>> [  283.623282] Call Trace:
>> [  283.623283]  <TASK>
>> [  283.623285]  ? show_regs+0x75/0x90
>> [  283.623289]  ? __warn+0x91/0x150
>> [  283.623291]  ? drm_gem_mmap_obj+0x196/0x1c0
>> [  283.623292]  ? report_bug+0x1af/0x1c0
>> [  283.623295]  ? handle_bug+0x6e/0xb0
>> [  283.623297]  ? exc_invalid_op+0x1d/0x90
>> [  283.623298]  ? asm_exc_invalid_op+0x1f/0x30
>> [  283.623302]  ? drm_gem_mmap_obj+0x196/0x1c0
>> [  283.623304]  drm_gem_mmap+0x125/0x200
>> [  283.623305]  __mmap_region+0x7bc/0xc30
>> [  283.623310]  mmap_region+0x96/0xd0
>> [  283.623311]  do_mmap+0x526/0x650
>> [  283.623313]  vm_mmap_pgoff+0xec/0x1c0
>> [  283.623315]  ? __count_memcg_events+0x89/0x160
>> [  283.623317]  ksys_mmap_pgoff+0x175/0x230
>> [  283.623318]  __x64_sys_mmap+0x37/0x70
>> [  283.623320]  x64_sys_call+0x1c1d/0x2790
>> [  283.623322]  do_syscall_64+0x62/0x180
>> [  283.623324]  entry_SYSCALL_64_after_hwframe+0x71/0x79
>> [  283.623325] RIP: 0033:0x7fcbf8b1ea27
>> [  283.623327] Code: 00 00 00 89 ef e8 59 ae ff ff eb e4 e8 42 7b 01 0=
0 66 90 f3 0f 1e fa 41 89 ca 41 f7 c1 ff 0f 00 00 75 10 b8 09 00 00 00 0f=
 05 <48> 3d 00 f0 ff ff 77 21 c3 48 8b 05 d9 b3 0f 00 64 c7 00 16 00 00
>> [  283.623328] RSP: 002b:00007fff157ded78 EFLAGS: 00000246 ORIG_RAX: 0=
000000000000009
>> [  283.623329] RAX: ffffffffffffffda RBX: 00007fff157dedf0 RCX: 00007f=
cbf8b1ea27
>> [  283.623330] RDX: 0000000000000003 RSI: 0000000000002000 RDI: 000000=
0000000000
>> [  283.623330] RBP: 00007fff157def80 R08: 0000000000000004 R09: 000000=
010418a000
>> [  283.623331] R10: 0000000000000001 R11: 0000000000000246 R12: 00007f=
ff157dee70
>> [  283.623331] R13: 0000644e2fb203f8 R14: 00007fff157deef0 R15: 00007f=
ff157deeb0
>> [  283.623333]  </TASK>
>> [  283.623333] ---[ end trace 0000000000000000 ]---
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/=
drm/i915/gem/i915_gem_dmabuf.c
>> index 9473050ac8425..809018265e36f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -110,6 +110,7 @@ static int i915_gem_dmabuf_mmap(struct dma_buf *dm=
a_buf, struct vm_area_struct *
>>         if (ret)
>>                 return ret;
>> =20
>> +       vm_flags_set(vma, VM_DONTEXPAND);
>>         vma_set_file(vma, obj->base.filp);
>> =20
>>         return 0;
>> --=20
>> 2.45.1
>>

