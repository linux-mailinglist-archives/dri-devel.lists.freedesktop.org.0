Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8231C1DD669
	for <lists+dri-devel@lfdr.de>; Thu, 21 May 2020 20:58:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E602898BF;
	Thu, 21 May 2020 18:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E6A89930;
 Thu, 21 May 2020 18:57:55 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21252267-1500050 for multiple; Thu, 21 May 2020 19:57:36 +0100
MIME-Version: 1.0
In-Reply-To: <20200519002124.2025955-1-jhubbard@nvidia.com>
References: <20200519002124.2025955-1-jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>,
 John Hubbard <jhubbard@nvidia.com>
From: Chris Wilson <chris@chris-wilson.co.uk>
Subject: Re: [PATCH 0/4] mm/gup, drm/i915: refactor gup_fast,
 convert to pin_user_pages()
Message-ID: <159008745422.32320.5724805750977048669@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Thu, 21 May 2020 19:57:34 +0100
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
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Souptick Joarder <jrdr.linux@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting John Hubbard (2020-05-19 01:21:20)
> This needs to go through Andrew's -mm tree, due to adding a new gup.c
> routine. However, I would really love to have some testing from the
> drm/i915 folks, because I haven't been able to run-time test that part
> of it.

CI hit

<4> [185.667750] WARNING: CPU: 0 PID: 1387 at mm/gup.c:2699 internal_get_user_pages_fast+0x63a/0xac0
<4> [185.667752] Modules linked in: vgem snd_hda_codec_hdmi snd_hda_codec_realtek snd_hda_codec_generic i915 mei_hdcp x86_pkg_temp_thermal coretemp snd_hda_intel snd_intel_dspcfg crct10dif_pclmul snd_hda_codec crc32_pclmul snd_hwdep snd_hda_core ghash_clmulni_intel cdc_ether usbnet mii snd_pcm e1000e mei_me ptp pps_core mei intel_lpss_pci prime_numbers
<4> [185.667774] CPU: 0 PID: 1387 Comm: gem_userptr_bli Tainted: G     U            5.7.0-rc5-CI-Patchwork_17704+ #1
<4> [185.667777] Hardware name: Intel Corporation Ice Lake Client Platform/IceLake U DDR4 SODIMM PD RVP, BIOS ICLSFWR1.R00.3234.A01.1906141750 06/14/2019
<4> [185.667782] RIP: 0010:internal_get_user_pages_fast+0x63a/0xac0
<4> [185.667785] Code: 24 40 08 48 39 5c 24 38 49 89 df 0f 85 74 fc ff ff 48 83 44 24 50 08 48 39 5c 24 58 49 89 dc 0f 85 e0 fb ff ff e9 14 fe ff ff <0f> 0b b8 ea ff ff ff e9 36 fb ff ff 4c 89 e8 48 21 e8 48 39 e8 0f
<4> [185.667789] RSP: 0018:ffffc90001133c38 EFLAGS: 00010206
<4> [185.667792] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff8884999ee800
<4> [185.667795] RDX: 00000000000c0001 RSI: 0000000000000100 RDI: 00007f419e774000
<4> [185.667798] RBP: ffff888453dbf040 R08: 0000000000000000 R09: 0000000000000001
<4> [185.667800] R10: 0000000000000000 R11: 0000000000000000 R12: ffff888453dbf380
<4> [185.667803] R13: ffff8884999ee800 R14: ffff888453dbf3e8 R15: 0000000000000040
<4> [185.667806] FS:  00007f419e875e40(0000) GS:ffff88849fe00000(0000) knlGS:0000000000000000
<4> [185.667808] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [185.667811] CR2: 00007f419e873000 CR3: 0000000458bd2004 CR4: 0000000000760ef0
<4> [185.667814] PKRU: 55555554
<4> [185.667816] Call Trace:
<4> [185.667912]  ? i915_gem_userptr_get_pages+0x1c6/0x290 [i915]
<4> [185.667918]  ? mark_held_locks+0x49/0x70
<4> [185.667998]  ? i915_gem_userptr_get_pages+0x1c6/0x290 [i915]
<4> [185.668073]  ? i915_gem_userptr_get_pages+0x1c6/0x290 [i915]

and then panicked, across a range of systems.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
