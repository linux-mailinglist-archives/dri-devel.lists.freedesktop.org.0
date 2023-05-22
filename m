Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 512AA70B80B
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 10:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 473F010E27A;
	Mon, 22 May 2023 08:51:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 66A0910E27A
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 08:51:49 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:56230.753820448
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 0327B1002EE;
 Mon, 22 May 2023 16:51:43 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-75648544bd-xwndj with ESMTP id
 fb165ebb1ea24404a094994199b65b8e for kernel@xen0n.name; 
 Mon, 22 May 2023 16:51:46 CST
X-Transaction-ID: fb165ebb1ea24404a094994199b65b8e
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <2f701944-588c-3f56-06f3-abcbbf12be1e@189.cn>
Date: Mon, 22 May 2023 16:51:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: WANG Xuerui <kernel@xen0n.name>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sui Jingfeng <suijingfeng@loongson.cn>, Li Yi <liyi@loongson.cn>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Emil Velikov <emil.l.velikov@gmail.com>
References: <20230520105718.325819-1-15330273260@189.cn>
 <20230520105718.325819-2-15330273260@189.cn>
 <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <26fd78b9-c074-8341-c99c-4e3b38cd861a@xen0n.name>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: loongson-kernel@lists.loongnix.cn,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Nathan Chancellor <nathan@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Javier Martinez Canillas <javierm@redhat.com>,
 linaro-mm-sig@lists.linaro.org, Liu Peibao <liupeibao@loongson.cn>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/5/21 20:21, WANG Xuerui wrote:
>
>> +/*
>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include <drm/drm_debugfs.h>
>> +
>> +#include "lsdc_benchmark.h"
>> +#include "lsdc_drv.h"
>> +#include "lsdc_gem.h"
>> +#include "lsdc_ttm.h"
>> +
>> +typedef void (*lsdc_copy_proc_t)(struct lsdc_bo *src_bo,
>> +                 struct lsdc_bo *dst_bo,
>> +                 unsigned int size,
>> +                 int n);
>> +
>> +static void lsdc_copy_gtt_to_vram_cpu(struct lsdc_bo *src_bo,
>> +                      struct lsdc_bo *dst_bo,
>> +                      unsigned int size,
>> +                      int n)
>> +{
>> +    lsdc_bo_kmap(src_bo);
>> +    lsdc_bo_kmap(dst_bo);
>> +
>> +    while (n--)
>> +        memcpy_toio(dst_bo->kptr, src_bo->kptr, size);
>> +
>> +    lsdc_bo_kunmap(src_bo);
>> +    lsdc_bo_kunmap(dst_bo);
>> +}
>> +
>> +static void lsdc_copy_vram_to_gtt_cpu(struct lsdc_bo *src_bo,
>> +                      struct lsdc_bo *dst_bo,
>> +                      unsigned int size,
>> +                      int n)
>> +{
>> +    lsdc_bo_kmap(src_bo);
>> +    lsdc_bo_kmap(dst_bo);
>> +
>> +    while (n--)
>> +        memcpy_fromio(dst_bo->kptr, src_bo->kptr, size);
>> +
>> +    lsdc_bo_kunmap(src_bo);
>> +    lsdc_bo_kunmap(dst_bo);
>> +}
>> +
>> +static void lsdc_copy_gtt_to_gtt_cpu(struct lsdc_bo *src_bo,
>> +                     struct lsdc_bo *dst_bo,
>> +                     unsigned int size,
>> +                     int n)
>> +{
>> +    lsdc_bo_kmap(src_bo);
>> +    lsdc_bo_kmap(dst_bo);
>> +
>> +    while (n--)
>> +        memcpy(dst_bo->kptr, src_bo->kptr, size);
>> +
>> +    lsdc_bo_kunmap(src_bo);
>> +    lsdc_bo_kunmap(dst_bo);
>> +}
>> +
>> +static void lsdc_benchmark_copy(struct lsdc_device *ldev,
>> +                unsigned int size,
>> +                unsigned int n,
>> +                u32 src_domain,
>> +                u32 dst_domain,
>> +                lsdc_copy_proc_t copy_proc,
>> +                struct drm_printer *p)
>> +{
>> +    struct drm_device *ddev = &ldev->base;
>> +    struct lsdc_bo *src_bo;
>> +    struct lsdc_bo *dst_bo;
>> +    unsigned long start_jiffies;
>> +    unsigned long end_jiffies;
>> +    unsigned int throughput;
>> +    unsigned int time;
>> +
>> +    src_bo = lsdc_bo_create_kernel_pinned(ddev, src_domain, size);
>> +    dst_bo = lsdc_bo_create_kernel_pinned(ddev, dst_domain, size);
>> +
>> +    start_jiffies = jiffies;
>> +
>> +    copy_proc(src_bo, dst_bo, size, n);
>> +
>> +    end_jiffies = jiffies;
>> +
>> +    lsdc_bo_free_kernel_pinned(src_bo);
>> +    lsdc_bo_free_kernel_pinned(dst_bo);
>> +
>> +    time = jiffies_to_msecs(end_jiffies - start_jiffies);
>> +
>> +    throughput = (n * (size >> 10)) / time;
>> +
>> +    drm_printf(p,
>> +           "Copy bo of %ukB %u times from %s to %s in %ums: %uMB/s\n",
>> +           size >> 10, n,
>> +           lsdc_domain_to_str(src_domain),
>> +           lsdc_domain_to_str(dst_domain),
>> +           time, throughput);
>> +}
>> +
>> +int lsdc_show_benchmark_copy(struct lsdc_device *ldev, struct 
>> drm_printer *p)
>> +{
>> +    unsigned int buffer_size = 1920 * 1080 * 4;
>> +    unsigned int iteration = 60;
>> +
>> +    lsdc_benchmark_copy(ldev,
>> +                buffer_size,
>> +                iteration,
>> +                LSDC_GEM_DOMAIN_GTT,
>> +                LSDC_GEM_DOMAIN_GTT,
>> +                lsdc_copy_gtt_to_gtt_cpu,
>> +                p);
>> +
>> +    lsdc_benchmark_copy(ldev,
>> +                buffer_size,
>> +                iteration,
>> +                LSDC_GEM_DOMAIN_GTT,
>> +                LSDC_GEM_DOMAIN_VRAM,
>> +                lsdc_copy_gtt_to_vram_cpu,
>> +                p);
>> +
>> +    lsdc_benchmark_copy(ldev,
>> +                buffer_size,
>> +                iteration,
>> +                LSDC_GEM_DOMAIN_VRAM,
>> +                LSDC_GEM_DOMAIN_GTT,
>> +                lsdc_copy_vram_to_gtt_cpu,
>> +                p);
>> +
>> +    return 0;
>> +}
>> diff --git a/drivers/gpu/drm/loongson/lsdc_benchmark.h 
>> b/drivers/gpu/drm/loongson/lsdc_benchmark.h
>> new file mode 100644
>> index 000000000000..2bf9406eae9c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/lsdc_benchmark.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>> + */
>> +
>> +#ifndef __LSDC_BENCHMARK_H__
>> +#define __LSDC_BENCHMARK_H__
>> +
>> +#include "lsdc_drv.h"
>> +
>> +int lsdc_show_benchmark_copy(struct lsdc_device *ldev, struct 
>> drm_printer *p);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/loongson/lsdc_crtc.c 
>> b/drivers/gpu/drm/loongson/lsdc_crtc.c
>> new file mode 100644
>> index 000000000000..de2c1d514baa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/lsdc_crtc.c
>> @@ -0,0 +1,1066 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2023 Loongson Technology Corporation Limited
>> + */
>> +
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_atomic.h>
>> +#include <drm/drm_atomic_helper.h>
>> +#include <drm/drm_debugfs.h>
>> +#include <drm/drm_vblank.h>
>> +
>> +#include "lsdc_drv.h"
>> +
>> +/*
>> + * The soft reset cause the vblank counter reset to zero, but the 
>> address
>> + * and other settings in the crtc register remains.
>> + */
>> +
>> +static void lsdc_crtc0_soft_reset(struct lsdc_crtc *lcrtc)
>> +{
>> +    struct lsdc_device *ldev = lcrtc->ldev;
>> +    u32 val;
>> +
>> +    val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>> +
>> +    val &= CFG_VALID_BITS_MASK;
>> +
>> +    /* soft reset bit, active low */
>> +    val &= ~CFG_RESET_N;
>> +
>> +    val &= ~CFG_PIX_FMT_MASK;
>> +
>> +    lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>> +
>> +    udelay(5);
>> +
>> +    val |= CFG_RESET_N | LSDC_PF_XRGB8888 | CFG_OUTPUT_ENABLE;
>> +
>> +    lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>> +
>> +    mdelay(20);
>> +}
>> +
>> +static void lsdc_crtc1_soft_reset(struct lsdc_crtc *lcrtc)
>> +{
>> +    struct lsdc_device *ldev = lcrtc->ldev;
>> +    u32 val;
>> +
>> +    val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>> +
>> +    val &= CFG_VALID_BITS_MASK;
>> +
>> +    /* soft reset bit, active low */
>> +    val &= ~CFG_RESET_N;
>> +
>> +    val &= ~CFG_PIX_FMT_MASK;
>> +
>> +    lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>> +
>> +    udelay(5);
>> +
>> +    val |= CFG_RESET_N | LSDC_PF_XRGB8888 | CFG_OUTPUT_ENABLE;
>> +
>> +    lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>> +
>> +    msleep(20);
>
> So many magic sleeps without documentation?
>
It is just that you should wait the device for a while before it can 
reaction when doing the soft reset.

I think this is engineering...

>> +}
>> +
>> +static void lsdc_crtc0_enable(struct lsdc_crtc *lcrtc)
>> +{
>> +    struct lsdc_device *ldev = lcrtc->ldev;
>> +    u32 val;
>> +
>> +    val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>> +
>> +    /*
>> +     * This may happens on extremely rare case, luckily, a soft reset
>
> "may happen on extremely rare cases;"
>
>> +     * can helps to bring it back to normal. We add a warn here, hope
>
> "can help bringing it back to normal. We issue a warning here, hoping to"
>
>> +     * to catch something if it happens.
>> +     */
>> +
>> +    if (val & CRTC_ANCHORED) {
>> +        drm_warn(&ldev->base, "%s anchored\n", lcrtc->base.name);
>> +        return lsdc_crtc0_soft_reset(lcrtc);
>> +    }
>> +
>> +    lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val | CFG_OUTPUT_ENABLE);
>> +}
>> +
>> +static void lsdc_crtc0_disable(struct lsdc_crtc *lcrtc)
>> +{
>> +    struct lsdc_device *ldev = lcrtc->ldev;
>> +
>> +    lsdc_ureg32_clr(ldev, LSDC_CRTC0_CFG_REG, CFG_OUTPUT_ENABLE);
>> +
>> +    udelay(9);
>> +}
>> +
>> +static void lsdc_crtc1_enable(struct lsdc_crtc *lcrtc)
>> +{
>> +    struct lsdc_device *ldev = lcrtc->ldev;
>> +    u32 val;
>> +
>> +    val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>> +    if (val & CRTC_ANCHORED) {
>> +        drm_warn(&ldev->base, "%s anchored\n", lcrtc->base.name);
>> +        return lsdc_crtc1_soft_reset(lcrtc);
>> +    }
>
> Duplication of code? You may want to duplicate the comment here too as 
> de-duplication with macro seems too heavy here.
>
>> +
>> +    lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val | CFG_OUTPUT_ENABLE);
>> +}
>> +
>> +static void lsdc_crtc1_disable(struct lsdc_crtc *lcrtc)
>> +{
>> +    struct lsdc_device *ldev = lcrtc->ldev;
>> +
>> +    lsdc_ureg32_clr(ldev, LSDC_CRTC1_CFG_REG, CFG_OUTPUT_ENABLE);
>> +
>> +    udelay(9);
>> +}
>> +
>> +/* All loongson display controller support scanout position hardware */
>
> Commit message implies only 7A2000+ LSDC IPs have the "scanout 
> position recorders". Either that part or this code would need tweaking... 

Both LS7A2000 and LS7A1000 have the scanout position recorders hardware.

Preciously, datasheet of LS7A1000 didn't told us if it support this feature.

I will adjust the commit message at next version, the code doesn't need 
change.

