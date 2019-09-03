Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46458A76BA
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 00:15:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5803289A32;
	Tue,  3 Sep 2019 22:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA0689A32
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 22:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id AAA2C3F671;
 Wed,  4 Sep 2019 00:15:31 +0200 (CEST)
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
 with ESMTP id Mux16M2QUtvF; Wed,  4 Sep 2019 00:15:30 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 41A923F40A;
 Wed,  4 Sep 2019 00:15:27 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id A05D8360160;
 Wed,  4 Sep 2019 00:15:26 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: Andy Lutomirski <luto@kernel.org>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
 <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
 <CALCETrVnNpPwmRddGLku9hobE7wG30_3j+QfcYxk09hZgtaYww@mail.gmail.com>
 <44b094c8-63fe-d9e5-1bf4-7da0788caccf@shipmail.org>
Organization: VMware Inc.
Message-ID: <6d122d62-9c96-4c29-8d06-02f7134e5e2a@shipmail.org>
Date: Wed, 4 Sep 2019 00:15:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <44b094c8-63fe-d9e5-1bf4-7da0788caccf@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567548926; bh=nIA64ocI+n5D4OB+HLLwxnXOxaEz/oh4I3ffyVh/4nI=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=gzAlelyj5XfF8b0pUv5ucT29pTfUWzHP+CHn+fdiPmCWMNfcMMYM/NgEKnnzNigLa
 rXY9n015AJAntQ8+AkhcwiR3QzM+/D4MknyfY0yLeZU4v8NM8DZwIDYXOa5Dx3p3RL
 7/OtoeIHgTVIiPT7kVVZla9sAEl+lsHl9M83Z7vc=
X-Mailman-Original-Authentication-Results: ste-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=gzAlelyj; 
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
 Dave Hansen <dave.hansen@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS80LzE5IDEyOjA4IEFNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPiBP
biA5LzMvMTkgMTE6NDYgUE0sIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPj4gT24gVHVlLCBTZXAg
MywgMjAxOSBhdCAyOjA1IFBNIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpCj4+IDx0aG9tYXNf
b3NAc2hpcG1haWwub3JnPiB3cm90ZToKPj4+IE9uIDkvMy8xOSAxMDo1MSBQTSwgRGF2ZSBIYW5z
ZW4gd3JvdGU6Cj4+Pj4gT24gOS8zLzE5IDE6MzYgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdh
cmUpIHdyb3RlOgo+Pj4+PiBTbyB0aGUgcXVlc3Rpb24gaGVyZSBzaG91bGQgcmVhbGx5IGJlLCBj
YW4gd2UgZGV0ZXJtaW5lIGFscmVhZHkgYXQgCj4+Pj4+IG1tYXAKPj4+Pj4gdGltZSB3aGV0aGVy
IGJhY2tpbmcgbWVtb3J5IHdpbGwgYmUgdW5lbmNyeXB0ZWQgYW5kIGFkanVzdCB0aGUgKnJlYWwq
Cj4+Pj4+IHZtYS0+dm1fcGFnZV9wcm90IHVuZGVyIHRoZSBtbWFwX3NlbT8KPj4+Pj4KPj4+Pj4g
UG9zc2libHksIGJ1dCB0aGF0IHJlcXVpcmVzIHBvcHVsYXRpbmcgdGhlIGJ1ZmZlciB3aXRoIG1l
bW9yeSBhdCBtbWFwCj4+Pj4+IHRpbWUgcmF0aGVyIHRoYW4gYXQgZmlyc3QgZmF1bHQgdGltZS4K
Pj4+PiBJJ20gbm90IGNvbm5lY3RpbmcgdGhlIGRvdHMuCj4+Pj4KPj4+PiB2bWEtPnZtX3BhZ2Vf
cHJvdCBpcyB1c2VkIHRvIGNyZWF0ZSBhIFZNQSdzIFBURXMgcmVnYXJkbGVzcyBvZiBpZiB0aGV5
Cj4+Pj4gYXJlIGNyZWF0ZWQgYXQgbW1hcCgpIG9yIGZhdWx0IHRpbWUuwqAgSWYgd2UgZXN0YWJs
aXNoIGEgZ29vZAo+Pj4+IHZtYS0+dm1fcGFnZV9wcm90LCBjYW4ndCB3ZSBqdXN0IHVzZSBpdCBm
b3JldmVyIGZvciBkZW1hbmQgZmF1bHRzPwo+Pj4gV2l0aCBTRVYgSSB0aGluayB0aGF0IHdlIGNv
dWxkIHBvc3NpYmx5IGVzdGFibGlzaCB0aGUgZW5jcnlwdGlvbiBmbGFncwo+Pj4gYXQgdm1hIGNy
ZWF0aW9uIHRpbWUuIEJ1dCB0aGlua2luZyBvZiBpdCwgaXQgd291bGQgYWN0dWFsbHkgYnJlYWsg
d2l0aAo+Pj4gU01FIHdoZXJlIGJ1ZmZlciBjb250ZW50IGNhbiBiZSBtb3ZlZCBiZXR3ZWVuIGVu
Y3J5cHRlZCBzeXN0ZW0gbWVtb3J5Cj4+PiBhbmQgdW5lbmNyeXB0ZWQgZ3JhcGhpY3MgY2FyZCBQ
Q0kgbWVtb3J5IGJlaGluZCB1c2VyLXNwYWNlJ3MgYmFjay4gVGhhdAo+Pj4gd291bGQgaW1wbHkg
a2lsbGluZyBhbGwgdXNlci1zcGFjZSBlbmNyeXB0ZWQgUFRFcyBhbmQgYXQgZmF1bHQgdGltZSBz
ZXQKPj4+IHVwIG5ldyBvbmVzIHBvaW50aW5nIHRvIHVuZW5jcnlwdGVkIFBDSSBtZW1vcnkuLgo+
Pj4KPj4+PiBPciwgYXJlIHlvdSBjb25jZXJuZWQgdGhhdCBpZiBhbiBhdHRlbXB0IGlzIG1hZGUg
dG8gZGVtYW5kLWZhdWx0IHBhZ2UKPj4+PiB0aGF0J3MgaW5jb21wYXRpYmxlIHdpdGggdm1hLT52
bV9wYWdlX3Byb3QgdGhhdCB3ZSBoYXZlIHRvIFNFR1Y/Cj4+Pj4KPj4+Pj4gQW5kIGl0IHN0aWxs
IHJlcXVpcmVzIGtub3dsZWRnZSB3aGV0aGVyIHRoZSBkZXZpY2UgRE1BIGlzIGFsd2F5cwo+Pj4+
PiB1bmVuY3J5cHRlZCAob3IgaWYgU0VWIGlzIGFjdGl2ZSkuCj4+Pj4gSSBtYXkgYmUgZ2V0dGlu
ZyBtaXhlZCB1cCBvbiBNS1RNRSAodGhlIEludGVsIG1lbW9yeSBlbmNyeXB0aW9uKSBhbmQKPj4+
PiBTRVYuwqAgSXMgU0VWIHN1cHBvcnRlZCBvbiBhbGwgbWVtb3J5IHR5cGVzP8KgIFBhZ2UgY2Fj
aGUsIGh1Z2V0bGJmcywKPj4+PiBhbm9ueW1vdXM/wqAgT3IganVzdCBhbm9ueW1vdXM/Cj4+PiBT
RVYgQUZBSUsgZW5jcnlwdHMgKmFsbCogbWVtb3J5IGV4Y2VwdCBETUEgbWVtb3J5LiBUbyBkbyB0
aGF0IGl0IHVzZXMgYQo+Pj4gU1dJT1RMQiBiYWNrZWQgYnkgdW5lbmNyeXB0ZWQgbWVtb3J5LCBh
bmQgaXQgYWxzbyBmbGlwcyBjb2hlcmVudCBETUEKPj4+IG1lbW9yeSB0byB1bmVuY3J5cHRlZCAo
d2hpY2ggaXMgYSB2ZXJ5IHNsb3cgb3BlcmF0aW9uIGFuZCBwYXRjaCA0IGRlYWxzCj4+PiB3aXRo
IGNhY2hpbmcgc3VjaCBtZW1vcnkpLgo+Pj4KPj4gSSdtIHN0aWxsIGxvc3QuwqAgWW91IGhhdmUg
c29tZSBmYW5jeSBWTUEgd2hlcmUgdGhlIGJhY2tpbmcgcGFnZXMKPj4gY2hhbmdlIGJlaGluZCB0
aGUgYXBwbGljYXRpb24ncyBiYWNrLsKgIFRoaXMgaXNuJ3QgcGFydGljdWxhcmx5IG5vdmVsCj4+
IC0tIHBsYWluIG9sZCBhbm9ueW1vdXMgbWVtb3J5IGFuZCBwbGFpbiBvbGQgbWFwcGVkIGZpbGVz
IGRvIHRoaXMgdG9vLgo+PiBDYW4ndCB5b3UgYWxsIHRoZSBpbnNlcnRfcGZuIEFQSXMgYW5kIGNh
bGwgaXQgYSBkYXk/wqAgV2hhdCdzIHNvCj4+IHNwZWNpYWwgdGhhdCB5b3UgbmVlZCBhbGwgdGhp
cyBtYWdpYz/CoCBJU1RNIHlvdSBzaG91bGQgYmUgYWJsZSB0bwo+PiBhbGxvY2F0ZSBtZW1vcnkg
dGhhdCdzIGFkZHJlc3NhYmxlIGJ5IHRoZSBkZXZpY2UgKGRtYV9hbGxvY19jb2hlcmVudCgpCj4+
IG9yIHdoYXRldmVyKSBhbmQgdGhlbiBtYXAgaXQgaW50byB1c2VyIG1lbW9yeSBqdXN0IGxpa2Ug
eW91J2QgbWFwIGFueQo+PiBvdGhlciBwYWdlLgo+Pgo+PiBJIGZlZWwgbGlrZSBJJ20gbWlzc2lu
ZyBzb21ldGhpbmcgaGVyZS4KPgo+IFllcywgc28gaW4gdGhpcyBjYXNlIHdlIHVzZSBkbWFfYWxs
b2NfY29oZXJlbnQoKS4KPgo+IFdpdGggU0VWLCB0aGF0IGdpdmVzIHVzIHVuZW5jcnlwdGVkIHBh
Z2VzLiAoUGFnZXMgd2hvc2UgbGluZWFyIGtlcm5lbCAKPiBtYXAgaXMgbWFya2VkIHVuZW5jcnlw
dGVkKS4gV2l0aCBTTUUgdGhhdCAodHlwY2lhbGx5KSBnaXZlcyB1cyAKPiBlbmNyeXB0ZWQgcGFn
ZXMuIEluIGJvdGggdGhlc2UgY2FzZXMsIHZtX2dldF9wYWdlX3Byb3QoKSByZXR1cm5zCj4gYW4g
ZW5jcnlwdGVkIHBhZ2UgcHJvdGVjdGlvbiwgd2hpY2ggbGFuZHMgaW4gdm1hLT52bV9wYWdlX3By
b3QuCj4KPiBJbiB0aGUgU0VWIGNhc2UsIHdlIHRoZXJlZm9yZSBuZWVkIHRvIG1vZGlmeSB0aGUg
cGFnZSBwcm90ZWN0aW9uIHRvIAo+IHVuZW5jcnlwdGVkLiBIZW5jZSB3ZSBuZWVkIHRvIGtub3cg
d2hldGhlciB3ZSdyZSBydW5uaW5nIHVuZGVyIFNFViBhbmQgCj4gdGhlcmVmb3JlIG5lZWQgdG8g
bW9kaWZ5IHRoZSBwcm90ZWN0aW9uLiBJZiBub3QsIHRoZSB1c2VyLXNwYWNlIFBURSAKPiB3b3Vs
ZCBpbmNvcnJlY3RseSBoYXZlIHRoZSBlbmNyeXB0aW9uIGZsYWcgc2V0Lgo+Cj4gL1Rob21hcwo+
Cj4KQW5kLCBvZiBjb3Vyc2UsIGhhZCB3ZSBub3QgYmVlbiAiZmFuY3kiLCB3ZSBjb3VsZCBoYXZl
IHVzZWQgCmRtYV9tbWFwX2NvaGVyZW50KCksIHdoaWNoIGluIHRoZW9yeSBzaG91bGQgc2V0IHVw
IHRoZSBjb3JyZWN0IAp1c2VyLXNwYWNlIHBhZ2UgcHJvdGVjdGlvbi4gQnV0IG5vdyB3ZSdyZSBt
b3Zpbmcgc3R1ZmYgYXJvdW5kIHNvIHdlIGNhbid0LgoKL1Rob21hcwoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
