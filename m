Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 115282EFF44
	for <lists+dri-devel@lfdr.de>; Sat,  9 Jan 2021 12:47:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FAB6E94A;
	Sat,  9 Jan 2021 11:46:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2904F89A0F;
 Fri,  8 Jan 2021 13:56:40 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c5so9078512wrp.6;
 Fri, 08 Jan 2021 05:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Q91uhwFRfmIKcWPttNsrBoB66RrXUH9oGtyQnvttSXI=;
 b=DQXxUVb6TciWFgP7OcgXU45ci44YnDtH3mBxAimjk67e+oonwcPLS3fiWqg2MX48TZ
 c7TTeAzKDudMuKa3R6Flqfdmsi6qyMd0TJsq4RJ4i0E+tgLxRAlz/WiW9wo/RfcqnW/R
 3sYx7mAWg34mTpqM62WXbEipKhnqNlzV/QEq1QIiMHuTqV+R0GWcV04OGlyDzCb0yXKH
 Rdp8aGDCKwBpgfZHx2Y3/uOYwE6WSUpQXM+Mt3aXpQ8EjetfkfkfVlZFTcwzG6YilRzU
 lzgW5KF2Vqk6OEQOSn51UUYldBKmXcBdFrywOjIGc94/yA47Zl0VIzwRDJMiG4HEy9O1
 +qRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Q91uhwFRfmIKcWPttNsrBoB66RrXUH9oGtyQnvttSXI=;
 b=jlUL6BCSlM4ejE8sSGG4OEdBWXKYrRJBlwkXSssgE0ewG7AM3w0UVVdD5FWhmdwLNm
 7lf0BCFFHHsAHxFNjgdX+c2GE57ElF+j0Hv/Q/nvYeJxlF4Zs+eX89VkUynKKq+bNfgv
 PPowdi59g2fD3QrD7RyzKQmYXicWBtqNWjdLhPCXa13KS3oiDFANeLHqFghEPMvkGv8u
 wtmrqL+StF5YD7CZ5vMbWohFrhMAabR0f9xOuiDmEsZu3GXc4RmLRZ/89xIu6IkELUwC
 mCNAcCtszGXdIoruO7LQgjkaCbluBkfkw6oofS4jz3Wmem/ZQNdKDSHJjxUQEtQjMgav
 ibRA==
X-Gm-Message-State: AOAM531icPqCwT6hwf7T3+qQ56RXQl+hXZSxW0kW8fU74tSDiTKwLVhB
 0btBtHC9jUdy2639zgZ62D8=
X-Google-Smtp-Source: ABdhPJxVIIWUzakNhcBupPxQs6OS0tuLZs/ngkNh+3oV53GXiM+8RXAWH8x5kYYjsuYns8LiBt6ktA==
X-Received: by 2002:adf:df06:: with SMTP id y6mr3804923wrl.241.1610114198890; 
 Fri, 08 Jan 2021 05:56:38 -0800 (PST)
Received: from [192.168.74.106] (178-169-161-196.razgrad.ddns.bulsat.com.
 [178.169.161.196])
 by smtp.gmail.com with ESMTPSA id o124sm12646637wmb.5.2021.01.08.05.56.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Jan 2021 05:56:37 -0800 (PST)
Subject: Re: [PATCH] drm/msm: Fix MSM_INFO_GET_IOVA with carveout
To: Rob Clark <robdclark@gmail.com>
References: <20210102202437.1630365-1-iskren.chernev@gmail.com>
 <CAF6AEGt868msEPdZwJTB3YQppwNLaavSsDm1mGznCu1jsSPxCQ@mail.gmail.com>
 <CAF6AEGvoG4DUSrsEBpsZV-gc42XnhvgqPWXvwa1SMMk1JoF15w@mail.gmail.com>
From: Iskren Chernev <iskren.chernev@gmail.com>
Message-ID: <a9479d08-e9db-dfa7-c2f5-a8de5a0a28c4@gmail.com>
Date: Fri, 8 Jan 2021 15:56:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAF6AEGvoG4DUSrsEBpsZV-gc42XnhvgqPWXvwa1SMMk1JoF15w@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Sat, 09 Jan 2021 11:46:48 +0000
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
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/8/21 12:36 AM, Rob Clark wrote:
> On Thu, Jan 7, 2021 at 9:20 AM Rob Clark <robdclark@gmail.com> wrote:
>>
>> On Sat, Jan 2, 2021 at 12:26 PM Iskren Chernev <iskren.chernev@gmail.com> wrote:
>>>
>>> The msm_gem_get_iova should be guarded with gpu != NULL and not aspace
>>> != NULL, because aspace is NULL when using vram carveout.
>>>
>>> Fixes: 933415e24bd0d ("drm/msm: Add support for private address space instances")
>>>
>>> Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
>>> ---
>>>  drivers/gpu/drm/msm/msm_drv.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>> index c5e61cb3356df..c1953fb079133 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>> @@ -775,9 +775,10 @@ static int msm_ioctl_gem_info_iova(struct drm_device *dev,
>>>                 struct drm_file *file, struct drm_gem_object *obj,
>>>                 uint64_t *iova)
>>>  {
>>> +       struct msm_drm_private *priv = dev->dev_private;
>>>         struct msm_file_private *ctx = file->driver_priv;
>>>
>>> -       if (!ctx->aspace)
>>> +       if (!priv->gpu)
>>>                 return -EINVAL;
>>
>> Does this actually work?  It seems like you would hit a null ptr deref
>> in msm_gem_init_vma().. and in general I think a lot of code paths
>> would be surprised by a null address space, so this seems like a risky
>> idea.
>
> oh, actually, I suppose it is ok, since in the vram carveout case we
> create the vma up front when the gem obj is created..
>
> (still, it does seem a bit fragile.. and easy for folks testing on
> devices not using vram carvout to break.. hmm..)

In _msm_gem_new add_vma is called with NULL, so consequently lookup_vma
finds it when aspace is NULL.

Also, this is how the code was before the "breaking" change, so it should
not be worse.

I'll be happy to work on refactoring this a bit, but some some
documentation about the different gpu/mdp pieces and how they fit together
won't hurt.

Regards,
Iskren

> BR,
> -R
>
>> Maybe instead we should be creating an address space for the vram carveout?
>>
>> BR,
>> -R
>>
>>
>>>         /*
>>> --
>>> 2.29.2
>>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
