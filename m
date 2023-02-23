Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 353066A06C9
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 11:57:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0BDA10E07A;
	Thu, 23 Feb 2023 10:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756C510E050
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 10:57:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id i9so13121471lfc.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 02:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iNsJnNi4tQAmsGwW+q1OqWLArqBuTP1cMNC+9b4NfnI=;
 b=nrDEDI9bjQmfAPx99TdL9/vjL9LkZT5FVI6ZuGRKXFkpYPE/BpLXaX9c6R5DNdNsAg
 5+z4kjxKurlJF14HdP19JZPMUOuaRb00pTeYWFUkydGIq2WruuuVaSGbdTtQiSeLpPgJ
 TVBhsADYoEs1Xd6ZzXAcZBn3bRnbxJvRfYNIhO9sN7dCXP59q1Bt7oQ5oz9bJCTVVPvu
 iMbMkAj6OCm6BYyDchB0wEiRSzfpYGdtaGGsmafP9lRW6a2ezfrh70+7lkydCdNijlW+
 KYeiI/YxvbtPH7wDK/mXQwowalmhrABMFbV0xzPsvfbsr0Vcz9/tFBT5EAnfc+etZdRX
 KLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iNsJnNi4tQAmsGwW+q1OqWLArqBuTP1cMNC+9b4NfnI=;
 b=PAq0jX90CotqVoUlesjVqZ9ywL4qhARtP7XPW5IqEgSRWP507Z/ybBvaCde74yX+5P
 GJJ7Jl89nmV1Vsrvx20zpKCEic2mC/K6d3tiQz/H5LLx6T7TYCHgk6X5CBoRKw8/0tT2
 Cr8eq1tLmQQb20tSKawYc6TxOM7pG1KiODTmGraBHgWXtk9oY8R8x1hQ813ssqLAHJ6l
 hzIIAa5n0fcue681hjYYjYimTpheSA8DZhOV7ML+Sj2QXEG8MjcxRozTOEMurKCQnb3N
 /8oxFhrJ6/4q2LRcu9834CuoLSU5IG73My9SPIUWKkKaZQd0pMcNdCqnI9+2Smx3Izhm
 7wrQ==
X-Gm-Message-State: AO0yUKUm/mFJ8T0d1c5gF03AX8YECKyR+tRAiNRB+wsG3826iQWyttXR
 vrddop3WCik47Lymy/F8GCeNRA==
X-Google-Smtp-Source: AK7set+Lm2M9zeWUPnoxqLMsCQ2WdYnqmybzTdPWjKysTUTDm2RnToX7FlbyGiUd5U52kjMCCtWTlg==
X-Received: by 2002:ac2:5974:0:b0:4db:25f2:c116 with SMTP id
 h20-20020ac25974000000b004db25f2c116mr3794945lfp.18.1677149829689; 
 Thu, 23 Feb 2023 02:57:09 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 12-20020ac2482c000000b004cc548b35fbsm421967lft.71.2023.02.23.02.57.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 02:57:09 -0800 (PST)
Message-ID: <0efb141d-aab6-a13f-8cd7-0de0deae9af2@linaro.org>
Date: Thu, 23 Feb 2023 11:57:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: drm/msm/dpu: fix stack smashing in dpu_hw_ctl_setup_blendstage
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230223095708.3688148-1-dmitry.baryshkov@linaro.org>
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
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 23.02.2023 10:57, Dmitry Baryshkov wrote:
> The rewritten dpu_hw_ctl_setup_blendstage() can lightly smash the stack
> when setting the SSPP_NONE pipe. However it was unnoticed until the
> kernel was tested under AOSP (with some kind of stack protection/check).
> 
> This fixes the following backtrace:
> 
> Unexpected kernel BRK exception at EL1
> Internal error: BRK handler: 00000000f20003e8 [#1] PREEMPT SMP
> Hardware name: Thundercomm Dragonboard 845c (DT)
> pstate: a0400005 (NzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> pc : dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
> lr : _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
> sp : ffffffc00bdcb720
> x29: ffffffc00bdcb720 x28: ffffff8085debac0 x27: 0000000000000002
> x26: ffffffd74af18320 x25: ffffff8083af75a0 x24: ffffffc00bdcb878
> x23: 0000000000000001 x22: 0000000000000000 x21: ffffff8085a70000
> x20: ffffff8083012dc0 x19: 0000000000000001 x18: 0000000000000000
> x17: 000000040044ffff x16: 045000f4b5593519 x15: 0000000000000000
> x14: 000000000000000b x13: 0000000000000001 x12: 0000000000000000
> x11: 0000000000000001 x10: ffffffc00bdcb764 x9 : ffffffd74af06a08
> x8 : 0000000000000001 x7 : 0000000000000001 x6 : 0000000000000000
> x5 : ffffffc00bdcb878 x4 : 0000000000000002 x3 : ffffffffffffffff
> x2 : ffffffc00bdcb878 x1 : 0000000000000000 x0 : 0000000000000002
> Call trace:
>  dpu_hw_ctl_setup_blendstage+0x26c/0x278 [msm]
>  _dpu_crtc_blend_setup+0x4b4/0x5a0 [msm]
>  dpu_crtc_atomic_begin+0xd8/0x22c [msm]
>  drm_atomic_helper_commit_planes+0x80/0x208 [drm_kms_helper]
>  msm_atomic_commit_tail+0x134/0x6f0 [msm]
>  commit_tail+0xa4/0x1a4 [drm_kms_helper]
>  drm_atomic_helper_commit+0x170/0x184 [drm_kms_helper]
>  drm_atomic_commit+0xac/0xe8
>  drm_mode_atomic_ioctl+0xbf0/0xdac
>  drm_ioctl_kernel+0xc4/0x178
>  drm_ioctl+0x2c8/0x608
>  __arm64_sys_ioctl+0xa8/0xec
>  invoke_syscall+0x44/0x104
>  el0_svc_common.constprop.0+0x44/0xec
>  do_el0_svc+0x38/0x98
>  el0_svc+0x2c/0xb4
>  el0t_64_sync_handler+0xb8/0xbc
>  el0t_64_sync+0x1a0/0x1a4
> Code: 52800016 52800017 52800018 17ffffc7 (d4207d00)
> 
> Fixes: 4488f71f6373 ("drm/msm/dpu: simplify blend configuration")
> Reported-by: Amit Pundir <amit.pundir@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index b88a2f3724e6..6c53ea560ffa 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -446,7 +446,9 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>  			 * CTL_LAYER has 3-bit field (and extra bits in EXT register),
>  			 * all EXT registers has 4-bit fields.
>  			 */
> -			if (cfg->idx == 0) {
> +			if (cfg->idx == -1) {
if (cfg->idx == ctl_blend_config[SSPP_NONE][0].idx)?

Konrad
> +				continue;
> +			} else if (cfg->idx == 0) {
>  				mixercfg[0] |= mix << cfg->shift;
>  				mixercfg[1] |= ext << cfg->ext_shift;
>  			} else {
> 
