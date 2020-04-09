Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 279841A34D5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Apr 2020 15:25:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F9D6E1D2;
	Thu,  9 Apr 2020 13:25:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B7486EBBB
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Apr 2020 13:25:49 +0000 (UTC)
Received: from gallifrey.ext.pengutronix.de
 ([2001:67c:670:201:5054:ff:fe8d:eefb] helo=localhost)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1jMXBi-0007L0-5U; Thu, 09 Apr 2020 15:25:46 +0200
Message-ID: <d80c89fe353a114df786e75563d434c496b8140d.camel@pengutronix.de>
Subject: Re: [PATCH] drm/ttm: Schedule out if possibe in bo delayed delete
 worker
From: Lucas Stach <l.stach@pengutronix.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, xinhui
 pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
Date: Thu, 09 Apr 2020 15:25:45 +0200
In-Reply-To: <7ebd6025-a563-30d1-8c84-cb031bfef0c1@amd.com>
References: <20200409013148.4219-1-xinhui.pan@amd.com>
 <7ebd6025-a563-30d1-8c84-cb031bfef0c1@amd.com>
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:201:5054:ff:fe8d:eefb
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gRG9ubmVyc3RhZywgZGVuIDA5LjA0LjIwMjAsIDE0OjM1ICswMjAwIHNjaHJpZWIgQ2hyaXN0
aWFuIEvDtm5pZzoKPiBBbSAwOS4wNC4yMCB1bSAwMzozMSBzY2hyaWViIHhpbmh1aSBwYW46Cj4g
PiBUaGUgZGVsYXllZCBkZWxldGUgbGlzdCBpcyBwZXIgZGV2aWNlIHdoaWNoIG1pZ2h0IGJlIHZl
cnkgaHVnZS4gQW5kIGluCj4gPiBhIGhlYXZ5IHdvcmtsb2FkIHRlc3QsIHRoZSBsaXN0IG1pZ2h0
IGFsd2F5cyBub3QgYmUgZW1wdHkuIFRoYXQgd2lsbAo+ID4gdHJpZ2dlciBhbnkgUkNVIHN0YWxs
IHdhcm5pbmdzIG9yIHNvZnRsb2NrdXBzIGluIG5vbi1wcmVlbXB0aWJsZSBrZXJuZWxzCj4gPiBM
ZXRzIGRvIHNjaGVkdWxlIG91dCBpZiBwb3NzaWJsZSBpbiB0aGF0IGNhc2UuCj4gCj4gTWhtLCBJ
J20gbm90IHN1cmUgaWYgdGhhdCBpcyBhY3R1YWxseSBhbGxvd2VkLiBUaGlzIGlzIGNhbGxlZCBm
cm9tIGEgCj4gd29yayBpdGVtIGFuZCB0aG9zZSBhcmUgbm90IHJlYWxseSBzdXBwb3NlZCB0byBi
ZSBzY2hlZHVsZWQgYXdheS4KCkh1aD8gV29ya2l0ZW1zIGNhbiBzY2hlZHVsZSBvdXQganVzdCBm
aW5lLCBvdGhlcndpc2UgdGhleSB3b3VsZCBiZQpob3JyaWJseSBicm9rZW4gd2hlbiBpdCBjb21l
cyB0byBzbGVlcGluZyBsb2Nrcy4gVGhlIHdvcmtxdWV1ZSBjb2RlCmV2ZW4gaGFzIG1lYXN1cmVz
IHRvIGtlZXAgdGhlIHdvcmtxdWV1ZXMgYXQgdGhlIGV4cGVjdGVkIGNvbmN1cnJlbmN5CmxldmVs
IGJ5IHN0YXJ0aW5nIG90aGVyIHdvcmtpdGVtcyB3aGVuIG9uZSBvZiB0aGVtIGdvZXMgdG8gc2xl
ZXAuCgpSZWdhcmRzLApMdWNhcwoKPiBNYXliZSByYXRoZXIgY2hhbmdlIHRoZSB3aGlsZSBpbnRv
IHdoaWxlICghbGlzdF9lbXB0eSgmYmRldi0+ZGRlc3Ryb3kpIAo+ICYmICFzaG91bGRfcmVzY2hl
ZHVsZSgwKSkuCj4gCj4gQ2hyaXN0aWFuLgo+IAo+ID4gU2lnbmVkLW9mZi1ieTogeGluaHVpIHBh
biA8eGluaHVpLnBhbkBhbWQuY29tPgo+ID4gLS0tCj4gPiAgIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgfCAxICsKPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAK
PiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fYm8uYwo+ID4gaW5kZXggOWUwN2MzZjc1MTU2Li5iOGQ4NTNjYWIzM2Ig
MTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gPiArKysgYi9k
cml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4gPiBAQCAtNTQxLDYgKzU0MSw3IEBAIHN0YXRp
YyBib29sIHR0bV9ib19kZWxheWVkX2RlbGV0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwg
Ym9vbCByZW1vdmVfYWxsKQo+ID4gICAJCX0KPiA+ICAgCj4gPiAgIAkJdHRtX2JvX3B1dChibyk7
Cj4gPiArCQljb25kX3Jlc2NoZWQoKTsKPiA+ICAgCQlzcGluX2xvY2soJmdsb2ItPmxydV9sb2Nr
KTsKPiA+ICAgCX0KPiA+ICAgCWxpc3Rfc3BsaWNlX3RhaWwoJnJlbW92ZWQsICZiZGV2LT5kZGVz
dHJveSk7Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
