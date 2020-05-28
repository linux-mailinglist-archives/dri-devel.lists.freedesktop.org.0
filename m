Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 877691E6E12
	for <lists+dri-devel@lfdr.de>; Thu, 28 May 2020 23:46:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C383D6E7EF;
	Thu, 28 May 2020 21:46:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 656C46E7EF
 for <dri-devel@lists.freedesktop.org>; Thu, 28 May 2020 21:46:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BF5BB2A8;
 Thu, 28 May 2020 23:46:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590702381;
 bh=2kQLJ6ihq2PvrAL0aFkV0qdd4HEG8jQjlPEKzcWA4zI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aNNmYmnx/YtiaQVF0zhm6NKUhO6tyxYre9WWwiDlNS9QeKkblOPHKa6HLKEXjG+4j
 lNUPQzPegoZeRz0wrGN3ySSpAhmrl3OfbCK8+SDVn8I76Sr/WH83NJZ3j3uohoSBvM
 OYwD8YwyTzk36wLhNTnG1MiavALmhYO0KitlmpBg=
Date: Fri, 29 May 2020 00:46:07 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
Subject: Re: [PATCH v2 4/4] drm/bridge: tfp410: Fix setup and hold time
 calculation
Message-ID: <20200528214607.GB14756@pendragon.ideasonboard.com>
References: <20200514143612.2094-1-ricardo.canuelo@collabora.com>
 <20200514143612.2094-5-ricardo.canuelo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514143612.2094-5-ricardo.canuelo@collabora.com>
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
Cc: devicetree@vger.kernel.org, jason@lakedaemon.net, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org, tomi.valkeinen@ti.com,
 kernel@collabora.com, shawnguo@kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgUmljYXJkbywKClRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoLgoKT24gVGh1LCBNYXkgMTQsIDIw
MjAgYXQgMDQ6MzY6MTJQTSArMDIwMCwgUmljYXJkbyBDYcOxdWVsbyB3cm90ZToKPiBUaGUgdGZw
NDEwIGhhcyBhIGRhdGEgZGUtc2tldyBmZWF0dXJlIHRoYXQgYWxsb3dzIHRoZSB1c2VyIHRvIGNv
bXBlbnNhdGUKPiB0aGUgc2tldyBiZXR3ZWVuIElEQ0sgYW5kIHRoZSBwaXhlbCBkYXRhIGFuZCBj
b250cm9sIHNpZ25hbHMuCj4gCj4gSW4gdGhlIGRyaXZlciwgdGhlIHNldHVwIGFuZCBob2xkIHRp
bWVzIGFyZSBjYWxjdWxhdGVkIGZyb20gdGhlIGRlLXNrZXcKPiB2YWx1ZS4gVGhpcyByZXRyaWV2
ZXMgdGhlIGRlc2tldyB2YWx1ZSBmcm9tIHRoZSBEVCB1c2luZyB0aGUgcHJvcGVyCj4gZGF0YXR5
cGUgYW5kIHJhbmdlIGNoZWNrIGFzIGRlc2NyaWJlZCBieSB0aGUgYmluZGluZyAodTMyIGZyb20g
MCB0byA3KQo+IGFuZCBmaXhlcyB0aGUgY2FsY3VsYXRpb24gb2YgdGhlIHNldHVwIGFuZCBob2xk
IHRpbWVzLgoKSG93IGFib3V0IG1lbnRpb25pbmcgdGhhdCB0aGUgZml4IHJlc3VsdHMgZnJvbSBh
IGNoYW5nZSBpbiB0aGUgRFQKYmluZGluZ3MgPyBPdGhlcndpc2UgaXQgc291bmRzIGl0IHdhcyBh
IGJ1ZyBpbiB0aGUgZHJpdmVyLgoKSSB3b3VsZCBhbHNvIG1lbnRpb24gdGhhdCB0aGUgcGF0Y2gg
Zml4ZXMgdGhlIG1pbigpIGNhbGN1bGF0aW9uLCB3aGljaAp3YXMgY2xlYXJseSB3cm9uZy4gSSB0
aGluayBJIHdvdWxkIGhhdmUgc3BsaXQgdGhpcyBpbiB0d28gcGF0Y2hlcy4KCldpdGggdGhpcyBh
ZGRyZXNzZWQsCgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFy
dEBpZGVhc29uYm9hcmQuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBSaWNhcmRvIENhw7F1ZWxvIDxy
aWNhcmRvLmNhbnVlbG9AY29sbGFib3JhLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS10ZnA0MTAuYyB8IDEwICsrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS10ZnA0MTAuYyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktdGZwNDEw
LmMKPiBpbmRleCBlM2ViNjM2NGMwZjcuLjIxZDk5YjRlYTBjOSAxMDA2NDQKPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXRmcDQxMC5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS90aS10ZnA0MTAuYwo+IEBAIC0yMjAsNyArMjIwLDcgQEAgc3RhdGljIGludCB0ZnA0MTBf
cGFyc2VfdGltaW5ncyhzdHJ1Y3QgdGZwNDEwICpkdmksIGJvb2wgaTJjKQo+ICAJc3RydWN0IGRl
dmljZV9ub2RlICplcDsKPiAgCXUzMiBwY2xrX3NhbXBsZSA9IDA7Cj4gIAl1MzIgYnVzX3dpZHRo
ID0gMjQ7Cj4gLQlzMzIgZGVza2V3ID0gMDsKPiArCXUzMiBkZXNrZXcgPSAwOwo+ICAKPiAgCS8q
IFN0YXJ0IHdpdGggZGVmYXVsdHMuICovCj4gIAkqdGltaW5ncyA9IHRmcDQxMF9kZWZhdWx0X3Rp
bWluZ3M7Cj4gQEAgLTI3NCwxMiArMjc0LDEyIEBAIHN0YXRpYyBpbnQgdGZwNDEwX3BhcnNlX3Rp
bWluZ3Moc3RydWN0IHRmcDQxMCAqZHZpLCBib29sIGkyYykKPiAgCX0KPiAgCj4gIAkvKiBHZXQg
dGhlIHNldHVwIGFuZCBob2xkIHRpbWUgZnJvbSB2ZW5kb3Itc3BlY2lmaWMgcHJvcGVydGllcy4g
Ki8KPiAtCW9mX3Byb3BlcnR5X3JlYWRfdTMyKGR2aS0+ZGV2LT5vZl9ub2RlLCAidGksZGVza2V3
IiwgKHUzMiAqKSZkZXNrZXcpOwo+IC0JaWYgKGRlc2tldyA8IC00IHx8IGRlc2tldyA+IDMpCj4g
KwlvZl9wcm9wZXJ0eV9yZWFkX3UzMihkdmktPmRldi0+b2Zfbm9kZSwgInRpLGRlc2tldyIsICZk
ZXNrZXcpOwo+ICsJaWYgKGRlc2tldyA+IDcpCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gIAo+IC0J
dGltaW5ncy0+c2V0dXBfdGltZV9wcyA9IG1pbigwLCAxMjAwIC0gMzUwICogZGVza2V3KTsKPiAt
CXRpbWluZ3MtPmhvbGRfdGltZV9wcyA9IG1pbigwLCAxMzAwICsgMzUwICogZGVza2V3KTsKPiAr
CXRpbWluZ3MtPnNldHVwX3RpbWVfcHMgPSAxMjAwIC0gMzUwICogKChzMzIpZGVza2V3IC0gNCk7
Cj4gKwl0aW1pbmdzLT5ob2xkX3RpbWVfcHMgPSBtYXgoMCwgMTMwMCArIDM1MCAqICgoczMyKWRl
c2tldyAtIDQpKTsKPiAgCj4gIAlyZXR1cm4gMDsKPiAgfQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50
IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
