Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63F9C41FA
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2019 22:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 460AB6E892;
	Tue,  1 Oct 2019 20:51:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF14F6E892
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Oct 2019 20:51:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id o18so17080574wrv.13
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Oct 2019 13:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JRJlSTe3enCBLAxogNySsJ9S73/uDChBELwRwUUTh7g=;
 b=kxC9qlk93miOJbussbihvfe1mweZIiJke/8/ESDYXMQBF9QRXr3j52SSK3MF4S8M5Q
 qS6VOKLKynBrXSS6PTIeug/7/QLtBoMC1twmq5gCX2kylBxQoOkp/p/XmNf4w6zUFnD1
 DX/iyL6qllJSXItxPMGNph8GUKGyLK77Bzlti5NZ+lpvesLCg3i7bfRjXHVQ+SfBREdd
 jyw5Fhr6KreOdCfFN+Ix8YGkYhzJSS0aVY9bGxZejEkAcH65JH9SLa9yBYFRC3ifSAaO
 8Cijp19C3KJZe7+2G9aiIbzSL6hkXrIeO6S0Jja8anqsBeAYvx8Nio+r6JOwqTAypXeV
 wdVw==
X-Gm-Message-State: APjAAAXpy1QjXbb8xQGwgas82oANuBqH01y3Eii9MQvMvwHD2jL5fYzr
 F9npLQbEvLitz2/ru+5QOqAd4PDvO27Vm+zZ51wn1g==
X-Google-Smtp-Source: APXvYqzx/FZOWaZvriNbKTbyJs7xkM7pO4zOq51rphBY411oSkn14f7uOL3ewgVeUHjtAn7k84AjghvlBQ0Q9RiwrbE=
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr20881280wrq.141.1569963060455; 
 Tue, 01 Oct 2019 13:51:00 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190930074335.6636-1-hdanton@sina.com>
In-Reply-To: <20190930074335.6636-1-hdanton@sina.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 1 Oct 2019 13:50:45 -0700
Message-ID: <CALAqxLWKGEhzqXir8KoeS5EBcbokAY5+=mHrqy0-G9aGraqXXA@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 3/5] dma-buf: heaps: Add system heap to dmabuf
 heaps
To: Hillf Danton <hdanton@sina.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JRJlSTe3enCBLAxogNySsJ9S73/uDChBELwRwUUTh7g=;
 b=iCza1vos46GxgzD39SFzwhy6cJ8W/5jzGl1xR5WccqvYz/DGYXMwcUUnjp+GqS+hfO
 qbOW/2DkVIQc/VFZsyZ3VwoEIMLApe67hXyTfOfZOQJDOG/PKPlAeJ/MAAfBZj8cJ/2t
 KBQICOrReINcXTyUV03nMA1WCgHSX3jyz6ulvGo/XF9PLKHVj7KeLuVUKgznL9qrnDAA
 u4Na5JSkQQa1p8JvA5nRG6Egf+k+iYsMDl4ky5ZnBcvrxv8M1VV2nFYD33MZsPVm1/Uv
 1BySCXIX9wPohS/0j9xV4aOeWklskzDRAuP1h5uXc4VsHrOR3i1T9HL6BuzNRZzt0Uhj
 t+DQ==
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
Cc: Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Christoph Hellwig <hch@infradead.org>,
 Alistair Strachan <astrachan@google.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, "Andrew F . Davis" <afd@ti.com>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTI6NDMgQU0gSGlsbGYgRGFudG9uIDxoZGFudG9uQHNp
bmEuY29tPiB3cm90ZToKPgo+Cj4gT24gRnJpLCAgNiBTZXAgMjAxOSAxODo0NzowOSArMDAwMCBK
b2huIFN0dWx0eiB3cm90ZToKPiA+Cj4gPiArc3RhdGljIGludCBzeXN0ZW1faGVhcF9hbGxvY2F0
ZShzdHJ1Y3QgZG1hX2hlYXAgKmhlYXAsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICB1bnNpZ25lZCBsb25nIGxlbiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVu
c2lnbmVkIGxvbmcgZmRfZmxhZ3MsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIGhlYXBfZmxhZ3MpCj4gPiArewo+ID4gKyAgICAgc3RydWN0IGhlYXBfaGVs
cGVyX2J1ZmZlciAqaGVscGVyX2J1ZmZlcjsKPiA+ICsgICAgIHN0cnVjdCBkbWFfYnVmICpkbWFi
dWY7Cj4gPiArICAgICBpbnQgcmV0ID0gLUVOT01FTTsKPiA+ICsgICAgIHBnb2ZmX3QgcGc7Cj4g
PiArCj4gPiArICAgICBoZWxwZXJfYnVmZmVyID0ga3phbGxvYyhzaXplb2YoKmhlbHBlcl9idWZm
ZXIpLCBHRlBfS0VSTkVMKTsKPiA+ICsgICAgIGlmICghaGVscGVyX2J1ZmZlcikKPiA+ICsgICAg
ICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiArCj4gPiArICAgICBpbml0X2hlYXBfaGVscGVy
X2J1ZmZlcihoZWxwZXJfYnVmZmVyLCBzeXN0ZW1faGVhcF9mcmVlKTsKPiA+ICsgICAgIGhlbHBl
cl9idWZmZXItPmZsYWdzID0gaGVhcF9mbGFnczsKPiA+ICsgICAgIGhlbHBlcl9idWZmZXItPmhl
YXAgPSBoZWFwOwo+ID4gKyAgICAgaGVscGVyX2J1ZmZlci0+c2l6ZSA9IGxlbjsKPiA+ICsKPiBB
IGNvdXBsZSBvZiBsaW5lcyBsb29rcyBuZWVkZWQgdG8gaGFuZGxlIGxlbiBpZiBpdCBpcyBub3QK
PiBQQUdFX1NJWkUgYWxpZ25lZC4KCkhleSEgVGhhbmtzIHNvIG11Y2ggZm9yIHRoZSByZXZpZXch
CgpkbWFfaGVhcF9idWZmZXJfYWxsb2MoKSBzZXRzICJsZW4gPSBQQUdFX0FMSUdOKGxlbik7IiBi
ZWZvcmUgY2FsbGluZwppbnRvIHRoZSBoZWFwIGFsbG9jYXRpb24gaG9vay4KU28gaG9wZWZ1bGx5
IHRoaXMgaXNuJ3QgYSBjb25jZXJuLCBvciBhbSBJIG1pc3Npbmcgc29tZXRoaW5nPwoKdGhhbmtz
Ci1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
