Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C615FA0049
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2019 12:55:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89AC188FFB;
	Wed, 28 Aug 2019 10:55:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 05EDB88FFB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2019 10:55:02 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEC4A337;
 Wed, 28 Aug 2019 03:55:01 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFCCD3F59C;
 Wed, 28 Aug 2019 03:55:00 -0700 (PDT)
Subject: Re: [PATCH v3 5/8] drm/panfrost: Split mmu_hw_do_operation into
 locked and unlocked version
To: Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org
References: <20190826223317.28509-1-robh@kernel.org>
 <20190826223317.28509-6-robh@kernel.org>
From: Steven Price <steven.price@arm.com>
Message-ID: <7c47b538-aacc-c0bc-76b0-f0d3ff2712b2@arm.com>
Date: Wed, 28 Aug 2019 11:54:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190826223317.28509-6-robh@kernel.org>
Content-Language: en-GB
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
Cc: David Airlie <airlied@linux.ie>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjYvMDgvMjAxOSAyMzozMywgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gSW4gcHJlcGFyYXRpb24g
dG8gY2FsbCBtbXVfaHdfZG9fb3BlcmF0aW9uIHdpdGggdGhlIGFzX2xvY2sgYWxyZWFkeSBoZWxk
LAo+IEFkZCBhIG1tdV9od19kb19vcGVyYXRpb25fbG9ja2VkIGZ1bmN0aW9uLgo+IAo+IEZpeGVz
OiA3MjgyZjc2NDVkMDYgKCJkcm0vcGFuZnJvc3Q6IEltcGxlbWVudCBwZXIgRkQgYWRkcmVzcyBz
cGFjZXMiKQo+IENjOiBUb21ldSBWaXpvc28gPHRvbWV1LnZpem9zb0Bjb2xsYWJvcmEuY29tPgo+
IENjOiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgo+IENjOiBBbHlzc2EgUm9z
ZW56d2VpZyA8YWx5c3NhLnJvc2VuendlaWdAY29sbGFib3JhLmNvbT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KClJldmll
d2VkLWJ5OiBTdGV2ZW4gUHJpY2UgPHN0ZXZlbi5wcmljZUBhcm0uY29tPgoKU3RldmUKCj4gLS0t
Cj4gdjM6Cj4gIC0gbmV3IHBhdGNoCj4gCj4gIGRyaXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5m
cm9zdF9tbXUuYyB8IDI2ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDEzIGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiBpbmRleCAyMjA0ZTYwZjc4MDguLjM0MDdiMDBkMGEz
YSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMK
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZnJvc3QvcGFuZnJvc3RfbW11LmMKPiBAQCAtODAs
MTkgKzgwLDExIEBAIHN0YXRpYyB2b2lkIGxvY2tfcmVnaW9uKHN0cnVjdCBwYW5mcm9zdF9kZXZp
Y2UgKnBmZGV2LCB1MzIgYXNfbnIsCj4gIH0KPiAKPiAKPiAtc3RhdGljIGludCBtbXVfaHdfZG9f
b3BlcmF0aW9uKHN0cnVjdCBwYW5mcm9zdF9kZXZpY2UgKnBmZGV2LAo+IC0JCQkgICAgICAgc3Ry
dWN0IHBhbmZyb3N0X21tdSAqbW11LAo+IC0JCQkgICAgICAgdTY0IGlvdmEsIHNpemVfdCBzaXpl
LCB1MzIgb3ApCj4gK3N0YXRpYyBpbnQgbW11X2h3X2RvX29wZXJhdGlvbl9sb2NrZWQoc3RydWN0
IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsIGludCBhc19uciwKPiArCQkJCSAgICAgIHU2NCBpb3Zh
LCBzaXplX3Qgc2l6ZSwgdTMyIG9wKQo+ICB7Cj4gLQlpbnQgcmV0LCBhc19ucjsKPiAtCj4gLQlz
cGluX2xvY2soJnBmZGV2LT5hc19sb2NrKTsKPiAtCWFzX25yID0gbW11LT5hczsKPiAtCj4gLQlp
ZiAoYXNfbnIgPCAwKSB7Cj4gLQkJc3Bpbl91bmxvY2soJnBmZGV2LT5hc19sb2NrKTsKPiArCWlm
IChhc19uciA8IDApCj4gIAkJcmV0dXJuIDA7Cj4gLQl9Cj4gCj4gIAlpZiAob3AgIT0gQVNfQ09N
TUFORF9VTkxPQ0spCj4gIAkJbG9ja19yZWdpb24ocGZkZXYsIGFzX25yLCBpb3ZhLCBzaXplKTsK
PiBAQCAtMTAxLDEwICs5MywxOCBAQCBzdGF0aWMgaW50IG1tdV9od19kb19vcGVyYXRpb24oc3Ry
dWN0IHBhbmZyb3N0X2RldmljZSAqcGZkZXYsCj4gIAl3cml0ZV9jbWQocGZkZXYsIGFzX25yLCBv
cCk7Cj4gCj4gIAkvKiBXYWl0IGZvciB0aGUgZmx1c2ggdG8gY29tcGxldGUgKi8KPiAtCXJldCA9
IHdhaXRfcmVhZHkocGZkZXYsIGFzX25yKTsKPiArCXJldHVybiB3YWl0X3JlYWR5KHBmZGV2LCBh
c19ucik7Cj4gK30KPiAKPiAtCXNwaW5fdW5sb2NrKCZwZmRldi0+YXNfbG9jayk7Cj4gK3N0YXRp
YyBpbnQgbW11X2h3X2RvX29wZXJhdGlvbihzdHJ1Y3QgcGFuZnJvc3RfZGV2aWNlICpwZmRldiwK
PiArCQkJICAgICAgIHN0cnVjdCBwYW5mcm9zdF9tbXUgKm1tdSwKPiArCQkJICAgICAgIHU2NCBp
b3ZhLCBzaXplX3Qgc2l6ZSwgdTMyIG9wKQo+ICt7Cj4gKwlpbnQgcmV0Owo+IAo+ICsJc3Bpbl9s
b2NrKCZwZmRldi0+YXNfbG9jayk7Cj4gKwlyZXQgPSBtbXVfaHdfZG9fb3BlcmF0aW9uX2xvY2tl
ZChwZmRldiwgbW11LT5hcywgaW92YSwgc2l6ZSwgb3ApOwo+ICsJc3Bpbl91bmxvY2soJnBmZGV2
LT5hc19sb2NrKTsKPiAgCXJldHVybiByZXQ7Cj4gIH0KPiAKPiAtLQo+IDIuMjAuMQo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gZHJpLWRldmVsIG1h
aWxpbmcgbGlzdAo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo+IAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
