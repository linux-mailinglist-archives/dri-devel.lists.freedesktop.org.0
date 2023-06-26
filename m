Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC5973E220
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jun 2023 16:28:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64CA110E20D;
	Mon, 26 Jun 2023 14:27:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC8310E20D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 14:27:56 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31272fcedf6so2992459f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jun 2023 07:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687789674; x=1690381674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4DnGyVoee8gvGuSTj8BLFAgu78VLTgNZVx6wVHkdXbQ=;
 b=LwYwK+/i0bFdFZGaDi24JeRIDv6mzwkLHYe3k8g7oGo1ClMh7V5+CaEThR6xOldga5
 ijp1ruDfBiLS3Bgv8iuIaBaYgHibEqdOak3qSOeKgFwUcbNZDQme5SFUgNDOBNCVT2Qn
 7lITrSHmspgfWdg0h5WjjB4ddRtC/Jr3UjNWCAXnkwHLkmFafq7kdIrqktjwTW5G7hwv
 rO3xHl/32vdk1QtigyH9L7RT+fG62cvqxejAvJ7ms5UWdC7PIE8KkeabfyHd9usols1P
 V3kjVEVZsffqt+r8CNLrFCXODgIcci9L+EPJrRWIkdrHcMZYIqyxOWtJjFlS89HjYBDH
 KIew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687789674; x=1690381674;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4DnGyVoee8gvGuSTj8BLFAgu78VLTgNZVx6wVHkdXbQ=;
 b=Vm77cWV5Pr78pRZBWjxDJRLfWECcX9ffrG6sTI9nvLQBwERcFgPut+8+6hLir6b277
 e+rFApM8ViqMf2gQCF9L3awhsiLjOw/W/OWjbVR+Fg9Kx+xxObNR7dQ4zKphll1J69jt
 A914lld+JlAF5+mwEyFxqm10u5QtL2vGDHcUhKdEec2Lh0bsDAJyevMKbM8zzPVml+pc
 NSCkuM58JnmwBKNygzs5XwCac4cg+DWPzqqqO3zRsQHOrG1PhHjCIpolVe50Fwd6EMRB
 4VVwsbY0GFR6O/qXj7a52jukhMtW38NQHD0Px1DLn7IN4ZVTM+tS6HxQrGH8pkeabTH2
 KwMQ==
X-Gm-Message-State: AC+VfDxFw/VUgqMMbBwpy2XQckv22kZ3qUV68qoXXyj0hQF0FU2Jn2lJ
 7+nwy6p6sFL8eew2zA6RWIhcHw==
X-Google-Smtp-Source: ACHHUZ5XIfVFgiVsCRS/7OXRvpEvOG87JJDUFfAi0DygtyZj6YDzuRIuF9OVvfa8xcoBU4ZFnTj1uw==
X-Received: by 2002:adf:f8cd:0:b0:313:f4f5:2ddc with SMTP id
 f13-20020adff8cd000000b00313f4f52ddcmr1361891wrq.62.1687789674566; 
 Mon, 26 Jun 2023 07:27:54 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 d13-20020a5d4f8d000000b003063db8f45bsm7559591wru.23.2023.06.26.07.27.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jun 2023 07:27:54 -0700 (PDT)
Date: Mon, 26 Jun 2023 15:27:52 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Mans Rullgard <mans@mansr.com>
Subject: Re: [PATCH] backlight: led_bl: take led_access lock when required
Message-ID: <20230626142752.GA95170@aspen.lan>
References: <20230619160249.10414-1-mans@mansr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 19, 2023 at 05:02:49PM +0100, Mans Rullgard wrote:
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

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
