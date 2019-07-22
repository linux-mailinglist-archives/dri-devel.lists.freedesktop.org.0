Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F88E7129C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:16:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C696E10F;
	Tue, 23 Jul 2019 07:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 790F289DDD
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 19:05:42 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3609060000>; Mon, 22 Jul 2019 12:05:42 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 22 Jul 2019 12:05:41 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 22 Jul 2019 12:05:41 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 19:05:41 +0000
Subject: Re: [PATCH 3/3] gup: new put_user_page_dirty*() helpers
To: <john.hubbard@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20190722043012.22945-1-jhubbard@nvidia.com>
 <20190722043012.22945-4-jhubbard@nvidia.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <3a294582-9c60-b70c-8389-68c5d3326765@nvidia.com>
Date: Mon, 22 Jul 2019 12:05:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722043012.22945-4-jhubbard@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563822342; bh=8K12rdfwIMLeACivZ31dz3qePpqi9G1AM6eI//iYEN8=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Qy0etjiupH0o/2VLEf2Kfw/6ThF3QIOwnl/C/rvCFndMqXXmTJum25AxDmXBD9fx0
 +lec8POS98AIoHo7ixvgZ3iz684XA4lS1yZHPSINz9aZy0LmoLhaZPsSSFU5/Bo03T
 52w9cXBaViCVqsTggF6GWpW0Oah+V7bMe4hi03+YNd2MQZn5Lsu0QELVxORLPDbDhK
 rF6Wkh2eu1qSHQDfDMZEY9MYZ4nx59fTNJ9YnYLTvixS/iWf/D9hx5YrGY30jFkb1V
 lkJLRCre9OmDJ3XF6bKkUZ7HtN33TM2Oviu2bFiwB2p3PM/eluQleNA55IB3j7XWpo
 T97GFPuEvUYQA==
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
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Johannes Thumshirn <jthumshirn@suse.de>, Ilya Dryomov <idryomov@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ming Lei <ming.lei@redhat.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yan Zheng <zyan@redhat.com>, bpf@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMS8xOSA5OjMwIFBNLCBqb2huLmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgo+IEZyb206
IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAKPiBXaGlsZSBjb252ZXJ0aW5n
IGNhbGwgc2l0ZXMgdG8gdXNlIHB1dF91c2VyX3BhZ2UqKCkgWzFdLCBxdWl0ZSBhIGZldwo+IHBs
YWNlcyBlbmRlZCB1cCBuZWVkaW5nIGEgc2luZ2xlLXBhZ2Ugcm91dGluZSB0byBwdXQgYW5kIGRp
cnR5IGEKPiBwYWdlLgo+IAo+IFByb3ZpZGUgcHV0X3VzZXJfcGFnZV9kaXJ0eSgpIGFuZCBwdXRf
dXNlcl9wYWdlX2RpcnR5X2xvY2soKSwKPiBhbmQgdXNlIHRoZW0gaW4gYSBmZXcgcGxhY2VzOiBu
ZXQveGRwLCBkcm0vdmlhLywgZHJpdmVycy9pbmZpbmliYW5kLgo+IAoKUGxlYXNlIGRpc3JlZ2Fy
ZCB0aGlzIG9uZSwgSSdtIGdvaW5nIHRvIGRyb3AgaXQsIGFzIHBlciB0aGUKZGlzY3Vzc2lvbiBp
biBwYXRjaCAxLgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQoKPiBDYzogSmFzb24g
R3VudGhvcnBlIDxqZ2dAemllcGUuY2E+Cj4gQ2M6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+Cj4g
U2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMgICAgICAgIHwgIDIgKy0KPiAgZHJp
dmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5jICAgICAgICAgICB8ICAyICstCj4gIGRyaXZlcnMv
aW5maW5pYmFuZC9ody91c25pYy91c25pY191aW9tLmMgfCAgMiArLQo+ICBpbmNsdWRlL2xpbnV4
L21tLmggICAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKysrKysrKwo+ICBuZXQveGRwL3hk
cF91bWVtLmMgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiAgNSBmaWxlcyBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMgYi9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9k
bWFibGl0LmMKPiBpbmRleCAyMTk4MjdhZTExNGYuLmQzMGIyZDc1NTk5ZiAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdmlhL3ZpYV9kbWFibGl0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vdmlhL3ZpYV9kbWFibGl0LmMKPiBAQCAtMTg5LDcgKzE4OSw3IEBAIHZpYV9mcmVlX3NnX2lu
Zm8oc3RydWN0IHBjaV9kZXYgKnBkZXYsIGRybV92aWFfc2dfaW5mb190ICp2c2cpCj4gIAkJZm9y
IChpID0gMDsgaSA8IHZzZy0+bnVtX3BhZ2VzOyArK2kpIHsKPiAgCQkJaWYgKE5VTEwgIT0gKHBh
Z2UgPSB2c2ctPnBhZ2VzW2ldKSkgewo+ICAJCQkJaWYgKCFQYWdlUmVzZXJ2ZWQocGFnZSkgJiYg
KERNQV9GUk9NX0RFVklDRSA9PSB2c2ctPmRpcmVjdGlvbikpCj4gLQkJCQkJcHV0X3VzZXJfcGFn
ZXNfZGlydHkoJnBhZ2UsIDEpOwo+ICsJCQkJCXB1dF91c2VyX3BhZ2VfZGlydHkocGFnZSk7Cj4g
IAkJCQllbHNlCj4gIAkJCQkJcHV0X3VzZXJfcGFnZShwYWdlKTsKPiAgCQkJfQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMgYi9kcml2ZXJzL2luZmluaWJhbmQv
Y29yZS91bWVtLmMKPiBpbmRleCAwOGRhODQwZWQ3ZWUuLmE3MzM3Y2MzY2EyMCAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMKPiArKysgYi9kcml2ZXJzL2luZmlu
aWJhbmQvY29yZS91bWVtLmMKPiBAQCAtNTUsNyArNTUsNyBAQCBzdGF0aWMgdm9pZCBfX2liX3Vt
ZW1fcmVsZWFzZShzdHJ1Y3QgaWJfZGV2aWNlICpkZXYsIHN0cnVjdCBpYl91bWVtICp1bWVtLCBp
bnQgZAo+ICAJZm9yX2VhY2hfc2dfcGFnZSh1bWVtLT5zZ19oZWFkLnNnbCwgJnNnX2l0ZXIsIHVt
ZW0tPnNnX25lbnRzLCAwKSB7Cj4gIAkJcGFnZSA9IHNnX3BhZ2VfaXRlcl9wYWdlKCZzZ19pdGVy
KTsKPiAgCQlpZiAodW1lbS0+d3JpdGFibGUgJiYgZGlydHkpCj4gLQkJCXB1dF91c2VyX3BhZ2Vz
X2RpcnR5X2xvY2soJnBhZ2UsIDEpOwo+ICsJCQlwdXRfdXNlcl9wYWdlX2RpcnR5X2xvY2socGFn
ZSk7Cj4gIAkJZWxzZQo+ICAJCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwo+ICAJfQo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2luZmluaWJhbmQvaHcvdXNuaWMvdXNuaWNfdWlvbS5jIGIvZHJpdmVycy9p
bmZpbmliYW5kL2h3L3VzbmljL3VzbmljX3Vpb20uYwo+IGluZGV4IDBiMDIzN2Q0MTYxMy4uZDJk
ZWQ2MjRmYjJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9ody91c25pYy91c25p
Y191aW9tLmMKPiArKysgYi9kcml2ZXJzL2luZmluaWJhbmQvaHcvdXNuaWMvdXNuaWNfdWlvbS5j
Cj4gQEAgLTc2LDcgKzc2LDcgQEAgc3RhdGljIHZvaWQgdXNuaWNfdWlvbV9wdXRfcGFnZXMoc3Ry
dWN0IGxpc3RfaGVhZCAqY2h1bmtfbGlzdCwgaW50IGRpcnR5KQo+ICAJCQlwYWdlID0gc2dfcGFn
ZShzZyk7Cj4gIAkJCXBhID0gc2dfcGh5cyhzZyk7Cj4gIAkJCWlmIChkaXJ0eSkKPiAtCQkJCXB1
dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2UsIDEpOwo+ICsJCQkJcHV0X3VzZXJfcGFnZV9k
aXJ0eV9sb2NrKHBhZ2UpOwo+ICAJCQllbHNlCj4gIAkJCQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwo+
ICAJCQl1c25pY19kYmcoInBhOiAlcGFcbiIsICZwYSk7Cj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
bGludXgvbW0uaCBiL2luY2x1ZGUvbGludXgvbW0uaAo+IGluZGV4IDAzMzRjYTk3YzU4NC4uYzA1
ODRjNmQ5ZDc4IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvbW0uaAo+ICsrKyBiL2luY2x1
ZGUvbGludXgvbW0uaAo+IEBAIC0xMDYxLDYgKzEwNjEsMTYgQEAgdm9pZCBwdXRfdXNlcl9wYWdl
c19kaXJ0eShzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCB1bnNpZ25lZCBsb25nIG5wYWdlcyk7Cj4gIHZv
aWQgcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhzdHJ1Y3QgcGFnZSAqKnBhZ2VzLCB1bnNpZ25l
ZCBsb25nIG5wYWdlcyk7Cj4gIHZvaWQgcHV0X3VzZXJfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdl
cywgdW5zaWduZWQgbG9uZyBucGFnZXMpOwo+ICAKPiArc3RhdGljIGlubGluZSB2b2lkIHB1dF91
c2VyX3BhZ2VfZGlydHkoc3RydWN0IHBhZ2UgKnBhZ2UpCj4gK3sKPiArCXB1dF91c2VyX3BhZ2Vz
X2RpcnR5KCZwYWdlLCAxKTsKPiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIHB1dF91c2Vy
X3BhZ2VfZGlydHlfbG9jayhzdHJ1Y3QgcGFnZSAqcGFnZSkKPiArewo+ICsJcHV0X3VzZXJfcGFn
ZXNfZGlydHlfbG9jaygmcGFnZSwgMSk7Cj4gK30KPiArCj4gICNpZiBkZWZpbmVkKENPTkZJR19T
UEFSU0VNRU0pICYmICFkZWZpbmVkKENPTkZJR19TUEFSU0VNRU1fVk1FTU1BUCkKPiAgI2RlZmlu
ZSBTRUNUSU9OX0lOX1BBR0VfRkxBR1MKPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL25ldC94ZHAv
eGRwX3VtZW0uYyBiL25ldC94ZHAveGRwX3VtZW0uYwo+IGluZGV4IDljYmJiOTZjMmEzMi4uMWQx
MjJlNTJjNmRlIDEwMDY0NAo+IC0tLSBhL25ldC94ZHAveGRwX3VtZW0uYwo+ICsrKyBiL25ldC94
ZHAveGRwX3VtZW0uYwo+IEBAIC0xNzEsNyArMTcxLDcgQEAgc3RhdGljIHZvaWQgeGRwX3VtZW1f
dW5waW5fcGFnZXMoc3RydWN0IHhkcF91bWVtICp1bWVtKQo+ICAJZm9yIChpID0gMDsgaSA8IHVt
ZW0tPm5wZ3M7IGkrKykgewo+ICAJCXN0cnVjdCBwYWdlICpwYWdlID0gdW1lbS0+cGdzW2ldOwo+
ICAKPiAtCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCZwYWdlLCAxKTsKPiArCQlwdXRfdXNl
cl9wYWdlX2RpcnR5X2xvY2socGFnZSk7Cj4gIAl9Cj4gIAo+ICAJa2ZyZWUodW1lbS0+cGdzKTsK
PiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
