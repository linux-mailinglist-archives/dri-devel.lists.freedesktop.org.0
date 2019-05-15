Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747D61EAEB
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 11:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DE28973E;
	Wed, 15 May 2019 09:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5A78973E;
 Wed, 15 May 2019 09:28:51 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id h4so1831029wre.7;
 Wed, 15 May 2019 02:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=63Lw6dfFj3tL8kR1icDBJElYlaP3CBMuAJAkKoRJuLQ=;
 b=gFajlvI4BYqL/I6wEwSEG/1C27f6MfCG/PRrxIKXiY0LKBywqLU5FfIm40klgtMJiP
 xNfp/uvaaAPyZSWVqdNxhrxa6EQdlhC/VKNhz0geZkDmdHgNFy7DrEci2OtOIK86stN1
 e96ZLI75M7eHeaqPsaRzUT/uFTecEDmchibsyxuFs/HdMtP7hZoeyRQRI41OLv5HqJD3
 4HM5JHgf7MS/o00Gbyn5DRHqaXZgeTc0e23RV2VfV3ihNw5BmIJye5ihkkhLEI8UuQL0
 nuf/F5XNogCD1yQ8qwd5fnB39qEiBdbIAcc7DGZpSMnCGn6LgTJMDrDNQ8QNWqcUilfw
 NwPA==
X-Gm-Message-State: APjAAAVA3l+rgbp1b4FYp0okaaaXvFhA5H1RWg0YfVzVPW+p6TKjMQHu
 3+msCrb+MrOK1+5FlBCxF3u3Kozw
X-Google-Smtp-Source: APXvYqyZqnQaTd8VaFz1fBoEdAZ5sUAhVyonBtLEJBDiLC/MIqLcWGO/Kk7FWmJCKxsjQUX7rSu19g==
X-Received: by 2002:adf:ec06:: with SMTP id x6mr23896511wrn.159.1557912529739; 
 Wed, 15 May 2019 02:28:49 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id j46sm3276493wre.54.2019.05.15.02.28.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 02:28:49 -0700 (PDT)
Subject: Re: [PATCH 09/11] drm/ttm: convert EDEADLK into EAGAIN
To: Daniel Vetter <daniel@ffwll.ch>
References: <20190514123127.1650-1-christian.koenig@amd.com>
 <20190514123127.1650-9-christian.koenig@amd.com>
 <20190515084057.GC17751@phenom.ffwll.local>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1f81c6da-49d9-8e4e-a4a4-3611d9c23b57@gmail.com>
Date: Wed, 15 May 2019 11:28:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190515084057.GC17751@phenom.ffwll.local>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=63Lw6dfFj3tL8kR1icDBJElYlaP3CBMuAJAkKoRJuLQ=;
 b=ok+YfuHarb+yTvSt11WVWEmh37FeL387cB6IbhJbNK2+CZ7s9OnnKah0dVzT2BbR3a
 dK6N4k69b0ggnVliZCpBY3BvmnL20yvKfyPNCnsJJfOazLy6zhxYu+9HvB1ajdrG/feW
 msKQHAup84yCQF1XhBqtr9fsfDQGKIv9qs0zul/hFgqHawBM8H44mKccPYTsntwE/svE
 63Cbluxh8FxcXPrvwP158j+UpjFBY8XZhKxRTl5Jd030JoxvEwsrc43evlnNqlc5Ko6e
 lfAsUgSnwZcOHFniIkNXJeMChj7r/u64p9Tf/klsceG0XyzeVXMFcCMM4Bi/NZ3KgTXv
 dyww==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Reply-To: christian.koenig@amd.com
Cc: Marek.Olsak@amd.com, amd-gfx@lists.freedesktop.org, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTUuMDUuMTkgdW0gMTA6NDAgc2NocmllYiBEYW5pZWwgVmV0dGVyOgo+IE9uIFR1ZSwgTWF5
IDE0LCAyMDE5IGF0IDAyOjMxOjI1UE0gKzAyMDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+
IExldCB1c2Vyc3BhY2UgdHJ5IGFnYWluIGlmIHdlIHJlYWxseSBydW4gaW50byBhIGRlYWRsb2Nr
IGR1cmluZyBldmljdGlvbi4KPj4KPj4gVGhpcyBoYXMgYSBsb3cgY2hhbmNlIG9mIGxpdmUgbG9j
a2luZywgYnV0IHdpdGggZ3VhcmFudGVlZCBmb3J3YXJkIHByb2Nlc3MuCj4+Cj4+IFNpZ25lZC1v
ZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KPj4gLS0t
Cj4+ICAgZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDIgKysKPj4gICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspCj4+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
dHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwo+PiBpbmRleCBhMzAx
Yzg3NmFlMzEuLmNlODVjZDhiNDk3MCAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0
bS90dG1fYm8uYwo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+IEBAIC04
NzcsNiArODc3LDggQEAgc3RhdGljIGludCB0dG1fbWVtX2V2aWN0X2ZpcnN0KHN0cnVjdCB0dG1f
Ym9fZGV2aWNlICpiZGV2LAo+PiAgIAkJCQkJICAgIGFjcXVpcmVfY3R4KTsKPj4gICAJCWlmIChy
ZXQpIHsKPj4gICAJCQl0dG1fYm9fcHV0KGZpcnN0X2JvKTsKPj4gKwkJCWlmIChyZXQgPT0gLUVE
RUFETEspCj4gSXMgdGhpcyB0aGUgd3dfbXV0ZXggRURFQURMSyBvciBzb21ldGhpbmcgZWxzZT8g
SWYgdGhlIGZvcm1lciB0aGVuIGxldHRpbmcKPiB0aGF0IGVzY2FwZSB1bmhhbmRsaW5nIGludG8g
dXNlcnNwYWNlIHNvdW5kcyBsaWtlIGEga2VybmVsIGJ1ZyAuLi4KClllYWgsIHRoZSBwcm9ibGVt
IHN1cmZhY2VkIGJlY2F1c2Ugb2YgcGF0Y2ggIzQuIFByZXZpb3VzbHkgVFRNIHdvdWxkIApoYXZl
IGp1c3QgaWdub3JlZCBhbGwgZXJyb3JzIGFuZCBjb250aW51ZWQgdG8gdHJ5IGRpZmZlcmVudCBw
bGFjZW1lbnRzIAphbmQgb25seSByZXR1cm4gLUVOT01FTSB3aGVuIHdlIHJhbiBvdXQgb2YgYSBw
b3NzaWJsZSBwbGFjZW1lbnRzLgoKSSBwcm9iYWJseSBuZWVkIHRvIGVpdGhlciBmaXggcGF0Y2gg
IzQgb3IgcmVvcmRlciB0aGUgcGF0Y2hlcy4KClRoYW5rcyBmb3IgdGhlIG5vdGUsCkNocmlzdGlh
bi4KCj4gLURhbmllbAo+Cj4+ICsJCQkJcmV0ID0gLUVBR0FJTjsKPj4gICAJCQlyZXR1cm4gcmV0
Owo+PiAgIAkJfQo+PiAgIAkJc3Bpbl9sb2NrKCZnbG9iLT5scnVfbG9jayk7Cj4+IC0tIAo+PiAy
LjE3LjEKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
