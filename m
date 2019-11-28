Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9696610C7F0
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 12:31:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFF46E7BD;
	Thu, 28 Nov 2019 11:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18B86E7BD;
 Thu, 28 Nov 2019 11:31:07 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:60676
 helo=[192.168.10.174])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iaI0n-0001oM-Dd; Thu, 28 Nov 2019 12:31:05 +0100
Subject: Re: [PATCH 02/13] drm/fb-helper: don't preserve fb_ops across
 deferred IO use
To: Jani Nikula <jani.nikula@intel.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <cover.1574871797.git.jani.nikula@intel.com>
 <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <f8292d00-5d62-cd3c-9d17-37a3feebd74b@tronnes.org>
Date: Thu, 28 Nov 2019 12:31:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <e2b1685703878612093a37189d37685303fa15e9.1574871797.git.jani.nikula@intel.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n5+3jFgydwIPK2sKKzq2ywdZJPQo2wAUTtaoNCsTRs8=; b=Ws6As29D3y2dShtkdhwXEYaQIu
 V36ctM3+1tJBBILgPG2XOL2tc+k4eUXrKbpZH6iFuRyzFOZ2I/y8kHHj0hAt8svqFtl/uLfkCyQe2
 Uak8BFGd7qwqJTQVFTSnXPincjyqCRyqVD9FlKG0m3pj2C4c06VZgpvy+zgYTB3HHGUT3jYkqh854
 X8HeM9HXi7k3iKbGnHSQeTg3i5k22g3pQvs33TLOTTE06HGvPMYsdg4xXV+AVkKW0y8FLlUm6bplk
 QWwlZ8RCofwiZqtJfb7QzopQrPvcaMhdUcFUPSzCw8lAEnUdOjSKj4w+Wx+6BTGL3q5jGrEAIEKRm
 +4LCNBbg==;
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMjcuMTEuMjAxOSAxNy4zMSwgc2tyZXYgSmFuaSBOaWt1bGE6Cj4gRGVmZXJyZWQgSU8g
bm93IHByZXNlcnZlcyB0aGUgZmJfb3BzLgo+IAo+IENjOiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFs
ZkB0cm9ubmVzLm9yZz4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNp
Z25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Cj4gLS0tCj4g
IGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgfCAxOCArKy0tLS0tLS0tLS0tLS0tLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dw
dS9kcm0vZHJtX2ZiX2hlbHBlci5jCj4gaW5kZXggMGMwODhlYTcwYWQwLi5hNWEyYTUzOGQwODUg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIuYwo+ICsrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMKPiBAQCAtMTk1NCw3ICsxOTU0LDYgQEAgc3Rh
dGljIGludCBkcm1fZmJkZXZfZmJfcmVsZWFzZShzdHJ1Y3QgZmJfaW5mbyAqaW5mbywgaW50IHVz
ZXIpCj4gIHN0YXRpYyB2b2lkIGRybV9mYmRldl9jbGVhbnVwKHN0cnVjdCBkcm1fZmJfaGVscGVy
ICpmYl9oZWxwZXIpCj4gIHsKPiAgCXN0cnVjdCBmYl9pbmZvICpmYmkgPSBmYl9oZWxwZXItPmZi
ZGV2Owo+IC0Jc3RydWN0IGZiX29wcyAqZmJvcHMgPSBOVUxMOwo+ICAJdm9pZCAqc2hhZG93ID0g
TlVMTDsKPiAgCj4gIAlpZiAoIWZiX2hlbHBlci0+ZGV2KQo+IEBAIC0xOTYzLDE1ICsxOTYyLDEx
IEBAIHN0YXRpYyB2b2lkIGRybV9mYmRldl9jbGVhbnVwKHN0cnVjdCBkcm1fZmJfaGVscGVyICpm
Yl9oZWxwZXIpCj4gIAlpZiAoZmJpICYmIGZiaS0+ZmJkZWZpbykgewo+ICAJCWZiX2RlZmVycmVk
X2lvX2NsZWFudXAoZmJpKTsKPiAgCQlzaGFkb3cgPSBmYmktPnNjcmVlbl9idWZmZXI7Cj4gLQkJ
ZmJvcHMgPSBmYmktPmZib3BzOwo+ICAJfQo+ICAKPiAgCWRybV9mYl9oZWxwZXJfZmluaShmYl9o
ZWxwZXIpOwo+ICAKPiAtCWlmIChzaGFkb3cpIHsKPiAtCQl2ZnJlZShzaGFkb3cpOwo+IC0JCWtm
cmVlKGZib3BzKTsKPiAtCX0KPiArCXZmcmVlKHNoYWRvdyk7Cj4gIAo+ICAJZHJtX2NsaWVudF9m
cmFtZWJ1ZmZlcl9kZWxldGUoZmJfaGVscGVyLT5idWZmZXIpOwo+ICB9Cj4gQEAgLTIwNjIsMjMg
KzIwNTcsMTQgQEAgc3RhdGljIGludCBkcm1fZmJfaGVscGVyX2dlbmVyaWNfcHJvYmUoc3RydWN0
IGRybV9mYl9oZWxwZXIgKmZiX2hlbHBlciwKPiAgCWRybV9mYl9oZWxwZXJfZmlsbF9pbmZvKGZi
aSwgZmJfaGVscGVyLCBzaXplcyk7Cj4gIAo+ICAJaWYgKGRybV9mYmRldl91c2Vfc2hhZG93X2Zi
KGZiX2hlbHBlcikpIHsKPiAtCQlzdHJ1Y3QgZmJfb3BzICpmYm9wczsKPiAgCQl2b2lkICpzaGFk
b3c7Cj4gIAo+IC0JCS8qCj4gLQkJICogZmJfZGVmZXJyZWRfaW9fY2xlYW51cCgpIGNsZWFycyAm
ZmJvcHMtPmZiX21tYXAgc28gYSBwZXIKPiAtCQkgKiBpbnN0YW5jZSB2ZXJzaW9uIGlzIG5lY2Vz
c2FyeS4KPiAtCQkgKi8KPiAtCQlmYm9wcyA9IGt6YWxsb2Moc2l6ZW9mKCpmYm9wcyksIEdGUF9L
RVJORUwpOwo+ICAJCXNoYWRvdyA9IHZ6YWxsb2MoZmJpLT5zY3JlZW5fc2l6ZSk7Cj4gLQkJaWYg
KCFmYm9wcyB8fCAhc2hhZG93KSB7Cj4gLQkJCWtmcmVlKGZib3BzKTsKPiArCQlpZiAoIXNoYWRv
dykgewo+ICAJCQl2ZnJlZShzaGFkb3cpOwoKVGhpcyB2ZnJlZSBjYW4gaXMgYSBuby1vcCBub3cg
YW5kIGNhbiBiZSBkcm9wcGVkLiBXaXRoIHRoYXQ6CgpSZXZpZXdlZC1ieTogTm9yYWxmIFRyw7hu
bmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Cgo+ICAJCQlyZXR1cm4gLUVOT01FTTsKPiAgCQl9Cj4g
IAo+IC0JCSpmYm9wcyA9ICpmYmktPmZib3BzOwo+IC0JCWZiaS0+ZmJvcHMgPSBmYm9wczsKPiAg
CQlmYmktPnNjcmVlbl9idWZmZXIgPSBzaGFkb3c7Cj4gIAkJZmJpLT5mYmRlZmlvID0gJmRybV9m
YmRldl9kZWZpbzsKPiAgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
