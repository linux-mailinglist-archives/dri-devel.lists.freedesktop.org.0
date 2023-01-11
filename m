Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 156CB6650CD
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 01:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AFD510E065;
	Wed, 11 Jan 2023 00:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com
 [IPv6:2607:f8b0:4864:20::a33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48E210E065
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 00:59:41 +0000 (UTC)
Received: by mail-vk1-xa33.google.com with SMTP id l3so3401468vkk.11
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MpqKCIgPRMhpXTruKjB1OC0juXM/o08kG+iDAT9++eA=;
 b=gGC3PH3VfglXadEagUBFXOQTZR/RqQMmcQ2lP9IhyxzoFetggN2vu1o0T04fU9rYYm
 3Ms7UToJO+NO2joHkS5Qr71wryywqwqyjhAqPxtKC9qoSjCM8Fk10fCqGTnxfl2LF3er
 NVZA3sz7mHW23N/n6dGDFucJ2Tptzw0Ccr3u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MpqKCIgPRMhpXTruKjB1OC0juXM/o08kG+iDAT9++eA=;
 b=NOKlLNZCqrqIUiTAeSs7HU7e4IH5rR/lZ3yFnWcEUsC+E/pTRDNK5d7xjMqlsISGJE
 57CDXWyoM6w984iSCMuHLD0ZZfXhHOY9eb+c+1q5nPF7mTKSvE2hT1AXRZ+9r5Q82bIN
 dUC9/rf87q1xZpc5RqUNAydsZtFpm6Gx+g5smEqRMsNzDtYrXJYY+NROciYvWvv12YLC
 J1QpFibIm1d+JKvwIPKQcyuQ+r+XZS1Gbtn08coF7nXNiy2jfGZLEu351nQbTW2dqzq2
 Z41/yIEZOlTISCkZnXcvAY5E4MIK1p/jThOvZy9TDzg/RLXcrDeuAOSMIJjMHNfkZGWd
 rp5g==
X-Gm-Message-State: AFqh2ko1fR2/YwCjkGZLRCyHXWUdODSw1lyJSrv4RwjGcLlhAcdUWGnZ
 TNU3sg7Z9ieUHXmALbS6t3qtRT/vIfh3Pbd2
X-Google-Smtp-Source: AMrXdXsbjXOsOl/cyxHkq+W+Gy3I6jTa6YYZ32VS6OFywc1bPKXJ82BOZKzNbwgiFyhjbfirtKkNyQ==
X-Received: by 2002:a1f:a444:0:b0:3d5:e711:2342 with SMTP id
 n65-20020a1fa444000000b003d5e7112342mr15133824vke.15.1673398780446; 
 Tue, 10 Jan 2023 16:59:40 -0800 (PST)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com.
 [209.85.217.41]) by smtp.gmail.com with ESMTPSA id
 b3-20020a1fe403000000b003bc3f5785a6sm1561705vkh.12.2023.01.10.16.59.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 16:59:39 -0800 (PST)
Received: by mail-vs1-f41.google.com with SMTP id d66so1738254vsd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jan 2023 16:59:39 -0800 (PST)
X-Received: by 2002:a05:6102:3e06:b0:3b5:fd8:7948 with SMTP id
 j6-20020a0561023e0600b003b50fd87948mr10845718vsv.85.1673398779099; Tue, 10
 Jan 2023 16:59:39 -0800 (PST)
MIME-Version: 1.0
References: <20221231142721.338643-1-abel.vesa@linaro.org>
 <20221231142721.338643-2-abel.vesa@linaro.org>
In-Reply-To: <20221231142721.338643-2-abel.vesa@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Jan 2023 16:59:26 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XdQfg3KVdVrQtVyHM_RBeP_4TZE07mr2KWpP8PxbAdmA@mail.gmail.com>
Message-ID: <CAD=FV=XdQfg3KVdVrQtVyHM_RBeP_4TZE07mr2KWpP8PxbAdmA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/panel-edp: add IVO M133NW4J panel entry
To: Abel Vesa <abel.vesa@linaro.org>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Johan Hovold <johan@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, Steev Klimaszewski <steev@kali.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Dec 31, 2022 at 6:27 AM Abel Vesa <abel.vesa@linaro.org> wrote:
>
> Add an eDP panel entry for IVO M133NW4J.
>
> Due to lack of documentation, use the delay_200_500_p2e100 timings like
> some other IVO entries for now.
>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>
> Assuming the information from here is correct:
> https://raw.githubusercontent.com/linuxhw/EDID/master/DigitalDisplay.md
>
> This fixes the following WARN_ON on my X13s:
>
> [    2.194973] CPU: 5 PID: 186 Comm: kworker/u16:6 Not tainted 6.2.0-rc1-00075-g5136d9aa278f-dirty #26
> [    2.195409] Hardware name: LENOVO 21BX000WRI/21BX000WRI, BIOS N3HET44W (1.16 ) 05/27/2022
> [    2.195820] Workqueue: events_unbound deferred_probe_work_func
> [    2.196234] pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    2.196639] pc : panel_edp_probe+0x3d4/0x520 [panel_edp]
> [    2.197036] lr : panel_edp_probe+0x37c/0x520 [panel_edp]
> [    2.197435] sp : ffff80000970b3b0
> [    2.197833] x29: ffff80000970b3b0 x28: ffff0e0a80b7f760 x27: 0000000000000001
> [    2.198231] x26: ffff0e11fe0e1b50 x25: ffffa8f9f585e0c8 x24: 0000000000000000
> [    2.198630] x23: ffff0e0a81a39c80 x22: ffffa8f9f58c7638 x21: 0000000000000000
> [    2.199032] x20: ffff0e0a8d1b0000 x19: ffff0e0a820fea80 x18: 0000000000000000
> [    2.199576] x17: 0000000000000000 x16: ffffa8fa5e097080 x15: 0000000000000000
> [    2.199969] x14: 0000000000000003 x13: 0000000000000059 x12: 0000000000000066
> [    2.200360] x11: 0000000000000001 x10: 00000000000009e0 x9 : 0000000000000001
> [    2.200748] x8 : ffff80000970b340 x7 : 0000000000000000 x6 : 0000000000000000
> [    2.201132] x5 : 0000000000000049 x4 : 0000000000000056 x3 : 000000000000004f
> [    2.201512] x2 : 0000000000000000 x1 : ffffa8f9f58c7a00 x0 : 000000000000854a
> [    2.201888] Call trace:
> [    2.202261]  panel_edp_probe+0x3d4/0x520 [panel_edp]
> [    2.202636]  panel_edp_dp_aux_ep_probe+0x38/0x50 [panel_edp]
> [    2.203009]  dp_aux_ep_probe+0x34/0xf4 [drm_dp_aux_bus]
> [    2.203379]  really_probe+0xc0/0x3dc
> [    2.203739]  __driver_probe_device+0x7c/0x190
> [    2.204096]  driver_probe_device+0x3c/0x110
> [    2.204448]  __device_attach_driver+0xbc/0x160
> [    2.204795]  bus_for_each_drv+0x7c/0xd4
> [    2.205136]  __device_attach+0x9c/0x1c0
> [    2.205439]  device_initial_probe+0x14/0x20
> [    2.205717]  bus_probe_device+0x9c/0xa4
> [    2.205995]  device_add+0x3c4/0x8cc
> [    2.206270]  device_register+0x20/0x30
> [    2.206543]  of_dp_aux_populate_bus+0xe0/0x1bc [drm_dp_aux_bus]
> [    2.206817]  msm_dp_modeset_init+0x1d8/0x274 [msm]
> [    2.207096]  _dpu_kms_drm_obj_init+0x128/0x670 [msm]
> [    2.207370]  dpu_kms_hw_init+0x540/0x640 [msm]
> [    2.207645]  msm_drm_bind+0x18c/0x61c [msm]
> [    2.207917]  try_to_bring_up_aggregate_device+0x1dc/0x2d0
> [    2.208186]  __component_add+0xa4/0x190
> [    2.208454]  component_add+0x14/0x20
> [    2.208720]  dp_display_probe+0x29c/0x454 [msm]
> [    2.208989]  platform_probe+0x68/0xc0
> [    2.209252]  really_probe+0xc0/0x3dc
> [    2.209511]  __driver_probe_device+0x7c/0x190
> [    2.209767]  driver_probe_device+0x3c/0x110
> [    2.210022]  __device_attach_driver+0xbc/0x160
> [    2.210275]  bus_for_each_drv+0x7c/0xd4
> [    2.210528]  __device_attach+0x9c/0x1c0
> [    2.210781]  device_initial_probe+0x14/0x20
> [    2.211032]  bus_probe_device+0x9c/0xa4
> [    2.211280]  deferred_probe_work_func+0x9c/0xf0
> [    2.211525]  process_one_work+0x1c4/0x320
> [    2.211768]  worker_thread+0x6c/0x430
> [    2.212012]  kthread+0x108/0x10c
> [    2.212251]  ret_from_fork+0x10/0x20
> [    2.212488] ---[ end trace 0000000000000000 ]---
> [    2.212755] panel-simple-dp-aux aux-aea0000.displayport-controller: Unknown panel IVO 0x854a, using conservative timings
>
>  drivers/gpu/drm/panel/panel-edp.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

Pushed to drm-misc-next:

e22391454e3e drm/panel-edp: add IVO M133NW4J panel entry
