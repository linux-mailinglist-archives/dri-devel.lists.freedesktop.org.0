Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FE470D6D6
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 10:14:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA09F10E028;
	Tue, 23 May 2023 08:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailbox.box.xen0n.name (mail.xen0n.name [115.28.160.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D9D910E282
 for <dri-devel@lists.freedesktop.org>; Mon, 22 May 2023 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1684746332; bh=BvafpoMALSkBY+N8iyu1yI8+hZDb+7ttS5xnPbBUstI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AwmSSYYozspEZwRyLCQRnSMqjHss6FwHp3xYrfmKjSu/L4Bp17OT38n8gVW7qJiN4
 CIoFpp+bBZXn4w4KSGjMKkp3fQ/8xc6dqdLw9gMMfVCuOGv76RLKKICf/2qjlxIxAp
 iVpkubxEQYDK8hUtGbLFQTx/CkddvAp+/mBgGDcI=
Received: from [100.100.57.122] (unknown [58.34.185.106])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 8E4F6600A6;
 Mon, 22 May 2023 17:05:31 +0800 (CST)
Message-ID: <588a03c7-ae1f-f449-752d-aa94cc1ab491@xen0n.name>
Date: Mon, 22 May 2023 17:05:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.0
Subject: Re: [PATCH v14 1/2] drm: add kms driver for loongson display
 controller
Content-Language: en-US
To: Sui Jingfeng <15330273260@189.cn>,
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
 <2f701944-588c-3f56-06f3-abcbbf12be1e@189.cn>
From: WANG Xuerui <kernel@xen0n.name>
In-Reply-To: <2f701944-588c-3f56-06f3-abcbbf12be1e@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 23 May 2023 08:13:57 +0000
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

On 2023/5/22 16:51, Sui Jingfeng wrote:
> Hi,
> 
> On 2023/5/21 20:21, WANG Xuerui wrote:
>>
>>> <snip>
>>> +
>>> +static void lsdc_crtc0_soft_reset(struct lsdc_crtc *lcrtc)
>>> +{
>>> +    struct lsdc_device *ldev = lcrtc->ldev;
>>> +    u32 val;
>>> +
>>> +    val = lsdc_rreg32(ldev, LSDC_CRTC0_CFG_REG);
>>> +
>>> +    val &= CFG_VALID_BITS_MASK;
>>> +
>>> +    /* soft reset bit, active low */
>>> +    val &= ~CFG_RESET_N;
>>> +
>>> +    val &= ~CFG_PIX_FMT_MASK;
>>> +
>>> +    lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>>> +
>>> +    udelay(5);
>>> +
>>> +    val |= CFG_RESET_N | LSDC_PF_XRGB8888 | CFG_OUTPUT_ENABLE;
>>> +
>>> +    lsdc_wreg32(ldev, LSDC_CRTC0_CFG_REG, val);
>>> +
>>> +    mdelay(20);
>>> +}
>>> +
>>> +static void lsdc_crtc1_soft_reset(struct lsdc_crtc *lcrtc)
>>> +{
>>> +    struct lsdc_device *ldev = lcrtc->ldev;
>>> +    u32 val;
>>> +
>>> +    val = lsdc_rreg32(ldev, LSDC_CRTC1_CFG_REG);
>>> +
>>> +    val &= CFG_VALID_BITS_MASK;
>>> +
>>> +    /* soft reset bit, active low */
>>> +    val &= ~CFG_RESET_N;
>>> +
>>> +    val &= ~CFG_PIX_FMT_MASK;
>>> +
>>> +    lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>>> +
>>> +    udelay(5);
>>> +
>>> +    val |= CFG_RESET_N | LSDC_PF_XRGB8888 | CFG_OUTPUT_ENABLE;
>>> +
>>> +    lsdc_wreg32(ldev, LSDC_CRTC1_CFG_REG, val);
>>> +
>>> +    msleep(20);
>>
>> So many magic sleeps without documentation?
>>
> It is just that you should wait the device for a while before it can 
> reaction when doing the soft reset.
> 
> I think this is engineering...

As an engineer myself, I fully concur with this, but I mainly wanted 
some explanation as to "why 5 there? why 20 here? why 9 there?" -- where 
did all the discrete values come from, implied by HDL or found out by 
experimentations? Can these be extracted to properly named constants? 
Can some of the values get coalesced into one without harming 
functionality? Can some of them get shorter? -- questions like this.

> <snip>
>>> +
>>> +/* All loongson display controller support scanout position hardware */
>>
>> Commit message implies only 7A2000+ LSDC IPs have the "scanout 
>> position recorders". Either that part or this code would need tweaking... 
> 
> Both LS7A2000 and LS7A1000 have the scanout position recorders hardware.
> 
> Preciously, datasheet of LS7A1000 didn't told us if it support this 
> feature.
> 
> I will adjust the commit message at next version, the code doesn't need 
> change.

That's fine, the intent is always making the code more approachable and 
maintainable. Thanks.

-- 
WANG "xen0n" Xuerui

Linux/LoongArch mailing list: https://lore.kernel.org/loongarch/

