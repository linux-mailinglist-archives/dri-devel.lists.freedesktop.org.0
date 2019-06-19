Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 956474C7EE
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 09:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57B966E4F0;
	Thu, 20 Jun 2019 07:13:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from userp2120.oracle.com (userp2120.oracle.com [156.151.31.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA5F96E444;
 Wed, 19 Jun 2019 16:46:41 +0000 (UTC)
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JGhjWl155566;
 Wed, 19 Jun 2019 16:46:26 GMT
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by userp2120.oracle.com with ESMTP id 2t7809ckcb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 16:46:26 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x5JGjFFn117750;
 Wed, 19 Jun 2019 16:46:25 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2t7rdwrdpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 16:46:25 +0000
Received: from abhmp0020.oracle.com (abhmp0020.oracle.com [141.146.116.26])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x5JGkK2N016173;
 Wed, 19 Jun 2019 16:46:21 GMT
Received: from [10.65.164.174] (/10.65.164.174)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 19 Jun 2019 16:46:20 +0000
Subject: Re: [PATCH v17 04/15] mm, arm64: untag user pointers passed to memory
 syscalls
From: Khalid Aziz <khalid.aziz@oracle.com>
To: Andrey Konovalov <andreyknvl@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1560339705.git.andreyknvl@google.com>
 <f9b50767d639b7116aa986dc67f158131b8d4169.1560339705.git.andreyknvl@google.com>
 <a5e0e465-89d5-91d0-c6a4-39674269bbf2@oracle.com>
Organization: Oracle Corp
Message-ID: <c4bdd767-eb3f-6668-0f49-4aaf4bc7689d@oracle.com>
Date: Wed, 19 Jun 2019 10:46:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <a5e0e465-89d5-91d0-c6a4-39674269bbf2@oracle.com>
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
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1906190135
X-Mailman-Approved-At: Thu, 20 Jun 2019 07:13:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.com; h=subject : from : to :
 cc : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2018-07-02;
 bh=qusBZmUrIraq40u5N2NLdGl6YAsSyS9aTyEvugUt21g=;
 b=3mOkbOhlBhirjqM80aK6s+wRkh63tDNK1RaC8xSpawtTEs22m3XRqKFCk5ZcVxQMeWWG
 oRqUIvbznqi8D/D4MfvNkUkTBObbb4xfdaZ+9y+7KCIERhSCf6fxDDTVjDvV7P4EcaLQ
 4ZoMmuup5lX7IGS8rh6szCE52BCuQdLriDGNSBTner55/rw1yPgc4xaDRa4nb2Y3jhO3
 JZBwISQ+4KZBRUU7ULX20bWmFi/EyzzMzXYgNNh/5zIapfvldsDZjRNNQzsEdP4praRm
 fnPHRUIEeAD5QVV8LOtA3Ajj+V7lRKrReZleJwOMtbES5LrqqDoDLwtauDb4vj2fYUoh lg== 
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

T24gNi8xOS8xOSA5OjU1IEFNLCBLaGFsaWQgQXppeiB3cm90ZToKPiBPbiA2LzEyLzE5IDU6NDMg
QU0sIEFuZHJleSBLb25vdmFsb3Ygd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggaXMgYSBwYXJ0IG9mIGEg
c2VyaWVzIHRoYXQgZXh0ZW5kcyBhcm02NCBrZXJuZWwgQUJJIHRvIGFsbG93IHRvCj4+IHBhc3Mg
dGFnZ2VkIHVzZXIgcG9pbnRlcnMgKHdpdGggdGhlIHRvcCBieXRlIHNldCB0byBzb21ldGhpbmcg
ZWxzZSBvdGhlcgo+PiB0aGFuIDB4MDApIGFzIHN5c2NhbGwgYXJndW1lbnRzLgo+Pgo+PiBUaGlz
IHBhdGNoIGFsbG93cyB0YWdnZWQgcG9pbnRlcnMgdG8gYmUgcGFzc2VkIHRvIHRoZSBmb2xsb3dp
bmcgbWVtb3J5Cj4+IHN5c2NhbGxzOiBnZXRfbWVtcG9saWN5LCBtYWR2aXNlLCBtYmluZCwgbWlu
Y29yZSwgbWxvY2ssIG1sb2NrMiwgbXByb3RlY3QsCj4+IG1yZW1hcCwgbXN5bmMsIG11bmxvY2ss
IG1vdmVfcGFnZXMuCj4+Cj4+IFRoZSBtbWFwIGFuZCBtcmVtYXAgc3lzY2FsbHMgZG8gbm90IGN1
cnJlbnRseSBhY2NlcHQgdGFnZ2VkIGFkZHJlc3Nlcy4KPj4gQXJjaGl0ZWN0dXJlcyBtYXkgaW50
ZXJwcmV0IHRoZSB0YWcgYXMgYSBiYWNrZ3JvdW5kIGNvbG91ciBmb3IgdGhlCj4+IGNvcnJlc3Bv
bmRpbmcgdm1hLgo+Pgo+PiBSZXZpZXdlZC1ieTogQ2F0YWxpbiBNYXJpbmFzIDxjYXRhbGluLm1h
cmluYXNAYXJtLmNvbT4KPj4gUmV2aWV3ZWQtYnk6IEtlZXMgQ29vayA8a2Vlc2Nvb2tAY2hyb21p
dW0ub3JnPgo+PiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgS29ub3ZhbG92IDxhbmRyZXlrbnZsQGdv
b2dsZS5jb20+Cj4+IC0tLQo+IAo+IFJldmlld2VkLWJ5OiBLaGFsaWQgQXppeiA8a2hhbGlkLmF6
aXpAb3JhY2xlLmNvbT4KPiAKPiAKCkkgd291bGQgYWxzbyByZWNvbW1lbmQgdXBkYXRpbmcgY29t
bWl0IGxvZyBmb3IgYWxsIHRoZSBwYXRjaGVzIGluIHRoaXMKc2VyaWVzIHRoYXQgYXJlIGNoYW5n
aW5nIGZpbGVzIHVuZGVyIG1tLyBhcyBvcHBvc2VkIHRvIGFyY2gvYXJtNjQgdG8gbm90CnJlZmVy
ZW5jZSBhcm02NCBrZXJuZWwgQUJJIHNpbmNlIHRoZSBjaGFuZ2UgYXBwbGllcyB0byBldmVyeQph
cmNoaXRlY3R1cmUuIFNvIHNvbWV0aGluZyBhbG9uZyB0aGUgbGluZXMgb2YgIlRoaXMgcGF0Y2gg
aXMgcGFydCBvZiBhCnNlcmllcyB0aGF0IGV4dGVuZHMga2VybmVsIEFCSSB0byBhbGxvdy4uLi4u
Li4iCgotLQpLaGFsaWQKCgo+PiAgbW0vbWFkdmlzZS5jICAgfCAyICsrCj4+ICBtbS9tZW1wb2xp
Y3kuYyB8IDMgKysrCj4+ICBtbS9taWdyYXRlLmMgICB8IDIgKy0KPj4gIG1tL21pbmNvcmUuYyAg
IHwgMiArKwo+PiAgbW0vbWxvY2suYyAgICAgfCA0ICsrKysKPj4gIG1tL21wcm90ZWN0LmMgIHwg
MiArKwo+PiAgbW0vbXJlbWFwLmMgICAgfCA3ICsrKysrKysKPj4gIG1tL21zeW5jLmMgICAgIHwg
MiArKwo+PiAgOCBmaWxlcyBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4+Cj4+IGRpZmYgLS1naXQgYS9tbS9tYWR2aXNlLmMgYi9tbS9tYWR2aXNlLmMKPj4gaW5kZXgg
NjI4MDIyZTY3NGE3Li4zOWI4MmY4YTY5OGYgMTAwNjQ0Cj4+IC0tLSBhL21tL21hZHZpc2UuYwo+
PiArKysgYi9tbS9tYWR2aXNlLmMKPj4gQEAgLTgxMCw2ICs4MTAsOCBAQCBTWVNDQUxMX0RFRklO
RTMobWFkdmlzZSwgdW5zaWduZWQgbG9uZywgc3RhcnQsIHNpemVfdCwgbGVuX2luLCBpbnQsIGJl
aGF2aW9yKQo+PiAgCXNpemVfdCBsZW47Cj4+ICAJc3RydWN0IGJsa19wbHVnIHBsdWc7Cj4+ICAK
Pj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOwo+PiArCj4+ICAJaWYgKCFtYWR2aXNl
X2JlaGF2aW9yX3ZhbGlkKGJlaGF2aW9yKSkKPj4gIAkJcmV0dXJuIGVycm9yOwo+PiAgCj4+IGRp
ZmYgLS1naXQgYS9tbS9tZW1wb2xpY3kuYyBiL21tL21lbXBvbGljeS5jCj4+IGluZGV4IDAxNjAw
ZDgwYWUwMS4uNzhlMGE4OGIyNjgwIDEwMDY0NAo+PiAtLS0gYS9tbS9tZW1wb2xpY3kuYwo+PiAr
KysgYi9tbS9tZW1wb2xpY3kuYwo+PiBAQCAtMTM2MCw2ICsxMzYwLDcgQEAgc3RhdGljIGxvbmcg
a2VybmVsX21iaW5kKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgbGVuLAo+PiAg
CWludCBlcnI7Cj4+ICAJdW5zaWduZWQgc2hvcnQgbW9kZV9mbGFnczsKPj4gIAo+PiArCXN0YXJ0
ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4+ICAJbW9kZV9mbGFncyA9IG1vZGUgJiBNUE9MX01P
REVfRkxBR1M7Cj4+ICAJbW9kZSAmPSB+TVBPTF9NT0RFX0ZMQUdTOwo+PiAgCWlmIChtb2RlID49
IE1QT0xfTUFYKQo+PiBAQCAtMTUxNyw2ICsxNTE4LDggQEAgc3RhdGljIGludCBrZXJuZWxfZ2V0
X21lbXBvbGljeShpbnQgX191c2VyICpwb2xpY3ksCj4+ICAJaW50IHVuaW5pdGlhbGl6ZWRfdmFy
KHB2YWwpOwo+PiAgCW5vZGVtYXNrX3Qgbm9kZXM7Cj4+ICAKPj4gKwlhZGRyID0gdW50YWdnZWRf
YWRkcihhZGRyKTsKPj4gKwo+PiAgCWlmIChubWFzayAhPSBOVUxMICYmIG1heG5vZGUgPCBucl9u
b2RlX2lkcykKPj4gIAkJcmV0dXJuIC1FSU5WQUw7Cj4+ICAKPj4gZGlmZiAtLWdpdCBhL21tL21p
Z3JhdGUuYyBiL21tL21pZ3JhdGUuYwo+PiBpbmRleCBmMmVjYzI4NTVhMTIuLmQyMmM0NWNmMzZi
MiAxMDA2NDQKPj4gLS0tIGEvbW0vbWlncmF0ZS5jCj4+ICsrKyBiL21tL21pZ3JhdGUuYwo+PiBA
QCAtMTYxNiw3ICsxNjE2LDcgQEAgc3RhdGljIGludCBkb19wYWdlc19tb3ZlKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLCBub2RlbWFza190IHRhc2tfbm9kZXMsCj4+ICAJCQlnb3RvIG91dF9mbHVzaDsK
Pj4gIAkJaWYgKGdldF91c2VyKG5vZGUsIG5vZGVzICsgaSkpCj4+ICAJCQlnb3RvIG91dF9mbHVz
aDsKPj4gLQkJYWRkciA9ICh1bnNpZ25lZCBsb25nKXA7Cj4+ICsJCWFkZHIgPSAodW5zaWduZWQg
bG9uZyl1bnRhZ2dlZF9hZGRyKHApOwo+PiAgCj4+ICAJCWVyciA9IC1FTk9ERVY7Cj4+ICAJCWlm
IChub2RlIDwgMCB8fCBub2RlID49IE1BWF9OVU1OT0RFUykKPj4gZGlmZiAtLWdpdCBhL21tL21p
bmNvcmUuYyBiL21tL21pbmNvcmUuYwo+PiBpbmRleCBjM2YwNThiZDBmYWYuLjY0YzMyMmVkODQ1
YyAxMDA2NDQKPj4gLS0tIGEvbW0vbWluY29yZS5jCj4+ICsrKyBiL21tL21pbmNvcmUuYwo+PiBA
QCAtMjQ5LDYgKzI0OSw4IEBAIFNZU0NBTExfREVGSU5FMyhtaW5jb3JlLCB1bnNpZ25lZCBsb25n
LCBzdGFydCwgc2l6ZV90LCBsZW4sCj4+ICAJdW5zaWduZWQgbG9uZyBwYWdlczsKPj4gIAl1bnNp
Z25lZCBjaGFyICp0bXA7Cj4+ICAKPj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpOwo+
PiArCj4+ICAJLyogQ2hlY2sgdGhlIHN0YXJ0IGFkZHJlc3M6IG5lZWRzIHRvIGJlIHBhZ2UtYWxp
Z25lZC4uICovCj4+ICAJaWYgKHN0YXJ0ICYgflBBR0VfTUFTSykKPj4gIAkJcmV0dXJuIC1FSU5W
QUw7Zml4dXBfdXNlcl9mYXVsdAo+PiBkaWZmIC0tZ2l0IGEvbW0vbWxvY2suYyBiL21tL21sb2Nr
LmMKPj4gaW5kZXggMDgwZjNiMzY0MTViLi5lODI2MDllYWE0MjggMTAwNjQ0Cj4+IC0tLSBhL21t
L21sb2NrLmMKPj4gKysrIGIvbW0vbWxvY2suYwo+PiBAQCAtNjc0LDYgKzY3NCw4IEBAIHN0YXRp
YyBfX211c3RfY2hlY2sgaW50IGRvX21sb2NrKHVuc2lnbmVkIGxvbmcgc3RhcnQsIHNpemVfdCBs
ZW4sIHZtX2ZsYWdzX3QgZmxhCj4+ICAJdW5zaWduZWQgbG9uZyBsb2NrX2xpbWl0Owo+PiAgCWlu
dCBlcnJvciA9IC1FTk9NRU07Cj4+ICAKPj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQp
Owo+PiArCj4+ICAJaWYgKCFjYW5fZG9fbWxvY2soKSkKPj4gIAkJcmV0dXJuIC1FUEVSTTsKPj4g
IAo+PiBAQCAtNzM1LDYgKzczNyw4IEBAIFNZU0NBTExfREVGSU5FMihtdW5sb2NrLCB1bnNpZ25l
ZCBsb25nLCBzdGFydCwgc2l6ZV90LCBsZW4pCj4+ICB7Cj4+ICAJaW50IHJldDsKPj4gIAo+PiAr
CXN0YXJ0ID0gdW50YWdnZWRfYWRkcihzdGFydCk7Cj4+ICsKPj4gIAlsZW4gPSBQQUdFX0FMSUdO
KGxlbiArIChvZmZzZXRfaW5fcGFnZShzdGFydCkpKTsKPj4gIAlzdGFydCAmPSBQQUdFX01BU0s7
Cj4+ICAKPj4gZGlmZiAtLWdpdCBhL21tL21wcm90ZWN0LmMgYi9tbS9tcHJvdGVjdC5jCj4+IGlu
ZGV4IGJmMzhkZmJiYjRiNC4uMTlmOTgxYjczM2JjIDEwMDY0NAo+PiAtLS0gYS9tbS9tcHJvdGVj
dC5jCj4+ICsrKyBiL21tL21wcm90ZWN0LmMKPj4gQEAgLTQ2NSw2ICs0NjUsOCBAQCBzdGF0aWMg
aW50IGRvX21wcm90ZWN0X3BrZXkodW5zaWduZWQgbG9uZyBzdGFydCwgc2l6ZV90IGxlbiwKPj4g
IAljb25zdCBib29sIHJpZXIgPSAoY3VycmVudC0+cGVyc29uYWxpdHkgJiBSRUFEX0lNUExJRVNf
RVhFQykgJiYKPj4gIAkJCQkocHJvdCAmIFBST1RfUkVBRCk7Cj4+ICAKPj4gKwlzdGFydCA9IHVu
dGFnZ2VkX2FkZHIoc3RhcnQpOwo+PiArCj4+ICAJcHJvdCAmPSB+KFBST1RfR1JPV1NET1dOfFBS
T1RfR1JPV1NVUCk7Cj4+ICAJaWYgKGdyb3dzID09IChQUk9UX0dST1dTRE9XTnxQUk9UX0dST1dT
VVApKSAvKiBjYW4ndCBiZSBib3RoICovCj4+ICAJCXJldHVybiAtRUlOVkFMOwo+PiBkaWZmIC0t
Z2l0IGEvbW0vbXJlbWFwLmMgYi9tbS9tcmVtYXAuYwo+PiBpbmRleCBmYzI0MWQyM2NkOTcuLjY0
YzlhM2I4YmUwYSAxMDA2NDQKPj4gLS0tIGEvbW0vbXJlbWFwLmMKPj4gKysrIGIvbW0vbXJlbWFw
LmMKPj4gQEAgLTYwNiw2ICs2MDYsMTMgQEAgU1lTQ0FMTF9ERUZJTkU1KG1yZW1hcCwgdW5zaWdu
ZWQgbG9uZywgYWRkciwgdW5zaWduZWQgbG9uZywgb2xkX2xlbiwKPj4gIAlMSVNUX0hFQUQodWZf
dW5tYXBfZWFybHkpOwo+PiAgCUxJU1RfSEVBRCh1Zl91bm1hcCk7Cj4+ICAKPj4gKwkvKgo+PiAr
CSAqIEFyY2hpdGVjdHVyZXMgbWF5IGludGVycHJldCB0aGUgdGFnIHBhc3NlZCB0byBtbWFwIGFz
IGEgYmFja2dyb3VuZAo+PiArCSAqIGNvbG91ciBmb3IgdGhlIGNvcnJlc3BvbmRpbmcgdm1hLiBG
b3IgbXJlbWFwIHdlIGRvbid0IGFsbG93IHRhZ2dlZAo+PiArCSAqIG5ld19hZGRyIHRvIHByZXNl
cnZlIHNpbWlsYXIgYmVoYXZpb3VyIHRvIG1tYXAuCj4+ICsJICovCj4+ICsJYWRkciA9IHVudGFn
Z2VkX2FkZHIoYWRkcik7Cj4+ICsKPj4gIAlpZiAoZmxhZ3MgJiB+KE1SRU1BUF9GSVhFRCB8IE1S
RU1BUF9NQVlNT1ZFKSkKPj4gIAkJcmV0dXJuIHJldDsKPj4gIAo+PiBkaWZmIC0tZ2l0IGEvbW0v
bXN5bmMuYyBiL21tL21zeW5jLmMKPj4gaW5kZXggZWYzMGE0Mjk2MjNhLi5jM2JkM2U3NWY2ODcg
MTAwNjQ0Cj4+IC0tLSBhL21tL21zeW5jLmMKPj4gKysrIGIvbW0vbXN5bmMuYwo+PiBAQCAtMzcs
NiArMzcsOCBAQCBTWVNDQUxMX0RFRklORTMobXN5bmMsIHVuc2lnbmVkIGxvbmcsIHN0YXJ0LCBz
aXplX3QsIGxlbiwgaW50LCBmbGFncykKPj4gIAlpbnQgdW5tYXBwZWRfZXJyb3IgPSAwOwo+PiAg
CWludCBlcnJvciA9IC1FSU5WQUw7Cj4+ICAKPj4gKwlzdGFydCA9IHVudGFnZ2VkX2FkZHIoc3Rh
cnQpOwo+PiArCj4+ICAJaWYgKGZsYWdzICYgfihNU19BU1lOQyB8IE1TX0lOVkFMSURBVEUgfCBN
U19TWU5DKSkKPj4gIAkJZ290byBvdXQ7Cj4+ICAJaWYgKG9mZnNldF9pbl9wYWdlKHN0YXJ0KSkK
Pj4KPiAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
