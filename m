Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8A2349940
	for <lists+dri-devel@lfdr.de>; Thu, 25 Mar 2021 19:13:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53AB46EDF7;
	Thu, 25 Mar 2021 18:13:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pio-pvt-msa1.bahnhof.se (pio-pvt-msa1.bahnhof.se [79.136.2.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 266AB6EDF7
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Mar 2021 18:13:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 1B9DE3F58A;
 Thu, 25 Mar 2021 19:13:39 +0100 (CET)
Authentication-Results: pio-pvt-msa1.bahnhof.se; dkim=pass (1024-bit key;
 unprotected) header.d=shipmail.org header.i=@shipmail.org header.b="bOXPgDuL";
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.1
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 URIBL_BLOCKED=0.001] autolearn=ham autolearn_force=no
Received: from pio-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (pio-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 36X5fsGQR3cs; Thu, 25 Mar 2021 19:13:38 +0100 (CET)
Received: by pio-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id D7A783F377;
 Thu, 25 Mar 2021 19:13:36 +0100 (CET)
Received: from [10.249.254.165] (unknown [192.198.151.44])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 880B636059E;
 Thu, 25 Mar 2021 19:13:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1616696016; bh=ccthR8+3Hk5Ox8PeQv8Va4F118+/tBSCEPzJg3VAxZs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=bOXPgDuLyt0NMxRDWcFUkrudDGfPZJamxR9X+vliH4e3m8vKYTc82qLVR8olQEqM8
 hcUxNVANfDq+5Nctk1NCiDllhxuzOm4XGIHFqcLQXqRHDFnlY2Vx6P+zBjxrbpuxD8
 EqoNkJCXBXHo0CgJvGJiCHN4wBh83heMYUFA76xg=
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-2-thomas_os@shipmail.org>
 <ec99146c7abc35d16b245816aba3e9d14862e624.camel@intel.com>
 <c2239da2-c514-2c88-c671-918909cdba6b@shipmail.org>
 <YFsNRIUYrwVQanVF@phenom.ffwll.local>
 <a1fa7fa2-914b-366d-9902-e5b784e8428c@shipmail.org>
 <75423f64-adef-a2c4-8e7d-2cb814127b18@intel.com>
 <e5199438-9a0d-2801-f9f6-ceb13d7a9c61@shipmail.org>
 <6b0de827-738d-b3c5-fc79-8ca9047bad35@intel.com>
 <9f789d64-940f-c728-8d5e-aab74d562fb6@shipmail.org>
 <20210325175504.GH2356281@nvidia.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
Message-ID: <1ed48d99-1cd9-d87b-41dd-4169afc77f70@shipmail.org>
Date: Thu, 25 Mar 2021 19:13:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210325175504.GH2356281@nvidia.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dave Hansen <dave.hansen@intel.com>, "Williams,
 Dan J" <dan.j.williams@intel.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMjUvMjEgNjo1NSBQTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+IE9uIFRodSwgTWFy
IDI1LCAyMDIxIGF0IDA2OjUxOjI2UE0gKzAxMDAsIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkg
d3JvdGU6Cj4+IE9uIDMvMjQvMjEgOToyNSBQTSwgRGF2ZSBIYW5zZW4gd3JvdGU6Cj4+PiBPbiAz
LzI0LzIxIDE6MjIgUE0sIFRob21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4+Pj4+IFdl
IGFsc28gaGF2ZSBub3QgYmVlbiBjYXJlZnVsIGF0ICphbGwqIGFib3V0IGhvdyBfUEFHRV9CSVRf
U09GVFcqIGFyZQo+Pj4+PiB1c2VkLsKgIEl0J3MgcXVpdGUgcG9zc2libGUgd2UgY2FuIGVuY29k
ZSBhbm90aGVyIHVzZSBldmVuIGluIHRoZQo+Pj4+PiBleGlzdGluZyBiaXRzLgo+Pj4+Pgo+Pj4+
PiBQZXJzb25hbGx5LCBJJ2QganVzdCB0cnk6Cj4+Pj4+Cj4+Pj4+ICNkZWZpbmUgX1BBR0VfQklU
X1NPRlRXNcKgwqDCoMKgwqDCoMKgIDU3wqDCoMKgwqDCoCAvKiBhdmFpbGFibGUgZm9yIHByb2dy
YW1tZXIgKi8KPj4+Pj4KPj4+PiBPSywgSSdsbCBmb2xsb3cgeW91ciBhZHZpc2UgaGVyZS4gRldJ
VyBJIGdyZXBwZWQgZm9yIFNXMSBhbmQgaXQgc2VlbXMKPj4+PiB1c2VkIGluIGEgc2VsZnRlc3Qs
IGJ1dCBvbmx5IGZvciBQVEVzIEFGQUlDVC4KPj4+Pgo+Pj4+IE9oLCBhbmQgd2UgZG9uJ3QgY2Fy
ZSBhYm91dCAzMi1iaXQgbXVjaCBhbnltb3JlPwo+Pj4gT24geDg2LCB3ZSBoYXZlIDY0LWJpdCBQ
VEVzIHdoZW4gcnVubmluZyAzMi1iaXQga2VybmVscyBpZiBQQUUgaXMKPj4+IGVuYWJsZWQuICBJ
T1csIHdlIGNhbiBoYW5kbGUgdGhlIG1ham9yaXR5IG9mIDMyLWJpdCBDUFVzIG91dCB0aGVyZS4K
Pj4+Cj4+PiBCdXQsIHllYWgsIHdlIGRvbid0IGNhcmUgYWJvdXQgMzItYml0LiA6KQo+PiBIbW0s
Cj4+Cj4+IEFjdHVhbGx5IGl0IG1ha2VzIHNvbWUgc2Vuc2UgdG8gdXNlIFNXMSwgdG8gbWFrZSBp
dCBlbmQgdXAgaW4gdGhlIHNhbWUgZHdvcmQKPj4gYXMgdGhlIFBTRSBiaXQsIGFzIGZyb20gd2hh
dCBJIGNhbiB0ZWxsLCByZWFkaW5nIG9mIGEgNjQtYml0IHBtZF90IG9uIDMyLWJpdAo+PiBQQUUg
aXMgbm90IGF0b21pYywgc28gaW4gdGhlb3J5IGEgaHVnZSBwbWQgY291bGQgYmUgbW9kaWZpZWQg
d2hpbGUgcmVhZGluZwo+PiB0aGUgcG1kX3QgbWFraW5nIHRoZSBkd29yZHMgaW5jb25zaXN0ZW50
Li4uLiBIb3cgZG9lcyB0aGF0IHdvcmsgd2l0aCBmYXN0Cj4+IGd1cCBhbnl3YXk/Cj4gSXQgbG9v
cHMgdG8gZ2V0IGFuIGF0b21pYyA2NCBiaXQgdmFsdWUgaWYgdGhlIGFyY2ggY2FuJ3QgcHJvdmlk
ZSBhbgo+IGF0b21pYyA2NCBiaXQgbG9hZAoKSG1tLCBvaywgSSBzZWUgYSBSRUFEX09OQ0UoKSBp
biBndXBfcG1kX3JhbmdlKCksIGFuZCB0aGVuIHRoZSByZXN1bHRpbmcgCnBtZCBpcyBkZXJlZmVy
ZW5jZWQgZWl0aGVyIGluIHRyeV9ncmFiX2NvbXBvdW5kX2hlYWQoKSBvciAKX19ndXBfZGV2aWNl
X2h1Z2UoKSwgYmVmb3JlIHRoZSBwbWQgaXMgY29tcGFyZWQgdG8gdGhlIHZhbHVlIHRoZSBwb2lu
dGVyIAppcyBjdXJyZW50bHkgcG9pbnRpbmcgdG8uIENvdWxkbid0IHRob3NlIGRlcmVmZXJlbmNl
cyBiZSBvbiBpbnZhbGlkIApwb2ludGVycz8KCi9UaG9tYXMKCj4KPiBKYXNvbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
