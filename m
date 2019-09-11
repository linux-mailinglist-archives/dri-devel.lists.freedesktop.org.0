Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5956AFA00
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 12:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09DD6E19C;
	Wed, 11 Sep 2019 10:10:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B901F6E19C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 10:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id B58023F83F;
 Wed, 11 Sep 2019 12:10:24 +0200 (CEST)
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
 with ESMTP id cjPnNEQH7o4U; Wed, 11 Sep 2019 12:10:23 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 88D913F838;
 Wed, 11 Sep 2019 12:10:21 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id B1E233601AA;
 Wed, 11 Sep 2019 12:10:21 +0200 (CEST)
Subject: TTM huge page-faults WAS: Re: [RFC PATCH 1/2] x86: Don't let
 pgprot_modify() change the page encryption bit
To: "Koenig, Christian" <Christian.Koenig@amd.com>
References: <20190905103541.4161-1-thomas_os@shipmail.org>
 <20190905103541.4161-2-thomas_os@shipmail.org>
 <608bbec6-448e-f9d5-b29a-1984225eb078@intel.com>
 <b84d1dca-4542-a491-e585-a96c9d178466@shipmail.org>
 <20190905152438.GA18286@infradead.org>
 <10185AAF-BFB8-4193-A20B-B97794FB7E2F@amacapital.net>
 <92171412-eed7-40e9-2554-adb358e65767@shipmail.org>
 <d6da6e46-d283-9efc-52cb-9f2a6b0b7188@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <cace2653-447f-bcdc-2714-142d9dc85787@shipmail.org>
Date: Wed, 11 Sep 2019 12:10:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <d6da6e46-d283-9efc-52cb-9f2a6b0b7188@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568196621; bh=O+WFacO8LkYZdAVKiWt+E7uv69sjpf0qYY4jHLX9jcs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=O71ZZZYV7VMDsK0EwDguVfzwg6Ow42jbyj71uKdKEVds7ezFVuYWYPyMbZnglbgXM
 nQNLrdzksE1NId8PB4XmDp8MTSBSTkLwieS2q907KAo2TZK860ohPEbwLT+Gw89LY6
 nS65tVMswln2/GZZ2wrxs7SnfAboPGRsdTHJ/B04=
X-Mailman-Original-Authentication-Results: pio-pvt-msa1.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="O71ZZZYV";
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
Cc: "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

cmVtb3ZpbmcgcGVvcGxlIHRoYXQgYXJlIHByb2JhYmx5IG5vdCBpbnRlcmVzdGVkIGZyb20gQ0MK
YWRkaW5nIGRyaS1kZXZlbAoKT24gOS8xMS8xOSAxMTowOCBBTSwgS29lbmlnLCBDaHJpc3RpYW4g
d3JvdGU6Cj4gQW0gMTAuMDkuMTkgdW0gMjE6MjYgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAo
Vk13YXJlKToKPj4gT24gOS8xMC8xOSA2OjExIFBNLCBBbmR5IEx1dG9taXJza2kgd3JvdGU6Cj4+
Pj4gT24gU2VwIDUsIDIwMTksIGF0IDg6MjQgQU0sIENocmlzdG9waCBIZWxsd2lnIDxoY2hAaW5m
cmFkZWFkLm9yZz4KPj4+PiB3cm90ZToKPj4+Pgo+Pj4+PiBPbiBUaHUsIFNlcCAwNSwgMjAxOSBh
dCAwNToyMToyNFBNICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKQo+Pj4+PiB3cm90
ZToKPj4+Pj4+IE9uIDkvNS8xOSA0OjE1IFBNLCBEYXZlIEhhbnNlbiB3cm90ZToKPj4+Pj4+IEhp
IFRob21hcywKPj4+Pj4+Cj4+Pj4+PiBUaGFua3MgZm9yIHRoZSBzZWNvbmQgYmF0Y2ggb2YgcGF0
Y2hlcyHCoCBUaGVzZSBsb29rIG11Y2ggaW1wcm92ZWQKPj4+Pj4+IG9uIGFsbAo+Pj4+Pj4gZnJv
bnRzLgo+Pj4+PiBZZXMsIGFsdGhvdWdoIHRoZSBUVE0gZnVuY3Rpb25hbGl0eSBpc24ndCBpbiB5
ZXQuIEhvcGVmdWxseSB3ZQo+Pj4+PiB3b24ndCBoYXZlIHRvCj4+Pj4+IGJvdGhlciB5b3Ugd2l0
aCB0aG9zZSB0aG91Z2gsIHNpbmNlIHRoaXMgYXNzdW1lcyBUVE0gd2lsbCBiZSB1c2luZwo+Pj4+
PiB0aGUgZG1hCj4+Pj4+IEFQSS4KPj4+PiBQbGVhc2UgdGFrZSBhIGxvb2sgYXQgZG1hX21tYXBf
cHJlcGFyZSBhbmQgZG1hX21tYXBfZmF1bHQgaW4gdGhpcwo+Pj4+IGJyYW5jaDoKPj4+Pgo+Pj4+
IGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlzYy5naXQvc2hvcnRsb2cvcmVm
cy9oZWFkcy9kbWEtbW1hcC1pbXByb3ZlbWVudHMKPj4+Pgo+Pj4+IHRoZXkgc2hvdWxkIGFsbG93
IHRvIGZhdWx0IGRtYSBhcGkgcGFnZXMgaW4gdGhlIHBhZ2UgZmF1bHQgaGFuZGxlci4KPj4+PiBC
dXQKPj4+PiB0aGlzIGlzIHRvdGFsbHkgaG90IG9mZiB0aGUgcHJlc3MgYW5kIG5vdCBhY3R1YWxs
eSB0ZXN0ZWQgZm9yIHRoZSBsYXN0Cj4+Pj4gZmV3IHBhdGNoZXMuwqAgTm90ZSB0aGF0IEkndmUg
YWxzbyBpbmNsdWRlZCB5b3VyIHR3byBwYXRjaGVzIGZyb20gdGhpcwo+Pj4+IHNlcmllcyB0byBo
YW5kbGUgU0VWLgo+Pj4gSSByZWFkIHRoYXQgcGF0Y2gsIGFuZCBpdCBzZWVtcyBsaWtlIHlvdeKA
mXZlIGJ1aWx0IGluIHRoZSBhc3N1bXB0aW9uCj4+PiB0aGF0IGFsbCBwYWdlcyBpbiB0aGUgbWFw
cGluZyB1c2UgaWRlbnRpY2FsIHByb3RlY3Rpb24gb3IsIGlmIG5vdCwKPj4+IHRoYXQgdGhlIHNh
bWUgZmFrZSB2bWEgaGFjayB0aGF0IFRUTSBhbHJlYWR5IGhhcyBpcyB1c2VkIHRvIGZ1ZGdlCj4+
PiBhcm91bmQgaXQuwqAgQ291bGQgaXQgYmUgcmV3b3JrZWQgc2xpZ2h0bHkgdG8gYXZvaWQgdGhp
cz8KPj4+Cj4+PiBJIHdvbmRlciBpZiBpdOKAmXMgYSBtaXN0YWtlIHRvIHB1dCB0aGUgZW5jcnlw
dGlvbiBiaXRzIGluIHZtX3BhZ2VfcHJvdAo+Pj4gYXQgYWxsLgo+PiAgRnJvbSBteSBQT1csIHRo
ZSBlbmNyeXB0aW9uIGJpdHMgYmVoYXZlIHF1aXRlIHNpbWlsYXIgaW4gYmVoYXZpb3VyIHRvCj4+
IHRoZSBjYWNoaW5nIG1vZGUgYml0cywgYW5kIHRoZXkncmUgYWxzbyBpbiB2bV9wYWdlX3Byb3Qu
IFRoZXkncmUgdGhlCj4+IHJlYXNvbiBUVE0gbmVlZHMgdG8gbW9kaWZ5IHRoZSBwYWdlIHByb3Rl
Y3Rpb24gaW4gdGhlIGZhdWx0IGhhbmRsZXIgaW4KPj4gdGhlIGZpcnN0IHBsYWNlLgo+Pgo+PiBU
aGUgcHJvYmxlbSBzZWVuIGluIFRUTSBpcyB0aGF0IHdlIHdhbnQgdG8gYmUgYWJsZSB0byBjaGFu
Z2UgdGhlCj4+IHZtX3BhZ2VfcHJvdCBmcm9tIHRoZSBmYXVsdCBoYW5kbGVyLCBidXQgaXQncyBw
cm9ibGVtYXRpYyBzaW5jZSB3ZQo+PiBoYXZlIHRoZSBtbWFwX3NlbSB0eXBpY2FsbHkgb25seSBp
biByZWFkIG1vZGUuIEhlbmNlIHRoZSBmYWtlIHZtYQo+PiBoYWNrLiBGcm9tIHdoYXQgSSBjYW4g
dGVsbCBpdCdzIHJlYXNvbmFibHkgd2VsbC1iZWhhdmVkLCBzaW5jZQo+PiBwdGVfbW9kaWZ5KCkg
c2tpcHMgdGhlIGJpdHMgVFRNIHVwZGF0ZXMsIHNvIG1wcm90ZWN0KCkgYW5kIG1yZW1hcCgpCj4+
IHdvcmtzIE9LLiBJIHRoaW5rIHNwbGl0X2h1Z2VfcG1kIG1heSBydW4gaW50byB0cm91YmxlLCBi
dXQgd2UgZG9uJ3QKPj4gc3VwcG9ydCBpdCAoeWV0KSB3aXRoIFRUTS4KPiBBaCEgSSBhY3R1YWxs
eSByYW4gaW50byB0aGlzIHdoaWxlIGltcGxlbWVudGluZyBodWdlIHBhZ2Ugc3VwcG9ydCBmb3IK
PiBUVE0gYW5kIG5ldmVyIGZpZ3VyZWQgb3V0IHdoeSB0aGF0IGRvZXNuJ3Qgd29yay4gRHJvcHBl
ZCBDUFUgaHVnZSBwYWdlCj4gc3VwcG9ydCBiZWNhdXNlIG9mIHRoaXMuCgpCeSBpbmNpZGVudCwg
SSBnb3Qgc2xpZ2h0bHkgc2lkZXRyYWNrZWQgdGhlIG90aGVyIGRheSBhbmQgc3RhcnRlZCAKbG9v
a2luZyBhdCB0aGlzIGFzIHdlbGwuIEdvdCB0byB0aGUgcG9pbnQgd2hlcmUgSSBmaWd1cmVkIG91
dCBhbGwgdGhlIApoYWlyeSBhbGlnbm1lbnQgaXNzdWVzIGFuZCBhY3R1YWxseSBnb3QgaHVnZV9m
YXVsdCgpIGNhbGxzLCBidXQgbmV2ZXIgCmltcGxlbWVudGVkIHRoZSBoYW5kbGVyLiBJIHRoaW5r
IHRoYXQncyBkZWZpbml0ZWx5IHNvbWV0aGluZyB3b3J0aCAKaGF2aW5nLiBOb3Qgc3VyZSBpdCB3
aWxsIHdvcmsgZm9yIElPIG1lbW9yeSwgdGhvdWdoLCAoc3BsaXRfaHVnZV9wbWQgCndpbGwganVz
dCBza2lwIG5vbi1wYWdlLWJhY2tlZCBtZW1vcnkpIGJ1dCBpZiB3ZSBvbmx5IHN1cHBvcnQgVk1f
U0hBUkVEIAoobm9uIENPVykgdm1hcyB0aGVyZSdzIG5vIHJlYXNvbiB0byBzcGxpdCB0aGUgaHVn
ZSBwbWRzIGFueXdheS4gCkRlZmluaXRlbHkgc29tZXRoaW5nIHdlIHNob3VsZCBoYXZlIElNTy4K
Cj4+IFdlIGNvdWxkIHByb2JhYmx5IGdldCBhd2F5IHdpdGggYSBXUklURV9PTkNFKCkgdXBkYXRl
IG9mIHRoZQo+PiB2bV9wYWdlX3Byb3QgYmVmb3JlIHRha2luZyB0aGUgcGFnZSB0YWJsZSBsb2Nr
IHNpbmNlCj4+Cj4+IGEpIFdlJ3JlIGxvY2tpbmcgb3V0IGFsbCBvdGhlciB3cml0ZXJzLgo+PiBi
KSBXZSBjYW4ndCByYWNlIHdpdGggYW5vdGhlciBmYXVsdCB0byB0aGUgc2FtZSB2bWEgc2luY2Ug
d2UgaG9sZCBhbgo+PiBhZGRyZXNzIHNwYWNlIGxvY2sgKCJidWZmZXIgb2JqZWN0IHJlc2VydmF0
aW9uIikKPj4gYykgV2hlbiB3ZSBuZWVkIHRvIHVwZGF0ZSB0aGVyZSBhcmUgbm8gdmFsaWQgcGFn
ZSB0YWJsZSBlbnRyaWVzIGluIHRoZQo+PiB2bWEsIHNpbmNlIGl0IG9ubHkgaGFwcGVucyBkaXJl
Y3RseSBhZnRlciBtbWFwKCksIG9yIGFmdGVyIGFuCj4+IHVubWFwX21hcHBpbmdfcmFuZ2UoKSB3
aXRoIHRoZSBzYW1lIGFkZHJlc3Mgc3BhY2UgbG9jay4gV2hlbiBhbm90aGVyCj4+IHJlYWRlciAo
Zm9yIGV4YW1wbGUgc3BsaXRfaHVnZV9wbWQoKSkgc2VlcyBhIHZhbGlkIHBhZ2UgdGFibGUgZW50
cnksCj4+IGl0IGFsc28gc2VlcyB0aGUgbmV3IHBhZ2UgcHJvdGVjdGlvbiBhbmQgdGhpbmdzIGFy
ZSBmaW5lLgo+IFllYWgsIHRoYXQncyBleGFjdGx5IHdoeSBJIGFsd2F5cyB3b25kZXJlZCB3aHkg
d2UgbmVlZCB0aGlzIGhhY2sgd2l0aAo+IHRoZSB2bWEgY29weSBvbiB0aGUgc3RhY2suCj4KPj4g
QnV0IHRoYXQgd291bGQgcmVhbGx5IGJlIGEgc3BlY2lhbCBjYXNlLiBUbyBzb2x2ZSB0aGlzIHBy
b3Blcmx5IHdlJ2QKPj4gcHJvYmFibHkgbmVlZCBhbiBhZGRpdGlvbmFsIGxvY2sgdG8gcHJvdGVj
dCB0aGUgdm1fZmxhZ3MgYW5kCj4+IHZtX3BhZ2VfcHJvdCwgdGFrZW4gYWZ0ZXIgbW1hcF9zZW0g
YW5kIGlfbW1hcF9sb2NrLgo+IFdlbGwgd2UgYWxyZWFkeSBoYXZlIGEgc3BlY2lhbCBsb2NrIGZv
ciB0aGlzOiBUaGUgcmVzZXJ2YXRpb24gb2JqZWN0LiBTbwo+IG1lbW9yeSBiYXJyaWVycyBldGMg
c2hvdWxkIGJlIGluIHBsYWNlIGFuZCBJIGFsc28gdGhpbmsgd2UgY2FuIGp1c3QKPiB1cGRhdGUg
dGhlIHZtX3BhZ2VfcHJvdCBvbiB0aGUgZmx5LgoKSSBhZ3JlZS4gVGhpcyBpcyBuZWVkZWQgZm9y
IGh1Z2UgcGFnZXMuIFdlIHNob3VsZCBtYWtlIHRoaXMgY2hhbmdlLCBhbmQgCnBlcmhhcHMgYWRk
IHRoZSBqdXN0aWZpY2F0aW9uIGFib3ZlIGFzIGEgY29tbWVudC4KCi9UaG9tYXMKCj4gQ2hyaXN0
aWFuLgo+Cj4+IC9UaG9tYXMKPj4KPj4KPj4KPj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
