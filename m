Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C2AF7515
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jul 2025 15:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 420C510E82E;
	Thu,  3 Jul 2025 13:09:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZkFL82cH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7098010E82E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jul 2025 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751548194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H347ik6ArPTW5H9ZzFXd2PM3KRIg/uASqQgQAgCmVsw=;
 b=ZkFL82cHwkh/CRiNrIytnoPJpCgjWFMg9z1k84P2W0zU+vC1z1mIQWs0KMNgPRj3PRukls
 zK6rESPgOvkIDBf8gonAEpHKwL6w/2td6ef/WkG0HMXr7tpKtVRtJnnUYA/cItFQdKMx31
 66SCK3YUZkysWqZyOsShsXXjfV/4aAY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-32-kKXHK0-OMkaO-EucPbWw1g-1; Thu, 03 Jul 2025 09:09:52 -0400
X-MC-Unique: kKXHK0-OMkaO-EucPbWw1g-1
X-Mimecast-MFC-AGG-ID: kKXHK0-OMkaO-EucPbWw1g_1751548191
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3a54a8a0122so4033358f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jul 2025 06:09:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751548191; x=1752152991;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=H347ik6ArPTW5H9ZzFXd2PM3KRIg/uASqQgQAgCmVsw=;
 b=sXsis9B2lABcYpLvMojuhCgc5bY3DOpmGL9CxLkYW/xjkgw90B/+BMK6AIh6j/mqyI
 S2qOvb81SRDtYFsWT6XQXcZx3EMmDKrzDDYw8IEKpfjKunKxRMMOmwGZ6zHOSiYv3PRm
 JYrPRbLeG/qMTSFlNJDOnslkaU2wtLP90P0G6ghxCuSmTPjnnAuqDJ5SdyVi9jYFOAJG
 fKhNVmRTOnTf7N+JB9qcwsIJwAoS8r5aO64jQSVY50mhc5RHMmZ1bGQnK5OZDP5zai5C
 /sF9LMwErt7+oZpprgZOnVXGQQqdDnHMfyKV3mGG1uDFaN6VuxgpJ+jMkOE1C9PPuzYc
 cO9Q==
X-Gm-Message-State: AOJu0YxGJ6PWakxlZkHRWv7NnXdOkuui4vE65n+72a1mOITbHZVr1lW9
 Rj4DsuCfNq4MqODX7V8T62N9PfsHMIQrZmuQEMqq3YBKNo+YFTa4kLew1U9tI+NdnF+zUQ3GfuO
 +d1Ziipj/K8mApr4oa0v7CubFvA+lknLtTUEIAcfAE7oxK1OZOIkAIfXURvgE/qOMys7Qow==
X-Gm-Gg: ASbGncsA6qpE7x29A9Pk6LsPw4j64OGg+uF/mxDemhWgFbbpZtwBOCAYxgVGzfIGsgh
 26j0W1w5elwdXMQowJKe93as+04ly0P0Q403UpWiGP+BHUBhGTAu8Nmlb0CHLFzacXCrl+FisSg
 auy5QvS4o8PWjwa/LjtpBmBRAmAhuX7S8rNxX6XHG37IAsijlW4R8MKjS4I3hxPWWbLPdSk4wfB
 hpcFR93oiqsAAmMpX8YEsrLKDftGBLDzqGTF4EocsU9qR02rGSjFxwC92jY+wtEvKmZjJHPT/8g
 wUjIuoiWeXc2bGdYlsfWcmEwrYFEVOd1xLLds+4CqUPxemdjAbPdJFbzwK280A==
X-Received: by 2002:a05:6000:491e:b0:3a4:ec32:e4da with SMTP id
 ffacd0b85a97d-3b32bdc1b94mr3030799f8f.15.1751548190821; 
 Thu, 03 Jul 2025 06:09:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHm9J97Ba70OfDpiH0C76aHuJyrxr16jlEV4VEqbpwRCCn0E7SXucTIdvc3ERVgXAvjA0p0pA==
X-Received: by 2002:a05:6000:491e:b0:3a4:ec32:e4da with SMTP id
 ffacd0b85a97d-3b32bdc1b94mr3030698f8f.15.1751548189763; 
 Thu, 03 Jul 2025 06:09:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fada5sm18907894f8f.32.2025.07.03.06.09.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jul 2025 06:09:48 -0700 (PDT)
Message-ID: <1b9a356d-54a2-4715-a3e2-e10270d1f4cc@redhat.com>
Date: Thu, 3 Jul 2025 15:09:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/ast: Move Gen6+ POST code to separate source
 file
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com
Cc: dri-devel@lists.freedesktop.org
References: <20250702132431.249329-1-tzimmermann@suse.de>
 <20250702132431.249329-4-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250702132431.249329-4-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EjFUgYmwkU3S6IhwUvEQexR_SXwhDzQp4b3812G4g98_1751548191
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/07/2025 15:12, Thomas Zimmermann wrote:
> Move POST code for Gen6+ to separate source file and hide it in
> ast_2500_post(). With P2A configuration, it performs a full board
> POST; otherwise it enables the transmitter chip. No changes to the
> overall logic.

Thanks, it looks good to me.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/ast/Makefile          |   1 +
>   drivers/gpu/drm/ast/ast_2500.c        | 567 ++++++++++++++++++++++++++
>   drivers/gpu/drm/ast/ast_dram_tables.h |  62 ---
>   drivers/gpu/drm/ast/ast_drv.c         |   2 +-
>   drivers/gpu/drm/ast/ast_drv.h         |   5 +-
>   drivers/gpu/drm/ast/ast_post.c        | 461 +--------------------
>   6 files changed, 576 insertions(+), 522 deletions(-)
>   create mode 100644 drivers/gpu/drm/ast/ast_2500.c
> 
> diff --git a/drivers/gpu/drm/ast/Makefile b/drivers/gpu/drm/ast/Makefile
> index 0f09e0fa741b..38374720e32e 100644
> --- a/drivers/gpu/drm/ast/Makefile
> +++ b/drivers/gpu/drm/ast/Makefile
> @@ -4,6 +4,7 @@
>   # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
>   
>   ast-y := \
> +	ast_2500.o \
>   	ast_2600.o \
>   	ast_cursor.o \
>   	ast_ddc.o \
> diff --git a/drivers/gpu/drm/ast/ast_2500.c b/drivers/gpu/drm/ast/ast_2500.c
> new file mode 100644
> index 000000000000..e5b3e0c63222
> --- /dev/null
> +++ b/drivers/gpu/drm/ast/ast_2500.c
> @@ -0,0 +1,567 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright 2012 Red Hat Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the
> + * "Software"), to deal in the Software without restriction, including
> + * without limitation the rights to use, copy, modify, merge, publish,
> + * distribute, sub license, and/or sell copies of the Software, and to
> + * permit persons to whom the Software is furnished to do so, subject to
> + * the following conditions:
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDERS, AUTHORS AND/OR ITS SUPPLIERS BE LIABLE FOR ANY CLAIM,
> + * DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
> + * OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
> + * USE OR OTHER DEALINGS IN THE SOFTWARE.
> + *
> + * The above copyright notice and this permission notice (including the
> + * next paragraph) shall be included in all copies or substantial portions
> + * of the Software.
> + */
> +/*
> + * Authors: Dave Airlie <airlied@redhat.com>
> + */
> +
> +#include <linux/delay.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "ast_drv.h"
> +#include "ast_post.h"
> +
> +/*
> + * POST
> + */
> +
> +/*
> + * AST2500 DRAM settings modules
> + */
> +
> +#define REGTBL_NUM           17
> +#define REGIDX_010           0
> +#define REGIDX_014           1
> +#define REGIDX_018           2
> +#define REGIDX_020           3
> +#define REGIDX_024           4
> +#define REGIDX_02C           5
> +#define REGIDX_030           6
> +#define REGIDX_214           7
> +#define REGIDX_2E0           8
> +#define REGIDX_2E4           9
> +#define REGIDX_2E8           10
> +#define REGIDX_2EC           11
> +#define REGIDX_2F0           12
> +#define REGIDX_2F4           13
> +#define REGIDX_2F8           14
> +#define REGIDX_RFC           15
> +#define REGIDX_PLL           16
> +
> +static const u32 ast2500_ddr3_1600_timing_table[REGTBL_NUM] = {
> +	0x64604D38,		     /* 0x010 */
> +	0x29690599,		     /* 0x014 */
> +	0x00000300,		     /* 0x018 */
> +	0x00000000,		     /* 0x020 */
> +	0x00000000,		     /* 0x024 */
> +	0x02181E70,		     /* 0x02C */
> +	0x00000040,		     /* 0x030 */
> +	0x00000024,		     /* 0x214 */
> +	0x02001300,		     /* 0x2E0 */
> +	0x0E0000A0,		     /* 0x2E4 */
> +	0x000E001B,		     /* 0x2E8 */
> +	0x35B8C105,		     /* 0x2EC */
> +	0x08090408,		     /* 0x2F0 */
> +	0x9B000800,		     /* 0x2F4 */
> +	0x0E400A00,		     /* 0x2F8 */
> +	0x9971452F,		     /* tRFC  */
> +	0x000071C1		     /* PLL   */
> +};
> +
> +static const u32 ast2500_ddr4_1600_timing_table[REGTBL_NUM] = {
> +	0x63604E37,		     /* 0x010 */
> +	0xE97AFA99,		     /* 0x014 */
> +	0x00019000,		     /* 0x018 */
> +	0x08000000,		     /* 0x020 */
> +	0x00000400,		     /* 0x024 */
> +	0x00000410,		     /* 0x02C */
> +	0x00000101,		     /* 0x030 */
> +	0x00000024,		     /* 0x214 */
> +	0x03002900,		     /* 0x2E0 */
> +	0x0E0000A0,		     /* 0x2E4 */
> +	0x000E001C,		     /* 0x2E8 */
> +	0x35B8C106,		     /* 0x2EC */
> +	0x08080607,		     /* 0x2F0 */
> +	0x9B000900,		     /* 0x2F4 */
> +	0x0E400A00,		     /* 0x2F8 */
> +	0x99714545,		     /* tRFC  */
> +	0x000071C1		     /* PLL   */
> +};
> +
> +#define TIMEOUT              5000000
> +
> +void ast_2500_patch_ahb(void __iomem *regs)
> +{
> +	u32 data;
> +
> +	/* Clear bus lock condition */
> +	__ast_moutdwm(regs, 0x1e600000, 0xAEED1A03);
> +	__ast_moutdwm(regs, 0x1e600084, 0x00010000);
> +	__ast_moutdwm(regs, 0x1e600088, 0x00000000);
> +	__ast_moutdwm(regs, 0x1e6e2000, 0x1688A8A8);
> +
> +	data = __ast_mindwm(regs, 0x1e6e2070);
> +	if (data & 0x08000000) { /* check fast reset */
> +		/*
> +		 * If "Fast restet" is enabled for ARM-ICE debugger,
> +		 * then WDT needs to enable, that
> +		 * WDT04 is WDT#1 Reload reg.
> +		 * WDT08 is WDT#1 counter restart reg to avoid system deadlock
> +		 * WDT0C is WDT#1 control reg
> +		 *	[6:5]:= 01:Full chip
> +		 *	[4]:= 1:1MHz clock source
> +		 *	[1]:= 1:WDT will be cleeared and disabled after timeout occurs
> +		 *	[0]:= 1:WDT enable
> +		 */
> +		__ast_moutdwm(regs, 0x1E785004, 0x00000010);
> +		__ast_moutdwm(regs, 0x1E785008, 0x00004755);
> +		__ast_moutdwm(regs, 0x1E78500c, 0x00000033);
> +		udelay(1000);
> +	}
> +
> +	do {
> +		__ast_moutdwm(regs, 0x1e6e2000, 0x1688A8A8);
> +		data = __ast_mindwm(regs, 0x1e6e2000);
> +	} while (data != 1);
> +
> +	__ast_moutdwm(regs, 0x1e6e207c, 0x08000000); /* clear fast reset */
> +}
> +
> +static bool mmc_test_single_2500(struct ast_device *ast, u32 datagen)
> +{
> +	return mmc_test(ast, datagen, 0x85);
> +}
> +
> +static bool cbr_test_2500(struct ast_device *ast)
> +{
> +	ast_moutdwm(ast, 0x1E6E0074, 0x0000FFFF);
> +	ast_moutdwm(ast, 0x1E6E007C, 0xFF00FF00);
> +	if (!mmc_test_burst(ast, 0))
> +		return false;
> +	if (!mmc_test_single_2500(ast, 0))
> +		return false;
> +	return true;
> +}
> +
> +static bool ddr_test_2500(struct ast_device *ast)
> +{
> +	ast_moutdwm(ast, 0x1E6E0074, 0x0000FFFF);
> +	ast_moutdwm(ast, 0x1E6E007C, 0xFF00FF00);
> +	if (!mmc_test_burst(ast, 0))
> +		return false;
> +	if (!mmc_test_burst(ast, 1))
> +		return false;
> +	if (!mmc_test_burst(ast, 2))
> +		return false;
> +	if (!mmc_test_burst(ast, 3))
> +		return false;
> +	if (!mmc_test_single_2500(ast, 0))
> +		return false;
> +	return true;
> +}
> +
> +static void ddr_init_common_2500(struct ast_device *ast)
> +{
> +	ast_moutdwm(ast, 0x1E6E0034, 0x00020080);
> +	ast_moutdwm(ast, 0x1E6E0008, 0x2003000F);
> +	ast_moutdwm(ast, 0x1E6E0038, 0x00000FFF);
> +	ast_moutdwm(ast, 0x1E6E0040, 0x88448844);
> +	ast_moutdwm(ast, 0x1E6E0044, 0x24422288);
> +	ast_moutdwm(ast, 0x1E6E0048, 0x22222222);
> +	ast_moutdwm(ast, 0x1E6E004C, 0x22222222);
> +	ast_moutdwm(ast, 0x1E6E0050, 0x80000000);
> +	ast_moutdwm(ast, 0x1E6E0208, 0x00000000);
> +	ast_moutdwm(ast, 0x1E6E0218, 0x00000000);
> +	ast_moutdwm(ast, 0x1E6E0220, 0x00000000);
> +	ast_moutdwm(ast, 0x1E6E0228, 0x00000000);
> +	ast_moutdwm(ast, 0x1E6E0230, 0x00000000);
> +	ast_moutdwm(ast, 0x1E6E02A8, 0x00000000);
> +	ast_moutdwm(ast, 0x1E6E02B0, 0x00000000);
> +	ast_moutdwm(ast, 0x1E6E0240, 0x86000000);
> +	ast_moutdwm(ast, 0x1E6E0244, 0x00008600);
> +	ast_moutdwm(ast, 0x1E6E0248, 0x80000000);
> +	ast_moutdwm(ast, 0x1E6E024C, 0x80808080);
> +}
> +
> +static void ddr_phy_init_2500(struct ast_device *ast)
> +{
> +	u32 data, pass, timecnt;
> +
> +	pass = 0;
> +	ast_moutdwm(ast, 0x1E6E0060, 0x00000005);
> +	while (!pass) {
> +		for (timecnt = 0; timecnt < TIMEOUT; timecnt++) {
> +			data = ast_mindwm(ast, 0x1E6E0060) & 0x1;
> +			if (!data)
> +				break;
> +		}
> +		if (timecnt != TIMEOUT) {
> +			data = ast_mindwm(ast, 0x1E6E0300) & 0x000A0000;
> +			if (!data)
> +				pass = 1;
> +		}
> +		if (!pass) {
> +			ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
> +			udelay(10); /* delay 10 us */
> +			ast_moutdwm(ast, 0x1E6E0060, 0x00000005);
> +		}
> +	}
> +
> +	ast_moutdwm(ast, 0x1E6E0060, 0x00000006);
> +}
> +
> +/*
> + * Check DRAM Size
> + * 1Gb : 0x80000000 ~ 0x87FFFFFF
> + * 2Gb : 0x80000000 ~ 0x8FFFFFFF
> + * 4Gb : 0x80000000 ~ 0x9FFFFFFF
> + * 8Gb : 0x80000000 ~ 0xBFFFFFFF
> + */
> +static void check_dram_size_2500(struct ast_device *ast, u32 tRFC)
> +{
> +	u32 reg_04, reg_14;
> +
> +	reg_04 = ast_mindwm(ast, 0x1E6E0004) & 0xfffffffc;
> +	reg_14 = ast_mindwm(ast, 0x1E6E0014) & 0xffffff00;
> +
> +	ast_moutdwm(ast, 0xA0100000, 0x41424344);
> +	ast_moutdwm(ast, 0x90100000, 0x35363738);
> +	ast_moutdwm(ast, 0x88100000, 0x292A2B2C);
> +	ast_moutdwm(ast, 0x80100000, 0x1D1E1F10);
> +
> +	/* Check 8Gbit */
> +	if (ast_mindwm(ast, 0xA0100000) == 0x41424344) {
> +		reg_04 |= 0x03;
> +		reg_14 |= (tRFC >> 24) & 0xFF;
> +		/* Check 4Gbit */
> +	} else if (ast_mindwm(ast, 0x90100000) == 0x35363738) {
> +		reg_04 |= 0x02;
> +		reg_14 |= (tRFC >> 16) & 0xFF;
> +		/* Check 2Gbit */
> +	} else if (ast_mindwm(ast, 0x88100000) == 0x292A2B2C) {
> +		reg_04 |= 0x01;
> +		reg_14 |= (tRFC >> 8) & 0xFF;
> +	} else {
> +		reg_14 |= tRFC & 0xFF;
> +	}
> +	ast_moutdwm(ast, 0x1E6E0004, reg_04);
> +	ast_moutdwm(ast, 0x1E6E0014, reg_14);
> +}
> +
> +static void enable_cache_2500(struct ast_device *ast)
> +{
> +	u32 reg_04, data;
> +
> +	reg_04 = ast_mindwm(ast, 0x1E6E0004);
> +	ast_moutdwm(ast, 0x1E6E0004, reg_04 | 0x1000);
> +
> +	do
> +		data = ast_mindwm(ast, 0x1E6E0004);
> +	while (!(data & 0x80000));
> +	ast_moutdwm(ast, 0x1E6E0004, reg_04 | 0x400);
> +}
> +
> +static void set_mpll_2500(struct ast_device *ast)
> +{
> +	u32 addr, data, param;
> +
> +	/* Reset MMC */
> +	ast_moutdwm(ast, 0x1E6E0000, 0xFC600309);
> +	ast_moutdwm(ast, 0x1E6E0034, 0x00020080);
> +	for (addr = 0x1e6e0004; addr < 0x1e6e0090;) {
> +		ast_moutdwm(ast, addr, 0x0);
> +		addr += 4;
> +	}
> +	ast_moutdwm(ast, 0x1E6E0034, 0x00020000);
> +
> +	ast_moutdwm(ast, 0x1E6E2000, 0x1688A8A8);
> +	data = ast_mindwm(ast, 0x1E6E2070) & 0x00800000;
> +	if (data) {
> +		/* CLKIN = 25MHz */
> +		param = 0x930023E0;
> +		ast_moutdwm(ast, 0x1E6E2160, 0x00011320);
> +	} else {
> +		/* CLKIN = 24MHz */
> +		param = 0x93002400;
> +	}
> +	ast_moutdwm(ast, 0x1E6E2020, param);
> +	udelay(100);
> +}
> +
> +static void reset_mmc_2500(struct ast_device *ast)
> +{
> +	ast_moutdwm(ast, 0x1E78505C, 0x00000004);
> +	ast_moutdwm(ast, 0x1E785044, 0x00000001);
> +	ast_moutdwm(ast, 0x1E785048, 0x00004755);
> +	ast_moutdwm(ast, 0x1E78504C, 0x00000013);
> +	mdelay(100);
> +	ast_moutdwm(ast, 0x1E785054, 0x00000077);
> +	ast_moutdwm(ast, 0x1E6E0000, 0xFC600309);
> +}
> +
> +static void ddr3_init_2500(struct ast_device *ast, const u32 *ddr_table)
> +{
> +	ast_moutdwm(ast, 0x1E6E0004, 0x00000303);
> +	ast_moutdwm(ast, 0x1E6E0010, ddr_table[REGIDX_010]);
> +	ast_moutdwm(ast, 0x1E6E0014, ddr_table[REGIDX_014]);
> +	ast_moutdwm(ast, 0x1E6E0018, ddr_table[REGIDX_018]);
> +	ast_moutdwm(ast, 0x1E6E0020, ddr_table[REGIDX_020]);	     /* MODEREG4/6 */
> +	ast_moutdwm(ast, 0x1E6E0024, ddr_table[REGIDX_024]);	     /* MODEREG5 */
> +	ast_moutdwm(ast, 0x1E6E002C, ddr_table[REGIDX_02C] | 0x100); /* MODEREG0/2 */
> +	ast_moutdwm(ast, 0x1E6E0030, ddr_table[REGIDX_030]);	     /* MODEREG1/3 */
> +
> +	/* DDR PHY Setting */
> +	ast_moutdwm(ast, 0x1E6E0200, 0x02492AAE);
> +	ast_moutdwm(ast, 0x1E6E0204, 0x00001001);
> +	ast_moutdwm(ast, 0x1E6E020C, 0x55E00B0B);
> +	ast_moutdwm(ast, 0x1E6E0210, 0x20000000);
> +	ast_moutdwm(ast, 0x1E6E0214, ddr_table[REGIDX_214]);
> +	ast_moutdwm(ast, 0x1E6E02E0, ddr_table[REGIDX_2E0]);
> +	ast_moutdwm(ast, 0x1E6E02E4, ddr_table[REGIDX_2E4]);
> +	ast_moutdwm(ast, 0x1E6E02E8, ddr_table[REGIDX_2E8]);
> +	ast_moutdwm(ast, 0x1E6E02EC, ddr_table[REGIDX_2EC]);
> +	ast_moutdwm(ast, 0x1E6E02F0, ddr_table[REGIDX_2F0]);
> +	ast_moutdwm(ast, 0x1E6E02F4, ddr_table[REGIDX_2F4]);
> +	ast_moutdwm(ast, 0x1E6E02F8, ddr_table[REGIDX_2F8]);
> +	ast_moutdwm(ast, 0x1E6E0290, 0x00100008);
> +	ast_moutdwm(ast, 0x1E6E02C0, 0x00000006);
> +
> +	/* Controller Setting */
> +	ast_moutdwm(ast, 0x1E6E0034, 0x00020091);
> +
> +	/* Wait DDR PHY init done */
> +	ddr_phy_init_2500(ast);
> +
> +	ast_moutdwm(ast, 0x1E6E0120, ddr_table[REGIDX_PLL]);
> +	ast_moutdwm(ast, 0x1E6E000C, 0x42AA5C81);
> +	ast_moutdwm(ast, 0x1E6E0034, 0x0001AF93);
> +
> +	check_dram_size_2500(ast, ddr_table[REGIDX_RFC]);
> +	enable_cache_2500(ast);
> +	ast_moutdwm(ast, 0x1E6E001C, 0x00000008);
> +	ast_moutdwm(ast, 0x1E6E0038, 0xFFFFFF00);
> +}
> +
> +static void ddr4_init_2500(struct ast_device *ast, const u32 *ddr_table)
> +{
> +	u32 data, data2, pass, retrycnt;
> +	u32 ddr_vref, phy_vref;
> +	u32 min_ddr_vref = 0, min_phy_vref = 0;
> +	u32 max_ddr_vref = 0, max_phy_vref = 0;
> +
> +	ast_moutdwm(ast, 0x1E6E0004, 0x00000313);
> +	ast_moutdwm(ast, 0x1E6E0010, ddr_table[REGIDX_010]);
> +	ast_moutdwm(ast, 0x1E6E0014, ddr_table[REGIDX_014]);
> +	ast_moutdwm(ast, 0x1E6E0018, ddr_table[REGIDX_018]);
> +	ast_moutdwm(ast, 0x1E6E0020, ddr_table[REGIDX_020]);	     /* MODEREG4/6 */
> +	ast_moutdwm(ast, 0x1E6E0024, ddr_table[REGIDX_024]);	     /* MODEREG5 */
> +	ast_moutdwm(ast, 0x1E6E002C, ddr_table[REGIDX_02C] | 0x100); /* MODEREG0/2 */
> +	ast_moutdwm(ast, 0x1E6E0030, ddr_table[REGIDX_030]);	     /* MODEREG1/3 */
> +
> +	/* DDR PHY Setting */
> +	ast_moutdwm(ast, 0x1E6E0200, 0x42492AAE);
> +	ast_moutdwm(ast, 0x1E6E0204, 0x09002000);
> +	ast_moutdwm(ast, 0x1E6E020C, 0x55E00B0B);
> +	ast_moutdwm(ast, 0x1E6E0210, 0x20000000);
> +	ast_moutdwm(ast, 0x1E6E0214, ddr_table[REGIDX_214]);
> +	ast_moutdwm(ast, 0x1E6E02E0, ddr_table[REGIDX_2E0]);
> +	ast_moutdwm(ast, 0x1E6E02E4, ddr_table[REGIDX_2E4]);
> +	ast_moutdwm(ast, 0x1E6E02E8, ddr_table[REGIDX_2E8]);
> +	ast_moutdwm(ast, 0x1E6E02EC, ddr_table[REGIDX_2EC]);
> +	ast_moutdwm(ast, 0x1E6E02F0, ddr_table[REGIDX_2F0]);
> +	ast_moutdwm(ast, 0x1E6E02F4, ddr_table[REGIDX_2F4]);
> +	ast_moutdwm(ast, 0x1E6E02F8, ddr_table[REGIDX_2F8]);
> +	ast_moutdwm(ast, 0x1E6E0290, 0x00100008);
> +	ast_moutdwm(ast, 0x1E6E02C4, 0x3C183C3C);
> +	ast_moutdwm(ast, 0x1E6E02C8, 0x00631E0E);
> +
> +	/* Controller Setting */
> +	ast_moutdwm(ast, 0x1E6E0034, 0x0001A991);
> +
> +	/* Train PHY Vref first */
> +	pass = 0;
> +
> +	for (retrycnt = 0; retrycnt < 4 && pass == 0; retrycnt++) {
> +		max_phy_vref = 0x0;
> +		pass = 0;
> +		ast_moutdwm(ast, 0x1E6E02C0, 0x00001C06);
> +		for (phy_vref = 0x40; phy_vref < 0x80; phy_vref++) {
> +			ast_moutdwm(ast, 0x1E6E000C, 0x00000000);
> +			ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
> +			ast_moutdwm(ast, 0x1E6E02CC, phy_vref | (phy_vref << 8));
> +			/* Fire DFI Init */
> +			ddr_phy_init_2500(ast);
> +			ast_moutdwm(ast, 0x1E6E000C, 0x00005C01);
> +			if (cbr_test_2500(ast)) {
> +				pass++;
> +				data = ast_mindwm(ast, 0x1E6E03D0);
> +				data2 = data >> 8;
> +				data  = data & 0xff;
> +				if (data > data2)
> +					data = data2;
> +				if (max_phy_vref < data) {
> +					max_phy_vref = data;
> +					min_phy_vref = phy_vref;
> +				}
> +			} else if (pass > 0) {
> +				break;
> +			}
> +		}
> +	}
> +	ast_moutdwm(ast, 0x1E6E02CC, min_phy_vref | (min_phy_vref << 8));
> +
> +	/* Train DDR Vref next */
> +	pass = 0;
> +
> +	for (retrycnt = 0; retrycnt < 4 && pass == 0; retrycnt++) {
> +		min_ddr_vref = 0xFF;
> +		max_ddr_vref = 0x0;
> +		pass = 0;
> +		for (ddr_vref = 0x00; ddr_vref < 0x40; ddr_vref++) {
> +			ast_moutdwm(ast, 0x1E6E000C, 0x00000000);
> +			ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
> +			ast_moutdwm(ast, 0x1E6E02C0, 0x00000006 | (ddr_vref << 8));
> +			/* Fire DFI Init */
> +			ddr_phy_init_2500(ast);
> +			ast_moutdwm(ast, 0x1E6E000C, 0x00005C01);
> +			if (cbr_test_2500(ast)) {
> +				pass++;
> +				if (min_ddr_vref > ddr_vref)
> +					min_ddr_vref = ddr_vref;
> +				if (max_ddr_vref < ddr_vref)
> +					max_ddr_vref = ddr_vref;
> +			} else if (pass != 0) {
> +				break;
> +			}
> +		}
> +	}
> +
> +	ast_moutdwm(ast, 0x1E6E000C, 0x00000000);
> +	ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
> +	ddr_vref = (min_ddr_vref + max_ddr_vref + 1) >> 1;
> +	ast_moutdwm(ast, 0x1E6E02C0, 0x00000006 | (ddr_vref << 8));
> +
> +	/* Wait DDR PHY init done */
> +	ddr_phy_init_2500(ast);
> +
> +	ast_moutdwm(ast, 0x1E6E0120, ddr_table[REGIDX_PLL]);
> +	ast_moutdwm(ast, 0x1E6E000C, 0x42AA5C81);
> +	ast_moutdwm(ast, 0x1E6E0034, 0x0001AF93);
> +
> +	check_dram_size_2500(ast, ddr_table[REGIDX_RFC]);
> +	enable_cache_2500(ast);
> +	ast_moutdwm(ast, 0x1E6E001C, 0x00000008);
> +	ast_moutdwm(ast, 0x1E6E0038, 0xFFFFFF00);
> +}
> +
> +static bool ast_dram_init_2500(struct ast_device *ast)
> +{
> +	u32 data;
> +	u32 max_tries = 5;
> +
> +	do {
> +		if (max_tries-- == 0)
> +			return false;
> +		set_mpll_2500(ast);
> +		reset_mmc_2500(ast);
> +		ddr_init_common_2500(ast);
> +
> +		data = ast_mindwm(ast, 0x1E6E2070);
> +		if (data & 0x01000000)
> +			ddr4_init_2500(ast, ast2500_ddr4_1600_timing_table);
> +		else
> +			ddr3_init_2500(ast, ast2500_ddr3_1600_timing_table);
> +	} while (!ddr_test_2500(ast));
> +
> +	ast_moutdwm(ast, 0x1E6E2040, ast_mindwm(ast, 0x1E6E2040) | 0x41);
> +
> +	/* Patch code */
> +	data = ast_mindwm(ast, 0x1E6E200C) & 0xF9FFFFFF;
> +	ast_moutdwm(ast, 0x1E6E200C, data | 0x10000000);
> +
> +	return true;
> +}
> +
> +static void ast_post_chip_2500(struct ast_device *ast)
> +{
> +	struct drm_device *dev = &ast->base;
> +	u32 temp;
> +	u8 reg;
> +
> +	reg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
> +	if ((reg & AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK) == 0) {/* vga only */
> +		/* Clear bus lock condition */
> +		ast_2500_patch_ahb(ast->regs);
> +
> +		/* Disable watchdog */
> +		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
> +		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
> +
> +		/*
> +		 * Reset USB port to patch USB unknown device issue
> +		 * SCU90 is Multi-function Pin Control #5
> +		 *	[29]:= 1:Enable USB2.0 Host port#1 (that the mutually shared USB2.0 Hub
> +		 *				port).
> +		 * SCU94 is Multi-function Pin Control #6
> +		 *	[14:13]:= 1x:USB2.0 Host2 controller
> +		 * SCU70 is Hardware Strap reg
> +		 *	[23]:= 1:CLKIN is 25MHz and USBCK1 = 24/48 MHz (determined by
> +		 *				[18]: 0(24)/1(48) MHz)
> +		 * SCU7C is Write clear reg to SCU70
> +		 *	[23]:= write 1 and then SCU70[23] will be clear as 0b.
> +		 */
> +		ast_moutdwm(ast, 0x1E6E2090, 0x20000000);
> +		ast_moutdwm(ast, 0x1E6E2094, 0x00004000);
> +		if (ast_mindwm(ast, 0x1E6E2070) & 0x00800000) {
> +			ast_moutdwm(ast, 0x1E6E207C, 0x00800000);
> +			mdelay(100);
> +			ast_moutdwm(ast, 0x1E6E2070, 0x00800000);
> +		}
> +		/* Modify eSPI reset pin */
> +		temp = ast_mindwm(ast, 0x1E6E2070);
> +		if (temp & 0x02000000)
> +			ast_moutdwm(ast, 0x1E6E207C, 0x00004000);
> +
> +		/* Slow down CPU/AHB CLK in VGA only mode */
> +		temp = ast_read32(ast, 0x12008);
> +		temp |= 0x73;
> +		ast_write32(ast, 0x12008, temp);
> +
> +		if (!ast_dram_init_2500(ast))
> +			drm_err(dev, "DRAM init failed !\n");
> +
> +		temp = ast_mindwm(ast, 0x1e6e2040);
> +		ast_moutdwm(ast, 0x1e6e2040, temp | 0x40);
> +	}
> +
> +	/* wait ready */
> +	do {
> +		reg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
> +	} while ((reg & 0x40) == 0);
> +}
> +
> +int ast_2500_post(struct ast_device *ast)
> +{
> +	if (ast->config_mode == ast_use_p2a) {
> +		ast_post_chip_2500(ast);
> +	} else {
> +		if (ast->tx_chip == AST_TX_SIL164) {
> +			/* Enable DVO */
> +			ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
> +		}
> +	}
> +
> +	return 0;
> +}
> diff --git a/drivers/gpu/drm/ast/ast_dram_tables.h b/drivers/gpu/drm/ast/ast_dram_tables.h
> index 1e9ac9d6d26c..45bd1afab0d5 100644
> --- a/drivers/gpu/drm/ast/ast_dram_tables.h
> +++ b/drivers/gpu/drm/ast/ast_dram_tables.h
> @@ -142,66 +142,4 @@ static const struct ast_dramstruct ast2100_dram_table_data[] = {
>   	{ 0xffff, 0xffffffff },
>   };
>   
> -/*
> - * AST2500 DRAM settings modules
> - */
> -#define REGTBL_NUM           17
> -#define REGIDX_010           0
> -#define REGIDX_014           1
> -#define REGIDX_018           2
> -#define REGIDX_020           3
> -#define REGIDX_024           4
> -#define REGIDX_02C           5
> -#define REGIDX_030           6
> -#define REGIDX_214           7
> -#define REGIDX_2E0           8
> -#define REGIDX_2E4           9
> -#define REGIDX_2E8           10
> -#define REGIDX_2EC           11
> -#define REGIDX_2F0           12
> -#define REGIDX_2F4           13
> -#define REGIDX_2F8           14
> -#define REGIDX_RFC           15
> -#define REGIDX_PLL           16
> -
> -static const u32 ast2500_ddr3_1600_timing_table[REGTBL_NUM] = {
> -	0x64604D38,		     /* 0x010 */
> -	0x29690599,		     /* 0x014 */
> -	0x00000300,		     /* 0x018 */
> -	0x00000000,		     /* 0x020 */
> -	0x00000000,		     /* 0x024 */
> -	0x02181E70,		     /* 0x02C */
> -	0x00000040,		     /* 0x030 */
> -	0x00000024,		     /* 0x214 */
> -	0x02001300,		     /* 0x2E0 */
> -	0x0E0000A0,		     /* 0x2E4 */
> -	0x000E001B,		     /* 0x2E8 */
> -	0x35B8C105,		     /* 0x2EC */
> -	0x08090408,		     /* 0x2F0 */
> -	0x9B000800,		     /* 0x2F4 */
> -	0x0E400A00,		     /* 0x2F8 */
> -	0x9971452F,		     /* tRFC  */
> -	0x000071C1		     /* PLL   */
> -};
> -
> -static const u32 ast2500_ddr4_1600_timing_table[REGTBL_NUM] = {
> -	0x63604E37,		     /* 0x010 */
> -	0xE97AFA99,		     /* 0x014 */
> -	0x00019000,		     /* 0x018 */
> -	0x08000000,		     /* 0x020 */
> -	0x00000400,		     /* 0x024 */
> -	0x00000410,		     /* 0x02C */
> -	0x00000101,		     /* 0x030 */
> -	0x00000024,		     /* 0x214 */
> -	0x03002900,		     /* 0x2E0 */
> -	0x0E0000A0,		     /* 0x2E4 */
> -	0x000E001C,		     /* 0x2E8 */
> -	0x35B8C106,		     /* 0x2EC */
> -	0x08080607,		     /* 0x2F0 */
> -	0x9B000900,		     /* 0x2F4 */
> -	0x0E400A00,		     /* 0x2F8 */
> -	0x99714545,		     /* tRFC  */
> -	0x000071C1		     /* PLL   */
> -};
> -
>   #endif
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 054acda41909..356b3b7e52d2 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -171,7 +171,7 @@ static int ast_detect_chip(struct pci_dev *pdev,
>   			/* Patch AST2500/AST2510 */
>   			if ((pdev->revision & 0xf0) == 0x40) {
>   				if (!(vgacrd0 & AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK))
> -					ast_patch_ahb_2500(regs);
> +					ast_2500_patch_ahb(regs);
>   			}
>   
>   			/* Double check that it's actually working */
> diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
> index 570c2fe98b58..4a92c377e9bd 100644
> --- a/drivers/gpu/drm/ast/ast_drv.h
> +++ b/drivers/gpu/drm/ast/ast_drv.h
> @@ -417,6 +417,10 @@ struct ast_crtc_state {
>   
>   int ast_mm_init(struct ast_device *ast);
>   
> +/* ast_2500.c */
> +void ast_2500_patch_ahb(void __iomem *regs);
> +int ast_2500_post(struct ast_device *ast);
> +
>   /* ast_2600.c */
>   int ast_2600_post(struct ast_device *ast);
>   
> @@ -424,7 +428,6 @@ int ast_2600_post(struct ast_device *ast);
>   int ast_post_gpu(struct ast_device *ast);
>   u32 ast_mindwm(struct ast_device *ast, u32 r);
>   void ast_moutdwm(struct ast_device *ast, u32 r, u32 v);
> -void ast_patch_ahb_2500(void __iomem *regs);
>   
>   int ast_vga_output_init(struct ast_device *ast);
>   int ast_sil164_output_init(struct ast_device *ast);
> diff --git a/drivers/gpu/drm/ast/ast_post.c b/drivers/gpu/drm/ast/ast_post.c
> index 03a7367bdc71..0d99270b58c4 100644
> --- a/drivers/gpu/drm/ast/ast_post.c
> +++ b/drivers/gpu/drm/ast/ast_post.c
> @@ -36,7 +36,6 @@
>   #include "ast_post.h"
>   
>   static void ast_post_chip_2300(struct ast_device *ast);
> -static void ast_post_chip_2500(struct ast_device *ast);
>   
>   static const u8 extreginfo[] = { 0x0f, 0x04, 0x1c, 0xff };
>   static const u8 extreginfo_ast2300[] = { 0x0f, 0x04, 0x1f, 0xff };
> @@ -352,14 +351,9 @@ int ast_post_gpu(struct ast_device *ast)
>   		if (ret)
>   			return ret;
>   	} else if (AST_GEN(ast) >= 6) {
> -		if (ast->config_mode == ast_use_p2a) {
> -			ast_post_chip_2500(ast);
> -		} else {
> -			if (ast->tx_chip == AST_TX_SIL164) {
> -				/* Enable DVO */
> -				ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xa3, 0xcf, 0x80);
> -			}
> -		}
> +		ret = ast_2500_post(ast);
> +		if (ret)
> +			return ret;
>   	} else if (AST_GEN(ast) >= 4) {
>   		if (ast->config_mode == ast_use_p2a) {
>   			ast_post_chip_2300(ast);
> @@ -497,11 +491,6 @@ static u32 mmc_test_single2(struct ast_device *ast, u32 datagen)
>   	return mmc_test2(ast, datagen, 0x05);
>   }
>   
> -static bool mmc_test_single_2500(struct ast_device *ast, u32 datagen)
> -{
> -	return mmc_test(ast, datagen, 0x85);
> -}
> -
>   static int cbr_test(struct ast_device *ast)
>   {
>   	u32 data;
> @@ -1666,447 +1655,3 @@ static void ast_post_chip_2300(struct ast_device *ast)
>   		reg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
>   	} while ((reg & 0x40) == 0);
>   }
> -
> -static bool cbr_test_2500(struct ast_device *ast)
> -{
> -	ast_moutdwm(ast, 0x1E6E0074, 0x0000FFFF);
> -	ast_moutdwm(ast, 0x1E6E007C, 0xFF00FF00);
> -	if (!mmc_test_burst(ast, 0))
> -		return false;
> -	if (!mmc_test_single_2500(ast, 0))
> -		return false;
> -	return true;
> -}
> -
> -static bool ddr_test_2500(struct ast_device *ast)
> -{
> -	ast_moutdwm(ast, 0x1E6E0074, 0x0000FFFF);
> -	ast_moutdwm(ast, 0x1E6E007C, 0xFF00FF00);
> -	if (!mmc_test_burst(ast, 0))
> -		return false;
> -	if (!mmc_test_burst(ast, 1))
> -		return false;
> -	if (!mmc_test_burst(ast, 2))
> -		return false;
> -	if (!mmc_test_burst(ast, 3))
> -		return false;
> -	if (!mmc_test_single_2500(ast, 0))
> -		return false;
> -	return true;
> -}
> -
> -static void ddr_init_common_2500(struct ast_device *ast)
> -{
> -	ast_moutdwm(ast, 0x1E6E0034, 0x00020080);
> -	ast_moutdwm(ast, 0x1E6E0008, 0x2003000F);
> -	ast_moutdwm(ast, 0x1E6E0038, 0x00000FFF);
> -	ast_moutdwm(ast, 0x1E6E0040, 0x88448844);
> -	ast_moutdwm(ast, 0x1E6E0044, 0x24422288);
> -	ast_moutdwm(ast, 0x1E6E0048, 0x22222222);
> -	ast_moutdwm(ast, 0x1E6E004C, 0x22222222);
> -	ast_moutdwm(ast, 0x1E6E0050, 0x80000000);
> -	ast_moutdwm(ast, 0x1E6E0208, 0x00000000);
> -	ast_moutdwm(ast, 0x1E6E0218, 0x00000000);
> -	ast_moutdwm(ast, 0x1E6E0220, 0x00000000);
> -	ast_moutdwm(ast, 0x1E6E0228, 0x00000000);
> -	ast_moutdwm(ast, 0x1E6E0230, 0x00000000);
> -	ast_moutdwm(ast, 0x1E6E02A8, 0x00000000);
> -	ast_moutdwm(ast, 0x1E6E02B0, 0x00000000);
> -	ast_moutdwm(ast, 0x1E6E0240, 0x86000000);
> -	ast_moutdwm(ast, 0x1E6E0244, 0x00008600);
> -	ast_moutdwm(ast, 0x1E6E0248, 0x80000000);
> -	ast_moutdwm(ast, 0x1E6E024C, 0x80808080);
> -}
> -
> -static void ddr_phy_init_2500(struct ast_device *ast)
> -{
> -	u32 data, pass, timecnt;
> -
> -	pass = 0;
> -	ast_moutdwm(ast, 0x1E6E0060, 0x00000005);
> -	while (!pass) {
> -		for (timecnt = 0; timecnt < TIMEOUT; timecnt++) {
> -			data = ast_mindwm(ast, 0x1E6E0060) & 0x1;
> -			if (!data)
> -				break;
> -		}
> -		if (timecnt != TIMEOUT) {
> -			data = ast_mindwm(ast, 0x1E6E0300) & 0x000A0000;
> -			if (!data)
> -				pass = 1;
> -		}
> -		if (!pass) {
> -			ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
> -			udelay(10); /* delay 10 us */
> -			ast_moutdwm(ast, 0x1E6E0060, 0x00000005);
> -		}
> -	}
> -
> -	ast_moutdwm(ast, 0x1E6E0060, 0x00000006);
> -}
> -
> -/*
> - * Check DRAM Size
> - * 1Gb : 0x80000000 ~ 0x87FFFFFF
> - * 2Gb : 0x80000000 ~ 0x8FFFFFFF
> - * 4Gb : 0x80000000 ~ 0x9FFFFFFF
> - * 8Gb : 0x80000000 ~ 0xBFFFFFFF
> - */
> -static void check_dram_size_2500(struct ast_device *ast, u32 tRFC)
> -{
> -	u32 reg_04, reg_14;
> -
> -	reg_04 = ast_mindwm(ast, 0x1E6E0004) & 0xfffffffc;
> -	reg_14 = ast_mindwm(ast, 0x1E6E0014) & 0xffffff00;
> -
> -	ast_moutdwm(ast, 0xA0100000, 0x41424344);
> -	ast_moutdwm(ast, 0x90100000, 0x35363738);
> -	ast_moutdwm(ast, 0x88100000, 0x292A2B2C);
> -	ast_moutdwm(ast, 0x80100000, 0x1D1E1F10);
> -
> -	/* Check 8Gbit */
> -	if (ast_mindwm(ast, 0xA0100000) == 0x41424344) {
> -		reg_04 |= 0x03;
> -		reg_14 |= (tRFC >> 24) & 0xFF;
> -		/* Check 4Gbit */
> -	} else if (ast_mindwm(ast, 0x90100000) == 0x35363738) {
> -		reg_04 |= 0x02;
> -		reg_14 |= (tRFC >> 16) & 0xFF;
> -		/* Check 2Gbit */
> -	} else if (ast_mindwm(ast, 0x88100000) == 0x292A2B2C) {
> -		reg_04 |= 0x01;
> -		reg_14 |= (tRFC >> 8) & 0xFF;
> -	} else {
> -		reg_14 |= tRFC & 0xFF;
> -	}
> -	ast_moutdwm(ast, 0x1E6E0004, reg_04);
> -	ast_moutdwm(ast, 0x1E6E0014, reg_14);
> -}
> -
> -static void enable_cache_2500(struct ast_device *ast)
> -{
> -	u32 reg_04, data;
> -
> -	reg_04 = ast_mindwm(ast, 0x1E6E0004);
> -	ast_moutdwm(ast, 0x1E6E0004, reg_04 | 0x1000);
> -
> -	do
> -		data = ast_mindwm(ast, 0x1E6E0004);
> -	while (!(data & 0x80000));
> -	ast_moutdwm(ast, 0x1E6E0004, reg_04 | 0x400);
> -}
> -
> -static void set_mpll_2500(struct ast_device *ast)
> -{
> -	u32 addr, data, param;
> -
> -	/* Reset MMC */
> -	ast_moutdwm(ast, 0x1E6E0000, 0xFC600309);
> -	ast_moutdwm(ast, 0x1E6E0034, 0x00020080);
> -	for (addr = 0x1e6e0004; addr < 0x1e6e0090;) {
> -		ast_moutdwm(ast, addr, 0x0);
> -		addr += 4;
> -	}
> -	ast_moutdwm(ast, 0x1E6E0034, 0x00020000);
> -
> -	ast_moutdwm(ast, 0x1E6E2000, 0x1688A8A8);
> -	data = ast_mindwm(ast, 0x1E6E2070) & 0x00800000;
> -	if (data) {
> -		/* CLKIN = 25MHz */
> -		param = 0x930023E0;
> -		ast_moutdwm(ast, 0x1E6E2160, 0x00011320);
> -	} else {
> -		/* CLKIN = 24MHz */
> -		param = 0x93002400;
> -	}
> -	ast_moutdwm(ast, 0x1E6E2020, param);
> -	udelay(100);
> -}
> -
> -static void reset_mmc_2500(struct ast_device *ast)
> -{
> -	ast_moutdwm(ast, 0x1E78505C, 0x00000004);
> -	ast_moutdwm(ast, 0x1E785044, 0x00000001);
> -	ast_moutdwm(ast, 0x1E785048, 0x00004755);
> -	ast_moutdwm(ast, 0x1E78504C, 0x00000013);
> -	mdelay(100);
> -	ast_moutdwm(ast, 0x1E785054, 0x00000077);
> -	ast_moutdwm(ast, 0x1E6E0000, 0xFC600309);
> -}
> -
> -static void ddr3_init_2500(struct ast_device *ast, const u32 *ddr_table)
> -{
> -
> -	ast_moutdwm(ast, 0x1E6E0004, 0x00000303);
> -	ast_moutdwm(ast, 0x1E6E0010, ddr_table[REGIDX_010]);
> -	ast_moutdwm(ast, 0x1E6E0014, ddr_table[REGIDX_014]);
> -	ast_moutdwm(ast, 0x1E6E0018, ddr_table[REGIDX_018]);
> -	ast_moutdwm(ast, 0x1E6E0020, ddr_table[REGIDX_020]);	     /* MODEREG4/6 */
> -	ast_moutdwm(ast, 0x1E6E0024, ddr_table[REGIDX_024]);	     /* MODEREG5 */
> -	ast_moutdwm(ast, 0x1E6E002C, ddr_table[REGIDX_02C] | 0x100); /* MODEREG0/2 */
> -	ast_moutdwm(ast, 0x1E6E0030, ddr_table[REGIDX_030]);	     /* MODEREG1/3 */
> -
> -	/* DDR PHY Setting */
> -	ast_moutdwm(ast, 0x1E6E0200, 0x02492AAE);
> -	ast_moutdwm(ast, 0x1E6E0204, 0x00001001);
> -	ast_moutdwm(ast, 0x1E6E020C, 0x55E00B0B);
> -	ast_moutdwm(ast, 0x1E6E0210, 0x20000000);
> -	ast_moutdwm(ast, 0x1E6E0214, ddr_table[REGIDX_214]);
> -	ast_moutdwm(ast, 0x1E6E02E0, ddr_table[REGIDX_2E0]);
> -	ast_moutdwm(ast, 0x1E6E02E4, ddr_table[REGIDX_2E4]);
> -	ast_moutdwm(ast, 0x1E6E02E8, ddr_table[REGIDX_2E8]);
> -	ast_moutdwm(ast, 0x1E6E02EC, ddr_table[REGIDX_2EC]);
> -	ast_moutdwm(ast, 0x1E6E02F0, ddr_table[REGIDX_2F0]);
> -	ast_moutdwm(ast, 0x1E6E02F4, ddr_table[REGIDX_2F4]);
> -	ast_moutdwm(ast, 0x1E6E02F8, ddr_table[REGIDX_2F8]);
> -	ast_moutdwm(ast, 0x1E6E0290, 0x00100008);
> -	ast_moutdwm(ast, 0x1E6E02C0, 0x00000006);
> -
> -	/* Controller Setting */
> -	ast_moutdwm(ast, 0x1E6E0034, 0x00020091);
> -
> -	/* Wait DDR PHY init done */
> -	ddr_phy_init_2500(ast);
> -
> -	ast_moutdwm(ast, 0x1E6E0120, ddr_table[REGIDX_PLL]);
> -	ast_moutdwm(ast, 0x1E6E000C, 0x42AA5C81);
> -	ast_moutdwm(ast, 0x1E6E0034, 0x0001AF93);
> -
> -	check_dram_size_2500(ast, ddr_table[REGIDX_RFC]);
> -	enable_cache_2500(ast);
> -	ast_moutdwm(ast, 0x1E6E001C, 0x00000008);
> -	ast_moutdwm(ast, 0x1E6E0038, 0xFFFFFF00);
> -}
> -
> -static void ddr4_init_2500(struct ast_device *ast, const u32 *ddr_table)
> -{
> -	u32 data, data2, pass, retrycnt;
> -	u32 ddr_vref, phy_vref;
> -	u32 min_ddr_vref = 0, min_phy_vref = 0;
> -	u32 max_ddr_vref = 0, max_phy_vref = 0;
> -
> -	ast_moutdwm(ast, 0x1E6E0004, 0x00000313);
> -	ast_moutdwm(ast, 0x1E6E0010, ddr_table[REGIDX_010]);
> -	ast_moutdwm(ast, 0x1E6E0014, ddr_table[REGIDX_014]);
> -	ast_moutdwm(ast, 0x1E6E0018, ddr_table[REGIDX_018]);
> -	ast_moutdwm(ast, 0x1E6E0020, ddr_table[REGIDX_020]);	     /* MODEREG4/6 */
> -	ast_moutdwm(ast, 0x1E6E0024, ddr_table[REGIDX_024]);	     /* MODEREG5 */
> -	ast_moutdwm(ast, 0x1E6E002C, ddr_table[REGIDX_02C] | 0x100); /* MODEREG0/2 */
> -	ast_moutdwm(ast, 0x1E6E0030, ddr_table[REGIDX_030]);	     /* MODEREG1/3 */
> -
> -	/* DDR PHY Setting */
> -	ast_moutdwm(ast, 0x1E6E0200, 0x42492AAE);
> -	ast_moutdwm(ast, 0x1E6E0204, 0x09002000);
> -	ast_moutdwm(ast, 0x1E6E020C, 0x55E00B0B);
> -	ast_moutdwm(ast, 0x1E6E0210, 0x20000000);
> -	ast_moutdwm(ast, 0x1E6E0214, ddr_table[REGIDX_214]);
> -	ast_moutdwm(ast, 0x1E6E02E0, ddr_table[REGIDX_2E0]);
> -	ast_moutdwm(ast, 0x1E6E02E4, ddr_table[REGIDX_2E4]);
> -	ast_moutdwm(ast, 0x1E6E02E8, ddr_table[REGIDX_2E8]);
> -	ast_moutdwm(ast, 0x1E6E02EC, ddr_table[REGIDX_2EC]);
> -	ast_moutdwm(ast, 0x1E6E02F0, ddr_table[REGIDX_2F0]);
> -	ast_moutdwm(ast, 0x1E6E02F4, ddr_table[REGIDX_2F4]);
> -	ast_moutdwm(ast, 0x1E6E02F8, ddr_table[REGIDX_2F8]);
> -	ast_moutdwm(ast, 0x1E6E0290, 0x00100008);
> -	ast_moutdwm(ast, 0x1E6E02C4, 0x3C183C3C);
> -	ast_moutdwm(ast, 0x1E6E02C8, 0x00631E0E);
> -
> -	/* Controller Setting */
> -	ast_moutdwm(ast, 0x1E6E0034, 0x0001A991);
> -
> -	/* Train PHY Vref first */
> -	pass = 0;
> -
> -	for (retrycnt = 0; retrycnt < 4 && pass == 0; retrycnt++) {
> -		max_phy_vref = 0x0;
> -		pass = 0;
> -		ast_moutdwm(ast, 0x1E6E02C0, 0x00001C06);
> -		for (phy_vref = 0x40; phy_vref < 0x80; phy_vref++) {
> -			ast_moutdwm(ast, 0x1E6E000C, 0x00000000);
> -			ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
> -			ast_moutdwm(ast, 0x1E6E02CC, phy_vref | (phy_vref << 8));
> -			/* Fire DFI Init */
> -			ddr_phy_init_2500(ast);
> -			ast_moutdwm(ast, 0x1E6E000C, 0x00005C01);
> -			if (cbr_test_2500(ast)) {
> -				pass++;
> -				data = ast_mindwm(ast, 0x1E6E03D0);
> -				data2 = data >> 8;
> -				data  = data & 0xff;
> -				if (data > data2)
> -					data = data2;
> -				if (max_phy_vref < data) {
> -					max_phy_vref = data;
> -					min_phy_vref = phy_vref;
> -				}
> -			} else if (pass > 0)
> -				break;
> -		}
> -	}
> -	ast_moutdwm(ast, 0x1E6E02CC, min_phy_vref | (min_phy_vref << 8));
> -
> -	/* Train DDR Vref next */
> -	pass = 0;
> -
> -	for (retrycnt = 0; retrycnt < 4 && pass == 0; retrycnt++) {
> -		min_ddr_vref = 0xFF;
> -		max_ddr_vref = 0x0;
> -		pass = 0;
> -		for (ddr_vref = 0x00; ddr_vref < 0x40; ddr_vref++) {
> -			ast_moutdwm(ast, 0x1E6E000C, 0x00000000);
> -			ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
> -			ast_moutdwm(ast, 0x1E6E02C0, 0x00000006 | (ddr_vref << 8));
> -			/* Fire DFI Init */
> -			ddr_phy_init_2500(ast);
> -			ast_moutdwm(ast, 0x1E6E000C, 0x00005C01);
> -			if (cbr_test_2500(ast)) {
> -				pass++;
> -				if (min_ddr_vref > ddr_vref)
> -					min_ddr_vref = ddr_vref;
> -				if (max_ddr_vref < ddr_vref)
> -					max_ddr_vref = ddr_vref;
> -			} else if (pass != 0)
> -				break;
> -		}
> -	}
> -
> -	ast_moutdwm(ast, 0x1E6E000C, 0x00000000);
> -	ast_moutdwm(ast, 0x1E6E0060, 0x00000000);
> -	ddr_vref = (min_ddr_vref + max_ddr_vref + 1) >> 1;
> -	ast_moutdwm(ast, 0x1E6E02C0, 0x00000006 | (ddr_vref << 8));
> -
> -	/* Wait DDR PHY init done */
> -	ddr_phy_init_2500(ast);
> -
> -	ast_moutdwm(ast, 0x1E6E0120, ddr_table[REGIDX_PLL]);
> -	ast_moutdwm(ast, 0x1E6E000C, 0x42AA5C81);
> -	ast_moutdwm(ast, 0x1E6E0034, 0x0001AF93);
> -
> -	check_dram_size_2500(ast, ddr_table[REGIDX_RFC]);
> -	enable_cache_2500(ast);
> -	ast_moutdwm(ast, 0x1E6E001C, 0x00000008);
> -	ast_moutdwm(ast, 0x1E6E0038, 0xFFFFFF00);
> -}
> -
> -static bool ast_dram_init_2500(struct ast_device *ast)
> -{
> -	u32 data;
> -	u32 max_tries = 5;
> -
> -	do {
> -		if (max_tries-- == 0)
> -			return false;
> -		set_mpll_2500(ast);
> -		reset_mmc_2500(ast);
> -		ddr_init_common_2500(ast);
> -
> -		data = ast_mindwm(ast, 0x1E6E2070);
> -		if (data & 0x01000000)
> -			ddr4_init_2500(ast, ast2500_ddr4_1600_timing_table);
> -		else
> -			ddr3_init_2500(ast, ast2500_ddr3_1600_timing_table);
> -	} while (!ddr_test_2500(ast));
> -
> -	ast_moutdwm(ast, 0x1E6E2040, ast_mindwm(ast, 0x1E6E2040) | 0x41);
> -
> -	/* Patch code */
> -	data = ast_mindwm(ast, 0x1E6E200C) & 0xF9FFFFFF;
> -	ast_moutdwm(ast, 0x1E6E200C, data | 0x10000000);
> -
> -	return true;
> -}
> -
> -void ast_patch_ahb_2500(void __iomem *regs)
> -{
> -	u32 data;
> -
> -	/* Clear bus lock condition */
> -	__ast_moutdwm(regs, 0x1e600000, 0xAEED1A03);
> -	__ast_moutdwm(regs, 0x1e600084, 0x00010000);
> -	__ast_moutdwm(regs, 0x1e600088, 0x00000000);
> -	__ast_moutdwm(regs, 0x1e6e2000, 0x1688A8A8);
> -
> -	data = __ast_mindwm(regs, 0x1e6e2070);
> -	if (data & 0x08000000) { /* check fast reset */
> -		/*
> -		 * If "Fast restet" is enabled for ARM-ICE debugger,
> -		 * then WDT needs to enable, that
> -		 * WDT04 is WDT#1 Reload reg.
> -		 * WDT08 is WDT#1 counter restart reg to avoid system deadlock
> -		 * WDT0C is WDT#1 control reg
> -		 *	[6:5]:= 01:Full chip
> -		 *	[4]:= 1:1MHz clock source
> -		 *	[1]:= 1:WDT will be cleeared and disabled after timeout occurs
> -		 *	[0]:= 1:WDT enable
> -		 */
> -		__ast_moutdwm(regs, 0x1E785004, 0x00000010);
> -		__ast_moutdwm(regs, 0x1E785008, 0x00004755);
> -		__ast_moutdwm(regs, 0x1E78500c, 0x00000033);
> -		udelay(1000);
> -	}
> -
> -	do {
> -		__ast_moutdwm(regs, 0x1e6e2000, 0x1688A8A8);
> -		data = __ast_mindwm(regs, 0x1e6e2000);
> -	} while (data != 1);
> -
> -	__ast_moutdwm(regs, 0x1e6e207c, 0x08000000); /* clear fast reset */
> -}
> -
> -void ast_post_chip_2500(struct ast_device *ast)
> -{
> -	struct drm_device *dev = &ast->base;
> -	u32 temp;
> -	u8 reg;
> -
> -	reg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
> -	if ((reg & AST_IO_VGACRD0_VRAM_INIT_STATUS_MASK) == 0) {/* vga only */
> -		/* Clear bus lock condition */
> -		ast_patch_ahb_2500(ast->regs);
> -
> -		/* Disable watchdog */
> -		ast_moutdwm(ast, 0x1E78502C, 0x00000000);
> -		ast_moutdwm(ast, 0x1E78504C, 0x00000000);
> -
> -		/*
> -		 * Reset USB port to patch USB unknown device issue
> -		 * SCU90 is Multi-function Pin Control #5
> -		 *	[29]:= 1:Enable USB2.0 Host port#1 (that the mutually shared USB2.0 Hub
> -		 *				port).
> -		 * SCU94 is Multi-function Pin Control #6
> -		 *	[14:13]:= 1x:USB2.0 Host2 controller
> -		 * SCU70 is Hardware Strap reg
> -		 *	[23]:= 1:CLKIN is 25MHz and USBCK1 = 24/48 MHz (determined by
> -		 *				[18]: 0(24)/1(48) MHz)
> -		 * SCU7C is Write clear reg to SCU70
> -		 *	[23]:= write 1 and then SCU70[23] will be clear as 0b.
> -		 */
> -		ast_moutdwm(ast, 0x1E6E2090, 0x20000000);
> -		ast_moutdwm(ast, 0x1E6E2094, 0x00004000);
> -		if (ast_mindwm(ast, 0x1E6E2070) & 0x00800000) {
> -			ast_moutdwm(ast, 0x1E6E207C, 0x00800000);
> -			mdelay(100);
> -			ast_moutdwm(ast, 0x1E6E2070, 0x00800000);
> -		}
> -		/* Modify eSPI reset pin */
> -		temp = ast_mindwm(ast, 0x1E6E2070);
> -		if (temp & 0x02000000)
> -			ast_moutdwm(ast, 0x1E6E207C, 0x00004000);
> -
> -		/* Slow down CPU/AHB CLK in VGA only mode */
> -		temp = ast_read32(ast, 0x12008);
> -		temp |= 0x73;
> -		ast_write32(ast, 0x12008, temp);
> -
> -		if (!ast_dram_init_2500(ast))
> -			drm_err(dev, "DRAM init failed !\n");
> -
> -		temp = ast_mindwm(ast, 0x1e6e2040);
> -		ast_moutdwm(ast, 0x1e6e2040, temp | 0x40);
> -	}
> -
> -	/* wait ready */
> -	do {
> -		reg = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xd0, 0xff);
> -	} while ((reg & 0x40) == 0);
> -}

