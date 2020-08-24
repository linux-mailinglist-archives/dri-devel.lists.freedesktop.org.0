Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EDB2512FE
	for <lists+dri-devel@lfdr.de>; Tue, 25 Aug 2020 09:21:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B11BE6E874;
	Tue, 25 Aug 2020 07:21:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 837 seconds by postgrey-1.36 at gabe;
 Mon, 24 Aug 2020 22:10:18 UTC
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A43E6E5CD
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Aug 2020 22:10:18 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 07OLtjYQ054833;
 Mon, 24 Aug 2020 16:55:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1598306145;
 bh=ToO+3NPhNZ4b2VimF7JI2m/Y+G+uDEUZKNJic2RPL6o=;
 h=Subject:To:CC:References:From:Date:In-Reply-To;
 b=ejZiB6taEENr+Hn0hc5bAxqg24U0O44RwRV6vWtKHX8yF2fcogQtJomSomBv68bsw
 PLYH2FmE7jGwhcY7LIUnfJ+iODjLSNf3FaJ0nJiaJysxQlv4DWvzMPBjl/LP0PdV54
 oEReJqNmiKlUmO1gpvLUOBekMLgyCfT8DdSLNWaM=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 07OLtiU8069939
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 24 Aug 2020 16:55:44 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 24
 Aug 2020 16:55:43 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 24 Aug 2020 16:55:43 -0500
Received: from [10.250.32.171] (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 07OLtgT3075587;
 Mon, 24 Aug 2020 16:55:43 -0500
Subject: Re: [PATCH 17/18] media/omap3isp: Clean up IOMMU workaround
To: Robin Murphy <robin.murphy@arm.com>, Sakari Ailus <sakari.ailus@iki.fi>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <11d8419744e4e744a9448180801b0c4683328afd.1597931876.git.robin.murphy@arm.com>
 <20200820165339.GK7145@valkosipuli.retiisi.org.uk>
 <be010209-4abc-ba48-4e31-185427776a13@arm.com>
 <20200820195536.GL7145@valkosipuli.retiisi.org.uk>
 <5190a40e-ad24-d98e-3588-b95592ea2db3@arm.com>
From: Suman Anna <s-anna@ti.com>
Message-ID: <86d2fb37-33b8-68f1-fe0c-dad496869b29@ti.com>
Date: Mon, 24 Aug 2020 16:55:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5190a40e-ad24-d98e-3588-b95592ea2db3@arm.com>
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Tue, 25 Aug 2020 07:21:33 +0000
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 thierry.reding@gmail.com, laurent.pinchart@ideasonboard.com, digetx@gmail.com,
 will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, kyungmin.park@samsung.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yMC8yMCA2OjAxIFBNLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4gT24gMjAyMC0wOC0yMCAy
MDo1NSwgU2FrYXJpIEFpbHVzIHdyb3RlOgo+PiBPbiBUaHUsIEF1ZyAyMCwgMjAyMCBhdCAwNjoy
NToxOVBNICswMTAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+PiBPbiAyMDIwLTA4LTIwIDE3OjUz
LCBTYWthcmkgQWlsdXMgd3JvdGU6Cj4+Pj4gSGkgUm9iaW4sCj4+Pj4KPj4+PiBPbiBUaHUsIEF1
ZyAyMCwgMjAyMCBhdCAwNDowODozNlBNICswMTAwLCBSb2JpbiBNdXJwaHkgd3JvdGU6Cj4+Pj4+
IE5vdyB0aGF0IGFyY2gvYXJtIGlzIHdpcmVkIHVwIGZvciBkZWZhdWx0IGRvbWFpbnMgYW5kIGlv
bW11LWRtYSwgZGV2aWNlcwo+Pj4+PiBiZWhpbmQgSU9NTVVzIHdpbGwgZ2V0IG1hcHBpbmdzIHNl
dCB1cCBhdXRvbWF0aWNhbGx5IGFzIGFwcHJvcHJpYXRlLCBzbwo+Pj4+PiB0aGVyZSBpcyBubyBu
ZWVkIGZvciBkcml2ZXJzIHRvIGRvIHNvIG1hbnVhbGx5Lgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgo+Pj4+Cj4+Pj4gVGhhbmtz
IGZvciB0aGUgcGF0Y2guCj4+Pgo+Pj4gTWFueSB0aGFua3MgZm9yIHRlc3Rpbmcgc28gcXVpY2ts
eSEKPj4+Cj4+Pj4gSSBoYXZlbid0IGxvb2tlZCBhdCB0aGUgZGV0YWlscyBidXQgaXQgc2VlbXMg
dGhhdCB0aGlzIGNhdXNlcyB0aGUgYnVmZmVyCj4+Pj4gbWVtb3J5IGFsbG9jYXRpb24gdG8gYmUg
cGh5c2ljYWxseSBjb250aWd1b3VzLCB3aGljaCBjYXVzZXMgYSBmYWlsdXJlIHRvCj4+Pj4gYWxs
b2NhdGUgdmlkZW8gYnVmZmVycyBvZiBlbnRpcmVseSBub3JtYWwgc2l6ZS4gSSBndWVzcyB0aGF0
IHdhcyBub3QKPj4+PiBpbnRlbnRpb25hbD8KPj4+Cj4+PiBIbW0sIGl0IGxvb2tzIGxpa2UgdGhl
IGRldmljZSBlbmRzIHVwIHdpdGggdGhlIHdyb25nIERNQSBvcHMsIHdoaWNoIGltcGxpZXMKPj4+
IHNvbWV0aGluZyBkaWRuJ3QgZ28gYXMgZXhwZWN0ZWQgd2l0aCB0aGUgZWFybGllciBJT01NVSBz
ZXR1cCBhbmQgZGVmYXVsdAo+Pj4gZG9tYWluIGNyZWF0aW9uLiBDaGFuY2VzIGFyZSB0aGF0IGVp
dGhlciBJIG1pc3NlZCBzb21lIHN1YnRsZXR5IGluIHRoZQo+Pj4gb21hcF9pb21tdSBjaGFuZ2Us
IG9yIEkndmUgZnVuZGFtZW50YWxseSBtaXNqdWRnZWQgaG93IHRoZSBJU1AgcHJvYmluZyB3b3Jr
cwo+Pj4gYW5kIGl0IG5ldmVyIGFjdHVhbGx5IGdvZXMgZG93biB0aGUgb2ZfaW9tbXVfY29uZmln
dXJlKCkgcGF0aCBpbiB0aGUgZmlyc3QKPj4+IHBsYWNlLiBEbyB5b3UgZ2V0IGFueSBtZXNzYWdl
cyBmcm9tIHRoZSBJT01NVSBsYXllciBlYXJsaWVyIG9uIGR1cmluZyBib290PwoKWWVhaCwgSSBk
b24ndCB0aGluayB3ZSBnbyB0aHJvdWdoIHRoZSBvZl9pb21tdV9jb25maWd1cmUoKSBwYXRoLCB0
aGUgc2V0dXAgaXMKbW9zdGx5IGRvbmUgdXNpbmcgLnByb2JlX2RldmljZSgpIGFuZCAuYXR0YWNo
X2RldigpIG9wcy4gU2luY2UgdGhlIE1NVXMgYXJlCnByZXNlbnQgZGlyZWN0bHkgaW4gdGhlIHJl
c3BlY3RpdmUgc3ViLXN5c3RlbXMgYW5kIHJlbGllcyBvbiB0aGUgc3ViLXN5c3RlbQpjbG9ja2lu
ZyBhbmQgcG93ZXIsIHRoZSBNTVUgaXRzZWxmIGlzIHR1cm5lZCBPTiBhbmQgZW5hYmxlZCBkdXJp
bmcgLmF0dGFjaF9kZXYoKS4KCnJlZ2FyZHMKU3VtYW4KCj4+Cj4+IEkgZG8gZ2V0IHRoZXNlOgo+
Pgo+PiBbwqDCoMKgIDIuOTM0OTM2XSBpb21tdTogRGVmYXVsdCBkb21haW4gdHlwZTogVHJhbnNs
YXRlZAo+PiBbwqDCoMKgIDIuOTQwOTE3XSBvbWFwLWlvbW11IDQ4MGJkNDAwLm1tdTogNDgwYmQ0
MDAubW11IHJlZ2lzdGVyZWQKPj4gW8KgwqDCoCAyLjk0Njg5OV0gcGxhdGZvcm0gNDgwYmMwMDAu
aXNwOiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAgMAo+Pgo+IAo+IFNvIHRoYXQgbXVjaCBsb29rcyBP
SywgaWYgdGhlcmUgYXJlIG5vIG9idmlvdXMgZXJyb3JzLiBVbmZvcnR1bmF0ZWx5IHRoZXJlJ3Mg
bm8KPiBlYXN5IHdheSB0byB0ZWxsIGV4YWN0bHkgd2hhdCBvZl9pb21tdV9jb25maWd1cmUoKSBp
cyBkb2luZyAoYmV5b25kIGVuYWJsaW5nIGEKPiBjb3VwbGUgb2YgdmFndWUgZGVidWcgbWVzc2Fn
ZXMpLiBUaGUgZmlyc3QgdGhpbmcgSSdsbCBkbyB0b21vcnJvdyBpcwo+IGRvdWJsZS1jaGVjayB3
aGV0aGVyIGl0J3MgcmVhbGx5IHdvcmtpbmcgb24gbXkgYm9hcmRzIGhlcmUsIG9yIHdoZXRoZXIg
SSB3YXMKPiBqdXN0IGdldHRpbmcgbHVja3kgd2l0aCBDTUEuLi4gKEkgYXNzdW1lIHlvdSBkb24n
dCBoYXZlIENNQSBlbmFibGVkIGlmIHlvdSdyZQo+IGVuZGluZyB1cCBpbiByZW1hcF9hbGxvY2F0
b3JfYWxsb2MoKSkKPiAKPiBSb2Jpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
