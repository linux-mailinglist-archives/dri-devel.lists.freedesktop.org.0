Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4E5263189
	for <lists+dri-devel@lfdr.de>; Wed,  9 Sep 2020 18:18:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43FC6EC65;
	Wed,  9 Sep 2020 16:18:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA036EC65
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Sep 2020 16:17:59 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7287339;
 Wed,  9 Sep 2020 18:17:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1599668277;
 bh=A0Urw1Q+ir9JTbhNf/GNgSjD5P2aV4lZ1tva1AAvqDU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TaxILc9JtXbSHor9uxAzaj2ighrAwq42iNeJ4SNyQSpfC8SfThYWDAMAQMBdcfAa3
 JRJdiJAY47ZkFxgt9+abdonjJUrhTR1KemewBo7NWdCQXR9Y10ztm0PvF+XyE8jUYp
 EwdzYjvebrjjK6Gi1trR/SsrteoomXzAVbhfg/ck=
Date: Wed, 9 Sep 2020 19:17:30 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Fix pitch handling for fully planar YUV
 formats
Message-ID: <20200909161730.GC3931@pendragon.ideasonboard.com>
References: <20200806022649.22506-1-laurent.pinchart+renesas@ideasonboard.com>
 <3c2147d8-b5bc-b0e8-6435-4d3ec0154249@ideasonboard.com>
 <20200908155208.GF11405@pendragon.ideasonboard.com>
 <6e66b920-96d6-591a-af59-353558b89f98@ideasonboard.com>
 <20200909120835.GJ6112@intel.com>
 <490b02de-8b4f-057e-a0c6-07f73f6ce052@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <490b02de-8b4f-057e-a0c6-07f73f6ce052@ideasonboard.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgS2llcmFuLAoKT24gV2VkLCBTZXAgMDksIDIwMjAgYXQgMDU6MDY6MDFQTSArMDEwMCwgS2ll
cmFuIEJpbmdoYW0gd3JvdGU6Cj4gT24gMDkvMDkvMjAyMCAxMzowOCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+ID4gT24gVHVlLCBTZXAgMDgsIDIwMjAgYXQgMDU6MDU6NDhQTSArMDEwMCwgS2ll
cmFuIEJpbmdoYW0gd3JvdGU6Cj4gPj4gT24gMDgvMDkvMjAyMCAxNjo1MiwgTGF1cmVudCBQaW5j
aGFydCB3cm90ZToKPiA+Pj4gT24gVHVlLCBTZXAgMDgsIDIwMjAgYXQgMDQ6NDI6NThQTSArMDEw
MCwgS2llcmFuIEJpbmdoYW0gd3JvdGU6Cj4gPj4+PiBPbiAwNi8wOC8yMDIwIDAzOjI2LCBMYXVy
ZW50IFBpbmNoYXJ0IHdyb3RlOgo+ID4+Pj4+IFdoZW4gY3JlYXRpbmcgYSBmcmFtZSBidWZmZXIs
IHRoZSBkcml2ZXIgdmVyaWZpZXMgdGhhdCB0aGUgcGl0Y2hlcyBmb3IKPiA+Pj4+PiB0aGUgY2hy
b21hIHBsYW5lcyBtYXRjaCB0aGUgbHVtYSBwbGFuZS4gVGhpcyBpcyBkb25lIGluY29ycmVjdGx5
IGZvcgo+ID4+Pj4+IGZ1bGx5IHBsYW5hciBZVVYgZm9ybWF0cywgd2l0aG91dCB0YWtpbmcgaG9y
aXpvbnRhbCBzdWJzYW1wbGluZyBpbnRvCj4gPj4+Pj4gYWNjb3VudC4gRml4IGl0Lgo+ID4+Pj4+
Cj4gPj4+Pj4gU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dCtyZW5lc2FzQGlkZWFzb25ib2FyZC5jb20+Cj4gPj4+Pj4gLS0tCj4gPiA8c25pcD4KPiA+Pj4+
PiAgCX0sIHsKPiA+Pj4+PiAgCQkuZm91cmNjID0gRFJNX0ZPUk1BVF9ZVlU0NDQsCj4gPj4+Pj4g
IAkJLnY0bDIgPSBWNEwyX1BJWF9GTVRfWVZVNDQ0TSwKPiA+Pj4+PiAgCQkuYnBwID0gMjQsCj4g
Pj4+Pj4gIAkJLnBsYW5lcyA9IDMsCj4gPj4+Pj4gKwkJLmhzdWIgPSAxLAo+ID4+Pj4+ICAJfSwK
PiA+Pj4+PiAgfTsKPiA+Pj4+PiAgCj4gPj4+Pgo+ID4+Pj4gSSB3b25kZXIgd2hlbiB3ZSBjYW4g
aGF2ZSBhIGdsb2JhbC9nZW5lcmljIHNldCBvZiBmb3JtYXQgdGFibGVzIHNvIHRoYXQKPiA+Pj4+
IGFsbCBvZiB0aGlzIGlzbid0IGR1cGxpY2F0ZWQgb24gYSBwZXItZHJpdmVyIGJhc2lzLgo+ID4+
Pgo+ID4+PiBOb3RlIHRoYXQgdGhpcyB0YWJsZSBhbHNvIGNvbnRhaW5zIHJlZ2lzdGVyIHZhbHVl
cywgc28gYXQgbGVhc3QgdGhhdAo+ID4+PiBwYXJ0IHdpbGwgbmVlZCB0byBiZSBrZXB0LiBGb3Ig
dGhlIHJlc3QsIGRvIHlvdSBtZWFuIGEgNENDIGxpYnJhcnkgdGhhdAo+ID4+Cj4gPj4gWWVzLCB0
aGUgZHJpdmVyIHNwZWNpZmljIG1hcHBpbmdzIG9mIGNvdXJzZSBuZWVkIHRvIGJlIGRyaXZlciBz
cGVjaWZpYy4KPiA+Pgo+ID4+PiB3b3VsZCBiZSBzaGFyZWQgYmV0d2VlbiBEUk0vS01TIGFuZCBW
NEwyID8gVGhhdCdzIGEgZ3JlYXQgaWRlYS4gVG9vIGJhZAo+ID4+PiBpdCBoYXMgYmVlbiBzaG90
IGRvd24gd2hlbiBwYXRjaGVzIHdlcmUgc3VibWl0dGVkIDotUwo+ID4+Cj4gPj4gIC9vXCAuLi4g
SXQganVzdCBzZWVtcyBsaWtlIHNvIG11Y2ggZGF0YSByZXBsaWNhdGlvbiB0aGF0IG11c3QgYmUg
dXNlZAo+ID4+IGJ5IG1hbnkgZHJpdmVycy4KPiA+Pgo+ID4+IEV2ZW4gd2l0aG91dCBtYXBwaW5n
IHRoZSBEUk0vVjRMMiBmb3VyY2NzIC0gZXZlbiBhIGNvbW1vbiB0YWJsZSBpbiBlYWNoCj4gPj4g
c3Vic3lzdGVtIHdvdWxkIGJlIGJlbmVmaWNpYWwgd291bGRuJ3QgaXQ/Cj4gPj4KPiA+PiBJIG1l
YW4gLSBSQ2FyLURVIGlzbid0IHRoZSBvbmx5IGRldmljZSB0aGF0IG5lZWRzIHRvIGtub3cgaG93
IG1hbnkKPiA+PiBwbGFuZXMgRFJNX0ZPUk1BVF9ZVVY0MjIgaGFzLCBvciB3aGF0IGhvcml6b250
YWwgc3Vic2FtcGxpbmcgaXQgdXNlcz8KPiA+Pgo+ID4+IEFueXdheSwgdGhhdCdzIG5vdCBhbiBp
c3N1ZSB3aXRoIHRoaXMgcGF0Y2gsIGl0IGp1c3Qgc2VlbXMgZ2xhcmluZyB0byBtZQo+ID4+IHRo
YXQgdGhlc2UgZW50cmllcyBhcmUgY29tbW9uIGFjcm9zcyBhbGwgaGFyZHdhcmUgdGhhdCB1c2Ug
dGhlbSAuLi4KPiA+Pgo+ID4+ICh0aGUgYnBwL3BsYW5lcy9zdWJzYW1wbGluZyBvZiBjb3Vyc2Us
IG5vdCB0aGUgaGFyZHdhcmUgc3BlY2lmaWMgcmVnaXN0ZXJzKS4KPiA+IAo+ID4gU2VlIGRybV9m
b3JtYXRfaW5mbygpICYgY28uCj4gCj4gQWhhIHBlcmZlY3QsIFRoYXQncyB3aGF0IEkgd2FzIGxv
b2tpbmcgZm9yLgo+IEknbSBnbGFkIHRvIHNlZSB0aGF0J3MgY29tbW9uIChhdCBsZWFzdCBmb3Ig
dGhlIERSTSBwYXJ0cykuCj4gCj4gVGhlIHF1ZXN0aW9uIGlzIC0gd2h5IGFyZW4ndCB3ZSB1c2lu
ZyBpdCBpbiBSQ2FyLURVLgo+IAo+IExhdXJlbnQsIHdvdWxkIHlvdSBzZWUgYW55IGlzc3VlIGlu
IG9idGFpbmluZyB0aGUgc3RydWN0IGRybV9mb3JtYXRfaW5mbwo+IHJhdGhlciB0aGFuIHJlLWVu
Y29kaW5nIGFsbCB0aGUgZGF0YSBpbiB0aGVzZSB0YWJsZXM/Cj4gCj4gQW5kIGlmIG5vdCAtIHdv
dWxkIHlvdSBwcmVmZXIgdG8gY29udmVydCBvbiB0b3Agb2YgdGhpcyBwYXRjaCwgb3IKPiBwcmVj
ZWRpbmcgdGhpcyBwYXRjaD8KPiAKPiBPciBzaW1wbHkgcHJlZmVyIHRvIGtlZXAgdGhlIGV4aXN0
aW5nIHRhYmxlcyA/Cj4gCj4gR2l2ZW4gdGhhdCB0aGlzIGZpeGVzIGEgYnVnIC0gSSdkIHNheSBn
ZXR0aW5nIHRoaXMgcGF0Y2ggaW4gbm93IGlzCj4gcHJvYmFibHkgYmVzdC4KCkknZCBhcHBseSBy
ZWZhY3RvcmluZyBvbiB0b3AsIGlmIGRlc2lyZWQuIFlvdSB3b3VsZCBoYXZlIHRvIGtlZXAgdGhl
CmV4aXN0aW5nIHRhYmxlIGZvciB0aGUgbWFwcGluZyB0byBWNEwyIChhbHRob3VnaCB0aGlzIGNv
dWxkIGJlIG1vdmVkIHRvCmRybV9mb3JtYXRfaW5mbyBpZiBkZXNpcmVkKSwgYXMgd2VsbCBhcyBm
b3IgdGhlIHJlZ2lzdGVyIHZhbHVlLiBBbmQgdGhhdAp3b3VsZCB0aGVuIGxlYWQgdG8gYSBkb3Vi
bGUgbG9va3VwIG9wZXJhdGlvbi4gVGhhdCdzIHRoZSBwYXJ0IHRoYXQKYm90aGVycyBtZSB0aGUg
bW9zdC4KCi0tIApSZWdhcmRzLAoKTGF1cmVudCBQaW5jaGFydApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
