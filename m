Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3706A07E3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 12:59:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B08810E4AB;
	Thu, 23 Feb 2023 11:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B702410E4AB
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 11:59:27 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id bp25so13622614lfb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 03:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=B93wsB1l9qY0N90QLXSCpfHlfEl75dltZ1dpu1AyXIc=;
 b=BTknnurIdxcVGaOW1Jw6/ADLAcw8vYm6BIHSxIQjTyJOXUSzKdwK+BqtmxRUDIbYlT
 /I2P7QAzjoFza4Sgmk1VC96bCJucql6GpINeRkLafuvyRh5z8gOlcVlU0/KUaKZ06fnn
 XhYPFl1lLyCPplb44NKVb/Wkupb/w4rt50WGi/zMtDytza8PRTA2hkgoLiuUmKymhafv
 iMLBPKBAidPRFV1XwB5tOAXj9gecW2veok6VQsXO97I5HYEAvzVGlBdd2uk/Huw44fBL
 9Op2ycgIUCXo8q+gqx7ItAct66zHadj69cBGjSbEV2RNEb+KW5pC3Q2l/IlpMmYdC5/Z
 pxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=B93wsB1l9qY0N90QLXSCpfHlfEl75dltZ1dpu1AyXIc=;
 b=AgoreXLVnk54TWxzLicKb0LmOqIlRDBmiELtq8iDofyNp+KYUufRrz/Yp9+7EO8luF
 HGk/DsLzdGH8jzEl47RgLR92eKyErhTZNtjqPYFr/3Jh5vdPQmVNGULj+WBhjSmUb0iM
 mWckU1efEPwuFkc94RVWE0CMWjFveTZlWFlGctru3rXEbL89qKIARLmtWW9NbjIZa2+O
 UF+caMrYWkY3Er4700JKJImSe2ybLRJAoJuPbYaQRbZe6sPVo4IO0wbAHA1OmPj1ivCH
 rr93LJLyj5/IxwM7sGjgB2h6rz1QRbZj7b/hrIG/YuwDHD0o/WPE/gSH0gUk1GeWiOWN
 QCwA==
X-Gm-Message-State: AO0yUKWhbQiRMlvqiquMBmMf4o9oHkHm9HB53/ZSMwYYmjUm4uPD8PLX
 YdFzRY5e+SLFRYQkk7ttK5ZhSA==
X-Google-Smtp-Source: AK7set8XO7BZ5vRLCeWvBnDFeC2kPfIBNJHkUHd5MiM/eSc9ClZaaF1eHzHcusSwDsYaZ2YejhxzXQ==
X-Received: by 2002:a05:6512:40f:b0:4dd:a019:d845 with SMTP id
 u15-20020a056512040f00b004dda019d845mr1350673lfk.18.1677153565927; 
 Thu, 23 Feb 2023 03:59:25 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a056512391200b004cf6c56fdb5sm824768lfu.232.2023.02.23.03.59.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 03:59:25 -0800 (PST)
Message-ID: <8766beba-ed03-0a3e-9d1b-686bb6912da9@linaro.org>
Date: Thu, 23 Feb 2023 12:59:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
 <0efb141d-aab6-a13f-8cd7-0de0deae9af2@linaro.org>
 <CAA8EJpo2Vp-n_kBTT-vfaGAE4jO58=NCh0MpMhTEjL3GonxWsg@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpo2Vp-n_kBTT-vfaGAE4jO58=NCh0MpMhTEjL3GonxWsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Amit Pundir <amit.pundir@linaro.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.02.2023 12:53, Dmitry Baryshkov wrote:
> On Thu, 23 Feb 2023 at 12:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 23.02.2023 10:57, Dmitry Baryshkov wrote:
>>> The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
>>> when setting the SSPP_NONE pipe. However it was unnoticed until the
>>> kernel was tested under AOSP (with some kind of stack protection/check).
>>>
>>> This fixes the following backtrace:
>>>
>>> Unexpected kernel BRK exception at EL1
>>> Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
>>> Hardware name: Thundercomm Dragonboard 845c (DT)
>>> pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>>> pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
>>> lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
>>> sp : ffffffc00bdcb720
>>> x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
>>> x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
>>> x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
>>> x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
>>> x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
>>> x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
>>> x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
>>> x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
>>> x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
>>> x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
>>> Call trace:
>>>  dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
>>>  _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
>>>  dpu_crtc_atomic_begin+0xd8/0x22c [msm]
>>>  drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
>>>  msm_atomic_commit_tail+0x134/0x6f0 [msm]
>>>  commit_tail+0xa4/0x1a4 [drm_kms_helper]
>>>  drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
>>>  drm_atomic_commit+0xac/0xe8
>>>  drm_mode_atomic_ioctl+0xbf0/0xdac
>>>  drm_ioctl_kernel+0xc4/0x178
>>>  drm_ioctl+0x2c8/0x608
>>>  __arm64_sys_ioctl+0xa8/0xec
>>>  invoke_syscall+0x44/0x104
>>>  el0_svc_common.constprop.0+0x44/0xec
>>>  do_el0_svc+0x38/0x98
>>>  el0_svc+0x2c/0xb4
>>>  el0t_64_sync_handler+0xb8/0xbc
>>>  el0t_64_sync+0x1a0/0x1a4
>>> Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)
>>>
>>> Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
>>> Reported-by: Amit Pundir <amit.pundir@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> index b88a2f3724e6..6c53ea560ffa 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
>>> @@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>>>                        * CTL_LAYER has 3-bit field (and extra bits in EXT register),
>>>                        * all EXT registers has 4-bit fields.
>>>                        */
>>> -                     if (cfg->idx == 0) {
>>> +                     if (cfg->idx == -1) {
>> if (cfg->idx == ctl_blend_config[SSPP_NONE][0].idx)?
> 
> Why? -1 is simpler and more obvious (and doesn't bind it only to SSPP_NONE).
Obvious enough to the point of requiring a Fixes? :P

But I see your point, it's probably better to leave it as -1
due to its ambiguity.

Konrad
> 
>>
>> Konrad
>>> +                             continue;
>>> +                     } else if (cfg->idx == 0) {
>>>                               mixercfg[0] |= mix << cfg->shift;
>>>                               mixercfg[1] |= ext << cfg->ext_shift;
>>>                       } else {
>>>
> 
> 
> 
