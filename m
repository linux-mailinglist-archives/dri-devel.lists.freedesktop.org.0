Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F736B036
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 22:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138896E186;
	Tue, 16 Jul 2019 20:06:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15C876E184;
 Tue, 16 Jul 2019 20:05:57 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 17351912-1500050 for multiple; Tue, 16 Jul 2019 21:05:49 +0100
MIME-Version: 1.0
To: Daniel Vetter <daniel@ffwll.ch>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190716092154.GZ15868@phenom.ffwll.local>
References: <20190712080314.21018-1-chris@chris-wilson.co.uk>
 <20190712080314.21018-2-chris@chris-wilson.co.uk>
 <20190716092154.GZ15868@phenom.ffwll.local>
Message-ID: <156330754665.9436.11219275909809112187@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH 2/2] dma-buf: Relax the write-seqlock for reallocating the
 shared fence list
Date: Tue, 16 Jul 2019 21:05:46 +0100
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgVmV0dGVyICgyMDE5LTA3LTE2IDEwOjIxOjU0KQo+IE9uIEZyaSwgSnVs
IDEyLCAyMDE5IGF0IDA5OjAzOjE0QU0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IEFz
IHRoZSBzZXQgb2Ygc2hhcmVkIGZlbmNlcyBpcyBub3QgYmVpbmcgY2hhbmdlZCBkdXJpbmcgcmVh
bGxvY2F0aW9uIG9mCj4gPiB0aGUgcmVzZXJ2YXRpb24gbGlzdCwgd2UgY2FuIHNraXAgdXBkYXRp
bmcgdGhlIHdyaXRlX3NlcWxvY2suCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmll
bC52ZXR0ZXJAZmZ3bGwuY2g+Cj4gPiBDYzogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtv
ZW5pZ0BhbWQuY29tPgo+IAo+IHNvdW5kcyBsZWdpdC4KPiAKPiBSZXZpZXdlZC1ieTogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KPiAKPiBNb3JlIHNlcmlvdXNseSwgSSB0
aGluayBJIGNvbnZpbmNlZCBteXNlbGYgdGhhdCB3ZSBjYW50IHNlZSBhIG1lc3Mgb2Ygb2xkCj4g
YW5kIG5ldyBmZW5jZSBhcnJheXMgYW55d2hlcmUsIGV2ZW4gd2l0aG91dCB0aGUgc2VxbG9jayBy
ZXRyeSwgc28gSSB0aGluawo+IHdlIHNob3VsZCBiZSBhbGwgZ29vZC4KCkF5ZSwgdGhlIHZpZXcg
cmVtYWlucyBjb25zaXN0ZW50IHdoaWNoIGlzIGtleS4gVGhhbmtzIGZvciB0aGUgcmV2aWV3LApw
dXNoZWQgdG8gZHJtLW1pc2MtbmV4dC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
