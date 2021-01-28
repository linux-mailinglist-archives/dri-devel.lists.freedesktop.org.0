Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C67CD3076F9
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 14:24:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43D1B6E8DE;
	Thu, 28 Jan 2021 13:23:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3386E1B5;
 Thu, 28 Jan 2021 13:23:54 +0000 (UTC)
IronPort-SDR: WJC9RRnHamWksyojjX2BWypvTNFcLu+SizR8IPKJmM1XdD2TKm0uJB52plqrqU49WIUwTzXrQA
 SVb+ZbxwYpCg==
X-IronPort-AV: E=McAfee;i="6000,8403,9877"; a="180308280"
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="180308280"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 05:23:53 -0800
IronPort-SDR: /9yzwAaamvEFG6hEJXamhjDvuX0FzDWmagud4qNsCJJXuz9gbkPy4QMp68I4LmTRXwZWTyI3/M
 EZforiZFnMBQ==
X-IronPort-AV: E=Sophos;i="5.79,382,1602572400"; d="scan'208";a="388813549"
Received: from tdietric-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.32.183])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2021 05:23:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-kernel@vger.kernel.org
Subject: v5.11-rc5 BUG kmalloc-1k (Not tainted): Redzone overwritten
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Date: Thu, 28 Jan 2021 15:23:48 +0200
Message-ID: <871re5jiu3.fsf@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


A number of our CI systems are hitting redzone overwritten errors after
s2idle, with the errors introduced between v5.11-rc4 and v5.11-rc5. See
snippet below, full logs for one affected machine at [1].

Known issue?

BR,
Jani.


[1] https://intel-gfx-ci.01.org/tree/drm-intel-fixes/CI_DIF_549/fi-tgl-u2/igt@gem_exec_suspend@basic-s0.html


<6> [71.947160] Restarting tasks ... done.
<3> [71.948035] =============================================================================
<3> [71.948545] BUG kmalloc-1k (Not tainted): Redzone overwritten
<3> [71.948577] -----------------------------------------------------------------------------
<4> [71.948625] Disabling lock debugging due to kernel taint
<3> [71.948626] INFO: 0x00000000de6e27d6-0x00000000eaa949e9 @offset=29696. First byte 0x0 instead of 0xcc
<3> [71.948633] INFO: Allocated in syslog_print+0x39/0x200 age=1 cpu=6 pid=427
<3> [71.948642] 	__slab_alloc.isra.86.constprop.94+0x7e/0x90
<3> [71.948647] 	kmem_cache_alloc_trace+0x337/0x420
<3> [71.948651] 	syslog_print+0x39/0x200
<3> [71.948654] 	do_syslog.part.23+0x31a/0x480
<3> [71.948658] 	kmsg_read+0x3c/0x50
<3> [71.948663] 	vfs_read+0xa8/0x1b0
<3> [71.948667] 	ksys_read+0x5a/0xd0
<3> [71.948670] 	do_syscall_64+0x33/0x80
<3> [71.948674] 	entry_SYSCALL_64_after_hwframe+0x44/0xa9
<3> [71.948679] INFO: Freed in kfree_rcu_work+0x2ef/0x320 age=658 cpu=3 pid=195
<3> [71.948685] 	kmem_cache_free_bulk+0xbeb/0xcb0
<3> [71.948689] 	kfree_rcu_work+0x2ef/0x320
<3> [71.948693] 	process_one_work+0x270/0x5c0
<3> [71.948697] 	worker_thread+0x37/0x380
<3> [71.948701] 	kthread+0x146/0x170
<3> [71.948705] 	ret_from_fork+0x1f/0x30
<3> [71.948709] INFO: Slab 0x0000000097533187 objects=10 used=9 fp=0x000000002183a6cf flags=0x8000000000010201
<3> [71.948714] INFO: Object 0x00000000b43421a9 @offset=28672 fp=0x0000000000000000
<3> [71.948720] Redzone 0000000034747f33: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948726] Redzone 000000001c57bf27: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948731] Redzone 000000006763eea0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948736] Redzone 0000000028c40de8: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948742] Redzone 00000000c8e197cc: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948747] Redzone 000000008b77f05a: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948752] Redzone 000000003e1a5f65: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948757] Redzone 00000000568b4b04: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948762] Redzone 00000000183f376e: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948767] Redzone 000000003aafec8b: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948773] Redzone 00000000ec8d8c96: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948779] Redzone 0000000054f062b1: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948784] Redzone 0000000044f67988: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948790] Redzone 00000000f7a07bd6: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948796] Redzone 000000004719a4f1: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948801] Redzone 0000000006a35936: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948807] Redzone 00000000f8aefa64: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948812] Redzone 000000008550e102: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948817] Redzone 000000009189a7a1: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948823] Redzone 000000007a3b9eea: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948828] Redzone 00000000ab035e44: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948834] Redzone 0000000001d5ee40: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948840] Redzone 000000009c676a9c: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948845] Redzone 00000000309ce2cf: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948850] Redzone 00000000f620b753: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948855] Redzone 00000000082c33d0: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948860] Redzone 00000000498e33d7: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948866] Redzone 000000003d9447fb: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948871] Redzone 00000000cc09fd51: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948876] Redzone 0000000012ee8ab4: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948882] Redzone 000000000c3cb11f: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948887] Redzone 00000000c23c0cd7: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948892] Redzone 00000000405a6bbe: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948898] Redzone 00000000cb0b2944: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948903] Redzone 0000000005cb64af: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948909] Redzone 000000002ef8bc07: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948914] Redzone 00000000f637775f: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948919] Redzone 00000000be66d756: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948925] Redzone 0000000095fb1706: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948930] Redzone 0000000025614f61: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948936] Redzone 00000000afdeea6a: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948941] Redzone 0000000056959541: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948946] Redzone 00000000355ca70e: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948951] Redzone 000000008d98fe16: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948956] Redzone 00000000e6975090: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948962] Redzone 0000000061490b2f: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948967] Redzone 0000000048854715: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948972] Redzone 00000000b7f710a5: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948978] Redzone 000000008432ad5e: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948984] Redzone 00000000b31e7b55: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948989] Redzone 0000000070dee095: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.948994] Redzone 00000000a11d967f: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949001] Redzone 00000000e60693ff: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949006] Redzone 000000009d0156db: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949011] Redzone 00000000d71fff83: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949017] Redzone 00000000b7d1b056: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949022] Redzone 0000000001a7a74e: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949028] Redzone 00000000d1d10885: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949033] Redzone 000000006c77cfec: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949038] Redzone 000000008b6aa188: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949043] Redzone 0000000035290da4: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949049] Redzone 000000002f67eeb9: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949055] Redzone 00000000697dbaea: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949060] Redzone 000000000604ac79: cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc  ................
<3> [71.949064] Object 00000000b43421a9: 3c 37 3e 5b 20 20 20 37 31 2e 31 39 34 30 39 34  <7>[   71.194094
<3> [71.949070] Object 0000000076a337ed: 5d 20 69 39 31 35 20 30 30 30 30 3a 30 30 3a 30  ] i915 0000:00:0
<3> [71.949074] Object 00000000b904f286: 32 2e 30 3a 20 5b 64 72 6d 3a 69 6e 74 65 6c 5f  2.0: [drm:intel_
<3> [71.949078] Object 0000000003506053: 6d 6f 64 65 73 65 74 5f 73 65 74 75 70 5f 68 77  modeset_setup_hw
<3> [71.949082] Object 00000000fe226394: 5f 73 74 61 74 65 20 5b 69 39 31 35 5d 5d 20 5b  _state [i915]] [
<3> [71.949086] Object 0000000062d81a38: 50 4c 41 4e 45 3a 34 39 3a 70 6c 61 6e 65 20 33  PLANE:49:plane 3
<3> [71.949090] Object 0000000021b4eadc: 41 5d 20 68 77 20 73 74 61 74 65 20 72 65 61 64  A] hw state read
<3> [71.949095] Object 000000003e076754: 6f 75 74 3a 20 64 69 73 61 62 6c 65 64 2c 20 70  out: disabled, p
<3> [71.949099] Object 000000009a47e07e: 69 70 65 20 41 0a 00 67 65 20 6c 65 76 65 6c 20  ipe A..ge level 
<3> [71.949104] Object 00000000dca76905: 30 0a 00 30 30 30 30 31 2c 20 50 50 5f 4f 46 46  0..00001, PP_OFF
<3> [71.949109] Object 00000000798e1fed: 20 30 78 31 66 34 30 30 30 31 2c 20 50 50 5f 44   0x1f40001, PP_D
<3> [71.949114] Object 000000001f9636fb: 49 56 20 30 78 36 30 0a 00 30 34 35 30 36 32 5d  IV 0x60..045062]
<3> [71.949119] Object 0000000020ccf31f: 20 20 20 20 65 64 70 5f 70 61 6e 65 6c 5f 76 64      edp_panel_vd
<3> [71.949124] Object 00000000e3259c3e: 64 5f 6f 6e 2b 30 78 64 35 2f 30 78 32 32 30 20  d_on+0xd5/0x220 
<3> [71.949129] Object 000000009cff5aa5: 5b 69 39 31 35 5d 0a 3c 37 3e 5b 20 20 20 35 36  [i915].<7>[   56
<3> [71.949134] Object 0000000050aadeb4: 2e 30 34 35 30 36 32 5d 20 20 20 20 69 6e 74 65  .045062]    inte
<3> [71.949140] Object 00000000dbbff70e: 6c 5f 64 70 5f 61 75 78 5f 78 66 65 72 2b 30 78  l_dp_aux_xfer+0x
<3> [71.949145] Object 000000007d9c4ceb: 66 32 2f 30 78 39 39 30 20 5b 69 39 31 35 5d 0a  f2/0x990 [i915].
<3> [71.949150] Object 0000000089d597be: 3c 37 3e 5b 20 20 20 35 36 2e 30 34 35 30 36 32  <7>[   56.045062
<3> [71.949156] Object 000000005fc0d532: 5d 20 20 20 20 69 6e 74 65 6c 5f 64 70 5f 61 75  ]    intel_dp_au
<3> [71.949161] Object 00000000d89adaef: 78 5f 74 72 61 6e 73 66 65 72 2b 30 78 63 35 2f  x_transfer+0xc5/
<3> [71.949166] Object 00000000d57bf831: 30 78 32 62 30 20 5b 69 39 31 35 5d 0a 3c 37 3e  0x2b0 [i915].<7>
<3> [71.949171] Object 000000002b96b18c: 5b 20 20 20 35 36 2e 30 34 35 30 36 32 5d 20 20  [   56.045062]  
<3> [71.949176] Object 00000000cc13ca36: 20 20 64 72 6d 5f 64 70 5f 64 70 63 64 5f 61 63    drm_dp_dpcd_ac
<3> [71.949180] Object 000000007bcfe1cd: 63 65 73 73 2b 30 78 37 36 2f 30 78 31 31 30 0a  cess+0x76/0x110.
<3> [71.949186] Object 00000000169f55ae: 3c 37 3e 5b 20 20 20 35 36 2e 30 34 35 30 36 32  <7>[   56.045062
<3> [71.949189] Object 000000003a7dcbbf: 5d 20 20 20 20 64 72 6d 5f 64 70 5f 64 70 63 64  ]    drm_dp_dpcd
<3> [71.949193] Object 00000000bbb69343: 5f 72 65 61 64 2b 30 78 62 31 2f 30 78 66 30 0a  _read+0xb1/0xf0.
<3> [71.949196] Object 000000001805f88f: 3c 37 3e 5b 20 20 20 35 36 2e 30 34 35 30 36 32  <7>[   56.045062
<3> [71.949199] Object 00000000550e6f19: 5d 20 20 20 20 69 39 31 35 5f 70 73 72 5f 73 69  ]    i915_psr_si
<3> [71.949202] Object 0000000049b0ed43: 6e 6b 5f 73 74 61 74 75 73 5f 73 68 6f 77 2b 30  nk_status_show+0
<3> [71.949206] Object 00000000d5d71bdf: 78 38 36 2f 30 78 31 31 30 20 5b 69 39 31 35 5d  x86/0x110 [i915]
<3> [71.949209] Object 000000006f615c99: 0a 20 20 20 70 63 69 5f 64 65 76 69 63 65 5f 70  .   pci_device_p
<3> [71.949213] Object 0000000039df9783: 72 6f 62 65 2b 30 78 39 65 2f 30 78 31 31 30 0a  robe+0x9e/0x110.
<3> [71.949216] Object 000000004945c274: 0a 5b 69 39 31 35 5d 0a 6b 6b 6b 6b 6b 6b 6b 6b  .[i915].kkkkkkkk
<3> [71.949219] Object 00000000ad856344: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949222] Object 00000000d63c4370: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949225] Object 0000000061521159: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949229] Object 0000000000719c9c: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949232] Object 000000006e01f6a3: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949237] Object 00000000dd723dd7: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949242] Object 0000000084b814fe: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949246] Object 00000000da848a49: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949249] Object 00000000b635c9d6: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949252] Object 000000002aa24fce: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949255] Object 0000000027057d8a: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949259] Object 0000000074ed199b: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949262] Object 000000000ee8ecde: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949265] Object 00000000e71ca5e0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949269] Object 00000000646dc0d8: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949272] Object 000000002bb9ee7f: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949275] Object 0000000036436b5f: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949279] Object 00000000d68c6ad6: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949283] Object 00000000a23a7f73: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949286] Object 00000000b6b8090e: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949289] Object 000000009d19ef4c: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949293] Object 000000008e828f78: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949296] Object 000000008741608b: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949299] Object 000000005f8aa86c: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949302] Object 00000000d35b3d05: 6b 6b 6b 6b 6b 6b 00 6b 6b 6b 6b 6b 6b 6b 00 6b  kkkkkk.kkkkkkk.k
<3> [71.949306] Object 000000009119c370: 6b 00 6b 6b 6b 00 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  k.kkk.kkkkkkkkkk
<3> [71.949309] Object 00000000c12a97d0: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 00 6b 6b  kkkkkkkkkkkkk.kk
<3> [71.949312] Object 0000000018139d84: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b  kkkkkkkkkkkkkkkk
<3> [71.949315] Object 00000000ae52880d: 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5  kkkkkkkkkkkkkkk.
<3> [71.949319] Redzone 00000000de6e27d6: 00 cc cc cc cc 00 cc cc                          ........
<3> [71.949322] Padding 00000000be515b2e: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949325] Padding 00000000522f2b68: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949328] Padding 0000000058095864: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949332] Padding 00000000b22f50cd: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949335] Padding 0000000023ad6f31: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949338] Padding 0000000025037d9c: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949341] Padding 000000006cb6fadf: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949345] Padding 00000000d3241db4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949349] Padding 00000000b89cc259: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949352] Padding 0000000077f625c7: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949355] Padding 00000000282da081: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949358] Padding 000000002ed67ea5: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949362] Padding 00000000fed5aa7f: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949365] Padding 000000008f0c9030: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949369] Padding 00000000dceaa693: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949372] Padding 000000004263f632: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949375] Padding 00000000588c1f07: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949378] Padding 0000000072202764: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949382] Padding 000000001fe2275d: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949385] Padding 00000000a2c18ef6: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949388] Padding 00000000f3e21327: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949392] Padding 000000002ff834bf: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949395] Padding 000000001ce1906f: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949398] Padding 0000000031df4f7d: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949401] Padding 00000000e66c500a: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949405] Padding 00000000893d41e9: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949408] Padding 00000000143e4ae4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949411] Padding 00000000f0df9dc9: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949415] Padding 00000000aa244b0b: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949418] Padding 00000000346d0950: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949421] Padding 00000000d307dcef: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949425] Padding 000000004dbc1a51: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949428] Padding 0000000090f10400: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949431] Padding 00000000dd19313e: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949434] Padding 00000000735b7de4: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949438] Padding 000000006bf296ae: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949441] Padding 00000000f09e7ed5: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949444] Padding 00000000707c3646: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949448] Padding 00000000baa65428: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949451] Padding 00000000b96e127a: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949454] Padding 000000009f0d3f66: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949457] Padding 000000005e8e4d78: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949461] Padding 0000000044d8e23c: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<3> [71.949464] Padding 000000007166274c: 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  ZZZZZZZZZZZZZZZZ
<4> [71.949467] CPU: 6 PID: 427 Comm: in:imklog Tainted: G    B             5.11.0-rc5-g6ee1d745b7c9f-CI_DIF_549+ #1
<4> [71.949469] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake U DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.3373.A00.2009091720 09/09/2020
<4> [71.949470] Call Trace:
<4> [71.949471]  dump_stack+0x77/0x97
<4> [71.949474]  check_bytes_and_report.cold.107+0x55/0x8c
<4> [71.949478]  check_object+0x19c/0x280
<4> [71.949480]  free_debug_processing+0x157/0x320
<4> [71.949482]  ? syslog_print+0x1c0/0x200
<4> [71.949484]  __slab_free+0x1ef/0x540
<4> [71.949486]  ? debug_check_no_obj_freed+0x111/0x1e0
<4> [71.949489]  ? kfree+0x231/0x720
<4> [71.949491]  ? syslog_print+0x1c0/0x200
<4> [71.949492]  syslog_print+0x1c0/0x200
<4> [71.949494]  do_syslog.part.23+0x31a/0x480
<4> [71.949496]  ? __mutex_lock+0xa6/0x980
<4> [71.949497]  ? __mutex_lock+0x29a/0x980
<4> [71.949498]  ? find_held_lock+0x2d/0x90
<4> [71.949500]  ? __fdget_pos+0x45/0x50
<4> [71.949502]  kmsg_read+0x3c/0x50
<4> [71.949504]  vfs_read+0xa8/0x1b0
<4> [71.949505]  ksys_read+0x5a/0xd0
<4> [71.949507]  do_syscall_64+0x33/0x80
<4> [71.949508]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
<4> [71.949510] RIP: 0033:0x7faf0694b384
<4> [71.949512] Code: 84 00 00 00 00 00 41 54 55 49 89 d4 53 48 89 f5 89 fb 48 83 ec 10 e8 8b fc ff ff 4c 89 e2 41 89 c0 48 89 ee 89 df 31 c0 0f 05 <48> 3d 00 f0 ff ff 77 38 44 89 c7 48 89 44 24 08 e8 c7 fc ff ff 48
<4> [71.949513] RSP: 002b:00007faf03a784c0 EFLAGS: 00000246 ORIG_RAX: 0000000000000000
<4> [71.949515] RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007faf0694b384
<4> [71.949516] RDX: 0000000000001fa0 RSI: 00007faf03a78d00 RDI: 0000000000000005
<4> [71.949517] RBP: 00007faf03a78d00 R08: 0000000000000000 R09: 0000561e117f8fe8
<4> [71.949518] R10: 2ce33e6c02ce33e7 R11: 0000000000000246 R12: 0000000000001fa0
<4> [71.949519] R13: 0000000000001fa0 R14: 0000000000001f9f R15: 00007faf03a7ab18
<3> [71.949521] FIX kmalloc-1k: Restoring 0x00000000de6e27d6-0x00000000eaa949e9=0xcc
<3> [71.949529] FIX kmalloc-1k: Object at 0x00000000b43421a9 not freed


-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
