Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C7B48310E
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jan 2022 13:35:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE16010E142;
	Mon,  3 Jan 2022 12:35:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2558510E142
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jan 2022 12:35:27 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id n30so23288950eda.13
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jan 2022 04:35:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ISY5WAXEp+/TVA+ybyZWGaVToSsoO0hMMwrc+3F53/g=;
 b=S9flIX1dHUIPZEwh4d7oHhTQIiArk/Bj97eYK5iwPqn87AeGRaZ/xx1/i6E6MNKglR
 MHtHT2shgCnYEsTTzCr3k/i2J+vFi5Cd8BtohMXsK4EsN0UK1pug9xcImpHptjwG/g9Y
 FT0Kpr5l1PMDK2zTqHodK5BFO9our7C3iEUn7SWsL2of8WadKGzYXf2AoNfItlSL9oX+
 Ed4iqJX4+AG9qO8GDSXN7jygEUSo4sXC+RBcjy8zgYuNt9uVrEEQdzxPK1TzR8mJ/aE2
 r80rgzUTwpDhZDfSJXJ8X+5ulv7grg9BrFSUH+j4A1Oo+BSd2mV/LPgdYYiMEUSl6PoU
 R1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ISY5WAXEp+/TVA+ybyZWGaVToSsoO0hMMwrc+3F53/g=;
 b=iku3tXcANFoXjoHewYG/kyb+nqsHs3fEwHswudqjrAwciUu0+I1xOQLzJMGgCkuQd+
 P9TRpzonaMcuUWnUFOIPpB0Dt5jhRi/I8Ufv14HiMnllYSLiPGxSwDR6kp4iMYUtJ4ll
 Q4tY4CNZO+xv35xosxAAiy9pX1t55+L6owEY2gYXSyguY4I11LeswL1EHAxlIxDY6lCY
 KhA1y7wztUk0rjfjh6JmzOXdR4KM+pnmNmd7+IxAKxxR2zDhe7TjkkYZT/xLzQ1FSHlI
 qHJGiS92K6+82T8iFL1LfxcNWRPou91wdWtrXJxygXvuIu/SIdEyu763ZLJPtBwwRaoW
 xy4Q==
X-Gm-Message-State: AOAM532dWS7/T3lqBkzhHkl+iktP88g4IyQf5ra5zsyC8wgOFGxXOm8e
 1iYLdPVsjDDpP2YcAcIyEXUlcpVOwJzNuTa937CmfbIZdtA=
X-Google-Smtp-Source: ABdhPJyaF/cpprJCTw+uvA6kQN+LH6hRA+cIiTLOfGmYczA/+F6qnc5eQ48RBMbMdrkUW33dU9tkRxSdVWLpR20EStc=
X-Received: by 2002:a50:d65e:: with SMTP id c30mr43399181edj.77.1641213325625; 
 Mon, 03 Jan 2022 04:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20211231013930.139754-1-festevam@gmail.com>
 <YdLifIoB8eClztlG@pendragon.ideasonboard.com>
In-Reply-To: <YdLifIoB8eClztlG@pendragon.ideasonboard.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 3 Jan 2022 09:35:14 -0300
Message-ID: <CAOMZO5DVzvPXs2-0Vzsunh=OZ0qhyMhSKyPTKQ+mGXfF8G8Rtw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i2c/tda998x: Switch to atomic operations
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Marek Vasut <marex@denx.de>, Tommaso Merciai <tomm.merciai@gmail.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 DRI mailing list <dri-devel@lists.freedesktop.org>,
 Peter Robinson <pbrobinson@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Mon, Jan 3, 2022 at 8:48 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:

> With the comment from 2/2 taken into account,
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks for the review. I addressed your feedback and sent v2.

I noticed a problem when removing/inserting the HDMI cable.

If I boot the board with the HDMI cable connected, then after
removal/insertion of the HDMI cable, the following
kernel warning is observed:

# [   23.201080] ------------[ cut here ]------------
[   23.207275] WARNING: CPU: 0 PID: 56 at
drivers/gpu/drm/drm_atomic_helper.c:1514
drm_atomic_helper_wait_for_vblanks.part.0+0x27c/0x294
[   23.221469] [CRTC:35:crtc-0] vblank wait timed out
[   23.226448] Modules linked in:
[   23.230255] CPU: 0 PID: 56 Comm: kworker/0:3 Not tainted
5.15.12-00003-g27f29fb60028 #94
[   23.238508] Hardware name: Freescale i.MX6 SoloX (Device Tree)
[   23.244457] Workqueue: events output_poll_execute
[   23.249377] [<c01118f8>] (unwind_backtrace) from [<c010bde0>]
(show_stack+0x10/0x14)
[   23.257316] [<c010bde0>] (show_stack) from [<c0e8d38c>]
(dump_stack_lvl+0x58/0x70)
[   23.265059] [<c0e8d38c>] (dump_stack_lvl) from [<c0125e2c>]
(__warn+0xd8/0x114)
[   23.272533] [<c0125e2c>] (__warn) from [<c0e87f94>]
(warn_slowpath_fmt+0x90/0xc4)
[   23.280166] [<c0e87f94>] (warn_slowpath_fmt) from [<c0707c98>]
(drm_atomic_helper_wait_for_vblanks.part.0+0x27c/0x294)
[   23.291054] [<c0707c98>]
(drm_atomic_helper_wait_for_vblanks.part.0) from [<c07092cc>]
(drm_atomic_helper_commit_tail_rpm+0x5c/0x6c)
[   23.303150] [<c07092cc>] (drm_atomic_helper_commit_tail_rpm) from
[<c0709e44>] (commit_tail+0x9c/0x190)
[   23.312717] [<c0709e44>] (commit_tail) from [<c070a098>]
(drm_atomic_helper_commit+0x158/0x18c)
[   23.321588] [<c070a098>] (drm_atomic_helper_commit) from
[<c073f4e4>] (drm_client_modeset_commit_atomic+0x238/0x284)
[   23.332314] [<c073f4e4>] (drm_client_modeset_commit_atomic) from
[<c073f600>] (drm_client_modeset_commit_locked+0x60/0x1cc)
[   23.343615] [<c073f600>] (drm_client_modeset_commit_locked) from
[<c073f790>] (drm_client_modeset_commit+0x24/0x40)
[   23.354218] [<c073f790>] (drm_client_modeset_commit) from
[<c071050c>] (__drm_fb_helper_restore_fbdev_mode_unlocked+0x9c/0xc8)
[   23.365803] [<c071050c>]
(__drm_fb_helper_restore_fbdev_mode_unlocked) from [<c07105a0>]
(drm_fb_helper_set_par+0x38/0x68)
[   23.377015] [<c07105a0>] (drm_fb_helper_set_par) from [<c0710674>]
(drm_fb_helper_hotplug_event.part.0+0xa4/0xc0)
[   23.387443] [<c0710674>] (drm_fb_helper_hotplug_event.part.0) from
[<c073ea80>] (drm_client_dev_hotplug+0x6c/0xb4)
[   23.397959] [<c073ea80>] (drm_client_dev_hotplug) from [<c06fc5e0>]
(output_poll_execute+0x200/0x21c)
[   23.407346] [<c06fc5e0>] (output_poll_execute) from [<c0147f54>]
(process_one_work+0x298/0x7cc)
[   23.416224] [<c0147f54>] (process_one_work) from [<c01484b8>]
(worker_thread+0x30/0x50c)
[   23.424479] [<c01484b8>] (worker_thread) from [<c015138c>]
(kthread+0x154/0x17c)
[   23.432039] [<c015138c>] (kthread) from [<c010011c>]
(ret_from_fork+0x14/0x38)
[   23.439413] Exception stack(0xc42a1fb0 to 0xc42a1ff8)
[   23.444588] 1fa0:                                     00000000
00000000 00000000 00000000
[   23.452888] 1fc0: 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000
[   23.461182] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   23.468734] irq event stamp: 43775
[   23.472305] hardirqs last  enabled at (43783): [<c0197408>]
__up_console_sem+0x50/0x60
[   23.480785] hardirqs last disabled at (43792): [<c01973f4>]
__up_console_sem+0x3c/0x60
[   23.489224] softirqs last  enabled at (43774): [<c010150c>]
__do_softirq+0x2ec/0x5a4
[   23.497163] softirqs last disabled at (43747): [<c012efdc>]
irq_exit+0x18c/0x210
[   23.505106] ---[ end trace 86572327287ca501 ]---

I haven't managed to fix this yet, but if you have any suggestions,
please let me know.

Thanks,

Fabio Estevam
