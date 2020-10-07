Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06931286959
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 22:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AE56E9B0;
	Wed,  7 Oct 2020 20:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7213F6E9AF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 20:46:06 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7e28d60001>; Wed, 07 Oct 2020 13:45:10 -0700
Received: from [10.2.85.86] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 7 Oct
 2020 20:46:04 +0000
Subject: Re: [PATCH 04/13] misc/habana: Use FOLL_LONGTERM for userptr
To: Daniel Vetter <daniel.vetter@ffwll.ch>, DRI Development
 <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
References: <20201007164426.1812530-1-daniel.vetter@ffwll.ch>
 <20201007164426.1812530-5-daniel.vetter@ffwll.ch>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <ce781e05-044f-b62b-6a39-952d73ed1597@nvidia.com>
Date: Wed, 7 Oct 2020 13:46:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201007164426.1812530-5-daniel.vetter@ffwll.ch>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1602103510; bh=7gGgalGDQ5Ct6e6oxVX0GKF6fkHgYYKPLymOR6tYzGU=;
 h=Subject:To:CC:References:From:Message-ID:Date:User-Agent:
 MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=hDjrDWj3freRp1ybK4xKGh41JWbS/a33PUUY+OIWq7wCWr+gCw+Y7YWb5GlTFEByE
 06K89H4PC9BMZJaiw+BZP5M8S63s07IUAQmo5lhkpnjZjEHyuHCRX/mEyfrbv2RBi5
 uJ6DJLDc5KN5KysnSSFAUMzyEIRMWCHps09MbLSPAmKyksOETypirPJ00zDDmc2NCZ
 lJPmgPC8cvOAyzelVuiBvVdtaxIZHAi58+kUse68GpdmUNRj3f+Wze2ZUsmO23bUkK
 9BmqvzTyBGOaJd5NV2EhoHkVJltdEz8lMfwvWRt1wL0j/5/KzKm43UEdXWpjm7rSjF
 Pm1sw+83JPf1g==
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
Cc: linux-s390@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Pawel Piskorski <ppiskorski@habana.ai>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Ofir Bitton <obitton@habana.ai>,
 linux-mm@kvack.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Tomer Tayar <ttayar@habana.ai>, Omer
 Shpigelman <oshpigelman@habana.ai>, Daniel Vetter <daniel.vetter@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Moti Haimovski <mhaimovski@habana.ai>, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTAvNy8yMCA5OjQ0IEFNLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+IFRoZXNlIGFyZSBwZXJz
aXN0ZW50LCBub3QganVzdCBmb3IgdGhlIGR1cmF0aW9uIG9mIGEgZG1hIG9wZXJhdGlvbi4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4K
PiBDYzogSmFzb24gR3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gQ2M6IEFuZHJldyBNb3J0b24g
PGFrcG1AbGludXgtZm91bmRhdGlvbi5vcmc+Cj4gQ2M6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRA
bnZpZGlhLmNvbT4KPiBDYzogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4g
Q2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4gQ2M6IERhbiBXaWxsaWFtcyA8ZGFuLmoud2ls
bGlhbXNAaW50ZWwuY29tPgo+IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiBDYzogbGludXgtYXJt
LWtlcm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LXNhbXN1bmctc29jQHZnZXIu
a2VybmVsLm9yZwo+IENjOiBsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmcKPiBDYzogT2RlZCBH
YWJiYXkgPG9kZWQuZ2FiYmF5QGdtYWlsLmNvbT4KPiBDYzogT21lciBTaHBpZ2VsbWFuIDxvc2hw
aWdlbG1hbkBoYWJhbmEuYWk+Cj4gQ2M6IE9maXIgQml0dG9uIDxvYml0dG9uQGhhYmFuYS5haT4K
PiBDYzogVG9tZXIgVGF5YXIgPHR0YXlhckBoYWJhbmEuYWk+Cj4gQ2M6IE1vdGkgSGFpbW92c2tp
IDxtaGFpbW92c2tpQGhhYmFuYS5haT4KPiBDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4KPiBDYzogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0
aW9uLm9yZz4KPiBDYzogUGF3ZWwgUGlza29yc2tpIDxwcGlza29yc2tpQGhhYmFuYS5haT4KPiAt
LS0KPiAgIGRyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYyB8IDMgKystCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYyBiL2RyaXZl
cnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnkuYwo+IGluZGV4IGVmODljZmEyZjk1YS4u
OTRiZWY4ZmFhODJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1v
bi9tZW1vcnkuYwo+ICsrKyBiL2RyaXZlcnMvbWlzYy9oYWJhbmFsYWJzL2NvbW1vbi9tZW1vcnku
Ywo+IEBAIC0xMjg4LDcgKzEyODgsOCBAQCBzdGF0aWMgaW50IGdldF91c2VyX21lbW9yeShzdHJ1
Y3QgaGxfZGV2aWNlICpoZGV2LCB1NjQgYWRkciwgdTY0IHNpemUsCj4gICAJCXJldHVybiAtRU5P
TUVNOwo+ICAgCX0KPiAgIAo+IC0JcmMgPSBwaW5fdXNlcl9wYWdlc19mYXN0KHN0YXJ0LCBucGFn
ZXMsIEZPTExfRk9SQ0UgfCBGT0xMX1dSSVRFLAo+ICsJcmMgPSBwaW5fdXNlcl9wYWdlc19mYXN0
KHN0YXJ0LCBucGFnZXMsCj4gKwkJCQkgRk9MTF9GT1JDRSB8IEZPTExfV1JJVEUgfCBGT0xMX0xP
TkdURVJNLAo+ICAgCQkJCSB1c2VycHRyLT5wYWdlcyk7Cj4gICAKPiAgIAlpZiAocmMgIT0gbnBh
Z2VzKSB7Cj4gCgpBZ2FpbiwgZnJvbSBhIHBpbl91c2VyX3BhZ2VzX2Zhc3QoKSBwb2ludCBvZiB2
aWV3LCBhbmQgbm90IGJlaW5nIGF0IGFsbCBmYW1pbGlhcgp3aXRoIHRoZSBoYWJhbmEgZHJpdmVy
IChidXQgdGhlaXIgdXNlIG9mIHRoaXMgcmVhbGx5IGRvZXMgc2VlbSBjbGVhcmx5IF9MT05HVEVS
TSEpOgoKUmV2aWV3ZWQtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KCnRo
YW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
