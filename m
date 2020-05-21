Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CBED1DD6C5
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 21:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F081C6E23D;
	Thu, 21 May 2020 19:11:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E55806E233;
 Thu, 21 May 2020 19:11:02 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec6d1b50000>; Thu, 21 May 2020 12:08:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 21 May 2020 12:11:02 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 21 May 2020 12:11:02 -0700
Received: from [10.2.48.182] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 May
 2020 19:11:01 +0000
Subject: Re: [PATCH 0/4] mm/gup, drm/i915: refactor gup_fast, convert to
 pin_user_pages()
To: Chris Wilson <chris@chris-wilson.co.uk>, Andrew Morton
 <akpm@linux-foundation.org>
References: <20200519002124.2025955-1-jhubbard@nvidia.com>
 <159008745422.32320.5724805750977048669@build.alporthouse.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <b907c1d5-b95a-3d00-cafa-0a321f0141d8@nvidia.com>
Date: Thu, 21 May 2020 12:11:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159008745422.32320.5724805750977048669@build.alporthouse.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590088117; bh=aBRert5zTUjO3CDnuWETRlzl2UkyVdUVUVTCJIf9+7M=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=iiOwP15g5WTdYZsrZXzHQiwkXMR7CF90OctL3JsApwPFGvyE44Gcmf7EM1pO3ECnc
 OJzF6eau+CefBy6Ad////MwpNwmH4SJPVKtl0VEe+76F45oxwAKJtzJ8P+M48rzcrt
 Glhwp/ft/bEKWBo8jTcnZFpeUmktlboEh18+FRG9SXBq3i13BoPfkoZth1DvQUXbxq
 /76ilrAZ0PCTX/QC+7qUQWS5gD0kas/fTD2u8V5E87L1Hk8YABJQXUAGBV8O3IeCND
 cs6Co7+1vU4sf+4mQ4YJUyMLVkUyLmHFiWoYZFchzbFik7uZTSQfBmjBPVZcb+sE0m
 qssa/GT7C0RCg==
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
Cc: Matthew Wilcox <willy@infradead.org>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Souptick Joarder <jrdr.linux@gmail.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Matthew Auld <matthew.auld@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-05-21 11:57, Chris Wilson wrote:
> Quoting John Hubbard (2020-05-19 01:21:20)
>> This needs to go through Andrew's -mm tree, due to adding a new gup.c
>> routine. However, I would really love to have some testing from the
>> drm/i915 folks, because I haven't been able to run-time test that part
>> of it.
> 
> CI hit
> 
> <4> [185.667750] WARNING: CPU: 0 PID: 1387 at mm/gup.c:2699 internal_get_user_pages_fast+0x63a/0xac0
> <4> [185.667752] Modules linked in: vgem snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic i915 mei_hdcp x86_pkg_temp_thermal coretemp snd_hda_intel snd_intel_dspcfg crct10dif_pclmul snd_hda_codec crc32_pclmul snd_hwdep snd_hda_core ghash_clmulni_intel cdc_ether usbnet mii snd_pcm e1000e mei_me ptp pps_core mei intel_lpss_pci prime_numbers
> <4> [185.667774] CPU: 0 PID: 1387 Comm: gem_userptr_bli Tainted: G     U            5.7.0-rc5-CI-Patchwork_17704+ #1
> <4> [185.667777] Hardware name: Intel Corporation Ice Lake Client Platform/IceLake U DDR4 SODIMM PD RVP, BIOS ICLSFWR1.R00.3234.A01.1906141750 06/14/2019
> <4> [185.667782] RIP: 0010:internal_get_user_pages_fast+0x63a/0xac0
> <4> [185.667785] Code: 24 40 08 48 39 5c 24 38 49 89 df 0f 85 74 fc ff ff 48 83 44 24 50 08 48 39 5c 24 58 49 89 dc 0f 85 e0 fb ff ff e9 14 fe ff ff <0f> 0b b8 ea ff ff ff e9 36 fb ff ff 4c 89 e8 48 21 e8 48 39 e8 0f
> <4> [185.667789] RSP: 0018:ffffc90001133c38 EFLAGS: 00010206
> <4> [185.667792] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff8884999ee800
> <4> [185.667795] RDX: 00000000000c0001 RSI: 0000000000000100 RDI: 00007f419e774000
> <4> [185.667798] RBP: ffff888453dbf040 R08: 0000000000000000 R09: 0000000000000001
> <4> [185.667800] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888453dbf380
> <4> [185.667803] R13: ffff8884999ee800 R14: ffff888453dbf3e8 R15: 0000000000000040
> <4> [185.667806] FS:  00007f419e875e40(0000) GS:ffff88849fe00000(0000) knlGS:0000000000000000
> <4> [185.667808] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> <4> [185.667811] CR2: 00007f419e873000 CR3: 0000000458bd2004 CR4: 0000000000760ef0
> <4> [185.667814] PKRU: 55555554
> <4> [185.667816] Call Trace:
> <4> [185.667912]  ? i915_gem_userptr_get_pages+0x1c6/0x290 [i915]
> <4> [185.667918]  ? mark_held_locks+0x49/0x70
> <4> [185.667998]  ? i915_gem_userptr_get_pages+0x1c6/0x290 [i915]
> <4> [185.668073]  ? i915_gem_userptr_get_pages+0x1c6/0x290 [i915]
> 
> and then panicked, across a range of systems.
> -Chris
> 

Thanks for this report! I'm looking into it now.

thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
