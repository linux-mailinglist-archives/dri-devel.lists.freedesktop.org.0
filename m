Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA80AFF9C
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 17:08:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6ACE66EB2C;
	Wed, 11 Sep 2019 15:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0F9E6EB2C
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 15:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 4EFA640E8D;
 Wed, 11 Sep 2019 17:08:39 +0200 (CEST)
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
 with ESMTP id K4cCLt3qtFDL; Wed, 11 Sep 2019 17:08:38 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id E33AE40E84;
 Wed, 11 Sep 2019 17:08:37 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 546AB3601AA;
 Wed, 11 Sep 2019 17:08:37 +0200 (CEST)
Subject: Re: TTM huge page-faults WAS: Re: [RFC PATCH 1/2] x86: Don't let
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
 <cace2653-447f-bcdc-2714-142d9dc85787@shipmail.org>
 <ea486b68-7751-e51f-5a59-7e1f145820f4@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <46a21ca5-a395-e644-9eed-77ea26fc871e@shipmail.org>
Date: Wed, 11 Sep 2019 17:08:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <ea486b68-7751-e51f-5a59-7e1f145820f4@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1568214517; bh=iXS3GPpxTpsS/0BsV1h1Z1UOn1deQj53Xl4MDL0r1Es=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=UnStjuBWdFqAiDUOxNAooUYh9qTARPLWsZrAun876cQiysskITkouXSkMiV9hNo9H
 yUQ1AuE1dL883RxQjgOEFYXego1hdN5ij+QaDi4kdMiVubKj0d7SHtsa6oTePemL5g
 iollE2oXywNd3+UsQkcPONkYX234t7/uKfgSe6Qo=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=UnStjuBW; 
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
Cc: "pv-drivers@vmware.com" <pv-drivers@vmware.com>,
 Thomas Hellstrom <thellstrom@vmware.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOS8xMS8xOSA0OjA2IFBNLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToKPiBBbSAxMS4wOS4x
OSB1bSAxMjoxMCBzY2hyaWViIFRob21hcyBIZWxsc3Ryw7ZtIChWTXdhcmUpOgo+IFtTTklQXQo+
Pj4+IFRoZSBwcm9ibGVtIHNlZW4gaW4gVFRNIGlzIHRoYXQgd2Ugd2FudCB0byBiZSBhYmxlIHRv
IGNoYW5nZSB0aGUKPj4+PiB2bV9wYWdlX3Byb3QgZnJvbSB0aGUgZmF1bHQgaGFuZGxlciwgYnV0
IGl0J3MgcHJvYmxlbWF0aWMgc2luY2Ugd2UKPj4+PiBoYXZlIHRoZSBtbWFwX3NlbSB0eXBpY2Fs
bHkgb25seSBpbiByZWFkIG1vZGUuIEhlbmNlIHRoZSBmYWtlIHZtYQo+Pj4+IGhhY2suIEZyb20g
d2hhdCBJIGNhbiB0ZWxsIGl0J3MgcmVhc29uYWJseSB3ZWxsLWJlaGF2ZWQsIHNpbmNlCj4+Pj4g
cHRlX21vZGlmeSgpIHNraXBzIHRoZSBiaXRzIFRUTSB1cGRhdGVzLCBzbyBtcHJvdGVjdCgpIGFu
ZCBtcmVtYXAoKQo+Pj4+IHdvcmtzIE9LLiBJIHRoaW5rIHNwbGl0X2h1Z2VfcG1kIG1heSBydW4g
aW50byB0cm91YmxlLCBidXQgd2UgZG9uJ3QKPj4+PiBzdXBwb3J0IGl0ICh5ZXQpIHdpdGggVFRN
Lgo+Pj4gQWghIEkgYWN0dWFsbHkgcmFuIGludG8gdGhpcyB3aGlsZSBpbXBsZW1lbnRpbmcgaHVn
ZSBwYWdlIHN1cHBvcnQgZm9yCj4+PiBUVE0gYW5kIG5ldmVyIGZpZ3VyZWQgb3V0IHdoeSB0aGF0
IGRvZXNuJ3Qgd29yay4gRHJvcHBlZCBDUFUgaHVnZSBwYWdlCj4+PiBzdXBwb3J0IGJlY2F1c2Ug
b2YgdGhpcy4KPj4gQnkgaW5jaWRlbnQsIEkgZ290IHNsaWdodGx5IHNpZGV0cmFja2VkIHRoZSBv
dGhlciBkYXkgYW5kIHN0YXJ0ZWQKPj4gbG9va2luZyBhdCB0aGlzIGFzIHdlbGwuIEdvdCB0byB0
aGUgcG9pbnQgd2hlcmUgSSBmaWd1cmVkIG91dCBhbGwgdGhlCj4+IGhhaXJ5IGFsaWdubWVudCBp
c3N1ZXMgYW5kIGFjdHVhbGx5IGdvdCBodWdlX2ZhdWx0KCkgY2FsbHMsIGJ1dCBuZXZlcgo+PiBp
bXBsZW1lbnRlZCB0aGUgaGFuZGxlci4gSSB0aGluayB0aGF0J3MgZGVmaW5pdGVseSBzb21ldGhp
bmcgd29ydGgKPj4gaGF2aW5nLiBOb3Qgc3VyZSBpdCB3aWxsIHdvcmsgZm9yIElPIG1lbW9yeSwg
dGhvdWdoLCAoc3BsaXRfaHVnZV9wbWQKPj4gd2lsbCBqdXN0IHNraXAgbm9uLXBhZ2UtYmFja2Vk
IG1lbW9yeSkgYnV0IGlmIHdlIG9ubHkgc3VwcG9ydAo+PiBWTV9TSEFSRUQgKG5vbiBDT1cpIHZt
YXMgdGhlcmUncyBubyByZWFzb24gdG8gc3BsaXQgdGhlIGh1Z2UgcG1kcwo+PiBhbnl3YXkuIERl
ZmluaXRlbHkgc29tZXRoaW5nIHdlIHNob3VsZCBoYXZlIElNTy4KPiBXZWxsIG91ciBwcmltYXJ5
IHVzZSBjYXNlIHdvdWxkIGJlIElPIG1lbW9yeSwgY2F1c2Ugc3lzdGVtIG1lbW9yeSBpcwo+IG9u
bHkgb3B0aW9uYWxseSBhbGxvY2F0ZSBhcyBodWdlIHBhZ2UgYnV0IHdlIG5lYXJseSBhbHdheXMg
YWxsb2NhdGUgVlJBTQo+IGluIGNodW5rcyBvZiBhdCBsZWFzdCAyTUIgYmVjYXVzZSB3ZSBvdGhl
cndpc2UgZ2V0IGEgaHVnZSBwZXJmb3JtYW5jZQo+IHBlbmFsdHkuCgpCdXQgdGhhdCBzeXN0ZW0g
bWVtb3J5IG9wdGlvbiBpcyBvbiBieSBkZWZhdWx0LCByaWdodD8gSW4gYW55IGNhc2UsIGEgCnJl
cXVlc3QgZm9yIGEgaHVnZV9mYXVsdAp3b3VsZCBwcm9iYWJseSBuZWVkIHRvIGNoZWNrIHRoYXQg
dGhlcmUgaXMgYWN0dWFsbHkgYW4gdW5kZXJseWluZyAKaHVnZV9wYWdlIGFuZCBvdGhlcndpc2Ug
ZmFsbGJhY2sgdG8gb3JkaW5hcnkgZmF1bHRzLgoKQW5vdGhlciByZXF1aXJlbWVudCB3b3VsZCBi
ZSBmb3IgSU8gbWVtb3J5IGFsbG9jYXRpb25zIHRvIGJlIApQTURfUEFHRV9TSVpFIGFsaWduZWQg
aW4gdGhlIG1hcHBhYmxlIGFwZXJ0dXJlLCB0byBhdm9pZCBmYWxsYmFja3MgdG8gCm9yZGluYXJ5
IGZhdWx0cy4gUHJvYmFibHkgaW5jcmVhc2luZyBmcmFnbWVudGF0aW9uIHNvbWV3aGF0LiAoU2Vl
bXMgbGlrZSAKcG1kIGVudHJpZXMgY2FuIG9ubHkgcG9pbnQgdG8gUE1EX1BBR0VfU0laRSBhbGln
bmVkIHBoeXNpY2FsIGFkZHJlc3NlcykgCldvdWxkIHRoYXQgd29yayBmb3IgeW91PwoKPj4+PiBX
ZSBjb3VsZCBwcm9iYWJseSBnZXQgYXdheSB3aXRoIGEgV1JJVEVfT05DRSgpIHVwZGF0ZSBvZiB0
aGUKPj4+PiB2bV9wYWdlX3Byb3QgYmVmb3JlIHRha2luZyB0aGUgcGFnZSB0YWJsZSBsb2NrIHNp
bmNlCj4+Pj4KPj4+PiBhKSBXZSdyZSBsb2NraW5nIG91dCBhbGwgb3RoZXIgd3JpdGVycy4KPj4+
PiBiKSBXZSBjYW4ndCByYWNlIHdpdGggYW5vdGhlciBmYXVsdCB0byB0aGUgc2FtZSB2bWEgc2lu
Y2Ugd2UgaG9sZCBhbgo+Pj4+IGFkZHJlc3Mgc3BhY2UgbG9jayAoImJ1ZmZlciBvYmplY3QgcmVz
ZXJ2YXRpb24iKQo+Pj4+IGMpIFdoZW4gd2UgbmVlZCB0byB1cGRhdGUgdGhlcmUgYXJlIG5vIHZh
bGlkIHBhZ2UgdGFibGUgZW50cmllcyBpbiB0aGUKPj4+PiB2bWEsIHNpbmNlIGl0IG9ubHkgaGFw
cGVucyBkaXJlY3RseSBhZnRlciBtbWFwKCksIG9yIGFmdGVyIGFuCj4+Pj4gdW5tYXBfbWFwcGlu
Z19yYW5nZSgpIHdpdGggdGhlIHNhbWUgYWRkcmVzcyBzcGFjZSBsb2NrLiBXaGVuIGFub3RoZXIK
Pj4+PiByZWFkZXIgKGZvciBleGFtcGxlIHNwbGl0X2h1Z2VfcG1kKCkpIHNlZXMgYSB2YWxpZCBw
YWdlIHRhYmxlIGVudHJ5LAo+Pj4+IGl0IGFsc28gc2VlcyB0aGUgbmV3IHBhZ2UgcHJvdGVjdGlv
biBhbmQgdGhpbmdzIGFyZSBmaW5lLgo+Pj4gWWVhaCwgdGhhdCdzIGV4YWN0bHkgd2h5IEkgYWx3
YXlzIHdvbmRlcmVkIHdoeSB3ZSBuZWVkIHRoaXMgaGFjayB3aXRoCj4+PiB0aGUgdm1hIGNvcHkg
b24gdGhlIHN0YWNrLgo+Pj4KPj4+PiBCdXQgdGhhdCB3b3VsZCByZWFsbHkgYmUgYSBzcGVjaWFs
IGNhc2UuIFRvIHNvbHZlIHRoaXMgcHJvcGVybHkgd2UnZAo+Pj4+IHByb2JhYmx5IG5lZWQgYW4g
YWRkaXRpb25hbCBsb2NrIHRvIHByb3RlY3QgdGhlIHZtX2ZsYWdzIGFuZAo+Pj4+IHZtX3BhZ2Vf
cHJvdCwgdGFrZW4gYWZ0ZXIgbW1hcF9zZW0gYW5kIGlfbW1hcF9sb2NrLgo+Pj4gV2VsbCB3ZSBh
bHJlYWR5IGhhdmUgYSBzcGVjaWFsIGxvY2sgZm9yIHRoaXM6IFRoZSByZXNlcnZhdGlvbiBvYmpl
Y3QuIFNvCj4+PiBtZW1vcnkgYmFycmllcnMgZXRjIHNob3VsZCBiZSBpbiBwbGFjZSBhbmQgSSBh
bHNvIHRoaW5rIHdlIGNhbiBqdXN0Cj4+PiB1cGRhdGUgdGhlIHZtX3BhZ2VfcHJvdCBvbiB0aGUg
Zmx5Lgo+PiBJIGFncmVlLiBUaGlzIGlzIG5lZWRlZCBmb3IgaHVnZSBwYWdlcy4gV2Ugc2hvdWxk
IG1ha2UgdGhpcyBjaGFuZ2UsCj4+IGFuZCBwZXJoYXBzIGFkZCB0aGUganVzdGlmaWNhdGlvbiBh
Ym92ZSBhcyBhIGNvbW1lbnQuCj4gQWx0ZXJuYXRpdmVseSB3ZSBjb3VsZCBpbnRyb2R1Y2UgYSBu
ZXcgVk1fKiBmbGFnIHRlbGxpbmcgdXNlcnMgb2YKPiB2bV9wYWdlX3Byb3QgdG8ganVzdCBsZXQg
dGhlIHBhZ2VzIHRhYmxlIGVudHJpZXMgYmUgZmlsbGVkIGJ5IGZhdWx0cyBhZ2FpbgoKQW4gaW50
ZXJlc3RpbmcgaWRlYSwgYWx0aG91Z2ggd2UnZCBsb3NlIHRoaW5ncyBsaWtlIGRpcnR5LXRyYWNr
aW5nIGJpdHMuCgovVGhvbWFzCgoKPgo+IENocmlzdGlhbi4KCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
