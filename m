Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A50DF518
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2019 20:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C91266E1DE;
	Mon, 21 Oct 2019 18:32:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9571F6E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 18:32:28 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id 89so11856252oth.13
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2019 11:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0e3LF7aKuz2iLw0mcj6oU7FpBQcB5Q8PDmzRJ1cFd9Q=;
 b=Xl8Ob7vNVy2VDSQoUQX0MAXlu6wMFJl0VNHdrpiK5AxXhhJXUGwga83SOntzviv7LE
 ByEfGEJS5jJEc86DN6kHPC0GtgOoB0Q0HorTX5sES/LxbLf035E4S4H64V1HfrZoaQYT
 7QOMkN1YCywA0Ov3f6p+Z/O8X4uJOGXIuqmySSx1CjCXbheQ//W+mAkB3eY+BcB/aEvG
 N01tw694JTHJuMMBZzotLRgZzbQQuTt7G1MBHlXiKFzW4acNdEVccY2Ae2ojDuKRvtG4
 wGkIO3EUUu4AiNRIVbOfSZGyMgl2Y9UxZVbXIdWLmX9ZV2ikeKHR1ejVj7XI67hXdEf8
 i+EQ==
X-Gm-Message-State: APjAAAUU01t3eBipYMqIo9jmAiS1B9PUIkeyE4iI08YCvHjhmeOtnuDa
 HrJHam5FpuAe6lXiOiNFTum/yK4D3Z12Z+DZFRTjWA==
X-Google-Smtp-Source: APXvYqxAXUfQVl/EVFVJQCv8ArX0aLPCEDz5Jp59sqSiaykhOpeMwlsHfK2y9HsCUzb/LpNQcUsAKiuhGmgJsk2nJEE=
X-Received: by 2002:a9d:5a0b:: with SMTP id v11mr2801767oth.102.1571682747558; 
 Mon, 21 Oct 2019 11:32:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191018052323.21659-1-john.stultz@linaro.org>
 <20191018052323.21659-2-john.stultz@linaro.org>
 <20191018111832.o7wx3x54jm3ic6cq@DESKTOP-E1NTVVP.localdomain>
 <CALAqxLUVLP0ujB0SHyWHMncRMHkBvVj1+CpBgGUD8Xg3RexQ8w@mail.gmail.com>
 <20191021093546.m5hgpjadtpu7d4km@DESKTOP-E1NTVVP.localdomain>
In-Reply-To: <20191021093546.m5hgpjadtpu7d4km@DESKTOP-E1NTVVP.localdomain>
From: John Stultz <john.stultz@linaro.org>
Date: Mon, 21 Oct 2019 11:32:16 -0700
Message-ID: <CALAqxLVQpWgYhw+t33wGrZD_Q49JkgVMsa0mOg1LTapCH2pPUQ@mail.gmail.com>
Subject: Re: [PATCH v12 1/5] dma-buf: Add dma-buf heaps framework
To: Brian Starkey <Brian.Starkey@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0e3LF7aKuz2iLw0mcj6oU7FpBQcB5Q8PDmzRJ1cFd9Q=;
 b=kpUBX0ruClnhJmvKIIzHN1Q4dn2+sfqWY7IUWOaBG0kl0XXLWEY/UD5emw1x8pnoxA
 M0shj/WOB1CKY6RhwXF5fySgQtZPj4vgKAz1Bqk624KDQE47uoit9Udq2oLFfj/QWzIT
 7LZJ6jtYaRTaYat8Dwota/2nNaJfbpfsxTcqt6cRmDliTzndexUk/M4Mr0kUPNiif7TK
 mES8A6X3XPgZErIxFsE2/I2/CZkNli5wHSJpqhIJqKmz8ZlmbHoOk0tW6J52FNwTCCQP
 p3HwyXvJlF0XaU9SKGbJDH/czU7lrMlKeSVBAeQ1rgr69q52knLyAXrJ2ikvXlcSrkOF
 dKOg==
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
Cc: Hillf Danton <hdanton@sina.com>, Sudipto Paul <Sudipto.Paul@arm.com>,
 Vincent Donnefort <Vincent.Donnefort@arm.com>, Chenbo Feng <fengc@google.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 "Andrew F. Davis" <afd@ti.com>, Christoph Hellwig <hch@infradead.org>,
 nd <nd@arm.com>, Alistair Strachan <astrachan@google.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Hridya Valsaraju <hridya@google.com>, Pratik Patel <pratikp@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMjozNiBBTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFy
a2V5QGFybS5jb20+IHdyb3RlOgo+IE9uIEZyaSwgT2N0IDE4LCAyMDE5IGF0IDExOjI2OjUyQU0g
LTA3MDAsIEpvaG4gU3R1bHR6IHdyb3RlOgo+ID4gT24gRnJpLCBPY3QgMTgsIDIwMTkgYXQgNDox
OCBBTSBCcmlhbiBTdGFya2V5IDxCcmlhbi5TdGFya2V5QGFybS5jb20+IHdyb3RlOgo+ID4gPiBP
biBGcmksIE9jdCAxOCwgMjAxOSBhdCAwNToyMzoxOUFNICswMDAwLCBKb2huIFN0dWx0eiB3cm90
ZToKPiA+ID4KPiA+ID4gQXMgaW4gdjM6Cj4gPiA+Cj4gPiA+ICAqIEF2b2lkIEVYUE9SVF9TWU1C
T0wgdW50aWwgd2UgZmluYWxpemUgbW9kdWxlcyAoc3VnZ2VzdGVkIGJ5Cj4gPiA+ICAgIEJyaWFu
KQo+ID4KPiA+IEhlaC4gSSBndWVzcyBpdCBoYXMgYmVlbiBhd2hpbGUuICA6KQo+ID4KPiA+ID4g
RGlkIHNvbWV0aGluZyBjaGFuZ2UgaW4gdGhhdCByZWdhcmQ/IEkgc3RpbGwgdGhpbmsgbGV0dGlu
ZyBtb2R1bGVzCj4gPiA+IHJlZ2lzdGVyIGhlYXBzIHdpdGhvdXQgYSB3YXkgdG8gcmVtb3ZlIHRo
ZW0gaXMgYSByZWNpcGUgZm9yIGlzc3Vlcy4KPiA+Cj4gPiBTbyB5ZWEsIGluIHJlY2VudCBtb250
aHMsIHdvcmsgYXJvdW5kIEFuZHJvaWQgd2l0aCB0aGVpciBHS0kgZWZmb3J0Cj4gPiBoYXMgbWFk
ZSBpdCBuZWNlc3NhcnkgZm9yIElPTiBoZWFwcyB0byBiZSBsb2FkYWJsZSBmcm9tIG1vZHVsZXMu
IEkgaGFkCj4gPiBzb21lIHBhdGNoZXMgaW4gV0lQIHRyZWUgdG8gZW5hYmxlIHRoaXMsIGFuZCBp
biB0aGUgcmV3b3JrIEkgZGlkCj4gPiB5ZXN0ZXJkYXkgZm9yIHRoZSBDTUEgbW9kdWxlIHRyaXZp
YWxseSBjb2xsaWRlZCB3aXRoIHBhcnRzLCBhbmQKPiA+IGZvcmdldHRpbmcgdGhlIGRpc2N1c3Np
b24gYmFjayBpbiB2MywgSSBmaWd1cmVkIEknZCBqdXN0IGZvbGQgdGhvc2UKPiA+IGJpdHMgaW4g
YmVmb3JlIEkgcmVzdWJtaXR0ZWQgZm9yIHYxMi4KPgo+IEFoIHllcywgSSBjYW4gc2VlIHRoYXQg
d291bGQgYmUgbmVlZGVkLgo+Cj4gPgo+ID4gSWYgaXQncyBhbiBpc3N1ZSwgSSBjYW4gcHVsbCBp
dCBvdXQsIGJ1dCBJJ20gZ29pbmcgdG8gYmUgc3VibWl0dGluZwo+ID4gbW9kdWxlIGVuYWJsZW1l
bnQgZm9yIHJldmlldyBhcyBzb29uIGFzIHRoZSBjb3JlIGJpdHMgYXJlIHF1ZXVlZCwgYXMKPiA+
IGl0cyBnb2luZyB0byBiZSBpbXBvcnRhbnQgdG8gc3VwcG9ydCBmb3IgQW5kcm9pZCB0byBzd2l0
Y2ggdG8gdGhpcwo+ID4gZnJvbSBJT04uCj4gPgo+Cj4gSSBkb24ndCBrbm93IGhvdyB0byBkZWNp
ZGUgaWYgaXQncyBhbiBpc3N1ZS4gTXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0Cj4gaWYgeW91IHJt
bW9kIHNvbWV0aGluZyB3aGljaCBoYXMgZXhwb3J0ZWQgYnVmZmVycywgdmFyaW91cyBCYWQgVGhp
bmdzCj4gbWlnaHQgaGFwcGVuOyBJIGJlbGlldmUgaW5jbHVkaW5nIGRhdGEgbGVha3MsIGNvcnJ1
cHRpb24gb3IgY3Jhc2hpbmcKPiB0aGUga2VybmVsLiBUaGVyZSdzIHByb2JhYmx5IHBsZW50eSBv
ZiBzY29wZSBmb3IgdGhhdCB3aXRoIGRtYS1idWYKPiBleHBvcnRlcnMgYWxyZWFkeSwgc28gaXQn
cyBub3QgZXhhY3RseSAibmV3IiBidXQgaXQgaXMgYSBiaXQKPiB1bmZvcnR1bmF0ZS4KPgo+IElm
ICJwZW9wbGUiIGFyZSBPSyB3aXRoIGFkZGluZyBuZXcgY29kZSB3aGljaCBoYXMgdGhlIHNhbWUg
aXNzdWUsIHRoZW4KPiBJJ20gbm90IGdvaW5nIHRvIG1ha2UgYW55IG1vcmUgb2YgYSBmdXNzLCBi
ZWNhdXNlIHBlcmZlY3Rpb24gaXMgdGhlCj4gZW5lbXkgb2YgcHJvZ3Jlc3MuIFBlcmhhcHMgYW4g
b2J2aW91cyBjb21tZW50IHBvaW50aW5nIG91dCB0aGUgaXNzdWUKPiB3b3VsZCBiZSBwcnVkZW50
LCB0aG91Z2ggLSBhcyBhIHJlbWluZGVyIHRvIHBlb3BsZSB0aGF0IGFkZCBoZWFwcyBmcm9tCj4g
dGhlaXIgY29kZSAoYW5kIHdvbmRlciB3aHkgdGhlcmUncyBubyAiZG1hX2hlYXBfcmVtb3ZlIiBm
dW5jdGlvbikuCgpFaC4gSWYgSSBuZWVkIHRvIHJlc3BpbiBhbnl3YXksIEknbGwganVzdCByZW1v
dmUgdGhlIGV4cG9ydHMgZm9yIG5vdy4KCkl0J3MgcmVhbGx5IGp1c3QgbXkgZmF1bHQgZm9yIGdl
dHRpbmcgaW1wYXRpZW50IGFuZCB0cnlpbmcgdG8gc3F1ZWV6ZQpzb21lIGV4dHJhIGNoYW5nZXMg
aW4uCgpJJ2xsIHRoZW4gc3VibWl0IHRoZSBtb2R1bGUgZW5hYmxlbWVudCBwYXRjaGVzIHNlcGFy
YXRlbHkuCgpUaGFua3MgYWdhaW4gZm9yIHRoZSByZXZpZXcsIEkgcmVhbGx5IGFwcHJlY2lhdGUg
eW91ciBzaGFycCBleWUhCi1qb2huCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
