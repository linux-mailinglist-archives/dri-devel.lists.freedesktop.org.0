Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF444C807
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56CA56E516;
	Thu, 20 Jun 2019 07:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C736E443;
 Wed, 19 Jun 2019 16:41:36 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JGZ3BA139193;
 Wed, 19 Jun 2019 16:41:19 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2130.oracle.com with ESMTP id 2t7809ckb0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 16:41:19 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JGeTfm168992;
 Wed, 19 Jun 2019 16:41:18 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2t77ynxysy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 16:41:18 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5JGfFiP008310;
 Wed, 19 Jun 2019 16:41:16 GMT
Received: from [10.65.164.174] (/10.65.164.174)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 09:41:15 -0700
Subject: Re: [PATCH v17 05/15] mm, arm64: untag user pointers in mm/gup.c
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <8f65548bef8544d49980a92d221b74440d544c1e.1560339705.git.andreyknvl@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <dbf2dd46-0240-f8a9-203c-4f1234c16825@oracle.com>
Date: Wed, 19 Jun 2019 10:41:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8f65548bef8544d49980a92d221b74440d544c1e.1560339705.git.andreyknvl@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190134
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190134
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=4T5a0glbRa2aBSKkc/pjnTjMsTPHECFT1E9bbL1l2HM=;
 b=iM3Ngn2x6aaNg+8wMaz2TYv3kwfBr7esbrJ8PsegJPNksN4Z/YjPTI3TmHcIUAH5xIxd
 gAnjdNn//nUURYK/24P/Mz+8CWzLw/ldkJ0Ah8cTKTN8TsQstYz7Wc1JokBHslvlpojt
 t58Ckn54FcLS6JnUQMgNT/8sCvOqKf+qXUPK2SC5pwHYaAG2DxzZEfDTOmnxSxjRlk17
 81k1k3JZIHS9isv6MaXvl6eghbedIhy09UL0UJZ7M5tLa9EvLThKgTnTshAaPgND2Tmz
 VORmseouIshgIQ+DfXX2+2Cq67n27+huaukcohM59RMNDmLVIT4WZNeTT5o/4WBjQ22r Kg== 
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
cy4KPiAKPiBtbS9ndXAuYyBwcm92aWRlcyBhIGtlcm5lbCBpbnRlcmZhY2UgdGhhdCBhY2NlcHRz
IHVzZXIgYWRkcmVzc2VzIGFuZAo+IG1hbmlwdWxhdGVzIHVzZXIgcGFnZXMgZGlyZWN0bHkgKGZv
ciBleGFtcGxlIGdldF91c2VyX3BhZ2VzLCB0aGF0IGlzIHVzZWQKPiBieSB0aGUgZnV0ZXggc3lz
Y2FsbCkuIFNpbmNlIGEgdXNlciBjYW4gcHJvdmlkZWQgdGFnZ2VkIGFkZHJlc3Nlcywgd2UgbmVl
ZAo+IHRvIGhhbmRsZSB0aGlzIGNhc2UuCj4gCj4gQWRkIHVudGFnZ2luZyB0byBndXAuYyBmdW5j
dGlvbnMgdGhhdCB1c2UgdXNlciBhZGRyZXNzZXMgZm9yIHZtYSBsb29rdXBzLgo+IAo+IFJldmll
d2VkLWJ5OiBLZWVzIENvb2sgPGtlZXNjb29rQGNocm9taXVtLm9yZz4KPiBSZXZpZXdlZC1ieTog
Q2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1hcmluYXNAYXJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5
OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdvb2dsZS5jb20+Cj4gLS0tCgpSZXZpZXdl
ZC1ieTogS2hhbGlkIEF6aXogPGtoYWxpZC5heml6QG9yYWNsZS5jb20+CgoKPiAgbW0vZ3VwLmMg
fCA0ICsrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1n
aXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jCj4gaW5kZXggZGRkZTA5N2NmOWU0Li5jMzdkZjNkNDU1
YTIgMTAwNjQ0Cj4gLS0tIGEvbW0vZ3VwLmMKPiArKysgYi9tbS9ndXAuYwo+IEBAIC04MDIsNiAr
ODAyLDggQEAgc3RhdGljIGxvbmcgX19nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgdGFza19zdHJ1Y3Qg
KnRzaywgc3RydWN0IG1tX3N0cnVjdCAqbW0sCj4gIAlpZiAoIW5yX3BhZ2VzKQo+ICAJCXJldHVy
biAwOwo+ICAKPiArCXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gKwo+ICAJVk1fQlVH
X09OKCEhcGFnZXMgIT0gISEoZ3VwX2ZsYWdzICYgRk9MTF9HRVQpKTsKPiAgCj4gIAkvKgo+IEBA
IC05NjQsNiArOTY2LDggQEAgaW50IGZpeHVwX3VzZXJfZmF1bHQoc3RydWN0IHRhc2tfc3RydWN0
ICp0c2ssIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2
bWE7Cj4gIAl2bV9mYXVsdF90IHJldCwgbWFqb3IgPSAwOwo+ICAKPiArCWFkZHJlc3MgPSB1bnRh
Z2dlZF9hZGRyKGFkZHJlc3MpOwo+ICsKPiAgCWlmICh1bmxvY2tlZCkKPiAgCQlmYXVsdF9mbGFn
cyB8PSBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZOwo+ICAKPiAKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
