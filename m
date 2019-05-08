Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F540171A4
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 08:33:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72CF8937C;
	Wed,  8 May 2019 06:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405EB8937C
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 06:33:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id j20so13679831lfh.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 23:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wSfgw7BiPTIK7rSF926mclLkOzCKoWt4POZASR80exU=;
 b=ElOOhQiE4bVtjPHLjtSBHB8BShvvwHAzzF3chivAIpLGW4TlQpfQmZ8LW3Yc3svjIS
 /Q2DLp/GgoOSSNKSsKmbRv1la1iYbfQR8MuN+qVFRE6Dv1HcCCz4tSMrR+1/MUBnsj7c
 Qep3tZcYzGByJL6OeN56pusbg5SpBkhNbVqaCqeoberAmDhJ/UJRf+jam9mIulZ+BFBN
 omLMG7UbsTH93JJWKikOWY+vV6UaDMG72jYp70S34L+1LmNPJPJ+SnoL3PX8n3Y468Q+
 oJaTZBsBsJlPH2gXSo4/FF5coRrmlPK3iz0y2Xmwvq8kubmq1z6YDx9eomUFaAQPydOT
 mZqw==
X-Gm-Message-State: APjAAAWCh5rmMuXwhE8QdGPM63PFu3W2TAbsjwl1LpN2HcdcoLneDtSn
 /bbPYewSBqfpHFdffaNkpaY=
X-Google-Smtp-Source: APXvYqzKo3uOdRfceBfe2sas5wmynfulmeB4OPUXute987F0OwmCAXSLAI7TT44VpKJPPuRM4yAFlQ==
X-Received: by 2002:a19:a40f:: with SMTP id q15mr17527331lfc.121.1557297203407; 
 Tue, 07 May 2019 23:33:23 -0700 (PDT)
Received: from [10.17.182.20] (ll-22.209.223.85.sovam.net.ua. [85.223.209.22])
 by smtp.gmail.com with ESMTPSA id
 a11sm238059ljb.31.2019.05.07.23.33.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 23:33:22 -0700 (PDT)
Subject: Re: [PATCH] drm/cma-helper: Fix drm_gem_cma_free_object()
To: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>,
 dri-devel@lists.freedesktop.org
References: <20190426124753.53722-1-noralf@tronnes.org>
 <67fc69cc-7db3-968e-2492-acd01dc3def5@tronnes.org>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <1816a2c7-d409-09f5-964e-ebe7d4b91d1d@gmail.com>
Date: Wed, 8 May 2019 09:33:21 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <67fc69cc-7db3-968e-2492-acd01dc3def5@tronnes.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=wSfgw7BiPTIK7rSF926mclLkOzCKoWt4POZASR80exU=;
 b=XvtuTdiXdG50tx+b8t5XwkSkDso6nENBekOdEmZda7xvisWmptANvIxR6iYQRN6/ca
 h18uEkd4f7FA+9WxqLyhGDlLKchuF0UDxvZeZjdq/VAdX3sxp5nK41isI3OxaPWAeSF/
 uxeP2Uzq83bFlQgE4HTGsQ+1I7mhWnsxHLofoObgQg75XDVKIo84/1Z+NfBLAy9lLqO9
 6tqHK1S8CELuYGOmgfWWjBxaiNlBfbHDYUuxJHHI4vXUvjaHqiXkQYm0olq0iBwpNLmA
 UjEkQy799azHbghK9M/dNeSAa01GuSIBA326RSM2Moy3vMHvMwYEZVAjFEoahb9TaxW0
 Z/9w==
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
Cc: "Li, Tingqian" <tingqian.li@intel.com>, stable@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNS83LzE5IDc6MDQgUE0sIE5vcmFsZiBUcsO4bm5lcyB3cm90ZToKPiBIaSwKPgo+IENvdWxk
IHNvbWVvbmUgcGxlYXNlIGhhdmUgYSBsb29rIGF0IHRoaXMgb25lPwo+Cj4gTm9yYWxmLgo+Cj4g
RGVuIDI2LjA0LjIwMTkgMTQuNDcsIHNrcmV2IE5vcmFsZiBUcsO4bm5lczoKPj4gVGhlIGxvZ2lj
IGZvciBmcmVlaW5nIGFuIGltcG9ydGVkIGJ1ZmZlciB3aXRoIGEgdmlydHVhbCBhZGRyZXNzIGlz
Cj4+IGJyb2tlbi4gSXQgd2lsbCBmcmVlIHRoZSBidWZmZXIgaW5zdGVhZCBvZiB1bm1hcHBpbmcg
dGhlIGRtYSBidWYuCj4+IEZpeCBieSByZXZlcnNpbmcgdGhlIGlmIGxhZGRlciBhbmQgZmlyc3Qg
Y2hlY2sgaWYgdGhlIGJ1ZmZlciBpcyBpbXBvcnRlZC4KPj4KPj4gRml4ZXM6IGI5MDY4Y2RlNTFl
ZSAoImRybS9jbWEtaGVscGVyOiBBZGQgRFJNX0dFTV9DTUFfVk1BUF9EUklWRVJfT1BTIikKPj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKPj4gUmVwb3J0ZWQtYnk6ICJMaSwgVGluZ3FpYW4i
IDx0aW5ncWlhbi5saUBpbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IE5vcmFsZiBUcsO4bm5l
cyA8bm9yYWxmQHRyb25uZXMub3JnPgpSZXZpZXdlZC1ieTogT2xla3NhbmRyIEFuZHJ1c2hjaGVu
a28gPG9sZWtzYW5kcl9hbmRydXNoY2hlbmtvQGVwYW0uY29tPgo+PiAtLS0KPj4KPj4gICBkcml2
ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVyLmMgfCA4ICsrKystLS0tCj4+ICAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZ2VtX2NtYV9oZWxwZXIuYwo+PiBpbmRleCBjYzI2NjI1YjRiMzMuLmUwMWNlZWQwOWU2
NyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jCj4+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZ2VtX2NtYV9oZWxwZXIuYwo+PiBAQCAtMTg2LDEz
ICsxODYsMTMgQEAgdm9pZCBkcm1fZ2VtX2NtYV9mcmVlX29iamVjdChzdHJ1Y3QgZHJtX2dlbV9v
YmplY3QgKmdlbV9vYmopCj4+ICAgCj4+ICAgCWNtYV9vYmogPSB0b19kcm1fZ2VtX2NtYV9vYmoo
Z2VtX29iaik7Cj4+ICAgCj4+IC0JaWYgKGNtYV9vYmotPnZhZGRyKSB7Cj4+IC0JCWRtYV9mcmVl
X3djKGdlbV9vYmotPmRldi0+ZGV2LCBjbWFfb2JqLT5iYXNlLnNpemUsCj4+IC0JCQkgICAgY21h
X29iai0+dmFkZHIsIGNtYV9vYmotPnBhZGRyKTsKPj4gLQl9IGVsc2UgaWYgKGdlbV9vYmotPmlt
cG9ydF9hdHRhY2gpIHsKPj4gKwlpZiAoZ2VtX29iai0+aW1wb3J0X2F0dGFjaCkgewo+PiAgIAkJ
aWYgKGNtYV9vYmotPnZhZGRyKQo+PiAgIAkJCWRtYV9idWZfdnVubWFwKGdlbV9vYmotPmltcG9y
dF9hdHRhY2gtPmRtYWJ1ZiwgY21hX29iai0+dmFkZHIpOwo+PiAgIAkJZHJtX3ByaW1lX2dlbV9k
ZXN0cm95KGdlbV9vYmosIGNtYV9vYmotPnNndCk7Cj4+ICsJfSBlbHNlIGlmIChjbWFfb2JqLT52
YWRkcikgewo+PiArCQlkbWFfZnJlZV93YyhnZW1fb2JqLT5kZXYtPmRldiwgY21hX29iai0+YmFz
ZS5zaXplLAo+PiArCQkJICAgIGNtYV9vYmotPnZhZGRyLCBjbWFfb2JqLT5wYWRkcik7Cj4+ICAg
CX0KPj4gICAKPj4gICAJZHJtX2dlbV9vYmplY3RfcmVsZWFzZShnZW1fb2JqKTsKPj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5n
IGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
