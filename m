Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31782879E3
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 14:25:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0B3F6EDF8;
	Fri,  9 Aug 2019 12:25:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19AD06EDF7
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 12:25:24 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1hw3xS-0008Jq-2q; Fri, 09 Aug 2019 14:25:22 +0200
Message-ID: <1565353521.4864.5.camel@pengutronix.de>
Subject: Re: [PATCH v3 8/8] drm/etnaviv: implement per-process address
 spaces on MMUv2
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lucas Stach <l.stach@pengutronix.de>, etnaviv@lists.freedesktop.org
Date: Fri, 09 Aug 2019 14:25:21 +0200
In-Reply-To: <20190809120424.32679-8-l.stach@pengutronix.de>
References: <20190809120424.32679-1-l.stach@pengutronix.de>
 <20190809120424.32679-8-l.stach@pengutronix.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Russell King <linux+etnaviv@armlinux.org.uk>,
 dri-devel@lists.freedesktop.org, kernel@pengutronix.de,
 patchwork-lst@pengutronix.de
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDE5LTA4LTA5IGF0IDE0OjA0ICswMjAwLCBMdWNhcyBTdGFjaCB3cm90ZToKPiBU
aGlzIGJ1aWxkcyBvbiB0b3Agb2YgdGhlIE1NVSBjb250ZXh0cyBpbnRyb2R1Y2VkIGVhcmxpZXIu
IEluc3RlYWQgb2YgaGF2aW5nCj4gb25lIGNvbnRleHQgcGVyIEdQVSBjb3JlLCBlYWNoIEdQVSBj
bGllbnQgcmVjZWl2ZXMgaXRzIG93biBjb250ZXh0Lgo+IAo+IE9uIE1NVXYxIHRoaXMgc3RpbGwg
bWVhbnMgYSBzaW5nbGUgc2hhcmVkIHBhZ2V0YWJsZSBzZXQgaXMgdXNlZCBieSBhbGwKPiBjbGll
bnRzLCBidXQgb24gTU1VdjIgdGhlcmUgaXMgbm93IGEgZGlzdGluY3Qgc2V0IG9mIHBhZ2V0YWJs
ZXMgZm9yIGVhY2gKPiBjbGllbnQuIEFzIHRoZSBjb21tYW5kIGZldGNoIGlzIGFsc28gdHJhbnNs
YXRlZCB2aWEgdGhlIE1NVSBvbiBNTVV2MiB0aGUKPiBrZXJuZWwgY29tbWFuZCByaW5nYnVmZmVy
IGlzIG1hcHBlZCBpbnRvIGVhY2ggb2YgdGhlIGNsaWVudCBwYWdldGFibGVzLgo+IAo+IEFzIHRo
ZSBNTVUgY29udGV4dCBzd2l0Y2ggaXMgYSBiaXQgb2YgYSBoZWF2eSBvcGVyYXRpb24sIGR1ZSB0
byB0aGUgbmVlZGVkCj4gY2FjaGUgYW5kIFRMQiBmbHVzaGluZywgdGhpcyBwYXRjaCBpbXBsZW1l
bnRzIGEgbGF6eSB3YXkgb2Ygc3dpdGNoaW5nIHRoZQo+IE1NVSBjb250ZXh0LiBUaGUga2VybmVs
IGRvZXMgbm90IGhhdmUgaXRzIG93biBNTVUgY29udGV4dCwgYnV0IHJldXNlcyB0aGUKPiBsYXN0
IGNsaWVudCBjb250ZXh0IGZvciBhbGwgb2YgaXRzIG9wZXJhdGlvbnMuIFRoaXMgaGFzIHNvbWUg
dmlzaWJsZSBpbXBhY3QsCj4gYXMgdGhlIEdQVSBjYW4gbm93IG9ubHkgYmUgc3RhcnRlZCBvbmNl
IGEgY2xpZW50IGhhcyBzdWJtaXR0ZWQgc29tZSB3b3JrIGFuZAo+IHdlIGdvdCB0aGUgY2xpZW50
IE1NVSBjb250ZXh0IGFzc2lnbmVkLiBBbHNvIHRoZSBNTVUgY29udGV4dCBoYXMgYSBkaWZmZXJl
bnQKPiBsaWZldGltZSB0aGFuIHRoZSBnZW5lcmFsIGNsaWVudCBjb250ZXh0LCBhcyB0aGUgR1BV
IG1pZ2h0IHN0aWxsIGV4ZWN1dGUgdGhlCj4ga2VybmVsIGNvbW1hbmQgYnVmZmVyIGluIHRoZSBj
b250ZXh0IG9mIGEgY2xpZW50IGV2ZW4gYWZ0ZXIgdGhlIGNsaWVudCBoYXMKPiBjb21wbGV0ZWQg
YWxsIEdQVSB3b3JrIGFuZCBoYXMgYmVlbiB0ZXJtaW5hdGVkLiBPbmx5IHdoZW4gdGhlIEdQVSBp
cyBydW50aW1lCj4gc3VzcGVuZGVkIG9yIHN3aXRjaGVzIHRvIGFub3RoZXIgY2xpZW50cyBNTVUg
Y29udGV4dCBpcyB0aGUgb2xkIGNvbnRleHQKPiBmcmVlZCB1cC4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5ndXRyb25peC5kZT4KClJldmlld2VkLWJ5OiBQaGls
aXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgoKcmVnYXJkcwpQaGlsaXBwCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
