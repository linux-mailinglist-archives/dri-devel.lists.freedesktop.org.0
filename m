Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0039BBD81E6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 10:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 268F910E186;
	Tue, 14 Oct 2025 08:13:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fvWwblyZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8267410E186
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 08:13:35 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-46e2e363118so42566225e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 01:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760429614; x=1761034414; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xhf78mDj7L6zLhIAA4NyhL+vPp3/tw4ip9YZY4CJYUQ=;
 b=fvWwblyZ/ZslaK/c7mzaU69T2NK/eXixb474AG5LlbUyDLF7jtfXckg1nVNhEfT/AB
 1zhOgw1Q+IBOLeyacot8Q0brZS0XLpJCqCVxEIAHi+BBeTqx0T9LV2iEaVSmBhImn1pO
 f09rjpiUjb46drgOoCF1AA1/Z6UrciFqPfcP6/ElfyHj+p56eFQ+9bTHRf7PVMhjAe33
 DQg3k4fkOo+vxIrgA3fng0GD5Jaj5kd2zmArWW978QiB0r8UjodGpevGePpyHiPJF6Nb
 TeuNtPZLY/vevR1l9CWggABHuUyifevWINSXqcq6QMe3Zz1sm5deZed+txada+WjJPA9
 rpMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760429614; x=1761034414;
 h=content-disposition:mime-version:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xhf78mDj7L6zLhIAA4NyhL+vPp3/tw4ip9YZY4CJYUQ=;
 b=MzjOGWqzKv7N3VLdNHAa205vsUbNidv4meJQj1Ya8vcJ866fO7kt8mS7mJFd0TjRJK
 GrW2eqiV64G75YtgAegT58RookohrlyvCwar833BdxBf4pd2EOfNZYEvCcvq5M2ql7sr
 HqlVG07DO3vEGR3tXhpQxCeMldYM+8YzLYn/zm4qYZjsZzaEqidpVEbWfLIezMrMmD/V
 GNmlmriBzvEykwxHNMRZh8WQRArTkMjmaUJzcKlx0L+07lqCeomSQmYqnq43VVWIdOcX
 vBJBkMw+WkcFbF4LbCvA8xgCb+kw4+FGWISVMtrhg5YJF0q0EF4aDmiAo0OBGJ3UJm2P
 R3Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVqE+86siODUwFB9oih7c8qXlu/weGG1e1r612V5H6Q3kjf5DyQqmSq1xFVwu/NVNybcmCg6iiNolA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWgRLMzWe7LDMThSEgBQlepbcfSbHyHokKV9QRv7Ox3JPuQJ9n
 ljJ+In7I4iuvAdmMC8J7JZbKKmUtc3PWkBChjimApgAt8BzUJH4colYJ
X-Gm-Gg: ASbGncsaRxGhYbvbtmItAt8LS18yHjhHmnab2mxzlizUXsxyd2EwdJvvVGV5T0dpl0b
 POxgXxlLh2ToABCRL2QtbK2wkbQVzMrLhesgytys4c+UnMskC2QMOxBKrVBp6cuJNNq2hNtWgBp
 Zdbbielomlnf5DENaA6r7Uj8vOsgnYJAex6OamKEFPJHxk/+58qDl7FLDV+prEtBRqgKOtI9Ojw
 O2PfWW4OuoBmcGcWxT6vFbUrieREM5tElwafzZQQ6sNj4WVOHMVCkqkoEFOxl5Xl/qLYEmy0StA
 LI7W2EORUy0fecoa0k3sZxx4TpvW1knnP29XWFlb5wOqe8+q5xk1vzKgC0AZW4JVn3omlEZLIL0
 lJ5M0acREdy9tUURqrDWe//kYRhgbt/AGN8tN4TwrZICMTJIvv93gA30kfZUMzp8xPPHDWlc8cW
 aCyB5uCtsbAAcXST0gacyOZUNpxURHaVRkrjkDDZ75IiJlVqI89dw5nT4=
X-Google-Smtp-Source: AGHT+IE/yvvNi7f9ywz4oKxH3zGAx/TZVEsNIIjjDV3XuFHg8dmmWzqobqnhmfB1Aan5xjCCgtdy/A==
X-Received: by 2002:a05:600c:314b:b0:46c:adf8:c845 with SMTP id
 5b1f17b1804b1-46fa9a98f32mr174482375e9.16.1760429613749; 
 Tue, 14 Oct 2025 01:13:33 -0700 (PDT)
Received: from ernest.hoecke-nb
 (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb49c3eeasm225979145e9.14.2025.10.14.01.13.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Oct 2025 01:13:33 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
X-Google-Original-From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
Date: Tue, 14 Oct 2025 10:13:31 +0200
To: Anusha Srivatsa <asrivats@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, regressions@lists.linux.dev
Subject: [REGRESSION] drm/panel/panel-simple v6.17 WARNING regression
Message-ID: <hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Hello everyone,

Commit 94d50c1a2ca3 ("drm/bridge: get/put the bridge reference in drm_bridge_attach/detach()")
introduced a regression with the below warning dure probe with panel
dpi described in the device tree.

[    9.160074] ------------[ cut here ]------------
[    9.160092] WARNING: CPU: 0 PID: 66 at /usr/src/kernel/lib/refcount.c:25 drm_bridge_attach+0x2c/0x1dc
[    9.160138] refcount_t: addition on 0; use-after-free.
[    9.160147] Modules linked in: coda_vpu(+) snd_soc_fsl_asrc snd_compress v4l2_jpeg pwm_imx27 imx_vdoa spi_imx imx6_media(C) imx_media_common(C) videobuf2_dma_contig etnaviv snd_soc_fsl_ssi v4l2_mem2mem imx_pcm_dma panel_simple gpio_keys gpu_sched pwm_bl loop fuse ipv6 autofs4
[    9.160423] CPU: 0 UID: 0 PID: 66 Comm: kworker/u10:2 Tainted: G         C          6.17.0-rc5-0.0.0-devel #1 PREEMPT 
[    9.160459] Tainted: [C]=CRAP
[    9.160476] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    9.160497] Workqueue: events_unbound deferred_probe_work_func
[    9.160535] Call trace: 
[    9.160546]  unwind_backtrace from show_stack+0x10/0x14
[    9.160603]  show_stack from dump_stack_lvl+0x54/0x68
[    9.160637]  dump_stack_lvl from __warn+0x7c/0xd4
[    9.160672]  __warn from warn_slowpath_fmt+0x130/0x1c4
[    9.160726]  warn_slowpath_fmt from drm_bridge_attach+0x2c/0x1dc
[    9.160780]  drm_bridge_attach from imx_pd_bind+0x74/0xa0
[    9.160836]  imx_pd_bind from component_bind_all+0xfc/0x254
[    9.160881]  component_bind_all from imx_drm_bind+0xa8/0x154
[    9.160903]  imx_drm_bind from try_to_bring_up_aggregate_device+0x1f8/0x2b0
[    9.160959]  try_to_bring_up_aggregate_device from __component_add+0x9c/0x160
[    9.161003]  __component_add from imx_pd_probe+0xa8/0x160
[    9.161042]  imx_pd_probe from platform_probe+0x5c/0x90
[    9.161066]  platform_probe from really_probe+0xd0/0x3a4
[    9.161093]  really_probe from __driver_probe_device+0x8c/0x1d4
[    9.161144]  __driver_probe_device from driver_probe_device+0x34/0xd0
[    9.161195]  driver_probe_device from __device_attach_driver+0xa4/0x134
[    9.161248]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
[    9.161299]  bus_for_each_drv from __device_attach+0xa4/0x1cc
[    9.161328]  __device_attach from bus_probe_device+0x84/0x88
[    9.161354]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
[    9.161395]  deferred_probe_work_func from process_one_work+0x158/0x2e0
[    9.161434]  process_one_work from worker_thread+0x254/0x3fc
[    9.161449]  worker_thread from kthread+0x128/0x24c
[    9.161473]  kthread from ret_from_fork+0x14/0x28
[    9.161494] Exception stack(0xe0aa1fb0 to 0xe0aa1ff8)
[    9.161505] 1fa0:                                     00000000 00000000 00000000 00000000
[    9.161517] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    9.161529] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    9.161539] ---[ end trace 0000000000000000 ]---

Note that this commit was added to branch 'drm-next-2025-07-30',
which did not contain an already mainlined fix for another regression [1].
Without that fix [2], this new regression is masked.

Reverting 94d50c1a2ca3 on top of
commit 260f6f4fda93 ("Merge tag 'drm-next-2025-07-30' of https://gitlab.freedesktop.org/drm/kernel")
fixes the issue. At that point, [1] was fixed in mainline, and the new
regression reported here was merged in. v6.17-rc1 to v6.17-rc7 are in
this state.

However, later on, another regression seems to be introduced by
commit 8fa5909400f3 ("drm/bridge: get the bridge returned by drm_bridge_chain_get_first_bridge()")
so reverting 94d50c1a2ca3 on top of drm-misc-next does not solve
everything. This was tested by rebasing drm-misc-next onto (260f6f4fda93
plus the revert of 94d50c1a2ca3) and then bisecting.

So in v6.18-rc1, both regressions are present.

There, I get the following additional warnings:

[    9.732278] ------------[ cut here ]------------
[    9.732336] WARNING: CPU: 0 PID: 38 at lib/refcount.c:22 drm_bridge_get+0x10/0x18
[    9.744608] refcount_t: saturated; leaking memory.
[    9.749634] Modules linked in: nvmem_snvs_lpgpr phy_mxs_usb coda_vpu v4l2_jpeg spi_imx imx_vdoa imx6_media(C) pwm_imx27 snd_soc_fsl_asrc snd_soc_fsl_ssi snd_compress 4
[    9.776972] CPU: 0 UID: 0 PID: 38 Comm: kworker/u8:3 Tainted: G        WC          6.18.0-rc1-00214-g1226cd7c7686 #138 PREEMPT 
[    9.788476] Tainted: [W]=WARN, [C]=CRAP
[    9.792320] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[    9.798858] Workqueue: events_unbound deferred_probe_work_func
[    9.804729] Call trace: 
[    9.804744]  unwind_backtrace from show_stack+0x10/0x14
[    9.812532]  show_stack from dump_stack_lvl+0x68/0x74
[    9.817614]  dump_stack_lvl from __warn+0x7c/0xe0
[    9.822355]  __warn from warn_slowpath_fmt+0x130/0x1c0
[    9.827526]  warn_slowpath_fmt from drm_bridge_get+0x10/0x18
[    9.833218]  drm_bridge_get from drm_bridge_connector_init+0xc8/0x72c
[    9.839685]  drm_bridge_connector_init from imx_pd_bind+0x80/0xa0
[    9.845809]  imx_pd_bind from component_bind_all+0xf4/0x254
[    9.851422]  component_bind_all from imx_drm_bind+0x98/0x128
[    9.857109]  imx_drm_bind from try_to_bring_up_aggregate_device+0x1d0/0x29c
[    9.864097]  try_to_bring_up_aggregate_device from __component_add+0xa0/0x164
[    9.871263]  __component_add from imx_pd_probe+0xa8/0x164
[    9.876690]  imx_pd_probe from platform_probe+0x5c/0x90
[    9.881940]  platform_probe from really_probe+0xd0/0x3a4
[    9.887280]  really_probe from __driver_probe_device+0x8c/0x1d4
[    9.893227]  __driver_probe_device from driver_probe_device+0x30/0xc0
[    9.899694]  driver_probe_device from __device_attach_driver+0x98/0x10c
[    9.906337]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
[    9.912634]  bus_for_each_drv from __device_attach+0xa8/0x1c8
[    9.918409]  __device_attach from bus_probe_device+0x88/0x8c
[    9.924097]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
[    9.930563]  deferred_probe_work_func from process_one_work+0x154/0x2dc
[    9.937205]  process_one_work from worker_thread+0x250/0x3f0
[    9.942883]  worker_thread from kthread+0x12c/0x24c
[    9.947787]  kthread from ret_from_fork+0x14/0x28
[    9.952513] Exception stack(0xe0961fb0 to 0xe0961ff8)
[    9.957575] 1fa0:                                     00000000 00000000 00000000 00000000
[    9.965762] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    9.973948] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    9.981052] ---[ end trace 0000000000000000 ]---

[    9.985782] ------------[ cut here ]------------
[    9.985835] WARNING: CPU: 0 PID: 38 at lib/refcount.c:28 drm_bridge_connector_init+0x328/0x72c
[    9.999210] refcount_t: underflow; use-after-free.
[   10.004119] Modules linked in: mux_core error nvmem_snvs_lpgpr phy_mxs_usb coda_vpu v4l2_jpeg spi_imx imx_vdoa imx6_media(C) pwm_imx27 snd_soc_fsl_asrc snd_soc_fsl_ss4
[   10.032757] CPU: 0 UID: 0 PID: 38 Comm: kworker/u8:3 Tainted: G        WC          6.18.0-rc1-00214-g1226cd7c7686 #138 PREEMPT 
[   10.044260] Tainted: [W]=WARN, [C]=CRAP
[   10.048104] Hardware name: Freescale i.MX6 Quad/DualLite (Device Tree)
[   10.054642] Workqueue: events_unbound deferred_probe_work_func
[   10.060511] Call trace: 
[   10.060523]  unwind_backtrace from show_stack+0x10/0x14
[   10.068309]  show_stack from dump_stack_lvl+0x68/0x74
[   10.073390]  dump_stack_lvl from __warn+0x7c/0xe0
[   10.078127]  __warn from warn_slowpath_fmt+0x130/0x1c0
[   10.083296]  warn_slowpath_fmt from drm_bridge_connector_init+0x328/0x72c
[   10.090115]  drm_bridge_connector_init from imx_pd_bind+0x80/0xa0
[   10.096238]  imx_pd_bind from component_bind_all+0xf4/0x254
[   10.101843]  component_bind_all from imx_drm_bind+0x98/0x128
[   10.107525]  imx_drm_bind from try_to_bring_up_aggregate_device+0x1d0/0x29c
[   10.114512]  try_to_bring_up_aggregate_device from __component_add+0xa0/0x164
[   10.121676]  __component_add from imx_pd_probe+0xa8/0x164
[   10.127101]  imx_pd_probe from platform_probe+0x5c/0x90
[   10.132348]  platform_probe from really_probe+0xd0/0x3a4
[   10.137683]  really_probe from __driver_probe_device+0x8c/0x1d4
[   10.143632]  __driver_probe_device from driver_probe_device+0x30/0xc0
[   10.150099]  driver_probe_device from __device_attach_driver+0x98/0x10c
[   10.156742]  __device_attach_driver from bus_for_each_drv+0x90/0xe4
[   10.163035]  bus_for_each_drv from __device_attach+0xa8/0x1c8
[   10.168804]  __device_attach from bus_probe_device+0x88/0x8c
[   10.174490]  bus_probe_device from deferred_probe_work_func+0x8c/0xcc
[   10.180955]  deferred_probe_work_func from process_one_work+0x154/0x2dc
[   10.187595]  process_one_work from worker_thread+0x250/0x3f0
[   10.193270]  worker_thread from kthread+0x12c/0x24c
[   10.198172]  kthread from ret_from_fork+0x14/0x28
[   10.202895] Exception stack(0xe0961fb0 to 0xe0961ff8)
[   10.207956] 1fa0:                                     00000000 00000000 00000000 00000000
[   10.216145] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[   10.224330] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[   10.231448] ---[ end trace 0000000000000000 ]---


[1]: https://lore.kernel.org/all/20250612081834.GA248237@francesco-nb/
[2]: https://lore.kernel.org/all/20250626-drm-panel-simple-fixes-v2-0-5afcaa608bdc@kernel.org/

#regzbot ^introduced: 94d50c1a2ca31d80f12d9c2bdbc41437751e320c
#regzbot ^introduced: 8fa5909400f377351836419223c33f1131f0f7d3

Does this ring a bell for anyone?

Kind regards,
Ernest

