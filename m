Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F233D526172
	for <lists+dri-devel@lfdr.de>; Fri, 13 May 2022 13:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7301B10EDC1;
	Fri, 13 May 2022 11:55:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6FB010EDA6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 11:55:36 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id t25so9998830ljd.6
 for <dri-devel@lists.freedesktop.org>; Fri, 13 May 2022 04:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=BWXjdtjDXNb6ni/GTLm4b+m6ctcJfNLEzZiRu6oBfwM=;
 b=aqKuiX154is7FJUpi1R8IdvDaiFB++QSQOS2uocvXsO4hWXuYurrmUCNjxy9IJ5gt2
 VUWWj78Czlnfq9WVsGIm2gMu0s5vTzLeGHyssh/j3aWt/puHX5rCaU2dNyhQa6PfeULI
 2MKJ2o/vCtem0eyof+MXzrdDHk5Uj+HASc7geNabhwZIF9JxXsL/rderzp4Zhq8H3/90
 28Oo+VNrFEJcgrPF74O3UdXSewE5M0juY7xYf9DHO4yOftNzl0VyWDFE7fKw1GrVEPbO
 7SsmaoWZZAQkdXPaxVzvqaQYd1OZRPgfLUZW1foLe2pvAPCkoqRDMjf77OHGRpzKOZiP
 DivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=BWXjdtjDXNb6ni/GTLm4b+m6ctcJfNLEzZiRu6oBfwM=;
 b=kV+BvlOmgvCtPT/TECzKhGJAg/xrwN0l0n4VetKPJzlSCJCd+IsOiza0hrScFoIx3Q
 GwVvd3ABNCieRXNclXjUSdRx8gGXYqnAcNVzuiJcyn8r3x4Vv80Ws/yxpPJVEyeHqg4c
 qsMFdbu+X3A+dgzESfx9OUD3oWrKE1NHhLbH2cpGQaW+R2AQcgUyAlwEfu0eFX21nl4j
 r3sX6ICOO+T9WHxz0NY0qOu7SrsmaJxCJkW0osED4IVIWpfXU2l9NVgczD3S5F0v0C+6
 n7NJGNph3/kFHOt7se8+a+odmKQk6cqSVR3mpLZNu9jhOF2OmaBTwzg570KYzhuPfSuY
 B6sg==
X-Gm-Message-State: AOAM533/aPQfq680oeEoD1lUoZ/0SFp2Z3EVfpd8gkGm04OBiyQamlJU
 /jC6CWvNOLyxrwgFnVWPBXy54A==
X-Google-Smtp-Source: ABdhPJyihsUNwQrrmSPPzo9FASu6qH3wwhsjygHdujD9u/4JkFplSQLT/gDF0qzTtCSPKA2xHJoeew==
X-Received: by 2002:a2e:91c7:0:b0:24f:1114:86fd with SMTP id
 u7-20020a2e91c7000000b0024f111486fdmr2873427ljg.147.1652442935109; 
 Fri, 13 May 2022 04:55:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 d15-20020ac25ecf000000b0047255d210f7sm356326lfq.38.2022.05.13.04.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 May 2022 04:55:34 -0700 (PDT)
Message-ID: <5c659924-0272-d262-86f1-543a0d01127f@linaro.org>
Date: Fri, 13 May 2022 14:55:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/2] drm/msm: don't free the IRQ if it was not requested
Content-Language: en-GB
To: Stephen Boyd <swboyd@chromium.org>
References: <20220507010021.1667700-1-dmitry.baryshkov@linaro.org>
 <CAE-0n50tgiNj6j8+90xNw2Sku7rHKOGQYrHRjHCHb8-rqnOAxg@mail.gmail.com>
 <CAA8EJpqFksVc+Lj4-G81z26GH-WbQ3CKOUwgsx0Xar-F+EMNRg@mail.gmail.com>
 <CAE-0n51KAdQHvpgon6-qpLXZT7X8ghZ+9bSeTji-duMOG2wYiQ@mail.gmail.com>
 <d6509c64-3a3e-f13b-6a3f-06f50c427eaf@linaro.org>
 <CAE-0n51Bt6VKJb4RjFfNUJVpWu=3jZs7Ym++7oa+-uvMf=hfWA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAE-0n51Bt6VKJb4RjFfNUJVpWu=3jZs7Ym++7oa+-uvMf=hfWA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/05/2022 04:41, Stephen Boyd wrote:
> Quoting Dmitry Baryshkov (2022-05-11 18:30:55)
>> On 12/05/2022 04:29, Stephen Boyd wrote:
>>> Quoting Dmitry Baryshkov (2022-05-11 18:01:31)
>>>> On Thu, 12 May 2022 at 03:54, Stephen Boyd <swboyd@chromium.org> wrote:
>>>>>
>>>>> Quoting Dmitry Baryshkov (2022-05-06 18:00:20)
>>>>>
>>>>> Does this supersede commit 01013ba9bbdd ("drm/msm/disp/dpu1: avoid
>>>>> clearing hw interrupts if hw_intr is null during drm uninit")? I mean
>>>>> that with this patch applied kms->irq_requested makes the check in
>>>>> dpu_core_irq_uninstall() irrelevant because it isn't called anymore?
>>>>
>>>> Yes.
>>>>
>>>
>>> I didn't see it deleted in the second patch so is a revert going to be
>>> sent?
>>
>> No need to. They are separate checks. The older one is superseded (as it
>> will be never hit),  but it is still valid and useful (to protect from
>> the crash if this code changes again).
>>
> 
> Ew, gross. The extra conditionals everywhere really makes it hard to
> follow along.

With the second patch being dropped I'd prefer to leave both conditions 
in place.

-- 
With best wishes
Dmitry
