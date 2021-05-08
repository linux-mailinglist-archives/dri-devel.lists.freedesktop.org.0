Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7663770A0
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 10:18:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF5C6E866;
	Sat,  8 May 2021 08:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB106E09A;
 Sat,  8 May 2021 08:17:54 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fcg9H4vlNz1BGnC;
 Sat,  8 May 2021 16:15:15 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.498.0; Sat, 8 May 2021
 16:17:50 +0800
Subject: Re: [PATCH 1/1] drm/msm/dpu: Fix error return code in dpu_mdss_init()
To: Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 "David Airlie" <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>, Sean Paul
 <sean@poorly.run>, dri-devel <dri-devel@lists.freedesktop.org>, freedreno
 <freedreno@lists.freedesktop.org>, linux-arm-msm
 <linux-arm-msm@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>
References: <20210508024254.1877-1-thunder.leizhen@huawei.com>
 <CAE-0n51owL8RGJyz_5BUCTjrUW5m0X-DTKUx=mqRL=-4i-tMDA@mail.gmail.com>
 <4f6ab4db-958d-c2c5-7879-aa9a0d3b87ae@huawei.com>
 <CAE-0n51bPtbw4gx4EOTd2wNq6gcH9yCuR_e8kqBo0-+7unUz5A@mail.gmail.com>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <bba9f2f4-19cd-018a-2233-dc51ffb1d85b@huawei.com>
Date: Sat, 8 May 2021 16:17:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAE-0n51bPtbw4gx4EOTd2wNq6gcH9yCuR_e8kqBo0-+7unUz5A@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
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



On 2021/5/8 15:58, Stephen Boyd wrote:
> Quoting Leizhen (ThunderTown) (2021-05-08 00:55:04)
>>
>>
>> On 2021/5/8 14:09, Stephen Boyd wrote:
>>> Quoting Zhen Lei (2021-05-07 19:42:54)
>>>> Fix to return a negative error code from the error handling case instead
>>>> of 0, as done elsewhere in this function.
>>>>
>>>> Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
>>>> Reported-by: Hulk Robot <hulkci@huawei.com>
>>>> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 4 +++-
>>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>>> index 06b56fec04e0..1b6c9fb500a1 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
>>>> @@ -253,8 +253,10 @@ int dpu_mdss_init(struct drm_device *dev)
>>>>                 goto irq_domain_error;
>>>>
>>>>         irq = platform_get_irq(pdev, 0);
>>>> -       if (irq < 0)
>>>> +       if (irq < 0) {
>>>> +               ret = irq;
>>>>                 goto irq_error;
>>>> +       }
>>>
>>> It would be even better if ret wasn't assigned to 0 at the start of this
>>> function.
>>
>> The returned error code is not unique.
>>
> 
> What does it mean? I was saying this

Sorry, I misunderstood. I think your opinion is good.

> 
> ----8<----
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index cd4078807db1..0fcf190f6322 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -263,7 +263,7 @@ int dpu_mdss_init(struct drm_device *dev)
>  	struct msm_drm_private *priv = dev->dev_private;
>  	struct dpu_mdss *dpu_mdss;
>  	struct dss_module_power *mp;
> -	int ret = 0;
> +	int ret;
>  	int irq;
> 
>  	dpu_mdss = devm_kzalloc(dev->dev, sizeof(*dpu_mdss), GFP_KERNEL);
> @@ -297,8 +297,10 @@ int dpu_mdss_init(struct drm_device *dev)
>  		goto irq_domain_error;
> 
>  	irq = platform_get_irq(pdev, 0);
> -	if (irq < 0)
> +	if (irq < 0) {
> +		ret = irq;
>  		goto irq_error;
> +	}
> 
>  	irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
>  					 dpu_mdss);
> @@ -309,7 +311,7 @@ int dpu_mdss_init(struct drm_device *dev)
> 
>  	dpu_mdss_icc_request_bw(priv->mdss);
> 
> -	return ret;
> +	return 0;
> 
>  irq_error:
>  	_dpu_mdss_irq_domain_fini(dpu_mdss);
> 
> .
> 

