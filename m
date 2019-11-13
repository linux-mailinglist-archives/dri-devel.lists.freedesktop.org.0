Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF819FB639
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 18:18:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5ED6E084;
	Wed, 13 Nov 2019 17:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8899A6E084
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 17:18:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id CB47143C87;
 Wed, 13 Nov 2019 18:18:38 +0100 (CET)
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
 with ESMTP id Oqvvu7LXcFlk; Wed, 13 Nov 2019 18:18:36 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D0E2743C84;
 Wed, 13 Nov 2019 18:18:32 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id D0B4B360103;
 Wed, 13 Nov 2019 18:18:31 +0100 (CET)
Subject: Re: [PATCH] drm/vmwgfx: Use coherent memory if there are dma mapping
 size restrictions
To: Christoph Hellwig <hch@infradead.org>
References: <20191113095144.2981-1-thomas_os@shipmail.org>
 <20191113095144.2981-2-thomas_os@shipmail.org>
 <20191113141610.GA12585@infradead.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <8bb796a8-7e84-6ee4-f912-3369d781c323@shipmail.org>
Date: Wed, 13 Nov 2019 18:18:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20191113141610.GA12585@infradead.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1573665511; bh=SnGTNwJjT0V1Zad9ozMDKmh6pgYse3fBTbIj3d9Gfig=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=r3zFaX7QoVs8xwU3MKveMUxArkr+Ee8dXuxvo4tzQc2HFAOJ5nnicdgVdNOV/xBah
 WqY08Y0siUhD66R629RWBev1SLZqAuPoazX8lGWrRRZ9Fp9QGTtGtp1K2I9jZWBuJE
 l/jPeHrjQY1riip+Z0/34egTbtyqi4y10mhMHJ58=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=r3zFaX7Q; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Brian Paul <brianp@vmware.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpPbiAxMS8xMy8xOSAzOjE2IFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBX
ZWQsIE5vdiAxMywgMjAxOSBhdCAxMDo1MTo0M0FNICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSAo
Vk13YXJlKSB3cm90ZToKPj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdh
cmUuY29tPgo+Pgo+PiBXZSdyZSBncmFkdWFsbHkgbW92aW5nIHRvd2FyZHMgdXNpbmcgRE1BIGNv
aGVyZW50IG1lbW9yeSBpbiBtb3N0Cj4+IHNpdHVhdGlvbnMsIGFsdGhvdWdoIFRUTSBpbnRlcmFj
dGlvbnMgd2l0aCB0aGUgRE1BIGxheWVycyBpcyBzdGlsbCBhCj4+IHdvcmstaW4tcHJvZ3Jlc3Mu
IE1lYW53aGlsZSwgdXNlIGNvaGVyZW50IG1lbW9yeSB3aGVuIHRoZXJlIGFyZSBzaXplCj4+IHJl
c3RyaWN0aW9ucyBtZWFuaW5nIHRoYXQgdGhlcmUgaXMgYSBjaGFuY2UgdGhhdCBzdHJlYW1pbmcg
ZG1hIG1hcHBpbmcKPj4gb2YgbGFyZ2UgYnVmZmVyIG9iamVjdHMgbWF5IGZhaWwuCj4+IEFsc28g
bW92ZSBETUEgbWFzayBzZXR0aW5ncyB0byB0aGUgdm13X2RtYV9zZWxlY3RfbW9kZSBmdW5jdGlv
biwgc2luY2UKPj4gaXQncyBpbXBvcnRhbnQgdGhhdCB3ZSBzZXQgdGhlIGNvcnJlY3QgRE1BIG1h
c2tzIGJlZm9yZSBjYWxsaW5nIHRoZQo+PiBkbWFfbWF4X21hcHBpbmdfc2l6ZSgpIGZ1bmN0aW9u
Lgo+Pgo+PiBDYzogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBpbmZyYWRlYWQub3JnPgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgSGVsbHN0cm9tIDx0aGVsbHN0cm9tQHZtd2FyZS5jb20+Cj4+IFJl
dmlld2VkLWJ5OiBCcmlhbiBQYXVsIDxicmlhbnBAdm13YXJlLmNvbT4KPj4gLS0tCj4+ICAgZHJp
dmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgfCAzMSArKysrKysrLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDI0IGRlbGV0
aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
ZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9kcnYuYwo+PiBpbmRleCBmYzAy
ODM2NTljNDEuLjFlMWRlODM5MDhmZSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Zt
d2dmeC92bXdnZnhfZHJ2LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhf
ZHJ2LmMKPj4gQEAgLTU2OSw3ICs1NjksMTAgQEAgc3RhdGljIGludCB2bXdfZG1hX3NlbGVjdF9t
b2RlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYpCj4+ICAgCQlbdm13X2RtYV9tYXBfcG9w
dWxhdGVdID0gIkNhY2hpbmcgRE1BIG1hcHBpbmdzLiIsCj4+ICAgCQlbdm13X2RtYV9tYXBfYmlu
ZF0gPSAiR2l2aW5nIHVwIERNQSBtYXBwaW5ncyBlYXJseS4ifTsKPj4gICAKPj4gLQlpZiAodm13
X2ZvcmNlX2NvaGVyZW50KQo+PiArCSh2b2lkKSBkbWFfc2V0X21hc2tfYW5kX2NvaGVyZW50KGRl
dl9wcml2LT5kZXYtPmRldiwgRE1BX0JJVF9NQVNLKDY0KSk7Cj4gUGxlYXNlIGRvbid0IHVzZSB2
b2lkIGNhc3Qgb24gcmV0dXJucy4gIEFsc28gdGhpcyBnZW5lcmNhbGx5IGNhbid0Cj4gZmFpbCwg
c28gaWYgaXQgZmFpbHMgYW55d2F5IGl0IGlzIGZhdGFsLCBhbmQgeW91IHNob3VsZCBhY3R1YWxs
eQo+IHJldHVybiBhbiBlcnJvci4KCk9LLiBXaWxsIGZpeC4KCj4KPj4gKwlpZiAodm13X2ZvcmNl
X2NvaGVyZW50IHx8Cj4+ICsJICAgIGRtYV9tYXhfbWFwcGluZ19zaXplKGRldl9wcml2LT5kZXYt
PmRldikgIT0gU0laRV9NQVgpCj4gSSBkb24ndCB0aGluayB0aGlzIGlzIHRoZSByaWdodCBjaGVj
ayB0byBzZWUgaWYgc3dpb3RsYiB3b3VsZCBiZQo+IHVzZWQuICBZb3UgcHJvYmFibHkgd2FudCB0
byBjYWxsIGRtYV9hZGRyZXNzaW5nX2xpbWl0ZWQoKS4gIFBsZWFzZQo+IGFsc28gYWRkIGEgY29t
bWVudCBleHBsYWluaW5nIHRoZSBjYWxsIGhlcmUuCgpJZiBJIHVuZGVyc3RhbmQgdGhpbmdzIGNv
cnJlY3RseSwgZG1hX2FkZHJlc3NpbmdfbGltaXRlZCgpIHdvdWxkIGFsd2F5cyAKcmV0dXJuIGZh
bHNlIG9uIHZtd2dmeCwgYXQgbGVhc3QgaWYgdGhlICJyZXN0cmljdCB0byA0NCBiaXQiIG9wdGlv
biBpcyAKcmVtb3ZlZC4gVGhlICJvZGQiIG1vZGVzIHdlIHdhbnQgdG8gY2F0Y2ggaXMgc29tZW9u
ZSBzZXR0aW5nIApzd2lvdGxiPWZvcmNlLCBvciBzb21lb25lIGVuYWJsaW5nIFNFVi4gSW4gYm90
aCBjYXNlcywgdm13Z2Z4IHdvdWxkIApicmVhayBkb3duIGR1ZSB0byBsaW1pdGVkIERNQSBzcGFj
ZSBldmVuIGlmIHN0cmVhbWluZyBETUEgd2FzIGZpeGVkIHdpdGggCmFwcHJvcHJpYXRlIHN5bmMg
Y2FsbHMuCgpUaGUgc2FtZSBob2xkcyBmb3Igdm13X3B2c2NzaSAod2hpY2ggd2UgZGlzY3Vzc2Vk
IGJlZm9yZSkgd2hlcmUgdGhlIApsYXJnZSBxdWV1ZSBkZXB0aCB3aWxsIHR5cGljYWxseSBmaWxs
IHRoZSBTV0lPVExCIGNhdXNpbmcgZXhjZXNzaXZlIApub24tZmF0YWwgZXJyb3IgbG9nZ2luZy4K
ZG1hX21heF9tYXBwaW5nX3NpemUoKSBjdXJyZW50bHkgY2F0Y2ggdGhlc2UgbW9kZXMsIGJ1dCBi
ZXN0IEkgZ3Vlc3MgCndvdWxkIGJlIGRtYV9zd2lvdGxiX2ZvcmNlZCgpIGZ1bmN0aW9uIHRoYXQg
Y291bGQgYmUgdXNlZCBpbiBjYXNlcyBsaWtlIAp0aGlzPwoKPgo+Cj4+ICAgCWlmIChkZXZfcHJp
di0+bWFwX21vZGUgIT0gdm13X2RtYV9waHlzICYmCj4gQUZBSUsgdm13X2RtYV9waHlzIGNhbid0
IGV2ZW4gYmUgc2V0IGluIGN1cnJlbnQgbWFpbmxpbmUgYW5kIGlzIGRlYWQKPiBjb2RlLiAgQ2Fu
IHlvdSBjaGVjayBpZiBJJ20gbWlzc2luZyBzb21ldGhpbmc/ICBDZXJ0YWlubHkgYWxsIHRocmVl
Cj4gYnJhbmNoZXMgYWJvdmUgZG9uJ3Qgc2V0IGl0LgoKSSdsbCByZW1vdmUgdGhhdCBkZWFkIGNv
ZGUgZm9yIHYyLgoKPgo+PiAgIAkgICAgKHNpemVvZih1bnNpZ25lZCBsb25nKSA9PSA0IHx8IHZt
d19yZXN0cmljdF9kbWFfbWFzaykpIHsKPj4gICAJCURSTV9JTkZPKCJSZXN0cmljdGluZyBETUEg
YWRkcmVzc2VzIHRvIDQ0IGJpdHMuXG4iKTsKPj4gLQkJcmV0dXJuIGRtYV9zZXRfbWFza19hbmRf
Y29oZXJlbnQoZGV2LT5kZXYsIERNQV9CSVRfTUFTSyg0NCkpOwo+PiArCQlyZXR1cm4gZG1hX3Nl
dF9tYXNrX2FuZF9jb2hlcmVudChkZXZfcHJpdi0+ZGV2LT5kZXYsCj4+ICsJCQkJCQkgRE1BX0JJ
VF9NQVNLKDQ0KSk7Cj4gQ2FuIHlvdSBrZWVwIHNldHRpbmcgdGhlIERNQSBtYXNrIHRvZ2V0aGVy
Pwo+Cj4KPiBFLmcuIG1ha2UgdGhlIHdob2xlIHRoaW5nIHNvbWV0aGluZyBsaWtlOgo+Cj4gc3Rh
dGljIGludCB2bXdfZG1hX3NlbGVjdF9tb2RlKHN0cnVjdCB2bXdfcHJpdmF0ZSAqZGV2X3ByaXYp
Cj4gewo+IAlpZiAoZG1hX2FkZHJlc3NpbmdfbGltaXRlZChkZXZfcHJpdi0+ZGV2LT5kZXYpIHx8
IHZtd19mb3JjZV9jb2hlcmVudCkgewo+IAkJLyoKPiAJCSAqIFhYWDogd2hhdCBhYm91dCBBTUQg
aW9tbXU/ICB2aXJ0aW8taW9tbXU/ICBBbHNvCj4gCQkgKiBzd2lvdGxiIHNob3VsZCBiZSBhbHdh
eXMgYXZhaWxhYmxlIHdoZXJlIHdlIGNhbgo+IAkJICogYWRkcmVzcyBtb3JlIHRoYW4gMzItYml0
IG9mIG1lbW9yeS4uCj4gCQkgKi8KPiAJCWlmICghSVNfRU5BQkxFRChDT05GSUdfU1dJT1RMQikg
JiYKPiAJCSAgICAhSVNfRU5BQkxFRChDT05GSUdfSU5URUxfSU9NTVUpKQo+IAkJCXJldHVybiAt
RUlOVkFMOwoKVGhlIGFib3ZlIGNoZWNrIGlzIG9ubHkgdG8gc2VlIGlmIGNvaGVyZW50IG1lbW9y
eSBmdW5jdGlvbmFsaXR5IGlzIApyZWFsbHkgY29tcGlsZWQgaW4gaW50byBUVE0uIFdlIGhhdmUg
YSBwYXRjaHNldCB0aGF0IGdvdCBsb3N0IGluIHRoZSAKbGFzdCBtZXJnZSB3aW5kb3cgdG8gZml4
IHRoaXMgcHJvcGVybHkgYW5kIGF2b2lkIGNvbmZ1c2lvbiBhYm91dCB0aGlzLiAKSSdsbCByZWJh
c2Ugb24gdGhhdC4KCj4gCQlkZXZfcHJpdi0+bWFwX21vZGUgPSB2bXdfZG1hX2FsbG9jX2NvaGVy
ZW50Owo+IAl9IGVsc2UgaWYgKHZtd19yZXN0cmljdF9pb21tdSkgewo+IAkJZGV2X3ByaXYtPm1h
cF9tb2RlID0gdm13X2RtYV9tYXBfYmluZDsKPiAJfSBlbHNlIHsKPiAJCWRldl9wcml2LT5tYXBf
bW9kZSA9IHZtd19kbWFfbWFwX3BvcHVsYXRlOwo+IAl9Cj4KPiAJLyoKPiAJICogT24gMzItYml0
IHN5c3RlbXMgd2UgY2FuIG9ubHkgaGFuZGxlIDMyIGJpdCBQRk5zLiBPcHRpb25hbGx5IHNldAo+
IAkgKiB0aGF0IHJlc3RyaWN0aW9uIGFsc28gZm9yIDY0LWJpdCBzeXN0ZW1zLgo+IAkgKi8KPiAJ
cmV0dXJuIGRtYV9zZXRfbWFza19hbmRfY29oZXJlbnQoZGV2LT5kZXYsCj4gCQkJKElTX0VOQUJM
RUQoQ09ORklHXzY0QklUKSAmJiAhdm13X3Jlc3RyaWN0X2RtYV9tYXNrKSA/Cj4gCQkJNjQgOiA0
NCk7Cj4gfQoKVGhhbmtzLAoKVGhvbWFzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
