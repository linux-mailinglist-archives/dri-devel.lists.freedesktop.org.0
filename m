Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0354FC92F
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 02:19:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFAED10F137;
	Tue, 12 Apr 2022 00:18:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC7A10E18C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 00:18:56 +0000 (UTC)
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-de48295467so19190450fac.2
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 17:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=yhIKihiP/WteSGS7dx1S+CyVO2CIgYlBYjwFcvjcXSI=;
 b=neTQStbU3fC19CKgmsXsHAXekBnVNjsqPCQZlcZLJ7Aml2G9ERtEWqDbuq+GRQ9jCn
 BAITUvNG0Fsx6N3lN64oyMmOVyEM8nCBHOGuUSspvlXwBjki26j2d7FNEXo1mVCOkDcZ
 ZFmK5imREpwXsPN7TIUrfKnfA96lam+kfZx0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=yhIKihiP/WteSGS7dx1S+CyVO2CIgYlBYjwFcvjcXSI=;
 b=2gif8Ji4KFlBNZ0aEfqBKtGG/Fpv9doD5YMxiTbbXSbw6VQmmCVZMGkCYn8ZVT40qx
 DciUslPp6oTF2ui238NUUZSW/lq/TRd/B2FSWDvzmyUOIChZkLrhiTbCI6/8LyqjWzQt
 RvpaG9OUePYmoqi7huoK4gkJcHTBE7BhrbhGVOrM9gG8F//WgATjG8mDrqISZUk8DHnY
 xuhBt7OPZ7zeGUr+X5wqO2irmFWjX0xPZevJ7Gc3j2jYmxBj2pC5cBP0Bqm/ec2XUHi6
 CuTylu23kmJ3ws/PMrrzdv/VK22TDLixI2mXpg9By7Oi0EsdwRyeqRQu8+3FJfd7Cnf1
 oOMQ==
X-Gm-Message-State: AOAM532AJeL1mcYsU4U8vK0Hyl7wJs3BA3bJiUJhhvcMQDkefXR3WQmB
 8V/KqxxCPZSX2hz5VpSHioEN24fmqr4U0ZUNtlx6Hg==
X-Google-Smtp-Source: ABdhPJwmr3O9pqs7hm57p90ombSHJJEog7z2H+SyLsBG2KV0aeEb+JoRG10rf8SZz7CpPBlqWUqpEVysfmLZL7bxncA=
X-Received: by 2002:a05:6870:e893:b0:e2:ecbc:e581 with SMTP id
 q19-20020a056870e89300b000e2ecbce581mr905541oan.193.1649722735541; Mon, 11
 Apr 2022 17:18:55 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 11 Apr 2022 20:18:55 -0400
MIME-Version: 1.0
In-Reply-To: <20220411234953.2425280-1-dmitry.baryshkov@linaro.org>
References: <20220411234953.2425280-1-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Mon, 11 Apr 2022 20:18:55 -0400
Message-ID: <CAE-0n52AnbZzoQF6GbkCQxMi3kk8nw+sVrY+1-+AEOiFF37Pqg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: properly add and remove internal bridges
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
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
Cc: kernel test robot <lkp@intel.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-04-11 16:49:53)
> Add calls to drm_bridge_add()/drm_bridge_remove() DRM bridges created by
> the driver. This fixes the following warning.
>
> WARNING: CPU: 0 PID: 1 at kernel/locking/mutex.c:579 __mutex_lock+0x840/0x9f4
> DEBUG_LOCKS_WARN_ON(lock->magic != lock)
> Modules linked in:
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.18.0-rc1-00002-g3054695a0d27-dirty #55
> Hardware name: Generic DT based system
>  unwind_backtrace from show_stack+0x10/0x14
>  show_stack from dump_stack_lvl+0x58/0x70
>  dump_stack_lvl from __warn+0xc8/0x1e8
>  __warn from warn_slowpath_fmt+0x78/0xa8
>  warn_slowpath_fmt from __mutex_lock+0x840/0x9f4
>  __mutex_lock from mutex_lock_nested+0x1c/0x24
>  mutex_lock_nested from drm_bridge_hpd_enable+0x2c/0x84
>  drm_bridge_hpd_enable from msm_hdmi_modeset_init+0xc0/0x21c
>  msm_hdmi_modeset_init from mdp4_kms_init+0x53c/0x90c
>  mdp4_kms_init from msm_drm_bind+0x514/0x698
>  msm_drm_bind from try_to_bring_up_aggregate_device+0x160/0x1bc
>  try_to_bring_up_aggregate_device from component_master_add_with_match+0xc4/0xf8
>  component_master_add_with_match from msm_pdev_probe+0x274/0x350
>  msm_pdev_probe from platform_probe+0x5c/0xbc
>  platform_probe from really_probe.part.0+0x9c/0x290
>  really_probe.part.0 from __driver_probe_device+0xa8/0x13c
>  __driver_probe_device from driver_probe_device+0x34/0x10c
>  driver_probe_device from __driver_attach+0xbc/0x178
>  __driver_attach from bus_for_each_dev+0x74/0xc0
>  bus_for_each_dev from bus_add_driver+0x160/0x1e4
>  bus_add_driver from driver_register+0x88/0x118
>  driver_register from do_one_initcall+0x6c/0x334
>  do_one_initcall from kernel_init_freeable+0x1bc/0x220
>  kernel_init_freeable from kernel_init+0x18/0x12c
>  kernel_init from ret_from_fork+0x14/0x2c
>
> Fixes: 3d3f8b1f8b62 ("drm/bridge: make bridge registration independent of drm flow")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
