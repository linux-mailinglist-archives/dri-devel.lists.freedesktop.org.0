Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 969F855C587
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 14:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26B51131BB;
	Tue, 28 Jun 2022 12:51:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D4B1131BB;
 Tue, 28 Jun 2022 12:51:18 +0000 (UTC)
Received: from [192.168.2.145] (109-252-118-164.nat.spd-mgts.ru
 [109.252.118.164])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (No client certificate requested)
 (Authenticated sender: dmitry.osipenko)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 7ABBC6601856;
 Tue, 28 Jun 2022 13:51:14 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1656420677;
 bh=QW35y0ngxo74XEIz+a+5lGVgqnaeMkyQSyje1iFHTww=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=VIJvhDUJcm5yDx9PlWKbGQ74WtOgaDIRlnuWjRl3RSZ92ypNqOuh2I3bpjSz7OH4H
 JGvnNJC8zmFqC7hT5uFxiAW5Dx635g6KUOblvf4uNCAiNufzsiyVGYH0HJTP6nChNV
 uH74sFdDAuum+u5SJdOOqnitGC6cxSx+PBAfF6ZBFwIz6UCVPzpKzW6K802UU551PJ
 9gd/kmz/LZafsmptA87YaQCQzcdNPvE77r/6v9FAzKaet4EK+0nCX6vqvEl0rlf6Gm
 x1dq3kWwXK4S3yHxdJSm0xbxWEB4B/hMoLiQTHj6uc6GXhuywUCwPy1p9MPet+qr/A
 GRvQWmyiyl8nA==
Message-ID: <17318333-d9b1-9184-4147-7e3123a6fccb@collabora.com>
Date: Tue, 28 Jun 2022 15:51:11 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 00/22] Add generic memory shrinker to VirtIO-GPU and
 Panfrost DRM drivers
Content-Language: en-US
To: Robin Murphy <robin.murphy@arm.com>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Daniel Stone <daniel@fooishbar.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Rob Clark <robdclark@gmail.com>, Emil Velikov <emil.l.velikov@gmail.com>,
 Qiang Yu <yuq825@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Thierry Reding
 <thierry.reding@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20220526235040.678984-1-dmitry.osipenko@collabora.com>
 <49cc6f0c-e90e-8edd-52e7-4188620e2c28@arm.com>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <49cc6f0c-e90e-8edd-52e7-4188620e2c28@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kernel@collabora.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/28/22 15:31, Robin Murphy wrote:
> [  100.511411]
> ==================================================================
> [  100.511419] BUG: KASAN: use-after-free in irq_work_single+0xa4/0x110
> [  100.511445] Write of size 4 at addr ffff0000107f5830 by task
> glmark2-es2-drm/280
> [  100.511458]
> [  100.511464] CPU: 1 PID: 280 Comm: glmark2-es2-drm Not tainted
> 5.19.0-rc3+ #400
> [  100.511479] Hardware name: ARM LTD ARM Juno Development Platform/ARM
> Juno Development Platform, BIOS EDK II Sep  3 2019
> [  100.511489] Call trace:
> [  100.511494]  dump_backtrace+0x1e4/0x1f0
> [  100.511512]  show_stack+0x20/0x70
> [  100.511523]  dump_stack_lvl+0x8c/0xb8
> [  100.511543]  print_report+0x16c/0x668
> [  100.511559]  kasan_report+0x80/0x208
> [  100.511574]  kasan_check_range+0x100/0x1b8
> [  100.511590]  __kasan_check_write+0x34/0x60
> [  100.511607]  irq_work_single+0xa4/0x110
> [  100.511619]  irq_work_run_list+0x6c/0x88
> [  100.511632]  irq_work_run+0x28/0x48
> [  100.511644]  ipi_handler+0x254/0x468
> [  100.511664]  handle_percpu_devid_irq+0x11c/0x518
> [  100.511681]  generic_handle_domain_irq+0x50/0x70
> [  100.511699]  gic_handle_irq+0xd4/0x118
> [  100.511711]  call_on_irq_stack+0x2c/0x58
> [  100.511725]  do_interrupt_handler+0xc0/0xc8
> [  100.511741]  el1_interrupt+0x40/0x68
> [  100.511754]  el1h_64_irq_handler+0x18/0x28
> [  100.511767]  el1h_64_irq+0x64/0x68
> [  100.511778]  irq_work_queue+0xc0/0xd8
> [  100.511790]  drm_sched_entity_fini+0x2c4/0x3b0
> [  100.511805]  drm_sched_entity_destroy+0x2c/0x40
> [  100.511818]  panfrost_job_close+0x44/0x1c0
> [  100.511833]  panfrost_postclose+0x38/0x60
> [  100.511845]  drm_file_free.part.0+0x33c/0x4b8
> [  100.511862]  drm_close_helper.isra.0+0xc0/0xd8
> [  100.511877]  drm_release+0xe4/0x1e0
> [  100.511891]  __fput+0xf8/0x390
> [  100.511904]  ____fput+0x18/0x28
> [  100.511917]  task_work_run+0xc4/0x1e0
> [  100.511929]  do_exit+0x554/0x1168
> [  100.511945]  do_group_exit+0x60/0x108
> [  100.511960]  __arm64_sys_exit_group+0x34/0x38
> [  100.511977]  invoke_syscall+0x64/0x180
> [  100.511993]  el0_svc_common.constprop.0+0x13c/0x170
> [  100.512012]  do_el0_svc+0x48/0xe8
> [  100.512028]  el0_svc+0x5c/0xe0
> [  100.512038]  el0t_64_sync_handler+0xb8/0xc0
> [  100.512051]  el0t_64_sync+0x18c/0x190
> [  100.512064]

This one shall be fixed by [1] that is not in the RC kernel yet, please
use linux-next.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20220628&id=7d64c40a7d96190d9d06e240305389e025295916

-- 
Best regards,
Dmitry
