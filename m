Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B5CE295947
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:34:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078716F523;
	Thu, 22 Oct 2020 07:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ECEC6F523
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 07:34:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B6DC5B195;
 Thu, 22 Oct 2020 07:34:12 +0000 (UTC)
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
To: saeed.mirzamohammadi@oracle.com, linux-kernel@vger.kernel.org
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ad87c5c1-061d-8a81-7b2c-43a8687a464f@suse.de>
Date: Thu, 22 Oct 2020 09:34:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
Content-Language: en-US
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
Cc: linux-fbdev@vger.kernel.org, b.zolnierkie@samsung.com,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, gustavoars@kernel.org,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org, rppt@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkKCk9uIDIyLjEwLjIwIDAxOjU3LCBzYWVlZC5taXJ6YW1vaGFtbWFkaUBvcmFjbGUuY29tIHdy
b3RlOgo+IEZyb206IFNhZWVkIE1pcnphbW9oYW1tYWRpIDxzYWVlZC5taXJ6YW1vaGFtbWFkaUBv
cmFjbGUuY29tPgo+IAo+IFRoaXMgcGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGR1ZSB0bzoKPiAKPiBb
ICAgODkuNTcyODgzXSBkaXZpZGVfZXJyb3I6IDAwMDAgWyMxXSBTTVAgS0FTQU4gUFRJCj4gWyAg
IDg5LjU3Mjg5N10gQ1BVOiAzIFBJRDogMTYwODMgQ29tbTogcmVwcm8gTm90IHRhaW50ZWQgNS45
LjAtcmM3LjIwMjAwOTMwLnJjMS5hbGxhcmNoLTE5LWczZTMyZDBkLnN5emsgIzUKPiBbICAgODku
NTcyOTAyXSBIYXJkd2FyZSBuYW1lOiBRRU1VIFN0YW5kYXJkIFBDIChpNDQwRlggKyBQSUlYLCAx
OTk2KSwgQklPUyAwLjUuMSAwMS8wMS8yMDExCj4gWyAgIDg5LjU3MjkzNF0gUklQOiAwMDEwOmNp
cnJ1c2ZiX2NoZWNrX3ZhcisweDg0LzB4MTI2MAoKQlRXLCBpZiB5b3UgcnVuIHFlbXUgd2l0aCBj
aXJydXMsIHRoZXJlJ3MgYWxzbyBhIERSTSBkcml2ZXIgbmFtZWQKY2lycnVzLmtvLiBNaWdodCBi
ZSBhIGJldHRlciBjaG9pY2UgdGhhbiB0aGUgb2xkIGZiZGV2IGRyaXZlci4gSWYgeW91Cmp1c3Qg
Y2FyZSBhYm91dCBxZW11LCBidXQgbm90IHRoZSBhY3R1YWwgZ3JhcGhpY3MgZGV2aWNlLCB0YWtl
IGEgbG9vayBhdAoKICBodHRwczovL3d3dy5rcmF4ZWwub3JnL2Jsb2cvMjAxNC8xMC9xZW11LXVz
aW5nLWNpcnJ1cy1jb25zaWRlcmVkLWhhcm1mdWwvCgpBbnl3YXksIHRoYW5rcyBmb3IgeW91ciBw
YXRjaC4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKCj4gCj4gVGhlIGVycm9yIGhhcHBlbnMgd2hlbiB0
aGUgcGl4ZWxzIHZhbHVlIGlzIGNhbGN1bGF0ZWQgYmVmb3JlIHBlcmZvcm1pbmcgdGhlIHNhbml0
eSBjaGVja3Mgb24gYml0c19wZXJfcGl4ZWwuCj4gQSBiaXRzX3Blcl9waXhlbCBzZXQgdG8gemVy
byBjYXVzZXMgZGl2aWRlIGJ5IHplcm8gZXJyb3IuCj4gCj4gVGhpcyBwYXRjaCBtb3ZlcyB0aGUg
Y2FsY3VsYXRpb24gYWZ0ZXIgdGhlIHNhbml0eSBjaGVjay4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
YWVlZCBNaXJ6YW1vaGFtbWFkaSA8c2FlZWQubWlyemFtb2hhbW1hZGlAb3JhY2xlLmNvbT4KPiBU
ZXN0ZWQtYnk6IFNhZWVkIE1pcnphbW9oYW1tYWRpIDxzYWVlZC5taXJ6YW1vaGFtbWFkaUBvcmFj
bGUuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2NpcnJ1c2ZiLmMgfCAzICsrLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY2lycnVzZmIuYyBiL2RyaXZlcnMvdmlkZW8v
ZmJkZXYvY2lycnVzZmIuYwo+IGluZGV4IDE1YTllZTdjZDczNC4uYTc3NDkxMDFiMDk0IDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvdmlkZW8vZmJkZXYvY2lycnVzZmIuYwo+ICsrKyBiL2RyaXZlcnMv
dmlkZW8vZmJkZXYvY2lycnVzZmIuYwo+IEBAIC01MzEsNyArNTMxLDcgQEAgc3RhdGljIGludCBj
aXJydXNmYl9jaGVja192YXIoc3RydWN0IGZiX3Zhcl9zY3JlZW5pbmZvICp2YXIsCj4gIHsKPiAg
CWludCB5cmVzOwo+ICAJLyogbWVtb3J5IHNpemUgaW4gcGl4ZWxzICovCj4gLQl1bnNpZ25lZCBw
aXhlbHMgPSBpbmZvLT5zY3JlZW5fc2l6ZSAqIDggLyB2YXItPmJpdHNfcGVyX3BpeGVsOwo+ICsJ
dW5zaWduZWQgaW50IHBpeGVsczsKPiAgCXN0cnVjdCBjaXJydXNmYl9pbmZvICpjaW5mbyA9IGlu
Zm8tPnBhcjsKPiAgCj4gIAlzd2l0Y2ggKHZhci0+Yml0c19wZXJfcGl4ZWwpIHsKPiBAQCAtNTcz
LDYgKzU3Myw3IEBAIHN0YXRpYyBpbnQgY2lycnVzZmJfY2hlY2tfdmFyKHN0cnVjdCBmYl92YXJf
c2NyZWVuaW5mbyAqdmFyLAo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAJfQo+ICAKPiArCXBpeGVs
cyA9IGluZm8tPnNjcmVlbl9zaXplICogOCAvIHZhci0+Yml0c19wZXJfcGl4ZWw7Cj4gIAlpZiAo
dmFyLT54cmVzX3ZpcnR1YWwgPCB2YXItPnhyZXMpCj4gIAkJdmFyLT54cmVzX3ZpcnR1YWwgPSB2
YXItPnhyZXM7Cj4gIAkvKiB1c2UgaGlnaGVzdCBwb3NzaWJsZSB2aXJ0dWFsIHJlc29sdXRpb24g
Ki8KPiAKCi0tIApUaG9tYXMgWmltbWVybWFubgpHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyClNV
U0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSApNYXhmZWxkc3RyLiA1LCA5MDQwOSBO
w7xybmJlcmcsIEdlcm1hbnkKKEhSQiAzNjgwOSwgQUcgTsO8cm5iZXJnKQpHZXNjaMOkZnRzZsO8
aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
