Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D23A32EFA8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 17:07:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A74EB6E1EE;
	Fri,  5 Mar 2021 16:07:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D54C6E1EE
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 16:07:39 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u14so2677900wri.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 08:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Mjl6hJjekqFaDb+AnxU/CQV4FSFVeXgbpPI17kodW8k=;
 b=o3OQoy/B4bmnX00XY/fyDCeAt45512fmNcWP5RkZ+Vbmo3icV77RlzyVFpga84fw95
 vGd6DBE9GlJTxVjpu9OConw1mXcj11aRpBnGt4/JWpj6Fyy+Q/SlSw4Nv6avst8qRMj+
 btkpS026U9ooEfWQWXnInrPgZV+g+W3pqolkQv7EB0FBxEZlUaZkkCrTSDIUVsFhu3wo
 E2YA/SFDcPWdUgVElWyuVVAkRuTza4CQkOdGIxzGgpPwB9v2k2Nr9yLILPiU60parmYv
 RlVCxtjATvfApMrL+XCxIm8Luh/oNcIKNORgVIgt9S6UYT1UGFmtx+/2Cf4DU+556LTa
 6nxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Mjl6hJjekqFaDb+AnxU/CQV4FSFVeXgbpPI17kodW8k=;
 b=Q3mPEv8VZCqQVAOy3Oxsxc+XZODNvLz2WfiGI9A0skQdvDuOZj/6cN325IjMsSkmc2
 RXlhH6iMJwfwlbTYPsIKIrPlDYGzgJhpI+hiHB1ISD/4/se8GWk1VqS/c9HTZhQVxDGT
 Dgn7zwGEFRUWH6ibdBBirE1KGQ+wKp3ohMTUaIGynMsVASpXczUTm3scowLcAEbJ5YIb
 1cJqRRGKr+bNGcjlu4RAp5zld3wqAudpe+xXk9Kk4GL24GoC/gGVyHepnFU2/r3Gs3WY
 mSOx5cREzS2nX3f6ppG0z9V2XSKSP/2y5UL0k4jPy0HV4Q1llA9eZg3xL9fSk6bs0Van
 VDFQ==
X-Gm-Message-State: AOAM530nulGW0IE+PS8sFnhQeAYz9Gx5DfwzynANocgBt0kPRZxRrgQx
 DlxNCeRAxZIxoLcpINtaToVKNw==
X-Google-Smtp-Source: ABdhPJyvxqdI5ggYZI747djzgnK5I3Woui++yasSfP7TiMwRTupegbiaavwx5OV0jZcx7bkboFBbvA==
X-Received: by 2002:a05:6000:188b:: with SMTP id
 a11mr9931064wri.151.1614960457955; 
 Fri, 05 Mar 2021 08:07:37 -0800 (PST)
Received: from [192.168.86.34]
 (cpc86377-aztw32-2-0-cust226.18-1.cable.virginm.net. [92.233.226.227])
 by smtp.googlemail.com with ESMTPSA id c11sm5367818wrm.67.2021.03.05.08.07.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 05 Mar 2021 08:07:37 -0800 (PST)
Subject: Re: [PATCH 1/3] drm/msm: Fix speed-bin support not to access outside
 valid memory
To: Doug Anderson <dianders@chromium.org>
References: <20210227002603.3260599-1-dianders@chromium.org>
 <20210226162521.1.Ib5ae69a80704c3a2992100b9b5bac1a6cc470249@changeid>
 <6ce9f5b8-50b4-e655-f6c5-4e095c1d7e19@linaro.org>
 <CAD=FV=Uq1sVDuJxy3N3C0i-FOMPKiJ5cUoJbh6WDoGfGHXXNDQ@mail.gmail.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <bc8e9959-bd2e-c168-347b-9d409ce7e3b7@linaro.org>
Date: Fri, 5 Mar 2021 16:07:35 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Uq1sVDuJxy3N3C0i-FOMPKiJ5cUoJbh6WDoGfGHXXNDQ@mail.gmail.com>
Content-Language: en-US
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Jordan Crouse <jcrouse@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Akhil P Oommen <akhilpo@codeaurora.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Niklas Cassel <niklas.cassel@linaro.org>,
 Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 LKML <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 05/03/2021 14:45, Doug Anderson wrote:
> Hi,
> 
> On Fri, Mar 5, 2021 at 2:28 AM Srinivas Kandagatla
> <srinivas.kandagatla@linaro.org> wrote:
>>
>>
>>
>> On 27/02/2021 00:26, Douglas Anderson wrote:
>>> When running the latest kernel on an sc7180 with KASAN I got this
>>> splat:
>>>     BUG: KASAN: slab-out-of-bounds in a6xx_gpu_init+0x618/0x644
>>>     Read of size 4 at addr ffffff8088f36100 by task kworker/7:1/58
>>>     CPU: 7 PID: 58 Comm: kworker/7:1 Not tainted 5.11.0+ #3
>>>     Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
>>>     Workqueue: events deferred_probe_work_func
>>>     Call trace:
>>>      dump_backtrace+0x0/0x3a8
>>>      show_stack+0x24/0x30
>>>      dump_stack+0x174/0x1e0
>>>      print_address_description+0x70/0x2e4
>>>      kasan_report+0x178/0x1bc
>>>      __asan_report_load4_noabort+0x44/0x50
>>>      a6xx_gpu_init+0x618/0x644
>>>      adreno_bind+0x26c/0x438
>>>
>>> This is because the speed bin is defined like this:
>>>     gpu_speed_bin: gpu_speed_bin@1d2 {
>>>       reg = <0x1d2 0x2>;
>>>       bits = <5 8>;
>>>     };
>>>
>>> As you can see the "length" is 2 bytes. That means that the nvmem
>>> subsystem allocates only 2 bytes. The GPU code, however, was casting
>>> the pointer allocated by nvmem to a (u32 *) and dereferencing. That's
>>> not so good.
>>>
>>> Let's fix this to just use the nvmem_cell_read_u16() accessor function
>>> which simplifies things and also gets rid of the splat.
>>>
>>> Let's also put an explicit conversion from little endian in place just
>>> to make things clear. The nvmem subsystem today is assuming little
>>> endian and this makes it clear. Specifically, the way the above sc7180
>>> cell is interpreted:
>>>
>>> NVMEM:
>>>    +--------+--------+--------+--------+--------+
>>>    | ...... | 0x1d3  | 0x1d2  | ...... | 0x000  |
>>>    +--------+--------+--------+--------+--------+
>>>                 ^       ^
>>>                msb     lsb
>>>
>>> You can see that the least significant data is at the lower address
>>> which is little endian.
>>>
>>> NOTE: someone who is truly paying attention might wonder about me
>>> picking the "u16" version of this accessor instead of the "u8" (since
>>> the value is 8 bits big) or the u32 version (just for fun). At the
>>> moment you need to pick the accessor that exactly matches the length
>>> the cell was specified as in the device tree. Hopefully future
>>> patches to the nvmem subsystem will fix this.
>>>
>>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
>>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>>> ---
>>>
>>>    drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 31 +++++++--------------------
>>>    1 file changed, 8 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index ba8e9d3cf0fe..0e2024defd79 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -1350,35 +1350,20 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
>>>                u32 revn)
>>>    {
>>>        struct opp_table *opp_table;
>>> -     struct nvmem_cell *cell;
>>>        u32 supp_hw = UINT_MAX;
>>> -     void *buf;
>>> -
>>> -     cell = nvmem_cell_get(dev, "speed_bin");
>>> -     /*
>>> -      * -ENOENT means that the platform doesn't support speedbin which is
>>> -      * fine
>>> -      */
>>> -     if (PTR_ERR(cell) == -ENOENT)
>>> -             return 0;
>>> -     else if (IS_ERR(cell)) {
>>> -             DRM_DEV_ERROR(dev,
>>> -                             "failed to read speed-bin. Some OPPs may not be supported by hardware");
>>> -             goto done;
>>> -     }
>>> +     u16 speedbin;
>>> +     int ret;
>>>
>>> -     buf = nvmem_cell_read(cell, NULL);
>>
>> I think the issue here is not passing len pointer which should return
>> how many bytes the cell is!
>>
>> Then from there we can decide to do le16_to_cpu or le32_to_cpu or not!
>> This will also future proof the code to handle speed_bins of different
>> sizes!
> 
> I think what you're saying is that you want to copy/paste this code
> (or something similar) everywhere that accesses an nvmem cell.  Is
> that correct?  ...or maybe you can suggest some smaller / shorter code
> that I'm missing?
> 

It depends what the consumer is doing! If it is already aware of what 
size of data its expecting then you can use nvmem_cell_read_u8/16/32/64 
variants, however it wants to do bit more with the data then 
nvmem_cell_read() should give more flexibility!

> ---
> 
> {
>    struct nvmem_cell *cell;
>    ssize_t len;
>    char *ret;
>    int i;
> 
>    *data = 0;
> 
>    cell = nvmem_cell_get(dev, cname);
>    if (IS_ERR(cell)) {
>      if (PTR_ERR(cell) != -EPROBE_DEFER)
>        dev_err(dev, "undefined cell %s\n", cname);
>      return PTR_ERR(cell);
>    }
> 
>    ret = nvmem_cell_read(cell, &len);
>    nvmem_cell_put(cell);
>    if (IS_ERR(ret)) {
>      dev_err(dev, "can't read cell %s\n", cname);
>      return PTR_ERR(ret);
>    }
> 
>    for (i = 0; i < len; i++)
>      *data |= ret[i] << (8 * i);
> 
>    kfree(ret);
>    dev_dbg(dev, "efuse read(%s) = %x, bytes %zd\n", cname, *data, len);
> 
>    return 0;
> }
> 
> ---
> 
> The above code is from cpr_read_efuse() in "cpr.c".  I mentioned in
> the cover letter that I thought about doing this and decided it wasn't
> a great idea.  There should be _some_ function in the nvmem core that
> says: there's an integer that's 32-bits or less stored in nvmem.

There is no such helper function other than using the above snippet to do.

> Please read it for me.  If you don't think we can use one of the
> existing functions for that, would you be opposed to me creating a new
> one?

I have no issue in adding a new helper function in nvmem to allow such 
thing!

> 
> ---
> 
> In any case, while we discuss what we should do long term, I still
> hope that Rob can merge this patch since it fixes the bug.

Yes, I agree this definitely fixes the mentioned bug!
> 
> -Doug
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
