Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4382B1759
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 09:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BF4F6E466;
	Fri, 13 Nov 2020 08:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34FE6E3BB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 19:16:17 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id y16so7550893ljk.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Nov 2020 11:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=jhfgYY14US6m4wxn2OreBeb6CQeVO8DRDGhHQIgAX+o=;
 b=JFNyFw3LyyoB90fZPGzibsAizgKSOjs+HqVe40YhbRGey2zTAPm90qOBN8X1CJVzoO
 M3SYYsbwVohly2d/++o0SchoujkkkZR3dQt9ALW0Nr5as8bdsOwP9tSGe6IWLUkjDbLQ
 195IBsC4Go1c1FjWE4ifCXQMePRx9EASGLxk3zkSi25VwJ40hSyML0Ad1Owq7P06AL8m
 dFmcJl1TYbfZeVB79l6ZTjRGThpjEH8gcPMSD2d7MgbQCdIrxVuQr31nNcK/3J9UPz8n
 C+0AtkGaTIthUSxYky3m4HNI/HHnDyM1MWHC5gE8hZrjpfxfX3nJfxmyVs2Ix2MChWKO
 Ve6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=jhfgYY14US6m4wxn2OreBeb6CQeVO8DRDGhHQIgAX+o=;
 b=NmJepri+5eoXiHDsK6AW4ks07JEl+mXLMW1ykQG9t6gzRVZrmuiCnS8moJwXnTOLXy
 Kg3r4I3UIWjB9D7JQVu5Vg35KC9BUMJy8ZnbM+LVcIfOnYXFCl0gz6nAksx+wrZ08wSU
 GOYHchymz3Lez55pJLLiUAaRL6ze7GpLM3SAJB+az5fOlO7+udmT2sFyjBDxyLBOqfTE
 NU2QQXWokrCy+0ZW1kDFe15YMmgZIxLhjDL6Jv0WJ8mZWNb5I6iEGFImLABKjrJ2CDu2
 9V2kHYBbmQrctgc3xZCKOXUBD+BfMWU9TE2YxHS4e6WoikJEFUbg1L+R+6B/iKFCZ0g8
 4L2w==
X-Gm-Message-State: AOAM532VZwkqg9sYhPY6ZCBlti9xaOph5zW1y2WJrAQhHquBcNuK963+
 UiGCcg8XGzvhjbuaQZnub34=
X-Google-Smtp-Source: ABdhPJzE5qPV9KbGM96b/lBJNsGC5IOm8d97RUP9808EMVCjf5Dc6sywu66SXsgtyXC8GPiqUvektg==
X-Received: by 2002:a05:651c:95:: with SMTP id 21mr428933ljq.307.1605208576330; 
 Thu, 12 Nov 2020 11:16:16 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru.
 [109.252.193.159])
 by smtp.googlemail.com with ESMTPSA id z19sm721401lfd.128.2020.11.12.11.16.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Nov 2020 11:16:15 -0800 (PST)
Subject: Re: [PATCH v1 11/30] drm/tegra: dc: Support OPP and SoC core voltage
 scaling
To: Mark Brown <broonie@kernel.org>
References: <20201104234427.26477-1-digetx@gmail.com>
 <20201104234427.26477-12-digetx@gmail.com> <20201110202945.GF2375022@ulmo>
 <20201110203257.GC5957@sirena.org.uk>
 <72ae6462-13df-9fcb-510e-8e57eee0f035@gmail.com>
 <20201111115534.GA4847@sirena.org.uk>
 <dd26eb18-8ac4-22a6-29b0-dbbe5fa6075b@gmail.com>
 <20201112171600.GD4742@sirena.org.uk>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b4b06c1d-c9d4-43b2-c6eb-93f8cb6c677d@gmail.com>
Date: Thu, 12 Nov 2020 22:16:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <20201112171600.GD4742@sirena.org.uk>
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

MTIuMTEuMjAyMCAyMDoxNiwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+IE9uIFRodSwgTm92IDEy
LCAyMDIwIGF0IDA3OjU5OjM2UE0gKzAzMDAsIERtaXRyeSBPc2lwZW5rbyB3cm90ZToKPj4gMTEu
MTEuMjAyMCAxNDo1NSwgTWFyayBCcm93biDQv9C40YjQtdGCOgo+Pj4gT24gV2VkLCBOb3YgMTEs
IDIwMjAgYXQgMTI6MjM6NDFBTSArMDMwMCwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IAo+Pj4+
IEkgYWxyZWFkeSBjaGFuZ2VkIHRoYXQgY29kZSB0byB1c2UgcmVndWxhdG9yX2dldF9vcHRpb25h
bCgpIGZvciB2Mi4KPiAKPj4+IFRoYXQgZG9lc24ndCBsb29rIGVudGlyZWx5IGFwcHJvcHJpYXRl
IGdpdmVuIHRoYXQgdGhlIGNvcmUgZG9lcyBtb3N0Cj4+PiBsaWtlbHkgcmVxdWlyZSBzb21lIGtp
bmQgb2YgcG93ZXIgdG8gb3BlcmF0ZS4KPiAKPj4gV2Ugd2lsbCBuZWVkIHRvIGRvIHRoaXMgYmVj
YXVzZSBvbGRlciBEVEJzIHdvbid0IGhhdmUgdGhhdCByZWd1bGF0b3IgYW5kCj4+IHdlIHdhbnQg
dG8ga2VlcCB0aGVtIHdvcmtpbmcuCj4gCj4+IEFsc28sIHNvbWUgZGV2aWNlLXRyZWVzIHdvbid0
IGhhdmUgdGhhdCByZWd1bGF0b3IgYW55d2F5cyBiZWNhdXNlIGJvYXJkCj4+IHNjaGVtYXRpY3Mg
aXNuJ3QgYXZhaWxhYmxlLCBhbmQgdGh1cywgd2UgY2FuJ3QgZml4IHRoZW0uCj4gCj4gVGhpcyBp
cyB3aGF0IGR1bW15IHN1cHBsaWVzIGFyZSBmb3I/CgpCdXQgaXQncyBub3QgYWxsb3dlZCB0byBj
aGFuZ2Ugdm9sdGFnZSBvZiBhIGR1bW15IHJlZ3VsYXRvciwgaXMgaXQKaW50ZW50aW9uYWw/Cgo+
Pj4+IFJlZ2FyZGluZyB0aGUgZW51bWVyYXRpbmcgc3VwcG9ydGVkIHZvbHRhZ2UuLiBJIHRoaW5r
IHRoaXMgc2hvdWxkIGJlCj4+Pj4gZG9uZSBieSB0aGUgT1BQIGNvcmUsIGJ1dCByZWd1bGF0b3Ig
Y29yZSBkb2Vzbid0IHdvcmsgd2VsbCBpZgo+Pj4+IHJlZ3VsYXRvcl9nZXQoKSBpcyBpbnZva2Vk
IG1vcmUgdGhhbiBvbmUgdGltZSBmb3IgdGhlIHNhbWUgZGV2aWNlLCBhdAo+Pj4+IGxlYXN0IHRo
ZXJlIGlzIGEgbG91ZCBkZWJ1Z2ZzIHdhcm5pbmcgYWJvdXQgYW4gYWxyZWFkeSBleGlzdGluZwo+
IAo+Pj4gSSBkb24ndCB1bmRlcnN0YW5kIHdoeSB0aGlzIHdvdWxkIGJlIGFuIGlzc3VlIC0gaWYg
bm90aGluZyBlbHNlIHRoZSBjb3JlCj4+PiBjb3VsZCBqdXN0IG9mZmVyIGFuIGludGVyZmFjZSB0
byB0cmlnZ2VyIHRoZSBjaGVjay4KPiAKPj4gSXQncyBub3QgYW4gaXNzdWUsIEkganVzdCBkZXNj
cmliZWQgd2hhdCBoYXBwZW5zIHdoZW4gZGV2aWNlIGRyaXZlcgo+PiB0cmllcyB0byBnZXQgYSBy
ZWd1bGF0b3IgdHdpY2UuCj4gCj4+IFRoZXJlIHdhcyBhbiBpc3N1ZSBvbmNlIHRoYXQgY2hlY2sg
aXMgYWRkZWQgdG8gdGhlIHJlZ3VsYXRvciBjb3JlIGNvZGUuCj4+IEJ1dCBwZXJoYXBzIG5vdCB3
b3J0aCB0byBkaXNjdXNzIGl0IGZvciBub3cgYmVjYXVzZSBJIGRvbid0IHJlbWVtYmVyCj4+IGRl
dGFpbHMuCj4gCj4gU28gdGhlcmUncyBubyBrbm93biBvYnN0YWNsZSB0byBwdXR0aW5nIGVudW1l
cmF0aW9uIG9mIHN1cHBvcnRlZAo+IHZvbHRhZ2VzIGludG8gdGhlIE9QUCBjb3JlIHRoZW4/ICBJ
J20gYSBiaXQgY29uZnVzZWQgaGVyZS4KCkl0J3MgYW4gb2JzdGFjbGUgaWYgYm90aCBPUFAgYW5k
IGRldmljZSBkcml2ZXIgbmVlZCB0byBnZXQgdGhlIHNhbWUKcmVndWxhdG9yLiBMaWtlIGluIHRo
ZSBjYXNlIG9mIHRoaXMgRFJNIGRyaXZlciwgd2hpY2ggbmVlZCB0byBjb250cm9sCnRoZSB2b2x0
YWdlIGluc3RlYWQgb2YgYWxsb3dpbmcgT1BQIGNvcmUgdG8gZG8gaXQuCgpQbGVhc2Ugbm90aWNl
IHRoYXQgZGV2bV90ZWdyYV9kY19vcHBfdGFibGVfaW5pdCgpIG9mIHRoaXMgcGF0Y2ggZG9lc24n
dAp1c2UgZGV2X3BtX29wcF9zZXRfcmVndWxhdG9ycygpLCB3aGljaCB3b3VsZCBhbGxvdyBPUFAg
Y29yZSB0byBmaWx0ZXIKb3V0IHVuc3VwcG9ydGVkIE9QUHMuIEJ1dCB0aGVuIE9QUCBjb3JlIHdp
bGwgbmVlZCBuZWVkIHRvIGdldCBhbiBhbHJlYWR5CnJlcXVlc3RlZCByZWd1bGF0b3IgYW5kIHRo
aXMgZG9lc24ndCB3b3JrIHdlbGwuCgo+Pj4+IGRpcmVjdG9yeSBmb3IgYSByZWd1bGF0b3IuIEl0
J3MgZWFzeSB0byBjaGVjayB3aGV0aGVyIHRoZSBkZWJ1Zwo+Pj4+IGRpcmVjdG9yeSBleGlzdHMg
YmVmb3JlIGNyZWF0aW5nIGl0LCBsaWtlIHRoZXJtYWwgZnJhbWV3b3JrIGRvZXMgaXQgZm9yCj4+
Pj4gZXhhbXBsZSwgYnV0IHRoZW4gdGhlcmUgd2VyZSBzb21lIG90aGVyIG1vcmUgZGlmZmljdWx0
IGlzc3Vlcy4uIEkgZG9uJ3QKPj4+PiByZWNhbGwgd2hhdCB0aGV5IHdlcmUgcmlnaHQgbm93LiBQ
ZXJoYXBzIHdpbGwgYmUgZWFzaWVyIHRvIHNpbXBseSBnZXQgYQo+Pj4+IGVycm9yIGZyb20gcmVn
dWxhdG9yX3NldF92b2x0YWdlKCkgZm9yIG5vdyBiZWNhdXNlIGl0IHNob3VsZG4ndCBldmVyCj4+
Pj4gaGFwcGVuIGluIHByYWN0aWNlLCB1bmxlc3MgZGV2aWNlLXRyZWUgaGFzIHdyb25nIGNvbnN0
cmFpbnRzLgo+IAo+Pj4gVGhlIGNvbnN0cmFpbnRzIG1pZ2h0IG5vdCBiZSB3cm9uZywgdGhlcmUg
bWlnaHQgYmUgc29tZSBib2FyZCB3aGljaCBoYXMKPj4+IGEgY29uc3RyYWludCBzb21ld2hlcmUg
Zm9yIAo+IAo+PiBJbiB0aGlzIGNhc2UgYm9hcmQncyBEVCBzaG91bGRuJ3Qgc3BlY2lmeSB1bnN1
cHBvcnRhYmxlIE9QUHMuCj4gCj4gQWgsIHNvIGVhY2ggYm9hcmQgZHVwbGljYXRlcyB0aGUgT1BQ
IHRhYmxlcyB0aGVuLCBvciB0aGVyZSdzIGFuCj4gZXhwZWN0YXRpb24gdGhhdCBpZiB0aGVyZSdz
IHNvbWUgbGltaXQgdGhlbiB0aGV5J2xsIGNvcHkgYW5kIG1vZGlmeSB0aGUKPiB0YWJsZT8gIElm
IHRoYXQncyB0aGUgY2FzZSB0aGVuIGl0J3MgYSBiaXQgcmVkdW5kYW50IHRvIGRvIGZpbHRlcmlu
Zwo+IGluZGVlZC4KCkkgdGhpbmsgdGhpcyBpcyBub3Qgc3RyaWN0bHkgZGVmaW5lZC4gRWl0aGVy
IHdheSB3aWxsIHdvcmssIGFsdGhvdWdoCnBlcmhhcHMgaXQgc2hvdWxkIGJlIG1vcmUgcHJlZmVy
cmVkIHRoYXQgdW5zdXBwb3J0ZWQgT1BQcyBhcmVuJ3QgcHJlc2VudAppbiBhIGRldmljZS10cmVl
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
