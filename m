Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC8820EF81
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 09:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76EE389D4D;
	Tue, 30 Jun 2020 07:34:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21AAC89F6E
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 19:28:50 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id c11so9820147lfh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 12:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rr1sMHaAHEqgN/A83QolssAtZFeS7HWBgBdeKPZlkb8=;
 b=J/4rVlThiZdqc+W6qpVn9xdc0UzZOqkZwwXpsYkpKKACtsEZtFxm1iVzgotduMZp1T
 ZianxvUI5g34ekPzGm00NcjYFPYki6XH8N3On57grO8jnWYvS5jfhEu02YMF9321i4o0
 L3M6Eo0an2DjrejCVGpfFzPOKgw5yadMnde5EsBd03Vq5kDr8Iwn22Ge3j4wfH4L/Bi5
 XM21Uv+N+yaOQnFRtSqC9KGZfRtHKHXEoYYzgE8WJkpdGxmM6a+UxG1/xjANxisFO0BM
 NuS0CddJepYh6V0kAdXLcd0vkq6WQzRs3T+/eyFxg1ic2BwVDwEnyb7XeNoTRiGl8P5X
 onXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rr1sMHaAHEqgN/A83QolssAtZFeS7HWBgBdeKPZlkb8=;
 b=ci+y8w6pcaqq7o3t3OL4fHhHJ9MPUGCDP78EGyNfjnJuyPcRLyZ4HtFeMoemct4Oq3
 wcY3I+3S4sbgbOE7wPGoKdyCvIctaD6W6R8DNFdGI8oVVN/EXEXPzSsYEQbnBr3L/stx
 +R/RNcyOspIYMCQ1eseCpvx40kscUHqO7F0yT7SnAGEhEdTSR0jmQJZaQd4tvHlxxc3R
 y9b+QhqbTo375cKgOiMOoUFYQgfmDYRbDAMq4rMnOtKgs6SJFO8fKumEAhiasW8i7/Hy
 WPLES/h4fVZM0VVFzmprFcvokgvCf7YoPo1UpMDJegVKp8BtQjoyDLRBm7qw/tDJZ1b4
 aI2g==
X-Gm-Message-State: AOAM532RACIQ1Ng8MDnA34OR+zhrpQ7r7bAzc3GvvSy/qBzsWmQyiHPX
 mFN6x5zyS90VGEih0+bL/zc=
X-Google-Smtp-Source: ABdhPJzkzCc8zio3InqZD3UrNliu1whaWmf5kHDuZkB1KAdY5hvFvL4Dm018z8bgJRKH2qjmcn1t8Q==
X-Received: by 2002:ac2:4c03:: with SMTP id t3mr9873318lfq.72.1593458927957;
 Mon, 29 Jun 2020 12:28:47 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id f9sm184418ljf.27.2020.06.29.12.28.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 12:28:46 -0700 (PDT)
Subject: Re: [RFC] Host1x/TegraDRM UAPI (sync points)
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>, Jon Hunter
 <jonathanh@nvidia.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, sumit.semwal@linaro.org, gustavo@padovan.org
References: <9b06b7ec-f952-2561-7afb-5653514cd5d3@kapsi.fi>
 <5b1edaad-ba36-7b0f-5b02-457ae5b6d91e@gmail.com>
 <62859775-514c-2941-75ed-6905e9282a6f@kapsi.fi>
 <623c1eaa-31fb-8dff-f6c0-d8cd0be60070@gmail.com>
 <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e117a4a3-5a7d-6fc2-af63-9614cf6f9280@gmail.com>
Date: Mon, 29 Jun 2020 22:28:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <827c92a6-7fed-a81c-ba8e-6c69416c4ab9@kapsi.fi>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 30 Jun 2020 07:34:54 +0000
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
Cc: "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Erik Faye-Lund <kusmabite@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MjkuMDYuMjAyMCAxMzoyNywgTWlra28gUGVydHR1bmVuINC/0LjRiNC10YI6Ci4uLgo+PiBXZSBk
b24ndCBuZWVkIGEgZGVkaWNhdGVkIHN5bmMgcG9pbnQgRkQgZm9yIGFsbCBraW5kcyBvZiBqb2Jz
LCBkb24ndCB3ZT8KPj4gRm9yIGV4YW1wbGUsIEkgZG9uJ3Qgc2VlIHdoeSBhIHN5bmMgcG9pbnQg
RkQgbWF5IGJlIG5lZWRlZCBpbiBhIGNhc2Ugb2YKPj4gT3BlbnRlZ3JhIGpvYnMuCj4gCj4gSSB0
aGluayBpdCdzIGNsZWFuZXIgaWYgd2UgaGF2ZSBqdXN0IG9uZSB3YXkgdG8gYWxsb2NhdGUgc3lu
Y3BvaW50cywgYW5kCj4gdGhlbiB0aG9zZSBzeW5jcG9pbnRzIGNhbiBiZSBwYXNzZWQgdG8gZGlm
ZmVyZW50IHRoaW5ncyBkZXBlbmRpbmcgb24gdGhlCj4gc2l0dWF0aW9uLgo+IAo+IElmIHdlIHdh
bnQgdG8gcHJvdGVjdCBkaXJlY3QgaW5jcmVtZW50aW5nIHdoaWxlIGEgam9iIGlzIHN1Ym1pdHRl
ZCwgd2UKPiBjb3VsZCBoYXZlIGEgbG9ja2luZyBBUEkgd2hlcmUgYW4gb25nb2luZyBqb2IgY2Fu
IHRha2UgYSBsb2NrIHJlZmNvdW50Cj4gaW4gdGhlIHN5bmNwb2ludCwgYW5kIGluY3JlbWVudGlu
ZyB3b3VsZCByZXR1cm4gLUVCVVNZLgoKT2theSwgbGV0J3MgZ28gd2l0aCB0aGlzIGZvciBub3cu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
