Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0FB3856B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:45:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C2B89B46;
	Fri,  7 Jun 2019 07:43:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4249089807;
 Fri,  7 Jun 2019 03:40:09 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9dc980002>; Thu, 06 Jun 2019 20:40:08 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 20:40:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 20:40:08 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 03:40:08 +0000
Subject: Re: [PATCH v2 hmm 10/11] mm/hmm: Do not use list*_rcu() for
 hmm->ranges
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-11-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <59b5de4b-e872-30f4-149e-f8a3bc946f22@nvidia.com>
Date: Thu, 6 Jun 2019 20:40:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-11-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559878808; bh=pa8me+rakZWDjEypIvJVJP7U7jLDmCrHPlreNoxTeR8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=G1lFsOJUt+3jxL5x/uSOUxqaW8LvFvibp6A1hycDOeXtZ3mAVTRD5L3VKP0+kejUe
 plHS/p/eAzx3ex2XvNWSsTCNfKzMxe6E+GIKyEeyTNz3eSluzrCzSvLLKtXOp+RwaI
 voG1xUgVGSn8ma6EEdNcmXRkz1nklW0nF4LIQrahYEMP2+v0xepaEdhjPoULnG84Qp
 EDLZE60nNdaLX38kGT9lcb2ftfpDNdj31aqY2OYsEJ2m2Fb88xd/ujlbrFDIGrhXl3
 wYDlYNzBx0QOfzYwjwKgB+ND6ZyLRRb32g3Q1tZd7Iqq+9mp7WwLSdXx/jOveKZLKX
 LKsPn6DIVkigg==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gRnJvbTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFRoaXMgbGlzdCBpcyBhbHdheXMgcmVh
ZCBhbmQgd3JpdHRlbiB3aGlsZSBob2xkaW5nIGhtbS0+bG9jayBzbyB0aGVyZSBpcwo+IG5vIG5l
ZWQgZm9yIHRoZSBjb25mdXNpbmcgX3JjdSBhbm5vdGF0aW9ucy4KPiAKPiBTaWduZWQtb2ZmLWJ5
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Cj4gUmV2aWV3ZWQtYnk6IErDqXLD
tG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IC0tLQo+ICBtbS9obW0uYyB8IDQgKyst
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCj4gaW5kZXggYzJmZWNiM2VjYjExZTEu
LjcwOWQxMzhkZDQ5MDI3IDEwMDY0NAo+IC0tLSBhL21tL2htbS5jCj4gKysrIGIvbW0vaG1tLmMK
PiBAQCAtOTExLDcgKzkxMSw3IEBAIGludCBobW1fcmFuZ2VfcmVnaXN0ZXIoc3RydWN0IGhtbV9y
YW5nZSAqcmFuZ2UsCj4gIAltdXRleF9sb2NrKCZobW0tPmxvY2spOwo+ICAKPiAgCXJhbmdlLT5o
bW0gPSBobW07Cj4gLQlsaXN0X2FkZF9yY3UoJnJhbmdlLT5saXN0LCAmaG1tLT5yYW5nZXMpOwo+
ICsJbGlzdF9hZGQoJnJhbmdlLT5saXN0LCAmaG1tLT5yYW5nZXMpOwo+ICAKPiAgCS8qCj4gIAkg
KiBJZiB0aGVyZSBhcmUgYW55IGNvbmN1cnJlbnQgbm90aWZpZXJzIHdlIGhhdmUgdG8gd2FpdCBm
b3IgdGhlbSBmb3IKPiBAQCAtOTQxLDcgKzk0MSw3IEBAIHZvaWQgaG1tX3JhbmdlX3VucmVnaXN0
ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCj4gIAkJcmV0dXJuOwo+ICAKPiAgCW11dGV4X2xv
Y2soJmhtbS0+bG9jayk7Cj4gLQlsaXN0X2RlbF9yY3UoJnJhbmdlLT5saXN0KTsKPiArCWxpc3Rf
ZGVsKCZyYW5nZS0+bGlzdCk7Cj4gIAltdXRleF91bmxvY2soJmhtbS0+bG9jayk7Cj4gIAo+ICAJ
LyogRHJvcCByZWZlcmVuY2UgdGFrZW4gYnkgaG1tX3JhbmdlX3JlZ2lzdGVyKCkgKi8KPiAKCkdv
b2QgcG9pbnQuIEknZCBvdmVybG9va2VkIHRoaXMgbWFueSB0aW1lcy4KCiAgICBSZXZpZXdlZC1i
eTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKCnRoYW5rcywKLS0gCkpvaG4g
SHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRl
dmVs
