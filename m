Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0F349A0B
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 09:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9FD46E0F4;
	Tue, 18 Jun 2019 07:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ale.deltatee.com (ale.deltatee.com [207.54.116.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18ECF6E090;
 Mon, 17 Jun 2019 20:08:19 +0000 (UTC)
Received: from guinness.priv.deltatee.com ([172.16.1.162])
 by ale.deltatee.com with esmtp (Exim 4.89)
 (envelope-from <logang@deltatee.com>)
 id 1hcxvM-0004o2-QE; Mon, 17 Jun 2019 14:08:17 -0600
To: Christoph Hellwig <hch@lst.de>, Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-9-hch@lst.de>
From: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <d68c5e4c-b2de-95c3-0b75-1f2391b25a34@deltatee.com>
Date: Mon, 17 Jun 2019 14:08:14 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190617122733.22432-9-hch@lst.de>
Content-Language: en-CA
X-SA-Exim-Connect-IP: 172.16.1.162
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-nvdimm@lists.01.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-mm@kvack.org, bskeggs@redhat.com,
 jgg@mellanox.com, jglisse@redhat.com, dan.j.williams@intel.com, hch@lst.de
X-SA-Exim-Mail-From: logang@deltatee.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on ale.deltatee.com
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
Subject: Re: [PATCH 08/25] memremap: move dev_pagemap callbacks into a
 separate structure
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on ale.deltatee.com)
X-Mailman-Approved-At: Tue, 18 Jun 2019 07:12:01 +0000
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

CgpPbiAyMDE5LTA2LTE3IDY6MjcgYS5tLiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvcGNpL3AycGRtYS5jIGIvZHJpdmVycy9wY2kvcDJwZG1hLmMKPiBp
bmRleCBhOTgxMjZhZDljM2EuLmUwODM1NjdkMjZlZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Bj
aS9wMnBkbWEuYwo+ICsrKyBiL2RyaXZlcnMvcGNpL3AycGRtYS5jCj4gQEAgLTEwMCw3ICsxMDAs
NyBAQCBzdGF0aWMgdm9pZCBwY2lfcDJwZG1hX3BlcmNwdV9jbGVhbnVwKHN0cnVjdCBwZXJjcHVf
cmVmICpyZWYpCj4gIAlzdHJ1Y3QgcDJwZG1hX3BhZ2VtYXAgKnAycF9wZ21hcCA9IHRvX3AycF9w
Z21hcChyZWYpOwo+ICAKPiAgCXdhaXRfZm9yX2NvbXBsZXRpb24oJnAycF9wZ21hcC0+cmVmX2Rv
bmUpOwo+IC0JcGVyY3B1X3JlZl9leGl0KCZwMnBfcGdtYXAtPnJlZik7Cj4gKwlwZXJjcHVfcmVm
X2V4aXQocmVmKTsKPiAgfQo+ICAKPiAgc3RhdGljIHZvaWQgcGNpX3AycGRtYV9yZWxlYXNlKHZv
aWQgKmRhdGEpCj4gQEAgLTE1Miw2ICsxNTIsMTEgQEAgc3RhdGljIGludCBwY2lfcDJwZG1hX3Nl
dHVwKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+ICAJcmV0dXJuIGVycm9yOwo+ICB9Cj4gIAo+ICtz
dGF0aWMgY29uc3Qgc3RydWN0IGRldl9wYWdlbWFwX29wcyBwY2lfcDJwZG1hX3BhZ2VtYXBfb3Bz
ID0gewo+ICsJLmtpbGwJCT0gcGNpX3AycGRtYV9wZXJjcHVfa2lsbCwKPiArCS5jbGVhbnVwCT0g
cGNpX3AycGRtYV9wZXJjcHVfY2xlYW51cCwKPiArfTsKPiArCj4gIC8qKgo+ICAgKiBwY2lfcDJw
ZG1hX2FkZF9yZXNvdXJjZSAtIGFkZCBtZW1vcnkgZm9yIHVzZSBhcyBwMnAgbWVtb3J5Cj4gICAq
IEBwZGV2OiB0aGUgZGV2aWNlIHRvIGFkZCB0aGUgbWVtb3J5IHRvCj4gQEAgLTIwNyw4ICsyMTIs
NiBAQCBpbnQgcGNpX3AycGRtYV9hZGRfcmVzb3VyY2Uoc3RydWN0IHBjaV9kZXYgKnBkZXYsIGlu
dCBiYXIsIHNpemVfdCBzaXplLAo+ICAJcGdtYXAtPnR5cGUgPSBNRU1PUllfREVWSUNFX1BDSV9Q
MlBETUE7Cj4gIAlwZ21hcC0+cGNpX3AycGRtYV9idXNfb2Zmc2V0ID0gcGNpX2J1c19hZGRyZXNz
KHBkZXYsIGJhcikgLQo+ICAJCXBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCBiYXIpOwo+IC0JcGdt
YXAtPmtpbGwgPSBwY2lfcDJwZG1hX3BlcmNwdV9raWxsOwo+IC0JcGdtYXAtPmNsZWFudXAgPSBw
Y2lfcDJwZG1hX3BlcmNwdV9jbGVhbnVwOwoKSSBqdXN0IG5vdGljZWQgdGhpcyBpcyBtaXNzaW5n
IGEgbGluZSB0byBzZXQgcGdtYXAtPm9wcyB0bwpwY2lfcDJwZG1hX3BhZ2VtYXBfb3BzLiBJIG11
c3QgaGF2ZSBnb3R0ZW4gY29uZnVzZWQgYnkgdGhlIG90aGVyIHVzZXJzCmluIG15IG9yaWdpbmFs
IHJldmlldy4gVGhvdWdoIEknbSBub3Qgc3VyZSBob3cgdGhpcyBjb21waWxlcyBhcyB0aGUgbmV3
CnN0cnVjdCBpcyBzdGF0aWMgYW5kIHVudXNlZC4gSG93ZXZlciwgaXQgaXMgcmVuZGVyZWQgbW9v
dCBpbiBQYXRjaCAxNgp3aGVuIHRoaXMgaXMgYWxsIHJlbW92ZWQuCgpMb2dhbgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
