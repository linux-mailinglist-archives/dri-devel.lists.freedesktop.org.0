Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FDEFAD3C6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18D67898A7;
	Mon,  9 Sep 2019 07:23:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6F1892D3
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 18:40:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3CE3AAC18;
 Fri,  6 Sep 2019 18:40:01 +0000 (UTC)
Date: Fri, 6 Sep 2019 11:39:53 -0700
From: Davidlohr Bueso <dave@stgolabs.net>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v4 0/4] Implement lazy unmapping for GEM VRAM buffers
Message-ID: <20190906183952.huzsq5w3amcznvda@linux-r8p5>
References: <20190906122056.32018-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906122056.32018-1-tzimmermann@suse.de>
User-Agent: NeoMutt/20180323
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
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
Cc: feng.tang@intel.com, rong.a.chen@intel.com, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, maxime.ripard@bootlin.com, kraxel@redhat.com,
 ying.huang@intel.com, sean@poorly.run
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAwNiBTZXAgMjAxOSwgVGhvbWFzIFppbW1lcm1hbm4gd3JvdGU6Cgo+R2VuZXJpYyBm
YmRldiBlbXVsYXRpb24gbWFwcyBhbmQgdW5tYXBzIHRoZSBjb25zb2xlIEJPIGZvciB1cGRhdGlu
ZyBpdCdzCj5jb250ZW50IGZyb20gdGhlIHNoYWRvdyBidWZmZXIuIElmIHRoaXMgaW52b2x2ZXMg
YW4gYWN0dWFsIG1hcHBpbmcKPm9wZXJhdGlvbiAoaW5zdGVhZCBvZiByZXVzaW5nIGFuIGV4aXN0
aW5nIG1hcHBpbmcpLCBsb3RzIG9mIGRlYnVnIG1lc3NhZ2VzCj5tYXkgYmUgcHJpbnRlZCwgc3Vj
aCBhcwo+Cj4gIHg4Ni9QQVQ6IE92ZXJsYXAgYXQgMHhkMDAwMDAwMC0weGQxMDAwMDAwCj4gIHg4
Ni9QQVQ6IHJlc2VydmVfbWVtdHlwZSBhZGRlZCBbbWVtIDB4ZDAwMDAwMDAtMHhkMDJmZmZmZl0s
IHRyYWNrIHdyaXRlLWNvbWJpbmluZywgcmVxIHdyaXRlLWNvbWJpbmluZywgcmV0IHdyaXRlLWNv
bWJpbmluZwo+ICB4ODYvUEFUOiBmcmVlX21lbXR5cGUgcmVxdWVzdCBbbWVtIDB4ZDAwMDAwMDAt
MHhkMDJmZmZmZl0KPgo+YXMgcmVwb3J0ZWQgYXQgWzFdLiBEcml2ZXJzIHVzaW5nIFZSQU0gaGVs
cGVycyBtYXkgYWxzbyBzZWUgcmVkdWNlZAo+cGVyZm9ybWFuY2UgYXMgdGhlIG1hcHBpbmcgb3Bl
cmF0aW9ucyBjYW4gY3JlYXRlIG92ZXJoZWFkLgo+Cj5JbiB2MyBhbmQgbGF0ZXIgb2YgdGhlIHBh
dGNoIHNldCwgdGhpcyBwcm9ibGVtIGlzIGJlaW5nIHNvbHZlZCBieSBsYXppbHkKPnVubWFwcGlu
ZyB0aGUgYnVmZmVyIGFzIHN1Z2dlc3RlZCBieSBHZXJkLiBVbm1hcHBpbmcgd2l0aCBkcm1fZ2Vt
X3ZyYW1fa3VubWFwKCkKPm9ubHkgY2hhbmdlcyBhIHJlZmVyZW5jZSBjb3VudGVyLiBWUkFNIGhl
bHBlcnMgbGF0ZXIgcGVyZm9ybSB0aGUgdW5tYXBwaW5nCj5vcGVyYXRpb24gd2hlbiBUVE0gZXZp
Y3RzIHRoZSBidWZmZXIgb2JqZWN0IGZyb20gaXRzIGN1cnJlbnQgbG9jYXRpb24uIElmCj50aGUg
YnVmZmVyIGlzIG5ldmVyIGV2aWN0ZWQsIHRoZSBleGlzdGluZyBtYXBwaW5nIGlzIHJldXNlZCBi
eSBsYXRlciBjYWxscwo+dG8gZHJtX2dlbV92cmFtX2ttYXAoKS4KPgo+djQ6Cj4JKiBsb2NrIGtt
YXAgd2l0aCB0dG1fYm9fcmVzZXJ2ZSgpCj4JKiBhY3F1aXJlIGxvY2sgb25seSBvbmNlIGZvciB2
bWFwKCkKPgkqIHdhcm4gYWJvdXQgc3RhbGUgbWFwcGluZ3MgZHVyaW5nIGJ1ZmZlciBjbGVhbnVw
Cj52MzoKPiAgICAgIAkqIGltcGxlbWVudCBsYXp5IHVubWFwcGluZwo+djI6Cj4JKiBmaXhlZCBj
b21tZW50IHR5cG9zCj4KPlsxXSBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZl
cy9kcmktZGV2ZWwvMjAxOS1TZXB0ZW1iZXIvMjM0MzA4Lmh0bWwKPgo+VGhvbWFzIFppbW1lcm1h
bm4gKDQpOgo+ICBkcm0vdnJhbTogQWRkIGttYXAgcmVmLWNvdW50aW5nIHRvIEdFTSBWUkFNIG9i
amVjdHMKPiAgZHJtL3ZyYW06IEFjcXVpcmUgbG9jayBvbmx5IG9uY2UgcGVyIGNhbGwgdG8gdm1h
cCgpL3Z1bm1hcCgpCj4gIGRybS92cmFtOiBBZGQgaW5mcmFzdHJ1Y3R1cmUgZm9yIG1vdmVfbm90
aWZ5KCkKPiAgZHJtL3ZyYW06IEltcGxlbWVudCBsYXp5IHVubWFwcGluZyBmb3IgR0VNIFZSQU0g
YnVmZmVycwo+Cj4gZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8IDIyOSAr
KysrKysrKysrKysrKysrKystLS0tLS0tLQo+IGRyaXZlcnMvZ3B1L2RybS9kcm1fdnJhbV9tbV9o
ZWxwZXIuYyAgfCAgMTIgKysKPiBpbmNsdWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAg
IHwgIDE4ICsrCj4gaW5jbHVkZS9kcm0vZHJtX3ZyYW1fbW1faGVscGVyLmggICAgICB8ICAgNCAr
Cj4gNCBmaWxlcyBjaGFuZ2VkLCAxOTggaW5zZXJ0aW9ucygrKSwgNjUgZGVsZXRpb25zKC0pCgpU
aGFua3MgZm9yIHRoZSBwcm9tcHQgZml4LCBmZWVsIGZyZWUgdG8gYWRkIG15OgoKUmVwb3J0ZWQt
YW5kLXRlc3RlZC1ieTogRGF2aWRsb2hyIEJ1ZXNvIDxkYnVlc29Ac3VzZS5kZT4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
