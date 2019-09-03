Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6450CA76B1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 00:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A422898B7;
	Tue,  3 Sep 2019 22:08:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B74898B7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 22:08:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id A5E7F3FA6C;
 Wed,  4 Sep 2019 00:08:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vesswdzBSj4G; Wed,  4 Sep 2019 00:08:29 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 4CC3A3F867;
 Wed,  4 Sep 2019 00:08:28 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id BE2E7360160;
 Wed,  4 Sep 2019 00:08:27 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
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
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <44b094c8-63fe-d9e5-1bf4-7da0788caccf@shipmail.org>
Date: Wed, 4 Sep 2019 00:08:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CALCETrVnNpPwmRddGLku9hobE7wG30_3j+QfcYxk09hZgtaYww@mail.gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567548507; bh=PP08vBRpPI309PnHgg45hbLsURQYHx2L5Y1XUs0y6nM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pkx+xcp7hRW0GXq5L6+AefZWEbZg0UOumvBTFZnEqaoGsI8veT+gNordaidfuAVSR
 FIujzRE3rpKodpvIxbxht6Ig9OXw1ylUXalqIMSnaL22ANMUIbkhue7Rhe2PYqta59
 4FvVjoE0Af4SpyxGZ2Fsgsy/eKc99JNsguqTla4Q=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=pkx+xcp7; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=shipmail.org
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

T24gOS8zLzE5IDExOjQ2IFBNLCBBbmR5IEx1dG9taXJza2kgd3JvdGU6Cj4gT24gVHVlLCBTZXAg
MywgMjAxOSBhdCAyOjA1IFBNIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpCj4gPHRob21hc19v
c0BzaGlwbWFpbC5vcmc+IHdyb3RlOgo+PiBPbiA5LzMvMTkgMTA6NTEgUE0sIERhdmUgSGFuc2Vu
IHdyb3RlOgo+Pj4gT24gOS8zLzE5IDE6MzYgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUp
IHdyb3RlOgo+Pj4+IFNvIHRoZSBxdWVzdGlvbiBoZXJlIHNob3VsZCByZWFsbHkgYmUsIGNhbiB3
ZSBkZXRlcm1pbmUgYWxyZWFkeSBhdCBtbWFwCj4+Pj4gdGltZSB3aGV0aGVyIGJhY2tpbmcgbWVt
b3J5IHdpbGwgYmUgdW5lbmNyeXB0ZWQgYW5kIGFkanVzdCB0aGUgKnJlYWwqCj4+Pj4gdm1hLT52
bV9wYWdlX3Byb3QgdW5kZXIgdGhlIG1tYXBfc2VtPwo+Pj4+Cj4+Pj4gUG9zc2libHksIGJ1dCB0
aGF0IHJlcXVpcmVzIHBvcHVsYXRpbmcgdGhlIGJ1ZmZlciB3aXRoIG1lbW9yeSBhdCBtbWFwCj4+
Pj4gdGltZSByYXRoZXIgdGhhbiBhdCBmaXJzdCBmYXVsdCB0aW1lLgo+Pj4gSSdtIG5vdCBjb25u
ZWN0aW5nIHRoZSBkb3RzLgo+Pj4KPj4+IHZtYS0+dm1fcGFnZV9wcm90IGlzIHVzZWQgdG8gY3Jl
YXRlIGEgVk1BJ3MgUFRFcyByZWdhcmRsZXNzIG9mIGlmIHRoZXkKPj4+IGFyZSBjcmVhdGVkIGF0
IG1tYXAoKSBvciBmYXVsdCB0aW1lLiAgSWYgd2UgZXN0YWJsaXNoIGEgZ29vZAo+Pj4gdm1hLT52
bV9wYWdlX3Byb3QsIGNhbid0IHdlIGp1c3QgdXNlIGl0IGZvcmV2ZXIgZm9yIGRlbWFuZCBmYXVs
dHM/Cj4+IFdpdGggU0VWIEkgdGhpbmsgdGhhdCB3ZSBjb3VsZCBwb3NzaWJseSBlc3RhYmxpc2gg
dGhlIGVuY3J5cHRpb24gZmxhZ3MKPj4gYXQgdm1hIGNyZWF0aW9uIHRpbWUuIEJ1dCB0aGlua2lu
ZyBvZiBpdCwgaXQgd291bGQgYWN0dWFsbHkgYnJlYWsgd2l0aAo+PiBTTUUgd2hlcmUgYnVmZmVy
IGNvbnRlbnQgY2FuIGJlIG1vdmVkIGJldHdlZW4gZW5jcnlwdGVkIHN5c3RlbSBtZW1vcnkKPj4g
YW5kIHVuZW5jcnlwdGVkIGdyYXBoaWNzIGNhcmQgUENJIG1lbW9yeSBiZWhpbmQgdXNlci1zcGFj
ZSdzIGJhY2suIFRoYXQKPj4gd291bGQgaW1wbHkga2lsbGluZyBhbGwgdXNlci1zcGFjZSBlbmNy
eXB0ZWQgUFRFcyBhbmQgYXQgZmF1bHQgdGltZSBzZXQKPj4gdXAgbmV3IG9uZXMgcG9pbnRpbmcg
dG8gdW5lbmNyeXB0ZWQgUENJIG1lbW9yeS4uCj4+Cj4+PiBPciwgYXJlIHlvdSBjb25jZXJuZWQg
dGhhdCBpZiBhbiBhdHRlbXB0IGlzIG1hZGUgdG8gZGVtYW5kLWZhdWx0IHBhZ2UKPj4+IHRoYXQn
cyBpbmNvbXBhdGlibGUgd2l0aCB2bWEtPnZtX3BhZ2VfcHJvdCB0aGF0IHdlIGhhdmUgdG8gU0VH
Vj8KPj4+Cj4+Pj4gQW5kIGl0IHN0aWxsIHJlcXVpcmVzIGtub3dsZWRnZSB3aGV0aGVyIHRoZSBk
ZXZpY2UgRE1BIGlzIGFsd2F5cwo+Pj4+IHVuZW5jcnlwdGVkIChvciBpZiBTRVYgaXMgYWN0aXZl
KS4KPj4+IEkgbWF5IGJlIGdldHRpbmcgbWl4ZWQgdXAgb24gTUtUTUUgKHRoZSBJbnRlbCBtZW1v
cnkgZW5jcnlwdGlvbikgYW5kCj4+PiBTRVYuICBJcyBTRVYgc3VwcG9ydGVkIG9uIGFsbCBtZW1v
cnkgdHlwZXM/ICBQYWdlIGNhY2hlLCBodWdldGxiZnMsCj4+PiBhbm9ueW1vdXM/ICBPciBqdXN0
IGFub255bW91cz8KPj4gU0VWIEFGQUlLIGVuY3J5cHRzICphbGwqIG1lbW9yeSBleGNlcHQgRE1B
IG1lbW9yeS4gVG8gZG8gdGhhdCBpdCB1c2VzIGEKPj4gU1dJT1RMQiBiYWNrZWQgYnkgdW5lbmNy
eXB0ZWQgbWVtb3J5LCBhbmQgaXQgYWxzbyBmbGlwcyBjb2hlcmVudCBETUEKPj4gbWVtb3J5IHRv
IHVuZW5jcnlwdGVkICh3aGljaCBpcyBhIHZlcnkgc2xvdyBvcGVyYXRpb24gYW5kIHBhdGNoIDQg
ZGVhbHMKPj4gd2l0aCBjYWNoaW5nIHN1Y2ggbWVtb3J5KS4KPj4KPiBJJ20gc3RpbGwgbG9zdC4g
IFlvdSBoYXZlIHNvbWUgZmFuY3kgVk1BIHdoZXJlIHRoZSBiYWNraW5nIHBhZ2VzCj4gY2hhbmdl
IGJlaGluZCB0aGUgYXBwbGljYXRpb24ncyBiYWNrLiAgVGhpcyBpc24ndCBwYXJ0aWN1bGFybHkg
bm92ZWwKPiAtLSBwbGFpbiBvbGQgYW5vbnltb3VzIG1lbW9yeSBhbmQgcGxhaW4gb2xkIG1hcHBl
ZCBmaWxlcyBkbyB0aGlzIHRvby4KPiBDYW4ndCB5b3UgYWxsIHRoZSBpbnNlcnRfcGZuIEFQSXMg
YW5kIGNhbGwgaXQgYSBkYXk/ICBXaGF0J3Mgc28KPiBzcGVjaWFsIHRoYXQgeW91IG5lZWQgYWxs
IHRoaXMgbWFnaWM/ICBJU1RNIHlvdSBzaG91bGQgYmUgYWJsZSB0bwo+IGFsbG9jYXRlIG1lbW9y
eSB0aGF0J3MgYWRkcmVzc2FibGUgYnkgdGhlIGRldmljZSAoZG1hX2FsbG9jX2NvaGVyZW50KCkK
PiBvciB3aGF0ZXZlcikgYW5kIHRoZW4gbWFwIGl0IGludG8gdXNlciBtZW1vcnkganVzdCBsaWtl
IHlvdSdkIG1hcCBhbnkKPiBvdGhlciBwYWdlLgo+Cj4gSSBmZWVsIGxpa2UgSSdtIG1pc3Npbmcg
c29tZXRoaW5nIGhlcmUuCgpZZXMsIHNvIGluIHRoaXMgY2FzZSB3ZSB1c2UgZG1hX2FsbG9jX2Nv
aGVyZW50KCkuCgpXaXRoIFNFViwgdGhhdCBnaXZlcyB1cyB1bmVuY3J5cHRlZCBwYWdlcy4gKFBh
Z2VzIHdob3NlIGxpbmVhciBrZXJuZWwgCm1hcCBpcyBtYXJrZWQgdW5lbmNyeXB0ZWQpLiBXaXRo
IFNNRSB0aGF0ICh0eXBjaWFsbHkpIGdpdmVzIHVzIGVuY3J5cHRlZCAKcGFnZXMuIEluIGJvdGgg
dGhlc2UgY2FzZXMsIHZtX2dldF9wYWdlX3Byb3QoKSByZXR1cm5zCmFuIGVuY3J5cHRlZCBwYWdl
IHByb3RlY3Rpb24sIHdoaWNoIGxhbmRzIGluIHZtYS0+dm1fcGFnZV9wcm90LgoKSW4gdGhlIFNF
ViBjYXNlLCB3ZSB0aGVyZWZvcmUgbmVlZCB0byBtb2RpZnkgdGhlIHBhZ2UgcHJvdGVjdGlvbiB0
byAKdW5lbmNyeXB0ZWQuIEhlbmNlIHdlIG5lZWQgdG8ga25vdyB3aGV0aGVyIHdlJ3JlIHJ1bm5p
bmcgdW5kZXIgU0VWIGFuZCAKdGhlcmVmb3JlIG5lZWQgdG8gbW9kaWZ5IHRoZSBwcm90ZWN0aW9u
LiBJZiBub3QsIHRoZSB1c2VyLXNwYWNlIFBURSAKd291bGQgaW5jb3JyZWN0bHkgaGF2ZSB0aGUg
ZW5jcnlwdGlvbiBmbGFnIHNldC4KCi9UaG9tYXMKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
