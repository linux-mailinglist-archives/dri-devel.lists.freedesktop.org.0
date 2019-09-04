Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2806CA7BFB
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 08:49:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC78D898B6;
	Wed,  4 Sep 2019 06:49:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706C989686
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 06:49:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 0AB7A3F5C8;
 Wed,  4 Sep 2019 08:49:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VSiW-JFuoVb1; Wed,  4 Sep 2019 08:49:06 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0FA733F448;
 Wed,  4 Sep 2019 08:49:04 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 5549036014E;
 Wed,  4 Sep 2019 08:49:04 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
To: Andy Lutomirski <luto@amacapital.net>
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
 <6d122d62-9c96-4c29-8d06-02f7134e5e2a@shipmail.org>
 <B3C5DD1B-A33C-417F-BDDC-73120A035EA5@amacapital.net>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <3393108b-c7e3-c9be-b65b-5860c15ca228@shipmail.org>
Date: Wed, 4 Sep 2019 08:49:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <B3C5DD1B-A33C-417F-BDDC-73120A035EA5@amacapital.net>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567579744; bh=0jqVREsejBHV3iFCQGYQ6LoaKWK6t6ZiwYheG9Q/MGk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZDAqiNgEw4++0FCZM5xTyh6MWbA1QryMgeea2+YUaurcJhQKa8rU46SPkJhGNWn1T
 8nFwUCCwqH0qFssVp3tAcgg2os8MID6TDBJNjVycCiP+p2lp7GKiRaBXxOVpHV7x5y
 hG0G7B8Dq8u85H8hibrpZ9Og2u3/Y3aIfnl0Esvo=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=ZDAqiNgE; 
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
 Thomas Hellstrom <thellstrom@vmware.com>, Andy Lutomirski <luto@kernel.org>,
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

T24gOS80LzE5IDE6MTUgQU0sIEFuZHkgTHV0b21pcnNraSB3cm90ZToKPgo+PiBPbiBTZXAgMywg
MjAxOSwgYXQgMzoxNSBQTSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgPHRob21hc19vc0Bz
aGlwbWFpbC5vcmc+IHdyb3RlOgo+Pgo+Pj4gT24gOS80LzE5IDEyOjA4IEFNLCBUaG9tYXMgSGVs
bHN0csO2bSAoVk13YXJlKSB3cm90ZToKPj4+PiBPbiA5LzMvMTkgMTE6NDYgUE0sIEFuZHkgTHV0
b21pcnNraSB3cm90ZToKPj4+PiBPbiBUdWUsIFNlcCAzLCAyMDE5IGF0IDI6MDUgUE0gVGhvbWFz
IEhlbGxzdHLDtm0gKFZNd2FyZSkKPj4+PiA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4gd3JvdGU6
Cj4+Pj4+IE9uIDkvMy8xOSAxMDo1MSBQTSwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4+Pj4+Pj4gT24g
OS8zLzE5IDE6MzYgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpIHdyb3RlOgo+Pj4+Pj4+
IFNvIHRoZSBxdWVzdGlvbiBoZXJlIHNob3VsZCByZWFsbHkgYmUsIGNhbiB3ZSBkZXRlcm1pbmUg
YWxyZWFkeSBhdCBtbWFwCj4+Pj4+Pj4gdGltZSB3aGV0aGVyIGJhY2tpbmcgbWVtb3J5IHdpbGwg
YmUgdW5lbmNyeXB0ZWQgYW5kIGFkanVzdCB0aGUgKnJlYWwqCj4+Pj4+Pj4gdm1hLT52bV9wYWdl
X3Byb3QgdW5kZXIgdGhlIG1tYXBfc2VtPwo+Pj4+Pj4+Cj4+Pj4+Pj4gUG9zc2libHksIGJ1dCB0
aGF0IHJlcXVpcmVzIHBvcHVsYXRpbmcgdGhlIGJ1ZmZlciB3aXRoIG1lbW9yeSBhdCBtbWFwCj4+
Pj4+Pj4gdGltZSByYXRoZXIgdGhhbiBhdCBmaXJzdCBmYXVsdCB0aW1lLgo+Pj4+Pj4gSSdtIG5v
dCBjb25uZWN0aW5nIHRoZSBkb3RzLgo+Pj4+Pj4KPj4+Pj4+IHZtYS0+dm1fcGFnZV9wcm90IGlz
IHVzZWQgdG8gY3JlYXRlIGEgVk1BJ3MgUFRFcyByZWdhcmRsZXNzIG9mIGlmIHRoZXkKPj4+Pj4+
IGFyZSBjcmVhdGVkIGF0IG1tYXAoKSBvciBmYXVsdCB0aW1lLiAgSWYgd2UgZXN0YWJsaXNoIGEg
Z29vZAo+Pj4+Pj4gdm1hLT52bV9wYWdlX3Byb3QsIGNhbid0IHdlIGp1c3QgdXNlIGl0IGZvcmV2
ZXIgZm9yIGRlbWFuZCBmYXVsdHM/Cj4+Pj4+IFdpdGggU0VWIEkgdGhpbmsgdGhhdCB3ZSBjb3Vs
ZCBwb3NzaWJseSBlc3RhYmxpc2ggdGhlIGVuY3J5cHRpb24gZmxhZ3MKPj4+Pj4gYXQgdm1hIGNy
ZWF0aW9uIHRpbWUuIEJ1dCB0aGlua2luZyBvZiBpdCwgaXQgd291bGQgYWN0dWFsbHkgYnJlYWsg
d2l0aAo+Pj4+PiBTTUUgd2hlcmUgYnVmZmVyIGNvbnRlbnQgY2FuIGJlIG1vdmVkIGJldHdlZW4g
ZW5jcnlwdGVkIHN5c3RlbSBtZW1vcnkKPj4+Pj4gYW5kIHVuZW5jcnlwdGVkIGdyYXBoaWNzIGNh
cmQgUENJIG1lbW9yeSBiZWhpbmQgdXNlci1zcGFjZSdzIGJhY2suIFRoYXQKPj4+Pj4gd291bGQg
aW1wbHkga2lsbGluZyBhbGwgdXNlci1zcGFjZSBlbmNyeXB0ZWQgUFRFcyBhbmQgYXQgZmF1bHQg
dGltZSBzZXQKPj4+Pj4gdXAgbmV3IG9uZXMgcG9pbnRpbmcgdG8gdW5lbmNyeXB0ZWQgUENJIG1l
bW9yeS4uCj4+Pj4+Cj4+Pj4+PiBPciwgYXJlIHlvdSBjb25jZXJuZWQgdGhhdCBpZiBhbiBhdHRl
bXB0IGlzIG1hZGUgdG8gZGVtYW5kLWZhdWx0IHBhZ2UKPj4+Pj4+IHRoYXQncyBpbmNvbXBhdGli
bGUgd2l0aCB2bWEtPnZtX3BhZ2VfcHJvdCB0aGF0IHdlIGhhdmUgdG8gU0VHVj8KPj4+Pj4+Cj4+
Pj4+Pj4gQW5kIGl0IHN0aWxsIHJlcXVpcmVzIGtub3dsZWRnZSB3aGV0aGVyIHRoZSBkZXZpY2Ug
RE1BIGlzIGFsd2F5cwo+Pj4+Pj4+IHVuZW5jcnlwdGVkIChvciBpZiBTRVYgaXMgYWN0aXZlKS4K
Pj4+Pj4+IEkgbWF5IGJlIGdldHRpbmcgbWl4ZWQgdXAgb24gTUtUTUUgKHRoZSBJbnRlbCBtZW1v
cnkgZW5jcnlwdGlvbikgYW5kCj4+Pj4+PiBTRVYuICBJcyBTRVYgc3VwcG9ydGVkIG9uIGFsbCBt
ZW1vcnkgdHlwZXM/ICBQYWdlIGNhY2hlLCBodWdldGxiZnMsCj4+Pj4+PiBhbm9ueW1vdXM/ICBP
ciBqdXN0IGFub255bW91cz8KPj4+Pj4gU0VWIEFGQUlLIGVuY3J5cHRzICphbGwqIG1lbW9yeSBl
eGNlcHQgRE1BIG1lbW9yeS4gVG8gZG8gdGhhdCBpdCB1c2VzIGEKPj4+Pj4gU1dJT1RMQiBiYWNr
ZWQgYnkgdW5lbmNyeXB0ZWQgbWVtb3J5LCBhbmQgaXQgYWxzbyBmbGlwcyBjb2hlcmVudCBETUEK
Pj4+Pj4gbWVtb3J5IHRvIHVuZW5jcnlwdGVkICh3aGljaCBpcyBhIHZlcnkgc2xvdyBvcGVyYXRp
b24gYW5kIHBhdGNoIDQgZGVhbHMKPj4+Pj4gd2l0aCBjYWNoaW5nIHN1Y2ggbWVtb3J5KS4KPj4+
Pj4KPj4+PiBJJ20gc3RpbGwgbG9zdC4gIFlvdSBoYXZlIHNvbWUgZmFuY3kgVk1BIHdoZXJlIHRo
ZSBiYWNraW5nIHBhZ2VzCj4+Pj4gY2hhbmdlIGJlaGluZCB0aGUgYXBwbGljYXRpb24ncyBiYWNr
LiAgVGhpcyBpc24ndCBwYXJ0aWN1bGFybHkgbm92ZWwKPj4+PiAtLSBwbGFpbiBvbGQgYW5vbnlt
b3VzIG1lbW9yeSBhbmQgcGxhaW4gb2xkIG1hcHBlZCBmaWxlcyBkbyB0aGlzIHRvby4KPj4+PiBD
YW4ndCB5b3UgYWxsIHRoZSBpbnNlcnRfcGZuIEFQSXMgYW5kIGNhbGwgaXQgYSBkYXk/ICBXaGF0
J3Mgc28KPj4+PiBzcGVjaWFsIHRoYXQgeW91IG5lZWQgYWxsIHRoaXMgbWFnaWM/ICBJU1RNIHlv
dSBzaG91bGQgYmUgYWJsZSB0bwo+Pj4+IGFsbG9jYXRlIG1lbW9yeSB0aGF0J3MgYWRkcmVzc2Fi
bGUgYnkgdGhlIGRldmljZSAoZG1hX2FsbG9jX2NvaGVyZW50KCkKPj4+PiBvciB3aGF0ZXZlcikg
YW5kIHRoZW4gbWFwIGl0IGludG8gdXNlciBtZW1vcnkganVzdCBsaWtlIHlvdSdkIG1hcCBhbnkK
Pj4+PiBvdGhlciBwYWdlLgo+Pj4+Cj4+Pj4gSSBmZWVsIGxpa2UgSSdtIG1pc3Npbmcgc29tZXRo
aW5nIGhlcmUuCj4+PiBZZXMsIHNvIGluIHRoaXMgY2FzZSB3ZSB1c2UgZG1hX2FsbG9jX2NvaGVy
ZW50KCkuCj4+Pgo+Pj4gV2l0aCBTRVYsIHRoYXQgZ2l2ZXMgdXMgdW5lbmNyeXB0ZWQgcGFnZXMu
IChQYWdlcyB3aG9zZSBsaW5lYXIga2VybmVsIG1hcCBpcyBtYXJrZWQgdW5lbmNyeXB0ZWQpLiBX
aXRoIFNNRSB0aGF0ICh0eXBjaWFsbHkpIGdpdmVzIHVzIGVuY3J5cHRlZCBwYWdlcy4gSW4gYm90
aCB0aGVzZSBjYXNlcywgdm1fZ2V0X3BhZ2VfcHJvdCgpIHJldHVybnMKPj4+IGFuIGVuY3J5cHRl
ZCBwYWdlIHByb3RlY3Rpb24sIHdoaWNoIGxhbmRzIGluIHZtYS0+dm1fcGFnZV9wcm90Lgo+Pj4K
Pj4+IEluIHRoZSBTRVYgY2FzZSwgd2UgdGhlcmVmb3JlIG5lZWQgdG8gbW9kaWZ5IHRoZSBwYWdl
IHByb3RlY3Rpb24gdG8gdW5lbmNyeXB0ZWQuIEhlbmNlIHdlIG5lZWQgdG8ga25vdyB3aGV0aGVy
IHdlJ3JlIHJ1bm5pbmcgdW5kZXIgU0VWIGFuZCB0aGVyZWZvcmUgbmVlZCB0byBtb2RpZnkgdGhl
IHByb3RlY3Rpb24uIElmIG5vdCwgdGhlIHVzZXItc3BhY2UgUFRFIHdvdWxkIGluY29ycmVjdGx5
IGhhdmUgdGhlIGVuY3J5cHRpb24gZmxhZyBzZXQuCj4+Pgo+IEnigJltIHN0aWxsIGNvbmZ1c2Vk
LiBZb3UgZ290IHVuZW5jcnlwdGVkIHBhZ2VzIHdpdGggYW4gdW5lbmNyeXB0ZWQgUEZOLiBXaHkg
ZG8geW91IG5lZWQgdG8gZmlkZGxlPyAgWW91IGhhdmUgYSBQRk4sIGFuZCB5b3XigJlyZSBpbnNl
cnRpbmcgaXQgd2l0aCB2bWZfaW5zZXJ0X3BmbigpLiAgVGhpcyBzaG91bGQganVzdCB3b3JrLCBu
bz8KCk9LIG5vdyBJIHNlZSB3aGF0IGNhdXNlcyB0aGUgY29uZnVzaW9uLgoKV2l0aCBTRVYsIHRo
ZSBlbmNyeXB0aW9uIHN0YXRlIGlzLCB3aGlsZSAqcGh5c2ljYWxseSogZW5jb2RlZCBpbiBhbiAK
YWRkcmVzcyBiaXQsIGZyb20gd2hhdCBJIGNhbiB0ZWxsLCBub3QgKmxvZ2ljYWxseSogZW5jb2Rl
ZCBpbiB0aGUgcGZuLCAKYnV0IGluIHRoZSBwYWdlX3Byb3QgZm9yIGNwdSBtYXBwaW5nIHB1cnBv
c2VzLsKgIFRoYXQgaXMsIHBhZ2VfdG9fcGZuKCnCoCAKcmV0dXJucyB0aGUgc2FtZSBwZm4gd2hl
dGhlciB0aGUgcGFnZSBpcyBlbmNyeXB0ZWQgb3IgdW5lbmNyeXB0ZWQuIEhlbmNlIApub2JvZHkg
Y2FuJ3QgdGVsbCBmcm9tIHRoZSBwZm4gd2hldGhlciB0aGUgcGFnZSBpcyB1bmVuY3J5cHRlZCBv
ciBlbmNyeXB0ZWQuCgpGb3IgZGV2aWNlIERNQSBhZGRyZXNzIHB1cnBvc2VzLCB0aGUgZW5jcnlw
dGlvbiBzdGF0dXMgaXMgZW5jb2RlZCBpbiB0aGUgCmRtYSBhZGRyZXNzIGJ5IHRoZSBkbWEgbGF5
ZXIgaW4gcGh5c190b19kbWEoKS4KCgo+ICAgVGhlcmUgZG9lc27igJl0IHNlZW0gdG8gYmUgYW55
IHJlYWwgZnVubnkgYnVzaW5lc3MgaW4gZG1hX21tYXBfYXR0cnMoKSBvciBkbWFfY29tbW9uX21t
YXAoKS4KCk5vLCBmcm9tIHdoYXQgSSBjYW4gdGVsbCB0aGUgY2FsbCBpbiB0aGVzZSBmdW5jdGlv
bnMgdG8gZG1hX3BncHJvdCgpIApnZW5lcmF0ZXMgYW4gaW5jb3JyZWN0IHBhZ2UgcHJvdGVjdGlv
biBzaW5jZSBpdCBkb2Vzbid0IHRha2UgdW5lbmNyeXB0ZWQgCmNvaGVyZW50IG1lbW9yeSBpbnRv
IGFjY291bnQuIEkgZG9uJ3QgdGhpbmsgYW55Ym9keSBoYXMgdXNlZCB0aGVzZSAKZnVuY3Rpb25z
IHlldCB3aXRoIFNFVi4KCj4KPiBCdXQsIHJlYWRpbmcgdGhpcywgSSBoYXZlIG1vcmUgcXVlc3Rp
b25zOgo+Cj4gQ2Fu4oCZdCB5b3UgZ2V0IHJpZCBvZiBjdm1hIGJ5IHVzaW5nIHZtZl9pbnNlcnRf
cGZuX3Byb3QoKT8KCkl0IGxvb2tzIGxpa2UgdGhhdCwgYWx0aG91Z2ggdGhlcmUgYXJlIGNvbW1l
bnRzIGluIHRoZSBjb2RlIGFib3V0IApzZXJpb3VzIHBlcmZvcm1hbmNlIHByb2JsZW1zIHVzaW5n
IFZNX1BGTk1BUCAvIHZtZl9pbnNlcnRfcGZuKCkgd2l0aCAKd3JpdGUtY29tYmluaW5nIGFuZCBQ
QVQsIHNvIHRoYXQgd291bGQgcmVxdWlyZSBzb21lIHNlcmlvdXMgdGVzdGluZyB3aXRoIApoYXJk
d2FyZSBJIGRvbid0IGhhdmUuIEJ1dCBJIGd1ZXNzIHRoZXJlIGlzIGRlZmluaXRlbHkgcm9vbSBm
b3IgCmltcHJvdmVtZW50IGhlcmUuIElkZWFsbHkgd2UnZCBsaWtlIHRvIGJlIGFibGUgdG8gY2hh
bmdlIHRoZSAKdm1hLT52bV9wYWdlX3Byb3Qgd2l0aGluIGZhdWx0KCkuIEJ1dCB3ZSBjYW4KCj4K
PiBXb3VsZCBpdCBtYWtlIHNlbnNlIHRvIGFkZCBhIHZtZl9pbnNlcnRfZG1hX3BhZ2UoKSB0byBk
aXJlY3RseSBkbyBleGFjdGx5IHdoYXQgeW914oCZcmUgdHJ5aW5nIHRvIGRvPwoKWWVzLCBidXQg
YXMgYSBsb25nZXIgdGVybSBzb2x1dGlvbiBJIHdvdWxkIHByZWZlciBhIGdlbmVyYWwgZG1hX3Bn
cHJvdCgpIApleHBvcnRlZCwgc28gdGhhdCB3ZSBjb3VsZCwgaW4gYSBkbWEtY29tcGxpYW50IHdh
eSwgdXNlIGNvaGVyZW50IHBhZ2VzIAp3aXRoIG90aGVyIGFwaXMsIGxpa2Uga21hcF9hdG9taWNf
cHJvdCgpIGFuZCB2bWFwKCkuIFRoYXQgaXMsIGJhc2ljYWxseSAKc3BsaXQgY29oZXJlbnQgcGFn
ZSBhbGxvY2F0aW9uIGluIHR3byBzdGVwczogQWxsb2NhdGlvbiBhbmQgbWFwcGluZy4KCj4KPiBB
bmQgYSBicm9hZGVyIHF1ZXN0aW9uIGp1c3QgYmVjYXVzZSBJ4oCZbSBzdGlsbCBjb25mdXNlZDog
d2h5IGlzbuKAmXQgdGhlIGVuY3J5cHRpb24gYml0IGluIHRoZSBQRk4/ICBUaGUgd2hvbGUgU0VW
L1NNRSBzeXN0ZW0gc2VlbXMgbGlrZSBpdOKAmXMgdHJ5aW5nIGEgYml0IHRvIGhhcmQgdG8gYmUg
ZnVsbHkgaW52aXNpYmxlIHRvIHRoZSBrZXJuZWwuCgpJIGd1ZXNzIHlvdSdkIGhhdmUgdG8gYXNr
IEFNRCBhYm91dCB0aGF0LiBCdXQgbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IAplbmNvZGluZyBp
dCBpbiBhbiBhZGRyZXNzIGJpdCBkb2VzIG1ha2UgaXQgdHJpdmlhbCB0byBkbyBkZWNyeXB0aW9u
IC8gCmVuY3J5cHRpb24gb24gdGhlIGZseSB0byBETUEgZGV2aWNlcyB0aGF0IGFyZSBub3Qgb3Ro
ZXJ3aXNlIGF3YXJlIG9mIGl0LCAKanVzdCBieSBoYW5kaW5nIHRoZW0gYSBzcGVjaWFsIHBoeXNp
Y2FsIGFkZHJlc3MuIEZvciBjcHUgbWFwcGluZyAKcHVycG9zZXMgaXQgbWlnaHQgYmVjb21lIGF3
a3dhcmQgdG8gZW5jb2RlIGl0IGluIHRoZSBwZm4gc2luY2UgCnBmbl90b19wYWdlIGFuZCBmcmll
bmRzIHdvdWxkIG5lZWQga25vd2xlZGdlIGFib3V0IHRoaXMuIFBlcnNvbmFsbHkgSSAKdGhpbmsg
aXQgd291bGQgaGF2ZSBtYWRlIHNlbnNlIHRvIHRyYWNrIGl0IGxpa2UgUEFUIGluIHRyYWNrX3Bm
bl9pbnNlcnQoKS4KClRoYW5rcywKClRob21hcwoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
