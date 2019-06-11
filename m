Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5053CC5E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jun 2019 15:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB27089160;
	Tue, 11 Jun 2019 13:00:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5269689160;
 Tue, 11 Jun 2019 13:00:25 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52191
 helo=[192.168.10.173])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.84_2) (envelope-from <noralf@tronnes.org>)
 id 1hagNz-000846-8N; Tue, 11 Jun 2019 15:00:23 +0200
Subject: Re: [PATCH v8 0/5] drm/fb-helper: Move modesetting code to drm_client
To: dri-devel@lists.freedesktop.org
References: <20190608152657.36613-1-noralf@tronnes.org>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <c2e8dba4-b922-f98b-3623-2a88c0303899@tronnes.org>
Date: Tue, 11 Jun 2019 15:00:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190608152657.36613-1-noralf@tronnes.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org; s=ds201810; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=wkxMKuaInvJFhkNpa59sWVoFAxWfPMWhm7ElzSWuKlM=; 
 b=qaQAYXR6P+z705wT7dCNla38aLcUEIt6k0/m9rncyDQu5EDpu5IbcVvN+i/QfPliWyfBrWU3azYlgZ086cYtDfndpTwIBHHSGMiTg8Go0zrezmzuqF2jGjBzRzah+Crrlttw3HtVwYzg5FIJE/Vnu1JBQT6gKaDk0HFQiNk1w3FSah1xZx7dXahJ17A74GDO35IEsAM8EfAgirZPipsKoh3eZKAm29Cy9bgRDPwpbcKgq0E88RoLL65DHziLWaPQnPPekn6YbDVliiNcrcMPq8F/XCdcVHOPyE1HR3QJkLjAgBDKq/IYXULQX8bhvz8gFs8QlufRhk0yDJnAtRfAnw==;
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
Cc: intel-gfx@lists.freedesktop.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpEZW4gMDguMDYuMjAxOSAxNy4yNiwgc2tyZXYgTm9yYWxmIFRyw7hubmVzOgo+IFRoaXMgbW92
ZXMgdGhlIG1vZGVzZXR0aW5nIGNvZGUgZnJvbSBkcm1fZmJfaGVscGVyIHRvIGRybV9jbGllbnQg
c28gaXQKPiBjYW4gYmUgc2hhcmVkIGJ5IGFsbCBpbnRlcm5hbCBjbGllbnRzLgo+IAo+IExldCdz
IHNlZSB3aGF0IHRoZSBDSSBzYXlzIGFib3V0IHRoZSByZW1haW5pbmcgcGF0Y2hlcy4gSSBoYXZl
IGFkZGVkIHRoZQo+IGJvb3RzcGxhc2ggdG9kbyBlbnRyeSBwYXRjaCBhZGRpbmcgU2FtIGFzIGNv
bnRhY3QuCj4gCj4gTm9yYWxmLgo+IAo+IE5vcmFsZiBUcsO4bm5lcyAoNSk6Cj4gICBkcm0vZmIt
aGVscGVyOiBSZW1vdmUgZHJtX2ZiX2hlbHBlcl9jb25uZWN0b3IKPiAgIGRybS9mYi1oZWxwZXI6
IFByZXBhcmUgdG8gbW92ZSBvdXQgbW9kZXNldCBjb25maWcgY29kZQo+ICAgZHJtL2ZiLWhlbHBl
cjogTW92ZSBvdXQgbW9kZXNldCBjb25maWcgY29kZQo+ICAgZHJtL2NsaWVudDogSGFjazogQWRk
IGJvb3RzcGxhc2ggZXhhbXBsZQo+ICAgZHJtL3RvZG86IEFkZCBib290c3BsYXNoIGVudHJ5Cj4g
CgpUaGUgQ0kgYWdyZWVkIHRoaXMgdGltZSBzbyBhbGwgYXBwbGllZCBleGNlcHQgdGhlIGV4YW1w
bGUuCk5pY2UgdG8gYmUgZG9uZSB3aXRoIHRoaXMuIEl0IHN0YXJ0ZWQgb3V0IGFzIGFuIGlkZWEg
YWJvdXQgbWFraW5nCmdlbmVyaWMgZmJkZXYgZW11bGF0aW9uIDE4IG1vbnRocyBhZ28gYnV0IHR1
cm5lZCBvdXQgdG8gYmUgc29tZXRoaW5nCmV2ZW4gbW9yZSBnZW5lcmljIDotKQoKTm9yYWxmLgoK
PiAgRG9jdW1lbnRhdGlvbi9ncHUvdG9kby5yc3QgICAgICAgICAgIHwgIDE5ICsKPiAgZHJpdmVy
cy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgIHwgICA1ICsKPiAgZHJpdmVycy9ncHUvZHJt
L01ha2VmaWxlICAgICAgICAgICAgIHwgICAxICsKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9ib290
c3BsYXNoLmMgICAgIHwgMzU4ICsrKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xp
ZW50LmMgICAgICAgICB8ICAgNyArCj4gIGRyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVz
ZXQuYyB8IDcwNyArKysrKysrKysrKysrKysrKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV9k
cnYuYyAgICAgICAgICAgIHwgICA0ICsKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9mYl9oZWxwZXIu
YyAgICAgIHwgODg2ICstLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICBpbmNsdWRlL2RybS9k
cm1fY2xpZW50LmggICAgICAgICAgICAgfCAgMjMgKy0KPiAgaW5jbHVkZS9kcm0vZHJtX2ZiX2hl
bHBlci5oICAgICAgICAgIHwgIDg0ICstLQo+ICAxMCBmaWxlcyBjaGFuZ2VkLCAxMTQ5IGluc2Vy
dGlvbnMoKyksIDk0NSBkZWxldGlvbnMoLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9kcm1fYm9vdHNwbGFzaC5jCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
