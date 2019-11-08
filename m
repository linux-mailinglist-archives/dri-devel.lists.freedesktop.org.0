Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C28BBF4B57
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 13:22:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941A06E0DB;
	Fri,  8 Nov 2019 12:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C476E0ED
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 12:22:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 43B4EB3EE;
 Fri,  8 Nov 2019 12:22:18 +0000 (UTC)
Subject: Re: [PATCH v3 0/4] drm/udl: Convert to SHMEM
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>,
 airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, kraxel@redhat.com
References: <20191107094307.19870-1-tzimmermann@suse.de>
 <cd38b510-6914-ab38-677a-1ebce8c7d4d5@pr.hu>
 <f2f5afa1-59e5-149f-ed58-a5708926ae5a@suse.de>
 <ea3fe8ab-1e0f-0f3b-ebf4-4c3b3f2e0b1d@pr.hu>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <75ac3d34-6c69-3ee1-4ac7-4f2abb0bd45e@suse.de>
Date: Fri, 8 Nov 2019 13:22:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <ea3fe8ab-1e0f-0f3b-ebf4-4c3b3f2e0b1d@pr.hu>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============0513538101=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0513538101==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="YAEqpx03DyYdgFbCxXelTh9mOR5GQEg2z"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--YAEqpx03DyYdgFbCxXelTh9mOR5GQEg2z
Content-Type: multipart/mixed; boundary="qvkHVEv9ihFXWcbDlStP2ELDwM9WxY5JW";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>,
 airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, noralf@tronnes.org,
 sam@ravnborg.org, emil.velikov@collabora.com, kraxel@redhat.com
Cc: dri-devel@lists.freedesktop.org
Message-ID: <75ac3d34-6c69-3ee1-4ac7-4f2abb0bd45e@suse.de>
Subject: Re: [PATCH v3 0/4] drm/udl: Convert to SHMEM
References: <20191107094307.19870-1-tzimmermann@suse.de>
 <cd38b510-6914-ab38-677a-1ebce8c7d4d5@pr.hu>
 <f2f5afa1-59e5-149f-ed58-a5708926ae5a@suse.de>
 <ea3fe8ab-1e0f-0f3b-ebf4-4c3b3f2e0b1d@pr.hu>
In-Reply-To: <ea3fe8ab-1e0f-0f3b-ebf4-4c3b3f2e0b1d@pr.hu>

--qvkHVEv9ihFXWcbDlStP2ELDwM9WxY5JW
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.11.19 um 13:06 schrieb B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n:
> Hi!
>=20
> 2019. 11. 08. 8:36 keltez=C3=A9ssel, Thomas Zimmermann =C3=ADrta:
>> Hi B=C3=B6sz=C3=B6rm=C3=A9nyi
>=20
> FYI, it's Zoltan, as it's my first name. :-)

Sorry.

>=20
>> Am 07.11.19 um 16:10 schrieb B=C3=B6sz=C3=B6rm=C3=A9nyi Zolt=C3=A1n:
>> Have you tried to increase the buffer size? There's a command-line
>> option to control this setting. [1]
>=20
> Yes, I did, it didn't help. I used swiotlb=3D49152 (96MB) and
> swiotlb=3D65536 (128MB) vs the default 32768 (64MB).
>=20
> This parameter controls the _number of slab slots_ instead of
> a single contiguous size as I read in the kernel sources.
>=20
> With swiotlb=3D65536 I get the same error and dmesg lines:
>=20
> [=C2=A0=C2=A0 97.671898] udl 2-1.2:1.0: swiotlb buffer is full (sz: 197=
8368
> bytes), total 65536 (slots), used 28 (slots)
> [=C2=A0 107.477068] udl 2-1.2:1.0: swiotlb buffer is full (sz: 524288 b=
ytes),
> total 65536 (slots), used 584 (slots)
> [=C2=A0 108.311947] udl 2-1.2:1.0: swiotlb buffer is full (sz: 2080768
> bytes), total 65536 (slots), used 0 (slots)
> [=C2=A0 110.330940] udl 2-1.2:1.0: swiotlb buffer is full (sz: 3031040
> bytes), total 65536 (slots), used 56 (slots)
> [=C2=A0 111.102755] udl 2-1.2:1.0: swiotlb buffer is full (sz: 3145728
> bytes), total 65536 (slots), used 1536 (slots)
>=20
> It turned out, it's the combination of IO_TLB_SEGSIZE * (1<<IO_TLB_SHIF=
T)
> that is too small. It is currently 128 * 2KB if I'm counting right in
> binary.
>=20
> I have just tried with these settings in swiotlb.h:
>=20
> #define IO_TLB_SHIFT 12
> #define IO_TLB_SEGSIZE 1024
>=20
> That's 4MB, used as contiguous DMA memory. The whole swiotlb aperture
> is still 64MB, it's just that there is now a smaller number of larger
> buffers.
>=20
> The warning messages were all about buffer sizes smaller than 4MB,
> so I thought it worth a try and it indeed fixed the issue.
>=20
> Now I can reliably reconfigure the monitor's orientation attached
> to UDL in relation to the monitors attached to the Intel device.

Great!

>=20
> I remember having the same "swiotlb buffer is full" issue during the la=
te
> 2.6.x kernel series, around Fedora 27 or so, with the radeon driver.
>=20
> I don't know if changing the swiotlb values is the proper solution, or
> to add some scatter-gather interface somewhere in UDL or PRIME or whate=
ver.
>=20
> Now, where should I post this report? Kernel bugzilla? Or is this mail
> thread enough?

There's an entry with contact info for swiotlb in MAINTAINERS.


>=20
> To get back to the topic of this patchset, you can add my:
>=20
> Tested-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@pr.hu>

Thanks for testing the patchset. I push it shortly before receiving your
mail, unfortunately.

Best regards
Thomas

>=20
> Best regards,
> Zolt=C3=A1n
>=20
>>
>> Best regards
>> Thomas
>>
>> [1] https://wiki.gentoo.org/wiki/IOMMU_SWIOTLB
>>
>>
>>> [=C2=A0 133.320410] udl 2-1.2:1.0: overflow 0x00000001199e4000+221184=
0 of DMA
>>> mask ffffffff bus mask 0
>>> [=C2=A0 133.320424] WARNING: CPU: 0 PID: 739 at kernel/dma/direct.c:3=
5
>>> report_addr+0x3e/0x70
>>> [=C2=A0 133.320425] Modules linked in: 8021q garp mrp stp llc intel_r=
apl_msr
>>> intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp
>>> kvm_intel snd_hda_codec_hdmi kvm snd_hda_codec_realt
>>> ek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_hda_codec
>>> iTCO_wdt elo irqbypass iTCO_vendor_support intel_cstate snd_hda_core
>>> intel_uncore snd_hwdep intel_rapl_perf snd_pcm pcspkr
>>> =C2=A0=C2=A0i2c_i801 snd_timer e1000e snd joydev lpc_ich soundcore ip=
6t_REJECT
>>> nf_reject_ipv6 nf_log_ipv6 ip6table_filter ip6_tables nf_log_ipv4
>>> nf_log_common xt_LOG xt_limit xt_multiport xt_conntrack
>>> =C2=A0=C2=A0iptable_nat nf_nat xt_connmark nf_conntrack nf_defrag_ipv=
6
>>> nf_defrag_ipv4 libcrc32c iptable_mangle i915 udl i2c_algo_bit
>>> drm_kms_helper syscopyarea sysfillrect sysimgblt fb_sys_fops drm cr
>>> c32_pclmul crc32c_intel serio_raw video
>>> [=C2=A0 133.320463] CPU: 0 PID: 739 Comm: Xorg Not tainted 5.3.8 #1
>>> [=C2=A0 133.320465] Hardware name: TOSHIBA 4852E70/Intel H61 Express =
Chipset,
>>> BIOS XBKT200 01/04/2017
>>> [=C2=A0 133.320467] EIP: report_addr+0x3e/0x70
>>> [=C2=A0 133.320470] Code: 00 89 4d f8 85 d2 74 44 8b 0a 8b 5a 04 ba f=
e ff ff
>>> ff 39 ca ba 00 00 00 00 19 da 73 17 80 3d 9c 16 14 d0 00 0f 84 24 09 =
00
>>> 00 <0f> 0b 8b 5d fc c9 c3 8d 76 00 8b 90 5c 01 00 00 0b 90 58 01 00 0=
0
>>> [=C2=A0 133.320472] EAX: 00000000 EBX: 00000000 ECX: f5b89e00 EDX: 00=
000007
>>> [=C2=A0 133.320473] ESI: ffffffff EDI: ecf3921c EBP: ec56bcf4 ESP: ec=
56bce8
>>> [=C2=A0 133.320475] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLA=
GS:
>>> 00213286
>>> [=C2=A0 133.320476] CR0: 80050033 CR2: b7236020 CR3: 2c72a000 CR4: 00=
0406f0
>>> [=C2=A0 133.320477] Call Trace:
>>> [=C2=A0 133.320484]=C2=A0 dma_direct_map_page+0x158/0x180
>>> [=C2=A0 133.320487]=C2=A0 dma_direct_map_sg+0x4f/0xa0
>>> [=C2=A0 133.320564]=C2=A0 i915_gem_map_dma_buf+0x1b8/0x1d0 [i915]
>>> [=C2=A0 133.320568]=C2=A0 dma_buf_map_attachment+0x4f/0x90
>>> [=C2=A0 133.320572]=C2=A0 udl_gem_prime_import+0x43/0x12a [udl]
>>> [=C2=A0 133.320607]=C2=A0 drm_gem_prime_fd_to_handle+0x97/0x180 [drm]=

>>> [=C2=A0 133.320625]=C2=A0 ? drm_gem_prime_export+0xa0/0xa0 [drm]
>>> [=C2=A0 133.320642]=C2=A0 ? drm_gem_prime_import+0x20/0x20 [drm]
>>> [=C2=A0 133.320658]=C2=A0 ? drm_prime_handle_to_fd_ioctl+0x70/0x70 [d=
rm]
>>> [=C2=A0 133.320673]=C2=A0 drm_prime_fd_to_handle_ioctl+0x2f/0x50 [drm=
]
>>> [=C2=A0 133.320689]=C2=A0 drm_ioctl_kernel+0x8f/0xd0 [drm]
>>> [=C2=A0 133.320706]=C2=A0 drm_ioctl+0x21c/0x3c0 [drm]
>>> [=C2=A0 133.320721]=C2=A0 ? drm_prime_handle_to_fd_ioctl+0x70/0x70 [d=
rm]
>>> [=C2=A0 133.320726]=C2=A0 ? file_modified+0x30/0x30
>>> [=C2=A0 133.320728]=C2=A0 ? file_update_time+0xfe/0x130
>>> [=C2=A0 133.320731]=C2=A0 ? page_add_file_rmap+0x72/0xd0
>>> [=C2=A0 133.320734]=C2=A0 ? fault_dirty_shared_page.isra.122+0x6d/0xb=
0
>>> [=C2=A0 133.320750]=C2=A0 ? drm_version+0x80/0x80 [drm]
>>> [=C2=A0 133.320753]=C2=A0 do_vfs_ioctl+0x9a/0x6c0
>>> [=C2=A0 133.320757]=C2=A0 ksys_ioctl+0x56/0x80
>>> [=C2=A0 133.320760]=C2=A0 sys_ioctl+0x16/0x20
>>> [=C2=A0 133.320763]=C2=A0 do_fast_syscall_32+0x82/0x1c7
>>> [=C2=A0 133.320766]=C2=A0 entry_SYSENTER_32+0x9f/0xf2
>>> [=C2=A0 133.320768] EIP: 0xb7f84a75
>>> [=C2=A0 133.320770] Code: e8 1c 00 00 00 89 d3 eb cf 8d 74 26 00 b8 4=
0 42 0f
>>> 00 eb b5 8b 04 24 c3 8b 1c 24 c3 8b 3c 24 c3 90 51 52 55 89 e5 0f 34 =
cd
>>> 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 7=
6
>>> [=C2=A0 133.320772] EAX: ffffffda EBX: 0000000c ECX: c00c642e EDX: bf=
f26be0
>>> [=C2=A0 133.320773] ESI: 0221ad20 EDI: c00c642e EBP: 0000000c ESP: bf=
f26b88
>>> [=C2=A0 133.320775] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLA=
GS:
>>> 00203296
>>> [=C2=A0 133.320777] ---[ end trace 18cd4f77716f2f5f ]---
>>>
>>> With your drm-next and your patch set, the call trace is obviously
>>> different:
>>>
>>> [=C2=A0=C2=A0 37.486584] udl 2-1.2:1.0: swiotlb buffer is full (sz: 5=
36576 bytes),
>>> total 32768 (slots), used 1536 (slots)
>>> [=C2=A0=C2=A0 37.486591] udl 2-1.2:1.0: overflow 0x000000011a47d000+5=
36576 of DMA
>>> mask ffffffff bus mask 0
>>> [=C2=A0=C2=A0 37.486598] ------------[ cut here ]------------
>>> [=C2=A0=C2=A0 37.486606] WARNING: CPU: 1 PID: 749 at kernel/dma/direc=
t.c:35
>>> report_addr+0x3e/0x70
>>> [=C2=A0=C2=A0 37.486607] Modules linked in: 8021q garp mrp stp llc in=
tel_rapl_msr
>>> intel_rapl_common x86_pkg_temp_thermal intel_powerclamp coretemp
>>> kvm_intel kvm snd_hda_codec_hdmi snd_hda_codec_realt
>>> ek snd_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_nhlt
>>> snd_hda_codec iTCO_wdt iTCO_vendor_support elo irqbypass snd_hda_core=

>>> intel_cstate intel_uncore snd_hwdep snd_pcm intel_r
>>> apl_perf e1000e pcspkr joydev i2c_i801 snd_timer lpc_ich snd soundcor=
e
>>> ip6t_REJECT nf_reject_ipv6 nf_log_ipv6 ip6table_filter ip6_tables
>>> nf_log_ipv4 nf_log_common xt_LOG xt_limit xt_multipo
>>> rt xt_conntrack iptable_nat nf_nat xt_connmark nf_conntrack
>>> nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c iptable_mangle i915 udl
>>> i2c_algo_bit drm_kms_helper syscopyarea sysfillrect crc32_pclmul
>>> sysimgblt crc32c_intel fb_sys_fops serio_raw drm video
>>> [=C2=A0=C2=A0 37.486647] CPU: 1 PID: 749 Comm: Xorg Tainted: G=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 W
>>> 5.4.0-rc4+ #1
>>> [=C2=A0=C2=A0 37.486648] Hardware name: TOSHIBA 4852E70/Intel H61 Exp=
ress Chipset,
>>> BIOS XBKT200 01/04/2017
>>> [=C2=A0=C2=A0 37.486652] EIP: report_addr+0x3e/0x70
>>> [=C2=A0=C2=A0 37.486655] Code: 00 89 4d f8 85 d2 74 44 8b 0a 8b 5a 04=
 ba fe ff ff
>>> ff 39 ca ba 00 00 00 00 19 da 73 17 80 3d b0 7d 95 d2 00 0f 84 c4 08 =
00
>>> 00 <0f> 0b 8b 5d fc c9 c3 8d 76 00 8b 90 5c 01 00 00 0b 90 58 01 00 0=
0
>>> [=C2=A0=C2=A0 37.486656] EAX: 00000000 EBX: 00000000 ECX: f68e3e00 ED=
X: 00000007
>>> [=C2=A0=C2=A0 37.486657] ESI: ed77f81c EDI: ffffffff EBP: ed1e5cfc ES=
P: ed1e5cf0
>>> [=C2=A0=C2=A0 37.486659] DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068=
 EFLAGS:
>>> 00213286
>>> [=C2=A0=C2=A0 37.486661] CR0: 80050033 CR2: b7223020 CR3: 2cad8000 CR=
4: 000406f0
>>> [=C2=A0=C2=A0 37.486662] Call Trace:
>>> [=C2=A0=C2=A0 37.486669]=C2=A0 dma_direct_map_page+0x158/0x180
>>> [=C2=A0=C2=A0 37.486673]=C2=A0 dma_direct_map_sg+0x4f/0xa0
>>> [=C2=A0=C2=A0 37.486744]=C2=A0 i915_gem_map_dma_buf+0x114/0x190 [i915=
]
>>> [=C2=A0=C2=A0 37.486748]=C2=A0 dma_buf_map_attachment+0x4f/0x90
>>> [=C2=A0=C2=A0 37.486781]=C2=A0 drm_gem_prime_import_dev+0x5d/0x100 [d=
rm]
>>> [=C2=A0=C2=A0 37.486802]=C2=A0 ? drm_prime_destroy_file_private+0x20/=
0x20 [drm]
>>> [=C2=A0=C2=A0 37.486821]=C2=A0 drm_gem_prime_fd_to_handle+0x158/0x180=
 [drm]
>>> [=C2=A0=C2=A0 37.486838]=C2=A0 ? drm_gem_prime_import+0x20/0x20 [drm]=

>>> [=C2=A0=C2=A0 37.486854]=C2=A0 ? drm_prime_destroy_file_private+0x20/=
0x20 [drm]
>>> [=C2=A0=C2=A0 37.486871]=C2=A0 drm_prime_fd_to_handle_ioctl+0x21/0x30=
 [drm]
>>> [=C2=A0=C2=A0 37.486888]=C2=A0 drm_ioctl_kernel+0x99/0xe0 [drm]
>>> [=C2=A0=C2=A0 37.486904]=C2=A0 ? drm_prime_destroy_file_private+0x20/=
0x20 [drm]
>>> [=C2=A0=C2=A0 37.486922]=C2=A0 drm_ioctl+0x21a/0x380 [drm]
>>> [=C2=A0=C2=A0 37.486938]=C2=A0 ? drm_prime_destroy_file_private+0x20/=
0x20 [drm]
>>> [=C2=A0=C2=A0 37.486942]=C2=A0 ? __send_signal+0x2a4/0x3e0
>>> [=C2=A0=C2=A0 37.486944]=C2=A0 ? send_signal+0xb0/0xf0
>>> [=C2=A0=C2=A0 37.486946]=C2=A0 ? do_send_sig_info+0x4b/0x80
>>> [=C2=A0=C2=A0 37.486963]=C2=A0 ? drm_ioctl_kernel+0xe0/0xe0 [drm]
>>> [=C2=A0=C2=A0 37.486967]=C2=A0 do_vfs_ioctl+0x3fa/0x6b0
>>> [=C2=A0=C2=A0 37.486969]=C2=A0 ? kill_pid_info+0x31/0x60
>>> [=C2=A0=C2=A0 37.486973]=C2=A0 ? ktime_get+0x4c/0x110
>>> [=C2=A0=C2=A0 37.486977]=C2=A0 ksys_ioctl+0x5d/0x90
>>> [=C2=A0=C2=A0 37.486980]=C2=A0 sys_ioctl+0x16/0x20
>>> [=C2=A0=C2=A0 37.486983]=C2=A0 do_fast_syscall_32+0x82/0x1c7
>>> [=C2=A0=C2=A0 37.486988]=C2=A0 entry_SYSENTER_32+0x9f/0xf2
>>> [=C2=A0=C2=A0 37.486989] EIP: 0xb7f75b55
>>> [=C2=A0=C2=A0 37.486992] Code: 00 00 8d 76 00 b8 40 42 0f 00 eb bb 8b=
 04 24 c3 8b
>>> 14 24 c3 8b 1c 24 c3 8b 34 24 c3 8b 3c 24 c3 90 51 52 55 89 e5 0f 34 =
cd
>>> 80 <5d> 5a 59 c3 90 90 90 90 8d 76 00 58 b8 77 00 00 00 cd 80 90 8d 7=
6
>>> [=C2=A0=C2=A0 37.486994] EAX: ffffffda EBX: 0000000c ECX: c00c642e ED=
X: bfd13dc0
>>> [=C2=A0=C2=A0 37.486995] ESI: 01c03520 EDI: c00c642e EBP: 0000000c ES=
P: bfd13d68
>>> [=C2=A0=C2=A0 37.486997] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b=
 EFLAGS:
>>> 00203292
>>> [=C2=A0=C2=A0 37.486999] ---[ end trace cef48717f4fbe0fa ]---
>>>
>>> It seems I get random successes with mostly failures of this kind:
>>>
>>> # DISPLAY=3D:0 xrandr --output DVI-I-1-1 --mode 1024x768 --below DP-1=

>>> xrandr: Configure crtc 2 failed
>>> # DISPLAY=3D:0 xrandr --output DVI-I-1-1 --mode 1024x768 --right-of D=
P-1
>>> xrandr: Configure crtc 2 failed
>>>
>>> These messages appear for failed attempts:
>>>
>>> [=C2=A0 552.197202] udl 2-1.2:1.0: swiotlb buffer is full (sz: 360448=
 bytes),
>>> total 32768 (slots), used 98 (slots)
>>> [=C2=A0 552.387539] udl 2-1.2:1.0: swiotlb buffer is full (sz: 819200=
 bytes),
>>> total 32768 (slots), used 210 (slots)
>>> [=C2=A0 562.139080] udl 2-1.2:1.0: swiotlb buffer is full (sz: 272384=
0
>>> bytes), total 32768 (slots), used 206 (slots)
>>> [=C2=A0 709.666258] udl 2-1.2:1.0: swiotlb buffer is full (sz: 209715=
2
>>> bytes), total 32768 (slots), used 20 (slots)
>>> [=C2=A0 709.868665] udl 2-1.2:1.0: swiotlb buffer is full (sz: 209715=
2
>>> bytes), total 32768 (slots), used 14 (slots)
>>> [=C2=A0 721.728930] udl 2-1.2:1.0: swiotlb buffer is full (sz: 313344=
0
>>> bytes), total 32768 (slots), used 6 (slots)
>>> [=C2=A0 738.187591] udl 2-1.2:1.0: swiotlb buffer is full (sz: 524288=
 bytes),
>>> total 32768 (slots), used 238 (slots)
>>> [=C2=A0 738.373190] udl 2-1.2:1.0: swiotlb buffer is full (sz: 950272=
 bytes),
>>> total 32768 (slots), used 664 (slots)
>>> [=C2=A0 738.990204] udl 2-1.2:1.0: swiotlb buffer is full (sz: 983040=
 bytes),
>>> total 32768 (slots), used 24 (slots)
>>> [=C2=A0 743.599439] udl 2-1.2:1.0: swiotlb buffer is full (sz: 282624=
0
>>> bytes), total 32768 (slots), used 156 (slots)
>>>
>>> Best regards,
>>> Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi
>>>
>>>>
>>>> v3:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* restore udl vmap function that enabl=
es caching
>>>> v2:
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0* remove obsolete udl code in a separa=
te patch
>>>>
>>>> Thomas Zimmermann (4):
>>>> =C2=A0=C2=A0=C2=A0 drm/udl: Remove flags field from struct udl_gem_o=
bject
>>>> =C2=A0=C2=A0=C2=A0 drm/udl: Allocate GEM object via struct
>>>> drm_driver.gem_create_object
>>>> =C2=A0=C2=A0=C2=A0 drm/udl: Switch to SHMEM
>>>> =C2=A0=C2=A0=C2=A0 drm/udl: Remove struct udl_gem_object and functio=
ns
>>>>
>>>> =C2=A0=C2=A0 drivers/gpu/drm/udl/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
>>>> =C2=A0=C2=A0 drivers/gpu/drm/udl/Makefile=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 2 +-
>>>> =C2=A0=C2=A0 drivers/gpu/drm/udl/udl_dmabuf.c | 255
>>>> ------------------------------
>>>> =C2=A0=C2=A0 drivers/gpu/drm/udl/udl_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 30 +---
>>>> =C2=A0=C2=A0 drivers/gpu/drm/udl/udl_drv.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 36 +----
>>>> =C2=A0=C2=A0 drivers/gpu/drm/udl/udl_fb.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0 66 ++++----
>>>> =C2=A0=C2=A0 drivers/gpu/drm/udl/udl_gem.c=C2=A0=C2=A0=C2=A0 | 263
>>>> +++++++++----------------------
>>>> =C2=A0=C2=A0 7 files changed, 122 insertions(+), 531 deletions(-)
>>>> =C2=A0=C2=A0 delete mode 100644 drivers/gpu/drm/udl/udl_dmabuf.c
>>>>
>>>> --=C2=A0
>>>> 2.23.0
>>>>
>>>> _______________________________________________
>>>> dri-devel mailing list
>>>> dri-devel@lists.freedesktop.org
>>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>>>
>>>
>>> _______________________________________________
>>> dri-devel mailing list
>>> dri-devel@lists.freedesktop.org
>>> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>>
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--qvkHVEv9ihFXWcbDlStP2ELDwM9WxY5JW--

--YAEqpx03DyYdgFbCxXelTh9mOR5GQEg2z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3FXfUACgkQaA3BHVML
eiNLBggAuJU1xDIh0s/NRObeVnwlzEhhk3B5j3BSmHGRH+ylDSkK9YHlVrQMSXTv
uKJjoatYNe2ffJ2Anx3PZ2u65bFJSvKRpYZF+qSItV4XoMdXRYIOIPL3g5n7l4zz
kBBLivhz+mJ+2O3tM2w+HITn0HZhsDt4e0/g1Ldr8NRd2tjLMoUohTGlmiV2ARgB
960Ea0xkyN3vy0UcSwVa9K311QoIcXs+pII04ou8dh1E3nYVpTnamz6IPiN0SfG4
qsoQONMjc0ap5ry7/u1mr/bfhCdyNEe9FzX/naW0x7yOcL2M7U7FylKAHf7Fd7gR
apohjnvFfnDc3BD+jKuETTJgwrjd1Q==
=lWwL
-----END PGP SIGNATURE-----

--YAEqpx03DyYdgFbCxXelTh9mOR5GQEg2z--

--===============0513538101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0513538101==--
