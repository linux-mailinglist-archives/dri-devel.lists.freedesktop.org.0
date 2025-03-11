Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C5A5B95D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 07:45:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D11910E124;
	Tue, 11 Mar 2025 06:45:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fd4BgX2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6DE10E124
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 06:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741675530; x=1773211530;
 h=from:to:cc:subject:message-id:date:mime-version:
 content-transfer-encoding;
 bh=wUx86Xs4QmwfkauzxHUVzTI+dcKFK5TmOSvB8z7y32c=;
 b=Fd4BgX2M5vIifdrsmUnM+1piS63ZaGxyDk9VU7hZpTw4f5XJ+9Ojx+dy
 3lSrRbQwYkj4mo5w5A8Az9GPTG6gl5Ow/ze9/Q4ccwVjhbSDBFuegPBAq
 mIA6/0v6tlilC4oLQI5JNHUrs+kb53eUs/sFIr+z1tsfSZCw55FElvYFk
 yD2SDQhZrNMypv9QtjMLraPIpm7urAnydTXKFPz9lQ3rjlJgh6wy+hPT8
 6gUtl6sDaLnWfdqwiDUmqejYxL7LZ9mVj26BeaqnXc012dbEAHOU8YktN
 x0hYJIDJ7eDv0cYCCJHFsNFg0K6OhjZXeaIved0qMJVocz9rc9mEMLzfL g==;
X-CSE-ConnectionGUID: crjaYAkvRay8H/i82VHueg==
X-CSE-MsgGUID: hu/bxM+uS+urRRDz22MZzw==
X-IronPort-AV: E=McAfee;i="6700,10204,11369"; a="42883439"
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="42883439"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:45:30 -0700
X-CSE-ConnectionGUID: zDAqQkwdRFaMnP+zKR7U9g==
X-CSE-MsgGUID: HQwrlAh4QxmEEYn7FigIcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,238,1736841600"; d="scan'208";a="125424464"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136])
 ([10.238.232.136])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 23:45:29 -0700
From: Bingbu Cao <bingbu.cao@linux.intel.com>
To: link@vivo.com, vivek.kasireddy@intel.com
Cc: linux-kernel@vger.kernel.org, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Subject: udmabuf vmap failed (Revert "udmabuf: fix vmap_udmabuf error page
 set" can help)
Message-ID: <9172a601-c360-0d5b-ba1b-33deba430455@linux.intel.com>
Date: Tue, 11 Mar 2025 14:40:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Huan Yang and Vivek,

I am trying to use udmabuf for my test, and I cannot vmap the udmabuf
buffers now. vmap_pfn_apply() will report a warning to complain that
the pfns are invalid.
I dump the pfn numbers as below:
[ 3365.399641] pg[0] pfn 1148695
[ 3365.399642] pg[1] pfn 1145057
[ 3365.399642] pg[2] pfn 1134070
[ 3365.399643] pg[3] pfn 1148700
[ 3365.399643] pg[4] pfn 1144871
[ 3365.399643] pg[5] pfn 1408686
[ 3365.399643] pg[6] pfn 1408683
...
[ 3365.399660] WARNING: CPU: 3 PID: 2772 at mm/vmalloc.c:3489 vmap_pfn_apply+0xb7/0xd0
[ 3365.399667] Modules linked in:...
[ 3365.399750] CPU: 3 UID: 0 PID: 2772 Comm: drm-test Not tainted 6.13.0-rc2-rvp #845
[ 3365.399752] Hardware name: Intel Corporation Client Platform/xxxx, BIOS xxxFWI1.R00.3221.D83.2408120121 08/12/2024
[ 3365.399753] RIP: 0010:vmap_pfn_apply+0xb7/0xd0
[ 3365.399755] Code: 5b 41 5c 41 5d 5d c3 cc cc cc cc 48 21 c3 eb d1 48 21 c3 48 23 3d 31 c0 26 02 eb c5 48 c7 c7 c4 3c 20 a8 e8 5b c0 d8 ff eb 8a <0f> 0b b8 ea ff ff ff 5b 41 5c 41 5d 5d c3 cc cc cc cc 0f 1f 80 00
[ 3365.399756] RSP: 0018:ffffb9b50c32fad0 EFLAGS: 00010202
[ 3365.399757] RAX: 0000000000000001 RBX: 0000000000118717 RCX: 0000000000000000
[ 3365.399758] RDX: 0000000080000000 RSI: ffffb9b50c358000 RDI: 00000000ffffffff
[ 3365.399758] RBP: ffffb9b50c32fae8 R08: ffffb9b50c32fbd0 R09: 0000000000000001
[ 3365.399759] R10: ffff941602479288 R11: 0000000000000000 R12: ffffb9b50c32fbd0
[ 3365.399759] R13: ffff941618665ac0 R14: ffffb9b50c358000 R15: ffff941618665ac8
[ 3365.399760] FS:  00007ff9e9ddd740(0000) GS:ffff94196f780000(0000) knlGS:0000000000000000
[ 3365.399760] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 3365.399761] CR2: 000055fda5dc69d9 CR3: 00000001544de003 CR4: 0000000000f72ef0
[ 3365.399762] DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
[ 3365.399762] DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
[ 3365.399763] PKRU: 55555554
[ 3365.399763] Call Trace:
[ 3365.399765]  <TASK>
[ 3365.399769]  ? show_regs+0x6d/0x80
[ 3365.399773]  ? __warn+0x97/0x160
[ 3365.399777]  ? vmap_pfn_apply+0xb7/0xd0
[ 3365.399777]  ? report_bug+0x1ec/0x240
[ 3365.399782]  ? handle_bug+0x63/0xa0
[ 3365.399784]  ? exc_invalid_op+0x1d/0x80
[ 3365.399785]  ? asm_exc_invalid_op+0x1f/0x30
[ 3365.399790]  ? vmap_pfn_apply+0xb7/0xd0
[ 3365.399791]  __apply_to_page_range+0x522/0x8a0
[ 3365.399794]  ? __pfx_vmap_pfn_apply+0x10/0x10
[ 3365.399795]  apply_to_page_range+0x18/0x20
[ 3365.399796]  vmap_pfn+0x77/0xd0
[ 3365.399797]  vmap_udmabuf+0xc5/0x110
[ 3365.399802]  dma_buf_vmap+0x96/0x130

I did an experiment to revert 18d7de823b7150344d242c3677e65d68c5271b04,
then I can vmap the pages. Could you help what's wrong with that? 


-- 
Best regards,
Bingbu Cao
