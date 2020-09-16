Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 384E826CC6C
	for <lists+dri-devel@lfdr.de>; Wed, 16 Sep 2020 22:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D5296EB2C;
	Wed, 16 Sep 2020 20:44:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 205136EB2E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Sep 2020 20:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sIMG4wWgY9okM8dfYXX6a9fUcsqWrWVJbPz4x4HHJm8=; b=v06gt/0ITtgVyOORAA8OCjcobZ
 U6DZ/nHwBSr3nK6SB1EFgrdnKbYQermRBF1XgsK11dR9Rmf51lF+9VWYH7mW7a//Ms1sHIh9s3RRW
 cmnwCvO4kBUzUQ6/eBBgG4PgnTliG7PHmi0Nymqmz0e3quHU5acqrxXKURh/HVoxhp/hmscmueGtQ
 7ETry/C2W2cfFTT93fu2cnY5YxCcJSCPpRB/Xn1yiz+S9SjZGzUr10JkxEmBIU6WmaIq5CmWclWtz
 oNtzY/569M809ClABtxn1l/pe2qoCp9lWzHFAFKZtA5z8nJL9wO2Rm2mg7m9ozMB26GXALBsEt3bt
 kNsZ7oPw==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1kIeHX-00047O-FZ; Wed, 16 Sep 2020 23:43:59 +0300
Subject: Re: [RFC PATCH v2 13/17] gpu: host1x: Reset max value when freeing a
 syncpoint
To: Dmitry Osipenko <digetx@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
 jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
References: <20200905103420.3021852-1-mperttunen@nvidia.com>
 <20200905103420.3021852-14-mperttunen@nvidia.com>
 <b4b3ae98-4ccb-152a-deda-2da81d1c46ef@gmail.com>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <0d12991e-3599-c5bf-11e5-78031f0f8088@kapsi.fi>
Date: Wed, 16 Sep 2020 23:43:45 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <b4b3ae98-4ccb-152a-deda-2da81d1c46ef@gmail.com>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: linux-tegra@vger.kernel.org, talho@nvidia.com, bhuntsman@nvidia.com,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xNi8yMCAxMDo0NCBQTSwgRG1pdHJ5IE9zaXBlbmtvIHdyb3RlOgo+IDA1LjA5LjIwMjAg
MTM6MzQsIE1pa2tvIFBlcnR0dW5lbiDQv9C40YjQtdGCOgo+PiBXaXRoIGpvYiByZWNvdmVyeSBi
ZWNvbWluZyBvcHRpb25hbCwgc3luY3BvaW50cyBtYXkgaGF2ZSBhIG1pc21hdGNoCj4+IGJldHdl
ZW4gdGhlaXIgdmFsdWUgYW5kIG1heCB2YWx1ZSB3aGVuIGZyZWVkLiBBcyBzdWNoLCB3aGVuIGZy
ZWVpbmcsCj4+IHNldCB0aGUgbWF4IHZhbHVlIHRvIHRoZSBjdXJyZW50IHZhbHVlIG9mIHRoZSBz
eW5jcG9pbnQgc28gdGhhdCBpdAo+PiBpcyBpbiBhIHNhbmUgc3RhdGUgZm9yIHRoZSBuZXh0IHVz
ZXIuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1pa2tvIFBlcnR0dW5lbiA8bXBlcnR0dW5lbkBudmlk
aWEuY29tPgo+PiAtLS0KPj4gICBkcml2ZXJzL2dwdS9ob3N0MXgvc3luY3B0LmMgfCAxICsKPj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2hvc3QxeC9zeW5jcHQuYyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9zeW5jcHQuYwo+PiBp
bmRleCAyZmFkOGIyYTU1Y2MuLjgyZWNiNGFjMzg3ZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9n
cHUvaG9zdDF4L3N5bmNwdC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2hvc3QxeC9zeW5jcHQuYwo+
PiBAQCAtMzg1LDYgKzM4NSw3IEBAIHN0YXRpYyB2b2lkIHN5bmNwdF9yZWxlYXNlKHN0cnVjdCBr
cmVmICpyZWYpCj4+ICAgewo+PiAgIAlzdHJ1Y3QgaG9zdDF4X3N5bmNwdCAqc3AgPSBjb250YWlu
ZXJfb2YocmVmLCBzdHJ1Y3QgaG9zdDF4X3N5bmNwdCwgcmVmKTsKPj4gICAKPj4gKwlhdG9taWNf
c2V0KCZzcC0+bWF4X3ZhbCwgaG9zdDF4X3N5bmNwdF9yZWFkX21pbihzcCkpOwo+PiAgIAlzcC0+
bG9ja2VkID0gZmFsc2U7Cj4+ICAgCj4+ICAgCW11dGV4X2xvY2soJnNwLT5ob3N0LT5zeW5jcHRf
bXV0ZXgpOwo+Pgo+IAo+IFBsZWFzZSBub3RlIHRoYXQgdGhlIHN5bmMgcG9pbnQgc3RhdGUgYWN0
dWFsbHkgbmVlZHMgdG8gYmUgY29tcGxldGVseQo+IHJlc2V0IGF0IHRoZSBzeW5jIHBvaW50IHJl
cXVlc3QtdGltZSBiZWNhdXNlIGJvdGggZG93bnN0cmVhbSBmYXN0Ym9vdAo+IGFuZCB1cHN0cmVh
bSB1LWJvb3QgWzFdIGFyZSBuZWVkbGVzc2x5IGVuYWJsaW5nIGRpc3BsYXkgVkJMQU5LIGludGVy
cnVwdAo+IHRoYXQgY29udGludW91c2x5IGluY3JlbWVudHMgc3luYyBwb2ludCAjMjYgZHVyaW5n
IG9mIGtlcm5lbCBib290IHVudGlsCj4gZGlzcGxheSBjb250cm9sbGVyIGlzIHJlc2V0Lgo+IAo+
IFsxXSBodHRwczovL2dpdGh1Yi5jb20vdS1ib290L3UtYm9vdC9ibG9iL21hc3Rlci9kcml2ZXJz
L3ZpZGVvL3RlZ3JhLmMjTDE1NQo+IAo+IEhlbmNlIG9uY2Ugc3luYyBwb2ludCAjMjYgaXMgcmVx
dWVzdGVkLCBpdCB3aWxsIGhhdmUgYSBkaXJ0eSBzdGF0ZS4gU28KPiBmYXIgdGhpcyBkb2Vzbid0
IGhhdmUgYW55IHZpc2libGUgZWZmZWN0IGJlY2F1c2Ugc3luYyBwb2ludHMgYXJlbid0IHVzZWQK
PiBtdWNoLgo+IAoKTWF5YmUgd2UgY2FuIGluc3RlYWQgcmVzZXJ2ZSBzeW5jcG9pbnRzIHRoYXQg
bWlnaHQgYmUgdXNlZCBieSB0aGUgYm9vdCAKY2hhaW4sIGFuZCBvbmx5IGFsbG93IGFsbG9jYXRp
bmcgdGhlbSBvbmNlIHRoZSBkaXNwbGF5IGRyaXZlciBoYXMgYWNrZWQgCnRoYXQgdGhlIHN5bmNw
b2ludCB3aWxsIG5vIGxvbmdlciBiZSBpbmNyZW1lbnRlZD8gVGhhdCB3YXkgaWYgdGhlIApkaXNw
bGF5IGRyaXZlciBpcyBkaXNhYmxlZCBmb3Igc29tZSByZWFzb24gd2UnbGwgc3RpbGwgYmUgZmlu
ZS4KCkxvb2tpbmcgYXQgdGhlIGRvd25zdHJlYW0gZHJpdmVyLCBpdCAoc3RpbGwsIG9uIG5ldyBj
aGlwcy4uKSByZXNlcnZlcyAKdGhlIGZvbGxvd2luZyBzeW5jcG9pbnRzOgoKLSAxMCAoQVZQKQot
IDIyICgzRCkKLSAyNiAoVkJMQU5LMCkKLSAyNyAoVkJMQU5LMSkKCmFuZCBzYXlzIHRoYXQgdGhp
cyBhcHBsaWVzIHRvIFQyMCwgVDMwLCBUMTE0IGFuZCBUMTQ4LgoKSSBzdXBwb3NlIGlmIHlvdSBo
YXZlbid0IG9ic2VydmVkIHRoaXMgaGFwcGVuaW5nIHRvIG90aGVyIHN5bmNwb2ludHMgCnRoYW4g
MjYsIHRoZW4gcmVzZXJ2aW5nIDI2IHdvdWxkIHByb2JhYmx5IGJlIGVub3VnaC4KCk1pa2tvCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
