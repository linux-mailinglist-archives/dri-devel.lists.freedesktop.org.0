Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B86822FCD
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 15:47:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F26710E2CC;
	Wed,  3 Jan 2024 14:47:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1005010E2CC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 14:47:04 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a27cd5850d6so297108266b.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Jan 2024 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704293222; x=1704898022; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=DkQTXlmizBAkyVFlUiGkuraalrFSpRvtAnDL1m0Kue8=;
 b=AzyuGKvCdYORG6xZKijzOixy/0eNvc62i0A63xGwX0rEHZwhF9uw2eaS1QRWmhTZBx
 w98DoLeyaV25TZXXLBMWYJ6o93klJa3rsOOF6KTC0VGXy1k55liL22orq9ylZs/W6lIf
 5dYO8IPitj5D9aI5dplohAtBI+lFx5GsK3qjVweD7sGsGixGoix87ht29EixSQRfujXd
 E088rOyMycixjLtGEr1NZ41spONstgVCrdDyQypqpNbxUw4aqZmUtD501cd7uTvdGgqS
 GdeS7u+3oITS2CFBObR1O0TDzKGMCUiuAXVZbTERnmJyAhOO3xFh0fdePHpcnPrfUykX
 TUsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704293222; x=1704898022;
 h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DkQTXlmizBAkyVFlUiGkuraalrFSpRvtAnDL1m0Kue8=;
 b=NV7mprSosKzcMEtYPcPG4TBE7eK6pZaUARm44mE3ApXOli7zlgoxAAq2NqkT53NN+1
 3vJZWhuqaoh5VpIn1aMiICBRn7Ug+eYmRduTGiGIbNLs+85F3yHAQESFV1unr7qnjCEY
 Egn1wUz0kbB5RakaemccfvIrRzkuEHfbUwxwSUedoeKnMUE05vGyIlAugUR2FvJHFb7C
 IyR5C/jOLDTjhIPdbWTw5FLkw3BNrfKRUFlJBNuYBLF5v21AKHdsbZypj4lyglLsZ4+e
 /dtWUUCzjx8IIE+SX1XGr/x2fmaENQa1O6VBn3vF4eYAe8/kVCvMlI9E9EVYkK4D5NzN
 dsqQ==
X-Gm-Message-State: AOJu0Yw+VyIowY9bsEY68HiOGYs83bqYOZv1g/13rGhrifCPnBJqU9ux
 Nd0nLAXkwfh6aes5srmAL6oql1os0zYxKA==
X-Google-Smtp-Source: AGHT+IGnQ/hc04miCFDBs5K2klhNYUqvXoYPap16F2AH4FHBqGO7Dws7XHL16fTco6/6DK8pEnmnUQ==
X-Received: by 2002:a17:906:38d6:b0:a23:57f3:95a9 with SMTP id
 r22-20020a17090638d600b00a2357f395a9mr8736283ejd.2.1704293222446; 
 Wed, 03 Jan 2024 06:47:02 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 f15-20020a17090660cf00b00a26f66ce72fsm8694249ejk.83.2024.01.03.06.47.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Jan 2024 06:47:02 -0800 (PST)
Date: Wed, 3 Jan 2024 17:46:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Dave Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: Re: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
Message-ID: <f8594217-59b7-431c-9fdc-15e2ef6197ab@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231222043308.3090089-9-airlied@gmail.com>
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
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Dave-Airlie/nouveau-gsp-drop-some-acpi-related-debug/20231222-180432
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20231222043308.3090089-9-airlied%40gmail.com
patch subject: [PATCH 08/11] nouveau/gsp: don't free ctrl messages on errors
config: powerpc-randconfig-r071-20231226 (https://download.01.org/0day-ci/archive/20231227/202312271917.55xuDMdc-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project d3ef86708241a3bee902615c190dead1638c4e09)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202312271917.55xuDMdc-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:659 r535_gsp_rpc_rm_ctrl_push() warn: passing zero to 'PTR_ERR'
drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1063 r535_dp_aux_xfer() warn: passing a valid pointer to 'PTR_ERR'

Old smatch warnings:
drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c:1887 nvkm_gsp_radix3_sg() error: uninitialized symbol 'addr'.

vim +/PTR_ERR +659 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c

af265ee961627a Dave Airlie 2023-12-22  649  static int
af265ee961627a Dave Airlie 2023-12-22  650  r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32 repc)
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  651  {
af265ee961627a Dave Airlie 2023-12-22  652  	rpc_gsp_rm_control_v03_00 *rpc = container_of((*argv), typeof(*rpc), params);
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  653  	struct nvkm_gsp *gsp = object->client->gsp;
af265ee961627a Dave Airlie 2023-12-22  654  	int ret = 0;
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  655  
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  656  	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
af265ee961627a Dave Airlie 2023-12-22  657  	if (IS_ERR_OR_NULL(rpc)) {
af265ee961627a Dave Airlie 2023-12-22  658  		*argv = NULL;
af265ee961627a Dave Airlie 2023-12-22 @659  		return PTR_ERR(rpc);

If nvkm_gsp_rpc_push() returns NULL (probably a failure) then this
returns PTR_ERR(NULL) which is zero/success.

af265ee961627a Dave Airlie 2023-12-22  660  	}
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  661  
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  662  	if (rpc->status) {
af265ee961627a Dave Airlie 2023-12-22  663  		ret = r535_rpc_status_to_errno(rpc->status);
555bb9c29a45be Dave Airlie 2023-12-22  664  		if (ret != -EAGAIN)
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  665  			nvkm_error(&gsp->subdev, "cli:0x%08x obj:0x%08x ctrl cmd:0x%08x failed: 0x%08x\n",
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  666  				   object->client->object.handle, object->handle, rpc->cmd, rpc->status);
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  667  	}
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  668  
af265ee961627a Dave Airlie 2023-12-22  669  	if (repc)
af265ee961627a Dave Airlie 2023-12-22  670  		*argv = rpc->params;
af265ee961627a Dave Airlie 2023-12-22  671  	else
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  672  		nvkm_gsp_rpc_done(gsp, rpc);
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  673  
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  674  	return ret;
4cf2c83eb3a4c4 Ben Skeggs  2023-09-19  675  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

