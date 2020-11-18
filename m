Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04F172B8D18
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 09:31:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B8F56E509;
	Thu, 19 Nov 2020 08:31:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 522826E437
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 15:30:27 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id a65so3111366wme.1
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 07:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=/SDkP0vkKcya+FIJEA+cPnvkReKH8EFRybVcIu9lk9M=;
 b=D1BytoB6O03jBcACE4ZhAx92rosgf9wYS2rPHzrBHSfzKSQ0rUMTzY3xFt8TEHE9k0
 YIIiPTr94Bc7PUn7zwCH9EE+zMbRYo4nnn12/5TpwUogKdAUXolEut/KGLgjD8p1u9z+
 dAYzFovYhNWO+3rZhx7IoAOF+fVoq+FdKg0mn20a1XWJUdbwnQ20TZzHguw90k+BaASf
 7P+5q6YagtEKTiL9MoxhoA0aKwhwyc39dlKHA6piMdU8eOhplAdHXaNEcJpNvodiG8QL
 JTVWIUvFDbkbxf7qqsJ2NSlEFEvArxEdy8Xn4hO7Lb5vG6HcO7PIrZcevw0aveSWR9kJ
 kERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/SDkP0vkKcya+FIJEA+cPnvkReKH8EFRybVcIu9lk9M=;
 b=emxTj41cnsTov9h/bs19rtJF2mkt+vHlyXDwauuybdMChGpw4wJxqZv01xeYBf9a6i
 kioy3TSqVxsoyEMy7cO5c6t8My0npvPi7QISmhqqqpez0jlb2hJhNh7UlNctMe1Gbep+
 +WZ62+7P2ciZ+n3xoEAwhOm9fI9VVeggK2Rc0xYhHtsZJaz5XWIuZ3+4WworY98/5H1A
 vGD8HvJPoSL/oOKmt6nKcn2NGkxF8s5lyLgEK1h3nh8mD25ZN1FXW7XcIckEvaq7r73/
 URW94tO083kTKQN/zicCSlpM4Btg2m8HM3yMA0kBZlV4YhIJw8WCzvafQrYSO75LAbG8
 hpag==
X-Gm-Message-State: AOAM530v+IzRSbJKzX3rhfeuD6/YqoRp0GrQ0zpDIut4Kvpxt7PHib3B
 36qLAQAoPL3/8NtTHfaQkgfA5cnIDvm3gA==
X-Google-Smtp-Source: ABdhPJzFItfcbj1D5GPsiBo7RkrZes7kt1MjC/X61M/dwKw8ehmZ/XH4IHzsd6fKnSmspZvESraPog==
X-Received: by 2002:a1c:790c:: with SMTP id l12mr560063wme.47.1605713425424;
 Wed, 18 Nov 2020 07:30:25 -0800 (PST)
Received: from MacBook-Pro.local ([212.45.64.13])
 by smtp.googlemail.com with ESMTPSA id w11sm4405479wmg.36.2020.11.18.07.30.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Nov 2020 07:30:24 -0800 (PST)
Subject: Re: [PATCH v9 01/17] memory: tegra30: Support interconnect framework
To: Dmitry Osipenko <digetx@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Peter De Schrijver <pdeschrijver@nvidia.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Mikko Perttunen <cyndis@kapsi.fi>,
 Viresh Kumar <vireshk@kernel.org>, Peter Geis <pgwipeout@gmail.com>,
 Nicolas Chauvet <kwizart@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>
References: <20201115212922.4390-1-digetx@gmail.com>
 <20201115212922.4390-2-digetx@gmail.com>
 <61e777d9-b730-02c6-cedf-cf0aa1a50fb8@linaro.org>
 <7e484678-43cc-e612-1017-73ed580f9840@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <83a3f33b-3695-2a40-1c2b-5c38d117c1ad@linaro.org>
Date: Wed, 18 Nov 2020 17:30:22 +0200
MIME-Version: 1.0
In-Reply-To: <7e484678-43cc-e612-1017-73ed580f9840@gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 19 Nov 2020 08:31:38 +0000
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTguMTEuMjAgMDowMiwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDE3LjExLjIwMjAgMjM6
MjQsIEdlb3JnaSBEamFrb3Yg0L/QuNGI0LXRgjoKPj4gSGkgRG1pdHJ5LAo+Pgo+PiBUaGFuayB5
b3Ugd29ya2luZyBvbiB0aGlzIQo+Pgo+PiBPbiAxNS4xMS4yMCAyMzoyOSwgRG1pdHJ5IE9zaXBl
bmtvIHdyb3RlOgo+Pj4gTm93IEludGVybmFsIGFuZCBFeHRlcm5hbCBtZW1vcnkgY29udHJvbGxl
cnMgYXJlIG1lbW9yeSBpbnRlcmNvbm5lY3Rpb24KPj4+IHByb3ZpZGVycy4gVGhpcyBhbGxvd3Mg
dXMgdG8gdXNlIGludGVyY29ubmVjdCBBUEkgZm9yIHR1bmluZyBvZiBtZW1vcnkKPj4+IGNvbmZp
Z3VyYXRpb24uIEVNQyBkcml2ZXIgbm93IHN1cHBvcnRzIE9QUHMgYW5kIERWRlMuIE1DIGRyaXZl
ciBub3cKPj4+IHN1cHBvcnRzIHR1bmluZyBvZiBtZW1vcnkgYXJiaXRyYXRpb24gbGF0ZW5jeSwg
d2hpY2ggbmVlZHMgdG8gYmUgZG9uZQo+Pj4gZm9yIElTTyBtZW1vcnkgY2xpZW50cywgbGlrZSBh
IERpc3BsYXkgY2xpZW50IGZvciBleGFtcGxlLgo+Pj4KPj4+IFRlc3RlZC1ieTogUGV0ZXIgR2Vp
cyA8cGd3aXBlb3V0QGdtYWlsLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IERtaXRyeSBPc2lwZW5r
byA8ZGlnZXR4QGdtYWlsLmNvbT4KPj4+IC0tLQo+Pj4gIMKgIGRyaXZlcnMvbWVtb3J5L3RlZ3Jh
L0tjb25maWfCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4+PiAgwqAgZHJpdmVycy9tZW1vcnkvdGVn
cmEvdGVncmEzMC1lbWMuYyB8IDM0OSArKysrKysrKysrKysrKysrKysrKysrKysrKystLQo+Pj4g
IMKgIGRyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMzAuY8KgwqDCoMKgIHwgMTczICsrKysrKysr
KysrKystCj4+PiAgwqAgMyBmaWxlcyBjaGFuZ2VkLCA1MDEgaW5zZXJ0aW9ucygrKSwgMjIgZGVs
ZXRpb25zKC0pCj4+Pgo+PiBbLi5dPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZW1vcnkvdGVncmEv
dGVncmEzMC5jCj4+IGIvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEzMC5jCj4+PiBpbmRleCBk
MDMxNGYyOTYwOGQuLmVhODQ5MDAzMDE0YiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvbWVtb3J5
L3RlZ3JhL3RlZ3JhMzAuYwo+Pj4gKysrIGIvZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEzMC5j
Cj4+IFsuLl0KPj4+ICsKPj4+ICtzdGF0aWMgaW50IHRlZ3JhMzBfbWNfaWNjX3NldChzdHJ1Y3Qg
aWNjX25vZGUgKnNyYywgc3RydWN0IGljY19ub2RlCj4+PiAqZHN0KQo+Pj4gK3sKPj4+ICvCoMKg
wqAgc3RydWN0IHRlZ3JhX21jICptYyA9IGljY19wcm92aWRlcl90b190ZWdyYV9tYyhzcmMtPnBy
b3ZpZGVyKTsKPj4+ICvCoMKgwqAgY29uc3Qgc3RydWN0IHRlZ3JhX21jX2NsaWVudCAqY2xpZW50
ID0gJm1jLT5zb2MtPmNsaWVudHNbc3JjLT5pZF07Cj4+PiArwqDCoMKgIHU2NCBwZWFrX2JhbmR3
aWR0aCA9IGljY191bml0c190b19icHMoc3JjLT5wZWFrX2J3KTsKPj4+ICsKPj4+ICvCoMKgwqAg
LyoKPj4+ICvCoMKgwqDCoCAqIFNraXAgcHJlLWluaXRpYWxpemF0aW9uIHRoYXQgaXMgZG9uZSBi
eSBpY2Nfbm9kZV9hZGQoKSwgd2hpY2gKPj4+IHNldHMKPj4+ICvCoMKgwqDCoCAqIGJhbmR3aWR0
aCB0byBtYXhpbXVtIGZvciBhbGwgY2xpZW50cyBiZWZvcmUgZHJpdmVycyBhcmUgbG9hZGVkLgo+
Pj4gK8KgwqDCoMKgICoKPj4+ICvCoMKgwqDCoCAqIFRoaXMgZG9lc24ndCBtYWtlIHNlbnNlIGZv
ciB1cyBiZWNhdXNlIHdlIGRvbid0IGhhdmUgZHJpdmVycwo+Pj4gZm9yIGFsbAo+Pj4gK8KgwqDC
oMKgICogY2xpZW50cyBhbmQgaXQncyBva2F5IHRvIGtlZXAgY29uZmlndXJhdGlvbiBsZWZ0IGZy
b20gYm9vdGxvYWRlcgo+Pj4gK8KgwqDCoMKgICogZHVyaW5nIGJvb3QsIGF0IGxlYXN0IGZvciB0
b2RheS4KPj4+ICvCoMKgwqDCoCAqLwo+Pj4gK8KgwqDCoCBpZiAoc3JjID09IGRzdCkKPj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4KPj4gTml0OiBUaGUgInByb3BlciIgd2F5IHRvIGV4
cHJlc3MgdGhpcyBzaG91bGQgYmUgdG8gaW1wbGVtZW50IHRoZQo+PiAuZ2V0X2J3KCkgY2FsbGJh
Y2sgdG8gcmV0dXJuIHplcm8gYXMgaW5pdGlhbCBhdmVyYWdlL3BlYWsgYmFuZHdpZHRoLgo+PiBJ
J20gd29uZGVyaW5nIGlmIHRoaXMgd2lsbCB3b3JrIGhlcmU/Cj4+Cj4+IFRoZSByZXN0IGxvb2tz
IGdvb2QgdG8gbWUhCj4gCj4gSGVsbG8gR2VvcmdpLAo+IAo+IFJldHVybmluZyB6ZXJvcyBkb2Vz
bid0IGFsbG93IHVzIHRvIHNraXAgdGhlIGluaXRpYWxpemF0aW9uIHRoYXQgaXMgZG9uZQo+IGJ5
IHByb3ZpZGVyLT5zZXQobm9kZSwgbm9kZSkgaW4gaWNjX25vZGVfYWRkKCkuIEl0IHdpbGwgcmVj
b25maWd1cmUKPiBtZW1vcnkgbGF0ZW5jeSBpbiBhY2NvcmRhbmNlIHRvIGEgemVybyBtZW1vcnkg
YmFuZHdpZHRoLCB3aGljaCBpcyB3cm9uZwo+IHRvIGRvLgo+IAo+IEl0IGFjdHVhbGx5IHNob3Vs
ZCBiZSBtb3JlIHByZWZlcnJlZCB0byBwcmVzZXQgYmFuZHdpZHRoIHRvIGEgbWF4aW11bQo+IGJl
Zm9yZSBhbGwgZHJpdmVycyBhcmUgc3luY2VkLCBidXQgdGhpcyBzaG91bGQgYmUgZG9uZSBvbmx5
IG9uY2Ugd2Ugd2lsbAo+IHdpcmUgdXAgYWxsIGRyaXZlcnMgdG8gdXNlIElDQyBmcmFtZXdvcmsu
IEZvciBub3cgaXQncyBzYWZlciB0byBrZWVwIHRoZQo+IGRlZmF1bHQgaGFyZHdhcmUgY29uZmln
dXJhdGlvbiB1bnRvdWNoZWQuCgpPaywgdGhhbmtzIGZvciBjbGFyaWZ5aW5nISBJcyB0aGVyZSBh
IHdheSB0byByZWFkIHRoaXMgaGFyZHdhcmUgCmNvbmZpZ3VyYXRpb24gYW5kIGNvbnZlcnQgaXQg
dG8gaW5pdGlhbCBiYW5kd2lkdGg/IFRoYXQncyB0aGUKaWRlYSBvZiB0aGUgZ2V0X2J3KCkgY2Fs
bGJhY2sgYWN0dWFsbHkuIEkgYW0ganVzdCBjdXJpb3VzIGFuZAp0cnlpbmcgdG8gZ2V0IGEgYmV0
dGVyIHVuZGVyc3RhbmRpbmcgaG93IHRoaXMgd29ya3MgYW5kIGlmIGl0CndvdWxkIGJlIHVzZWZ1
bCBmb3IgVGVncmEuCgpUaGFua3MsCkdlb3JnaQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
