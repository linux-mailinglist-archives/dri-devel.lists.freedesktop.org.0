Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C313A5AE
	for <lists+dri-devel@lfdr.de>; Sun,  9 Jun 2019 14:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD998930A;
	Sun,  9 Jun 2019 12:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351A6891DA;
 Sat,  8 Jun 2019 01:37:23 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cfb11520000>; Fri, 07 Jun 2019 18:37:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 07 Jun 2019 18:37:22 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 07 Jun 2019 18:37:22 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 8 Jun
 2019 01:37:22 +0000
Subject: Re: [PATCH v2 hmm 01/11] mm/hmm: fix use after free with struct hmm
 in the mmu notifiers
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-2-jgg@ziepe.ca>
 <9c72d18d-2924-cb90-ea44-7cd4b10b5bc2@nvidia.com>
 <20190607123432.GB14802@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <771c9b7b-983a-934b-a507-76aa0e8aceaf@nvidia.com>
Date: Fri, 7 Jun 2019 18:37:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190607123432.GB14802@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Sun, 09 Jun 2019 12:54:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559957842; bh=M2sIXUfHOY4caJ1/GSTT6zN+FY4XjAfM+4N4CfP5+0w=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=FjXO3DJQC3v99wu3gjrQndwbgGxJGQ3SEeqG6TFvKt1w8r53KkjAm5XGISySd7/Dm
 KLix8M+qphUJiEIxz8Y3hQB0oYZaiIAeoBkX9pa0tzwdBg2beA71/hN66V58sKJ/Gl
 GsBt0SeJWOAr27yT3YO0qWzVqE+qm57g4x2hJ0tPPIcDxmY0MVfpMNRJpBiNZRA5+O
 Hlr8TVddXcJqFVeZwSJrflfkrUQ/oDXy6uzdvHLmWUjJrkAsi7dR/wNzUdJdnlq0ll
 D7efeHpKaM+iJpMEls+jYjF7AMwgFUPpMleyuHXmzsG1896UdCqXNxclh3QfcubGCq
 PE9i3yKPcaVHQ==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Ralph Campbell <rcampbell@nvidia.com>, linux-rdma@vger.kernel.org,
 Felix.Kuehling@amd.com, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jerome Glisse <jglisse@redhat.com>, amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi83LzE5IDU6MzQgQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBUaHUsIEp1biAw
NiwgMjAxOSBhdCAwNzoyOTowOFBNIC0wNzAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IE9uIDYv
Ni8xOSAxMTo0NCBBTSwgSmFzb24gR3VudGhvcnBlIHdyb3RlOgo+Pj4gRnJvbTogSmFzb24gR3Vu
dGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+PiAuLi4KPj4+IEBAIC0xNTMsMTAgKzE1OCwxNCBA
QCB2b2lkIGhtbV9tbV9kZXN0cm95KHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+Pj4gIAo+Pj4gIHN0
YXRpYyB2b2lkIGhtbV9yZWxlYXNlKHN0cnVjdCBtbXVfbm90aWZpZXIgKm1uLCBzdHJ1Y3QgbW1f
c3RydWN0ICptbSkKPj4+ICB7Cj4+PiAtCXN0cnVjdCBobW0gKmhtbSA9IG1tX2dldF9obW0obW0p
Owo+Pj4gKwlzdHJ1Y3QgaG1tICpobW0gPSBjb250YWluZXJfb2YobW4sIHN0cnVjdCBobW0sIG1t
dV9ub3RpZmllcik7Cj4+PiAgCXN0cnVjdCBobW1fbWlycm9yICptaXJyb3I7Cj4+PiAgCXN0cnVj
dCBobW1fcmFuZ2UgKnJhbmdlOwo+Pj4gIAo+Pj4gKwkvKiBobW0gaXMgaW4gcHJvZ3Jlc3MgdG8g
ZnJlZSAqLwo+Pgo+PiBXZWxsLCBzb21ldGltZXMsIHllcy4gOikKPiAKPiBJdCB0aGluayBpdCBp
cyBpbiBhbGwgY2FzZXMgYWN0dWFsbHkuLiBUaGUgb25seSB3YXkgd2Ugc2VlIGEgMCBrcmVmCj4g
YW5kIHN0aWxsIHJlYWNoIHRoaXMgY29kZSBwYXRoIGlzIGlmIGFub3RoZXIgdGhyZWFkIGhhcyBh
bHJlYXkgc2V0dXAKPiB0aGUgaG1tX2ZyZWUgaW4gdGhlIGNhbGxfc3JjdS4uCj4gCj4+IE1heWJl
IHRoaXMgd29yZGluZyBpcyBjbGVhcmVyIChpZiB3ZSBuZWVkIGFueSBjb21tZW50IGF0IGFsbCk6
Cj4gCj4gSSBhbHdheXMgZmluZCB0aGlzIGhhcmQuLiBUaGlzIGlzIGEgdmVyeSBzdGFuZGFyZCBw
YXR0ZXJuIHdoZW4gd29ya2luZwo+IHdpdGggUkNVIC0gaG93ZXZlciBpbiBteSBleHBlcmllbmNl
IGZldyBwZW9wbGUgYWN0dWFsbHkga25vdyB0aGUgUkNVCj4gcGF0dGVybnMsIGFuZCBtaXNzaW5n
IHRoZSBfdW5sZXNzX3plcm8gaXMgYSBjb21tb24gYnVnIEkgZmluZCB3aGVuCj4gbG9va2luZyBh
dCBjb2RlLgo+IAo+IFRoaXMgaXMgbW0vIHNvIEkgY2FuIGRyb3AgaXQsIHdoYXQgZG8geW91IHRo
aW5rPwo+IAoKSSBmb3Jnb3QgdG8gcmVzcG9uZCB0byB0aGlzIHNlY3Rpb24sIHNvIGNhdGNoaW5n
IHVwIG5vdzoKCkkgdGhpbmsgd2UncmUgdGFsa2luZyBhYm91dCBzbGlnaHRseSBkaWZmZXJlbnQg
dGhpbmdzLiBJIHdhcyBqdXN0Cm5vdGluZyB0aGF0IHRoZSBjb21tZW50IGFib3ZlIHRoZSAiaWYi
IHN0YXRlbWVudCB3YXMgb25seSBhY2N1cmF0ZQppZiB0aGUgYnJhbmNoIGlzIHRha2VuLCB3aGlj
aCBpcyB3aHkgSSByZWNvbW1lbmRlZCB0aGlzIGNvbWJpbmF0aW9uCm9mIGNvbW1lbnQgYW5kIGNv
ZGU6CgoJLyogQmFpbCBvdXQgaWYgaG1tIGlzIGluIHRoZSBwcm9jZXNzIG9mIGJlaW5nIGZyZWVk
ICovCglpZiAoIWtyZWZfZ2V0X3VubGVzc196ZXJvKCZobW0tPmtyZWYpKQoJCXJldHVybjsKCkFz
IGZvciB0aGUgYWN0dWFsIF91bmxlc3NfemVybyBwYXJ0LCBJIHRoaW5rIHRoYXQncyBnb29kIHRv
IGhhdmUuCkFuZCBpdCdzIGEgZ29vZCByZW1pbmRlciBpZiBub3RoaW5nIGVsc2UsIGV2ZW4gaW4g
bW0vIGNvZGUuCgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
