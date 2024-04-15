Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6952C8A550E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 16:41:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAB4F112637;
	Mon, 15 Apr 2024 14:41:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VXne/E0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com
 [209.85.218.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D07E5112635
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 14:41:45 +0000 (UTC)
Received: by mail-ej1-f50.google.com with SMTP id
 a640c23a62f3a-a5224dfa9adso526684066b.0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 07:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713192104; x=1713796904; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IzEYpV1f/b3/nXeceUMlnxkDhI9138yOOcv8UXJ0CEM=;
 b=VXne/E0rGPrSm5R8tyv+U2K4J37+JsdoSdK9rRyF9rmY/4VV9/TyOLw0Ad/gkqokkm
 llv0cAJyh3mhPqZKtyngmouhYyzaTQAGh8Y0BxrlzMj0XEB1qHmFAUY4qwW/ohHRAHhB
 Qfg6+WXV1GodJYm1yXKLSyxtiKp0OI+xGy96lX1JsblBTcs+97B7PTzwQxiOL6stKGWF
 L66HJXrLj52/tr3DJdSdccfLr1rs/trvl1c2WYLdhDKO++pfbcHPYyFNnPjcSJlGjD5R
 uaMDAPFYazj9YGmpZi6YQYL8wue0hweeNvqd7VHi1e7CfBlaJyUaKVS5721bRJaPjGMm
 k+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713192104; x=1713796904;
 h=content-disposition:mime-version:message-id:subject:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IzEYpV1f/b3/nXeceUMlnxkDhI9138yOOcv8UXJ0CEM=;
 b=CHGQlIoHzn56pLxl1ENFMy+4nwfkdOj+LS+UTyPMzDFkNOc7TMT7DROGJVGV30yhJl
 nPRj4h9mUeM4OkkLj7Vk0r6AuNWOGY7WMvEjKGiiQA1SPazTIZ1V3WHe7zJaMxtdOEw8
 iLAMCA6AYpZIhEhc3Wtd3BAnrbWQj2RmvkahYARgrdt2NC2epNX+HlMbhWfQSiLDKuYW
 gMQPb7PGwVUqZiRscTr9HAZrfAtpFl++8c5FZtl7vm/gdyS+B7j5cIAf0v0BCMsLgNLg
 sQsIbR1N6/VY/QP2hMKTMYRLCpLexYGB5HwpMgmS7ILxjdxBxwjs1dsasjFCdV9rjRZA
 O5rQ==
X-Gm-Message-State: AOJu0YzKWKsS3b2fcM7hIqZuQZdU+VdnQ+v9W6WIvHzqmubaKVwMQTi3
 rn3XlDnjWxZiASnp7R8FbkY9oo1VdzJq14XA5DohhFleSDWOxiE5+8xx+Xxc+NSimt3ZIWoHtbS
 c
X-Google-Smtp-Source: AGHT+IGBMdEEOG4egO0/mFZ4MRkQk9fNfUXyW/FDCQYKsrCSYJiPHCm62U3BaO0y3jX84gTT+k1eoA==
X-Received: by 2002:a17:907:72c8:b0:a52:51ce:3703 with SMTP id
 du8-20020a17090772c800b00a5251ce3703mr5766437ejc.2.1713192103664; 
 Mon, 15 Apr 2024 07:41:43 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 h18-20020a17090619d200b00a51a80028e8sm5545562ejd.65.2024.04.15.07.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Apr 2024 07:41:43 -0700 (PDT)
Date: Mon, 15 Apr 2024 17:41:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Subject: [bug report] drm/nouveau/disp/r535: initial support
Message-ID: <e936004c-95d7-4326-93b6-e447f743e9f4@moroto.mountain>
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

Hello Nouveau Devs,

Commit 9e9944449023 ("drm/nouveau/disp/r535: initial support") from
Sep 19, 2023 (linux-next), leads to the following Smatch static
checker warning:

drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1482 r535_disp_oneinit() error: potential NULL/IS_ERR bug 'ctrl'
drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1582 r535_disp_oneinit() error: potential NULL/IS_ERR bug 'ctrl'
drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1596 r535_disp_oneinit() error: potential NULL/IS_ERR bug 'ctrl'
drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c:1625 r535_disp_oneinit() error: potential NULL/IS_ERR bug 'ctrl'
drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:519 r535_fifo_ectx_size() error: potential NULL/IS_ERR bug 'ctrl'
drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:556 r535_fifo_runl_ctor() error: potential NULL/IS_ERR bug 'ctrl'
drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c:631 r535_fifo_runl_ctor() error: potential NULL/IS_ERR bug 'ctrl'

drivers/gpu/drm/nouveau/nvkm/engine/disp/r535.c
    1432 static int
    1433 r535_disp_oneinit(struct nvkm_disp *disp)
    1434 {
    1435         struct nvkm_device *device = disp->engine.subdev.device;
    1436         struct nvkm_gsp *gsp = device->gsp;
    1437         NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS *ctrl;
    1438         int ret, i;
    1439 
    1440         /* RAMIN. */
    1441         ret = nvkm_gpuobj_new(device, 0x10000, 0x10000, false, NULL, &disp->inst);
    1442         if (ret)
    1443                 return ret;
    1444 
    1445         if (WARN_ON(nvkm_memory_target(disp->inst->memory) != NVKM_MEM_TARGET_VRAM))
    1446                 return -EINVAL;
    1447 
    1448         ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
    1449                                     NV2080_CTRL_CMD_INTERNAL_DISPLAY_WRITE_INST_MEM,
    1450                                     sizeof(*ctrl));
    1451         if (IS_ERR(ctrl))
    1452                 return PTR_ERR(ctrl);
    1453 
    1454         ctrl->instMemPhysAddr = nvkm_memory_addr(disp->inst->memory);
    1455         ctrl->instMemSize = nvkm_memory_size(disp->inst->memory);
    1456         ctrl->instMemAddrSpace = ADDR_FBMEM;
    1457         ctrl->instMemCpuCacheAttr = NV_MEMORY_WRITECOMBINED;
    1458 
    1459         ret = nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
    1460         if (ret)
    1461                 return ret;
    1462 
    1463         /* OBJs. */
    1464         ret = nvkm_gsp_client_device_ctor(gsp, &disp->rm.client, &disp->rm.device);
    1465         if (ret)
    1466                 return ret;
    1467 
    1468         ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, 0x00730000, NV04_DISPLAY_COMMON, 0,
    1469                                 &disp->rm.objcom);
    1470         if (ret)
    1471                 return ret;
    1472 
    1473         {
    1474                 NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS *ctrl;
    1475 
    1476                 ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
    1477                                            NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO,
    1478                                            sizeof(*ctrl));
    1479                 if (IS_ERR(ctrl))

The problem here is that r535_gsp_rpc_push() returns a mix of error
pointers and NULL.  I've written a blog about how mixing error pointers
and NULL normally works and I think there is some kind of similar logic
here but I forget what it is...

https://staticthinking.wordpress.com/2022/08/01/mixing-error-pointers-and-null/

    1480                         return PTR_ERR(ctrl);
    1481 
--> 1482                 disp->wndw.mask = ctrl->windowPresentMask;
                                           ^^^^^^
Potential NULL dereference.

    1483                 disp->wndw.nr = fls(disp->wndw.mask);
    1484                 nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
    1485         }
    1486 
    1487         /* */
    1488         {
    1489 #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
    1490                 NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS *ctrl;
    1491                 struct nvkm_gsp_object *subdevice = &disp->rm.client.gsp->internal.device.subdevice;
    1492 
    1493                 ctrl = nvkm_gsp_rm_ctrl_get(subdevice,
    1494                                             NV2080_CTRL_CMD_INTERNAL_INIT_BRIGHTC_STATE_LOAD,
    1495                                             sizeof(*ctrl));
    1496                 if (IS_ERR(ctrl))

regards,
dan carpenter
