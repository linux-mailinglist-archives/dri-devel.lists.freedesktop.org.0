Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFD7E87ED
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2019 13:19:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD926E266;
	Tue, 29 Oct 2019 12:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48636E266
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2019 12:19:23 +0000 (UTC)
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:50959
 helo=[192.168.10.177])
 by smtp.domeneshop.no with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1iPQT3-0001EA-F9; Tue, 29 Oct 2019 13:19:21 +0100
Subject: Re: [PATCH] drm/tinydrm: Fix memroy leak in hx8357d_probe
To: Navid Emamdoost <navid.emamdoost@gmail.com>
References: <20191027173234.6449-1-navid.emamdoost@gmail.com>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
Message-ID: <8c297837-9270-0282-b8e7-d931e859adec@tronnes.org>
Date: Tue, 29 Oct 2019 13:19:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191027173234.6449-1-navid.emamdoost@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=tronnes.org
 ; s=ds201810; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=czvZRHgSb18GWkRiGLBe0qR2LanKlORlrSIu5TSo2LM=; b=QeaydcZ8J1y49IEo2JeOU7uLs3
 HK5zeQjFjHAPAe9UECT0lHwszfoOA+qqBKNpp5nHJblYKle+HYSJwE+4LOSJ2qDqb2irb1351oimI
 c02a7UBNfuRIaSdNKjDgTxDe4UPIJXS9b2JgeP8QYf1Cd6YWgoTQZr5W68qjrmxXrOs4jyUXBy6XU
 iwE9jQkiNmJRLQSjeSE5TIekOGxCjZMwnRUegUIjV0bcRY1Hld7711irLipee8YRgZZEADPbl0FyU
 nRrcH+zWsPZm/BBEWfw5dh+vhHIfyBC66Mb1ch57UUackMxYv+25HBWemXTWxSCWg1m52ByQzT2k5
 pYLHMRJw==;
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
Cc: David Airlie <airlied@linux.ie>, kjlu@umn.edu, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, emamd001@umn.edu, smccaman@umn.edu
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgTmF2aWQsCgpEZW4gMjcuMTAuMjAxOSAxOC4zMiwgc2tyZXYgTmF2aWQgRW1hbWRvb3N0Ogo+
IEluIHRoZSBpbXBsZW1lbnRhdGlvbiBvZiBoeDgzNTdkX3Byb2JlKCkgdGhlIGFsbG9jYXRlZCBt
ZW1vcnkgZm9yIGRiaWRldgo+IGlzIGxlYWtlZCB3aGVuIGFuIGVycm9yIGhhcHBlbnMuIFJlbGVh
c2UgZGJpZGV2IGlmIGFueSBvZiB0aGUgIGZvbGxvd2luZwo+IGNhbGxzIGZhaWw6IGRldm1fZ3Bp
b2RfZ2V0KCksIGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoKSwKPiBtaXBpX2RiaV9zcGlfaW5pdCgp
LCBtaXBpX2RiaV9pbml0KCksIGRybV9kZXZfcmVnaXN0ZXIoKS4KPiAKPiBGaXhlczogZjMwMGM4
NmUzM2E2ICgiZHJtOiBBZGQgYW4gaHg4MzY3ZCB0aW55ZHJtIGRyaXZlci4iKQo+IFNpZ25lZC1v
ZmYtYnk6IE5hdmlkIEVtYW1kb29zdCA8bmF2aWQuZW1hbWRvb3N0QGdtYWlsLmNvbT4KPiAtLS0K
PiAgZHJpdmVycy9ncHUvZHJtL3RpbnkvaHg4MzU3ZC5jIHwgMjUgKysrKysrKysrKysrKysrLS0t
LS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2h4ODM1N2QuYyBiL2Ry
aXZlcnMvZ3B1L2RybS90aW55L2h4ODM1N2QuYwo+IGluZGV4IDlhZjhmZjg0OTc0Zi4uZGE1ZWM5
NDRmNDdlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L2h4ODM1N2QuYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L2h4ODM1N2QuYwo+IEBAIC0yMzIsNDQgKzIzMiw0OSBA
QCBzdGF0aWMgaW50IGh4ODM1N2RfcHJvYmUoc3RydWN0IHNwaV9kZXZpY2UgKnNwaSkKPiAgCj4g
IAlkcm0gPSAmZGJpZGV2LT5kcm07Cj4gIAlyZXQgPSBkZXZtX2RybV9kZXZfaW5pdChkZXYsIGRy
bSwgJmh4ODM1N2RfZHJpdmVyKTsKClRoaXMgaXMgYSBkZXZpY2UgbWFuYWdlZCBmdW5jdGlvbiB0
aGF0IHJlbGVhc2VzIGl0cyByZXNvdXJjZShzKSBvbgpkZXZpY2U6ZHJpdmVyIHVuYmluZCBsaWtl
IHRoZSBvdGhlciBkZXZtXyBmdW5jdGlvbnMgKGl0IGNhbid0IGZyZWUKZGJpZGV2IGlmIGl0IGZh
aWxzIGhlbmNlIHRoZSBrZnJlZSBpbiB0aGUgZXJyb3IgcGF0aCBoZXJlKS4KClRoaXMgaXMgdGhl
IHJlbGVhc2UgY2FsbCBwYXRoOgoKZGV2bV9kcm1fZGV2X2luaXRfcmVsZWFzZSAtPiBkcm1fZGV2
X3B1dCAtPiBkcm1fZGV2X3JlbGVhc2UgLT4KZGV2LT5kcml2ZXItPnJlbGVhc2UgOiBtaXBpX2Ri
aV9yZWxlYXNlLgoKTm9yYWxmLgoKPiAtCWlmIChyZXQpIHsKPiAtCQlrZnJlZShkYmlkZXYpOwo+
IC0JCXJldHVybiByZXQ7Cj4gLQl9Cj4gKwlpZiAocmV0KQo+ICsJCWdvdG8gZnJlZV9kYmlkZXY7
Cj4gIAo+ICAJZHJtX21vZGVfY29uZmlnX2luaXQoZHJtKTsKPiAgCj4gIAlkYyA9IGRldm1fZ3Bp
b2RfZ2V0KGRldiwgImRjIiwgR1BJT0RfT1VUX0xPVyk7Cj4gIAlpZiAoSVNfRVJSKGRjKSkgewo+
ICAJCURSTV9ERVZfRVJST1IoZGV2LCAiRmFpbGVkIHRvIGdldCBncGlvICdkYydcbiIpOwo+IC0J
CXJldHVybiBQVFJfRVJSKGRjKTsKPiArCQlyZXQgPSBQVFJfRVJSKGRjKTsKPiArCQlnb3RvIGZy
ZWVfZGJpZGV2Owo+ICAJfQo+ICAKPiAgCWRiaWRldi0+YmFja2xpZ2h0ID0gZGV2bV9vZl9maW5k
X2JhY2tsaWdodChkZXYpOwo+IC0JaWYgKElTX0VSUihkYmlkZXYtPmJhY2tsaWdodCkpCj4gLQkJ
cmV0dXJuIFBUUl9FUlIoZGJpZGV2LT5iYWNrbGlnaHQpOwo+ICsJaWYgKElTX0VSUihkYmlkZXYt
PmJhY2tsaWdodCkpIHsKPiArCQlyZXQgPSBQVFJfRVJSKGRiaWRldi0+YmFja2xpZ2h0KTsKPiAr
CQlnb3RvIGZyZWVfZGJpZGV2Owo+ICsJfQo+ICAKPiAgCWRldmljZV9wcm9wZXJ0eV9yZWFkX3Uz
MihkZXYsICJyb3RhdGlvbiIsICZyb3RhdGlvbik7Cj4gIAo+ICAJcmV0ID0gbWlwaV9kYmlfc3Bp
X2luaXQoc3BpLCAmZGJpZGV2LT5kYmksIGRjKTsKPiAgCWlmIChyZXQpCj4gLQkJcmV0dXJuIHJl
dDsKPiArCQlnb3RvIGZyZWVfZGJpZGV2Owo+ICAKPiAgCXJldCA9IG1pcGlfZGJpX2Rldl9pbml0
KGRiaWRldiwgJmh4ODM1N2RfcGlwZV9mdW5jcywgJnl4MzUwaHYxNV9tb2RlLCByb3RhdGlvbik7
Cj4gIAlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gKwkJZ290byBmcmVlX2RiaWRldjsKPiAg
Cj4gIAlkcm1fbW9kZV9jb25maWdfcmVzZXQoZHJtKTsKPiAgCj4gIAlyZXQgPSBkcm1fZGV2X3Jl
Z2lzdGVyKGRybSwgMCk7Cj4gIAlpZiAocmV0KQo+IC0JCXJldHVybiByZXQ7Cj4gKwkJZ290byBm
cmVlX2RiaWRldjsKPiAgCj4gIAlzcGlfc2V0X2RydmRhdGEoc3BpLCBkcm0pOwo+ICAKPiAgCWRy
bV9mYmRldl9nZW5lcmljX3NldHVwKGRybSwgMCk7Cj4gIAo+ICAJcmV0dXJuIDA7Cj4gKwo+ICtm
cmVlX2RiaWRldjoKPiArCWtmcmVlKGRiaWRldik7Cj4gKwlyZXR1cm4gcmV0Owo+ICB9Cj4gIAo+
ICBzdGF0aWMgaW50IGh4ODM1N2RfcmVtb3ZlKHN0cnVjdCBzcGlfZGV2aWNlICpzcGkpCj4gCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
