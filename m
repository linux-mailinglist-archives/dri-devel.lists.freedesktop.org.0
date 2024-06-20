Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DC490FF61
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2024 10:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C7D310E86C;
	Thu, 20 Jun 2024 08:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cvD99CZP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B431110E86C
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 08:50:12 +0000 (UTC)
Received: by mail-ed1-f54.google.com with SMTP id
 4fb4d7f45d1cf-57d21b1c8efso454541a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jun 2024 01:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718873411; x=1719478211; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5WAhrMdqS2Jwg1E9qom8Kx0gdr3lJ2Qitazm85klo2E=;
 b=cvD99CZPVUbxF/DOAExNHoM6Q115JvnoIUUH+DlMKbE9NloLU9l3I0j6s4vMh+T6vs
 AbqnuQp0IxyG7QSLr90oSWhwlq+K1CVhbitzzWY6BrjBjAPLgtXu7u1bgL4AO2b1i7DQ
 CEQ6jIe6Jz83iLRZxMr9WDSxrBAaXwWMw7baLbTstcBB0RJrSV0KrywpfUpR3QaOR8bo
 gUF+Z7C/+vZi8MR/F1LEA7LB2B+sp+yFi0Hnnke/Kl+jwQyDuDegrZpi5vip/UelJjWF
 eGzXYnYV8P8KEsJXr70p9HbW7CymT8b4LulA9UYwQmqCX3GvMRVr8sM55Hf+IXDW9Pld
 V40A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718873411; x=1719478211;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5WAhrMdqS2Jwg1E9qom8Kx0gdr3lJ2Qitazm85klo2E=;
 b=WztK+VL45Ef6IX6/44MK/fLO8JOqWsQ2ACvjdGCTfGzGyYpOVKvVp65khn9C1Y/7TN
 gQfwqxHmfku/7XKAGvpt0ShWp39Rv9p6O6etPIkntQhHdLTFjvrc8wTMU3NN+GYv7V50
 8YJNEV9OnJnobv03qo7OFtjdk540TcRW+Vy8c0qRGrZCr3B71ZF6amoVdLyWsZ0dLpGZ
 TPrmp2/7TkPlMXy3HGUDS+5597hHtKqqK3RApX7vM0T3kstoQIEz0Aj2SmTZbG9IgMWt
 CEKDAahPbrJnTAUInBHDThvfyofdbYx4hESupc7VXFMSBQhYio6xp7PIfE7zOrIO+EXw
 ubEQ==
X-Gm-Message-State: AOJu0YwJoptOJWgIuJlb5Gn1wHYTUpPW9quDCv7Upv7LBNTUthDUAst5
 KGiauyqDS95D+zhXKP8N1dLV5xfE9Ogk+4qsYwdEBS3ltarZExg5lj6eOoGoR5HxiadwKrUpChn
 o
X-Google-Smtp-Source: AGHT+IEz/RDP8U/nkoxVnrU3JBDU7Mcmme3IjMW1USD5UNzE1QDj+so/9YOae16O54n+4v1PfqFC7g==
X-Received: by 2002:a50:d74f:0:b0:57c:677a:a941 with SMTP id
 4fb4d7f45d1cf-57d07ebf13bmr2657630a12.40.1718873410688; 
 Thu, 20 Jun 2024 01:50:10 -0700 (PDT)
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb9b7c1d8sm9165087a12.53.2024.06.20.01.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jun 2024 01:50:10 -0700 (PDT)
Date: Thu, 20 Jun 2024 11:50:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: dri-devel@lists.freedesktop.org
Subject: [bug report] drm: atmel-hlcdc: add driver ops to differentiate HLCDC
 and XLCDC IP
Message-ID: <8d3717ec-76d1-4f62-a1ca-043d9a6d2c56@moroto.mountain>
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

Hello Manikandan Muralidharan,

Commit aa71584b323a ("drm: atmel-hlcdc: add driver ops to
differentiate HLCDC and XLCDC IP") from Apr 24, 2024 (linux-next),
leads to the following Smatch static checker warning:

	drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c:573 atmel_hlcdc_plane_update_buffers()
	error: uninitialized symbol 'sr'.

drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
    556 static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
    557                                              struct atmel_hlcdc_plane_state *state)
    558 {
    559         const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
    560         struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
    561         struct drm_framebuffer *fb = state->base.fb;
    562         u32 sr;
    563         int i;
    564 
    565         if (!dc->desc->is_xlcdc)
    566                 sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);

sr is uninitialized on else path.

    567 
    568         for (i = 0; i < state->nplanes; i++) {
    569                 struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
    570 
    571                 state->dscrs[i]->addr = gem->dma_addr + state->offsets[i];
    572 
--> 573                 dc->desc->ops->lcdc_update_buffers(plane, state, sr, i);
                                                                         ^^
Uninitialized.

    574 
    575                 if (desc->layout.xstride[i])
    576                         atmel_hlcdc_layer_write_cfg(&plane->layer,
    577                                                     desc->layout.xstride[i],
    578                                                     state->xstride[i]);
    579 
    580                 if (desc->layout.pstride[i])
    581                         atmel_hlcdc_layer_write_cfg(&plane->layer,
    582                                                     desc->layout.pstride[i],
    583                                                     state->pstride[i]);
    584         }
    585 }

regards,
dan carpenter
