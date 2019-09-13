Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2FAB1BFF
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:12:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52E3F6EF15;
	Fri, 13 Sep 2019 11:12:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1596EF15
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2019 11:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id CD26C3F8D3;
 Fri, 13 Sep 2019 13:12:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id niRmrq4Fp0ZP; Fri, 13 Sep 2019 13:12:05 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D7E663F7CA;
 Fri, 13 Sep 2019 13:12:00 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D2013360195;
 Fri, 13 Sep 2019 13:11:59 +0200 (CEST)
Subject: Re: [RFC PATCH 1/7] mm: Add write-protect and clean utilities for
 address space ranges
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
References: <20190913093213.27254-1-thomas_os@shipmail.org>
 <20190913093213.27254-2-thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <a70b7de4-32bf-2c78-4d15-21473be6842b@shipmail.org>
Date: Fri, 13 Sep 2019 13:11:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190913093213.27254-2-thomas_os@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568373119; bh=oVO0huRC63nNaAcmPyXTeKnX14VYqMTwWij4ToHPRag=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=ENeynBjXKPO+fu/mcg8v1dkU/vWW8JjcTx8ukBdSUdk5jJC1HPptRwsH49bhKicFO
 1VLaQdDL15HW94NgLRR2PeF6lyMYwdHmKq7fIwgZJFYjlDW/IPztyvoEhVYbjuUJXk
 Gg9PDdUJJr5dI+AMYZy+R/AayqJyLv1/xHWla2Tg=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="ENeynBjX";
 dkim-atps=neutral
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
Cc: =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Will Deacon <will.deacon@arm.com>, Ralph Campbell <rcampbell@nvidia.com>,
 Matthew Wilcox <willy@infradead.org>, Minchan Kim <minchan@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, linux-graphics-maintainer@vmware.com,
 Souptick Joarder <jrdr.linux@gmail.com>, Huang Ying <ying.huang@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMy8xOSAxMTozMiBBTSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4g
RnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29tPgo+Cj4gQWRkIHR3
byB1dGlsaXRpZXMgdG8gYSkgd3JpdGUtcHJvdGVjdCBhbmQgYikgY2xlYW4gYWxsIHB0ZXMgcG9p
bnRpbmcgaW50bwo+IGEgcmFuZ2Ugb2YgYW4gYWRkcmVzcyBzcGFjZS4KPiBUaGUgdXRpbGl0aWVz
IGFyZSBpbnRlbmRlZCB0byBhaWQgaW4gdHJhY2tpbmcgZGlydHkgcGFnZXMgKGVpdGhlcgo+IGRy
aXZlci1hbGxvY2F0ZWQgc3lzdGVtIG1lbW9yeSBvciBwY2kgZGV2aWNlIG1lbW9yeSkuCj4gVGhl
IHdyaXRlLXByb3RlY3QgdXRpbGl0eSBzaG91bGQgYmUgdXNlZCBpbiBjb25qdW5jdGlvbiB3aXRo
Cj4gcGFnZV9ta3dyaXRlKCkgYW5kIHBmbl9ta3dyaXRlKCkgdG8gdHJpZ2dlciB3cml0ZSBwYWdl
LWZhdWx0cyBvbiBwYWdlCj4gYWNjZXNzZXMuIFR5cGljYWxseSBvbmUgd291bGQgd2FudCB0byB1
c2UgdGhpcyBvbiBzcGFyc2UgYWNjZXNzZXMgaW50bwo+IGxhcmdlIG1lbW9yeSByZWdpb25zLiBU
aGUgY2xlYW4gdXRpbGl0eSBzaG91bGQgYmUgdXNlZCB0byB1dGlsaXplCj4gaGFyZHdhcmUgZGly
dHlpbmcgZnVuY3Rpb25hbGl0eSBhbmQgYXZvaWQgdGhlIG92ZXJoZWFkIG9mIHBhZ2UtZmF1bHRz
LAo+IHR5cGljYWxseSBvbiBsYXJnZSBhY2Nlc3NlcyBpbnRvIHNtYWxsIG1lbW9yeSByZWdpb25z
Lgo+Cj4gVGhlIGFkZGVkIGZpbGUgImFzX2RpcnR5X2hlbHBlcnMuYyIgaXMgaW5pdGlhbGx5IGxp
c3RlZCBhcyBtYWludGFpbmVkIGJ5Cj4gVk13YXJlIHVuZGVyIG91ciBEUk0gZHJpdmVyLiBJZiBz
b21lYm9keSB3b3VsZCBsaWtlIGl0IGVsc2V3aGVyZSwKPiB0aGF0J3Mgb2YgY291cnNlIG5vIHBy
b2JsZW0uCj4KPiBDYzogQW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4K
PiBDYzogTWF0dGhldyBXaWxjb3ggPHdpbGx5QGluZnJhZGVhZC5vcmc+Cj4gQ2M6IFdpbGwgRGVh
Y29uIDx3aWxsLmRlYWNvbkBhcm0uY29tPgo+IENjOiBQZXRlciBaaWpsc3RyYSA8cGV0ZXJ6QGlu
ZnJhZGVhZC5vcmc+Cj4gQ2M6IFJpayB2YW4gUmllbCA8cmllbEBzdXJyaWVsLmNvbT4KPiBDYzog
TWluY2hhbiBLaW0gPG1pbmNoYW5Aa2VybmVsLm9yZz4KPiBDYzogTWljaGFsIEhvY2tvIDxtaG9j
a29Ac3VzZS5jb20+Cj4gQ2M6IEh1YW5nIFlpbmcgPHlpbmcuaHVhbmdAaW50ZWwuY29tPgo+IENj
OiBTb3VwdGljayBKb2FyZGVyIDxqcmRyLmxpbnV4QGdtYWlsLmNvbT4KPiBDYzogIkrDqXLDtG1l
IEdsaXNzZSIgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiBDYzogbGludXgtbW1Aa3ZhY2sub3JnCj4g
Q2M6IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKPgo+IFNpZ25lZC1vZmYtYnk6IFRob21h
cyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPiBSZXZpZXdlZC1ieTogUmFscGgg
Q2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPiAjdjEKPiAtLS0KPiAgIE1BSU5UQUlORVJT
ICAgICAgICAgICB8ICAgMSArCj4gICBpbmNsdWRlL2xpbnV4L21tLmggICAgfCAgMTMgKy0KPiAg
IG1tL0tjb25maWcgICAgICAgICAgICB8ICAgMyArCj4gICBtbS9NYWtlZmlsZSAgICAgICAgICAg
fCAgIDEgKwo+ICAgbW0vYXNfZGlydHlfaGVscGVycy5jIHwgMzkyICsrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKwo+ICAgNSBmaWxlcyBjaGFuZ2VkLCA0MDkgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IG1tL2FzX2RpcnR5
X2hlbHBlcnMuYwo+Cj4gZGlmZiAtLWdpdCBhL01BSU5UQUlORVJTIGIvTUFJTlRBSU5FUlMKPiBp
bmRleCBjMmQ5NzVkYTU2MWYuLmI1OTZjN2NmNGE4NSAxMDA2NDQKPiAtLS0gYS9NQUlOVEFJTkVS
Uwo+ICsrKyBiL01BSU5UQUlORVJTCj4gQEAgLTUyODcsNiArNTI4Nyw3IEBAIFQ6CWdpdCBnaXQ6
Ly9wZW9wbGUuZnJlZWRlc2t0b3Aub3JnL350aG9tYXNoL2xpbnV4Cj4gICBTOglTdXBwb3J0ZWQK
PiAgIEY6CWRyaXZlcnMvZ3B1L2RybS92bXdnZngvCj4gICBGOglpbmNsdWRlL3VhcGkvZHJtL3Zt
d2dmeF9kcm0uaAo+ICtGOgltbS9hc19kaXJ0eV9oZWxwZXJzLmMKPiAgIAo+ICAgRFJNIERSSVZF
UlMKPiAgIE06CURhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBkaWZmIC0tZ2l0IGEv
aW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51eC9tbS5oCj4gaW5kZXggMDMzNGNhOTdj
NTg0Li4yN2ZmMzQxZWNiZGMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4gKysr
IGIvaW5jbHVkZS9saW51eC9tbS5oCj4gQEAgLTI2NTcsNyArMjY1Nyw2IEBAIHR5cGVkZWYgaW50
ICgqcHRlX2ZuX3QpKHB0ZV90ICpwdGUsIHVuc2lnbmVkIGxvbmcgYWRkciwgdm9pZCAqZGF0YSk7
Cj4gICBleHRlcm4gaW50IGFwcGx5X3RvX3BhZ2VfcmFuZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0s
IHVuc2lnbmVkIGxvbmcgYWRkcmVzcywKPiAgIAkJCSAgICAgICB1bnNpZ25lZCBsb25nIHNpemUs
IHB0ZV9mbl90IGZuLCB2b2lkICpkYXRhKTsKPiAgIAo+IC0KPiAgICNpZmRlZiBDT05GSUdfUEFH
RV9QT0lTT05JTkcKPiAgIGV4dGVybiBib29sIHBhZ2VfcG9pc29uaW5nX2VuYWJsZWQodm9pZCk7
Cj4gICBleHRlcm4gdm9pZCBrZXJuZWxfcG9pc29uX3BhZ2VzKHN0cnVjdCBwYWdlICpwYWdlLCBp
bnQgbnVtcGFnZXMsIGludCBlbmFibGUpOwo+IEBAIC0yODkxLDUgKzI4OTAsMTcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfbnJfbm9kZV9pZHModm9pZCk7Cj4gICBzdGF0aWMgaW5saW5lIHZvaWQgc2V0
dXBfbnJfbm9kZV9pZHModm9pZCkge30KPiAgICNlbmRpZgo+ICAgCj4gKyNpZmRlZiBDT05GSUdf
QVNfRElSVFlfSEVMUEVSUwo+ICt1bnNpZ25lZCBsb25nIGFwcGx5X2FzX2NsZWFuKHN0cnVjdCBh
ZGRyZXNzX3NwYWNlICptYXBwaW5nLAo+ICsJCQkgICAgIHBnb2ZmX3QgZmlyc3RfaW5kZXgsIHBn
b2ZmX3QgbnIsCj4gKwkJCSAgICAgcGdvZmZfdCBiaXRtYXBfcGdvZmYsCj4gKwkJCSAgICAgdW5z
aWduZWQgbG9uZyAqYml0bWFwLAo+ICsJCQkgICAgIHBnb2ZmX3QgKnN0YXJ0LAo+ICsJCQkgICAg
IHBnb2ZmX3QgKmVuZCk7Cj4gKwo+ICt1bnNpZ25lZCBsb25nIGFwcGx5X2FzX3dycHJvdGVjdChz
dHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiArCQkJCSBwZ29mZl90IGZpcnN0X2luZGV4
LCBwZ29mZl90IG5yKTsKPiArI2VuZGlmCj4gKwo+ICAgI2VuZGlmIC8qIF9fS0VSTkVMX18gKi8K
PiAgICNlbmRpZiAvKiBfTElOVVhfTU1fSCAqLwo+IGRpZmYgLS1naXQgYS9tbS9LY29uZmlnIGIv
bW0vS2NvbmZpZwo+IGluZGV4IDU2Y2VjNjM2YTFmYy4uNTk0MzUwZTlkNzhlIDEwMDY0NAo+IC0t
LSBhL21tL0tjb25maWcKPiArKysgYi9tbS9LY29uZmlnCj4gQEAgLTczNiw0ICs3MzYsNyBAQCBj
b25maWcgQVJDSF9IQVNfUFRFX1NQRUNJQUwKPiAgIGNvbmZpZyBBUkNIX0hBU19IVUdFUEQKPiAg
IAlib29sCj4gICAKPiArY29uZmlnIEFTX0RJUlRZX0hFTFBFUlMKPiArICAgICAgICBib29sCj4g
Kwo+ICAgZW5kbWVudQo+IGRpZmYgLS1naXQgYS9tbS9NYWtlZmlsZSBiL21tL01ha2VmaWxlCj4g
aW5kZXggZDBiMjk1YzNiNzY0Li40MDg2ZjFlZWZiYzYgMTAwNjQ0Cj4gLS0tIGEvbW0vTWFrZWZp
bGUKPiArKysgYi9tbS9NYWtlZmlsZQo+IEBAIC0xMDUsMyArMTA1LDQgQEAgb2JqLSQoQ09ORklH
X1BFUkNQVV9TVEFUUykgKz0gcGVyY3B1LXN0YXRzLm8KPiAgIG9iai0kKENPTkZJR19aT05FX0RF
VklDRSkgKz0gbWVtcmVtYXAubwo+ICAgb2JqLSQoQ09ORklHX0hNTV9NSVJST1IpICs9IGhtbS5v
Cj4gICBvYmotJChDT05GSUdfTUVNRkRfQ1JFQVRFKSArPSBtZW1mZC5vCj4gK29iai0kKENPTkZJ
R19BU19ESVJUWV9IRUxQRVJTKSArPSBhc19kaXJ0eV9oZWxwZXJzLm8KPiBkaWZmIC0tZ2l0IGEv
bW0vYXNfZGlydHlfaGVscGVycy5jIGIvbW0vYXNfZGlydHlfaGVscGVycy5jCj4gbmV3IGZpbGUg
bW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjNiZTA2ZmU4ZjFkMgo+IC0tLSAvZGV2
L251bGwKPiArKysgYi9tbS9hc19kaXJ0eV9oZWxwZXJzLmMKPiBAQCAtMCwwICsxLDM5MiBAQAo+
ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsjaW5jbHVkZSA8bGludXgv
bW0uaD4KPiArI2luY2x1ZGUgPGxpbnV4L21tX3R5cGVzLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9o
dWdldGxiLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9iaXRvcHMuaD4KPiArI2luY2x1ZGUgPGxpbnV4
L21tdV9ub3RpZmllci5oPgo+ICsjaW5jbHVkZSA8YXNtL2NhY2hlZmx1c2guaD4KPiArI2luY2x1
ZGUgPGFzbS90bGJmbHVzaC5oPgo+ICsKPiArLyoqCj4gKyAqIHN0cnVjdCBhc193YWxrIC0gQXJn
dW1lbnQgdG8gYXNfcHRlX2ZuX3QKCkFyZ3VtZW50IHRvIHN0cnVjdCBhc193YWxrX29wcyBjYWxs
YmFja3MKCj4gKyAqIEB2bWE6IFBvaW50ZXIgdG8gdGhlIHN0cnVjdCB2bXdfYXJlYV9zdHJ1Y3Qg
Y3VycmVudGx5IGJlaW5nIHdhbGtlZC4KPiArICoKPiArICogRW1iZWRkYWJsZSBhcmd1bWVudCB0
byBzdHJ1Y3QgYXNfX3B0ZV9mbl90CgpIZXJlIGFzIHdlbGwuCgoKPiArICovCj4gK3N0cnVjdCBh
c193YWxrIHsKPiArCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hOwo+ICt9Owo+ICsKPiArLyoq
Cj4gKyAqIHN0cnVjdCBhc193YWxrX29wcyAtIENhbGxiYWNrcyBmb3IgZW50cmllcyBvZiB2YXJp
b3VzIHBhZ2UgdGFibGUgbGV2ZWxzLgo+ICsgKiBleHRlbmQgZm9yIGFkZGl0aW9uYWwgbGV2ZWwg
c3VwcG9ydC4KPiArICovCj4gK3N0cnVjdCBhc193YWxrX29wcyB7Cj4gKwkvKioKPiArCSAqIHB0
ZS1lbnRyeTogQ2FsbGJhY2sgZm9yIFBURXMKPiArCSAqIEBwdGU6IFBvaW50ZXIgdG8gdGhlIFBU
RS4KPiArCSAqIEBhZGRyOiBWaXJ0dWFsIGFkZHJlc3MuCj4gKwkgKiBAYXN3OiBTdHJ1Y3QgYXNf
d2FsayBhcmd1bWVudCBmb3IgdGhlIHdhbGsuIEVtYmVkIGZvciBhZGRpdGlvbmFsCj4gKwkgKiBk
YXRhLgo+ICsJICovCj4gKwl2b2lkICgqY29uc3QgcHRlX2VudHJ5KSAocHRlX3QgKnB0ZSwgdW5z
aWduZWQgbG9uZyBhZGRyLAo+ICsJCQkJIHN0cnVjdCBhc193YWxrICphc3cpOwo+ICt9OwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
