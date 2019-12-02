Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D9510EA24
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2019 13:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70162895B4;
	Mon,  2 Dec 2019 12:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D48A895B4
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2019 12:36:44 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61B57309;
 Mon,  2 Dec 2019 13:36:42 +0100 (CET)
Date: Mon, 2 Dec 2019 14:36:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] drm/omap: fix dma_addr refcounting
Message-ID: <20191202123635.GE4929@pendragon.ideasonboard.com>
References: <20191114080343.30704-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191114080343.30704-1-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1575290202;
 bh=eBCG+40YivnFp/hUfEgfEGwuMXq4mLFDqO/9GbwyINQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CtKqyysRhxETZt44jwWGjlzD4A7nIg9s9DdvECyhAJAZtaZYdl2o02eGX+kGU8FRS
 vuS5GKvuKMwvZlSoSln5HtNHeg1zXKerNHpySItKGv2pVtiIW/3YY5jKKf3HVaGjUL
 UOKFvQNIbzdZNQ93ij6SP2U6+9k0QPQ2txXe/lNA=
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
Cc: Jean-Jacques Hiblot <jjhiblot@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVG9taSwKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBOb3YgMTQsIDIwMTkg
YXQgMTA6MDM6NDNBTSArMDIwMCwgVG9taSBWYWxrZWluZW4gd3JvdGU6Cj4gY2VjNGZhNzUxMWVm
N2E3M2ViNjM1ODM0ZTlkODViMjVhNWI0N2E5OCAoImRybS9vbWFwOiB1c2UgcmVmY291bnQgQVBJ
IHRvCj4gdHJhY2sgdGhlIG51bWJlciBvZiB1c2VycyBvZiBkbWFfYWRkciIpIGNoYW5nZWQgb21h
cF9nZW0uYyB0byB1c2UKPiByZWZjb3VudGluZyBBUEkgdG8gdHJhY2sgZG1hX2FkZHIgdXNlcy4g
IEhvd2V2ZXIsIHRoZSBkcml2ZXIgb25seSB0cmFja3MKPiB0aGUgcmVmY291bnRzIGZvciBub24t
Y29udGlndW91cyBidWZmZXJzLCBhbmQgdGhlIHBhdGNoIGRpZG4ndCBmdWxseQo+IHRha2UgdGhp
cyBpbiBhY2NvdW50Lgo+IAo+IEFmdGVyIHRoZSBwYXRjaCwgdGhlIGRyaXZlciBhbHdheXMgZGVj
cmVhc2VkIHJlZmNvdW50IGluIG9tYXBfZ2VtX3VucGluLAo+IGluc3RlYWQgb2YgZGVjcmVhc2lu
ZyB0aGUgcmVmY291bnQgb25seSBmb3Igbm9uLWNvbnRpZ3VvdXMgYnVmZmVycy4gVGhpcwo+IGxl
YWRzIHRvIHJlZmNvdW50aW5nIG1pc21hdGNoLgo+IAo+IEFzIGZvciB0aGUgY29udGlndW91cyBj
YXNlcyB0aGUgcmVmY291bnQgaXMgbmV2ZXIgaW5jcmVhc2VkLCBmaXggdGhpcwo+IGlzc3VlIGJ5
IHJldHVybmluZyBmcm9tIG9tYXBfZ2VtX3VucGluIGlmIHRoZSBidWZmZXIgYmVpbmcgdW5waW5u
ZWQgaXMKPiBjb250aWd1b3VzLgoKSG93IGFib3V0IGFkZGluZyBhIEZpeGVzIGxpbmUgPwoKRml4
ZXM6IGNlYzRmYTc1MTFlZiAoImRybS9vbWFwOiB1c2UgcmVmY291bnQgQVBJIHRvIHRyYWNrIHRo
ZSBudW1iZXIgb2YgdXNlcnMgb2YgZG1hX2FkZHIiKQoKPiBTaWduZWQtb2ZmLWJ5OiBUb21pIFZh
bGtlaW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgoKUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZ2VtLmMgfCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQs
IDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRy
bS9vbWFwX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9nZW0uYwo+IGluZGV4
IGU1MThkOTNjYTZkZi4uZDA4YWU5NWVjYzBhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9vbWFwZHJtL29tYXBfZ2VtLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFw
X2dlbS5jCj4gQEAgLTg0Myw5ICs4NDMsMTMgQEAgaW50IG9tYXBfZ2VtX3BpbihzdHJ1Y3QgZHJt
X2dlbV9vYmplY3QgKm9iaiwgZG1hX2FkZHJfdCAqZG1hX2FkZHIpCj4gICAqLwo+ICBzdGF0aWMg
dm9pZCBvbWFwX2dlbV91bnBpbl9sb2NrZWQoc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmopCj4g
IHsKPiArCXN0cnVjdCBvbWFwX2RybV9wcml2YXRlICpwcml2ID0gb2JqLT5kZXYtPmRldl9wcml2
YXRlOwo+ICAJc3RydWN0IG9tYXBfZ2VtX29iamVjdCAqb21hcF9vYmogPSB0b19vbWFwX2JvKG9i
aik7Cj4gIAlpbnQgcmV0Owo+ICAKPiArCWlmIChvbWFwX2dlbV9pc19jb250aWd1b3VzKG9tYXBf
b2JqKSB8fCAhcHJpdi0+aGFzX2RtbSkKPiArCQlyZXR1cm47Cj4gKwo+ICAJaWYgKHJlZmNvdW50
X2RlY19hbmRfdGVzdCgmb21hcF9vYmotPmRtYV9hZGRyX2NudCkpIHsKPiAgCQlyZXQgPSB0aWxl
cl91bnBpbihvbWFwX29iai0+YmxvY2spOwo+ICAJCWlmIChyZXQpIHsKCi0tIApSZWdhcmRzLAoK
TGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
