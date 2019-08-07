Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A40884864
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 11:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576D28922F;
	Wed,  7 Aug 2019 09:07:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82D8989916;
 Wed,  7 Aug 2019 09:07:00 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id g17so90544079wrr.5;
 Wed, 07 Aug 2019 02:07:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=UIpcr8YYxIc20s7apfyxPwkze7TOZUQg29wLz+EYcU0=;
 b=AxnhpouOyFCzlPZGfsXraUjkIf3hzXH6IqP3BmFO7ic+KNLMtPLU4IWK6lpiUjqvvx
 k00+si9v56zP2Y4EC+YhgRyA+yDuYm8dNtKBqz0D/SX4SJJ54D8s4/gQ+Iqto+/PZydx
 tkrKh4WX28ArQd3nwsqGk5QUiO3adWr2ghtwMDbi9CMnfGGFVrHF1kIoYI62e9nRvoy7
 fO4tux2IfNLaWHtdxDXsKKZrWOXP5Ojk610Lta6SFs86A55CznOOhpNkot1QBW5tLIiG
 dahcUSyzI6KroGbqvJiLYYRETbMCysjicOqtaItpUlv5oxpHE2Yhf0Rr+XSFtt0X+k0/
 x5mw==
X-Gm-Message-State: APjAAAWD2w9+BMnpLA8xvU0SqkVFIj2RGk1NxJnKguVBiLhPtzHSm+TM
 wqt3RDTYLDH20HvPgxoWrqxyM+e6
X-Google-Smtp-Source: APXvYqx0UxjWRBaqUTlUmhz/4LD1XqmHtRzw7GljgeUhmO+VAL3ZWJ/q6OCUNKgtcLZ+rTRwkSGd/Q==
X-Received: by 2002:adf:dc51:: with SMTP id m17mr9786863wrj.256.1565168819207; 
 Wed, 07 Aug 2019 02:06:59 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id k13sm4808563wro.97.2019.08.07.02.06.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 07 Aug 2019 02:06:58 -0700 (PDT)
Subject: Re: [PATCH 7/8] dma-buf: add reservation_object_fences helper
To: Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20190806150134.104222-1-christian.koenig@amd.com>
 <20190806150134.104222-7-christian.koenig@amd.com>
 <156511947882.6198.3242911017545657039@skylake-alporthouse-com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <7dfbf200-2cee-ac38-0063-fded38d7809e@gmail.com>
Date: Wed, 7 Aug 2019 11:06:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156511947882.6198.3242911017545657039@skylake-alporthouse-com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=UIpcr8YYxIc20s7apfyxPwkze7TOZUQg29wLz+EYcU0=;
 b=ptkA3vbrQw1dooDTVEE2Sia9AawCGX9pfzr2NEQaxzhfcpVQ4XXpjz03PaxZoFZiK9
 q7E4lpepJo3rKgkqibzQHBecioyjuqq/B30B5FglBc/GTb5budf6ofgtzvlDphTpaDDJ
 gMlCdyqdkRVjclwO04uxhMR8lM5hV8bda7VHkrkN61eMUwYbrCF18yMcha3mAn1j+Ckz
 u/l4E1BztXfOqcyPV1t2GO2L7H/w9aCKSUyl8+7hseIT5/rJJpE0mJzdr6zmztbf5aIG
 0CMZExhPLX1Ro2qEPYC3nlBnVonxv+NBrAV7oXvd+2b7xzY4CXnFbq9tt9oGfx0IMFNG
 1udQ==
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDYuMDguMTkgdW0gMjE6MjQgc2NocmllYiBDaHJpcyBXaWxzb246Cj4gUXVvdGluZyBDaHJp
c3RpYW4gS8O2bmlnICgyMDE5LTA4LTA2IDE2OjAxOjMzKQo+PiBBZGQgYSBuZXcgaGVscGVyIHRv
IGdldCBhIGNvbnNpc3RlbnQgc2V0IG9mIHBvaW50ZXJzIGZyb20gdGhlIHJlc2VydmF0aW9uCj4+
IG9iamVjdC4gV2hpbGUgYXQgaXQgZ3JvdXAgYWxsIGFjY2VzcyBoZWxwZXJzIHRvZ2V0aGVyIGlu
IHRoZSBoZWFkZXIgZmlsZS4KPiBBaCwgbmVlZHMgdG8gYmUgZWFybGllciA6KQoKQWgsIGNyYXAu
IFRoYXQgZ290IGluY29ycmVjdGx5IHJlb3JkZXJlZCB3aGlsZSBtb3ZpbmcgdGhlIGZpeGVzIHRv
IHRoZSAKYmVnaW5uaW5nIG9mIHRoZSBzZXQuCgo+ICAgCj4+ICsvKioKPj4gKyAqIHJlc2VydmF0
aW9uX29iamVjdF9mZW5jZXMgLSByZWFkIGNvbnNpc3RlbnQgZmVuY2UgcG9pbnRlcnMKPj4gKyAq
IEBvYmo6IHJlc2VydmF0aW9uIG9iamVjdCB3aGVyZSB3ZSBnZXQgdGhlIGZlbmNlcyBmcm9tCj4+
ICsgKiBAZXhjbDogcG9pbnRlciBmb3IgdGhlIGV4Y2x1c2l2ZSBmZW5jZQo+PiArICogQGxpc3Q6
IHBvaW50ZXIgZm9yIHRoZSBzaGFyZWQgZmVuY2UgbGlzdAo+PiArICoKPj4gKyAqIE1ha2Ugc3Vy
ZSB3ZSBoYXZlIGEgY29uc2lzdGVuIGV4Y2x1c2l2ZSBmZW5jZSBhbmQgc2hhcmVkIGZlbmNlIGxp
c3QuCj4+ICsgKiBNdXN0IGJlIGNhbGxlZCB3aXRoIHJjdSByZWFkIHNpZGUgbG9jayBoZWxkLgo+
PiArICovCj4+ICtzdGF0aWMgaW5saW5lIHZvaWQKPj4gK3Jlc2VydmF0aW9uX29iamVjdF9mZW5j
ZXMoc3RydWN0IHJlc2VydmF0aW9uX29iamVjdCAqb2JqLAo+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgIHN0cnVjdCBkbWFfZmVuY2UgKipleGNsLAo+PiArICAgICAgICAgICAgICAgICAgICAg
ICAgIHN0cnVjdCByZXNlcnZhdGlvbl9vYmplY3RfbGlzdCAqKmxpc3QpCj4+ICt7Cj4+ICsgICAg
ICAgdW5zaWduZWQgaW50IHNlcTsKPj4gKwo+PiArICAgICAgIGRvIHsKPj4gKyAgICAgICAgICAg
ICAgIHNlcSA9IHJlYWRfc2VxY291bnRfYmVnaW4oJm9iai0+c2VxKTsKPj4gKyAgICAgICAgICAg
ICAgICpleGNsID0gcmN1X2RlcmVmZXJlbmNlKG9iai0+ZmVuY2VfZXhjbCk7Cj4+ICsgICAgICAg
ICAgICAgICAqbGlzdCA9IHJjdV9kZXJlZmVyZW5jZShvYmotPmZlbmNlKTsKPj4gKyAgICAgICB9
IHdoaWxlIChyZWFkX3NlcWNvdW50X3JldHJ5KCZvYmotPnNlcSwgc2VxKSk7Cj4+ICt9Cj4gSSB3
b3VsZCBwZXJzb25hbGx5IHByZWZlciByZXR1cm4gZXhjbCByYXRoZXIgdGhhbiBoYXZlIGl0IGFz
IGEgc2Vjb25kCj4gb3V0cGFyYW0sIGJ1dCBJJ2QgbGVhdmUgdGhhdCB0byBnY2MgdG8gZGVjaWRl
Lgo+Cj4gSGF2aW5nIHN0YXJlZCBhdCB0aGlzLCBJIGFncmVlIHRoaXMgZG9lcyB0aGUgcmlnaHQg
dGhpbmcuIFRoZSBpbXBvcnRhbnQKPiBwb2ludCBmcm9tIGFsbCBjYWxsZXJzJyBwZXJzcGVjdGl2
ZSBpcyB0aGF0IHRoZSBjb21iaW5hdGlvbiBvZiBwb2ludGVycwo+IGlzIGNvbnNpc3RlbnQgZm9y
IHRoaXMgcmN1X3JlYWRfbG9jay4gQW5kIHJjdV9kZXJlZmVyZW5jZSBlbmZvcmNlcyB0aGUKPiBj
YWxsZXJzIGRvIGhvbGQgcmN1X3JlYWRfbG9jay4KPgo+IEkgZGlkbid0IGNoZWNrIGFsbCB0aGUg
Y29udmVyc2lvbnMsIGp1c3Qgc3RhcmVkIGF0IHRoZSBoZWFydCBvZiB0aGUKPiBwcm9ibGVtLgo+
Cj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgoK
VGhhbmtzLgoKR29pbmcgdG8gZml4IHRoYXQgdXAsCkNocmlzdGlhbi4KCj4gLUNocmlzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
