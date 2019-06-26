Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C90657CE2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 09:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754936E5DC;
	Thu, 27 Jun 2019 07:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A11C96E4B1;
 Wed, 26 Jun 2019 17:51:19 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5QHd3BJ070052;
 Wed, 26 Jun 2019 17:50:48 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t9cyqks50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 17:50:48 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5QHolV1005117;
 Wed, 26 Jun 2019 17:50:47 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2t9p6uwkss-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Jun 2019 17:50:47 +0000
Received: from abhmp0005.oracle.com (abhmp0005.oracle.com [141.146.116.11])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5QHofTs013200;
 Wed, 26 Jun 2019 17:50:42 GMT
Received: from [10.65.138.107] (/10.65.138.107)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 26 Jun 2019 10:50:41 -0700
Subject: Re: [PATCH v18 10/15] drm/radeon: untag user pointers in
 radeon_gem_userptr_ioctl
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1561386715.git.andreyknvl@google.com>
 <61d800c35a4f391218fbca6f05ec458557d8d097.1561386715.git.andreyknvl@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <28554e21-04b8-2461-e576-5abe0b53cd59@oracle.com>
Date: Wed, 26 Jun 2019 11:50:39 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <61d800c35a4f391218fbca6f05ec458557d8d097.1561386715.git.andreyknvl@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906260208
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9300
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906260208
X-Mailman-Approved-At: Thu, 27 Jun 2019 07:11:26 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=pJtn37VVzLHGgxTNqg1ZlS6RKLrOq382izwrBCZb3DI=;
 b=EcEEEMWgDEbMDuMxTOR2oYeCSXUOQKHZ4+B/a0CiekDLmP8Z1U885QaSBhgXo+/oVJZ3
 SGbnV6cXs+U0YG4HT3njZ/iUUzFIuHHOFK70cZEOdOGApbgKUYX3eCJLdfQ3dKwGSNIl
 owHPVd1m79tjE2KLbk7nGdMWhkLr/F3ZBkkDI9hHrhy/y/e6IptZoUUgS8HTk7grA8Ud
 Bf4hJAICEUZKsbR/1JYmjjWhp4n+uI1QfmV/GKfsvqZ6rJZc12bBVgqeF5v8xkJ16pFz
 7wdP2Bakv0UvCbjPcmfUTGeqmf+Xk2K6+wWohnQ4b4rai+Y/+koOAVyMxoOJaa/ojH8K NA== 
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
Cc: Mark Rutland <mark.rutland@arm.com>, Szabolcs Nagy <Szabolcs.Nagy@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>,
 Kostya Serebryany <kcc@google.com>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Jacob Bramley <Jacob.Bramley@arm.com>, Leon Romanovsky <leon@kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Dave Martin <Dave.Martin@arm.com>, Evgeniy Stepanov <eugenis@google.com>,
 Kevin Brodsky <kevin.brodsky@arm.com>, Kees Cook <keescook@chromium.org>,
 Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
 Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yishai Hadas <yishaih@mellanox.com>,
 Jens Wiklander <jens.wiklander@linaro.org>, Lee Smith <Lee.Smith@arm.com>,
 Alexander Deucher <Alexander.Deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>, enh <enh@google.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Christian Koenig <Christian.Koenig@amd.com>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8yNC8xOSA4OjMyIEFNLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+IFRoaXMgcGF0Y2gg
aXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBrZXJuZWwgQUJJIHRvIGFsbG93IHRv
IHBhc3MKPiB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0IHRvIHNv
bWV0aGluZyBlbHNlIG90aGVyIHRoYW4KPiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50cy4KPiAK
PiBJbiByYWRlb25fZ2VtX3VzZXJwdHJfaW9jdGwoKSBhbiBNTVUgbm90aWZpZXIgaXMgc2V0IHVw
IHdpdGggYSAodGFnZ2VkKQo+IHVzZXJzcGFjZSBwb2ludGVyLiBUaGUgdW50YWdnZWQgYWRkcmVz
cyBzaG91bGQgYmUgdXNlZCBzbyB0aGF0IE1NVQo+IG5vdGlmaWVycyBmb3IgdGhlIHVudGFnZ2Vk
IGFkZHJlc3MgZ2V0IGNvcnJlY3RseSBtYXRjaGVkIHVwIHdpdGggdGhlIHJpZ2h0Cj4gQk8uIFRo
aXMgZnVuY2F0aW9uIGFsc28gY2FsbHMgcmFkZW9uX3R0bV90dF9waW5fdXNlcnB0cigpLCB3aGlj
aCB1c2VzCj4gcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Igdm1hIGxvb2t1cHMsIHdoaWNoIGNh
biBvbmx5IGJ5IGRvbmUgd2l0aAo+IHVudGFnZ2VkIHBvaW50ZXJzLgo+IAo+IFRoaXMgcGF0Y2gg
dW50YWdzIHVzZXIgcG9pbnRlcnMgaW4gcmFkZW9uX2dlbV91c2VycHRyX2lvY3RsKCkuCj4gCj4g
U3VnZ2VzdGVkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPiBB
Y2tlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252bEBnb29nbGUuY29tPgo+IC0tLQoK
UmV2aWV3ZWQtYnk6IEtoYWxpZCBBeml6IDxraGFsaWQuYXppekBvcmFjbGUuY29tPgoKCj4gIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2dlbS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRl
b24vcmFkZW9uX2dlbS5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZ2VtLmMKPiBp
bmRleCA0NDYxN2RlYzgxODMuLjkwZWI3OGZiNWViMiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcmFkZW9uL3JhZGVvbl9nZW0uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24v
cmFkZW9uX2dlbS5jCj4gQEAgLTI5MSw2ICsyOTEsOCBAQCBpbnQgcmFkZW9uX2dlbV91c2VycHRy
X2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4gIAl1aW50MzJfdCBo
YW5kbGU7Cj4gIAlpbnQgcjsKPiAgCj4gKwlhcmdzLT5hZGRyID0gdW50YWdnZWRfYWRkcihhcmdz
LT5hZGRyKTsKPiArCj4gIAlpZiAob2Zmc2V0X2luX3BhZ2UoYXJncy0+YWRkciB8IGFyZ3MtPnNp
emUpKQo+ICAJCXJldHVybiAtRUlOVkFMOwo+ICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
