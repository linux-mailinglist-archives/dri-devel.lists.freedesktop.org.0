Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 291BB295930
	for <lists+dri-devel@lfdr.de>; Thu, 22 Oct 2020 09:28:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 439546F526;
	Thu, 22 Oct 2020 07:28:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E6A86F526
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Oct 2020 07:28:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4EEC6ABB2;
 Thu, 22 Oct 2020 07:28:37 +0000 (UTC)
Subject: Re: [PATCH 1/1] video: fbdev: fix divide error in fbcon_switch
To: saeed.mirzamohammadi@oracle.com, linux-kernel@vger.kernel.org
References: <20201021235758.59993-1-saeed.mirzamohammadi@oracle.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <59d0aaeb-f3d0-b386-a3a1-4f5f71fb68aa@suse.de>
Date: Thu, 22 Oct 2020 09:28:36 +0200
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
cnJ1c2ZiX2NoZWNrX3ZhcisweDg0LzB4MTI2MAo+IAo+IFRoZSBlcnJvciBoYXBwZW5zIHdoZW4g
dGhlIHBpeGVscyB2YWx1ZSBpcyBjYWxjdWxhdGVkIGJlZm9yZSBwZXJmb3JtaW5nIHRoZSBzYW5p
dHkgY2hlY2tzIG9uIGJpdHNfcGVyX3BpeGVsLgo+IEEgYml0c19wZXJfcGl4ZWwgc2V0IHRvIHpl
cm8gY2F1c2VzIGRpdmlkZSBieSB6ZXJvIGVycm9yLgo+IAo+IFRoaXMgcGF0Y2ggbW92ZXMgdGhl
IGNhbGN1bGF0aW9uIGFmdGVyIHRoZSBzYW5pdHkgY2hlY2suCj4gCj4gU2lnbmVkLW9mZi1ieTog
U2FlZWQgTWlyemFtb2hhbW1hZGkgPHNhZWVkLm1pcnphbW9oYW1tYWRpQG9yYWNsZS5jb20+Cj4g
VGVzdGVkLWJ5OiBTYWVlZCBNaXJ6YW1vaGFtbWFkaSA8c2FlZWQubWlyemFtb2hhbW1hZGlAb3Jh
Y2xlLmNvbT4KCkxvb2tzIGdvb2QsIHRoYW5rcyBhIGxvdC4gSSdsbCBhZGQgdGhlIHBhdGNoIHRv
IGRybS1taXNjLW5leHQKClJldmlld2VkLWJ5OiBUaG9tYXMgWmltZW1ybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4KCkJlc3QgcmVnYXJkcwpUaG9tYXMKCj4gLS0tCj4gIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvY2lycnVzZmIuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9j
aXJydXNmYi5jIGIvZHJpdmVycy92aWRlby9mYmRldi9jaXJydXNmYi5jCj4gaW5kZXggMTVhOWVl
N2NkNzM0Li5hNzc0OTEwMWIwOTQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9j
aXJydXNmYi5jCj4gKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9jaXJydXNmYi5jCj4gQEAgLTUz
MSw3ICs1MzEsNyBAQCBzdGF0aWMgaW50IGNpcnJ1c2ZiX2NoZWNrX3ZhcihzdHJ1Y3QgZmJfdmFy
X3NjcmVlbmluZm8gKnZhciwKPiAgewo+ICAJaW50IHlyZXM7Cj4gIAkvKiBtZW1vcnkgc2l6ZSBp
biBwaXhlbHMgKi8KPiAtCXVuc2lnbmVkIHBpeGVscyA9IGluZm8tPnNjcmVlbl9zaXplICogOCAv
IHZhci0+Yml0c19wZXJfcGl4ZWw7Cj4gKwl1bnNpZ25lZCBpbnQgcGl4ZWxzOwo+ICAJc3RydWN0
IGNpcnJ1c2ZiX2luZm8gKmNpbmZvID0gaW5mby0+cGFyOwo+ICAKPiAgCXN3aXRjaCAodmFyLT5i
aXRzX3Blcl9waXhlbCkgewo+IEBAIC01NzMsNiArNTczLDcgQEAgc3RhdGljIGludCBjaXJydXNm
Yl9jaGVja192YXIoc3RydWN0IGZiX3Zhcl9zY3JlZW5pbmZvICp2YXIsCj4gIAkJcmV0dXJuIC1F
SU5WQUw7Cj4gIAl9Cj4gIAo+ICsJcGl4ZWxzID0gaW5mby0+c2NyZWVuX3NpemUgKiA4IC8gdmFy
LT5iaXRzX3Blcl9waXhlbDsKPiAgCWlmICh2YXItPnhyZXNfdmlydHVhbCA8IHZhci0+eHJlcykK
PiAgCQl2YXItPnhyZXNfdmlydHVhbCA9IHZhci0+eHJlczsKPiAgCS8qIHVzZSBoaWdoZXN0IHBv
c3NpYmxlIHZpcnR1YWwgcmVzb2x1dGlvbiAqLwo+IAoKLS0gClRob21hcyBaaW1tZXJtYW5uCkdy
YXBoaWNzIERyaXZlciBEZXZlbG9wZXIKU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBH
bWJICk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVyZywgR2VybWFueQooSFJCIDM2ODA5LCBB
RyBOw7xybmJlcmcpCkdlc2Now6RmdHNmw7xocmVyOiBGZWxpeCBJbWVuZMO2cmZmZXIKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
