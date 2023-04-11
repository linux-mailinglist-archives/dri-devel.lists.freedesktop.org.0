Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D04156DDA92
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 14:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 004FC10E0F3;
	Tue, 11 Apr 2023 12:15:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9420410E0F3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 12:15:56 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:43318.1095697603
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id 7164810020E;
 Tue, 11 Apr 2023 20:15:51 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-ljp89 with ESMTP id
 c863400433aa4172ade34a0a231e4e5e for emil.l.velikov@gmail.com; 
 Tue, 11 Apr 2023 20:15:53 CST
X-Transaction-ID: c863400433aa4172ade34a0a231e4e5e
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <ee115204-880e-f1c1-a9d3-0ad0875f748e@189.cn>
Date: Tue, 11 Apr 2023 20:15:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v10 2/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20230403171304.2157326-1-suijingfeng@loongson.cn>
 <20230403171304.2157326-3-suijingfeng@loongson.cn>
 <CACvgo53h+X26wngVmxpn3oVb9kbJezTHx61p3rZDR7sw1AQrWQ@mail.gmail.com>
From: Sui Jingfeng <15330273260@189.cn>
In-Reply-To: <CACvgo53h+X26wngVmxpn3oVb9kbJezTHx61p3rZDR7sw1AQrWQ@mail.gmail.com>
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
Cc: nathan@kernel.org, loongson-kernel@lists.loongnix.cn,
 Thomas Zimmermann <tzimmermann@suse.de>, Li Yi <liyi@loongson.cn>,
 linux-kernel@vger.kernel.org, Christian Koenig <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2023/4/4 22:10, Emil Velikov wrote:
>> +++ b/drivers/gpu/drm/loongson/lsdc_drv.h
>> @@ -0,0 +1,324 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2022 Loongson Corporation
>> + *
> We're in 2023, update the year across the files?
>
OK, it just that we started to upstream this driver since 2022.
>> +struct lsdc_gem {
>> +       /* @mutex: protect objects list */
>> +       struct mutex mutex;
>> +       struct list_head objects;
>> +};
>> +
>> +struct lsdc_device {
>> +       struct drm_device base;
>> +       struct ttm_device bdev;
>> +
>> +       /* @descp: features description of the DC variant */
>> +       const struct lsdc_desc *descp;
>> +
>> +       struct pci_dev *gpu;
>> +
>> +       /* @reglock: protects concurrent access */
>> +       spinlock_t reglock;
>> +       void __iomem *reg_base;
>> +       resource_size_t vram_base;
>> +       resource_size_t vram_size;
>> +
>> +       resource_size_t gtt_size;
>> +
>> +       struct lsdc_display_pipe dispipe[LSDC_NUM_CRTC];
>> +
>> +       struct lsdc_gem gem;
>> +
> Last time I looked there was no other driver with a list of gem
> objects (and a mutex) in its device struct. Are you sure we need this?

Sure, this is absolutely necessary.

Without this I can't see how much buffer object has been created.

where they are(SYETEM, GTT or VRAM) and how much size it the buffer is.

When sharing buffer with other driver,   cat /sys/kernel/debug/dri/0/bos

can be used to see that the shared buffer is pinned in the GTT.

> Very few drivers use TTM directly and I think you want to use
> drm_gem_vram_helper or drm_gem_ttm_helper instead.

We love you reviews,  yet...

yet using the TTM is pretty good.

drm_gem_vram_helper is also good for beginners.

We can explicitly specify where to put the bo with TTM,

We also need this to implement the S3 properly.

Thomas also recommend us switch to TTM.

>> +static int ls7a1000_pixpll_param_update(struct lsdc_pll * const this,
>> +                                       struct lsdc_pll_parms const *pin)
>> +{
>> +       void __iomem *reg = this->mmio;
>> +       unsigned int counter = 0;
>> +       bool locked;
>> +       u32 val;
>> +
>> +       /* Bypass the software configured PLL, using refclk directly */
>> +       val = readl(reg + 0x4);
>> +       val &= ~(1 << 8);
>> +       writel(val, reg + 0x4);
>> +
> There are a lot of magic numbers in this function. Let's define them
> properly in the header.
>
Ok, I  will improve this function at the next version.
>> +/* Helpers for chip detection */
>> +bool lsdc_is_ls2k2000(void);
>> +bool lsdc_is_ls2k1000(void);
>> +unsigned int loongson_cpu_get_prid(u8 *impl, u8 *rev);
> Since this revision does pci_devices only, we don't need this detection right?

No, we need it.

In order to get a fine control, we need to know what the host is.

