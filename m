Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD161A074
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 17:49:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A84089DE3;
	Fri, 10 May 2019 15:49:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43F6289DE3
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 15:49:07 +0000 (UTC)
X-Originating-IP: 90.88.28.253
Received: from aptenodytes (aaubervilliers-681-1-86-253.w90-88.abo.wanadoo.fr
 [90.88.28.253]) (Authenticated sender: paul.kocialkowski@bootlin.com)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 882431BF207;
 Fri, 10 May 2019 15:49:03 +0000 (UTC)
Message-ID: <2fe2b72a28a7892797fed6d3db86b7c7912fe8c9.camel@bootlin.com>
Subject: Re: [PATCH v8 4/4] drm/vc4: Allocate binner bo when starting to use
 the V3D
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Date: Fri, 10 May 2019 17:48:39 +0200
In-Reply-To: <87r2973222.fsf@anholt.net>
References: <20190503081242.29039-1-paul.kocialkowski@bootlin.com>
 <20190503081242.29039-5-paul.kocialkowski@bootlin.com>
 <87r2973222.fsf@anholt.net>
Organization: Bootlin
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, Maxime Ripard <maxime.ripard@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Eben Upton <eben@raspberrypi.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiBUaHUsIDIwMTktMDUtMDkgYXQgMTE6MzkgLTA3MDAsIEVyaWMgQW5ob2x0IHdyb3Rl
Ogo+IFBhdWwgS29jaWFsa293c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4gd3Jp
dGVzOgo+IAo+ID4gVGhlIGJpbm5lciBCTyBpcyBub3QgcmVxdWlyZWQgdW50aWwgdGhlIFYzRCBp
cyBpbiB1c2UsIHNvIGF2b2lkCj4gPiBhbGxvY2F0aW5nIGl0IGF0IHByb2JlIGFuZCBkbyBpdCBv
biB0aGUgZmlyc3Qgbm9uLWR1bWIgQk8gYWxsb2NhdGlvbi4KPiA+IAo+ID4gS2VlcCB0cmFjayBv
ZiB3aGljaCBjbGllbnRzIGFyZSB1c2luZyB0aGUgVjNEIGFuZCBsaWJlcmF0ZSB0aGUgYnVmZmVy
Cj4gPiB3aGVuIHRoZXJlIGlzIG5vbmUgbGVmdCwgdXNpbmcgYSBrcmVmLiBQcm90ZWN0IHRoZSBs
b2dpYyB3aXRoIGEKPiA+IG11dGV4IHRvIGF2b2lkIHJhY2UgY29uZGl0aW9ucy4KPiA+IAo+ID4g
VGhlIGJpbm5lciBCTyBpcyBjcmVhdGVkIGF0IHRoZSB0aW1lIG9mIHRoZSBmaXJzdCByZW5kZXIg
aW9jdGwgYW5kIGlzCj4gPiBkZXN0cm95ZWQgd2hlbiB0aGVyZSBpcyBubyBjbGllbnQgYW5kIG5v
IGV4ZWMgam9iIHVzaW5nIGl0IGxlZnQuCj4gPiAKPiA+IFRoZSBPdXQtT2YtTWVtb3J5IChPT00p
IGludGVycnVwdCBhbHNvIGdldHMgc29tZSB0d2Vha2luZywgdG8gYXZvaWQKPiA+IGVuYWJsaW5n
IGl0IGJlZm9yZSBoYXZpbmcgYWxsb2NhdGVkIGEgYmlubmVyIGJvLgo+ID4gCj4gPiBXZSBhbHNv
IHdhbnQgdG8ga2VlcCB0aGUgQk8gYWxpdmUgZHVyaW5nIHJ1bnRpbWUgc3VzcGVuZC9yZXN1bWUg
dG8gYXZvaWQKPiA+IGZhaWxpbmcgdG8gYWxsb2NhdGUgaXQgYXQgcmVzdW1lLiBUaGlzIGhhcHBl
bnMgd2hlbiB0aGUgQ01BIHBvb2wgaXMKPiA+IGZ1bGwgYXQgdGhhdCBwb2ludCBhbmQgcmVzdWx0
cyBpbiBhIGhhcmQgY3Jhc2guCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IFBhdWwgS29jaWFsa293
c2tpIDxwYXVsLmtvY2lhbGtvd3NraUBib290bGluLmNvbT4KPiA+IEBAIC0zMTMsNiArMzIxLDQ5
IEBAIHN0YXRpYyBpbnQgYmluX2JvX2FsbG9jKHN0cnVjdCB2YzRfZGV2ICp2YzQpCj4gPiAgCXJl
dHVybiByZXQ7Cj4gPiAgfQo+ID4gIAo+ID4gK2ludCB2YzRfdjNkX2Jpbl9ib19nZXQoc3RydWN0
IHZjNF9kZXYgKnZjNCwgYm9vbCAqdXNlZCkKPiA+ICt7Cj4gPiArCWludCByZXQgPSAwOwo+ID4g
Kwo+ID4gKwltdXRleF9sb2NrKCZ2YzQtPmJpbl9ib19sb2NrKTsKPiA+ICsKPiA+ICsJaWYgKHVz
ZWQgJiYgKnVzZWQpCj4gPiArCQlnb3RvIGNvbXBsZXRlOwo+IAo+IAo+ID4gKwo+ID4gKwlpZiAo
dXNlZCkKPiA+ICsJCSp1c2VkID0gdHJ1ZTsKPiA+ICsKPiA+ICsJaWYgKHZjNC0+YmluX2JvKSB7
Cj4gPiArCQlrcmVmX2dldCgmdmM0LT5iaW5fYm9fa3JlZik7Cj4gPiArCQlnb3RvIGNvbXBsZXRl
Owo+ID4gKwl9Cj4gPiArCj4gPiArCXJldCA9IGJpbl9ib19hbGxvYyh2YzQpOwo+IAo+IEkgdGhp
bmsgdGhpcyBibG9jayB3YW50cyB0byBiZToKPiAKPiBpZiAodmM0LT5iaW5fYm8pCj4gCWtyZWZf
Z2V0KCZ2YzQtPmJpbl9ib19rcmVmKTsKPiBlbHNlCj4gCXJldCA9IGJpbl9ib19hbGxvYyh2YzQp
Owo+IAo+IGlmIChyZXQgPT0gMCAmJiB1c2VkKQo+IAkqdXNlZCA9IHRydWU7Cj4gCj4gKHNvIHdl
IGRvbid0IGZsYWcgdXNlZCBpZiBiaW5fYm9fYWxsb2MgZmFpbHMpCj4gCj4gSWYgeW91IGFncmVl
LCB0aGVuIHRoZSBzZXJpZXMgaXM6CgpJIHRvdGFsbHkgYWdyZWUsIGFuZCBoYWQgZGVmaW5pdGVs
eSBsb3N0IHNpZ2h0IG9mIHRoZSByZXR1cm4gdmFsdWUuCgpUaGFua3MgZm9yIHRoZSB0aG9yb3Vn
aCBjb2RlIHJldmlldyBvbmNlIG1vcmUhCgpDaGVlcnMsCgpQYXVsCgo+IFJldmlld2VkLWJ5OiBF
cmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0Pgo+IAo+ID4gKwo+ID4gK2NvbXBsZXRlOgo+ID4g
KwltdXRleF91bmxvY2soJnZjNC0+YmluX2JvX2xvY2spOwo+ID4gKwo+ID4gKwlyZXR1cm4gcmV0
Owo+ID4gK30KLS0gClBhdWwgS29jaWFsa293c2tpLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBrZXJuZWwgZW5naW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
