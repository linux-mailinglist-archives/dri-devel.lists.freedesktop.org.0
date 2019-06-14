Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A84A4562B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 09:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 625C0898A3;
	Fri, 14 Jun 2019 07:23:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1492892F8;
 Fri, 14 Jun 2019 01:53:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d02fe0e0005>; Thu, 13 Jun 2019 18:53:19 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 13 Jun 2019 18:53:18 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 13 Jun 2019 18:53:18 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 14 Jun
 2019 01:53:15 +0000
Subject: Re: [Nouveau] [PATCH 22/22] mm: don't select MIGRATE_VMA_HELPER from
 HMM_MIRROR
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>, Jason Gunthorpe
 <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-23-hch@lst.de>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <7f6c6837-93cd-3b89-63fb-7a60d906c70c@nvidia.com>
Date: Thu, 13 Jun 2019 18:53:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613094326.24093-23-hch@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL106.nvidia.com (172.18.146.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 14 Jun 2019 07:22:30 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1560477199; bh=wfrTohx7F8pzBumLpEjaUQ9N1cFt17QeYAZ9KiQw55o=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=M5oN6C8eycwH3ddNUoY7Cl0CYJ9M/JxsSi8COG6+zA3vleXm4hLAieJyd+Rnz+XkO
 InXDP5bP6dg2R5z3V6QmIUAmqLRdfEEPnoHe11DQdqPOWEHe/dXotRaVsozwyC2/UP
 xDBwMimCe618+axfU5Zd0Qi9Sdyc7jV9iEEzHuNuDhCf0KA4IYYIilK0/UogG1t7ci
 H9FdBc2bPm+OVbr206w3w8msAwL3yKIwNn9F7Tj/HK8hN79yf7fVDe++57Ay62brrv
 OTzs1WriOqHqdV4jj8ahLriHk1fr8Yt+cbZgV9a0zp+uG1qklpiRLsN8+Vm//XjXMt
 Z2NZgCNIR4PKQ==
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMy8xOSAyOjQzIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBUaGUgbWlncmF0
ZV92bWEgaGVscGVyIGlzIG9ubHkgdXNlZCBieSBub3ZlYXUgdG8gbWlncmF0ZSBkZXZpY2UgcHJp
dmF0ZQo+IHBhZ2VzIGFyb3VuZC4gIE90aGVyIEhNTV9NSVJST1IgdXNlcnMgbGlrZSBhbWRncHUg
b3IgaW5maW5pYmFuZCBkb24ndAo+IG5lZWQgaXQuCj4gCj4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0
b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L0tjb25maWcgfCAxICsKPiAgbW0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8IDEgLQo+
ICAyIGZpbGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9LY29uZmlnCj4gaW5kZXggNjZjODM5ZDhlOWQxLi45NmI5ODE0ZTZkMDYgMTAw
NjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcKPiBAQCAtODgsNiArODgsNyBAQCBjb25maWcgRFJN
X05PVVZFQVVfU1ZNCj4gIAlkZXBlbmRzIG9uIERSTV9OT1VWRUFVCj4gIAlkZXBlbmRzIG9uIEhN
TV9NSVJST1IKPiAgCWRlcGVuZHMgb24gU1RBR0lORwo+ICsJc2VsZWN0IE1JR1JBVEVfVk1BX0hF
TFBFUgo+ICAJZGVmYXVsdCBuCj4gIAloZWxwCj4gIAkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQg
dG8gZW5hYmxlIGV4cGVyaW1lbnRhbCBzdXBwb3J0IGZvcgo+IGRpZmYgLS1naXQgYS9tbS9LY29u
ZmlnIGIvbW0vS2NvbmZpZwo+IGluZGV4IDczNjc2Y2I0NjkzZi4uZWNhODg2NzliNjI0IDEwMDY0
NAo+IC0tLSBhL21tL0tjb25maWcKPiArKysgYi9tbS9LY29uZmlnCj4gQEAgLTY3OSw3ICs2Nzks
NiBAQCBjb25maWcgSE1NX01JUlJPUgo+ICAJYm9vbCAiSE1NIG1pcnJvciBDUFUgcGFnZSB0YWJs
ZSBpbnRvIGEgZGV2aWNlIHBhZ2UgdGFibGUiCj4gIAlkZXBlbmRzIG9uIE1NVQo+ICAJc2VsZWN0
IE1NVV9OT1RJRklFUgo+IC0Jc2VsZWN0IE1JR1JBVEVfVk1BX0hFTFBFUgo+ICAJaGVscAo+ICAJ
ICBTZWxlY3QgSE1NX01JUlJPUiBpZiB5b3Ugd2FudCB0byBtaXJyb3IgcmFuZ2Ugb2YgdGhlIENQ
VSBwYWdlIHRhYmxlIG9mIGEKPiAgCSAgcHJvY2VzcyBpbnRvIGEgZGV2aWNlIHBhZ2UgdGFibGUu
IEhlcmUsIG1pcnJvciBtZWFucyAia2VlcCBzeW5jaHJvbml6ZWQiLgo+IAoKRm9yIHRob3NlIHdo
byBoYXZlIG91dCBvZiB0cmVlIGRyaXZlcnMgdGhhdCBuZWVkIG1pZ3JhdGVfdm1hKCksIGJ1dCBh
cmUgbm90Ck5vdXZlYXUsIGNvdWxkIHdlIHByZXR0eSBwbGVhc2UgYWxsb3cgYSB3YXkgdG8gc2Vs
ZWN0IHRoYXQgaW5kZXBlbmRlbnRseT8KCkl0J3Mgbm90IGEgYmlnIGRlYWwsIGFzIEkgZXhwZWN0
IHRoZSBOb3V2ZWF1IG9wdGlvbiB3aWxsIG5vcm1hbGx5IGJlIHNlbGVjdGVkLCAKYnV0IGl0IHdv
dWxkIGJlIG5pY2UuIEJlY2F1c2UgdGhlcmUgaXMgYSB2YWxpZCBjb25maWd1cmF0aW9uIHRoYXQg
aW52b2x2ZXMgCk5vdXZlYXUgbm90IGJlaW5nIHNlbGVjdGVkLCBidXQgb3VyIGRyaXZlciBzdGls
bCB3YW50aW5nIHRvIHJ1bi4KCk1heWJlIHdlIGNhbiBhZGQgc29tZXRoaW5nIGxpa2UgdGhpcyBv
biB0b3Agb2Ygd2hhdCB5b3UgaGF2ZT8KCmRpZmYgLS1naXQgYS9tbS9LY29uZmlnIGIvbW0vS2Nv
bmZpZwppbmRleCBlY2E4ODY3OWI2MjQuLjMzMDk5NjYzMjUxMyAxMDA2NDQKLS0tIGEvbW0vS2Nv
bmZpZworKysgYi9tbS9LY29uZmlnCkBAIC02NzAsNyArNjcwLDEwIEBAIGNvbmZpZyBaT05FX0RF
VklDRQogICAgICAgICAgSWYgRlNfREFYIGlzIGVuYWJsZWQsIHRoZW4gc2F5IFkuCiAKIGNvbmZp
ZyBNSUdSQVRFX1ZNQV9IRUxQRVIKLSAgICAgICBib29sCisgICAgICAgYm9vbCAibWlncmF0ZV92
bWEoKSBoZWxwZXIgcm91dGluZSIKKyAgICAgICBoZWxwCisgICAgICAgICBQcm92aWRlcyBhIG1p
Z3JhdGVfdm1hKCkgcm91dGluZSB0aGF0IEdQVXMgYW5kIG90aGVyCisgICAgICAgICBkZXZpY2Ug
ZHJpdmVycyBtYXkgbmVlZC4KIAogY29uZmlnIERFVl9QQUdFTUFQX09QUwogICAgICAgIGJvb2wK
CgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
