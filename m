Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7173BEFC04
	for <lists+dri-devel@lfdr.de>; Tue,  5 Nov 2019 12:05:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAF2D6E9D4;
	Tue,  5 Nov 2019 11:05:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5B76E9D4
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Nov 2019 11:05:54 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-23-xwkqhO3mNJmw-_ZorLvDgA-1; Tue, 05 Nov 2019 06:05:50 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 990D61800D4A;
 Tue,  5 Nov 2019 11:05:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-69.ams2.redhat.com
 [10.36.116.69])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48F0C5D9C9;
 Tue,  5 Nov 2019 11:05:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 7163D16E08; Tue,  5 Nov 2019 12:05:46 +0100 (CET)
Date: Tue, 5 Nov 2019 12:05:46 +0100
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/3] drm/udl: Allocate GEM object via struct
 drm_driver.gem_create_object
Message-ID: <20191105110546.qrhqnd362jslsn7g@sirius.home.kraxel.org>
References: <20191028084549.30243-1-tzimmermann@suse.de>
 <20191028084549.30243-3-tzimmermann@suse.de>
MIME-Version: 1.0
In-Reply-To: <20191028084549.30243-3-tzimmermann@suse.de>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: xwkqhO3mNJmw-_ZorLvDgA-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572951953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8gFgDSn7Grtdp4Nxz8F4P3MEUxG7CIa80r6Knw0VwOk=;
 b=Uz27V3wFgB8OwZJ4jNJepnWfcEnmJsdq5vELpd9KnEhKg0NV1jxUDemNnRR0hCsJ4BZ2CZ
 CffqJLt4SUeddOdRHhNwM8y6JFnNH5jV/SaBqjddAuWA1/UJDKmtbBuxklwTTp+EZaMn5g
 H+JMTP3OK7ykq13+1ORKH2+nP+gu2wc=
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
Cc: sean@poorly.run, dri-devel@lists.freedesktop.org, airlied@redhat.com,
 sam@ravnborg.org, emil.velikov@collabora.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjgsIDIwMTkgYXQgMDk6NDU6NDhBTSArMDEwMCwgVGhvbWFzIFppbW1lcm1h
bm4gd3JvdGU6Cj4gSW4gcHJlcGFyYXRpb24gb2YgYSBzd2l0Y2ggdG8gU0hNRU0sIHVkbCBub3cg
YWxsb2NhdGVzIGl0cyBHRU0KPiBvYmplY3RzIHZpYSBzdHJ1Y3QgZHJtX2RyaXZlci5nZW1fY3Jl
YXRlX29iamVjdC4gTm8gZnVuY3Rpb25hbAo+IGNoYW5nZXMgYXJlIG1hZGUuCj4gCj4gRm9yIFNI
TUVNIEdFTSBvYmplY3RzLCB1ZGwgd2lsbCByZXF1aXJlIHRoZSB1c2Ugb2YgYSBzcGVjaWFsIG1t
YXAKPiBmdW5jdGlvbiwgd2hpY2ggd2Ugc2V0IHRob3VnaCB0aGUgY3JlYXRlLW9iamVjdCBmdW5j
dGlvbi4KCkFja2VkLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNvbT4KCj4gCj4g
U2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+Cj4g
LS0tCj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5jIHwgIDEgKwo+ICBkcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9kcnYuaCB8ICAyICsrCj4gIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dl
bS5jIHwgMjUgKysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmMKPiBp
bmRleCA4NDI2NjY5NDMzZTQuLjc3OGEwYjY1MmY2NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vdWRsL3VkbF9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2Rydi5j
Cj4gQEAgLTY0LDYgKzY0LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIGRyaXZlciA9IHsK
PiAgCj4gIAkvKiBnZW0gaG9va3MgKi8KPiAgCS5nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQgPSB1
ZGxfZ2VtX2ZyZWVfb2JqZWN0LAo+ICsJLmdlbV9jcmVhdGVfb2JqZWN0ID0gdWRsX2RyaXZlcl9n
ZW1fY3JlYXRlX29iamVjdCwKPiAgCS5nZW1fdm1fb3BzID0gJnVkbF9nZW1fdm1fb3BzLAo+ICAK
PiAgCS5kdW1iX2NyZWF0ZSA9IHVkbF9kdW1iX2NyZWF0ZSwKPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3VkbC91ZGxfZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9kcnYuaAo+
IGluZGV4IGUxMzA2YTUxOTAzYy4uZmMzMTJlNzkxZDE4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS91ZGwvdWRsX2Rydi5oCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZHJ2
LmgKPiBAQCAtMTI1LDYgKzEyNSw4IEBAIGludCB1ZGxfZHVtYl9jcmVhdGUoc3RydWN0IGRybV9m
aWxlICpmaWxlX3ByaXYsCj4gIGludCB1ZGxfZ2VtX21tYXAoc3RydWN0IGRybV9maWxlICpmaWxl
X3ByaXYsIHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gIAkJIHVpbnQzMl90IGhhbmRsZSwgdWlu
dDY0X3QgKm9mZnNldCk7Cj4gIAo+ICtzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnVkbF9kcml2ZXJf
Z2VtX2NyZWF0ZV9vYmplY3Qoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiArCQkJCQkJICAgIHNp
emVfdCBzaXplKTsKPiAgdm9pZCB1ZGxfZ2VtX2ZyZWVfb2JqZWN0KHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqZ2VtX29iaik7Cj4gIHN0cnVjdCB1ZGxfZ2VtX29iamVjdCAqdWRsX2dlbV9hbGxvY19v
YmplY3Qoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiAgCQkJCQkgICAgc2l6ZV90IHNpemUpOwo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdWRsL3VkbF9nZW0uYyBiL2RyaXZlcnMvZ3B1
L2RybS91ZGwvdWRsX2dlbS5jCj4gaW5kZXggN2QzYzFiNzNlYTAyLi42Mjg3NDljYzExNDMgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMKPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vdWRsL3VkbF9nZW0uYwo+IEBAIC02LDI2ICs2LDQzIEBACj4gICNpbmNsdWRlIDxs
aW51eC9kbWEtYnVmLmg+Cj4gICNpbmNsdWRlIDxsaW51eC92bWFsbG9jLmg+Cj4gIAo+ICsjaW5j
bHVkZSA8ZHJtL2RybV9kcnYuaD4KPiAgI2luY2x1ZGUgPGRybS9kcm1fbW9kZS5oPgo+ICAjaW5j
bHVkZSA8ZHJtL2RybV9wcmltZS5oPgo+ICAKPiAgI2luY2x1ZGUgInVkbF9kcnYuaCIKPiAgCj4g
LXN0cnVjdCB1ZGxfZ2VtX29iamVjdCAqdWRsX2dlbV9hbGxvY19vYmplY3Qoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKPiAtCQkJCQkgICAgc2l6ZV90IHNpemUpCj4gKy8qCj4gKyAqIEhlbHBlcnMg
Zm9yIHN0cnVjdCBkcm1fZHJpdmVyCj4gKyAqLwo+ICsKPiArc3RydWN0IGRybV9nZW1fb2JqZWN0
ICp1ZGxfZHJpdmVyX2dlbV9jcmVhdGVfb2JqZWN0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4g
KwkJCQkJCSAgICBzaXplX3Qgc2l6ZSkKPiAgewo+ICAJc3RydWN0IHVkbF9nZW1fb2JqZWN0ICpv
Ymo7Cj4gIAo+ICAJb2JqID0ga3phbGxvYyhzaXplb2YoKm9iaiksIEdGUF9LRVJORUwpOwo+ICsJ
aWYgKCFvYmopCj4gKwkJcmV0dXJuIE5VTEw7Cj4gKwo+ICsJcmV0dXJuICZvYmotPmJhc2U7Cj4g
K30KPiArCj4gK3N0cnVjdCB1ZGxfZ2VtX29iamVjdCAqdWRsX2dlbV9hbGxvY19vYmplY3Qoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKPiArCQkJCQkgICAgc2l6ZV90IHNpemUpCj4gK3sKPiArCXN0
cnVjdCBkcm1fZ2VtX29iamVjdCAqb2JqOwo+ICsKPiArCW9iaiA9IGRldi0+ZHJpdmVyLT5nZW1f
Y3JlYXRlX29iamVjdChkZXYsIHNpemUpOwo+ICAJaWYgKG9iaiA9PSBOVUxMKQo+ICAJCXJldHVy
biBOVUxMOwo+ICAKPiAtCWlmIChkcm1fZ2VtX29iamVjdF9pbml0KGRldiwgJm9iai0+YmFzZSwg
c2l6ZSkgIT0gMCkgewo+ICsJaWYgKGRybV9nZW1fb2JqZWN0X2luaXQoZGV2LCBvYmosIHNpemUp
ICE9IDApIHsKPiAgCQlrZnJlZShvYmopOwo+ICAJCXJldHVybiBOVUxMOwo+ICAJfQo+ICAKPiAt
CXJldHVybiBvYmo7Cj4gKwlyZXR1cm4gdG9fdWRsX2JvKG9iaik7Cj4gIH0KPiAgCj4gIHN0YXRp
YyBpbnQKPiAtLSAKPiAyLjIzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
