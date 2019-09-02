Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD126A5CFF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 22:16:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F0D589A08;
	Mon,  2 Sep 2019 20:16:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (shell.v3.sk [90.176.6.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C5089C14
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 09:11:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id EDC08CE718;
 Mon,  2 Sep 2019 11:11:00 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id OkqU5dSpAxIO; Mon,  2 Sep 2019 11:10:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id B94ADD8CED;
 Mon,  2 Sep 2019 11:10:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id FVUC0wSz7RId; Mon,  2 Sep 2019 11:10:53 +0200 (CEST)
Received: from belphegor (nat-pool-brq-t.redhat.com [213.175.37.10])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 91A20CE718;
 Mon,  2 Sep 2019 11:10:52 +0200 (CEST)
Message-ID: <ca0213fd439a2b569e0d3bdb000712ee62ff4836.camel@v3.sk>
Subject: Re: [PATCH] pxa168fb: Fix the function used to release some memory
 in an error handling path
From: Lubomir Rintel <lkundrak@v3.sk>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 b.zolnierkie@samsung.com, yuehaibing@huawei.com
Date: Mon, 02 Sep 2019 11:10:46 +0200
In-Reply-To: <20190831100024.3248-1-christophe.jaillet@wanadoo.fr>
References: <20190831100024.3248-1-christophe.jaillet@wanadoo.fr>
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 02 Sep 2019 20:15:58 +0000
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU2F0LCAyMDE5LTA4LTMxIGF0IDEyOjAwICswMjAwLCBDaHJpc3RvcGhlIEpBSUxMRVQgd3Jv
dGU6Cj4gSW4gdGhlIHByb2JlIGZ1bmN0aW9uLCBzb21lIHJlc291cmNlcyBhcmUgYWxsb2NhdGVk
IHVzaW5nICdkbWFfYWxsb2Nfd2MoKScsCj4gdGhleSBzaG91bGQgYmUgcmVsZWFzZWQgd2l0aCAn
ZG1hX2ZyZWVfd2MoKScsIG5vdCAnZG1hX2ZyZWVfY29oZXJlbnQoKScuCj4gCj4gV2UgYWxyZWFk
eSB1c2UgJ2RtYV9mcmVlX3djKCknIGluIHRoZSByZW1vdmUgZnVuY3Rpb24sIGJ1dCBub3QgaW4g
dGhlCj4gZXJyb3IgaGFuZGxpbmcgcGF0aCBvZiB0aGUgcHJvYmUgZnVuY3Rpb24uCj4gCj4gQWxz
bywgcmVtb3ZlIGEgdXNlbGVzcyAnUEFHRV9BTElHTigpJy4gJ2luZm8tPmZpeC5zbWVtX2xlbicg
aXMgYWxyZWFkeQo+IFBBR0VfQUxJR05lZC4KPiAKPiBGaXhlczogNjM4NzcyYzc1NTNmICgiZmI6
IGFkZCBzdXBwb3J0IG9mIExDRCBkaXNwbGF5IGNvbnRyb2xsZXIgb24gcHhhMTY4LzkxMCAoYmFz
ZSBsYXllcikiKQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waGUgSkFJTExFVCA8Y2hyaXN0b3Bo
ZS5qYWlsbGV0QHdhbmFkb28uZnI+CgpSZXZpZXdlZC1ieTogTHVib21pciBSaW50ZWwgPGxrdW5k
cmFrQHYzLnNrPgoKVGhhbmtzLApMdWJvCgo+IC0tLQo+IFRoZSBjaGFuZ2UgYWJvdXQgUEFHRV9B
TElHTiBzaG91bGQgcHJvYmFibHkgYmUgcGFydCBvZiBhIHNlcGFyYXRlIGNvbW1pdC4KPiBIb3dl
dmVyLCBnaXQgaGlzdG9yeSBmb3IgdGhpcyBkcml2ZXIgaXMgcmVhbGx5IHF1aWV0LiBJZiB5b3Ug
dGhpbmsgaXQKPiBSRUFMTFkgZGVzZXJ2ZXMgYSBzZXBhcmF0ZSBwYXRjaCwgZWl0aGVyIHNwbGl0
IGl0IGJ5IHlvdXJzZWxmIG9yIGF4ZSB0aGlzCj4gcGFydCBvZiB0aGUgcGF0Y2guIEkgd29uJ3Qg
Ym90aGVyIHJlc3VibWl0dGluZyBmb3IgdGhpcyBsb25lbHkgY2xlYW51cC4KPiBIb3BpbmcgZm9y
IHlvdXIgdW5kZXJzdGFuZGluZy4KPiAtLS0KPiAgZHJpdmVycy92aWRlby9mYmRldi9weGExNjhm
Yi5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9weGExNjhmYi5j
IGIvZHJpdmVycy92aWRlby9mYmRldi9weGExNjhmYi5jCj4gaW5kZXggMTQxMGY0NzZlMTM1Li4x
ZmM1MGZjMDY5NGIgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9weGExNjhmYi5j
Cj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9weGExNjhmYi5jCj4gQEAgLTc2Niw4ICs3NjYs
OCBAQCBzdGF0aWMgaW50IHB4YTE2OGZiX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCj4gIGZhaWxlZF9mcmVlX2NsazoKPiAgCWNsa19kaXNhYmxlX3VucHJlcGFyZShmYmktPmNs
ayk7Cj4gIGZhaWxlZF9mcmVlX2ZibWVtOgo+IC0JZG1hX2ZyZWVfY29oZXJlbnQoZmJpLT5kZXYs
IGluZm8tPmZpeC5zbWVtX2xlbiwKPiAtCQkJaW5mby0+c2NyZWVuX2Jhc2UsIGZiaS0+ZmJfc3Rh
cnRfZG1hKTsKPiArCWRtYV9mcmVlX3djKGZiaS0+ZGV2LCBpbmZvLT5maXguc21lbV9sZW4sCj4g
KwkJICAgIGluZm8tPnNjcmVlbl9iYXNlLCBmYmktPmZiX3N0YXJ0X2RtYSk7Cj4gIGZhaWxlZF9m
cmVlX2luZm86Cj4gIAlrZnJlZShpbmZvKTsKPiAgCj4gQEAgLTgwMSw3ICs4MDEsNyBAQCBzdGF0
aWMgaW50IHB4YTE2OGZiX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAK
PiAgCWlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7Cj4gIAo+IC0JZG1hX2ZyZWVfd2Mo
ZmJpLT5kZXYsIFBBR0VfQUxJR04oaW5mby0+Zml4LnNtZW1fbGVuKSwKPiArCWRtYV9mcmVlX3dj
KGZiaS0+ZGV2LCBpbmZvLT5maXguc21lbV9sZW4sCj4gIAkJICAgIGluZm8tPnNjcmVlbl9iYXNl
LCBpbmZvLT5maXguc21lbV9zdGFydCk7Cj4gIAo+ICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGZi
aS0+Y2xrKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
