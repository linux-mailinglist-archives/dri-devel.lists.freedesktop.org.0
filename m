Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5FB8239BE
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 01:42:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B26D710E0B1;
	Thu,  4 Jan 2024 00:42:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A59A410E0B1;
 Thu,  4 Jan 2024 00:42:03 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a28bf46ea11so82973666b.1; 
 Wed, 03 Jan 2024 16:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704328922; x=1704933722; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Uvc23dpXpHqY1dPGQelfcNuv5lz83JAZe/DEXvpEDEA=;
 b=DYQcPIfszy4WPQVR+22lmp+ES5i3NxrsIaz3/+JaCkXzmQCpQU21dM3Z+mPGlJaJQh
 2ISd3C7dWM3quUdEaOD4l/GDX7ZxdDzmzE7vIIXaXnO5Gs/45mHRT2YrtKKJOUV5QjFk
 XOBjlqdoZDmNPVbrHYf8FdQbCC7iLlaWrfMHTBXdGWKXSdSonuYYE5vgsHLH0oTJTRbx
 Pqm8A4h+Ys5LIqns5Qsd8pdNmXK2ZIO+vpDJ8H207W+B6svIb14CVZ7fHXKAnWiCjFLr
 z2T+ZNsMGGJN9I6jy98pMi5LgoIqh+/xaRV1sJBzXr+ljJm9gjRE6Uvldis8g63NcL4w
 2EOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704328922; x=1704933722;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uvc23dpXpHqY1dPGQelfcNuv5lz83JAZe/DEXvpEDEA=;
 b=UrshM5vHTvmLfC9vqoYjxWme7STTYnEaNipOuQ3nQT+pixmFtdR0bIMHz+0TgQh8Jf
 +HkBEo/dFXJN/a7ZRl0oxKpt9bgdKwelSSs7kSFvjErKKrxK93BCJi/0WIra6KaNamGb
 ouDwzc2PrcE96Fc9hDDJkxf+Ug6B7U7AZF0FCFxLlGHsZKRoljIMXzHfTbay4AESzQIT
 RWXcBLAIkH4U7X1mc4j+IpuimzAmcjVCWWoSY2HGE8fx6NR50E3wmDxkkv9ZxdYf0Lfj
 5SPGAVLKH6lNPs/4tiCKpqKDt5q9C9ohxG5DxUsB393GhZ1egyR0V3LiTu1rIMXS+/1m
 NvJQ==
X-Gm-Message-State: AOJu0Yy+Js/as/h5nmgNM+C1AhyKwgEDIN8OwYHqus+yI7wf6Lm0SJ9s
 TrrxSvEipY7dFJbGUmSBi1KGhMwm7H7WsHETgys=
X-Google-Smtp-Source: AGHT+IFvICkj21iJ/z9l3iQ0XLjxtVI/HKqcIzua/MxUvlJc0w1EtMthq89sml2MufmrHCuneqQXLEZLIly4yBwppYw=
X-Received: by 2002:a17:906:6bca:b0:a23:1b07:5c1b with SMTP id
 t10-20020a1709066bca00b00a231b075c1bmr1802836ejs.10.1704328921723; Wed, 03
 Jan 2024 16:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20231222043308.3090089-9-airlied@gmail.com>
 <f8594217-59b7-431c-9fdc-15e2ef6197ab@moroto.mountain>
In-Reply-To: <f8594217-59b7-431c-9fdc-15e2ef6197ab@moroto.mountain>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Jan 2024 10:41:50 +1000
Message-ID: <CAPM=9txv+ULnX-f-dG=Ki2iZH5L7Sge-Jcd-asyPiBpVH962=g@mail.gmail.com>
Subject: Re: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Cc: nouveau@lists.freedesktop.org, oe-kbuild-all@lists.linux.dev,
 oe-kbuild@lists.linux.dev, dri-devel@lists.freedesktop.org, lkp@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Jan 2024 at 00:47, Dan Carpenter <dan.carpenter@linaro.org> wrote:
>
> Hi Dave,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-gsp-drop-some-acpi-related-debug/20231222-180432
> base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
> patch link:    https://lore.kernel.org/r/20231222043308.3090089-9-airlied%40gmail.com
> patch subject: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
> config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231227/202312271917.55xuDMdc-lkp@intel.com/config)
> compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202312271917.55xuDMdc-lkp@intel.com/

This is a false positive, I think the code is operating like I'd
expect, we maybe could restructure it to avoid this warning?

The idea is you send an rpc msg, if there's a reply you get a reply,
if no reply you get NULL and if an error you get an error.

So in the case you get an error or NULL you just want to return 0 for
the NULL as it's successful, and error otherwise.

Would using PTR_ERR_OR_ZERO make smatch happy? (even if it's not
really what we want).

Dave.
>
> New smatch warnings:
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:659 r535_gsp_rpc_rm_ctrl_push() warn: passing zero to 'PTR_ERR'
> drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1063 r535_dp_aux_xfer() warn: passing a valid pointer to 'PTR_ERR'
>
> Old smatch warnings:
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1887 nvkm_gsp_radix3_sg() error: uninitialized symbol 'addr'.
>
> vim +/PTR_ERR +659 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
>
> af265ee961627a Dave Airlie 2023-12-22  649  static int
> af265ee961627a Dave Airlie 2023-12-22  650  r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32 repc)
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  651  {
> af265ee961627a Dave Airlie 2023-12-22  652      rpc_gsp_rm_control_v03_00 *rpc = container_of((*argv), typeof(*rpc), params);
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  653      struct nvkm_gsp *gsp = object->client->gsp;
> af265ee961627a Dave Airlie 2023-12-22  654      int ret = 0;
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  655
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  656      rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
> af265ee961627a Dave Airlie 2023-12-22  657      if (IS_ERR_OR_NULL(rpc)) {
> af265ee961627a Dave Airlie 2023-12-22  658              *argv = NULL;
> af265ee961627a Dave Airlie 2023-12-22 @659              return PTR_ERR(rpc);
>
> If nvkm_gsp_rpc_push() returns NULL (probably a failure) then this
> returns PTR_ERR(NULL) which is zero/success.
>
> af265ee961627a Dave Airlie 2023-12-22  660      }
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  661
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  662      if (rpc->status) {
> af265ee961627a Dave Airlie 2023-12-22  663              ret = r535_rpc_status_to_errno(rpc->status);
> 555bb9c29a45be Dave Airlie 2023-12-22  664              if (ret != -EAGAIN)
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  665                      nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  666                                 object->client->object.handle, object->handle, rpc->cmd, rpc->status);
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  667      }
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  668
> af265ee961627a Dave Airlie 2023-12-22  669      if (repc)
> af265ee961627a Dave Airlie 2023-12-22  670              *argv = rpc->params;
> af265ee961627a Dave Airlie 2023-12-22  671      else
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  672              nvkm_gsp_rpc_done(gsp, rpc);
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  673
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  674      return ret;
> 4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  675  }
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>
