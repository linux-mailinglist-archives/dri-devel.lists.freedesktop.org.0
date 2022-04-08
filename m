Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB7084F9A4A
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 18:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96CAB10E4F8;
	Fri,  8 Apr 2022 16:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED45410E4F9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 16:14:55 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id bq30so3147338lfb.3
 for <dri-devel@lists.freedesktop.org>; Fri, 08 Apr 2022 09:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=/SWSieq/x4paIxvEX4XMyhkbxR8UMVfWRh7r/9jR+Cc=;
 b=moYf/PvSTIAmgGtZ+zmxrAouvxxE7YzhW3XrtHMUlrC6jl8mjoFVA8NVKnxUAWV6Ic
 xmG0mdHpBPdfE0wve8IIrNUNIcBeIVsB4AQKsYJg4qMovdmIh+iyrKC2sJvPITqHzWFo
 mfeOXwe4sGQlMymEKFeyAeBnwv+7Ivv+36QDjwFCxJs6V8KBLbxLHmOBdN5Wnt3d5+k4
 09CUrE8g69fwD4szHruGk5hYv5pkkAJlrmvru7YYzka0hDNzY30yksYjmCcZks4bm7nD
 I3gHb1fqk+aByJnM1JzQ6mpAOQ0fyywFDuekhO+27hHHyrd6nwOpwrfTHNv7EWdhdtfK
 80ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/SWSieq/x4paIxvEX4XMyhkbxR8UMVfWRh7r/9jR+Cc=;
 b=AEKvH7yxDJdFyHIi7oHjD64kKfi9yBXQky+GPCaUddcjIPzzQK7IYSAoIebwEO2lhE
 LsZQVJwpuZW+QKNTCh4EKOlMK7J8ngkaAo+Cl0VpqYc6s9N/K9XS2p53nQUR3Cqr8bgj
 v2vPZI9PtyLfApGa/UwFSk8/r7eUhEvoK3SGfrCc5zYdj8ov4bMBV8nAzSyMNXBtmnSi
 Cne+sM7QBprx15SCDHD38jkOfLjpzFtXfScJ4iQxkgsWGGIESjuLhVOB6Xdr+AopOfsU
 QyUmaPsgOlsePL/9fh7kssONrvlq+gLILfITxhh0debAgRA6O+eheVG5zyFChPLXYAWV
 kDyg==
X-Gm-Message-State: AOAM533Drz/OAROA483a/6h5vBqmjb7xZzGHtQkvBxcr4C/m+w8L2RKa
 0ufrSVPJV1JBbP8WukF9VvNjDw==
X-Google-Smtp-Source: ABdhPJzwJcWy7YoPs+RM0xo8q4ohRQtmoCIFwBex9mQ/bLJoDJNhH9ND1g6yAXGxb79Kdi7PxaQnbA==
X-Received: by 2002:ac2:5448:0:b0:46b:877e:9c1e with SMTP id
 d8-20020ac25448000000b0046b877e9c1emr2028009lfn.326.1649434494149; 
 Fri, 08 Apr 2022 09:14:54 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 q22-20020a194316000000b0044a93059aa9sm2492444lfa.260.2022.04.08.09.14.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 09:14:53 -0700 (PDT)
Message-ID: <94da2c97-2ad2-4575-bd73-d66ad989e17b@linaro.org>
Date: Fri, 8 Apr 2022 19:14:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v6 5/8] drm/msm/dp: prevent multiple votes for dp resources
Content-Language: en-GB
To: Doug Anderson <dianders@chromium.org>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
References: <1648656179-10347-1-git-send-email-quic_sbillaka@quicinc.com>
 <1648656179-10347-6-git-send-email-quic_sbillaka@quicinc.com>
 <CAD=FV=Wn-XypjRcw-D0VtBHZbuTz=RHiMq6RCHCa=CWmZM42nQ@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <CAD=FV=Wn-XypjRcw-D0VtBHZbuTz=RHiMq6RCHCa=CWmZM42nQ@mail.gmail.com>
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
Cc: quic_kalyant <quic_kalyant@quicinc.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 "Abhinav Kumar \(QUIC\)" <quic_abhinavk@quicinc.com>,
 quic_vproddut <quic_vproddut@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Sean Paul <seanpaul@chromium.org>, quic_aravindh@quicinc.com,
 "Kuogee Hsieh \(QUIC\)" <quic_khsieh@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/04/2022 02:23, Doug Anderson wrote:
> Hi,
> 
> On Wed, Mar 30, 2022 at 9:04 AM Sankeerth Billakanti
> <quic_sbillaka@quicinc.com> wrote:
>>
>> The aux_bus support with the dp_display driver will enable the dp
>> resources during msm_dp_modeset_init. The host_init has to return early
>> if the core is already initialized to prevent putting an additional vote
>> for the dp controller resources.
>>
>> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
> 
> I'm not a huge fan of this but I'll leave it up to Dmitry. In general
> it feels like there should be _a_ place that enables these resources.
> Checks like this make it feel like we just scattershot enabling
> resources in a bunch of random places instead of coming up with the
> design for enabling them in the right place.

I'd prefer to see a check for eDP in dp_display_config_hpd(). Or even 
better to see that this function isn't called for eDP at all.

> 
> In any case, if we do end up landing this patch, it sure feels like it
> needs to move earlier in the patch series, right? This patch shouldn't
> hurt even without the other patches in the series but if you apply the
> earlier patches in the series without this one then you'll have a bug,
> right? That means this needs to come earlier.
> 
> -Doug


-- 
With best wishes
Dmitry
