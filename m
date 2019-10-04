Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BCCCBCB3
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 16:09:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A816EB9B;
	Fri,  4 Oct 2019 14:09:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 564C76EB9B
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 14:09:12 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18724475-1500050 for multiple; Fri, 04 Oct 2019 15:08:59 +0100
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191004102251.GC823@mwanda>
References: <20191004102251.GC823@mwanda>
Message-ID: <157019813720.18712.6286079822254824652@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i810: Prevent underflow in ioctl
Date: Fri, 04 Oct 2019 15:08:57 +0100
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
Cc: Sam Ravnborg <sam@ravnborg.org>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UXVvdGluZyBEYW4gQ2FycGVudGVyICgyMDE5LTEwLTA0IDExOjIyOjUxKQo+IFRoZSAidXNlZCIg
dmFyaWFibGVzIGhlcmUgY29tZSBmcm9tIHRoZSB1c2VyIGluIHRoZSBpb2N0bCBhbmQgaXQgY2Fu
IGJlCj4gbmVnYXRpdmUuICBJdCBjb3VsZCByZXN1bHQgaW4gYW4gb3V0IG9mIGJvdW5kcyB3cml0
ZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNs
ZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZG1hLmMgfCA0ICsrLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kbWEuYyBiL2RyaXZlcnMvZ3B1
L2RybS9pODEwL2k4MTBfZG1hLmMKPiBpbmRleCAyYTc3ODIzYjhlOWEuLmU2NmMzODMzMmRmNCAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTgxMC9pODEwX2RtYS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kbWEuYwo+IEBAIC03MjgsNyArNzI4LDcgQEAgc3RhdGlj
IHZvaWQgaTgxMF9kbWFfZGlzcGF0Y2hfdmVydGV4KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4g
ICAgICAgICBpZiAobmJveCA+IEk4MTBfTlJfU0FSRUFfQ0xJUFJFQ1RTKQo+ICAgICAgICAgICAg
ICAgICBuYm94ID0gSTgxMF9OUl9TQVJFQV9DTElQUkVDVFM7Cj4gIAo+IC0gICAgICAgaWYgKHVz
ZWQgPiA0ICogMTAyNCkKPiArICAgICAgIGlmICh1c2VkIDwgMCB8fCB1c2VkID4gNCAqIDEwMjQp
Cj4gICAgICAgICAgICAgICAgIHVzZWQgPSAwOwoKWWVzLCBhcyBwYXNzZWQgdG8gdGhlIEdQVSBp
bnN0cnVjdGlvbiwgbmVnYXRpdmUgdXNlZCBpcyBpbnZhbGlkLgoKVGhlbiBpdCBpcyB1c2VkIGFz
IGFuIG9mZnNldCBpbnRvIGEgbWVtYmxvY2ssIHdoZXJlIGEgbmVnYXRpdmUgb2Zmc2V0CndvdWxk
IGJlIHZlcnkgYmFkLgoKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
