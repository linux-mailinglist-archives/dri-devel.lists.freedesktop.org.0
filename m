Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 337D06DD1DD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Apr 2023 07:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8733110E4AD;
	Tue, 11 Apr 2023 05:39:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.101])
 by gabe.freedesktop.org (Postfix) with ESMTP id C2FE910E4AD
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Apr 2023 05:39:14 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:59606.589911955
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 6BC8C1002F6;
 Tue, 11 Apr 2023 13:39:08 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 f7efde40c6bc459b9f649b6547f1e147 for emil.l.velikov@gmail.com; 
 Tue, 11 Apr 2023 13:39:11 CST
X-Transaction-ID: f7efde40c6bc459b9f649b6547f1e147
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
Message-ID: <c29da6cf-98be-42fc-c415-28732f6b6b1f@189.cn>
Date: Tue, 11 Apr 2023 13:39:07 +0800
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
>> +static void lsdc_crtc_reset(struct drm_crtc *crtc)
>> +{
>> +       struct lsdc_display_pipe *dispipe = crtc_to_display_pipe(crtc);
>> +       struct drm_device *ddev = crtc->dev;
>> +       struct lsdc_device *ldev = to_lsdc(ddev);
>> +       struct lsdc_crtc_state *priv_crtc_state;
>> +       unsigned int index = dispipe->index;
>> +       u32 val;
>> +
>> +       val = LSDC_PF_XRGB8888 | CFG_RESET_N;
>> +       if (ldev->descp->chip == CHIP_LS7A2000)
>> +               val |= LSDC_DMA_STEP_64_BYTES;
>> +
>> +       lsdc_crtc_wreg32(ldev, LSDC_CRTC0_CFG_REG, index, val);
>> +
>> +       if (ldev->descp->chip == CHIP_LS7A2000) {
>> +               val = PHY_CLOCK_EN | PHY_DATA_EN;
>> +               lsdc_crtc_wreg32(ldev, LSDC_CRTC0_PANEL_CONF_REG, index, val);
>> +       }
>> +
> AFAICT no other driver touches the HW in their reset callback. Should
> the above be moved to another callback?
>
You may correct in the 95% of all cases.

After reading the comments of the reset callback of struct 
drm_crtc_funcs in drm_crtc.h,

It seems that it does not prohibit us to touches the hardware.

I copy that comments and paste into here for easier to read,as below:


     /*
      * @reset:
      *
      * Reset CRTC hardware and software state to off. This function isn't
      * called by the core directly, only through drm_mode_config_reset().
      * It's not a helper hook only for historical reasons.
      *
      * Atomic drivers can use drm_atomic_helper_crtc_reset() to reset
      * atomic state using this hook.
      */


It seem allowable to reset CRTC hardware in this callback, did it cue us?

What we know is that this reset callback (and others, such as encoder's 
reset)

is called by drm_mode_config_reset(). It is the first set of functions 
get called

before other hardware related callbacks.


I don't not see how other drivers implement this callback, after you 
mention this

I skim over a few, I found tilcdc also writing the hardware in their 
tilcdc_crtc_reset()

function. See it in drm/tildc/tilclc_crtc.c


In addition, Loongson platform support efifb,  in order to light up the 
monitor in

firmware stage and the booting stage, the firmware touch the display 
hardware

register directly. After efifb get kick out, when drm/loongson driver 
taken over the

hardware, the register setting state still remain in the hardware 
register. Those

register setting may no longer correct for the subsequent operationd. 
What we

doing here is to giving the hardware a basic healthy state prepare to be 
update

further. As the reset callback is call very early, we found that it's 
the best fit.

The reset will also get called when resume(S3).


The problem is that we don't find a good to place to move those setting 
currently.

