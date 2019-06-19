Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 796294C7FD
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73036E505;
	Thu, 20 Jun 2019 07:13:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 11573 seconds by postgrey-1.36 at gabe;
 Wed, 19 Jun 2019 20:01:54 UTC
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 063FA6E45F;
 Wed, 19 Jun 2019 20:01:54 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JJxCMh013084;
 Wed, 19 Jun 2019 20:01:33 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by aserp2120.oracle.com with ESMTP id 2t7809ddd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 20:01:33 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JK0U82055051;
 Wed, 19 Jun 2019 20:01:32 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by aserp3020.oracle.com with ESMTP id 2t77yp1s13-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 20:01:32 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5JK1P5e025354;
 Wed, 19 Jun 2019 20:01:25 GMT
Received: from [10.65.164.174] (/10.65.164.174)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 13:01:25 -0700
Subject: Re: [PATCH v17 07/15] fs, arm64: untag user pointers in
 copy_mount_options
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <4ed871e14cc265a519c6ba8660a1827844371791.1560339705.git.andreyknvl@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <14e49054-01dc-dab5-40cc-71434ea3852a@oracle.com>
Date: Wed, 19 Jun 2019 14:01:22 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4ed871e14cc265a519c6ba8660a1827844371791.1560339705.git.andreyknvl@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190164
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190164
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=Vroyiiy2apNH9g1WQULlt3tAhqXh3qFzkC0thjbI/tY=;
 b=tQKRrCMRIZFf76xHdG+OcQRJVCixkQdbl3HfJkhqJ6zQ5Fq71mORMALE81hvlqMU5cq2
 K4F8SUycLHKVrHTiluUHLfebVsFtIV4u7NZst1BEEOGeJtKDYGfPNuGNBzsiq/6/sG1m
 oHmWEWnqBcx8EHxc8VsLy1BXGGOzd4qHtZgUM3+RorIGLB7LeM8SEKQOzG7hpzi3tUIX
 cBqz1T+7bPFIBDeruJWhgHUJUNTS7jmoeogb9Jt64Fnvc0VzloFKzLKS2q+3tVxVQSnx
 bLlYN2Mg5EBeENllw30HSTJNHEAnYlsgKqvHUrkE60SZa/hI/hGzXCuuUFok8MhRdXuP yg== 
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

T24gNi8xMi8xOSA1OjQzIEFNLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+IFRoaXMgcGF0Y2gg
aXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFs
bG93IHRvCj4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0
IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCj4gdGhhbiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50
cy4KPiAKPiBJbiBjb3B5X21vdW50X29wdGlvbnMgYSB1c2VyIGFkZHJlc3MgaXMgYmVpbmcgc3Vi
dHJhY3RlZCBmcm9tIFRBU0tfU0laRS4KPiBJZiB0aGUgYWRkcmVzcyBpcyBsb3dlciB0aGFuIFRB
U0tfU0laRSwgdGhlIHNpemUgaXMgY2FsY3VsYXRlZCB0byBub3QKPiBhbGxvdyB0aGUgZXhhY3Rf
Y29weV9mcm9tX3VzZXIoKSBjYWxsIHRvIGNyb3NzIFRBU0tfU0laRSBib3VuZGFyeS4KPiBIb3dl
dmVyIGlmIHRoZSBhZGRyZXNzIGlzIHRhZ2dlZCwgdGhlbiB0aGUgc2l6ZSB3aWxsIGJlIGNhbGN1
bGF0ZWQKPiBpbmNvcnJlY3RseS4KPiAKPiBVbnRhZyB0aGUgYWRkcmVzcyBiZWZvcmUgc3VidHJh
Y3RpbmcuCj4gCj4gUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21pdW0ub3Jn
Pgo+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25vdmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNv
bT4KPiAtLS0KClBsZWFzZSB1cGRhdGUgY29tbWl0IGxvZyB0byBtYWtlIGl0IG5vdCBhcm02NCBz
cGVjaWZpYyBzaW5jZSB0aGlzIGNoYW5nZQphZmZlY3RzIG90aGVyIGFyY2hpdGVjdHVyZXMgYXMg
d2VsbC4gT3RoZXIgdGhhbiB0aGF0LAoKUmV2aWV3ZWQtYnk6IEtoYWxpZCBBeml6IDxraGFsaWQu
YXppekBvcmFjbGUuY29tPgoKCj4gIGZzL25hbWVzcGFjZS5jIHwgMiArLQo+ICAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnMv
bmFtZXNwYWNlLmMgYi9mcy9uYW1lc3BhY2UuYwo+IGluZGV4IGIyNjc3OGJkYzIzNi4uMmU4NTcx
MmExOWVkIDEwMDY0NAo+IC0tLSBhL2ZzL25hbWVzcGFjZS5jCj4gKysrIGIvZnMvbmFtZXNwYWNl
LmMKPiBAQCAtMjk5Myw3ICsyOTkzLDcgQEAgdm9pZCAqY29weV9tb3VudF9vcHRpb25zKGNvbnN0
IHZvaWQgX191c2VyICogZGF0YSkKPiAgCSAqIHRoZSByZW1haW5kZXIgb2YgdGhlIHBhZ2UuCj4g
IAkgKi8KPiAgCS8qIGNvcHlfZnJvbV91c2VyIGNhbm5vdCBjcm9zcyBUQVNLX1NJWkUgISAqLwo+
IC0Jc2l6ZSA9IFRBU0tfU0laRSAtICh1bnNpZ25lZCBsb25nKWRhdGE7Cj4gKwlzaXplID0gVEFT
S19TSVpFIC0gKHVuc2lnbmVkIGxvbmcpdW50YWdnZWRfYWRkcihkYXRhKTsKPiAgCWlmIChzaXpl
ID4gUEFHRV9TSVpFKQo+ICAJCXNpemUgPSBQQUdFX1NJWkU7Cj4gIAo+IAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
