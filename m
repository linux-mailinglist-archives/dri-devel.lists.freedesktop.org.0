Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D6ACC00B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2019 18:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E2089DFA;
	Fri,  4 Oct 2019 16:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41F3989DFA
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2019 16:05:00 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 18726097-1500050 for multiple; Fri, 04 Oct 2019 17:04:48 +0100
MIME-Version: 1.0
To: Dan Carpenter <dan.carpenter@oracle.com>, David Airlie <airlied@linux.ie>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <157019813720.18712.6286079822254824652@skylake-alporthouse-com>
References: <20191004102251.GC823@mwanda>
 <157019813720.18712.6286079822254824652@skylake-alporthouse-com>
Message-ID: <157020508581.18712.9108329337994387428@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [PATCH] drm/i810: Prevent underflow in ioctl
Date: Fri, 04 Oct 2019 17:04:45 +0100
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTktMTAtMDQgMTU6MDg6NTcpCj4gUXVvdGluZyBEYW4g
Q2FycGVudGVyICgyMDE5LTEwLTA0IDExOjIyOjUxKQo+ID4gVGhlICJ1c2VkIiB2YXJpYWJsZXMg
aGVyZSBjb21lIGZyb20gdGhlIHVzZXIgaW4gdGhlIGlvY3RsIGFuZCBpdCBjYW4gYmUKPiA+IG5l
Z2F0aXZlLiAgSXQgY291bGQgcmVzdWx0IGluIGFuIG91dCBvZiBib3VuZHMgd3JpdGUuCj4gPiAK
PiA+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNv
bT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvZ3B1L2RybS9pODEwL2k4MTBfZG1hLmMgfCA0ICsrLS0K
PiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4g
Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kbWEuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pODEwL2k4MTBfZG1hLmMKPiA+IGluZGV4IDJhNzc4MjNiOGU5YS4uZTY2YzM4
MzMyZGY0IDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kbWEuYwo+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2k4MTAvaTgxMF9kbWEuYwo+ID4gQEAgLTcyOCw3ICs3
MjgsNyBAQCBzdGF0aWMgdm9pZCBpODEwX2RtYV9kaXNwYXRjaF92ZXJ0ZXgoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKPiA+ICAgICAgICAgaWYgKG5ib3ggPiBJODEwX05SX1NBUkVBX0NMSVBSRUNU
UykKPiA+ICAgICAgICAgICAgICAgICBuYm94ID0gSTgxMF9OUl9TQVJFQV9DTElQUkVDVFM7Cj4g
PiAgCj4gPiAtICAgICAgIGlmICh1c2VkID4gNCAqIDEwMjQpCj4gPiArICAgICAgIGlmICh1c2Vk
IDwgMCB8fCB1c2VkID4gNCAqIDEwMjQpCj4gPiAgICAgICAgICAgICAgICAgdXNlZCA9IDA7Cj4g
Cj4gWWVzLCBhcyBwYXNzZWQgdG8gdGhlIEdQVSBpbnN0cnVjdGlvbiwgbmVnYXRpdmUgdXNlZCBp
cyBpbnZhbGlkLgo+IAo+IFRoZW4gaXQgaXMgdXNlZCBhcyBhbiBvZmZzZXQgaW50byBhIG1lbWJs
b2NrLCB3aGVyZSBhIG5lZ2F0aXZlIG9mZnNldAo+IHdvdWxkIGJlIHZlcnkgYmFkLgo+IAo+IFJl
dmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KCkFwcGxp
ZWQgdG8gZHJtLW1pc2MtbmV4dCB3aXRoIGNjJ2VkIHN0YWJsZS4KLUNocmlzCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
