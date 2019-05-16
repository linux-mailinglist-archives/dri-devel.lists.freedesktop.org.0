Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C41F20948
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 16:12:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5915189613;
	Thu, 16 May 2019 14:12:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F4B18961D;
 Thu, 16 May 2019 14:12:47 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id c5so3551297wrs.11;
 Thu, 16 May 2019 07:12:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=lSwbFWzRiS8FZuFJszUREBuA/RBtw3ld1q66H70SoTI=;
 b=rALwGptIJySkefiYhzEvbAG/ML1equ+T5EYk9P584HYLC4Mo5v5soZDXHF7dcYlJkN
 HicExpiXAREWjlhVRMRioP2lXsUPAcOYWR4a987TYzqQDTomKNZ/80dmcXMwO1y5Y8pG
 ULPgMhgwCW5FPyobTHfZl6FP8gY+fKJAR+9PkB0CyP1vrDZ9cZukQXGoDzPpTxust/05
 lORiFLhSG2N0/M3BsiZJo9MAxJgjwanixrgwej2Fq8zfh0nIWjqGRBM+TheUmPYJdeLx
 kw0HA8XKPVZ+wg+whO4JHthTpdMsquSVtOxGFZ4NcMW1fMV+UwbTqtjhxX36QuV2DtAj
 GJ7g==
X-Gm-Message-State: APjAAAXR1AcuEWdMCgqfcN+feyVmoF/igP3zF5pD7unDYRkfR6xycNfF
 MyNYiH5SUepCa1BDsJ00lZI=
X-Google-Smtp-Source: APXvYqxSSO3ZWWMBPz0oHOCL9eMrinbzzDReUF3UBViYg3o0NnEQ4bFGsajhnTYXG3U9vuStZF1itg==
X-Received: by 2002:adf:aa09:: with SMTP id p9mr4050839wrd.59.1558015965837;
 Thu, 16 May 2019 07:12:45 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id d3sm7480770wmf.46.2019.05.16.07.12.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 16 May 2019 07:12:45 -0700 (PDT)
Subject: Re: [RFC PATCH v2 4/5] drm, cgroup: Add total GEM buffer allocation
 limit
To: Kenny Ho <y2kenny@gmail.com>, =?UTF-8?Q?Christian_K=c3=b6nig?=
 <christian.koenig@amd.com>
References: <20181120185814.13362-1-Kenny.Ho@amd.com>
 <20190509210410.5471-1-Kenny.Ho@amd.com>
 <20190509210410.5471-5-Kenny.Ho@amd.com>
 <d81e8f55-9602-818e-0f9c-1d9d150133b1@intel.com>
 <CAOWid-ftUrVVWPu9KuS8xpWKNQT6_FtxB8gEyEAn9nLD6qxb5Q@mail.gmail.com>
 <7db2caae-7eab-7c6a-fe90-89cb9cae30b4@amd.com>
 <6e124f5e-f83f-5ca1-4616-92538f202653@gmail.com>
 <CAOWid-fQgah16ycz-V-ymsm7yKUnFTeTSBaW4MK=2mqUHhCcmw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <1c50433e-442b-cada-7928-b00ed0f6f9d2@gmail.com>
Date: Thu, 16 May 2019 16:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAOWid-fQgah16ycz-V-ymsm7yKUnFTeTSBaW4MK=2mqUHhCcmw@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=lSwbFWzRiS8FZuFJszUREBuA/RBtw3ld1q66H70SoTI=;
 b=Uko2mgZrKk4b9lz6lS3uhyQnaceHyGNZWwcgSU2iuowhTsGzwK6e2wzRnsR6dMcxN0
 LptM5PbOFAIrGEsnd54Y8GlCxHO7Ko1Oax/xYIDr07K2aY9glOZEUjNLiec4i0G0Hg/s
 7iEcpwcQJqUrBersyzxZymlvs8t4KYnD479zMAxvdfekYSOX6QTqz45S02NsIHMxbpPz
 sIuhlXOwRU4qa/uiORC63hEnCCkWyxo7rIOJPfSNDzTmw6ETo3PVLKQiWQlL93oTyQ2R
 bEoUXnB7REXZw/RsxhEgjF6pFnGTp/OZyGpsOK2Gw3LEsFoo91dBsDJMXzRvPbTujS4V
 UvZA==
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
Cc: "sunnanyong@huawei.com" <sunnanyong@huawei.com>, "Ho,
 Kenny" <Kenny.Ho@amd.com>, "Welty, Brian" <brian.welty@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Tejun Heo <tj@kernel.org>, "cgroups@vger.kernel.org" <cgroups@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMDUuMTkgdW0gMTY6MDMgc2NocmllYiBLZW5ueSBIbzoKPiBPbiBUaHUsIE1heSAxNiwg
MjAxOSBhdCAzOjI1IEFNIENocmlzdGlhbiBLw7ZuaWcKPiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtl
bkBnbWFpbC5jb20+IHdyb3RlOgo+PiBBbSAxNi4wNS4xOSB1bSAwOToxNiBzY2hyaWViIEtvZW5p
ZywgQ2hyaXN0aWFuOgo+Pj4gQW0gMTYuMDUuMTkgdW0gMDQ6Mjkgc2NocmllYiBLZW5ueSBIbzoK
Pj4+PiBPbiBXZWQsIE1heSAxNSwgMjAxOSBhdCA1OjI2IFBNIFdlbHR5LCBCcmlhbiA8YnJpYW4u
d2VsdHlAaW50ZWwuY29tPiB3cm90ZToKPj4+Pj4gT24gNS85LzIwMTkgMjowNCBQTSwgS2Vubnkg
SG8gd3JvdGU6Cj4+Pj4+PiBFYWNoIGZpbGUgaXMgbXVsdGktbGluZWQgd2l0aCBvbmUgZW50cnkv
bGluZSBwZXIgZHJtIGRldmljZS4KPj4+Pj4gTXVsdGktbGluZSBpcyBjb3JyZWN0IGZvciBtdWx0
aXBsZSBkZXZpY2VzLCBidXQgSSBiZWxpZXZlIHlvdSBuZWVkCj4+Pj4+IHRvIHVzZSBhIEtFWSB0
byBkZW5vdGUgZGV2aWNlIGZvciBib3RoIHlvdXIgc2V0IGFuZCBnZXQgcm91dGluZXMuCj4+Pj4+
IEkgZGlkbid0IHNlZSB5b3VyIHNldCBmdW5jdGlvbnMgcmVhZGluZyBhIGtleSwgb3IgdGhlIGdl
dCBmdW5jdGlvbnMKPj4+Pj4gcHJpbnRpbmcgdGhlIGtleSBpbiBvdXRwdXQuCj4+Pj4+IGNncm91
cHMtdjIgY29udmVudGlvbnMgbWVudGlvbiB1c2luZyBLRVkgb2YgbWFqb3I6bWlub3IsIGJ1dCBJ
IHRoaW5rCj4+Pj4+IHlvdSBjYW4gdXNlIGRybV9taW5vciBhcyBrZXk/Cj4+Pj4gR2l2ZW4gdGhp
cyBjb250cm9sbGVyIGlzIHNwZWNpZmljIHRvIHRoZSBkcm0ga2VybmVsIHN1YnN5c3RlbSB3aGlj
aAo+Pj4+IHVzZXMgbWlub3IgdG8gaWRlbnRpZnkgZHJtIGRldmljZSwKPj4+IFdhaXQgYSBzZWNv
bmQsIHVzaW5nIHRoZSBEUk0gbWlub3IgaXMgYSBnb29kIGlkZWEgaW4gdGhlIGZpcnN0IHBsYWNl
Lgo+PiBXZWxsIHRoYXQgc2hvdWxkIGhhdmUgcmVhZCAiaXMgbm90IGEgZ29vZCBpZGVhIi4uCj4+
Cj4+IEkgaGF2ZSBhIHRlc3Qgc3lzdGVtIHdpdGggYSBWZWdhMTAgYW5kIGEgVmVnYTIwLiBXaGlj
aCBkZXZpY2UgZ2V0cyB3aGljaAo+PiBtaW5vciBpcyBub3Qgc3RhYmxlLCBidXQgcmF0aGVyIGRl
ZmluZWQgYnkgdGhlIHNjYW4gb3JkZXIgb2YgdGhlIFBDSWUgYnVzLgo+Pgo+PiBOb3JtYWxseSB0
aGUgc2NhbiBvcmRlciBpcyBhbHdheXMgdGhlIHNhbWUsIGJ1dCBhZGRpbmcgb3IgcmVtb3ZpbmcK
Pj4gZGV2aWNlcyBvciBkZWxheWluZyB0aGluZ3MganVzdCBhIGxpdHRsZSBiaXQgZHVyaW5nIGlu
aXQgaXMgZW5vdWdoIHRvCj4+IGNoYW5nZSB0aGlzLgo+Pgo+PiBXZSBuZWVkIHNvbWV0aGluZyBs
aWtlIHRoZSBMaW51eCBzeXNmcyBsb2NhdGlvbiBvciBzaW1pbGFyIHRvIGhhdmUgYQo+PiBzdGFi
bGUgaW1wbGVtZW50YXRpb24uCj4gSSBnZXQgdGhhdCwgd2hpY2ggaXMgd2h5IEkgZG9uJ3QgdXNl
IG1pbm9yIHRvIGlkZW50aWZ5IGNhcmRzIGluIHVzZXIKPiBzcGFjZSBhcHBzIEkgd3JvdGU6Cj4g
aHR0cHM6Ly9naXRodWIuY29tL1JhZGVvbk9wZW5Db21wdXRlL2s4cy1kZXZpY2UtcGx1Z2luL2Js
b2IvYzI2NTljOWQxZDA3MTNjYWQzNmZiNTI1NjY4MTEyNTEyMWU2ZTMyZi9pbnRlcm5hbC9wa2cv
YW1kZ3B1L2FtZGdwdS5nbyNMODUKClllYWgsIHRoYXQgaXMgY2VydGFpbmx5IGEgcG9zc2liaWxp
dHkuCgo+IEJ1dCB3aXRoaW4gdGhlIGtlcm5lbCwgSSB0aGluayBteSB1c2Ugb2YgbWlub3IgaXMg
Y29uc2lzdGVudCB3aXRoIHRoZQo+IHJlc3Qgb2YgdGhlIGRybSBzdWJzeXN0ZW0uICBJIGhvcGUg
SSBkb24ndCBuZWVkIHRvIHJlZm9ybSB0aGUgd2F5IHRoZQo+IGRybSBzdWJzeXN0ZW0gdXNlIG1p
bm9yIGluIG9yZGVyIHRvIGludHJvZHVjZSBhIGNncm91cCBjb250cm9sbGVyLgoKV2VsbCBJIHdv
dWxkIHRyeSB0byBhdm9pZCB1c2luZyB0aGUgbWlub3IgYW5kIGF0IGxlYXN0IGxvb2sgZm9yIAph
bHRlcm5hdGl2ZXMuIEUuZy4gd2hhdCBkb2VzIHVkZXYgdXNlcyB0byBpZGVudGlmeSB0aGUgZGV2
aWNlcyBmb3IgCmV4YW1wbGU/IEFuZCBJSVJDIHdlIGhhdmUgc29tZXRoaW5nIGxpa2UgYSAiZGV2
aWNlLW5hbWUiIGluIHRoZSBrZXJuZWwgCmFzIHdlbGwgKHdoYXQncyBwcmludGVkIGluIHRoZSBs
b2dzKS4KClRoZSBtaW5pbXVtIHdlIG5lZWQgdG8gZG8gaXMgZ2V0IGF3YXkgZnJvbSB0aGUgbWlu
b3I9bGluZW51bSBhcHByb2FjaCwgCmNhdXNlIGFzIERhbmllbCBwb2ludGVkIG91dCB0aGUgbWlu
b3IgYWxsb2NhdGlvbiBpcyBxdWl0ZSBhIG1lc3MgYW5kIG5vdCAKbmVjZXNzYXJ5IGNvbnRpZ3Vv
dXMuCgpSZWdhcmRzLApDaHJpc3RpYW4uCgo+Cj4gUmVnYXJkcywKPiBLZW5ueQo+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYW1kLWdmeCBtYWlsaW5n
IGxpc3QKPiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vYW1kLWdmeAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
