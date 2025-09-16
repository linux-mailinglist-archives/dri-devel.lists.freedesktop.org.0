Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC95B59F5A
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 19:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0564610E3A9;
	Tue, 16 Sep 2025 17:34:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="jqm2YX50";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8181510E3A9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 17:34:52 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cR8D9282Wz9tSQ;
 Tue, 16 Sep 2025 19:34:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1758044089;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SbZA5ejotqw68mTNh34KYL6GNeLbdM9s9dCD+1x1S5c=;
 b=jqm2YX50DAmH42cCu3Dm4pk0e/4TCsANo9ubKawkQA6ebZbjVL6LAOI3ABl3lGU016EesK
 A6f0N+ycb03D1u+60nFA7/860yAygYO/taBOTAM6lz1uvCaMMXi0XJJ7Fv+YfJJi14kl7V
 2DGHrnLCxWoQOwg8Xh5aJRQKxrEdCOesoZs3itZKXcLXF6A2hUSN8ZYESUrBwEGRaOUW7g
 xIj2osBuO//P2wYFP4aQ00Dup1UwIuKaKBXuFhuAkLrIsRS5eFMeeGT3O16YIH9zX/iPOo
 +HTkVo5lKeVsFclOctD9GxJeMRTZpXib1Jp8KRyHyLtKwVHH22nBCwvVjGOo/w==
Message-ID: <c34dc4bc-de12-42fc-aaf5-50474dc53042@mailbox.org>
Date: Tue, 16 Sep 2025 19:34:42 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 4/9] drm/panthor: Implement optional reset
To: Rain Yang <jiyu.yang@oss.nxp.com>, boris.brezillon@collabora.com
Cc: airlied@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, festevam@gmail.com, imx@lists.linux.dev,
 kernel@pengutronix.de, krzk+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org, liviu.dudau@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 p.zabel@pengutronix.de, peng.fan@nxp.com, robh@kernel.org,
 s.hauer@pengutronix.de, shawnguo@kernel.org, simona@ffwll.ch,
 sre@kernel.org, steven.price@arm.com, tzimmermann@suse.de
References: <20250325153507.61d82e39@collabora.com>
 <4c06aef3-a254-437c-aa15-8e3eb7bf5951@denx.de>
 <20250325155231.0d1b1000@collabora.com>
 <838a0c6b-845b-428d-86b3-1480e5b8080f@mailbox.org>
 <20250904082224.113d0cd1@fedora>
 <7d4e773b-64ac-49ce-8d8b-7a39c353d18f@mailbox.org>
 <20250904160445.1671f140@fedora>
 <36298ed9-05e4-4871-8e99-dfe814342c29@mailbox.org>
 <20250904172019.58e5f589@fedora>
 <4147d10f-fb54-4f1b-ac1b-58cf657a3aeb@mailbox.org>
 <aMk1CISrn2_p0qzJ@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aMk1CISrn2_p0qzJ@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 55b373c7a525aab004c
X-MBO-RS-META: nmx8tqfcxgafify9h3ojna5p9h68zpi5
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

On 9/16/25 12:06 PM, Rain Yang wrote:

Hello everyone,

> you're right.
> *0x4d810008=1, this register is a write-once register, so it was moved into SM
> since imx 6.12.3 release, and latest 6.6.52 release. some document work is still
> needed in the future.
> 
> Hi Marek,
> thanks for your effort to make the i.MX95 GPU upstreamed.
> I created one PR to support i.MX95 GPU expcept the multi power domain[1],
> but it seemed to be placed in the wrong location. No one responded to it,
> so I closed it.
> 
> for the suspend/resume issue, the panthor driver works well with 6.12.34
> patched with pm_domains operation like you did.
> run vkmark->suspend 10min in the 4th console->wakeup in the 4th console.
> 
> can you show me your SM version when uboot start,

Build 470, Commit a07928b4 Sep 03 2025 23:43:49

> and the G310 firmware version which can be found by search git_sha string.

That would be 50.2 . I now tried 53.0 and I suspect something might have 
been fixed there ?

As for the reset via block controller at 0x4d810000, without it, I get 
SError, so it seems the reset is still needed.

[    2.788317] panthor 4d900000.gpu: [drm] clock rate = 800000000
[    2.795246] panthor 4d900000.gpu: EM: created perf domain
[    2.801029] Internal error: synchronous external abort: 
0000000096000010 [#1]  SMP
[    2.808597] Modules linked in:
[    2.811658] CPU: 3 UID: 0 PID: 52 Comm: kworker/u24:1 Tainted: G   M 
               6.17.0-rc6-next-20250916-00076-ga73c9babac81-dirty #496 
PREEMPT
[    2.824939] Tainted: [M]=MACHINE_CHECK
[    2.828684] Hardware name: Board (DT)
[    2.834770] Workqueue: events_unbound deferred_probe_work_func
[    2.840601] pstate: 60400009 (nZCv daif +PAN -UAO -TCO -DIT -SSBS 
BTYPE=--)
[    2.847545] pc : panthor_hw_init+0x18/0x620
[    2.851728] lr : panthor_device_init+0x388/0x5e0
[    2.856333] sp : ffff800082383aa0
[    2.859643] x29: ffff800082383aa0 x28: 0000000000000000 x27: 
0000000000000000
[    2.866782] x26: ffff000080034c28 x25: 0000000000000000 x24: 
0000000000000000
[    2.873909] x23: ffff00008036f010 x22: ffff000081082638 x21: 
ffff00008036f010
[    2.881033] x20: ffff000081082000 x19: ffff000081082000 x18: 
0000000000000801
[    2.888165] x17: 0000000000000000 x16: 0000000000000100 x15: 
0000000000000001
[    2.895298] x14: 0140000000000000 x13: ffff800083800000 x12: 
ffff800083c7ffff
[    2.902422] x11: 000000004dd80000 x10: 0000000040000000 x9 : 
ffff8000809696b8
[    2.909555] x8 : ffff8000823839a0 x7 : ffff000081082000 x6 : 
ffff800082383a50
[    2.916679] x5 : ffff8000823839d0 x4 : ffff800081beb4d0 x3 : 
ffff800081beb000
[    2.923803] x2 : 0000000000000000 x1 : ffff0000809a90c0 x0 : 
ffff800083800000
[    2.930934] Call trace:
[    2.933378]  panthor_hw_init+0x18/0x620 (P)
[    2.937555]  panthor_device_init+0x388/0x5e0
[    2.941812]  panthor_probe+0x40/0x68
[    2.945383]  platform_probe+0x60/0xa8
[    2.949040]  really_probe+0xc0/0x2b8
[    2.952611]  __driver_probe_device+0x7c/0x120
[    2.956962]  driver_probe_device+0x40/0x180
[    2.961130]  __device_attach_driver+0xb4/0x140
[    2.965567]  bus_for_each_drv+0x88/0xf8
[    2.969398]  __device_attach+0xa0/0x1a0
[    2.973220]  device_initial_probe+0x18/0x30
[    2.977397]  bus_probe_device+0x9c/0xa8
[    2.981228]  deferred_probe_work_func+0x88/0xc8
[    2.985743]  process_one_work+0x158/0x3a8
[    2.989754]  worker_thread+0x2d8/0x410
[    2.993498]  kthread+0x144/0x200
[    2.996722]  ret_from_fork+0x10/0x20
[    3.000296] Code: a9bb7bfd aa0003e7 910003fd f9430800 (b9400000)
[    3.006378] ---[ end trace 0000000000000000 ]---
