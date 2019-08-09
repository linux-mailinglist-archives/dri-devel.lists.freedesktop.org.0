Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F487E9E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 17:53:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 543CB6EE43;
	Fri,  9 Aug 2019 15:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8046EE45
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:26 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com
 [209.85.160.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DCB082089E
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 15:53:25 +0000 (UTC)
Received: by mail-qt1-f175.google.com with SMTP id l9so96181387qtu.6
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Aug 2019 08:53:25 -0700 (PDT)
X-Gm-Message-State: APjAAAULYnYf2p69WG6pdqD52lUhGWiaQFIkXwyQixyZAIIZVWSTUaFo
 D+9TIhk6To3Fnmgz3WtOs4v1bM4xpo0S8ayphw==
X-Google-Smtp-Source: APXvYqyORhzZAgyBeQSZ8m5eK7mZBV2fcFBXQjHWSO1laaDju1z6YsuzxqoLLfYerzth14rMjU66x7Mph6qXsDkHyN4=
X-Received: by 2002:ac8:386f:: with SMTP id r44mr1121643qtb.300.1565366005087; 
 Fri, 09 Aug 2019 08:53:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190808222918.15153-1-robh@kernel.org>
 <20190808231110.GA12294@kevin>
 <CAL_Jsq+Y0VfXZc4btc0A8toC+arcKLmtpRHfpQiPy=6Ckts=-w@mail.gmail.com>
 <c87da187-f957-1ac9-12c6-e7121fcb9f72@arm.com>
In-Reply-To: <c87da187-f957-1ac9-12c6-e7121fcb9f72@arm.com>
From: Rob Herring <robh@kernel.org>
Date: Fri, 9 Aug 2019 09:53:13 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+8FkWWxufMru5KAmRrh5ak17GuGOywZayNC+cKxHDMrQ@mail.gmail.com>
Message-ID: <CAL_Jsq+8FkWWxufMru5KAmRrh5ak17GuGOywZayNC+cKxHDMrQ@mail.gmail.com>
Subject: Re: [PATCH] drm/panfrost: Implement per FD address spaces
To: Steven Price <steven.price@arm.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565366006;
 bh=USc6QlHtoV4g4tN4Ad1sr0t4J0lvUFm+DTdWcImuQVs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=h2oOspjGe5pQ6A9t/c+2whnecGDnHENrjoym+rqk579nl8d/CcbProqdQfOil7Hen
 Udjf4jZ0bKUOlW9E+IjR8aq4gKb4U4X4UgsGqUFRHd+cxwdYG52HmulXYWlGT9O2aw
 8FVBERNt8pYDfm4AEQw6S7HIYHeZcLKQnrQa/5GA=
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgOSwgMjAxOSBhdCA2OjQ1IEFNIFN0ZXZlbiBQcmljZSA8c3RldmVuLnByaWNl
QGFybS5jb20+IHdyb3RlOgo+Cj4gT24gMDkvMDgvMjAxOSAwNDowMSwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gWy4uLl0KPiA+IEkgd2FzIHdvcnJpZWQgdG9vLiBJdCBzZWVtcyB0byBiZSB3b3JraW5n
IHByZXR0eSB3ZWxsIHRob3VnaCwgYnV0IG1vcmUKPiA+IHRlc3Rpbmcgd291bGQgYmUgZ29vZC4g
SSBkb24ndCB0aGluayB0aGVyZSBhcmUgYSBsb3Qgb2YgdXNlY2FzZXMgdGhhdAo+ID4gdXNlIG1v
cmUgQVMgdGhhbiB0aGUgaC93IGhhcyAoOCBvbiBUODYwKSwgYnV0IEknbSBub3Qgc3VyZS4KPgo+
IFllYWgsIDggaXMgb3ZlcmtpbGwuIFNvbWUgR1BVcyBvbmx5IGhhdmUgNCB3aGljaCBpcyBhIGxp
dHRsZSB0aWdodCBhbmQKPiBtaWdodCBjb21lIHRvIGJpdGUgd2hlbiBzdXBwb3J0aW5nIHF1ZXVl
aW5nIG9uIHRoZSBHUFUuIEluIHRoaXMgcGF0Y2gKPiBwYW5mcm9zdF9tbXVfYXNfZ2V0KCkgd2ls
bCBzaW1wbHkgV0FSTigpIHRoZW4gY3Jhc2ggaWYgdGhlcmUgaXNuJ3QgYQo+IGZyZWUgQVM6Cj4K
PiA+ICAgICAgICAgICAgICAgV0FSTl9PTighbHJ1X21tdSk7Cj4gPgo+ID4gICAgICAgICAgICAg
ICBsaXN0X2RlbF9pbml0KCZscnVfbW11LT5saXN0KTsKPiA+ICAgICAgICAgICAgICAgYXMgPSBs
cnVfbW11LT5hczsKPgo+IFRoaXMgaXNuJ3QgYSBwcm9ibGVtIGF0IHRoZSBtb21lbnQgKHRoZXJl
J3MgYSBtYXhpbXVtIG9mIDIgam9icyBvbiB0aGUKPiBHUFUgYXQgdGhlIG1vbWVudCkuIEJ1dCB3
aGVuIHlvdSBzdGFydCBxdWV1ZWluZyBqb2JzIGl0J3MgcG9zc2libGUgZm9yCj4gZWFjaCBqb2Ig
dG8gYmVsb25nIHRvIGEgZGlmZmVyZW50IGFkZHJlc3Mgc3BhY2UuIFdpdGggdGhyZWUgc2xvdHMg
YW5kCj4gZm9yIGVhY2ggeW91IGNhbiBoYXZlIG9uZSBqb2IgcnVubmluZyBhbmQgb25lIHdhaXRp
bmcgdGhhdCdzIGEgbWluaW11bQo+IG9mIDYgQVNlcywgcGx1cyB5b3UgbWlnaHQgd2FudCBvbmUg
Y29uZmlndXJlZCB0byBkdW1wIGNvdW50ZXJzLiBTbyBhCj4gdG90YWwgb2YgNyBhcmUgbmVlZGVk
IHRvIGF2b2lkIGhhdmluZyB0byB3YWl0LiBIYXJkd2FyZSBkZXNpZ25lcnMgbGlrZQo+IHBvd2Vy
cyBvZiAyIHNvIHdlIGhhdmUgOC4KCkkgdGhpbmsgdGhpcyBjb3VsZCBiZSBzb2x2ZWQgYnkgYWNx
dWlyaW5nIHRoZSBBUyBpbiB0aGUgam9iIGRlcGVuZGVuY3kKaG9vayBpbnN0ZWFkLiBUaGF0IG1h
eSBtYWtlIHRoZSB0aW1lb3V0IGhhbmRsaW5nIG1vcmUgY29tcGxpY2F0ZWQgYXMKSSdtIG5vdCBz
dXJlIGlmIGRlcGVuZGVuY2llcyBhcmUgcmUtZG9uZS4gVG9tZXUgaXMgbW9yZSBmYW1pbGlhciB3
aXRoCnRoZSBzY2hlZHVsZXIgY29kZSwgc28gSSdsbCBsZXQgaGltIGNoaW1lIGluLgoKUm9iCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
