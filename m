Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF1873E355
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 17:30:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC70410E22D;
	Mon, 26 Jun 2023 15:30:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA3D10E22E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 15:30:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D474760ED3;
 Mon, 26 Jun 2023 15:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0083DC433C8;
 Mon, 26 Jun 2023 15:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687793418;
 bh=53scOIRiyUvo1bQ31bLWEAzYQBHJ1VAec+PK9RRAeNI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=acJeh38HK0X0EB2DCiG+ZL1pCaXWHFkUIlg7iMPP9YfXZ8LACO/k+FgE21pWrZw3u
 t6GnzFRUrPtvSI6B6DNHis8FhOzJOSMn64DamAJSfqc+xl4sGICxgLOyCihdLGpZ2p
 u2EoravVWawbrmd5KUHik4mQpq+GxF5tho8ebiDn5hcYDrybCUkOyRUH7NR0Cqjd/F
 zpytNn2pUJfmWBBebr6ONKc26tmWyrjmuJG8Hf5no0ZEnvNwaSnQmE3uQNGWNGoAOI
 eQOMYiGji49xM+3J/I0yX9jntxmNzYSz1ztiPpsO+GiM8TALb/TP8hTv7TSx28sg1z
 etZNMdmf+hTQw==
Date: Mon, 26 Jun 2023 16:30:12 +0100
From: Lee Jones <lee@kernel.org>
To: Mans Rullgard <mans@mansr.com>
Subject: Re: [PATCH] backlight: led_bl: take led_access lock when required
Message-ID: <20230626153012.GB10378@google.com>
References: <20230619160249.10414-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230619160249.10414-1-mans@mansr.com>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 19 Jun 2023, Mans Rullgard wrote:

> The led_access lock must be held when calling led_sysfs_enable() and
> led_sysfs_disable().  This fixes warnings such as this:
> 
> [    2.432495] ------------[ cut here ]------------
> [    2.437316] WARNING: CPU: 0 PID: 22 at drivers/leds/led-core.c:349 led_sysfs_disable+0x54/0x58
> [    2.446105] Modules linked in:
> [    2.449218] CPU: 0 PID: 22 Comm: kworker/u2:1 Not tainted 6.3.8+ #1
> [    2.456268] Hardware name: Generic AM3517 (Flattened Device Tree)
> [    2.462402] Workqueue: events_unbound deferred_probe_work_func
> [    2.468353]  unwind_backtrace from show_stack+0x10/0x14
> [    2.473632]  show_stack from dump_stack_lvl+0x24/0x2c
> [    2.478759]  dump_stack_lvl from __warn+0x9c/0xc4
> [    2.483551]  __warn from warn_slowpath_fmt+0x64/0xc0
> [    2.488586]  warn_slowpath_fmt from led_sysfs_disable+0x54/0x58
> [    2.494567]  led_sysfs_disable from led_bl_probe+0x20c/0x3b0
> [    2.500305]  led_bl_probe from platform_probe+0x5c/0xb8
> [    2.505615]  platform_probe from really_probe+0xc8/0x2a0
> [    2.510986]  really_probe from __driver_probe_device+0x88/0x19c
> [    2.516967]  __driver_probe_device from driver_probe_device+0x30/0xcc
> [    2.523498]  driver_probe_device from __device_attach_driver+0x94/0xc4
> [    2.530090]  __device_attach_driver from bus_for_each_drv+0x80/0xcc
> [    2.536437]  bus_for_each_drv from __device_attach+0xf8/0x19c
> [    2.542236]  __device_attach from bus_probe_device+0x8c/0x90
> [    2.547973]  bus_probe_device from deferred_probe_work_func+0x80/0xb0
> [    2.554504]  deferred_probe_work_func from process_one_work+0x228/0x4c0
> [    2.561187]  process_one_work from worker_thread+0x1fc/0x4d0
> [    2.566925]  worker_thread from kthread+0xb4/0xd0
> [    2.571685]  kthread from ret_from_fork+0x14/0x2c
> [    2.576446] Exception stack(0xd0079fb0 to 0xd0079ff8)
> [    2.581573] 9fa0:                                     00000000 00000000 00000000 00000000
> [    2.589813] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
> [    2.598052] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
> [    2.604888] ---[ end trace 0000000000000000 ]---
> 
> 
> Signed-off-by: Mans Rullgard <mans@mansr.com>
> ---
>  drivers/video/backlight/led_bl.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

Applied, thanks

-- 
Lee Jones [李琼斯]
