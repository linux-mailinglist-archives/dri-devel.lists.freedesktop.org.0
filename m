Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CC32CD13
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 19:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034146E271;
	Tue, 28 May 2019 17:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60E956E271
 for <dri-devel@lists.freedesktop.org>; Tue, 28 May 2019 17:05:17 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 6F11180439;
 Tue, 28 May 2019 19:05:15 +0200 (CEST)
Date: Tue, 28 May 2019 19:05:14 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 07/10] drm/amd/display: use ttm_eu_reserve_buffers
 instead of amdgpu_bo_reserve v2
Message-ID: <20190528170514.GC10262@ravnborg.org>
References: <20190528162557.1280-1-christian.koenig@amd.com>
 <20190528162557.1280-7-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190528162557.1280-7-christian.koenig@amd.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VcLZwmh9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=zd2uoN0lAAAA:8
 a=e5mUnYsNAAAA:8 a=JC7o674lU1bcOKkyF80A:9 a=a-EaZ7q11tSjx7Ry:21
 a=rD1pN_U032pgNBzt:21 a=wPNLvfGTeEIA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: Marek.Olsak@amd.com, amd-gfx@lists.freedesktop.org, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgQ2hyaXN0aWFuLgoKT24gVHVlLCBNYXkgMjgsIDIwMTkgYXQgMDY6MjU6NTRQTSArMDIwMCwg
Q2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBGcm9tOiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhv
dUBhbWQuY29tPgo+IAo+IGFkZCB0aWNrZXQgZm9yIGRpc3BsYXkgYm8sIHNvIHRoYXQgaXQgY2Fu
IHByZWVtcHQgYnVzeSBiby4KPiAKPiB2MjogZml4IHN0dXBpZCByZWJhc2UgZXJyb3IKPiAKPiBD
aGFuZ2UtSWQ6IEk5ZjAzMWNkY2M4MjY3ZGUwMGU4MTlhZTMwM2JhYTBhNTJkZjhlYmI5CldoYXQg
aXMgdGhpcz8KSSBkbyBub3QgcmVjYWxsIHNlZWluZyB0aGlzIGluIGEgY2hhbmdlbG9nIGJlZm9y
ZT8KCihTb3JyeSBmb3Igbm90IGNvbW1lbnRpbmcgb24gdGhlIHBhdGNoLCBtb3N0IG9mIGl0IGlz
IGJleW9uZCBteQp1bmRlcnN0YW5kaW5nIGZvciBub3cpLgoKCVNhbQoKPiBTaWduZWQtb2ZmLWJ5
OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhvdUBhbWQuY29tPgo+IFJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4gLS0tCj4gIC4uLi9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYyB8IDIxICsrKysrKysrKysrKysr
LS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0v
YW1kZ3B1X2RtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdw
dV9kbS5jCj4gaW5kZXggNGExNzU1YmNlOTZjLi41NmYzMjBmM2ZkNzIgMTAwNjQ0Cj4gLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKPiBAQCAt
NDE4Miw2ICs0MTgyLDkgQEAgc3RhdGljIGludCBkbV9wbGFuZV9oZWxwZXJfcHJlcGFyZV9mYihz
dHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwKPiAgCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2Owo+
ICAJc3RydWN0IGFtZGdwdV9ibyAqcmJvOwo+ICAJc3RydWN0IGRtX3BsYW5lX3N0YXRlICpkbV9w
bGFuZV9zdGF0ZV9uZXcsICpkbV9wbGFuZV9zdGF0ZV9vbGQ7Cj4gKwlzdHJ1Y3QgbGlzdF9oZWFk
IGxpc3Q7Cj4gKwlzdHJ1Y3QgdHRtX3ZhbGlkYXRlX2J1ZmZlciB0djsKPiArCXN0cnVjdCB3d19h
Y3F1aXJlX2N0eCB0aWNrZXQ7Cj4gIAl1aW50NjRfdCB0aWxpbmdfZmxhZ3M7Cj4gIAl1aW50MzJf
dCBkb21haW47Cj4gIAlpbnQgcjsKPiBAQCAtNDE5OCw5ICs0MjAxLDE3IEBAIHN0YXRpYyBpbnQg
ZG1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCj4gIAlv
YmogPSBuZXdfc3RhdGUtPmZiLT5vYmpbMF07Cj4gIAlyYm8gPSBnZW1fdG9fYW1kZ3B1X2JvKG9i
aik7Cj4gIAlhZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KHJiby0+dGJvLmJkZXYpOwo+IC0JciA9IGFt
ZGdwdV9ib19yZXNlcnZlKHJibywgZmFsc2UpOwo+IC0JaWYgKHVubGlrZWx5KHIgIT0gMCkpCj4g
KwlJTklUX0xJU1RfSEVBRCgmbGlzdCk7Cj4gKwo+ICsJdHYuYm8gPSAmcmJvLT50Ym87Cj4gKwl0
di5udW1fc2hhcmVkID0gMTsKPiArCWxpc3RfYWRkKCZ0di5oZWFkLCAmbGlzdCk7Cj4gKwo+ICsJ
ciA9IHR0bV9ldV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIGZhbHNlLCBOVUxMLCB0
cnVlKTsKPiArCWlmIChyKSB7Cj4gKwkJZGV2X2VycihhZGV2LT5kZXYsICJmYWlsIHRvIHJlc2Vy
dmUgYm8gKCVkKVxuIiwgcik7Cj4gIAkJcmV0dXJuIHI7Cj4gKwl9Cj4gIAo+ICAJaWYgKHBsYW5l
LT50eXBlICE9IERSTV9QTEFORV9UWVBFX0NVUlNPUikKPiAgCQlkb21haW4gPSBhbWRncHVfZGlz
cGxheV9zdXBwb3J0ZWRfZG9tYWlucyhhZGV2KTsKPiBAQCAtNDIxMSwyMSArNDIyMiwyMSBAQCBz
dGF0aWMgaW50IGRtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBs
YW5lLAo+ICAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsKPiAgCQlpZiAociAhPSAtRVJFU1RBUlRT
WVMpCj4gIAkJCURSTV9FUlJPUigiRmFpbGVkIHRvIHBpbiBmcmFtZWJ1ZmZlciB3aXRoIGVycm9y
ICVkXG4iLCByKTsKPiAtCQlhbWRncHVfYm9fdW5yZXNlcnZlKHJibyk7Cj4gKwkJdHRtX2V1X2Jh
Y2tvZmZfcmVzZXJ2YXRpb24oJnRpY2tldCwgJmxpc3QpOwo+ICAJCXJldHVybiByOwo+ICAJfQo+
ICAKPiAgCXIgPSBhbWRncHVfdHRtX2FsbG9jX2dhcnQoJnJiby0+dGJvKTsKPiAgCWlmICh1bmxp
a2VseShyICE9IDApKSB7Cj4gIAkJYW1kZ3B1X2JvX3VucGluKHJibyk7Cj4gLQkJYW1kZ3B1X2Jv
X3VucmVzZXJ2ZShyYm8pOwo+ICsJCXR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZ0aWNrZXQs
ICZsaXN0KTsKPiAgCQlEUk1fRVJST1IoIiVwIGJpbmQgZmFpbGVkXG4iLCByYm8pOwo+ICAJCXJl
dHVybiByOwo+ICAJfQo+ICAKPiAgCWFtZGdwdV9ib19nZXRfdGlsaW5nX2ZsYWdzKHJibywgJnRp
bGluZ19mbGFncyk7Cj4gIAo+IC0JYW1kZ3B1X2JvX3VucmVzZXJ2ZShyYm8pOwo+ICsJdHRtX2V1
X2JhY2tvZmZfcmVzZXJ2YXRpb24oJnRpY2tldCwgJmxpc3QpOwo+ICAKPiAgCWFmYi0+YWRkcmVz
cyA9IGFtZGdwdV9ib19ncHVfb2Zmc2V0KHJibyk7Cj4gIAo+IC0tIAo+IDIuMTcuMQo+IAo+IF9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVs
IG1haWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
