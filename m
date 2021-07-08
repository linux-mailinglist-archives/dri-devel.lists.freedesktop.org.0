Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6513BF632
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 09:22:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578A06E873;
	Thu,  8 Jul 2021 07:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399596E879
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 07:22:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id 1F3F31F437E4
Subject: Re: BUG: MTK DRM/HDMI broken on 5.13 (mt7623/bpi-r2)
To: Frank Wunderlich <frank-w@public-files.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <25d61873-38ae-5648-faab-03431b74f777@collabora.com>
Date: Thu, 8 Jul 2021 09:22:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <trinity-cc8f5927-9aaf-43ae-a107-6a6229f1b481-1625565279264@3c-app-gmx-bs60>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Frank,


On 06.07.21 11:54, Frank Wunderlich wrote:
> Hi,
> 
> i've noticed that HDMI is broken at least on my board (Bananapi-r2,mt7623) on 5.13.
> 
> after some research i noticed that it is working till
> 
> commit 2e477391522354e763aa62ee3e281c1ad9e8eb1b
> Author: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> Date:   Tue Mar 30 13:09:02 2021 +0200
> 
>      drm/mediatek: Don't support hdmi connector creation
> 
> 
> which is the last of mtk-drm-next-5.13 [1] so i guess a problem with core-patches
> 
> dmesg shows the following:
> 
> [    7.071342] mediatek-drm mediatek-drm.1.auto: bound 14007000.ovl (ops mtk_dis
> p_ovl_component_ops)
> [    7.080330] mediatek-drm mediatek-drm.1.auto: bound 14008000.rdma (ops mtk_di
> sp_rdma_component_ops)
> [    7.089429] mediatek-drm mediatek-drm.1.auto: bound 1400b000.color (ops mtk_d
> isp_color_component_ops)
> [    7.098689] mediatek-drm mediatek-drm.1.auto: bound 14012000.rdma (ops mtk_di
> sp_rdma_component_ops)
> [    7.107814] mediatek-drm mediatek-drm.1.auto: bound 14014000.dpi (ops mtk_dpi
> _component_ops)
> [    7.116338] mediatek-drm mediatek-drm.1.auto: Not creating crtc 1 because com
> ponent 9 is disabled or missing
> ....
> [   38.403957] Console: switching to colour frame buffer device 160x64
> [   48.516398] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   48.516422] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CRTC:41:cr
> tc-0] commit wait timed out
> [   58.756384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   58.756399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [CONNECTOR:
> 32:HDMI-A-1] commit wait timed out
> [   68.996384] [drm:drm_crtc_commit_wait] *ERROR* flip_done timed out
> [   68.996399] [drm:drm_atomic_helper_wait_for_dependencies] *ERROR* [PLANE:33:p
> lane-0] commit wait timed out
> [   68.996423] [drm:mtk_drm_crtc_atomic_begin] *ERROR* new event while there is
> still a pending event
> [   69.106385] ------------[ cut here ]------------
> [   69.106392] WARNING: CPU: 2 PID: 7 at drivers/gpu/drm/drm_atomic_helper.c:151
> 1 drm_atomic_helper_wait_for_vblanks.part.0+0x2a0/0x2a8
> [   69.106414] [CRTC:41:crtc-0] vblank wait timed out

We also encountered that warning on mt8173 device - Acer Chromebook R13. It happen after resuming from suspend to ram.
We could not find a version that works and we were not able to find the fix of the bug.
It seems like the irq isr is not called after resuming from suspend.
Please share if you have new findings regarding that bug.

Thanks,
Dafna


> 
> so i guess the breaking commit may be this:
> 
> $ git logone -S"drm_crtc_commit_wait" -- drivers/gpu/drm/
> b99c2c95412c 2021-01-11 drm: Introduce a drm_crtc_commit_wait helper
> 
> in drivers/gpu/drm/drm_atomic{,_helper}.c
> 
> but i cannot confirm it because my git bisect does strange things (after defining 5.13 as bad and the 2e4773915223 as good, second step is before the good commit till the end, last steps are 5.11...). sorry, i'm still new to bisect.
> 
> the fix is targeting to 5.12-rc2, is guess because CK Hu's tree is based on this...but the fix was not included in 5.12-rc2 (only after 5.12.0...got it by merging 5.12.14)
> 
> maybe you can help me?
> 
> regards Frank
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next-5.13
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
