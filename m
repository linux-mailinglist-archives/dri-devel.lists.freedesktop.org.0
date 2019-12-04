Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C1A112E96
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 16:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 373E56E919;
	Wed,  4 Dec 2019 15:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa2.bahnhof.se (pio-pvt-msa2.bahnhof.se [79.136.2.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 039566E919
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 15:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTP id 31F713F390;
 Wed,  4 Dec 2019 16:36:43 +0100 (CET)
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
 with ESMTP id JTceQxKzietN; Wed,  4 Dec 2019 16:36:42 +0100 (CET)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by pio-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id 0740A3F413;
 Wed,  4 Dec 2019 16:36:36 +0100 (CET)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 11D4D360608;
 Wed,  4 Dec 2019 16:36:36 +0100 (CET)
Subject: Re: [PATCH 6/8] drm: Add a drm_get_unmapped_area() helper
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20191203132239.5910-1-thomas_os@shipmail.org>
 <20191203132239.5910-7-thomas_os@shipmail.org>
 <e091063c-2c4a-866e-acdb-9efb1e20d737@amd.com>
 <98af5b11-1034-91fa-aa38-5730f116d1cd@shipmail.org>
 <3cc5b796-20c6-9f4c-3f62-d844f34d81b7@amd.com>
 <90a8d09a-b3ab-cd00-0cfb-1a4c72e91836@shipmail.org>
 <016a9187-1703-2d7d-0114-7fc0cbf1d121@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?= <thomas_os@shipmail.org>
Organization: VMware Inc.
Message-ID: <14f319fd-e2ca-8f13-7bb8-4452f58c6c7e@shipmail.org>
Date: Wed, 4 Dec 2019 16:36:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <016a9187-1703-2d7d-0114-7fc0cbf1d121@amd.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=shipmail.org; s=mail; 
 t=1575473796; bh=+P2lL4Bk8IOmIyYiEAJEi2EHSZtLBY0TVxFIVaQgcJw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=a3Sxiu0aBnFV7FZPZMCsRIPHG0lgkyWS4ulmn+2AkMNL2HcwAlL+eOHXKZKWy4AYc
 sHYuIN8rny3O1VEDgLtSXHJBMKEBr+DeLhRYl6yjuij2krolQhyGaEn4QJbQK1P56/
 7blMjZ0b3gt5051zqvAUhaJajkzQP/WLvvJ0XMbc=
X-Mailman-Original-Authentication-Results: pio-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b=a3Sxiu0a; 
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
Cc: Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 pv-drivers@vmware.com, Ralph Campbell <rcampbell@nvidia.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com,
 Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvNC8xOSAzOjQwIFBNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+IEFtIDA0LjEyLjE5
IHVtIDEzOjMyIHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+IE9uIDEyLzQv
MTkgMTowOCBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+IEFtIDA0LjEyLjE5IHVtIDEy
OjM2IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKFZNd2FyZSk6Cj4+Pj4gT24gMTIvNC8xOSAx
MjoxMSBQTSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPj4+Pj4gQW0gMDMuMTIuMTkgdW0gMTQ6
MjIgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJlKToKPj4+Pj4+IEZyb206IFRob21h
cyBIZWxsc3Ryb20gPHRoZWxsc3Ryb21Adm13YXJlLmNvbT4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIGhl
bHBlciBpcyB1c2VkIHRvIGFsaWduIHVzZXItc3BhY2UgYnVmZmVyIG9iamVjdCBhZGRyZXNzZXMg
dG8KPj4+Pj4+IGh1Z2UgcGFnZSBib3VuZGFyaWVzLCBtaW5pbWl6aW5nIHRoZSBjaGFuY2Ugb2Yg
YWxpZ25tZW50IG1pc21hdGNoCj4+Pj4+PiBiZXR3ZWVuIHVzZXItc3BhY2UgYWRkcmVzc2VzIGFu
ZCBwaHlzaWNhbCBhZGRyZXNzZXMuCj4+Pj4+Cj4+Pj4+IE1obSwgSSdtIHdvbmRlcmluZyBpZiB0
aGF0IGlzIHJlYWxseSBzdWNoIGEgZ29vZCBpZGVhLgo+Pj4+Cj4+Pj4gQ291bGQgeW91IGVsYWJv
cmF0ZT8gV2hhdCBkcmF3YmFja3MgZG8geW91IHNlZT8KPj4+Cj4+PiBNYWluIHByb2JsZW0gZm9y
IG1lIHNlZW1zIHRvIGJlIHRoYXQgSSBkb24ndCBmdWxseSB1bmRlcnN0YW5kIHdoYXQgCj4+PiB0
aGUgZ2V0X3VubWFwcGVkX2FyZWEgY2FsbGJhY2sgaXMgZG9pbmcuCj4+Cj4+IEl0IG1ha2VzIHN1
cmUgdGhhdCwgaWYgdGhlcmUgaXMgYSBjaGFuY2UgdGhhdCB3ZSBjb3VsZCB1c2UgaHVnZSAKPj4g
cGFnZS10YWJsZSBlbnRyaWVzLCB2aXJ0dWFsIGFkZHJlc3MgaHVnZSBwYWdlIGJvdW5kYXJpZXMg
YXJlIAo+PiBwZXJmZWN0bHkgYWxpZ25lZCB0byBwaHlzaWNhbCBhZGRyZXNzIGh1Z2UgcGFnZSBi
b3VuZGFyaWVzLCB3aGljaCBpcyAKPj4gaWYgbm90IGEgQ1BVIGhhcmR3YXJlIHJlcXVpcmVtZW50
LCBhdCBsZWFzdCBhIGtlcm5lbCByZXF1aXJlbWVudCAKPj4gY3VycmVudGx5Lgo+Pgo+Pgo+Pj4K
Pj4+IEZvciBleGFtcGxlIHdoeSBkbyB3ZSBuZWVkIHRvIHVzZSBkcm1fdm1hX29mZnNldF9sb29r
dXBfbG9ja2VkKCkgdG8gCj4+PiBhZGp1c3QgdGhlIHBnb2ZmPwo+Pj4KPj4+IFRoZSBtYXBwZWQg
b2Zmc2V0IHNob3VsZCBiZSBjb21wbGV0ZWx5IGlycmVsZXZhbnQgZm9yIGZpbmRpbmcgc29tZSAK
Pj4+IHBpZWNlIG9mIHVzZXJzcGFjZSBhZGRyZXNzIHNwYWNlIG9yIGFtIEkgdG90YWxseSBvZmYg
aGVyZT8KPj4KPj4KPj4gQmVjYXVzZSB0aGUgdW5tb2RpZmllZCBwZ29mZiBhc3N1bWVzIHRoYXQg
cGh5c2ljYWwgYWRkcmVzcyBib3VuZGFyaWVzIAo+PiBhcmUgcGVyZmVjdGx5IGFsaWduZWQgd2l0
aCBmaWxlIG9mZnNldCBib3VuZGFyaWVzLCB3aGljaCBpcyB0eXBpY2FsIAo+PiBmb3IgYWxsIG90
aGVyIHN1YnN5c3RlbXMuCj4+Cj4+IFRoYXQncyBub3QgdHJ1ZSBmb3IgVFRNLCBob3dldmVyLCB3
aGVyZSBhIGJ1ZmZlciBvYmplY3Qgc3RhcnQgCj4+IHBoeXNpY2FsIGFkZHJlc3MgbWF5IGJlIGh1
Z2UgcGFnZSBhbGlnbmVkLCBidXQgdGhlIGZpbGUgb2Zmc2V0IGlzIAo+PiBhbHdheXMgcGFnZSBh
bGlnbmVkLiBXZSBjb3VsZCBvZiBjb3Vyc2UgY2hhbmdlIHRoYXQgdG8gYWxpZ24gYWxzbyAKPj4g
ZmlsZSBvZmZzZXRzIHRvIGh1Z2UgcGFnZSBzaXplIGJvdW5kYXJpZXMsIGJ1dCB3aXRoIHRoZSBh
Ym92ZSAKPj4gYWRqdXN0bWVudCwgdGhhdCdzIG5vdCBuZWVkZWQuIEkgb3B0ZWQgZm9yIHRoZSBh
ZGp1c3RtZW50Lgo+Cj4gSSB3b3VsZCBvcHQgZm9yIGFsaWduaW5nIHRoZSBmaWxlIG9mZnNldHMg
aW5zdGVhZC4KClllcyBidXQgdGhhdCBhZGRzIGFkZGl0aW9uYWwgY29tcGxleGl0eSBhbmQgY29u
c2lkZXJhdGlvbnMgd2hpY2ggbWFkZSBtZSAKdGhpbmsgdGhhdCBsb29rdXAgd2FzIHRoZSBieSBm
YXIgc2ltcGxlc3QgY2hvaWNlOgoKLSBXZSBuZWVkIHRvIG1vZGlmeSB0aGUgdm1hIG1hbmFnZXIg
dG8gY2FyZSBhYm91dCBhbGlnbm1lbnRzLgotIEZyYWdtZW50YXRpb24gaXNzdWVzLiBEbyB3ZSB3
YW50IHRvIGFsaWduID4gMUcgQk9zCi0gRm9yIHdoaWNoIGRyaXZlcnMgZG8gd2Ugd2FudCB0byBk
byB0aGlzLCBob3cgZG8gd2UgaGFuZGxlIGRyaXZlcnMgdGhhdCAKd2FudCB0byBvcHQgb3V0IGlu
IFRUTSBtbWFwKCk/Ci0gTm9uIFRUTSBkcml2ZXJzLiBDb3VsZCB0aGV5IHN0aWxsIHJldXNlIHRo
ZSBzYW1lIGdldF91bm1hcHBlZF9hcmVhLgoKPgo+IE5vdyB0aGF0IHlvdSBleHBsYWluZWQgaXQg
dGhhdCB0aGUgcmVzdCBvZiB0aGUga2VybmVsIGVuZm9yY2VzIHRoaXMgCj4gYWN0dWFsbHkgbWFr
ZXMgc2Vuc2UuCgpTbyBpcyB0aGF0IGFuIGFjaz8KCgpUaGFua3MsCgpUaG9tYXMKCgoKPgo+IFJl
Z2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4+Cj4+IFRoYW5rcywKPj4KPj4gVGhvbWFzCj4+Cj4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
