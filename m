Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703F32B9C13
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 21:32:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5861D6E829;
	Thu, 19 Nov 2020 20:32:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B686E530
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 14:22:47 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id z21so8442084lfe.12
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 06:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZvOd3z2dVnB5SZQwK/dvDpMXJ4eITwmefRvuKa9tb0Q=;
 b=Y21dZRMZ+kNYHUNLiNCHQoS5QxGFMKf7KaEd+6a06G/hQ1bejJXAcijD6xiDcBiBUn
 JS4yWyB2+zZqqxEzarQ7y2NC3cKCRKUZ2CchFnZU6Kn5vLrutkvXtu+Lq1OFhxgn8Epp
 UuLT88qmv67A3sWVg1l8Ws05tNM98wJWDlT1hgGfbwXfCiTxIVlprvN48xiVZLuFi3Cn
 KI3oT4rlzLRHtD8EKwZRS29BsqsZh07SrjWWBHtLowX/toS83Dhlqd9OCn9mvofvfXic
 DHhrzPVHyIWzxM0YW/p1ZFuzvZaox6YeG/KIcRnpB6NKJzCgXsklV6r9OCr7nnEUUhRd
 hptw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZvOd3z2dVnB5SZQwK/dvDpMXJ4eITwmefRvuKa9tb0Q=;
 b=iuc8C6PgQPd476nyQCMZJqHcRgb1DWWrbmJUzSNMYkDrVeGRIBDtquclXztJvNxLwf
 mcdg5nR1tkqW0Y7dJHCnD8XWsFgHtYzWdS7zeVcJ1TrtGY9OvDa+C2MxNi82n6sff5cT
 H2gN6CdJ85sE84mBAl3iiDKVZbxtgS0QfjNcbvPrYTlmasT2pE3RHcjLLsWJAPlDwic+
 r6XwoepKZoNcKbqDEW27reah3lbjrXYiyW4/P7aZPUWGGm4c8Rda5ns7IDLPCy6tx7Pv
 1fsWyH7FHXx8GU5pGdluBSBFsVkQDkP6wrMjRNYAi3kGicbb1y58m6PF5JyWzuAFc4K9
 l9Wg==
X-Gm-Message-State: AOAM530+IBOeKd75+gwh1GGH6mBOuw8vMf/YnbD0TVglyiVHAFybgC1w
 KQWnBZheka6pPeHUD0ah9OM=
X-Google-Smtp-Source: ABdhPJyUwmqVByndGgJFiM7woqjbf8UJz72yW3W4B1Jv93hEMk1YatxireTGBSQxqAyLLyxkuXCkKw==
X-Received: by 2002:a19:844a:: with SMTP id g71mr6446029lfd.414.1605795766096; 
 Thu, 19 Nov 2020 06:22:46 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id m16sm3851652lfa.57.2020.11.19.06.22.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Nov 2020 06:22:45 -0800 (PST)
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
To: Mark Brown <broonie@kernel.org>
References: <20201112171600.GD4742@sirena.org.uk>
 <b4b06c1d-c9d4-43b2-c6eb-93f8cb6c677d@gmail.com>
 <20201112200123.GF4742@sirena.org.uk>
 <ce9e2d9f-917e-fb8a-7323-f3bf1a367e9d@gmail.com>
 <20201113142937.GB4828@sirena.org.uk>
 <7f066805-97d9-088f-e89d-a554fe478574@gmail.com>
 <20201113161550.GC4828@sirena.org.uk>
 <3beaa12b-4a50-a3b6-fc43-ebb5ce7a8db7@gmail.com>
 <20201113172859.GF4828@sirena.org.uk>
 <74cfc6a9-3f59-d679-14b7-51102a6f11b3@gmail.com>
 <20201116133311.GB4739@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <332ab946-daee-bb83-24ab-0bda4fd8e1ef@gmail.com>
Date: Thu, 19 Nov 2020 17:22:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201116133311.GB4739@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 19 Nov 2020 20:32:07 +0000
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
Cc: Peter Chen <Peter.Chen@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Adrian Hunter <adrian.hunter@intel.com>, devicetree@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, devel@driverdev.osuosl.org,
 linux-samsung-soc@vger.kernel.org, Nicolas Chauvet <kwizart@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MTYuMTEuMjAyMCAxNjozMywgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFN1biwgTm92IDE1
LCAyMDIwIGF0IDA4OjQyOjEwUE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMTMu
MTEuMjAyMCAyMDoyOCwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IAo+Pj4+IFdoYXQgc2hvdWxk
IHdlIGRvPwo+IAo+Pj4gQXMgSSBrZWVwIHNheWluZyB0aGUgY29uc3VtZXIgZHJpdmVyIHNob3Vs
ZCBiZSBlbnVtZXJhdGluZyB0aGUgdm9sdGFnZXMKPj4+IGl0IGNhbiBzZXQsIGlmIGl0IGNhbid0
IGZpbmQgYW55IGFuZCB3YW50cyB0byBjb250aW51ZSB0aGVuIGl0IGNhbiBqdXN0Cj4+PiBza2lw
IHNldHRpbmcgdm9sdGFnZXMgbGF0ZXIgb24uICBJZiBvbmx5IHNvbWUgYXJlIHVuYXZhaWxhYmxl
IHRoZW4gaXQKPj4+IHByb2JhYmx5IHdhbnRzIHRvIGVsaW1pbmF0ZSB0aG9zZSBzcGVjaWZpYyBP
UFBzIGluc3RlYWQuCj4gCj4+IEknbSBzZWVpbmcgYSBkdW1teSByZWd1bGF0b3IgYXMgYSBoZWxw
ZXIgZm9yIGNvbnN1bWVyIGRyaXZlcnMgd2hpY2gKPj4gcmVtb3ZlcyBidXJkZW4gb2YgaGFuZGxp
bmcgYW4gYWJzZW50IChvcHRpb25hbCkgcmVndWxhdG9yLiBJcyB0aGlzIGEKPj4gY29ycmVjdCB1
bmRlcnN0YW5kaW5nIG9mIGEgZHVtbXkgcmVndWxhdG9yPwo+IAo+PiBPbGRlciBEVEJzIGRvbid0
IGhhdmUgYSByZWd1bGF0b3IgYW5kIHdlIHdhbnQgdG8ga2VlcCB0aGVtIHdvcmtpbmcuIFRoaXMK
Pj4gaXMgZXF1YWwgdG8gYSBwaHlzaWNhbGx5IGFic2VudCByZWd1bGF0b3IgYW5kIGluIHRoaXMg
Y2FzZSBpdCdzIGFuCj4+IG9wdGlvbmFsIHJlZ3VsYXRvciwgSU1PLgo+IAo+IE5vLCB5b3UgYXJl
IGZhaWxpbmcgdG8gdW5kZXJzdGFuZCB0aGUgcHVycG9zZSBvZiB0aGlzIGNvZGUuICBUbwo+IHJl
aXRlcmF0ZSB1bmxlc3MgdGhlIGRldmljZSBzdXBwb3J0cyBvcGVyYXRpbmcgd2l0aCB0aGUgc3Vw
cGx5Cj4gcGh5c2ljYWxseSBhYnNlbnQgdGhlbiB0aGUgZHJpdmVyIHNob3VsZCBub3QgYmUgYXR0
ZW1wdGluZyB0byB1c2UKPiByZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCkuICBUaGF0IGV4aXN0cyBz
cGVjaWZpY2FsbHkgZm9yIHRoZSBjYXNlIHdoZXJlCj4gdGhlIHN1cHBseSBtYXkgYmUgYWJzZW50
LCBub3RoaW5nIGVsc2UuICBUaGUgZHVtbXkgcmVndWxhdG9yIGlzIHRoZXJlCj4gcHJlY2lzZWx5
IGZvciB0aGUgY2FzZSB3aGVyZSB0aGUgc3lzdGVtIGRvZXMgbm90IGRlc2NyaWJlIHN1cHBsaWVz
IHRoYXQKPiB3ZSBrbm93IGFyZSByZXF1aXJlZCBmb3IgdGhlIGRldmljZSB0byBmdW5jdGlvbiwg
aXQgZml4ZXMgdXAgdGhhdAo+IG9taXNzaW9uIHNvIHdlIGRvbid0IG5lZWQgdG8gb3BlbiBjb2Rl
IGhhbmRsaW5nIG9mIHRoaXMgaW4gZXZlcnkgc2luZ2xlCj4gY29uc3VtZXIgZHJpdmVyLgoKVGhl
IG9yaWdpbmFsIGludGVudGlvbiBvZiByZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCkgaXMgY2xlYXIg
dG8gbWUsIGJ1dApub3RoaW5nIHJlYWxseSBzdG9wcyBkcml2ZXJzIGZyb20gc2xpZ2h0bHkgcmUt
cHVycG9zaW5nIHRoaXMgQVBJLCBJTU8uCgpEcml2ZXJzIHNob3VsZCBiZSBmcmVlIHRvIGFzc3Vt
ZSB0aGF0IGlmIHJlZ3VsYXRvciBpc24ndCBkZWZpbmVkIGJ5CmZpcm13YXJlLCB0aGVuIGl0J3Mg
cGh5c2ljYWxseSBhYnNlbnQgaWYgdGhpcyBkb2Vzbid0IGJyZWFrIGFueXRoaW5nLiBPZgpjb3Vy
c2UgaW4gc29tZSBjYXNlcyBpdCdzIHVuc2FmZSB0byBtYWtlIHN1Y2ggYXNzdW1wdGlvbnMuIEkg
dGhpbmsgaXQncwphIGJpdCB1bnByYWN0aWNhbCB0byBhcnRpZmljaWFsbHkgbGltaXQgQVBJIHVz
YWdlIHdpdGhvdXQgYSBnb29kIHJlYXNvbiwKaS5lLiBpZiBub3RoaW5nIGJyZWFrcyB1bmRlcm5l
YXRoIG9mIGEgZHJpdmVyLgoKPiBSZWd1bGF0b3JzIHRoYXQgYXJlIHByZXNlbnQgYnV0IG5vdCBk
ZXNjcmliZWQgYnkgdGhlIGZpcm13YXJlIGFyZSBhCj4gY2xlYXJseSBkaWZmZXJlbnQgY2FzZSB0
byByZWd1bGF0b3JzIHRoYXQgYXJlIG5vdCBwaHlzaWNhbGx5IHRoZXJlLAo+IGhhcmR3YXJlIHdp
dGggYWN0dWFsbHkgb3B0aW9uYWwgcmVndWxhdG9ycyB3aWxsIGdlbmVyYWxseSByZXF1aXJlIHNv
bWUKPiBjb25maWd1cmF0aW9uIGZvciB0aGlzIGNhc2UuCj4gCgpJIGhhdmUgZ29vZCBuZXdzLiBB
ZnRlciBzcGVuZGluZyBzb21lIG1vcmUgdGltZSBvbiB0cnlpbmcgb3V0IGRpZmZlcmVudAp0aGlu
Z3MsIEkgZm91bmQgdGhhdCBteSBwcmV2aW91cyBhc3N1bXB0aW9uIGFib3V0IHRoZSBmaXhlZC1y
ZWd1bGF0b3IKd2FzIHdyb25nLCBpdCBhY3R1YWxseSBhY2NlcHRzIHZvbHRhZ2UgY2hhbmdlcywg
aS5lLiByZWd1bGF0b3IgY29uc3VtZXIKZG9lc24ndCBnZXQgYSBlcnJvciBvbiBhIHZvbHRhZ2Ut
Y2hhbmdlLiBUaGlzIGlzIGV4YWN0bHkgd2hhdCBpcyBuZWVkZWQKZm9yIHRoZSBPUFAgY29yZSB0
byB3b3JrIHByb3Blcmx5LgoKVGhpcyBtZWFucyB0aGF0IHRoZXJlIGlzIG5vIG5lZWQgdG8gYWRk
IHNwZWNpYWwgcXVpcmtzIHRvIHdvcmsgYXJvdW5kCmFic2VudCByZWd1bGF0b3JzLCB3ZSB3aWxs
IGp1c3QgYWRkIGEgZml4ZWQgcmVndWxhdG9yIHRvIHRoZSBEVHMgd2hpY2gKZG9uJ3Qgc3BlY2lm
eSBhIHJlYWwgcmVndWxhdG9yLiBUaGUgT1BQIGNvcmUgd2lsbCBwZXJmb3JtIHZvbHRhZ2UKY2hl
Y2tpbmcgYW5kIGZpbHRlciBvdXQgdW5zdXBwb3J0ZWQgT1BQcy4gVGhlIG9sZGVyIERUQnMgd2ls
bCBjb250aW51ZQp0byB3b3JrIGFzIHdlbGwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
