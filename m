Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0447C8E0B
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 18:15:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8F8D6E0F4;
	Wed,  2 Oct 2019 16:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07FBE6E0F4
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 16:15:48 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id v17so7590726wml.4
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 09:15:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S3qu0q538RdqSW4iMWABBq0n0em/qJFZBK3KeAdAIbs=;
 b=tlNGBFzS26lU1iBApgyXujSjhNfb2V+OoBsQF2bc948mR5iWlnBu2weQjUl4OJHaO0
 U44GSwDkc7vwEmx2xsEMCmlNOhDH3z1L2valKP3bX5AsnonHYNuZRB643c+1GdXAgEL5
 cBrk0NPhCRWyObN114pmticyh7Kne2CqCKD+AKU2FHW7wL1lruBnbDbNzbURA2szM+j0
 5n3xoUGFobvRyZ1lfixaA1i0bf9SCa4rvCpht+HpJo0vLEASjlA7irDrpih0IKFBSvEr
 xaUA7S3fEMlPrBcXDHYrfdiT9QOJTEPYYv7CfKsZVEMJEXZH6a/KCNjCWItcu3aueC1L
 WcXQ==
X-Gm-Message-State: APjAAAXuQKox/wMJffXS/IeEpn9cwIO03G52T/2dvV57IlAYTLFre8UI
 6gh4CLM9E0ZLqH21FqAcRY2de/F9VRWWX1FIiWst1A==
X-Google-Smtp-Source: APXvYqyieH3bcPGZ8ZGnvZSIPloD2Ks23buLv3XJ69DXuZuuMbDJs6JnsU4f1gYrymTj4IHZVbRl7iWyVN1kwnw8k2A=
X-Received: by 2002:a1c:9988:: with SMTP id b130mr3697022wme.164.1570032946489; 
 Wed, 02 Oct 2019 09:15:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190906184712.91980-1-john.stultz@linaro.org>
 <20190930081434.248-1-hdanton@sina.com>
In-Reply-To: <20190930081434.248-1-hdanton@sina.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 2 Oct 2019 09:15:35 -0700
Message-ID: <CALAqxLUPjtfOmK7Dc9y+vZ6iw9dbUzu5pbRKes7i5jaysz4yXA@mail.gmail.com>
Subject: Re: [RESEND][PATCH v8 4/5] dma-buf: heaps: Add CMA heap to dmabuf
 heaps
To: Hillf Danton <hdanton@sina.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=S3qu0q538RdqSW4iMWABBq0n0em/qJFZBK3KeAdAIbs=;
 b=gaS1xDR/MCIrEusKsbIz4cW1CiyfwYYMFFlkJTvXLn2FJnDVlxHH+o6O9QSz539jQf
 poU9tqSSIT4rhJv1AqqOp2P/GBzRSdKDr1zpPLCepPY39P9h12Aas1W0n2QKwiAjaB07
 KadfdYgX6OlzrAoGlXRjYCckxXgkFIXm4A7C7XWyWqn+fu8OKDEYWyyn1guKySmitHEr
 sz5J6n8LQlK1iLVLi0fGU7c3TCAukTofg0++XZrbTN0LuCaOUVLSODBPfO5HrKhAVlgw
 Ac9sOb8KSGmKoUV1bngrp/iZ4VKk1n6ReF8WiDhlrDmvRPwhr2zZ2/e9wQ+JHOzopqxj
 Lwxw==
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

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMToxNCBBTSBIaWxsZiBEYW50b24gPGhkYW50b25Ac2lu
YS5jb20+IHdyb3RlOgo+IE9uIEZyaSwgIDYgU2VwIDIwMTkgMTg6NDc6MDkgKzAwMDAgSm9obiBT
dHVsdHogd3JvdGU6Cj4gPgo+ID4gKyAgICAgY21hX3BhZ2VzID0gY21hX2FsbG9jKGNtYV9oZWFw
LT5jbWEsIG5yX3BhZ2VzLCBhbGlnbiwgZmFsc2UpOwo+ID4gKyAgICAgaWYgKCFjbWFfcGFnZXMp
Cj4gPiArICAgICAgICAgICAgIGdvdG8gZnJlZV9idWY7Cj4gPiArCj4gPiArICAgICBpZiAoUGFn
ZUhpZ2hNZW0oY21hX3BhZ2VzKSkgewo+ID4gKyAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5y
X2NsZWFyX3BhZ2VzID0gbnJfcGFnZXM7Cj4gPiArICAgICAgICAgICAgIHN0cnVjdCBwYWdlICpw
YWdlID0gY21hX3BhZ2VzOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICB3aGlsZSAobnJfY2xlYXJf
cGFnZXMgPiAwKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgdm9pZCAqdmFkZHIgPSBrbWFw
X2F0b21pYyhwYWdlKTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBtZW1zZXQodmFk
ZHIsIDAsIFBBR0VfU0laRSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAga3VubWFwX2F0b21p
Yyh2YWRkcik7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcGFnZSsrOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIG5yX2NsZWFyX3BhZ2VzLS07Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsg
ICAgIH0gZWxzZSB7Cj4gPiArICAgICAgICAgICAgIG1lbXNldChwYWdlX2FkZHJlc3MoY21hX3Bh
Z2VzKSwgMCwgc2l6ZSk7Cj4gPiArICAgICB9Cj4KPiBUYWtlIGEgYnJlYXRoIGFmdGVyIHplcm9p
bmcgYSBwYWdlLCBhbmQgYSBwZWVwIGF0IHBlbmRpbmcgc2lnbmFsLgoKT2suIFRvb2sgYSBzd2lu
ZyBhdCB0aGlzLiBJdCB3aWxsIGJlIGluIHRoZSBuZXh0IHJldmlzaW9uLgoKVGhhbmtzIGFnYWlu
IGZvciB0aGUgcmV2aWV3IQotam9obgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
