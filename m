Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D878E1B1
	for <lists+dri-devel@lfdr.de>; Thu, 15 Aug 2019 02:10:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EAAC6E87A;
	Thu, 15 Aug 2019 00:10:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7996E877;
 Thu, 15 Aug 2019 00:09:59 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d54a2d90000>; Wed, 14 Aug 2019 17:10:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 14 Aug 2019 17:09:59 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 14 Aug 2019 17:09:59 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 15 Aug
 2019 00:09:55 +0000
Subject: Re: turn hmm migrate_vma upside down v3
To: Christoph Hellwig <hch@lst.de>, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?=
 <jglisse@redhat.com>, Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs
 <bskeggs@redhat.com>
References: <20190814075928.23766-1-hch@lst.de>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <8e3b17ef-0b9e-6866-128f-403c8ba3a322@nvidia.com>
Date: Wed, 14 Aug 2019 17:09:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190814075928.23766-1-hch@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565827801; bh=UFE11LA+ZDd79e7Fh4F3PTQQo4YwL9Cl4D835Utwz2E=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=hTvydnEs0xSSVJWPajFZPOOuonANGrVb61PcnHEcdZAa1Izsz9/gKb19ZA98X8SzE
 AvqduFk9EUWUOqgXmyGPSL5MQbVY4v/pzouHJDVQk9niKC3bZiG1TXDZv99HcXZFeO
 JNO6B/xaf/pGhk5df1D+EvN7msxDZUFjg01SoQ7+73tpn3RJ+XwxPfvKKCmivQeIsy
 dDWNjuOZOKhNMMMStclR1bhAFqwIy8eXpTgWYcWh6BlSWM44vpQgH/OgbRe24ZBOcA
 yfx9TUJlXzKMfQWSJDMBK+DLGwIcpX57KXDaDNMZN21bi3WpHUr2NJY0xjwWi+KLja
 gUC703gAIO5Ug==
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTQvMTkgMTI6NTkgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IEhpIErDqXLD
tG1lLCBCZW4gYW5kIEphc29uLAo+IAo+IGJlbG93IGlzIGEgc2VyaWVzIGFnYWluc3QgdGhlIGht
bSB0cmVlIHdoaWNoIHN0YXJ0cyByZXZhbXBpbmcgdGhlCj4gbWlncmF0ZV92bWEgZnVuY3Rpb25h
bGl0eS4gIFRoZSBwcmltZSBpZGVhIGlzIHRvIGV4cG9ydCB0aHJlZSBzbGlnaHRseQo+IGxvd2Vy
IGxldmVsIGZ1bmN0aW9ucyBhbmQgdGh1cyBhdm9pZCB0aGUgbmVlZCBmb3IgbWlncmF0ZV92bWFf
b3BzCj4gY2FsbGJhY2tzLgo+IAo+IERpZmZzdGF0Ogo+IAo+ICAgICAgNyBmaWxlcyBjaGFuZ2Vk
LCAyODIgaW5zZXJ0aW9ucygrKSwgNjE0IGRlbGV0aW9ucygtKQo+IAo+IEEgZ2l0IHRyZWUgaXMg
YWxzbyBhdmFpbGFibGUgYXQ6Cj4gCj4gICAgICBnaXQ6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vy
cy9oY2gvbWlzYy5naXQgbWlncmF0ZV92bWEtY2xlYW51cC4zCj4gCj4gR2l0d2ViOgo+IAo+ICAg
ICAgaHR0cDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdC9zaG9ydGxvZy9y
ZWZzL2hlYWRzL21pZ3JhdGVfdm1hLWNsZWFudXAuMwo+IAo+IAo+IENoYW5nZXMgc2luY2UgdjI6
Cj4gICAtIGRvbid0IHVubWFwIHBhZ2VzIHdoZW4gcmV0dXJuaW5nIDAgZnJvbSBub3V2ZWF1X2Rt
ZW1fbWlncmF0ZV90b19yYW0KPiAgIC0gbWlub3Igc3R5bGUgZml4ZXMKPiAgIC0gYWRkIGEgbmV3
IHBhdGNoIHRvIHJlbW92ZSBDT05GSUdfTUlHUkFURV9WTUFfSEVMUEVSCj4gCj4gQ2hhbmdlcyBz
aW5jZSB2MToKPiAgIC0gZml4IGEgZmV3IHdoaXRlc3BhY2UgaXNzdWVzCj4gICAtIGRyb3AgdGhl
IHBhdGNoIHRvIHJlbW92ZSBNSUdSQVRFX1BGTl9XUklURSBmb3Igbm93Cj4gICAtIHZhcmlvdXMg
c3BlbGxpbmcgZml4ZXMKPiAgIC0gY2xlYXIgY3BhZ2VzIGFuZCBucGFnZXMgaW4gbWlncmF0ZV92
bWFfc2V0dXAKPiAgIC0gZml4IHRoZSBub3V2ZWF1X2RtZW1fZmF1bHRfY29weV9vbmUgcmV0dXJu
IHZhbHVlCj4gICAtIG1pbm9yIGltcHJvdmVtZW50cyB0byBzb21lIG5vdXZlYXUgaW50ZXJuYWwg
Y2FsbGluZyBjb252ZW50aW9ucwo+IAoKU29tZSBvZiB0aGUgcGF0Y2hlcyBzZWVtIHRvIGhhdmUg
YmVlbiBtYW5nbGVkIGluIHRoZSBtYWlsLgpJIHdhcyBhYmxlIHRvIGVkaXQgdGhlbSBhbmQgYXBw
bHkgdG8gSmFzb24ncyB0cmVlCmh0dHBzOi8vZ2l0aHViLmNvbS9qZ3VudGhvcnBlL2xpbnV4Lmdp
dCBtbXVfbm90aWZpZXIgYnJhbmNoLgpTbyBmb3IgdGhlIHNlcmllcyB5b3UgY2FuIGFkZDoKClRl
c3RlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
