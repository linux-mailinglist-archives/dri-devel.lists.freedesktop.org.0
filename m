Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB964C803
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C2166E508;
	Thu, 20 Jun 2019 07:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1456E3F7;
 Wed, 19 Jun 2019 15:56:23 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JFrt88113520;
 Wed, 19 Jun 2019 15:56:00 GMT
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2t7809cba1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 15:56:00 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JFsVbp049987;
 Wed, 19 Jun 2019 15:55:59 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by aserp3020.oracle.com with ESMTP id 2t77ynx8s0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 15:55:59 +0000
Received: from abhmp0014.oracle.com (abhmp0014.oracle.com [141.146.116.20])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x5JFtpTh010454;
 Wed, 19 Jun 2019 15:55:51 GMT
Received: from [10.65.164.174] (/10.65.164.174)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 08:55:51 -0700
Subject: Re: [PATCH v17 04/15] mm, arm64: untag user pointers passed to memory
 syscalls
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <f9b50767d639b7116aa986dc67f158131b8d4169.1560339705.git.andreyknvl@google.com>
From: Khalid Aziz <khalid.aziz@oracle.com>
Organization: Oracle Corp
Message-ID: <a5e0e465-89d5-91d0-c6a4-39674269bbf2@oracle.com>
Date: Wed, 19 Jun 2019 09:55:45 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <f9b50767d639b7116aa986dc67f158131b8d4169.1560339705.git.andreyknvl@google.com>
Content-Language: en-US
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1906190128
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9293
 signatures=668687
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190128
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=SoDrd9n3X32J5yU22MXe5hxvbr0oADlAzco6AaNmPlY=;
 b=tiWkZ/w95Jnc750JE7NdIbSVLAxuNCJanB6vqjZPJ1aa3V8V1zz7hD/Mpir7yCJj4IkD
 UQZJ4T89Du+KDCmcxRn0ky0McpX+U/kGRnqOQRs9Q9lPNTQrXSPaHIcnrAd14qwTT+Ls
 CGw1pVAKq/48OOP4FVYkyfrOoPEKCzD3TVQpqowv9EXgafE2X+GyV2ycT9MSpTab4s91
 k+axl+0IYieWJcr4RyrP9FuovImoVA8NHW3+4dnQhyAVZXUqxpDMsH20ju5Zy1ck0hGd
 PWwheucUcbKKfNgIakqhbBRgWYJkSnvYDhZj4P1QxV3xVq7enCqaFO9qReDYFpCFmV9e cg== 
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
cy4KPiAKPiBUaGlzIHBhdGNoIGFsbG93cyB0YWdnZWQgcG9pbnRlcnMgdG8gYmUgcGFzc2VkIHRv
IHRoZSBmb2xsb3dpbmcgbWVtb3J5Cj4gc3lzY2FsbHM6IGdldF9tZW1wb2xpY3ksIG1hZHZpc2Us
IG1iaW5kLCBtaW5jb3JlLCBtbG9jaywgbWxvY2syLCBtcHJvdGVjdCwKPiBtcmVtYXAsIG1zeW5j
LCBtdW5sb2NrLCBtb3ZlX3BhZ2VzLgo+IAo+IFRoZSBtbWFwIGFuZCBtcmVtYXAgc3lzY2FsbHMg
ZG8gbm90IGN1cnJlbnRseSBhY2NlcHQgdGFnZ2VkIGFkZHJlc3Nlcy4KPiBBcmNoaXRlY3R1cmVz
IG1heSBpbnRlcnByZXQgdGhlIHRhZyBhcyBhIGJhY2tncm91bmQgY29sb3VyIGZvciB0aGUKPiBj
b3JyZXNwb25kaW5nIHZtYS4KPiAKPiBSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRh
bGluLm1hcmluYXNAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogS2VlcyBDb29rIDxrZWVzY29va0Bj
aHJvbWl1bS5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5IEtvbm92YWxvdiA8YW5kcmV5a252
bEBnb29nbGUuY29tPgo+IC0tLQoKUmV2aWV3ZWQtYnk6IEtoYWxpZCBBeml6IDxraGFsaWQuYXpp
ekBvcmFjbGUuY29tPgoKCj4gIG1tL21hZHZpc2UuYyAgIHwgMiArKwo+ICBtbS9tZW1wb2xpY3ku
YyB8IDMgKysrCj4gIG1tL21pZ3JhdGUuYyAgIHwgMiArLQo+ICBtbS9taW5jb3JlLmMgICB8IDIg
KysKPiAgbW0vbWxvY2suYyAgICAgfCA0ICsrKysKPiAgbW0vbXByb3RlY3QuYyAgfCAyICsrCj4g
IG1tL21yZW1hcC5jICAgIHwgNyArKysrKysrCj4gIG1tL21zeW5jLmMgICAgIHwgMiArKwo+ICA4
IGZpbGVzIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvbW0vbWFkdmlzZS5jIGIvbW0vbWFkdmlzZS5jCj4gaW5kZXggNjI4MDIyZTY3NGE3
Li4zOWI4MmY4YTY5OGYgMTAwNjQ0Cj4gLS0tIGEvbW0vbWFkdmlzZS5jCj4gKysrIGIvbW0vbWFk
dmlzZS5jCj4gQEAgLTgxMCw2ICs4MTAsOCBAQCBTWVNDQUxMX0RFRklORTMobWFkdmlzZSwgdW5z
aWduZWQgbG9uZywgc3RhcnQsIHNpemVfdCwgbGVuX2luLCBpbnQsIGJlaGF2aW9yKQo+ICAJc2l6
ZV90IGxlbjsKPiAgCXN0cnVjdCBibGtfcGx1ZyBwbHVnOwo+ICAKPiArCXN0YXJ0ID0gdW50YWdn
ZWRfYWRkcihzdGFydCk7Cj4gKwo+ICAJaWYgKCFtYWR2aXNlX2JlaGF2aW9yX3ZhbGlkKGJlaGF2
aW9yKSkKPiAgCQlyZXR1cm4gZXJyb3I7Cj4gIAo+IGRpZmYgLS1naXQgYS9tbS9tZW1wb2xpY3ku
YyBiL21tL21lbXBvbGljeS5jCj4gaW5kZXggMDE2MDBkODBhZTAxLi43OGUwYTg4YjI2ODAgMTAw
NjQ0Cj4gLS0tIGEvbW0vbWVtcG9saWN5LmMKPiArKysgYi9tbS9tZW1wb2xpY3kuYwo+IEBAIC0x
MzYwLDYgKzEzNjAsNyBAQCBzdGF0aWMgbG9uZyBrZXJuZWxfbWJpbmQodW5zaWduZWQgbG9uZyBz
dGFydCwgdW5zaWduZWQgbG9uZyBsZW4sCj4gIAlpbnQgZXJyOwo+ICAJdW5zaWduZWQgc2hvcnQg
bW9kZV9mbGFnczsKPiAgCj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOwo+ICAJbW9k
ZV9mbGFncyA9IG1vZGUgJiBNUE9MX01PREVfRkxBR1M7Cj4gIAltb2RlICY9IH5NUE9MX01PREVf
RkxBR1M7Cj4gIAlpZiAobW9kZSA+PSBNUE9MX01BWCkKPiBAQCAtMTUxNyw2ICsxNTE4LDggQEAg
c3RhdGljIGludCBrZXJuZWxfZ2V0X21lbXBvbGljeShpbnQgX191c2VyICpwb2xpY3ksCj4gIAlp
bnQgdW5pbml0aWFsaXplZF92YXIocHZhbCk7Cj4gIAlub2RlbWFza190IG5vZGVzOwo+ICAKPiAr
CWFkZHIgPSB1bnRhZ2dlZF9hZGRyKGFkZHIpOwo+ICsKPiAgCWlmIChubWFzayAhPSBOVUxMICYm
IG1heG5vZGUgPCBucl9ub2RlX2lkcykKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4gZGlmZiAt
LWdpdCBhL21tL21pZ3JhdGUuYyBiL21tL21pZ3JhdGUuYwo+IGluZGV4IGYyZWNjMjg1NWExMi4u
ZDIyYzQ1Y2YzNmIyIDEwMDY0NAo+IC0tLSBhL21tL21pZ3JhdGUuYwo+ICsrKyBiL21tL21pZ3Jh
dGUuYwo+IEBAIC0xNjE2LDcgKzE2MTYsNyBAQCBzdGF0aWMgaW50IGRvX3BhZ2VzX21vdmUoc3Ry
dWN0IG1tX3N0cnVjdCAqbW0sIG5vZGVtYXNrX3QgdGFza19ub2RlcywKPiAgCQkJZ290byBvdXRf
Zmx1c2g7Cj4gIAkJaWYgKGdldF91c2VyKG5vZGUsIG5vZGVzICsgaSkpCj4gIAkJCWdvdG8gb3V0
X2ZsdXNoOwo+IC0JCWFkZHIgPSAodW5zaWduZWQgbG9uZylwOwo+ICsJCWFkZHIgPSAodW5zaWdu
ZWQgbG9uZyl1bnRhZ2dlZF9hZGRyKHApOwo+ICAKPiAgCQllcnIgPSAtRU5PREVWOwo+ICAJCWlm
IChub2RlIDwgMCB8fCBub2RlID49IE1BWF9OVU1OT0RFUykKPiBkaWZmIC0tZ2l0IGEvbW0vbWlu
Y29yZS5jIGIvbW0vbWluY29yZS5jCj4gaW5kZXggYzNmMDU4YmQwZmFmLi42NGMzMjJlZDg0NWMg
MTAwNjQ0Cj4gLS0tIGEvbW0vbWluY29yZS5jCj4gKysrIGIvbW0vbWluY29yZS5jCj4gQEAgLTI0
OSw2ICsyNDksOCBAQCBTWVNDQUxMX0RFRklORTMobWluY29yZSwgdW5zaWduZWQgbG9uZywgc3Rh
cnQsIHNpemVfdCwgbGVuLAo+ICAJdW5zaWduZWQgbG9uZyBwYWdlczsKPiAgCXVuc2lnbmVkIGNo
YXIgKnRtcDsKPiAgCj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOwo+ICsKPiAgCS8q
IENoZWNrIHRoZSBzdGFydCBhZGRyZXNzOiBuZWVkcyB0byBiZSBwYWdlLWFsaWduZWQuLiAqLwo+
ICAJaWYgKHN0YXJ0ICYgflBBR0VfTUFTSykKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiBkaWZmIC0t
Z2l0IGEvbW0vbWxvY2suYyBiL21tL21sb2NrLmMKPiBpbmRleCAwODBmM2IzNjQxNWIuLmU4MjYw
OWVhYTQyOCAxMDA2NDQKPiAtLS0gYS9tbS9tbG9jay5jCj4gKysrIGIvbW0vbWxvY2suYwo+IEBA
IC02NzQsNiArNjc0LDggQEAgc3RhdGljIF9fbXVzdF9jaGVjayBpbnQgZG9fbWxvY2sodW5zaWdu
ZWQgbG9uZyBzdGFydCwgc2l6ZV90IGxlbiwgdm1fZmxhZ3NfdCBmbGEKPiAgCXVuc2lnbmVkIGxv
bmcgbG9ja19saW1pdDsKPiAgCWludCBlcnJvciA9IC1FTk9NRU07Cj4gIAo+ICsJc3RhcnQgPSB1
bnRhZ2dlZF9hZGRyKHN0YXJ0KTsKPiArCj4gIAlpZiAoIWNhbl9kb19tbG9jaygpKQo+ICAJCXJl
dHVybiAtRVBFUk07Cj4gIAo+IEBAIC03MzUsNiArNzM3LDggQEAgU1lTQ0FMTF9ERUZJTkUyKG11
bmxvY2ssIHVuc2lnbmVkIGxvbmcsIHN0YXJ0LCBzaXplX3QsIGxlbikKPiAgewo+ICAJaW50IHJl
dDsKPiAgCj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOwo+ICsKPiAgCWxlbiA9IFBB
R0VfQUxJR04obGVuICsgKG9mZnNldF9pbl9wYWdlKHN0YXJ0KSkpOwo+ICAJc3RhcnQgJj0gUEFH
RV9NQVNLOwo+ICAKPiBkaWZmIC0tZ2l0IGEvbW0vbXByb3RlY3QuYyBiL21tL21wcm90ZWN0LmMK
PiBpbmRleCBiZjM4ZGZiYmI0YjQuLjE5Zjk4MWI3MzNiYyAxMDA2NDQKPiAtLS0gYS9tbS9tcHJv
dGVjdC5jCj4gKysrIGIvbW0vbXByb3RlY3QuYwo+IEBAIC00NjUsNiArNDY1LDggQEAgc3RhdGlj
IGludCBkb19tcHJvdGVjdF9wa2V5KHVuc2lnbmVkIGxvbmcgc3RhcnQsIHNpemVfdCBsZW4sCj4g
IAljb25zdCBib29sIHJpZXIgPSAoY3VycmVudC0+cGVyc29uYWxpdHkgJiBSRUFEX0lNUExJRVNf
RVhFQykgJiYKPiAgCQkJCShwcm90ICYgUFJPVF9SRUFEKTsKPiAgCj4gKwlzdGFydCA9IHVudGFn
Z2VkX2FkZHIoc3RhcnQpOwo+ICsKPiAgCXByb3QgJj0gfihQUk9UX0dST1dTRE9XTnxQUk9UX0dS
T1dTVVApOwo+ICAJaWYgKGdyb3dzID09IChQUk9UX0dST1dTRE9XTnxQUk9UX0dST1dTVVApKSAv
KiBjYW4ndCBiZSBib3RoICovCj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4gZGlmZiAtLWdpdCBhL21t
L21yZW1hcC5jIGIvbW0vbXJlbWFwLmMKPiBpbmRleCBmYzI0MWQyM2NkOTcuLjY0YzlhM2I4YmUw
YSAxMDA2NDQKPiAtLS0gYS9tbS9tcmVtYXAuYwo+ICsrKyBiL21tL21yZW1hcC5jCj4gQEAgLTYw
Niw2ICs2MDYsMTMgQEAgU1lTQ0FMTF9ERUZJTkU1KG1yZW1hcCwgdW5zaWduZWQgbG9uZywgYWRk
ciwgdW5zaWduZWQgbG9uZywgb2xkX2xlbiwKPiAgCUxJU1RfSEVBRCh1Zl91bm1hcF9lYXJseSk7
Cj4gIAlMSVNUX0hFQUQodWZfdW5tYXApOwo+ICAKPiArCS8qCj4gKwkgKiBBcmNoaXRlY3R1cmVz
IG1heSBpbnRlcnByZXQgdGhlIHRhZyBwYXNzZWQgdG8gbW1hcCBhcyBhIGJhY2tncm91bmQKPiAr
CSAqIGNvbG91ciBmb3IgdGhlIGNvcnJlc3BvbmRpbmcgdm1hLiBGb3IgbXJlbWFwIHdlIGRvbid0
IGFsbG93IHRhZ2dlZAo+ICsJICogbmV3X2FkZHIgdG8gcHJlc2VydmUgc2ltaWxhciBiZWhhdmlv
dXIgdG8gbW1hcC4KPiArCSAqLwo+ICsJYWRkciA9IHVudGFnZ2VkX2FkZHIoYWRkcik7Cj4gKwo+
ICAJaWYgKGZsYWdzICYgfihNUkVNQVBfRklYRUQgfCBNUkVNQVBfTUFZTU9WRSkpCj4gIAkJcmV0
dXJuIHJldDsKPiAgCj4gZGlmZiAtLWdpdCBhL21tL21zeW5jLmMgYi9tbS9tc3luYy5jCj4gaW5k
ZXggZWYzMGE0Mjk2MjNhLi5jM2JkM2U3NWY2ODcgMTAwNjQ0Cj4gLS0tIGEvbW0vbXN5bmMuYwo+
ICsrKyBiL21tL21zeW5jLmMKPiBAQCAtMzcsNiArMzcsOCBAQCBTWVNDQUxMX0RFRklORTMobXN5
bmMsIHVuc2lnbmVkIGxvbmcsIHN0YXJ0LCBzaXplX3QsIGxlbiwgaW50LCBmbGFncykKPiAgCWlu
dCB1bm1hcHBlZF9lcnJvciA9IDA7Cj4gIAlpbnQgZXJyb3IgPSAtRUlOVkFMOwo+ICAKPiArCXN0
YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4gKwo+ICAJaWYgKGZsYWdzICYgfihNU19BU1lO
QyB8IE1TX0lOVkFMSURBVEUgfCBNU19TWU5DKSkKPiAgCQlnb3RvIG91dDsKPiAgCWlmIChvZmZz
ZXRfaW5fcGFnZShzdGFydCkpCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
