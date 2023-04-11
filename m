Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 815646DD5E3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 10:49:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E6310E0F8;
	Tue, 11 Apr 2023 08:49:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id CD9C310E0F8
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 08:49:25 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.41:52050.376874080
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.41])
 by 189.cn (HERMES) with SMTP id BEB57100208;
 Tue, 11 Apr 2023 16:49:20 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-ljp89 with ESMTP id
 1b31214f715b4affa0bb41c4bfa92964 for emil.l.velikov@gmail.com; 
 Tue, 11 Apr 2023 16:49:23 CST
X-Transaction-ID: 1b31214f715b4affa0bb41c4bfa92964
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <2f024efb-3e9f-8777-9f32-ca1f0e436b40@189.cn>
Date: Tue, 11 Apr 2023 16:49:19 +0800
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
>> --- /dev/null
>> +++ b/drivers/gpu/drm/loongson/lsdc_drv.c
>> +static const struct lsdc_desc dc_in_ls7a1000 = {
>> +       .chip = CHIP_LS7A1000,
>> +       .num_of_crtc = LSDC_NUM_CRTC,
>> +       .max_pixel_clk = 200000,
>> +       .max_width = 2048,
>> +       .max_height = 2048,
>> +       .num_of_hw_cursor = 1,
>> +       .hw_cursor_w = 32,
>> +       .hw_cursor_h = 32,
>> +       .pitch_align = 256,
>> +       .mc_bits = 40,
>> +       .has_vblank_counter = false,
>> +       .has_scan_pos = true,
>> +       .has_builtin_i2c = true,
>> +       .has_vram = true,
>> +       .has_hpd_reg = false,
>> +       .is_soc = false,
>> +};
>> +
>> +static const struct lsdc_desc dc_in_ls7a2000 = {
>> +       .chip = CHIP_LS7A2000,
>> +       .num_of_crtc = LSDC_NUM_CRTC,
>> +       .max_pixel_clk = 350000,
>> +       .max_width = 4096,
>> +       .max_height = 4096,
>> +       .num_of_hw_cursor = 2,
>> +       .hw_cursor_w = 64,
>> +       .hw_cursor_h = 64,
>> +       .pitch_align = 64,
>> +       .mc_bits = 40, /* support 48, but use 40 for backward compatibility */
>> +       .has_vblank_counter = true,
>> +       .has_scan_pos = true,
>> +       .has_builtin_i2c = true,
>> +       .has_vram = true,
>> +       .has_hpd_reg = true,
>> +       .is_soc = false,
>> +};
>> +
> Roughly a quarter of the above are identical. It might be better to
> drop them for now and re-introduce as needed with future code.
>
My initial intent here is to give a skeleton of our hardware features to 
reviewers,

Not only for gearing the control, but also for easier the reviewing process.

Without this, other part of this patch may looks questionable again.


We  could remove all of the features look up key in the struct lsdc_desc,

leave the .chip member there only.  Hard coded everything else according 
to the chip only.

But the code looks ugly by doing that way. We want weaken the

If loongson SoC is introduced, the identical will decrease.

It's OK,  I could drop as much as possible at next version.

>> +const char *chip_to_str(enum loongson_chip_family chip)
>> +{
>> +       if (chip == CHIP_LS7A2000)
>> +               return "LS7A2000";
>> +
>> +       if (chip == CHIP_LS7A1000)
>> +               return "LS7A1000";
>> +
> If it were me, I would add the name into the lsdc_desc.
>
Agree, this is acceptable. Will be changed at the next version.
