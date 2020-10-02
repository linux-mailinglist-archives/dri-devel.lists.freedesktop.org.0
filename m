Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 462A2281E82
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 00:39:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82DE16E03D;
	Fri,  2 Oct 2020 22:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC2406E03D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 22:39:22 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f77ac0c0001>; Fri, 02 Oct 2020 15:39:08 -0700
Received: from [10.2.58.214] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Oct
 2020 22:39:19 +0000
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>
References: <20201002175303.390363-1-daniel.vetter@ffwll.ch>
 <20201002175303.390363-2-daniel.vetter@ffwll.ch>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <cb56763e-4fda-a783-03ae-7f749ec55981@nvidia.com>
Date: Fri, 2 Oct 2020 15:39:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201002175303.390363-2-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601678348; bh=qTcrCkJDzdT8SfyK7qNOOJqSlCcdoBOSPBld3HipaxE=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=CkmG7p3e1gAyMtXXHaHX1wOW1NQeTx5EUso+tbSgFhrSp+8QrJgqKgpGph1U/WlJ9
 qjs7wfNjzCdFazLpm35kI8ryUb4HAhQGO1YhRDZHuawuF1n/XklWptr0Oh+AMQAUjy
 jneLP0a9LWrTfebX3/q5vKRWI7xVqEgLJba7x3/ynwdacCPjlPBn92WcwSu6Cw0YiT
 eKgU9+6RSW0XQZenBoBjewsXMxc+aP2u4J0XqZOj1Y5gz6t/S5sXbW56buv0moU6ab
 JNDEx6uK4fFAQ92xLXRbzenGuHOo4jN8MNmfnLJi/k09pKguinMXh3euJYAOLgkYOa
 zfT3EJXtIkeRQ==
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
Cc: linux-samsung-soc@vger.kernel.org, Jan Kara <jack@suse.cz>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvMi8yMCAxMDo1MyBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPiBGb3IgJHJlYXNvbnMg
SSd2ZSBzdHVtYmxlZCBvdmVyIHRoaXMgY29kZSBhbmQgSSdtIG5vdCBzdXJlIHRoZSBjaGFuZ2UK
PiB0byB0aGUgbmV3IGd1cCBmdW5jdGlvbnMgaW4gNTVhNjUwYzM1ZmVhICgibW0vZ3VwOiBmcmFt
ZV92ZWN0b3I6Cj4gY29udmVydCBnZXRfdXNlcl9wYWdlcygpIC0tPiBwaW5fdXNlcl9wYWdlcygp
Iikgd2FzIGVudGlyZWx5IGNvcnJlY3QuCj4gCj4gVGhpcyBoZXJlIGlzIHVzZWQgZm9yIGxvbmcg
dGVybSBidWZmZXJzIChub3QganVzdCBxdWljayBJL08pIGxpa2UKPiBSRE1BLCBhbmQgSm9obiBu
b3RlcyB0aGlzIGluIGhpcyBwYXRjaC4gQnV0IEkgdGhvdWdodCB0aGUgcnVsZSBmb3IKPiB0aGVz
ZSBpcyB0aGF0IHRoZXkgbmVlZCB0byBhZGQgRk9MTF9MT05HVEVSTSwgd2hpY2ggSm9obidzIHBh
dGNoCj4gZGlkbid0IGRvLgoKWWVwLiBUaGUgZWFybGllciBndXAgLS0+IHB1cCBjb252ZXJzaW9u
IHBhdGNoZXMgd2VyZSBpbnRlbmRlZCB0byBub3QKaGF2ZSBhbnkgbm90aWNlYWJsZSBiZWhhdmlv
ciBjaGFuZ2VzLCBhbmQgRk9MTF9MT05HVEVSTSwgd2l0aCBpdCdzCnNwZWNpYWwgY2FzZXMgYW5k
IHN1Y2gsIGFkZGVkIHNvbWUgcmlzayB0aGF0IEkgd2Fzbid0IHJlYWR5IHRvIHRha2UKb24geWV0
LiBBbHNvLCBGT0xMX0xPTkdURVJNIHJ1bGVzIGFyZSBvbmx5ICpyZWNlbnRseSogZ2V0dGluZyBm
aXJtZWQKdXAuIFNvIHRoZXJlIHdhcyBzb21lIGRvdWJ0IGF0IGxlYXN0IGluIG15IG1pbmQsIGFi
b3V0IHdoaWNoIHNpdGVzCnNob3VsZCBoYXZlIGl0LgoKQnV0IG5vdyB0aGF0IHdlJ3JlIGhlcmUs
IEkgdGhpbmsgaXQncyByZWFsbHkgZ29vZCB0aGF0IHlvdSd2ZSBicm91Z2h0CnRoaXMgdXAuIEl0
J3MgZGVmaW5pdGVseSB0aW1lIHRvIGFkZCBGT0xMX0xPTkdURVJNIHdoZXJldmVyIGl0J3MgbWlz
c2luZy4KCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKCj4gCj4gVGhlcmUgaXMgYWxy
ZWFkeSBhIGRheCBzcGVjaWZpYyBjaGVjayAoYWRkZWQgaW4gYjdmMDU1NGE1NmYyICgibW06Cj4g
ZmFpbCBnZXRfdmFkZHJfZnJhbWVzKCkgZm9yIGZpbGVzeXN0ZW0tZGF4IG1hcHBpbmdzIikpLCBz
byB0aGlzIHNlZW1zCj4gbGlrZSB0aGUgcHJ1ZGVudCB0aGluZyB0byBkby4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiBDYzogQW5k
cmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KPiBDYzogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgo+IENjOiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVk
aGF0LmNvbT4KPiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiBDYzogRGFuIFdpbGxpYW1z
IDxkYW4uai53aWxsaWFtc0BpbnRlbC5jb20+Cj4gQ2M6IGxpbnV4LW1tQGt2YWNrLm9yZwo+IENj
OiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmcKPiBDYzogbGludXgtc2Ftc3Vu
Zy1zb2NAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZwo+
IC0tLQo+IEhpIGFsbCwKPiAKPiBJIHN0dW1ibGVkIG92ZXIgdGhpcyBhbmQgZmlndXJlZCB0eXBp
bmcgdGhpcyBwYXRjaCBjYW4ndCBodXJ0LiBSZWFsbHkKPiBqdXN0IHRvIG1heWJlIGxlYXJuIGEg
ZmV3IHRoaW5ncyBhYm91dCBob3cgZ3VwL3B1cCBpcyBzdXBwb3NlZCB0byBiZQo+IHVzZWQgKHdl
IGhhdmUgYSBiaXQgb2YgdGhhdCBpbiBkcml2ZXJzL2dwdSksIHRoaXMgaGVyZSBpc24ndCByZWFs
bHkKPiByYWxhdGVkIHRvIGFueXRoaW5nIEknbSBkb2luZy4KPiAKPiBJJ20gYWxzbyB3b25kZXJp
bmcgd2hldGhlciB0aGUgZXhwbGljaXQgZGF4IGNoZWNrIHNob3VsZCBiZSByZW1vdmVkLAo+IHNp
bmNlIEZPTExfTE9OR1RFUk0gc2hvdWxkIHRha2UgY2FyZSBvZiB0aGF0IGFscmVhZHkuCj4gLURh
bmllbAo+IC0tLQo+ICAgbW0vZnJhbWVfdmVjdG9yLmMgfCAyICstCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vZnJh
bWVfdmVjdG9yLmMgYi9tbS9mcmFtZV92ZWN0b3IuYwo+IGluZGV4IDVkMzRjOTA0N2U5Yy4uMzUw
N2UwOWNiM2ZmIDEwMDY0NAo+IC0tLSBhL21tL2ZyYW1lX3ZlY3Rvci5jCj4gKysrIGIvbW0vZnJh
bWVfdmVjdG9yLmMKPiBAQCAtMzUsNyArMzUsNyBAQCBpbnQgZ2V0X3ZhZGRyX2ZyYW1lcyh1bnNp
Z25lZCBsb25nIHN0YXJ0LCB1bnNpZ25lZCBpbnQgbnJfZnJhbWVzLAo+ICAgewo+ICAgCXN0cnVj
dCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4gICAJc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWE7Cj4gLQl1bnNpZ25lZCBpbnQgZ3VwX2ZsYWdzID0gRk9MTF9XUklURSB8IEZPTExfRk9S
Q0U7Cj4gKwl1bnNpZ25lZCBpbnQgZ3VwX2ZsYWdzID0gRk9MTF9XUklURSB8IEZPTExfRk9SQ0Ug
fCBGT0xMX0xPTkdURVJNOwo+ICAgCWludCByZXQgPSAwOwo+ICAgCWludCBlcnI7Cj4gICAJaW50
IGxvY2tlZDsKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
