Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C290941CD3
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:55:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3135989291;
	Wed, 12 Jun 2019 06:53:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B94891E3;
 Tue, 11 Jun 2019 20:18:46 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BKIG4j188569;
 Tue, 11 Jun 2019 20:18:29 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t04etqhfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 20:18:29 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BKIAf4177892;
 Tue, 11 Jun 2019 20:18:28 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t04hyj648-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 20:18:28 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5BKIMpX015673;
 Tue, 11 Jun 2019 20:18:23 GMT
Received: from [10.154.187.61] (/10.154.187.61)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 11 Jun 2019 13:18:22 -0700
Subject: Re: [PATCH v16 04/16] mm: untag user pointers in do_pages_move
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1559580831.git.andreyknvl@google.com>
 <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <d0dffcf8-d7bf-a7b4-5766-3a6f87437851@oracle.com>
Date: Tue, 11 Jun 2019 14:18:18 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <e410843d00a4ecd7e525a7a949e605ffc6c394c4.1559580831.git.andreyknvl@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906110131
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110130
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=pbmzGiYbk5X7Ese6X3ZnPOdFp3xt858d68MV4hL41o8=;
 b=aNfZmQbNP69ST1fFgutdWgNsoHsdTrxkUj7frUiu18XSvo5ty/Pn14NuvBXeongSeXs5
 W+/X6Zg80mFm1wMWd+zVCPCrQRP9QFtEH+cG0F7+uHlQwGnz+OWpR52bZNKpwSlJXUqv
 nMKBQhJ5HrsIVS6xiQg2bgHXLgu1p42NoCzZ/6Z08/cyHiS+fbUmTJNnXs/64PEUCVDy
 LuWVBuquORM9Cl3ljZsvAUUgUitqLMYyHC0GQkhfk1XGzvDOaXFduSfm+GFL8dwtAmDt
 oSfpqPsaE2SKGUeznCaVKxrCypUl2tuyIAul53FQXJZOqETR2JQgxWtw699nf/W05RQb Uw== 
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

T24gNi8zLzE5IDEwOjU1IEFNLCBBbmRyZXkgS29ub3ZhbG92IHdyb3RlOgo+IFRoaXMgcGF0Y2gg
aXMgYSBwYXJ0IG9mIGEgc2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFs
bG93IHRvCj4gcGFzcyB0YWdnZWQgdXNlciBwb2ludGVycyAod2l0aCB0aGUgdG9wIGJ5dGUgc2V0
IHRvIHNvbWV0aGluZyBlbHNlIG90aGVyCj4gdGhhbiAweDAwKSBhcyBzeXNjYWxsIGFyZ3VtZW50
cy4KPiAKPiBkb19wYWdlc19tb3ZlKCkgaXMgdXNlZCBpbiB0aGUgaW1wbGVtZW50YXRpb24gb2Yg
dGhlIG1vdmVfcGFnZXMgc3lzY2FsbC4KPiAKPiBVbnRhZyB1c2VyIHBvaW50ZXJzIGluIHRoaXMg
ZnVuY3Rpb24uCj4gCj4gUmV2aWV3ZWQtYnk6IENhdGFsaW4gTWFyaW5hcyA8Y2F0YWxpbi5tYXJp
bmFzQGFybS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252
bEBnb29nbGUuY29tPgo+IC0tLQo+ICBtbS9taWdyYXRlLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL21tL21pZ3JhdGUuYyBiL21tL21p
Z3JhdGUuYwo+IGluZGV4IGYyZWNjMjg1NWExMi4uMzkzMGJiNmZhNjU2IDEwMDY0NAo+IC0tLSBh
L21tL21pZ3JhdGUuYwo+ICsrKyBiL21tL21pZ3JhdGUuYwo+IEBAIC0xNjE3LDYgKzE2MTcsNyBA
QCBzdGF0aWMgaW50IGRvX3BhZ2VzX21vdmUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIG5vZGVtYXNr
X3QgdGFza19ub2RlcywKPiAgCQlpZiAoZ2V0X3VzZXIobm9kZSwgbm9kZXMgKyBpKSkKPiAgCQkJ
Z290byBvdXRfZmx1c2g7Cj4gIAkJYWRkciA9ICh1bnNpZ25lZCBsb25nKXA7Cj4gKwkJYWRkciA9
IHVudGFnZ2VkX2FkZHIoYWRkcik7CgpXaHkgbm90IGp1c3QgImFkZHIgPSAodW5zaWduZWQgbG9u
Zyl1bnRhZ2dlZF9hZGRyKHApOyIKCi0tCktoYWxpZAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
