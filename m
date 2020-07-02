Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C81211CE2
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 09:26:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDCBA6EA50;
	Thu,  2 Jul 2020 07:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88816E1F6
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 05:07:23 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id q7so16786392ljm.1
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jul 2020 22:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=K8qAxukp9RFHBdE6WbPdUscXd1LN37Q3w/L7nkVqajo=;
 b=VqmofHQSAPlBpUCxL4rTflz7VqMU9XTFBswSFaT0mDdL6H43EXQ6FW5GHx4GlI7qGQ
 fEWxbeqBLWdHdB3DYZYDwPVZ0TiKrh8ErZ7LQelQzlLERoz5pvCKWWqfZaEFF2S7Qfxi
 nTsyD4aCv1sdijFfHId/0snc/8sfXCxZIWVg45Q9+5LcS+t2jODYxnCfWthpcsa1xAMi
 wUPvrBa4VAWOIzAfn3408W/wDQyJMf+AWsYE39v3QnoIg8h6UBoemF34AiS3v2wY97B3
 +G8SYZZqXujqM4GXX1thRU7Z0izEwGNmZA27wVvteuiL68sk+Y/utUm12dBmn44goyca
 d19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K8qAxukp9RFHBdE6WbPdUscXd1LN37Q3w/L7nkVqajo=;
 b=dotLGkCGuvH/XBCHaUaLknNi64nvcZY/8+7ddl2RjDjbHWUaIIr3zZHr9AMFpJdJn6
 wsNnDmOk4knKT3vjdwCgyXy292faW0uG1Yy8cFw5ncv07QvWfgkZCKah51Cqmsft4tFu
 0+77gMHp3kCmAgQVHmv/RO9P+nHpQ/5rAr4sxG5a20LrXiOvTxu7amEl/Wf8lo80Tvpj
 MC47o+GvndlmFgE9/83tGuXl2r1hZvHWZ0QFAMb4s9PCPhWCkYAWAwU90ftJoNyICBMy
 pIjM6jqKXo2v251jM9e723nInfCZOeMF9sPLJRZAkL3JgLk3i+fcP6JVT/N2Zbj5kVLA
 0GfA==
X-Gm-Message-State: AOAM533yfvBWlLBN24pZdJf6TA0uqOWuMWX+YLnO8d+iTzjwtG7Ukcr7
 oByd0D9A/nPiRq3WVl9eujM=
X-Google-Smtp-Source: ABdhPJwLKDqPP4hbBy1c68/UE02Q/XfYccws317CV11krxYDMmfgvP+z/OUQQesuwn5uoDx9F/1QfA==
X-Received: by 2002:a2e:9b94:: with SMTP id z20mr13271728lji.404.1593666441965; 
 Wed, 01 Jul 2020 22:07:21 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru.
 [79.139.237.54])
 by smtp.googlemail.com with ESMTPSA id w19sm1331770ljm.120.2020.07.01.22.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Jul 2020 22:07:20 -0700 (PDT)
Subject: Re: [PATCH v4 12/37] PM / devfreq: tegra20: Use MC timings for
 building OPP table
To: Chanwoo Choi <cw00.choi@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>
References: <20200609131404.17523-1-digetx@gmail.com>
 <CGME20200609131458epcas1p2c774a0302bcef2c02790c2cb8cad57a0@epcas1p2.samsung.com>
 <20200609131404.17523-13-digetx@gmail.com>
 <4ea7fe00-7676-3186-8222-6e0d0eb8ed1f@samsung.com>
From: Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4b22d3ee-f303-d81d-e261-187d4a46e749@gmail.com>
Date: Thu, 2 Jul 2020 08:07:19 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4ea7fe00-7676-3186-8222-6e0d0eb8ed1f@samsung.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 02 Jul 2020 07:24:22 +0000
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?QXJ0dXIgxZp3aWdvxYQ=?= <a.swigon@samsung.com>,
 linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MDIuMDcuMjAyMCAwNzoxOCwgQ2hhbndvbyBDaG9pINC/0LjRiNC10YI6Cj4gSGkgRG1pdHJ5LAo+
IAo+IE9uIDYvOS8yMCAxMDoxMyBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+PiBUaGUgY2xr
X3JvdW5kX3JhdGUoKSB3b24ndCBiZSB1c2FibGUgZm9yIGJ1aWxkaW5nIE9QUCB0YWJsZSBvbmNl
Cj4+IGludGVyY29ubmVjdCBzdXBwb3J0IHdpbGwgYmUgYWRkZWQgdG8gdGhlIEVNQyBkcml2ZXIg
YmVjYXVzZSB0aGF0IENMSyBBUEkKPj4gZnVuY3Rpb24gbGltaXRzIHRoZSByb3VuZGVkIHJhdGUg
YmFzZWQgb24gdGhlIGNsayByYXRlIHRoYXQgaXMgaW1wb3NlZCBieQo+PiBhY3RpdmUgY2xrLXVz
ZXJzLCBhbmQgdGh1cywgdGhlIHJvdW5kaW5nIHdvbid0IHdvcmsgYXMgZXhwZWN0ZWQgaWYKPj4g
aW50ZXJjb25uZWN0IHdpbGwgc2V0IHRoZSBtaW5pbXVtIEVNQyBjbG9jayByYXRlIGJlZm9yZSBk
ZXZmcmVxIGRyaXZlciBpcwo+PiBsb2FkZWQuIFRoZSBzdHJ1Y3QgdGVncmFfbWMgY29udGFpbnMg
bWVtb3J5IHRpbWluZ3Mgd2hpY2ggY291bGQgYmUgdXNlZCBieQo+PiB0aGUgZGV2ZnJlcSBkcml2
ZXIgZm9yIGJ1aWxkaW5nIHVwIE9QUCB0YWJsZSBpbnN0ZWFkIG9mIHJvdW5kaW5nIGNsb2NrCj4+
IHJhdGUsIHRoaXMgcGF0Y2ggaW1wbGVtZW50cyB0aGlzIGlkZWEuCj4+Cj4+IFNpZ25lZC1vZmYt
Ynk6IERtaXRyeSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4gLS0tCj4+ICBkcml2ZXJz
L2RldmZyZXEvdGVncmEyMC1kZXZmcmVxLmMgfCAxOCArKysrKysrKysrKy0tLS0tLS0KPj4gIDEg
ZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9kZXZmcmVxL3RlZ3JhMjAtZGV2ZnJlcS5jIGIvZHJpdmVycy9kZXZm
cmVxL3RlZ3JhMjAtZGV2ZnJlcS5jCj4+IGluZGV4IDY0NjlkYzY5YzVlMC4uYmY1MDRjYTRkZWEy
IDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2RldmZyZXEvdGVncmEyMC1kZXZmcmVxLmMKPj4gKysr
IGIvZHJpdmVycy9kZXZmcmVxL3RlZ3JhMjAtZGV2ZnJlcS5jCj4+IEBAIC0xMjMsOCArMTIzLDcg
QEAgc3RhdGljIGludCB0ZWdyYV9kZXZmcmVxX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2Ug
KnBkZXYpCj4+ICB7Cj4+ICAJc3RydWN0IHRlZ3JhX2RldmZyZXEgKnRlZ3JhOwo+PiAgCXN0cnVj
dCB0ZWdyYV9tYyAqbWM7Cj4+IC0JdW5zaWduZWQgbG9uZyBtYXhfcmF0ZTsKPj4gLQl1bnNpZ25l
ZCBsb25nIHJhdGU7Cj4+ICsJdW5zaWduZWQgaW50IGk7Cj4+ICAJaW50IGVycjsKPj4gIAo+PiAg
CW1jID0gdGVncmFfZ2V0X21lbW9yeV9jb250cm9sbGVyKCk7Cj4+IEBAIC0xNTEsMTIgKzE1MCwx
NyBAQCBzdGF0aWMgaW50IHRlZ3JhX2RldmZyZXFfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikKPj4gIAo+PiAgCXRlZ3JhLT5yZWdzID0gbWMtPnJlZ3M7Cj4+ICAKPj4gLQltYXhf
cmF0ZSA9IGNsa19yb3VuZF9yYXRlKHRlZ3JhLT5lbWNfY2xvY2ssIFVMT05HX01BWCk7Cj4+IC0K
Pj4gLQlmb3IgKHJhdGUgPSAwOyByYXRlIDw9IG1heF9yYXRlOyByYXRlKyspIHsKPj4gLQkJcmF0
ZSA9IGNsa19yb3VuZF9yYXRlKHRlZ3JhLT5lbWNfY2xvY2ssIHJhdGUpOwo+PiArCWlmICghbWMt
Pm51bV90aW1pbmdzKSB7Cj4gCj4gQ291bGQgeW91IGV4cGxhaW4gd2hhdCBpcyBtZWFuaW5nIG9m
ICdudW1fdGltaW5nPwoKVGhlIG51bV90aW1pbmdzIGlzIHRoZSBudW1iZXIgb2YgbWVtb3J5IHRp
bWluZ3MgZGVmaW5lZCBpbiBhCmRldmljZS10cmVlLiBPbmUgdGltaW5nIGNvbmZpZ3VyYXRpb24g
cGVyIG1lbW9yeSBjbG9jayByYXRlLgoKPiBBbHNvLCB3aHkgYWRkIHRoZSBvcHAgZW50cnkgaW4g
Y2FzZSBvZiBtYy0+bnVtX3RpbWluZ3MgaXMgemVybz8KClRpbWluZ3MgbWF5IGJlIG5vdCBkZWZp
bmVkIGluIHNvbWUgZGV2aWNlLXRyZWVzIGF0IGFsbCBhbmQgaW4gdGhpcyBjYXNlCm1lbW9yeSBh
bHdheXMgcnVubmluZyBvbiBhIGZpeGVkIGNsb2NrIHJhdGUuCgpUaGUgZGV2ZnJlcSBkcml2ZXIg
d29uJ3QgYmUgcHJhY3RpY2FsbHkgdXNlZnVsIGlmIG1jLT5udW1fdGltaW5ncyBpcwp6ZXJvIHNp
bmNlIG1lbW9yeSBmcmVxdWVuY3kgY2FuJ3QgYmUgY2hhbmdlZCwgYnV0IGFueXdheXMgd2UnZCB3
YW50IHRvCmxvYWQgdGhlIGRldmZyZXEgZHJpdmVyIGluIG9yZGVyIHRvIHByZXZlbnQgY29uZnVz
aW9uIGFib3V0IHdoeSBpdCdzIG5vdApsb2FkZWQuCgpGb3IgZXhhbXBsZSwgeW91IG1heSBhc2sg
c29tZWJvZHkgdG8gc2hvdyBjb250ZW50cyBvZgovc3lzL2NsYXNzL2RldmZyZXEvdGVncmEyMC1k
ZXZmcmVxL3RyYW5zX3N0YXQgYW5kIHRoZSBwZXJzb24gc2F5cyB0byB5b3UKdGhhdCB0aGlzIGZp
bGUgZG9lc24ndCBleGlzdCwgbm93IHlvdSdsbCBoYXZlIHRvIGZpZ3VyZSBvdXQgd2hhdApoYXBw
ZW5lZCB0byB0aGUgZGV2ZnJlcSBkcml2ZXIuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
