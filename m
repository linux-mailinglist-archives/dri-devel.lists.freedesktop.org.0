Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A56A7508
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:36:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CCC9890DB;
	Tue,  3 Sep 2019 20:36:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08067890DB
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 20:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 2742D3F4B4;
 Tue,  3 Sep 2019 22:36:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a1UEQTFtaoN1; Tue,  3 Sep 2019 22:36:30 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 1C9363F491;
 Tue,  3 Sep 2019 22:36:25 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 4CD58360160;
 Tue,  3 Sep 2019 22:36:25 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: Dave Hansen <dave.hansen@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
Date: Tue, 3 Sep 2019 22:36:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567542985; bh=30C0D3xa5wm2cg0OGQm+1PBEP9X+l+G7kGUCDwu6i+8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=oGwXq3VOKGwMnq6LfU7OlqajMa3c7ku9er9mvyXT2gc71QJP06oiNV0qu3h+O1Hyc
 yj8hnYKahdp7ZKvPMSpDDvs0PHAo1fnlshtS2lfq8WUW9VlXYRxtKE3JNchBYQRbC7
 Ij4eAvKNLJigD2PMEuGNMWRX9UyvV21LyhOHiBrA=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=oGwXq3VO; 
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, pv-drivers@vmware.com,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8zLzE5IDk6NTUgUE0sIERhdmUgSGFuc2VuIHdyb3RlOgo+IE9uIDkvMy8xOSAxMjo1MSBQ
TSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+IFRoZSB0aGluZyB3ZSBuZWVkIHRvIHN0b3AgaXMg
aGF2aW5nIG1peGVkIGVuY3J5cHRpb24gcnVsZXMgdW5kZXIgb25lIFZNQS4KPj4gVGhlIHBvaW50
IGhlcmUgaXMgdGhhdCB3ZSB3YW50IHRoaXMuIFdlIG5lZWQgdG8gYmUgYWJsZSB0byBtb3ZlIHRo
ZQo+PiBidWZmZXIgYmV0d2VlbiBkZXZpY2UgcHRlcyBhbmQgc3lzdGVtIG1lbW9yeSBwdGVzLCB0
cmFuc3BhcmVudGx5LAo+PiBiZWhpbmQgdXNlcnNwYWNlIGJhY2ssIHdpdGhvdXQgcmFjZXMuIEFu
ZCB0aGUgZmFzdCBwYXRoICh3aGljaCBpcyAibm8KPj4gcHRlIGV4aXN0cyBmb3IgdGhpcyB2bWEi
KSBtdXN0IGJlIHJlYWwgZmFzdCwgc28gdGFraW5nIG1tYXBfc2VtIGFuZAo+PiByZXBsYWNpbmcg
dGhlIHZtYSBpcyBuby1nby4KPiBTbywgd2hlbiB0aGUgdXNlciBhc2tzIGZvciBlbmNyeXB0aW9u
IGFuZCB3ZSBzYXksICJzdXJlLCB3ZSdsbCBlbmNyeXB0Cj4gdGhhdCIsIHRoZW4gd2Ugd2FudCB0
aGUgZGV2aWNlIGRyaXZlciB0byBiZSBhYmxlIHRvIHRyYW5zcGFyZW50bHkgdW5kbwo+IHRoYXQg
ZW5jcnlwdGlvbiB1bmRlciB0aGUgY292ZXJzIGZvciBkZXZpY2UgbWVtb3J5PyAgVGhhdCBzZWVt
cyBzdWJvcHRpbWFsLgo+Cj4gSSdkIHJhdGhlciB0aGUgZGV2aWNlIGRyaXZlciBqdXN0IHNheTog
Ik5vcGUsIHlvdSBjYW4ndCBlbmNyeXB0IG15IFZNQSIuCj4gICBCZWNhdXNlIHRoYXQncyB0aGUg
dHJ1dGguCgpUaGUgdGhpbmcgaGVyZSBpcyB0aGF0IGl0J3MgdGhlIHVuZGVybHlpbmcgcGh5c2lj
YWwgbWVtb3J5IHRoYXQgZGVmaW5lIAp0aGUgY29ycmVjdCBlbmNyeXB0aW9uIGZsYWdzLiBJZiBp
dCdzIERNQSBtZW1vcnkgYW5kIFNFViBpcyBhY3RpdmUgb3IgClBDSSBtZW1vcnkuIEl0J3MgYWx3
YXlzIHVuZW5jcnlwdGVkLiBVc2VyLXNwYWNlIGluIGEgU0VWIHZtIHNob3VsZCAKYWx3YXlzLCBm
cm9tIGEgZGF0YSBwcm90ZWN0aW9uIHBvaW50IG9mIHZpZXcsICphc3N1bWUqIHRoYXQgZ3JhcGhp
Y3MgCmJ1ZmZlcnMgYXJlIHVuZW5jcnlwdGVkLiAoV2hpY2ggd2lsbCBvZiBjb3Vyc2UgbGltaXQg
dGhlIHVzZSBvZiBncHVzIGFuZCAKZGlzcGxheSBjb250cm9sbGVycyBpbiBhIFNFViB2bSkuIFBs
YXRmb3JtIGNvZGUgc2V0cyB0aGUgdm1hIGVuY3J5cHRpb24gCnRvIG9uIGJ5IGRlZmF1bHQuCgpT
byB0aGUgcXVlc3Rpb24gaGVyZSBzaG91bGQgcmVhbGx5IGJlLCBjYW4gd2UgZGV0ZXJtaW5lIGFs
cmVhZHkgYXQgbW1hcCAKdGltZSB3aGV0aGVyIGJhY2tpbmcgbWVtb3J5IHdpbGwgYmUgdW5lbmNy
eXB0ZWQgYW5kIGFkanVzdCB0aGUgKnJlYWwqIAp2bWEtPnZtX3BhZ2VfcHJvdCB1bmRlciB0aGUg
bW1hcF9zZW0/CgpQb3NzaWJseSwgYnV0IHRoYXQgcmVxdWlyZXMgcG9wdWxhdGluZyB0aGUgYnVm
ZmVyIHdpdGggbWVtb3J5IGF0IG1tYXAgCnRpbWUgcmF0aGVyIHRoYW4gYXQgZmlyc3QgZmF1bHQg
dGltZS4KCkFuZCBpdCBzdGlsbCByZXF1aXJlcyBrbm93bGVkZ2Ugd2hldGhlciB0aGUgZGV2aWNl
IERNQSBpcyBhbHdheXMgCnVuZW5jcnlwdGVkIChvciBpZiBTRVYgaXMgYWN0aXZlKS4KCi9UaG9t
YXMKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
