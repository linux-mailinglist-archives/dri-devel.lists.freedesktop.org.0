Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E6A892AC
	for <lists+dri-devel@lfdr.de>; Sun, 11 Aug 2019 18:45:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38A8B6E386;
	Sun, 11 Aug 2019 16:45:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8236E386
 for <dri-devel@lists.freedesktop.org>; Sun, 11 Aug 2019 16:45:46 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id C44BD80401;
 Sun, 11 Aug 2019 18:45:43 +0200 (CEST)
Date: Sun, 11 Aug 2019 18:45:42 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 1/2] drm: gm12u320: Do not take a mutex from a wait_event
 condition
Message-ID: <20190811164542.GC14660@ravnborg.org>
References: <20190811143725.5951-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190811143725.5951-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=20KFwNOVAAAA:8
 a=7gkXJVJtAAAA:8 a=QUfpErqAEKaAXCEyFNEA:9 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgSGFucy4KCk9uIFN1biwgQXVnIDExLCAyMDE5IGF0IDA0OjM3OjI0UE0gKzAyMDAsIEhhbnMg
ZGUgR29lZGUgd3JvdGU6Cj4gSSBtYWRlIHRoZSBjb25kaXRpb24gb2YgdGhlIHdhaXRfZXZlbnRf
dGltZW91dCBjYWxsIGluCj4gZ20xMnUzMjBfZmJfdXBkYXRlX3dvcmsgYSBoZWxwZXIgd2hpY2gg
dGFrZXMgYSBtdXRleCB0byBtYWtlIHN1cmUKPiB0aGF0IGFueSB3cml0ZXMgdG8gZmJfdXBkYXRl
LnJ1biBvciBmYl91cGRhdGUuZmIgZnJvbSBvdGhlciBDUFUgY29yZXMKPiBhcmUgc2VlbiBiZWZv
cmUgdGhlIGNoZWNrIGlzIGRvbmUuCj4gCj4gVGhpcyBpcyBub3QgbmVjZXNzYXJ5IGFzIHRoZSB3
YWl0X2V2ZW50IGhlbHBlcnMgY29udGFpbiB0aGUgbmVjZXNzYXJ5Cj4gYmFycmllcnMgZm9yIHRo
aXMgdGhlbXNlbHZlcy4KPiAKPiBNb3JlIG92ZXIgaXQgaXMgaGFybWZ1bGwgc2luY2UgYnkgdGhl
IHRpbWUgdGhlIGNoZWNrIGlzIGRvbmUgdGhlIHRhc2sKPiBpcyBubyBsb25nZXIgaW4gdGhlIFRB
U0tfUlVOTklORyBzdGF0ZSBhbmQgY2FsbGluZyBtdXRleF9sb2NrIHdoaWxlIG5vdAo+IGluIHRh
c2stcnVubmluZyBpcyBub3QgYWxsb3dlZCwgbGVhZGluZyB0byB0aGlzIHdhcm5pbmcgd2hlbiB0
aGUga2VybmVsCj4gaXMgYnVpbGQgd2l0aCBzb21lIGV4dHJhIGxvY2tpbmcgY2hlY2tzIGVuYWJs
ZWQ6Cj4gCj4gWzExOTQ3LjQ1MDAxMV0gZG8gbm90IGNhbGwgYmxvY2tpbmcgb3BzIHdoZW4gIVRB
U0tfUlVOTklORzsgc3RhdGU9MiBzZXQgYXQKPiAgICAgICAgICAgICAgICBbPDAwMDAwMDAwZTQz
MDZkZTY+XSBwcmVwYXJlX3RvX3dhaXRfZXZlbnQrMHg2MS8weDE5MAo+IAo+IFRoaXMgY29tbWl0
IGZpeGVzIHRoaXMgYnkgZHJvcHBpbmcgdGhlIGhlbHBlciBhbmQgc2ltcGx5IGRpcmVjdGx5Cj4g
Y2hlY2tpbmcgdGhlIGNvbmRpdGlvbiAod2l0aG91dCB1bm5lY2Vzc2FyeSBsb2NraW5nKSBpbiB0
aGUKPiB3YWl0X2V2ZW50X3RpbWVvdXQgY2FsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBIYW5zIGRl
IEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPgoKQm90aCBwYXRjaGVzIGFyZToKQWNrZWQtYnk6
IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KCkNvZGUgbG9va3Mgc2FuZSBhbmQgbWF0
Y2hlcyB5b3VyIGV4cGxhbmF0aW9ucy4KQnV0IHdpdGggbGltaXRlZCBjbHVlIG9uIGxvY2tpbmcg
b3IgVVNCIHRoaXMgaXMgbm90IGEgcHJvcGVyIHJldmlldy4KCglTYW0KCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS90aW55L2dtMTJ1MzIwLmMgfCAxNCArKy0tLS0tLS0tLS0tLQo+ICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3RpbnkvZ20xMnUzMjAuYyBiL2RyaXZlcnMvZ3B1L2RybS90aW55
L2dtMTJ1MzIwLmMKPiBpbmRleCA0YzQ3YWE0ZGUwOWIuLjRkNjY3NjViMTEyNSAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vdGlueS9nbTEydTMyMC5jCj4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3RpbnkvZ20xMnUzMjAuYwo+IEBAIC0zNDIsMTcgKzM0Miw2IEBAIHN0YXRpYyB2b2lkIGdt
MTJ1MzIwX2NvcHlfZmJfdG9fYmxvY2tzKHN0cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIw
KQo+ICAJbXV0ZXhfdW5sb2NrKCZnbTEydTMyMC0+ZmJfdXBkYXRlLmxvY2spOwo+ICB9Cj4gIAo+
IC1zdGF0aWMgaW50IGdtMTJ1MzIwX2ZiX3VwZGF0ZV9yZWFkeShzdHJ1Y3QgZ20xMnUzMjBfZGV2
aWNlICpnbTEydTMyMCkKPiAtewo+IC0JaW50IHJldDsKPiAtCj4gLQltdXRleF9sb2NrKCZnbTEy
dTMyMC0+ZmJfdXBkYXRlLmxvY2spOwo+IC0JcmV0ID0gIWdtMTJ1MzIwLT5mYl91cGRhdGUucnVu
IHx8IGdtMTJ1MzIwLT5mYl91cGRhdGUuZmIgIT0gTlVMTDsKPiAtCW11dGV4X3VubG9jaygmZ20x
MnUzMjAtPmZiX3VwZGF0ZS5sb2NrKTsKPiAtCj4gLQlyZXR1cm4gcmV0Owo+IC19Cj4gLQo+ICBz
dGF0aWMgdm9pZCBnbTEydTMyMF9mYl91cGRhdGVfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndv
cmspCj4gIHsKPiAgCXN0cnVjdCBnbTEydTMyMF9kZXZpY2UgKmdtMTJ1MzIwID0KPiBAQCAtNDI2
LDcgKzQxNSw4IEBAIHN0YXRpYyB2b2lkIGdtMTJ1MzIwX2ZiX3VwZGF0ZV93b3JrKHN0cnVjdCB3
b3JrX3N0cnVjdCAqd29yaykKPiAgCQkgKiBzd2l0Y2hlcyBiYWNrIHRvIHNob3dpbmcgaXRzIGxv
Z28uCj4gIAkJICovCj4gIAkJd2FpdF9ldmVudF90aW1lb3V0KGdtMTJ1MzIwLT5mYl91cGRhdGUu
d2FpdHEsCj4gLQkJCQkgICBnbTEydTMyMF9mYl91cGRhdGVfcmVhZHkoZ20xMnUzMjApLAo+ICsJ
CQkJICAgIWdtMTJ1MzIwLT5mYl91cGRhdGUucnVuIHx8Cj4gKwkJCQkJZ20xMnUzMjAtPmZiX3Vw
ZGF0ZS5mYiAhPSBOVUxMLAo+ICAJCQkJICAgSURMRV9USU1FT1VUKTsKPiAgCX0KPiAgCXJldHVy
bjsKPiAtLSAKPiAyLjIyLjAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
