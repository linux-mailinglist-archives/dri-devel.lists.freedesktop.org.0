Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4EF34C801
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07CAF6E507;
	Thu, 20 Jun 2019 07:13:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38368898D9;
 Wed, 19 Jun 2019 20:58:35 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JGmaMG059359;
 Wed, 19 Jun 2019 16:48:44 GMT
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 2t7809cjn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 16:48:44 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JGlKWG054029;
 Wed, 19 Jun 2019 16:48:44 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3020.oracle.com with ESMTP id 2t77yn71um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 16:48:43 +0000
Received: from abhmp0002.oracle.com (abhmp0002.oracle.com [141.146.116.8])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5JGmfkY007697;
 Wed, 19 Jun 2019 16:48:41 GMT
Received: from [10.65.164.174] (/10.65.164.174)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 09:48:41 -0700
Subject: Re: [PATCH v17 06/15] mm, arm64: untag user pointers in
 get_vaddr_frames
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <4c0b9a258e794437a1c6cec97585b4b5bd2d3bba.1560339705.git.andreyknvl@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <39b03c1b-d09c-4b29-0f62-337bf2382eb5@oracle.com>
Date: Wed, 19 Jun 2019 10:48:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <4c0b9a258e794437a1c6cec97585b4b5bd2d3bba.1560339705.git.andreyknvl@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190135
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190136
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=LsU3zeuc/mQbMeWhWbxSsUGJ/a+JywecUJTpLD/kSKk=;
 b=FFTbHZpNpzyDwT0Eazo9mrp8/3iEXjHoS/+pgViSDegRiIT56LXTiOpOiVuZY+ZQJp61
 m4sxzqaSIXQJ/SNqXXdUE75HtjKtsGvWt+m0angb4oDvjsPt3ChVFepvLTUMeYu2AmQA
 KOIThCjgEPdAHaZQr8fjpYFx6RuSpFV664Ojvx7dJzjFYaZgZ8v+ut+4wPEKrogGjNl+
 i1EU20jY+j7nwoouOiJoyAdRJ+fRlBREi0LRdxAlvFYskldgAWupL25hV8oWKRFcveIM
 gaA0dcncPMEcbPFyAma5BHgtCt0ok39bxE3HWcxWo0yWTh+lwriwAD1pX2NKsRtjZpiB xg== 
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
cy4KPiAKPiBnZXRfdmFkZHJfZnJhbWVzIHVzZXMgcHJvdmlkZWQgdXNlciBwb2ludGVycyBmb3Ig
dm1hIGxvb2t1cHMsIHdoaWNoIGNhbgo+IG9ubHkgYnkgZG9uZSB3aXRoIHVudGFnZ2VkIHBvaW50
ZXJzLiBJbnN0ZWFkIG9mIGxvY2F0aW5nIGFuZCBjaGFuZ2luZwo+IGFsbCBjYWxsZXJzIG9mIHRo
aXMgZnVuY3Rpb24sIHBlcmZvcm0gdW50YWdnaW5nIGluIGl0Lgo+IAo+IEFja2VkLWJ5OiBDYXRh
bGluIE1hcmluYXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IFJldmlld2VkLWJ5OiBLZWVz
IENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29u
b3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gLS0tCgpXaXRoIHRoZSBzdWdnZXN0ZWQg
Y2hhbmdlIHRvIGNvbW1pdCBsb2cgaW4gbXkgcHJldmlvdXMgZW1haWw6CgpSZXZpZXdlZC1ieTog
S2hhbGlkIEF6aXogPGtoYWxpZC5heml6QG9yYWNsZS5jb20+Cgo+ICBtbS9mcmFtZV92ZWN0b3Iu
YyB8IDIgKysKPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9tbS9mcmFtZV92ZWN0b3IuYyBiL21tL2ZyYW1lX3ZlY3Rvci5jCj4gaW5kZXggYzY0ZGNh
NmUyN2MyLi5jNDMxY2E4MWRhZDUgMTAwNjQ0Cj4gLS0tIGEvbW0vZnJhbWVfdmVjdG9yLmMKPiAr
KysgYi9tbS9mcmFtZV92ZWN0b3IuYwo+IEBAIC00Niw2ICs0Niw4IEBAIGludCBnZXRfdmFkZHJf
ZnJhbWVzKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGludCBucl9mcmFtZXMsCj4gIAlp
ZiAoV0FSTl9PTl9PTkNFKG5yX2ZyYW1lcyA+IHZlYy0+bnJfYWxsb2NhdGVkKSkKPiAgCQlucl9m
cmFtZXMgPSB2ZWMtPm5yX2FsbG9jYXRlZDsKPiAgCj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIo
c3RhcnQpOwo+ICsKPiAgCWRvd25fcmVhZCgmbW0tPm1tYXBfc2VtKTsKPiAgCWxvY2tlZCA9IDE7
Cj4gIAl2bWEgPSBmaW5kX3ZtYV9pbnRlcnNlY3Rpb24obW0sIHN0YXJ0LCBzdGFydCArIDEpOwo+
IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
