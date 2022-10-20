Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F02806055FA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 05:39:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0913F10E251;
	Thu, 20 Oct 2022 03:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8D2D10E251;
 Thu, 20 Oct 2022 03:38:45 +0000 (UTC)
Received: from [192.168.2.145] (109-252-119-114.nat.spd-mgts.ru
 [109.252.119.114])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8BB9C660239C;
 Thu, 20 Oct 2022 04:38:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666237124;
 bh=XLaDYRImzS4QNHQf3UJr7jJ21fqatfhiaHOnPpbsi6U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=dTecU5SrJEPaLEoB+QvbXKUWUTSX6SK0XJ3kugX9oPS70OLCb11YU6MHZiphI8igU
 Cju8NqmdrywDGKwGqitfHgg3Ga4v8BbmV8Hrr0LyNys5LhKezFdvn/Rgh7b4/xwqDe
 ItqCZxSmWrSnJlQ8KKDPqQHldPdWgvaopbRPUMKfKEMG5K6sg10wuqa7nNaoGmA4vl
 OIOjxklG3ai4YhU+W3yBn13Vm9vzb5SBmYmciwbYH5/nAZrgMa27iCyU3V+qH76ywV
 7tmBpp4F61e/jyz426gn53jsp/OHEb9YdcG95WWf1+MRFFsKKinHL6gMw45byivSxN
 JJQaFwDBVyQFA==
Message-ID: <72534bd1-a941-b627-4efd-34c8d87127d3@collabora.com>
Date: Thu, 20 Oct 2022 06:38:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [drm/gem] 79e2cf2e7a:
 WARNING:at_drivers/gpu/drm/drm_gem.c:#drm_gem_vunmap
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <202210201109.c762970e-yujie.liu@intel.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <202210201109.c762970e-yujie.liu@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: lkp@intel.com, lima@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, lkp@lists.01.org,
 spice-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10/20/22 06:23, kernel test robot wrote:
> Greeting,
> 
> FYI, we noticed WARNING:at_drivers/gpu/drm/drm_gem.c:#drm_gem_vunmap due to commit (built with clang-14):
> 
> commit: 79e2cf2e7a193473dfb0da3b9b869682b43dc60f ("drm/gem: Take reservation lock for vmap/vunmap operations")
> git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> 
> in testcase: boot
> 
> on test machine: qemu-system-i386 -enable-kvm -cpu SandyBridge -smp 2 -m 4G
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> [    5.483437][    T1] ------------[ cut here ]------------
> [    5.484265][    T1] WARNING: CPU: 1 PID: 1 at drivers/gpu/drm/drm_gem.c:1191 drm_gem_vunmap+0x50/0xa0
> [    5.485640][    T1] Modules linked in:
> [    5.486298][    T1] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc2-00895-g79e2cf2e7a19 #1 d064e7e3c98977ac595341fa8e33617722110e67
> [    5.488083][    T1] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.0-debian-1.16.0-4 04/01/2014
> [    5.489590][    T1] EIP: drm_gem_vunmap+0x50/0xa0
> [    5.490359][    T1] Code: ff ff e8 f3 29 97 00 85 c0 0f 94 c3 eb 02 31 db 0f b6 fb b8 90 74 8e c3 89 fa 31 c9 6a 00 e8 77 ca 7b ff 83 c4 04 84 db 74 02 <0f> 0b b8 a8 74 8e c3 89 fa 31 c9 6a 00 e8 5e ca 7b ff 83 c4 04 83
> [    5.493049][    T1] EAX: c38e74a0 EBX: ffffff01 ECX: 00000000 EDX: 00000001
> [    5.494179][    T1] ESI: c6d8b870 EDI: 00000001 EBP: c46d7d34 ESP: c46d7d24
> [    5.495296][    T1] DS: 007b ES: 007b FS: 00d8 GS: 0000 SS: 0068 EFLAGS: 00010202
> [    5.496530][    T1] CR0: 80050033 CR2: 00000000 CR3: 03aa0000 CR4: 000406d0
> [    5.497647][    T1] DR0: 00000000 DR1: 00000000 DR2: 00000000 DR3: 00000000
> [    5.498759][    T1] DR6: fffe0ff0 DR7: 00000400
> [    5.499486][    T1] Call Trace:
> [    5.500104][    T1]  drm_client_buffer_delete+0x1d/0x90
> [    5.500877][    T1]  drm_client_framebuffer_delete+0x37/0x60
> [    5.501805][    T1]  drm_fbdev_cleanup+0x80/0x90
> [    5.502653][    T1]  drm_fbdev_client_hotplug+0x1b6/0x210
> [    5.503585][    T1]  drm_fbdev_generic_setup+0x143/0x1a0
> [    5.504571][    T1]  vkms_init+0x23f/0x244
> [    5.505338][    T1]  ? vgem_init+0x133/0x133
> [    5.506130][    T1]  do_one_initcall+0x10e/0x210
> [    5.506976][    T1]  ? vgem_init+0x133/0x133
> [    5.507775][    T1]  do_initcall_level+0x80/0x92
> [    5.508630][    T1]  do_initcalls+0x41/0x6f
> [    5.509386][    T1]  do_basic_setup+0x17/0x19
> [    5.510106][    T1]  kernel_init_freeable+0xb4/0xe5
> [    5.510970][    T1]  ? rest_init+0x180/0x180
> [    5.511745][    T1]  kernel_init+0x17/0x180
> [    5.512522][    T1]  ret_from_fork+0x19/0x24
> [    5.513333][    T1] irq event stamp: 118087
> [    5.514101][    T1] hardirqs last  enabled at (118097): [<c1107774>] __up_console_sem+0x64/0xb0
> [    5.515620][    T1] hardirqs last disabled at (118110): [<c110775b>] __up_console_sem+0x4b/0xb0
> [    5.517061][    T1] softirqs last  enabled at (117834): [<c236bd86>] __do_softirq+0x2c6/0x329
> [    5.518391][    T1] softirqs last disabled at (117825): [<c102bb62>] do_softirq_own_stack+0x22/0x30
> [    5.519760][    T1] ---[ end trace 0000000000000000 ]---

That's a good catch, I missed to touch drm_client.c. At a quick glance
will be fine to switch it to the unlocked drm_gem_vun/map functions.

-- 
Best regards,
Dmitry

