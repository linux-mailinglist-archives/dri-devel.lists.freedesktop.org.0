Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02182C2517
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 18:26:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D409D6E48F;
	Mon, 30 Sep 2019 16:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 87DA76E48F
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Sep 2019 16:26:31 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96E931570;
 Mon, 30 Sep 2019 09:26:30 -0700 (PDT)
Received: from [10.1.196.133] (e112269-lin.cambridge.arm.com [10.1.196.133])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3147C3F534;
 Mon, 30 Sep 2019 09:26:29 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/panfrost: Use coherent pagetable walk on Juno
To: Robin Murphy <robin.murphy@arm.com>, robh@kernel.org,
 tomeu.vizoso@collabora.com, sudeep.holla@arm.com
References: <88dc6386929b3dcd7a65ba8063628c62b66b330c.1569856049.git.robin.murphy@arm.com>
 <1e499f85220b735849126171e64ebdd1da0302ce.1569856049.git.robin.murphy@arm.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <167ec566-1936-8a05-83fc-74d20d9fb8bc@arm.com>
Date: Mon, 30 Sep 2019 17:26:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1e499f85220b735849126171e64ebdd1da0302ce.1569856049.git.robin.murphy@arm.com>
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
Cc: devicetree@vger.kernel.org, lorenzo.pieralisi@arm.com, liviu.dudau@arm.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMzAvMDkvMjAxOSAxNjoyNCwgUm9iaW4gTXVycGh5IHdyb3RlOgo+IEFsdGhvdWdoIGdvaW5n
IGZ1bGwgImRtYS1jb2hlcmVudCIgZW5kcyBiYWRseSBkdWUgdG8gR0VNIG9iamVjdHMgc3RpbGwK
PiBiZWluZyBmb3JjaWJseSBtYXBwZWQgbm9uLWNhY2hlYWJsZSwgd2UgY2FuIGF0IGxlYXN0IHRh
a2UgYWR2YW50YWdlIG9mCj4gSnVubydzIEFDRS1saXRlIGludGVncmF0aW9uIHRvIHNraXAgY2Fj
aGUgbWFpbnRlbmFuY2UgZm9yIHBhZ2V0YWJsZXMuCj4gCj4gQ0M6IFJvYiBIZXJyaW5nIDxyb2Jo
QGtlcm5lbC5vcmc+Cj4gQ0M6IFRvbWV1IFZpem9zbyA8dG9tZXUudml6b3NvQGNvbGxhYm9yYS5j
b20+Cj4gU2lnbmVkLW9mZi1ieTogUm9iaW4gTXVycGh5IDxyb2Jpbi5tdXJwaHlAYXJtLmNvbT4K
PiAtLS0KPiAKPiBUaGlzIGlzbid0IHJlYWxseSBtZWFudCBhcyBhIHNlcmllcywgSSdtIGp1c3Qg
c2VuZGluZyBpdCB0b2dldGhlcgo+IHdpdGggcGF0Y2ggIzEgZm9yIGNvbnRleHQuCj4gCj4gIGRy
aXZlcnMvZ3B1L2RybS9wYW5mcm9zdC9wYW5mcm9zdF9tbXUuYyB8IDMgKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZy
b3N0X21tdS5jCj4gaW5kZXggYmRkOTkwNTY4NDc2Li41NjA0MzlmNjMyNzcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3BhbmZyb3N0L3BhbmZyb3N0X21tdS5jCj4gQEAgLTM2NSw2ICszNjUsOSBAQCBp
bnQgcGFuZnJvc3RfbW11X3BndGFibGVfYWxsb2Moc3RydWN0IHBhbmZyb3N0X2ZpbGVfcHJpdiAq
cHJpdikKPiAgCQkuaW9tbXVfZGV2CT0gcGZkZXYtPmRldiwKPiAgCX07Cj4gIAo+ICsJaWYgKG9m
X2RldmljZV9pc19jb21wYXRpYmxlKHBmZGV2LT5kZXYtPm9mX25vZGUsICJhcm0sanVuby1tYWxp
IikpCj4gKwkJcGZkZXYtPm1tdS0+cGd0YmxfY2ZnLmNvaGVyZW50X3dhbGsgPSB0cnVlOwoKU2hv
dWxkIGJlOgoJbW11LT5wZ3RibF9jZmcuY29oZXJlbnRfd2FsayA9IHRydWU7CgpBbHNvIEknbSBu
b3Qgc3VyZSB3aGV0aGVyIHdlIHNob3VsZCBkbyB0aGlzIGJhc2VkIG9uIGEgY29tcGF0aWJsZQpz
dHJpbmcuIGtiYXNlIGhhcyBhICJzeXN0ZW0tY29oZXJlbmN5IiBkZXZpY2UtdHJlZSBmbGFnIGZv
ciBpdC4gSW4KdGhlb3J5IHdlIGNvdWxkIGVuZCB1cCB3aXRoIGEgbG9uZyBsaXN0IG9mIGNvbXBh
dGlibGVzIGhlcmUuLi4KClN0ZXZlCgo+ICsKPiAgCW1tdS0+cGd0Ymxfb3BzID0gYWxsb2NfaW9f
cGd0YWJsZV9vcHMoQVJNX01BTElfTFBBRSwgJm1tdS0+cGd0YmxfY2ZnLAo+ICAJCQkJCSAgICAg
IHByaXYpOwo+ICAJaWYgKCFtbXUtPnBndGJsX29wcykKPiAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
