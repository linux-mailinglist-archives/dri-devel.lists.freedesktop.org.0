Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7529D1AE7EC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Apr 2020 23:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB3E6EC16;
	Fri, 17 Apr 2020 21:58:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95C116EC16
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Apr 2020 21:58:15 +0000 (UTC)
Received: from localhost.localdomain (c-73-231-172-41.hsd1.ca.comcast.net
 [73.231.172.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F07F320B1F;
 Fri, 17 Apr 2020 21:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587160695;
 bh=INZKVW0ek2rLl2zdbkPufKVWe37AqusyD3oNcrlWZFw=;
 h=Date:From:To:Subject:In-Reply-To:References:From;
 b=RU3FzWsi7mfUI9aABDjdnqgJkhEKZNxJv4fauNQjxjkmszZ4BqbYs49tN5Zu/pr8H
 J8RoSMk7OfcFfBJZd0sV0we5hEUU08I4vQJeCMHD+t+NIfg3dHRNxUs9fguU/yRogs
 GSS5joi7mIG3jfpAXxV1rSnhJdZu53kKH6hkL92k=
Date: Fri, 17 Apr 2020 14:58:13 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: erhard_f@mailbox.org, bugzilla-daemon@bugzilla.kernel.org,
 linux-mm@kvack.org, Christian Koenig <christian.koenig@amd.com>, Huang Rui
 <ray.huang@amd.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [Bug 206697] #PF: supervisor read access in kernel mode, #PF:
 error_code(0x0000) - not-present page while building a large project
Message-Id: <20200417145813.f6b5eb02d0d9efb04df6d699@linux-foundation.org>
In-Reply-To: <20200302150329.773bfeb8a1e4bc02b0f06e49@linux-foundation.org>
References: <bug-206697-27@https.bugzilla.kernel.org/>
 <bug-206697-27-AARxZEfI7A@https.bugzilla.kernel.org/>
 <20200302150329.773bfeb8a1e4bc02b0f06e49@linux-foundation.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2 Mar 2020 15:03:29 -0800 Andrew Morton <akpm@linux-foundation.org> wrote:

> 
> (switched to email.  Please respond via emailed reply-to-all, not via the
> bugzilla web interface).
> 
> On Mon, 02 Mar 2020 21:55:10 +0000 bugzilla-daemon@bugzilla.kernel.org wrote:
> 
> > https://bugzilla.kernel.org/show_bug.cgi?id=206697
> > 
> > --- Comment #2 from Erhard F. (erhard_f@mailbox.org) ---
> > Created attachment 287765
> >   --> https://bugzilla.kernel.org/attachment.cgi?id=287765&action=edit
> > dmesg (kernel 5.6-rc4, Shuttle XPC FS51, Pentium 4)
> > 
> > Same on kernel 5.6-rc4:
> 
> Thanks.  This looks like a regression in the DRM code.  I've added
> suitable Ccs.

Erhard, please let's handle this issue via email, not via the bugzilla
interface.

This does appear to be a DRM issue, and it has been reproduced in
5.7-rc1.

Latest update below:

From: bugzilla-daemon@bugzilla.kernel.org
To: akpm@linux-foundation.org
Subject: [Bug 206697] #PF: supervisor read access in kernel mode, #PF: error_code(0x0000) - not-present page while building a large project
Date: Fri, 17 Apr 2020 07:45:23 +0000

https://bugzilla.kernel.org/show_bug.cgi?id=206697

--- Comment #5 from Erhard F. (erhard_f@mailbox.org) ---
Looks mostly the same on kernel 5.7-rc1. The line after kthread+0xd1/0xd3 is
different. It was "? try_to_free_pages+0x3d4/0x3d4" on 5.5.6 and 5.6-rc4, but
is "? shrink_node+0x6f2/0x6f2" on 5.7-rc1 now.

[...]
Apr 17 00:28:40 BUG: kernel NULL pointer dereference, address: 00000000
Apr 17 00:28:40 #PF: supervisor read access in kernel mode
Apr 17 00:28:40 #PF: error_code(0x0000) - not-present page
Apr 17 00:28:40 *pde = 00000000 
Apr 17 00:28:40 Oops: 0000 [#1] SMP
Apr 17 00:28:40 CPU: 0 PID: 53 Comm: kswapd0 Not tainted 5.7.0-rc1-Pentium4 #1
Apr 17 00:28:40 Hardware name:  /FS51, BIOS 6.00 PG 12/02/2003
Apr 17 00:28:40 EIP: __cpa_process_fault+0x205/0x226
Apr 17 00:28:40 Code: 2d 00 00 00 40 39 d0 76 1f 81 fa ff ff ff bf 76 17 c7 47
10 01 00 00 00 81 c3 00 00 00 40 c1 eb 0c 89 5f 18 31 f6 eb 19 8b 07 <ff> 30 53
68 d5 c7 cb d8 e8 cb 68 00 00 0f 0b>
Apr 17 00:28:40 EAX: 00000000 EBX: 00000000 ECX: 00000001 EDX: 00000000
Apr 17 00:28:40 ESI: 00000001 EDI: f5e5bd4c EBP: f5e5bcc4 ESP: f5e5bca0
Apr 17 00:28:40 DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010213
Apr 17 00:28:40 CR0: 80050033 CR2: 00000000 CR3: 05ab3000 CR4: 000006d0
Apr 17 00:28:40 Call Trace:
Apr 17 00:28:40  ? _raw_spin_lock+0x22/0x2a
Apr 17 00:28:40  ? lookup_address+0x1d/0x20
Apr 17 00:28:40  __change_page_attr_set_clr+0x85/0x551
Apr 17 00:28:40  ? __mutex_unlock_slowpath+0x20/0x1b6
Apr 17 00:28:40  ? mutex_unlock+0xb/0xd
Apr 17 00:28:40  ? _vm_unmap_aliases.part.0+0x11f/0x127
Apr 17 00:28:40  change_page_attr_set_clr+0xdc/0x1af
Apr 17 00:28:40  set_pages_array_wb+0x20/0x7b
Apr 17 00:28:40  ttm_pages_put+0x22/0x71 [ttm]
Apr 17 00:28:40  ttm_page_pool_free+0xa1/0x111 [ttm]
Apr 17 00:28:40  ttm_pool_shrink_scan+0x9c/0xd1 [ttm]
Apr 17 00:28:40  shrink_slab.constprop.0+0x248/0x38f
Apr 17 00:28:40  shrink_node+0x533/0x6f2
Apr 17 00:28:40  kswapd+0x4b6/0x628
Apr 17 00:28:40  ? kswapd+0x4b6/0x628
Apr 17 00:28:40  kthread+0xd1/0xd3
Apr 17 00:28:40  ? shrink_node+0x6f2/0x6f2
Apr 17 00:28:40  ? kthread_delayed_work_timer_fn+0x6a/0x6a
Apr 17 00:28:40  ret_from_fork+0x2e/0x38
Apr 17 00:28:40 Modules linked in: fuse auth_rpcgss nfsv4 dns_resolver nfs
lockd grace sunrpc rt2500pci eeprom_93cx6 rt2x00pci rt2x00mmio rt2x00lib
led_class mac80211 radeon hwmon i2c_algo_bit d>
Apr 17 00:28:40 CR2: 0000000000000000
Apr 17 00:28:40 ---[ end trace 49fbdfbb6e459a06 ]---
Apr 17 00:28:40 EIP: __cpa_process_fault+0x205/0x226
Apr 17 00:28:40 Code: 2d 00 00 00 40 39 d0 76 1f 81 fa ff ff ff bf 76 17 c7 47
10 01 00 00 00 81 c3 00 00 00 40 c1 eb 0c 89 5f 18 31 f6 eb 19 8b 07 <ff> 30 53
68 d5 c7 cb d8 e8 cb 68 00 00 0f 0b>
Apr 17 00:28:40 EAX: 00000000 EBX: 00000000 ECX: 00000001 EDX: 00000000
Apr 17 00:28:40 ESI: 00000001 EDI: f5e5bd4c EBP: f5e5bcc4 ESP: f5e5bca0
Apr 17 00:28:40 DS: 007b ES: 007b FS: 00d8 GS: 00e0 SS: 0068 EFLAGS: 00010213
Apr 17 00:28:40 CR0: 80050033 CR2: 00000000 CR3: 05ab3000 CR4: 000006d0

-- 
You are receiving this mail because:
You are the assignee for the bug.

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
