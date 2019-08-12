Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EABF8A76C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2019 21:42:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F6C6E5CD;
	Mon, 12 Aug 2019 19:42:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E096E5CD;
 Mon, 12 Aug 2019 19:42:33 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d51c1340002>; Mon, 12 Aug 2019 12:42:44 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 12 Aug 2019 12:42:33 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 12 Aug 2019 12:42:33 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 12 Aug
 2019 19:42:30 +0000
Subject: Re: [PATCH] nouveau/hmm: map pages after migration
To: Christoph Hellwig <hch@lst.de>
References: <20190807150214.3629-1-rcampbell@nvidia.com>
 <20190808070701.GC29382@lst.de>
 <0b96a8d8-86b5-3ce0-db95-669963c1f8a7@nvidia.com>
 <20190810111308.GB26349@lst.de>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1a84e6b6-31e6-6955-509f-9883f4a7a322@nvidia.com>
Date: Mon, 12 Aug 2019 12:42:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190810111308.GB26349@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565638964; bh=OU8IJv/lYjVdyGsKoyblYg4ib4y7MVh+DIjHamncxq8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=AejkOoxomaGMhLpZ3pIIkspkKl7sO550hrdwKO5/NA8faapWC8ktyg1xgZmGlUyIT
 E8+aD/Eyq4DXtfObw2wb1IDfF5rGaB9SY6L/edDp+qrtiD/VZn2zqviiDYtoL2w5RT
 G2oreIveRctBxGW5KoLgroNOd1BXtk46jBCX4G5NkjDRbfvrDjsc6GOcIcGt2oLG0z
 UngAn/Ys1zlFjY6Xwh+/SSpg1UNR5ybYE1cK2qp/6NKJvinEEPJHRCwvguTZlofaqS
 Pfo7VmGAYM9odOp4MO2GNNvVxTKI+kTKn1BcDsQmcysGiShtWpFpnDFVSIWPomC38i
 YRYBbJfX49njg==
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTAvMTkgNDoxMyBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gT24gc29tZXRo
aW5nIHZhZ3VlbHkgcmVsYXRlZCB0byB0aGlzIHBhdGNoOgo+IAo+IFlvdSB1c2UgdGhlIE5WSUZf
Vk1NX1BGTk1BUF9WMF9WKiBkZWZpbmVzIGZyb20gbnZpZi9pZjAwMGMuaCwgd2hpY2ggYXJlCj4g
YSBsaXR0bGUgb2RkIGFzIHdlIG9ubHkgZXZlciBzZXQgdGhlc2UgYml0cywgYnV0IHRoZXkgYWxz
byBkb24ndCBzZWVtCj4gdG8gYXBwZWFyIHRvIGJlIGluIHZhbHVlcyB0aGF0IGFyZSBkaXJlY3Rs
eSBmZWQgdG8gdGhlIGhhcmR3YXJlLgo+IAo+IE9uIHRoZSBvdGhlciBoYW5kIG1tdS92bW0uaCBk
ZWZpbmVzIGEgc2V0IG9mIE5WSUZfVk1NX1BGTk1BUF9WMF8qCgpZZXMsIEkgc2VlIE5WS01fVk1N
X1BGTl8qCgo+IGNvbnN0YW50cyB3aXRoIHNpbWlsYXIgbmFtZXMgYW5kIGlkZW50aWNhbCB2YWx1
ZXMsIGFuZCB0aG9zZSBhcmUgdXNlZAo+IGluIG1tdS92bW1ncDEwMC5jIGFuZCB3aGF0IGFwcGVh
cnMgdG8gZmluYWxseSBkbyB0aGUgbG93LWxldmVsIGRtYQo+IG1hcHBpbmcgYW5kIHRhbGtpbmcg
dG8gdGhlIGhhcmR3YXJlLiAgQXJlIHRoZXNlIHR3byBzZXRzIG9mIGNvbnN0YW50cwo+IHN1cHBv
c2VkIHRvIGJlIHRoZSBzYW1lPyAgQXJlIHRoZSBhY3R1YWwgaGFyZHdhcmUgdmFsdWVzIG9yIGp1
c3QgYQo+IGRyaXZlciBpbnRlcm5hbCBpbnRlcmZhY2U/CgpJdCBsb29rcyBhIGJpdCBvZGQgdG8g
bWUgdG9vLgpJIGRvbid0IHJlYWxseSBrbm93IHRoZSBzdHJ1Y3R1cmUvaGlzdG9yeSBvZiBub3V2
ZWF1LgpQZXJoYXBzIEJlbiBTa2VnZ3MgY2FuIHNoZWQgbW9yZSBsaWdodCBvbiB5b3VyIHF1ZXN0
aW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
