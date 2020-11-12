Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A65C2B1751
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64D596E471;
	Fri, 13 Nov 2020 08:38:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D9E86E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 16:59:40 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id w15so1765467lji.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 08:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xt95colZf33mgot8tELeNlRansGBvck/Mt4yELIIDqY=;
 b=fHDLJ02XfofqPoW/m/ty+7VMDDU5x/EGpHV/+Yy5G1qvgpLWH4Bj6qirnIfR2GOFHY
 H2rsWty5fFNMq6aCx6XdDWhpV6BR3+tvp61A5zWYd6mxO3JGE39IAl69QXwXp/OPSLOc
 dbjrfCbzaQBa8KcMu6SiyVtP5+MIJvDirOdjY9sY049RqEx6eY2eqm19yoWcz95sPsLg
 NScSb7Br1t6cH2J6CRqeJIQlDccMferVM5GcIzWR9yGjzpka13Dd7CaUaJF4CwdiAUzW
 byu4iX3gr3BVLIGe/LU4yPecdAgxDUtNUIthKeuggKFO5txc0jODLiR2lG9aCqUdXeXb
 ScEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xt95colZf33mgot8tELeNlRansGBvck/Mt4yELIIDqY=;
 b=LkIklVcpWrcwUiGuBRilo0DCWxhSUyL4g3uE+vyeDnvY8CZEPfrY5JlvQOOW6r7zdp
 OKEMx8o/t8KE6kqQjd37ottooQTm5Gwg/FErLMYsc9FzyZ+xCtIlpEJr+1YTzVH9/4y+
 eQ8B5eEbXVx4PPfxmcGI0X6yfHQqPfeiXlSLY/dGGKvurC8Z+ltdl9l3iQsdQo6SIHQG
 MNtj2UEbEh9oeT+xQ8AAuzxGEe3OO+qFDeHxZU8u7Scx+bjDmbELwBbekM1xJhow4xA5
 8MDitdYdBeQ3g0mOJ5Unm29lemorcppRHA/iwV74VWKq3ti5Fpy31UzvGx457E/FByx1
 7c8Q==
X-Gm-Message-State: AOAM530DaZ985KBepKmU7WEpHJI7dunzzU8zeJk8hsxrQ/m3oQvnuTZM
 YRAsFQcAMFem5mHG5l6gf4M=
X-Google-Smtp-Source: ABdhPJyl96aYzliFwkLljLShw56ErRaoK0Xab1vQjJi14A44PY75rTZLE8QOeBZnDRsExRlkCgmYqg==
X-Received: by 2002:a2e:8315:: with SMTP id a21mr166883ljh.29.1605200379012;
 Thu, 12 Nov 2020 08:59:39 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id t5sm691068lfc.75.2020.11.12.08.59.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 08:59:38 -0800 (PST)
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
To: Mark Brown <broonie@kernel.org>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-12-digetx@gmail.com> <20201110202945.GF2375022@ulmo>
 <20201110203257.GC5957@sirena.org.uk>
 <72ae6462-13df-9fcb-510e-8e57eee0f035@gmail.com>
 <20201111115534.GA4847@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <dd26eb18-8ac4-22a6-29b0-dbbe5fa6075b@gmail.com>
Date: Thu, 12 Nov 2020 19:59:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201111115534.GA4847@sirena.org.uk>
Content-Language: en-US
X-Mailman-Approved-At: Fri, 13 Nov 2020 08:38:02 +0000
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

MTEuMTEuMjAyMCAxNDo1NSwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFdlZCwgTm92IDEx
LCAyMDIwIGF0IDEyOjIzOjQxQU0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMTAu
MTEuMjAyMCAyMzozMiwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IAo+Pj4+PiArCWlmICghZGV2
aWNlX3Byb3BlcnR5X3ByZXNlbnQoZGMtPmRldiwgImNvcmUtc3VwcGx5IikpCj4+Pj4+ICsJCXJl
dHVybjsKPiAKPj4+PiBUaGlzIGlzIGEgcG90ZW50aWFsbHkgaGVhdnkgb3BlcmF0aW9uLCBzbyBJ
IHRoaW5rIHdlIHNob3VsZCBhdm9pZCB0aGF0Cj4+Pj4gaGVyZS4gSG93IGFib3V0IHlvdSB1c2Ug
ZGV2bV9yZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCkgaW4gLT5wcm9iZSgpPyBUaGF0Cj4+Pj4gcmV0
dXJucyAtRU5PREVWIGlmIG5vIHJlZ3VsYXRvciB3YXMgc3BlY2lmaWVkLCBpbiB3aGljaCBjYXNl
IHlvdSBjYW4gc2V0Cj4+Pj4gZGMtPmNvcmVfcmVnID0gTlVMTCBhbmQgdXNlIHRoYXQgYXMgdGhl
IGNvbmRpdGlvbiBoZXJlLgo+IAo+Pj4gT3IgZW51bWVyYXRlIHRoZSBjb25maWd1cmFibGUgdm9s
dGFnZXMgYWZ0ZXIgZ2V0dGluZyB0aGUgcmVndWxhdG9yIGFuZAo+Pj4gaGFuZGxlIHRoYXQgYXBw
cm9wcmlhdGVseSB3aGljaCB3b3VsZCBiZSBtb3JlIHJvYnVzdCBpbiBjYXNlIHRoZXJlJ3MKPj4+
IG1pc3Npbmcgb3IgdW51c3VhbCBjb25zdHJhaW50cy4KPiAKPj4gSSBhbHJlYWR5IGNoYW5nZWQg
dGhhdCBjb2RlIHRvIHVzZSByZWd1bGF0b3JfZ2V0X29wdGlvbmFsKCkgZm9yIHYyLgo+IAo+IFRo
YXQgZG9lc24ndCBsb29rIGVudGlyZWx5IGFwcHJvcHJpYXRlIGdpdmVuIHRoYXQgdGhlIGNvcmUg
ZG9lcyBtb3N0Cj4gbGlrZWx5IHJlcXVpcmUgc29tZSBraW5kIG9mIHBvd2VyIHRvIG9wZXJhdGUu
CgpXZSB3aWxsIG5lZWQgdG8gZG8gdGhpcyBiZWNhdXNlIG9sZGVyIERUQnMgd29uJ3QgaGF2ZSB0
aGF0IHJlZ3VsYXRvciBhbmQKd2Ugd2FudCB0byBrZWVwIHRoZW0gd29ya2luZy4KCkFsc28sIHNv
bWUgZGV2aWNlLXRyZWVzIHdvbid0IGhhdmUgdGhhdCByZWd1bGF0b3IgYW55d2F5cyBiZWNhdXNl
IGJvYXJkCnNjaGVtYXRpY3MgaXNuJ3QgYXZhaWxhYmxlLCBhbmQgdGh1cywgd2UgY2FuJ3QgZml4
IHRoZW0uCgo+PiBSZWdhcmRpbmcgdGhlIGVudW1lcmF0aW5nIHN1cHBvcnRlZCB2b2x0YWdlLi4g
SSB0aGluayB0aGlzIHNob3VsZCBiZQo+PiBkb25lIGJ5IHRoZSBPUFAgY29yZSwgYnV0IHJlZ3Vs
YXRvciBjb3JlIGRvZXNuJ3Qgd29yayB3ZWxsIGlmCj4+IHJlZ3VsYXRvcl9nZXQoKSBpcyBpbnZv
a2VkIG1vcmUgdGhhbiBvbmUgdGltZSBmb3IgdGhlIHNhbWUgZGV2aWNlLCBhdAo+PiBsZWFzdCB0
aGVyZSBpcyBhIGxvdWQgZGVidWdmcyB3YXJuaW5nIGFib3V0IGFuIGFscmVhZHkgZXhpc3RpbmcK
PiAKPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRoaXMgd291bGQgYmUgYW4gaXNzdWUgLSBpZiBu
b3RoaW5nIGVsc2UgdGhlIGNvcmUKPiBjb3VsZCBqdXN0IG9mZmVyIGFuIGludGVyZmFjZSB0byB0
cmlnZ2VyIHRoZSBjaGVjay4KCkl0J3Mgbm90IGFuIGlzc3VlLCBJIGp1c3QgZGVzY3JpYmVkIHdo
YXQgaGFwcGVucyB3aGVuIGRldmljZSBkcml2ZXIKdHJpZXMgdG8gZ2V0IGEgcmVndWxhdG9yIHR3
aWNlLgoKVGhlcmUgd2FzIGFuIGlzc3VlIG9uY2UgdGhhdCBjaGVjayBpcyBhZGRlZCB0byB0aGUg
cmVndWxhdG9yIGNvcmUgY29kZS4KQnV0IHBlcmhhcHMgbm90IHdvcnRoIHRvIGRpc2N1c3MgaXQg
Zm9yIG5vdyBiZWNhdXNlIEkgZG9uJ3QgcmVtZW1iZXIKZGV0YWlscy4KCj4+IGRpcmVjdG9yeSBm
b3IgYSByZWd1bGF0b3IuIEl0J3MgZWFzeSB0byBjaGVjayB3aGV0aGVyIHRoZSBkZWJ1Zwo+PiBk
aXJlY3RvcnkgZXhpc3RzIGJlZm9yZSBjcmVhdGluZyBpdCwgbGlrZSB0aGVybWFsIGZyYW1ld29y
ayBkb2VzIGl0IGZvcgo+PiBleGFtcGxlLCBidXQgdGhlbiB0aGVyZSB3ZXJlIHNvbWUgb3RoZXIg
bW9yZSBkaWZmaWN1bHQgaXNzdWVzLi4gSSBkb24ndAo+PiByZWNhbGwgd2hhdCB0aGV5IHdlcmUg
cmlnaHQgbm93LiBQZXJoYXBzIHdpbGwgYmUgZWFzaWVyIHRvIHNpbXBseSBnZXQgYQo+PiBlcnJv
ciBmcm9tIHJlZ3VsYXRvcl9zZXRfdm9sdGFnZSgpIGZvciBub3cgYmVjYXVzZSBpdCBzaG91bGRu
J3QgZXZlcgo+PiBoYXBwZW4gaW4gcHJhY3RpY2UsIHVubGVzcyBkZXZpY2UtdHJlZSBoYXMgd3Jv
bmcgY29uc3RyYWludHMuCj4gCj4gVGhlIGNvbnN0cmFpbnRzIG1pZ2h0IG5vdCBiZSB3cm9uZywg
dGhlcmUgbWlnaHQgYmUgc29tZSBib2FyZCB3aGljaCBoYXMKPiBhIGNvbnN0cmFpbnQgc29tZXdo
ZXJlIGZvciAKPiAKCkluIHRoaXMgY2FzZSBib2FyZCdzIERUIHNob3VsZG4ndCBzcGVjaWZ5IHVu
c3VwcG9ydGFibGUgT1BQcy4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
