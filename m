Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCEF4FE0BD
	for <lists+dri-devel@lfdr.de>; Tue, 12 Apr 2022 14:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B3010E9DD;
	Tue, 12 Apr 2022 12:45:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 501E310E9DD
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649767543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZ33BjHrDwv5LDhGjdBOryVj91womQA/19SWnvr7iKo=;
 b=bbgXXAh86V+ylP/asKm03NUTzSY6X1ywgR9AN9kBLX4qolvAAgYpN7fZoJnHDFvbOJ4K+R
 5fukNzoXaAFHdv4FmsNd62JU1gC+l+SaNxHcc9+nwU494DcN1sUg50E45i6sNIzbNC6ki/
 UqqpPzZwaGbAVxMnO7XoDn8qHHqeA+M=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-cHlOf1wYPraPXKCcmnbfKA-1; Tue, 12 Apr 2022 08:45:42 -0400
X-MC-Unique: cHlOf1wYPraPXKCcmnbfKA-1
Received: by mail-wr1-f71.google.com with SMTP id
 v3-20020adf8b43000000b00205e463b017so3992772wra.10
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Apr 2022 05:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=tZ33BjHrDwv5LDhGjdBOryVj91womQA/19SWnvr7iKo=;
 b=r6ZlkWWQxssTRFcZHie1JYKDpKhh7Yl+u+vTD6l6ATnUBQSfBBKSLlrbjPX0Sfh9Iq
 g2ppSJfKPH+cF4ZLZPnVBkORpQsFmV7gvhwk0kBSHg/EzkGJ86Om+FZS5G5F/o3Y4w+X
 DrDQu+i3uUsrUUU5hgieg3s1AQwNhbajuPwY2SczxoHSm/sUpHSajFHNN06hOB7HTBav
 kl3n666FjMUhrnTt175dq3fPicgCMwdMp8s1Y1N9RhJZzOG0zgzgAdRPQ49SXRSfdOsq
 VHH3gXKAGxf+FklHNHjMT0rVmkCYvnaCMHgFKWBQboboxkv+0xibxfGjUjEKx5eITG9J
 I+cw==
X-Gm-Message-State: AOAM5331ga9j6dw33fwrTed5EegSmFblw/uRVpm8qvIpAqKnPqEy1NVA
 imQkJb84PU4648biPhKbITyk1FZZPWvD4nrgUVXmVsbk/XRZ8tsRJebopel5nLzqFGclLZkzSRD
 Mo21Qm65uUne/2FEFiURdVTxOFTpG
X-Received: by 2002:a5d:6b4c:0:b0:1e6:8ece:62e8 with SMTP id
 x12-20020a5d6b4c000000b001e68ece62e8mr29078284wrw.201.1649767541787; 
 Tue, 12 Apr 2022 05:45:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyUqWO+Fp2x3i5NTSt5YGXdfhi1f+8zoD8yvWBy27pRBGSkplwJquSYzx/QHYB7zw1nrfYm3Q==
X-Received: by 2002:a5d:6b4c:0:b0:1e6:8ece:62e8 with SMTP id
 x12-20020a5d6b4c000000b001e68ece62e8mr29078264wrw.201.1649767541566; 
 Tue, 12 Apr 2022 05:45:41 -0700 (PDT)
Received: from [192.168.1.102] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a1ce910000000b0038eabd31749sm2641252wmc.32.2022.04.12.05.45.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Apr 2022 05:45:41 -0700 (PDT)
Message-ID: <eb49332b-876a-0bd6-cefe-863f03903745@redhat.com>
Date: Tue, 12 Apr 2022 14:45:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 4/5] drm/solomon: Move device info from ssd130x-i2c to
 the core driver
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20220411211243.11121-1-javierm@redhat.com>
 <20220411211243.11121-5-javierm@redhat.com>
 <CAMuHMdVSsAtRLob5fLoBMNu-DRXJOaBrEHYEwG5iCA03XR5JSw@mail.gmail.com>
 <4128b288-2b9a-f9cd-01f3-a1d50d3e10bb@redhat.com>
 <YlVgpHqqqFy43L37@smile.fi.intel.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <YlVgpHqqqFy43L37@smile.fi.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Mark Brown <broonie@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Chen-Yu Tsai <wens@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy,

Thanks for your feedback.

On 4/12/22 13:21, Andy Shevchenko wrote:
> On Tue, Apr 12, 2022 at 10:07:02AM +0200, Javier Martinez Canillas wrote:
>> On 4/12/22 09:23, Geert Uytterhoeven wrote:
>>> On Mon, Apr 11, 2022 at 11:12 PM Javier Martinez Canillas
>>> <javierm@redhat.com> wrote:
> 
> ...
> 
>>>> -       ssd130x->device_info = device_get_match_data(dev);
>>>> +
>>>> +       variant = (enum ssd130x_variants)device_get_match_data(dev);
>>>
>>> (uintptr_t), to avoid a cast from pointer to integer of different
>>> size warning.
>>>
>>
>> Indeed. The kernel test robot reported the same.
> 
> Not only because of this, but also with the non-NULL pointers I prefer the old
> style without ugly castings.
> 
> Instead, you may export the array (in the driver's namespace) and use
> &info[ID] pointer for the specific device info.
> 

That's a great idea! I'll do that in v3.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

