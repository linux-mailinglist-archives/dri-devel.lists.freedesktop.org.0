Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5F147041
	for <lists+dri-devel@lfdr.de>; Sat, 15 Jun 2019 15:56:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1286C8928D;
	Sat, 15 Jun 2019 13:56:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1D528928D
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 13:56:39 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id j19so5332390otq.2
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Jun 2019 06:56:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=QHCR3JSgS0RSHcF2VNdae/EolEZLrPS/qHWaU1BJy7I=;
 b=AfvC34LjKbgn3mb/HSH5SM0Tqz0rH1HqnMdFn8iSPFyZbza1ZSOdWvQKN0ygG3ysZt
 zFjh+2ZiAiuowzr2bIp0iOI4zwQIsyzrEi0ltmXeIBdOjgwME6hKvGu7xL34BCE9IPRu
 LmfT68Qkd3dbZcz21bUbOmQZiBlurL851sS/JA5fpPN81lQFKKj6BOamFsr0/ZXbBpSp
 nDIJ5wuv69364FFRq6I+axyl3AvLYTjM8GYxTH3CFlQmgwJfwncUPOH4M0wAgmabmN9h
 7bZ+bbSUwMbpGf5RB+l1slAgrDZEqdnLHZ/F27/W8vrG0xBHmYLvmrXOGaCOh1AsI4YX
 n2fw==
X-Gm-Message-State: APjAAAV/8eR5kQ7ksjlbl47WIz5ePfeor3zuBtrCKszglGP5vvB0TBkj
 crgc48mYKM3y7CWVBFJr+Mcr4VKsFRZeEGZu4YoSRQ==
X-Google-Smtp-Source: APXvYqx/Ugw4ghpaI9BPclCunE9l+XqGUnnusYzQabQ3bRGiqNyMJGg8+HCBD7GFUGyd9Y8oSX+UvB7edg6+XiKE3Po=
X-Received: by 2002:a05:6830:ce:: with SMTP id
 x14mr34286891oto.188.1560606998809; 
 Sat, 15 Jun 2019 06:56:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190614124125.124181-1-christian.koenig@amd.com>
 <20190614124125.124181-4-christian.koenig@amd.com>
 <20190614131916.GQ3436@hirez.programming.kicks-ass.net>
 <20190614152242.GC23020@phenom.ffwll.local>
 <094da0f7-a0f0-9ed4-d2da-8c6e6d165380@gmail.com>
 <CAKMK7uFcDCJ9sozny1RqqRATwcK39doZNq+NZekvrzuO63ap-Q@mail.gmail.com>
 <d97212dc-367c-28e9-6961-9b99110a4d2e@gmail.com>
 <20190614203040.GE23020@phenom.ffwll.local>
In-Reply-To: <20190614203040.GE23020@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sat, 15 Jun 2019 15:56:25 +0200
Message-ID: <CAKMK7uFzg+e315h2e5SmDTQwYTAbgAsxB_pc09ztwA1Wa-mzxw@mail.gmail.com>
Subject: Re: [PATCH 3/6] drm/gem: use new ww_mutex_(un)lock_for_each macros
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=QHCR3JSgS0RSHcF2VNdae/EolEZLrPS/qHWaU1BJy7I=;
 b=eqKeNfV0/DKNowmDgDytbRxKZe/YIBslrcI+/6UoW6VrIQ4IXERd15SuP4HEEcg941
 umwYW8yVMX0fH5rPsS/8iFnnYX4ETfea2MKPxtaeV5ezaDMj8CoGpnSE2rPwoSlgtmfb
 qGCQ6MDTBLprBStkIIHLT16NSSx+g4XaelLxw=
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, lima@lists.freedesktop.org,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 The etnaviv authors <etnaviv@lists.freedesktop.org>,
 Qiang Yu <yuq825@gmail.com>, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMTA6MzAgUE0gRGFuaWVsIFZldHRlciA8ZGFuaWVsQGZm
d2xsLmNoPiB3cm90ZToKPgo+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0IDA4OjUxOjExUE0gKzAy
MDAsIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4gPiBBbSAxNC4wNi4xOSB1bSAyMDoyNCBzY2hy
aWViIERhbmllbCBWZXR0ZXI6Cj4gPiA+Cj4gPiA+IE9uIEZyaSwgSnVuIDE0LCAyMDE5IGF0IDg6
MTAgUE0gQ2hyaXN0aWFuIEvDtm5pZyA8Y2tvZW5pZy5sZWljaHR6dW1lcmtlbkBnbWFpbC5jb20+
IHdyb3RlOgo+ID4gPiA+IFtTTklQXQo+ID4gPiA+IFdXX01VVEVYX0xPQ0tfQkVHSU4oKQo+ID4g
PiA+Cj4gPiA+ID4gbG9jayhscnVfbG9jayk7Cj4gPiA+ID4KPiA+ID4gPiB3aGlsZSAoYm8gPSBs
aXN0X2ZpcnN0KGxydSkpIHsKPiA+ID4gPiAgIGlmIChrcmVmX2dldF91bmxlc3NfemVybyhibykp
IHsKPiA+ID4gPiAgICAgICAgICAgdW5sb2NrKGxydV9sb2NrKTsKPiA+ID4gPiAgICAgICAgICAg
V1dfTVVURVhfTE9DSyhiby0+d3dfbXV0ZXgpOwo+ID4gPiA+ICAgICAgICAgICBsb2NrKGxydV9s
b2NrKTsKPiA+ID4gPiAgIH0gZWxzZSB7Cj4gPiA+ID4gICAgICAgICAgIC8qIGJvIGlzIGdldHRp
bmcgZnJlZWQsIHN0ZWFsIGl0IGZyb20gdGhlIGZyZWVpbmcgcHJvY2Vzcwo+ID4gPiA+ICAgICAg
ICAgICAgKiBvciBqdXN0IGlnbm9yZSAqLwo+ID4gPiA+ICAgfQo+ID4gPiA+IH0KPiA+ID4gPiB1
bmxvY2sobHJ1X2xvY2spCj4gPiA+ID4KPiA+ID4gPiBXV19NVVRFWF9MT0NLX0VORDsKPiA+Cj4g
PiBBaCwgbm93IEkga25vdyB3aGF0IHlvdSBtZWFuLiBBbmQgTk8sIHRoYXQgYXBwcm9hY2ggZG9l
c24ndCB3b3JrLgo+ID4KPiA+IFNlZSBmb3IgdGhlIGNvcnJlY3Qgd3dfbXV0ZXggZGFuY2Ugd2Ug
bmVlZCB0byB1c2UgdGhlIGl0ZXJhdG9yIG11bHRpcGxlCj4gPiB0aW1lcy4KPiA+Cj4gPiBPbmNl
IHRvIGdpdmUgdXMgdGhlIEJPcyB3aGljaCBuZWVkcyB0byBiZSBsb2NrZWQgYW5kIGFub3RoZXIg
dGltZSB0byBnaXZlIHVzCj4gPiB0aGUgQk9zIHdoaWNoIG5lZWRzIHRvIGJlIHVubG9ja2VkIGlu
IGNhc2Ugb2YgYSBjb250ZW50aW9uLgo+ID4KPiA+IFRoYXQgd29uJ3Qgd29yayB3aXRoIHRoZSBh
cHByb2FjaCB5b3Ugc3VnZ2VzdCBoZXJlLgo+Cj4gQSByaWdodCwgZHJhdC4KPgo+IE1heWJlIGdp
dmUgdXAgb24gdGhlIGlkZWEgdG8gbWFrZSB0aGlzIHdvcmsgZm9yIHd3X211dGV4IGluIGdlbmVy
YWwsIGFuZAo+IGp1c3QgZm9yIGRybV9nZW1fYnVmZmVyX29iamVjdD8gSSdtIGp1c3QgYWJvdXQg
dG8gc2VuZCBvdXQgYSBwYXRjaCBzZXJpZXMKPiB3aGljaCBtYWtlcyBzdXJlIHRoYXQgYSBsb3Qg
bW9yZSBkcml2ZXJzIHNldCBnZW1fYm8ucmVzdiBjb3JyZWN0bHkgKGl0Cj4gd2lsbCBhbGlhcyB3
aXRoIHR0bV9iby5yZXN2IGZvciB0dG0gZHJpdmVycyBvZmMpLiBUaGVuIHdlIGNvdWxkIGFkZCBh
Cj4gbGlzdF9oZWFkIHRvIGdlbV9ibyAod29uJ3QgcmVhbGx5IG1hdHRlciwgYnV0IG5vdCBzb21l
dGhpbmcgd2UgY2FuIGRvIHdpdGgKPiB3d19tdXRleCByZWFsbHkpLCBzbyB0aGF0IHRoZSB1bmxv
Y2sgd2Fsa2luZyBkb2Vzbid0IG5lZWQgdG8gcmV1c2UgdGhlCj4gc2FtZSBpdGVyYXRvci4gVGhh
dCBzaG91bGQgd29yayBJIHRoaW5rIC4uLgo+Cj4gQWxzbywgaXQgd291bGQgYWxtb3N0IGNvdmVy
IGV2ZXJ5dGhpbmcgeW91IHdhbnQgdG8gZG8uIEZvciB0dG0gd2UnZCBuZWVkCj4gdG8gbWFrZSB0
dG1fYm8gYSBzdWJjbGFzcyBvZiBnZW1fYm8gKGFuZCBtYXliZSBub3QgaW5pdGlhbGl6ZSB0aGF0
Cj4gZW1iZWRkZWQgZ2VtX2JvIGZvciB2bXdnZnggYW5kIHNoYWRvdyBibyBhbmQgZHJpdmVyIGlu
dGVybmFsIHN0dWZmKS4KPgo+IEp1c3Qgc29tZSBpZGVhcywgc2luY2UgY29weXBhc3RpbmcgdGhl
IHd3X211dGV4IGRhbmNlIGludG8gYWxsIGRyaXZlcnMgaXMKPiBpbmRlZWQgbm90IGdyZWF0LgoK
RXZlbiBiZXR0ZXIgd2UgZG9uJ3QgbmVlZCB0byBmb3JjZSBldmVyeW9uZSB0byB1c2UgZHJtX2dl
bV9vYmplY3QsIHRoZQpoYXJkIHdvcmsgaXMgYWxyZWFkeSBkb25lIHdpdGggdGhlIHJlc2VydmF0
aW9uX29iamVjdC4gV2UgY291bGQgYWRkIGEKbGlzdF9oZWFkIHRoZXJlIGZvciB1bndpbmRpbmcs
IGFuZCB0aGVuIHRoZSBsb2NraW5nIGhlbHBlcnMgd291bGQgbG9vawphIGxvdCBjbGVhbmVyIGFu
ZCBzaW1wbGVyIGltby4gcmVzZXJ2YXRpb25fdW5sb2NrX2FsbCgpIHdvdWxkIGV2ZW4gYmUKYSBy
ZWFsIGZ1bmN0aW9uISBBbmQgaWYgd2UgZG8gdGhpcyB0aGVuIEkgdGhpbmsgd2Ugc2hvdWxkIGFs
c28gaGF2ZSBhCnJlc2VydmF0aW9uX2FjcXVpcmVfY3R4LCB0byBzdG9yZSB0aGUgbGlzdF9oZWFk
IGFuZCBtYXliZSBhbnl0aGluZwplbHNlLgoKUGx1cyBhbGwgdGhlIGNvZGUgeW91IHdhbnQgdG8g
dG91Y2ggaXMgZGVhbGluZyB3aXRoCnJlc2VydmF0aW9uX29iamVjdCwgc28gdGhhdCdzIGFsbCBj
b3ZlcmVkLiBBbmQgaXQgbWlycm9zIHF1aXRlIGEgYml0CndoYXQgd2UndmUgZG9uZSB3aXRoIHN0
cnVjdCBkcm1fbW9kZXNldF9sb2NrLCB0byB3cmFwIHd3X211dGV4IGlzCnNvbWV0aGluZyBlYXNp
ZXIgdG8gZGVhbCB3aXRoIGZvciBrbXMuCi1EYW5pZWwKCj4gLURhbmllbAo+Cj4gPgo+ID4gUmVn
YXJkcywKPiA+IENocmlzdGlhbi4KPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+IEFsc28gSSB0aGluayBp
ZiB3ZSBhbGxvdyB0aGlzIHdlIGNvdWxkIHBlcmhhcHMgdXNlIHRoaXMgdG8gaW1wbGVtZW50IHRo
ZQo+ID4gPiBtb2Rlc2V0IG1hY3JvcyB0b28uCj4gPiA+IC1EYW5pZWwKPiA+ID4KPiA+ID4KPiA+
ID4KPiA+ID4KPiA+ID4gPiA+IFRoaXMgaXMga2luZGEgd2hhdCB3ZSB3ZW50IHdpdGggZm9yIG1v
ZGVzZXQgbG9ja3Mgd2l0aAo+ID4gPiA+ID4gRFJNX01PREVTRVRfTE9DS19BTExfQkVHSU4vRU5E
LCB5b3UgY2FuIGdyYWIgbW9yZSBsb2NrcyBpbiBiZXR3ZWVuIHRoZQo+ID4gPiA+ID4gcGFpciBh
dCBsZWFzdC4gQnV0IGl0J3MgYSBsb3QgbW9yZSBsaW1pdGVkIHVzZS1jYXNlcywgbWF5YmUgdG9v
IGZyYWdpbGUgYW4KPiA+ID4gPiA+IGlkZWEgZm9yIHd3X211dGV4IGluIGZ1bGwgZ2VuZXJhbGl0
eS4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBOb3QgZ29pbmcgdG8gdHlwZSB0aGlzIG91dCBiZWNhdXNl
IHRvbyBtdWNoIHcvZSBtb2RlIGhlcmUgYWxyZWFkeSwgYnV0IEkKPiA+ID4gPiA+IGNhbiBnaXZl
IGl0IGEgc3RhYiBuZXh0IHdlZWsuCj4gPiA+ID4gPiAtRGFuaWVsCj4gPiA+ID4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiBkcmktZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gPiA+ID4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4g
PiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVsCj4gPiA+Cj4gPiA+Cj4gPgo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiA+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IGRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCj4KPiAtLQo+IERhbmllbCBWZXR0ZXIKPiBTb2Z0d2Fy
ZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KPiBodHRwOi8vYmxvZy5mZndsbC5jaAoKCgot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQx
ICgwKSA3OSAzNjUgNTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
