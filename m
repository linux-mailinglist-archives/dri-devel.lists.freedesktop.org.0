Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A906DD500
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 10:18:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30EEC10E4D9;
	Tue, 11 Apr 2023 08:18:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id A651310E4D9
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:18:39 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:42666.1367120225
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id DCF741002F3;
 Tue, 11 Apr 2023 16:18:34 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-bkw2h with ESMTP id
 586403049fb9408e95ab8dae31b91955 for emil.l.velikov@gmail.com; 
 Tue, 11 Apr 2023 16:18:36 CST
X-Transaction-ID: 586403049fb9408e95ab8dae31b91955
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <8c115006-3c06-c063-1381-d82d744871b4@189.cn>
Date: Tue, 11 Apr 2023 16:18:34 +0800
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
>> +       val = lsdc_crtc_rreg32(ldev, LSDC_CRTC0_CFG_REG, index);
>> +       /* clear old dma step settings */
>> +       val &= ~CFG_DMA_STEP_MASK;
>> +
>> +       if (descp->chip == CHIP_LS7A2000) {
>> +               /*
>> +                * Using large dma step as much as possible,
>> +                * for improve hardware DMA efficiency.
>> +                */
>> +               if (width_in_bytes % 256 == 0)
>> +                       val |= LSDC_DMA_STEP_256_BYTES;
>> +               else if (width_in_bytes % 128 == 0)
>> +                       val |= LSDC_DMA_STEP_128_BYTES;
>> +               else if (width_in_bytes % 64 == 0)
>> +                       val |= LSDC_DMA_STEP_64_BYTES;
>> +               else  /* width_in_bytes % 32 == 0 */
>> +                       val |= LSDC_DMA_STEP_32_BYTES;
>> +       }
>> +
>> +       clk_func->update(pixpll, &priv_state->pparms);
>> +
> Without knowing the hardware, the clk_func abstraction seems quite
> arbitrary and unnecessary. It should be introduced when there is a
> use-case for it.
>
>
The clk_func is necessary,  clk_func->update() will eventually call 
ls7a1000_pixpll_param_update()

to generate pixel clock frequency required by the display device.  There 
is a abstract because different

bridges chip/SoC variants has the different register to operate, either 
because the register offset changed

or the arrangement  of specific bits field changed.


For the point view of the hardware, the PLL hardware belong to the 
bridge chip.

There is a clock tree which wrangler all of the PLL hardware, sub-device 
may partially share the hardware PLL.


The abstraction is used to suppress hardware variants which may change over time.

For ls7a1000, there is user manual document about the clock tree and PLL, see[1][2][3]


[1] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN#description-of-clock-function
[2] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN#section-pll-pix-0-configuration-register
[3] https://loongson.github.io/LoongArch-Documentation/Loongson-7A1000-usermanual-EN#configuration-method-of-pll

