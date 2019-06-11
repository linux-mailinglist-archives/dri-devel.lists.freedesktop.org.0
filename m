Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E9641CBA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 08:54:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555168923C;
	Wed, 12 Jun 2019 06:53:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 641AC89209;
 Tue, 11 Jun 2019 20:06:48 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BK5X7D176393;
 Tue, 11 Jun 2019 20:06:20 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2130.oracle.com with ESMTP id 2t04etqfpk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 20:06:20 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5BK52LA147470;
 Tue, 11 Jun 2019 20:06:20 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3030.oracle.com with ESMTP id 2t04hyj0wv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 11 Jun 2019 20:06:19 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5BK6Df4017807;
 Tue, 11 Jun 2019 20:06:13 GMT
Received: from [10.154.187.61] (/10.154.187.61)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 11 Jun 2019 13:06:13 -0700
Subject: Re: [PATCH v16 03/16] lib, arm64: untag user pointers in strn*_user
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1559580831.git.andreyknvl@google.com>
 <14f17ef1902aa4f07a39f96879394e718a1f5dc1.1559580831.git.andreyknvl@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <dd2de772-bd55-86e3-0812-2e01ae97f8fa@oracle.com>
Date: Tue, 11 Jun 2019 14:06:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <14f17ef1902aa4f07a39f96879394e718a1f5dc1.1559580831.git.andreyknvl@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906110129
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9284
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906110129
X-Mailman-Approved-At: Wed, 12 Jun 2019 06:53:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=chD9BHu2Q8n/vFf6CCiBN6lp1HXxmyrKtdEjtx98SfY=;
 b=i+ihcJfD+r++tCN09DcxE+9SdhIRXslpbsen1Ly2b/r82XpfipS+cg5oxIFDHr5z/GAU
 VrRdu7NdT1KOdFyjMhexY6IfvMPY77FUH+FKxtIUXO8d1C0e0tDTPRmvp1FdzV8V7pYX
 U4IzADiDszYzTuo1y6F4qZFiT2b9u6Cz8QDPrN+6Sqlg39FglRjDj2+y+RKoGD/iKR6m
 uDqlrJDwwIbHmVtlRXKy/zbwpgKr8Ch3G7MbdDDHDEU1fdVCH38z0MVPNm3oNSiK0LeC
 adAcFZjzJlLyTbihfu+4rXpoW5PNw7BgFZdrw7mehFHTf2SW6/39ZzEaisuCtPm7xaov 9A== 
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
cy4KPiAKPiBzdHJuY3B5X2Zyb21fdXNlciBhbmQgc3Rybmxlbl91c2VyIGFjY2VwdCB1c2VyIGFk
ZHJlc3NlcyBhcyBhcmd1bWVudHMsIGFuZAo+IGRvIG5vdCBnbyB0aHJvdWdoIHRoZSBzYW1lIHBh
dGggYXMgY29weV9mcm9tX3VzZXIgYW5kIG90aGVycywgc28gaGVyZSB3ZQo+IG5lZWQgdG8gaGFu
ZGxlIHRoZSBjYXNlIG9mIHRhZ2dlZCB1c2VyIGFkZHJlc3NlcyBzZXBhcmF0ZWx5Lgo+IAo+IFVu
dGFnIHVzZXIgcG9pbnRlcnMgcGFzc2VkIHRvIHRoZXNlIGZ1bmN0aW9ucy4KPiAKPiBOb3RlLCB0
aGF0IHRoaXMgcGF0Y2ggb25seSB0ZW1wb3JhcmlseSB1bnRhZ3MgdGhlIHBvaW50ZXJzIHRvIHBl
cmZvcm0KPiB2YWxpZGl0eSBjaGVja3MsIGJ1dCB0aGVuIHVzZXMgdGhlbSBhcyBpcyB0byBwZXJm
b3JtIHVzZXIgbWVtb3J5IGFjY2Vzc2VzLgo+IAo+IFJldmlld2VkLWJ5OiBDYXRhbGluIE1hcmlu
YXMgPGNhdGFsaW4ubWFyaW5hc0Bhcm0uY29tPgo+IFNpZ25lZC1vZmYtYnk6IEFuZHJleSBLb25v
dmFsb3YgPGFuZHJleWtudmxAZ29vZ2xlLmNvbT4KPiAtLS0KPiAgbGliL3N0cm5jcHlfZnJvbV91
c2VyLmMgfCAzICsrLQo+ICBsaWIvc3Rybmxlbl91c2VyLmMgICAgICB8IDMgKystCj4gIDIgZmls
ZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKTG9va3MgZ29vZC4K
ClJldmlld2VkLWJ5OiBLaGFsaWQgQXppeiA8a2hhbGlkLmF6aXpAb3JhY2xlLmNvbT4KCj4gCj4g
ZGlmZiAtLWdpdCBhL2xpYi9zdHJuY3B5X2Zyb21fdXNlci5jIGIvbGliL3N0cm5jcHlfZnJvbV91
c2VyLmMKPiBpbmRleCAwMjNiYTlmM2I5OWYuLmRjY2I5NWFmNjAwMyAxMDA2NDQKPiAtLS0gYS9s
aWIvc3RybmNweV9mcm9tX3VzZXIuYwo+ICsrKyBiL2xpYi9zdHJuY3B5X2Zyb21fdXNlci5jCj4g
QEAgLTYsNiArNiw3IEBACj4gICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4gICNpbmNsdWRl
IDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2Vycm5vLmg+Cj4gKyNpbmNsdWRl
IDxsaW51eC9tbS5oPgo+ICAKPiAgI2luY2x1ZGUgPGFzbS9ieXRlb3JkZXIuaD4KPiAgI2luY2x1
ZGUgPGFzbS93b3JkLWF0LWEtdGltZS5oPgo+IEBAIC0xMDgsNyArMTA5LDcgQEAgbG9uZyBzdHJu
Y3B5X2Zyb21fdXNlcihjaGFyICpkc3QsIGNvbnN0IGNoYXIgX191c2VyICpzcmMsIGxvbmcgY291
bnQpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICAJbWF4X2FkZHIgPSB1c2VyX2FkZHJfbWF4KCk7Cj4g
LQlzcmNfYWRkciA9ICh1bnNpZ25lZCBsb25nKXNyYzsKPiArCXNyY19hZGRyID0gKHVuc2lnbmVk
IGxvbmcpdW50YWdnZWRfYWRkcihzcmMpOwo+ICAJaWYgKGxpa2VseShzcmNfYWRkciA8IG1heF9h
ZGRyKSkgewo+ICAJCXVuc2lnbmVkIGxvbmcgbWF4ID0gbWF4X2FkZHIgLSBzcmNfYWRkcjsKPiAg
CQlsb25nIHJldHZhbDsKPiBkaWZmIC0tZ2l0IGEvbGliL3N0cm5sZW5fdXNlci5jIGIvbGliL3N0
cm5sZW5fdXNlci5jCj4gaW5kZXggN2YyZGIzZmUzMTFmLi4yOGZmNTU0YTFiZTggMTAwNjQ0Cj4g
LS0tIGEvbGliL3N0cm5sZW5fdXNlci5jCj4gKysrIGIvbGliL3N0cm5sZW5fdXNlci5jCj4gQEAg
LTIsNiArMiw3IEBACj4gICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KPiAgI2luY2x1ZGUgPGxp
bnV4L2V4cG9ydC5oPgo+ICAjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ICsjaW5jbHVkZSA8
bGludXgvbW0uaD4KPiAgCj4gICNpbmNsdWRlIDxhc20vd29yZC1hdC1hLXRpbWUuaD4KPiAgCj4g
QEAgLTEwOSw3ICsxMTAsNyBAQCBsb25nIHN0cm5sZW5fdXNlcihjb25zdCBjaGFyIF9fdXNlciAq
c3RyLCBsb25nIGNvdW50KQo+ICAJCXJldHVybiAwOwo+ICAKPiAgCW1heF9hZGRyID0gdXNlcl9h
ZGRyX21heCgpOwo+IC0Jc3JjX2FkZHIgPSAodW5zaWduZWQgbG9uZylzdHI7Cj4gKwlzcmNfYWRk
ciA9ICh1bnNpZ25lZCBsb25nKXVudGFnZ2VkX2FkZHIoc3RyKTsKPiAgCWlmIChsaWtlbHkoc3Jj
X2FkZHIgPCBtYXhfYWRkcikpIHsKPiAgCQl1bnNpZ25lZCBsb25nIG1heCA9IG1heF9hZGRyIC0g
c3JjX2FkZHI7Cj4gIAkJbG9uZyByZXR2YWw7Cj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
