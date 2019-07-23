Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D4872083
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 22:10:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6776E3B4;
	Tue, 23 Jul 2019 20:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9CC56E3B2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 20:10:07 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id d4so45124323edr.13
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 13:10:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tUGsIMqs+SNwG7Wa9YryBNQpEKIGP6cwaQO1e+qGdxc=;
 b=qARJMRej1e9D7STZu/GuXoxzOHzIeqC2PSBfbugH77v2u3My+Fk4VNO59LWGRdJJTF
 9wQX/ffp7X5HPyk5Pwmg2i6Iz5A+x/URA0KRUvh1tpmJA1BKHCAfJUlOj28+h0aXUtZn
 C1i/lZcYt3DpdpGH1xNN44dt6rpEaugwy1Ft2TN0hUCmOw6ORzmV59JR818HIhZ6BkIE
 2zsxaYjCRtq18V+yA+kWjmx+WD9epeCIe7hE2vqHcXRIKzdtEC/yql7svYM3tvCAeavo
 Xz7teFEt3UupQElkJlZk/qjr7J5B36x/j6icvn0Dma0iQVYw5VHtI+VL8Mt+SOFbbouy
 ei0Q==
X-Gm-Message-State: APjAAAULqAti7kvyLQkuYs/WzGuYBZGvHd9vk3Qn1IzuK8hqKojQH0/a
 rGptGW9hrTuL0wA72gZbKi0RwIaZLSg5+pAq1TI=
X-Google-Smtp-Source: APXvYqwhuDJQWXBFchqde9MjHuP6u9IF20GvxtLPj5ajprHQwMd007jx38zaufMthkY298kJ81UMcN1e0xvJwExaeSk=
X-Received: by 2002:a17:906:f85:: with SMTP id
 q5mr60616455ejj.192.1563912606283; 
 Tue, 23 Jul 2019 13:10:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190624194908.121273-1-john.stultz@linaro.org>
 <20190624194908.121273-3-john.stultz@linaro.org>
 <20190718100654.GA19666@infradead.org>
 <CALAqxLX1s4mbitE-_1s1vFPJrbrCKqpyhYoFW0V6hMEqE=eKVw@mail.gmail.com>
In-Reply-To: <CALAqxLX1s4mbitE-_1s1vFPJrbrCKqpyhYoFW0V6hMEqE=eKVw@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 23 Jul 2019 13:09:55 -0700
Message-ID: <CAF6AEGuM1+pimGNhyKHbYR0BdH=hH+Sai0es8RjGHE9jKHjngw@mail.gmail.com>
Subject: Re: [PATCH v6 2/5] dma-buf: heaps: Add heap helpers
To: John Stultz <john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=tUGsIMqs+SNwG7Wa9YryBNQpEKIGP6cwaQO1e+qGdxc=;
 b=UDPrieZ62DZ2mz2+GrBJZ4KAevDIjPajIqVhkjl2OjmbVFtwXQggxYhH/QuuJAvk35
 1T6VBw9/33sOIL8raiWYoSMHWLIko/lgbzkxEZPp9dZ4Xn0O3GitxItv4t5EeELcg3tY
 V07jYxMBs4xXkAKNMyzbedqrCkl1yYzHG+0W2sfZIK7dKnDXnurviMo/kO+47YSr/t3p
 8LLJpiV1smiHKIiCDXDYCNc8IBPKlmCd1dGasujo7jS02GhqaVxBKFTurNAKtZiC7Rd4
 SHGu7j6p/OvE0lU1fUJFFIyKieaxXKU98sxS/cdL0mE+7/uyW5G6zWVvZKRdwXbKIWwl
 GK3Q==
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
Cc: Yudongbin <yudongbin@hisilicon.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Xu YiPing <xuyiping@hisilicon.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>,
 "Chenfeng \(puck\)" <puck.chen@hisilicon.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 "Xiaqing \(A\)" <saberlily.xia@hisilicon.com>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>,
 butao <butao@hisilicon.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgOTowOSBQTSBKb2huIFN0dWx0eiA8am9obi5zdHVsdHpA
bGluYXJvLm9yZz4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAxOCwgMjAxOSBhdCAzOjA2IEFNIENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gPgo+ID4gSXMgdGhl
cmUgYW55IGV4bHVzaW9uIGJldHdlZW4gbW1hcCAvIHZtYXAgYW5kIHRoZSBkZXZpY2UgYWNjZXNz
aW5nCj4gPiB0aGUgZGF0YT8gIFdpdGhvdXQgdGhhdCB5b3UgYXJlIGdvaW5nIHRvIHJ1biBpbnRv
IGEgbG90IG9mIGNvaGVyZW5jeQo+ID4gcHJvYmxlbXMuCgpkbWFfZmVuY2UgaXMgYmFzaWNhbGx5
IHRoZSB3YXkgdG8gaGFuZGxlIGV4Y2x1c2lvbiBiZXR3ZWVuIGRpZmZlcmVudApkZXZpY2UgYWNj
ZXNzIChzaW5jZSBkZXZpY2UgYWNjZXNzIHRlbmRzIHRvIGJlIGFzeW5jaHJvbm91cykuICBGb3IK
ZGV2aWNlPC0+ZGV2aWNlIGFjY2VzcywgZWFjaCBkcml2ZXIgaXMgZXhwZWN0ZWQgdG8gdGFrZSBj
YXJlIG9mIGFueQpjYWNoZShzKSB0aGF0IHRoZSBkZXZpY2UgbWlnaHQgaGF2ZS4gIChJZS4gZGV2
aWNlIHdyaXRpbmcgdG8gYnVmZmVyCnNob3VsZCBmbHVzaCBpdCdzIGNhY2hlcyBpZiBuZWVkZWQg
YmVmb3JlIHNpZ25hbGxpbmcgZmVuY2UgdG8gbGV0CnJlYWRpbmcgZGV2aWNlIGtub3cgdGhhdCBp
dCBpcyBzYWZlIHRvIHJlYWQsIGV0Yy4pCgpfYmVnaW4vZW5kX2NwdV9hY2Nlc3MoKSBpcyBpbnRl
bmRlZCB0byBiZSB0aGUgZXhjbHVzaW9uIGZvciBDUFUgYWNjZXNzCih3aGljaCBpcyBzeW5jaHJv
bm91cykKCkJSLAotUgoKPiBUaGlzIGhhcyBhY3R1YWxseSBiZWVuIGEgY29uY2VybiBvZiBtaW5l
IHJlY2VudGx5LCBidXQgYXQgdGhlIGhpZ2hlcgo+IGRtYS1idWYgY29yZSBsZXZlbC4gIENvbmNl
cHR1YWxseSwgdGhlcmUgaXMgdGhlCj4gZG1hX2J1Zl9tYXBfYXR0YWNobWVudCgpIGFuZCBkbWFf
YnVmX3VubWFwX2F0dGFjaG1lbnQoKSBjYWxscyBkcml2ZXJzCj4gdXNlIHRvIG1hcCB0aGUgYnVm
ZmVyIHRvIGFuIGF0dGFjaGVkIGRldmljZSwgYW5kIHRoZXJlIGFyZSB0aGUKPiBkbWFfYnVmX2Jl
Z2luX2NwdV9hY2Nlc3MoKSBhbmQgZG1hX2J1Zl9lbmRfY3B1X2FjY2VzcygpIGNhbGxzIHdoaWNo
Cj4gYXJlIHRvIGJlIGRvbmUgd2hlbiB0b3VjaGluZyB0aGUgY3B1IG1hcHBlZCBwYWdlcy4gIFRo
ZXNlIGxvb2sgbGlrZQo+IHNlcmlhbGl6aW5nIGZ1bmN0aW9ucywgYnV0IGFjdHVhbGx5IGRvbid0
IHNlZW0gdG8gaGF2ZSBhbnkgZW5mb3JjZW1lbnQKPiBtZWNoYW5pc20gdG8gZXhjbHVkZSBwYXJh
bGxlbCBhY2Nlc3MuCj4KPiBUbyBtZSBpdCBzZWVtcyBsaWtlIGFkZGluZyB0aGUgZXhjbHVzaW9u
IGJldHdlZW4gdGhvc2Ugb3BlcmF0aW9ucwo+IHNob3VsZCBiZSBkb25lIGF0IHRoZSBkbWFidWYg
Y29yZSBsZXZlbCwgYW5kIHdvdWxkIGFjdHVhbGx5IGJlIGhlbHBmdWwKPiBmb3Igb3B0aW1pemlu
ZyBzb21lIG9mIHRoZSBjYWNoZSBtYWludGVuYW5jZSBydWxlcyB3LyBkbWFidWYuICBEb2VzCj4g
dGhpcyBzb3VuZCBsaWtlIHNvbWV0aGluZyBjbG9zZXIgdG8gd2hhdCB5b3VyIHN1Z2dlc3Rpbmcs
IG9yIGFtIEkKPiBtaXN1bmRlcnN0YW5kaW5nIHlvdXIgcG9pbnQ/Cj4KPiBBZ2FpbiwgSSByZWFs
bHkgYXBwcmVjaWF0ZSB0aGUgcmV2aWV3IGFuZCBmZWVkYmFjayEKPgo+IFRoYW5rcyBzbyBtdWNo
IQo+IC1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
