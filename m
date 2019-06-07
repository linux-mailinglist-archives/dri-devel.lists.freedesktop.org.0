Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7736F3853B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:44:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3972689A4F;
	Fri,  7 Jun 2019 07:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D841897C5;
 Fri,  7 Jun 2019 03:37:44 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9dc050000>; Thu, 06 Jun 2019 20:37:41 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 20:37:43 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 06 Jun 2019 20:37:43 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 03:37:43 +0000
Subject: Re: [PATCH v2 hmm 09/11] mm/hmm: Poison hmm_range during unregister
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-10-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <c00da0f2-b4b8-813b-0441-a50d4de9d8be@nvidia.com>
Date: Thu, 6 Jun 2019 20:37:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-10-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559878662; bh=hnXE0MxsnGUyN9sEUkzf3xpow50f6NZj1i458LDKMRY=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=QvargbHB/DizVIjbFgrGO7KOkIELn7znisJutPC07gBiFD3RBkmRxqgRlU3INvSZE
 pGs6vpHFmHRf8zYT7kTtobygP1lgP0et5dnYUk3vK7g6ixI0pRW1a9r5nFt9/IMK1r
 BgULwWxGBrbfgtkFSRFvoXzx/m91pLiOVtIXQtX2wF2PoQ4LROXlZQpXtWY9r8vf7A
 CVpIuK65AIgHw17xPsoqhDVb95im6PAk31TsEfL5mSjN1gNl8xJaA1ONH9usESF2kd
 rBxEuTTgHX03kjG8Rko/lwfaQ2yVX9+hbu4NeGtIxf5iYcW1YPRps8+MdfqrphGf2n
 iYOvYTuWrrENw==
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
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IFRyeWluZyB0byBtaXN1c2UgYSByYW5n
ZSBvdXRzaWRlIGl0cyBsaWZldGltZSBpcyBhIGtlcm5lbCBidWcuIFVzZSBXQVJOX09OCj4gYW5k
IHBvaXNvbiBieXRlcyB0byBkZXRlY3QgdGhpcyBjb25kaXRpb24uCj4gCj4gU2lnbmVkLW9mZi1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IFJldmlld2VkLWJ5OiBKw6ly
w7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KPiAtLS0KPiB2Mgo+IC0gS2VlcCByYW5n
ZSBzdGFydC9lbmQgdmFsaWQgYWZ0ZXIgdW5yZWdpc3RyYXRpb24gKEplcm9tZSkKPiAtLS0KPiAg
bW0vaG1tLmMgfCA3ICsrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwo+IGlu
ZGV4IDY4MDJkZTcwODBkMTcyLi5jMmZlY2IzZWNiMTFlMSAxMDA2NDQKPiAtLS0gYS9tbS9obW0u
Ywo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTkzNyw3ICs5MzcsNyBAQCB2b2lkIGhtbV9yYW5nZV91
bnJlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQo+ICAJc3RydWN0IGhtbSAqaG1tID0g
cmFuZ2UtPmhtbTsKPiAgCj4gIAkvKiBTYW5pdHkgY2hlY2sgdGhpcyByZWFsbHkgc2hvdWxkIG5v
dCBoYXBwZW4uICovCgpUaGF0IGNvbW1lbnQgY2FuIGFsc28gYmUgZGVsZXRlZCwgYXMgaXQgaGFz
IHRoZSBzYW1lIG1lYW5pbmcgYXMKdGhlIFdBUk5fT04oKSB0aGF0IHlvdSBqdXN0IGFkZGVkLgoK
PiAtCWlmIChobW0gPT0gTlVMTCB8fCByYW5nZS0+ZW5kIDw9IHJhbmdlLT5zdGFydCkKPiArCWlm
IChXQVJOX09OKHJhbmdlLT5lbmQgPD0gcmFuZ2UtPnN0YXJ0KSkKPiAgCQlyZXR1cm47Cj4gIAo+
ICAJbXV0ZXhfbG9jaygmaG1tLT5sb2NrKTsKPiBAQCAtOTQ4LDcgKzk0OCwxMCBAQCB2b2lkIGht
bV9yYW5nZV91bnJlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQo+ICAJcmFuZ2UtPnZh
bGlkID0gZmFsc2U7Cj4gIAltbXB1dChobW0tPm1tKTsKPiAgCWhtbV9wdXQoaG1tKTsKPiAtCXJh
bmdlLT5obW0gPSBOVUxMOwo+ICsKPiArCS8qIFRoZSByYW5nZSBpcyBub3cgaW52YWxpZCwgbGVh
dmUgaXQgcG9pc29uZWQuICovCgpUbyBiZSBwcmVjaXNlLCB3ZSBhcmUgcG9pc29uaW5nIHRoZSBy
YW5nZSdzIGJhY2sgcG9pbnRlciB0byBpdCdzCm93bmluZyBobW0gaW5zdGFuY2UuICBNYXliZSB0
aGlzIGlzIGNsZWFyZXI6CgoJLyoKCSAqIFRoZSByYW5nZSBpcyBub3cgaW52YWxpZCwgc28gcG9p
c29uIGl0J3MgaG1tIHBvaW50ZXIuIAoJICogTGVhdmUgb3RoZXIgcmFuZ2UtPiBmaWVsZHMgaW4g
cGxhY2UsIGZvciB0aGUgY2FsbGVyJ3MgdXNlLgoJICovCgouLi5vciBzb21ldGhpbmcgbGlrZSB0
aGF0PwoKPiArCXJhbmdlLT52YWxpZCA9IGZhbHNlOwo+ICsJbWVtc2V0KCZyYW5nZS0+aG1tLCBQ
T0lTT05fSU5VU0UsIHNpemVvZihyYW5nZS0+aG1tKSk7Cj4gIH0KPiAgRVhQT1JUX1NZTUJPTCho
bW1fcmFuZ2VfdW5yZWdpc3Rlcik7Cj4gIAo+IAoKVGhlIGFib3ZlIGFyZSB2ZXJ5IG1pbm9yIGRv
Y3VtZW50YXRpb24gcG9pbnRzLCBzbzoKCiAgICBSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxq
aHViYmFyZEBudmlkaWEuY29tPgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
