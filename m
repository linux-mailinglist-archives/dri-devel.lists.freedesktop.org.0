Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6EEA7E1F
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 10:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A7A8997E;
	Wed,  4 Sep 2019 08:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa3.bahnhof.se (pio-pvt-msa3.bahnhof.se [79.136.2.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05F018997E
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 08:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTP id 6215F3F451;
 Wed,  4 Sep 2019 10:42:54 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.099
X-Spam-Level: 
X-Spam-Status: No, score=-2.099 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Received: from pio-pvt-msa3.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa3.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eB6SS69d0euV; Wed,  4 Sep 2019 10:42:53 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa3.bahnhof.se (Postfix) with ESMTPA id 771E33F364;
 Wed,  4 Sep 2019 10:42:52 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 15D5E36117F;
 Wed,  4 Sep 2019 10:42:52 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] drm/ttm, drm/vmwgfx: Correctly support support AMD
 memory encryption
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
To: "Koenig, Christian" <Christian.Koenig@amd.com>,
 Dave Hansen <dave.hansen@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20190903131504.18935-1-thomas_os@shipmail.org>
 <20190903131504.18935-4-thomas_os@shipmail.org>
 <b54bd492-9702-5ad7-95da-daf20918d3d9@intel.com>
 <CAKMK7uFv+poZq43as8XoQaSuoBZxCQ1p44VCmUUTXOXt4Y+Bjg@mail.gmail.com>
 <6d0fafcc-b596-481b-7b22-1f26f0c02c5c@intel.com>
 <bed2a2d9-17f0-24bd-9f4a-c7ee27f6106e@shipmail.org>
 <7fa3b178-b9b4-2df9-1eee-54e24d48342e@intel.com>
 <ba77601a-d726-49fa-0c88-3b02165a9a21@shipmail.org>
 <cfe46eda-66b5-b40d-6721-84e6e0e1f5de@amd.com>
 <94113acc-1f99-2386-1d42-4b9930b04f73@shipmail.org>
Organization: VMware Inc.
Message-ID: <6f92f5d2-ba2d-ebb2-ed77-37cebb39bfa4@shipmail.org>
Date: Wed, 4 Sep 2019 10:42:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <94113acc-1f99-2386-1d42-4b9930b04f73@shipmail.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1567586572; bh=bvaCLcoiKAN+kaSJwJSs748y7pmwvtoRcbFA8sPkOoQ=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=EGZENqDo0T0nXeX8QLQKz0QHlFvnNkfp/NPEBRK44uKklAMzP69qwaru8+XVSrF8W
 MyF8rkd4B1aoE77MvVNIi0l1NoU5Rf2O5ELSRy4OUbplA7znBawKXFRq7qgqXJZO0j
 K+JyEuGr5SZ3lTWdI0jjUztelaOJ8JxwIIhkSxCo=
X-Mailman-Original-Authentication-Results: pio-pvt-msa3.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=EGZENqDo; 
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
Cc: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Andy Lutomirski <luto@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS80LzE5IDEwOjE5IEFNLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKSB3cm90ZToKPiBI
aSwgQ2hyaXN0aWFuLAo+Cj4gT24gOS80LzE5IDk6MzMgQU0sIEtvZW5pZywgQ2hyaXN0aWFuIHdy
b3RlOgo+PiBBbSAwMy4wOS4xOSB1bSAyMzowNSBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChW
TXdhcmUpOgo+Pj4gT24gOS8zLzE5IDEwOjUxIFBNLCBEYXZlIEhhbnNlbiB3cm90ZToKPj4+PiBP
biA5LzMvMTkgMTozNiBQTSwgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSkgd3JvdGU6Cj4+Pj4+
IFNvIHRoZSBxdWVzdGlvbiBoZXJlIHNob3VsZCByZWFsbHkgYmUsIGNhbiB3ZSBkZXRlcm1pbmUg
YWxyZWFkeSBhdCAKPj4+Pj4gbW1hcAo+Pj4+PiB0aW1lIHdoZXRoZXIgYmFja2luZyBtZW1vcnkg
d2lsbCBiZSB1bmVuY3J5cHRlZCBhbmQgYWRqdXN0IHRoZSAqcmVhbCoKPj4+Pj4gdm1hLT52bV9w
YWdlX3Byb3QgdW5kZXIgdGhlIG1tYXBfc2VtPwo+Pj4+Pgo+Pj4+PiBQb3NzaWJseSwgYnV0IHRo
YXQgcmVxdWlyZXMgcG9wdWxhdGluZyB0aGUgYnVmZmVyIHdpdGggbWVtb3J5IGF0IG1tYXAKPj4+
Pj4gdGltZSByYXRoZXIgdGhhbiBhdCBmaXJzdCBmYXVsdCB0aW1lLgo+Pj4+IEknbSBub3QgY29u
bmVjdGluZyB0aGUgZG90cy4KPj4+Pgo+Pj4+IHZtYS0+dm1fcGFnZV9wcm90IGlzIHVzZWQgdG8g
Y3JlYXRlIGEgVk1BJ3MgUFRFcyByZWdhcmRsZXNzIG9mIGlmIHRoZXkKPj4+PiBhcmUgY3JlYXRl
ZCBhdCBtbWFwKCkgb3IgZmF1bHQgdGltZS7CoCBJZiB3ZSBlc3RhYmxpc2ggYSBnb29kCj4+Pj4g
dm1hLT52bV9wYWdlX3Byb3QsIGNhbid0IHdlIGp1c3QgdXNlIGl0IGZvcmV2ZXIgZm9yIGRlbWFu
ZCBmYXVsdHM/Cj4+PiBXaXRoIFNFViBJIHRoaW5rIHRoYXQgd2UgY291bGQgcG9zc2libHkgZXN0
YWJsaXNoIHRoZSBlbmNyeXB0aW9uIGZsYWdzCj4+PiBhdCB2bWEgY3JlYXRpb24gdGltZS4gQnV0
IHRoaW5raW5nIG9mIGl0LCBpdCB3b3VsZCBhY3R1YWxseSBicmVhayB3aXRoCj4+PiBTTUUgd2hl
cmUgYnVmZmVyIGNvbnRlbnQgY2FuIGJlIG1vdmVkIGJldHdlZW4gZW5jcnlwdGVkIHN5c3RlbSBt
ZW1vcnkKPj4+IGFuZCB1bmVuY3J5cHRlZCBncmFwaGljcyBjYXJkIFBDSSBtZW1vcnkgYmVoaW5k
IHVzZXItc3BhY2UncyBiYWNrLgo+Pj4gVGhhdCB3b3VsZCBpbXBseSBraWxsaW5nIGFsbCB1c2Vy
LXNwYWNlIGVuY3J5cHRlZCBQVEVzIGFuZCBhdCBmYXVsdAo+Pj4gdGltZSBzZXQgdXAgbmV3IG9u
ZXMgcG9pbnRpbmcgdG8gdW5lbmNyeXB0ZWQgUENJIG1lbW9yeS4uCj4+IFdlbGwgbXkgcHJvYmxl
bSBpcyB3aGVyZSBkbyB5b3Ugc2VlIGVuY3J5cHRlZCBzeXN0ZW0gbWVtb3J5IGhlcmU/Cj4+Cj4+
IEF0IGxlYXN0IGZvciBBTUQgR1BVcyBhbGwgbWVtb3J5IGFjY2Vzc2VkIG11c3QgYmUgdW5lbmNy
eXB0ZWQgYW5kIHRoYXQKPj4gY291bnRzIGZvciBib3RoIHN5c3RlbSBhcyB3ZWxsIGFzIFBDSSBt
ZW1vcnkuCj4KPiBXZSdyZSB0YWxraW5nIFNNRSBub3cgcmlnaHQ/Cj4KPiBUaGUgY3VycmVudCBT
TUUgc2V0dXAgaXMgdGhhdCBpZiBhIGRldmljZSdzIERNQSBtYXNrIHNheXMgaXQncyBjYXBhYmxl
IAo+IG9mIGFkZHJlc3NpbmcgdGhlIGVuY3J5cHRpb24gYml0LCBjb2hlcmVudCBtZW1vcnkgd2ls
bCBiZSBlbmNyeXB0ZWQuIAo+IFRoZSBtZW1vcnkgY29udHJvbGxlcnMgd2lsbCBkZWNyeXB0IGZv
ciB0aGUgZGV2aWNlIG9uIHRoZSBmbHkuIAo+IE90aGVyd2lzZSBjb2hlcmVudCBtZW1vcnkgd2ls
bCBiZSBkZWNyeXB0ZWQuCj4KPj4KPj4gU28gSSBkb24ndCBnZXQgd2h5IHdlIGNhbid0IGFzc3Vt
ZSBhbHdheXMgdW5lbmNyeXB0ZWQgYW5kIGtlZXAgaXQgCj4+IGxpa2UgdGhhdC4KPgo+IEkgc2Vl
IHR3byByZWFzb25zLiBGaXJzdCwgaXQgd291bGQgYnJlYWsgd2l0aCBhIHJlYWwgZGV2aWNlIHRo
YXQgCj4gc2lnbmFscyBpdCdzIGNhcGFibGUgb2YgYWRkcmVzc2luZyB0aGUgZW5jcnlwdGlvbiBi
aXQuCj4KPiBTZWNvbmQgSSBjYW4gaW1hZ2luZSB1bmFjY2VsZXJhdGVkIHNldHVwcyAoc29tZXRo
aW5nIGxpa2UgdmttcyB1c2luZyAKPiBwcmltZSBmZWVkaW5nIGEgVk5DIGNvbm5lY3Rpb24pIHdo
ZXJlIHdlIGFjdHVhbGx5IHdhbnQgdGhlIFRUTSBidWZmZXJzIAo+IGVuY3J5cHRlZCB0byBwcm90
ZWN0IGRhdGEuCj4KPiBCdXQgYXQgbGVhc3QgdGhlIGxhdHRlciByZWFzb24gaXMgd2F5IGZhciBv
dXQgaW4gdGhlIGZ1dHVyZS4KPgo+IFNvIGZvciBtZSBJJ20gb2sgd2l0aCB0aGF0IGlmIHRoYXQg
d29ya3MgZm9yIHlvdT8KCkhtbSwgQlRXLAoKQXJlIHlvdSBzdXJlIHRoZSBBTUQgR1BVcyB1c2Ug
dW5lbmNyeXB0ZWQgc3lzdGVtIG1lbW9yeSByYXRoZXIgdGhhbiAKcmVseWluZyBvbiB0aGUgbWVt
b3J5IGNvbnRyb2xsZXJzIHRvIGRlY3J5cHQ/CgpJbiB0aGF0IGNhc2UgaXQgc2VlbXMgc3RyYW5n
ZSB0aGF0IHRoZXkgZ2V0IGF3YXkgd2l0aCBlbmNyeXB0ZWQgVFRNIApQVEVzLCB3aGVyZWFzIHZt
d2dmeCBkb24ndC4uLgoKL1Rob21hcwoKPgo+IC9UaG9tYXMKPgo+Cj4+Cj4+IFJlZ2FyZHMsCj4+
IENocmlzdGlhbi4KPgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
