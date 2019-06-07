Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6F038594
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jun 2019 09:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F6A189BF6;
	Fri,  7 Jun 2019 07:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1AC089804;
 Fri,  7 Jun 2019 03:29:13 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5cf9da070000>; Thu, 06 Jun 2019 20:29:11 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 06 Jun 2019 20:29:13 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 06 Jun 2019 20:29:13 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 7 Jun
 2019 03:29:11 +0000
Subject: Re: [PATCH v2 hmm 08/11] mm/hmm: Remove racy protection against
 double-unregistration
To: Jason Gunthorpe <jgg@ziepe.ca>, Jerome Glisse <jglisse@redhat.com>, "Ralph
 Campbell" <rcampbell@nvidia.com>, <Felix.Kuehling@amd.com>
References: <20190606184438.31646-1-jgg@ziepe.ca>
 <20190606184438.31646-9-jgg@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <88400de9-e1ae-509b-718f-c6b0f726b14c@nvidia.com>
Date: Thu, 6 Jun 2019 20:29:10 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190606184438.31646-9-jgg@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 07 Jun 2019 07:43:40 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1559878151; bh=/7QlQ0a6Qyg58unwdWuoBgEG7TwvTAAHiFUhlj29yto=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=AHwcMydKA1TgfD4RJqQNpr6LIUb1oEFYg5HcRS/+RnCuAUqh2s7TgUqrXgG40f3zE
 CJbyyUnf+fEgpmDguw/J/dlmtapUWsYu4zRJwhG4lAk5KJ1z8hJaflgO4aauzkfIkD
 9a2Ifmnv/v31YF4oOrOxY6hiYuHKUt7RRpZc6d4hjn0du6hzhHC9Jdt90HeTerzaxu
 XC8jJUk3O8sSZPt55m8DSfEC3PSlY/vAH6Oghir+BEoKhkyJwlBGxXxfzp+mlg1D4M
 7QMfUuHCK7AUT545Pbb+BjXQV38Ce4Tbu/TuqHGQ1UQDAgvY9y6XaDAZE3Q3dpYi+I
 q2SN2/KlPavkA==
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
Cc: Andrea Arcangeli <aarcange@redhat.com>, linux-rdma@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi82LzE5IDExOjQ0IEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gRnJvbTogSmFzb24g
R3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgo+IAo+IE5vIG90aGVyIHJlZ2lzdGVyL3VucmVn
aXN0ZXIga2VybmVsIEFQSSBhdHRlbXB0cyB0byBwcm92aWRlIHRoaXMga2luZCBvZgo+IHByb3Rl
Y3Rpb24gYXMgaXQgaXMgaW5oZXJlbnRseSByYWN5LCBzbyBqdXN0IGRyb3AgaXQuCj4gCj4gQ2Fs
bGVycyBzaG91bGQgcHJvdmlkZSB0aGVpciBvd24gcHJvdGVjdGlvbiwgaXQgYXBwZWFycyBub3V2
ZWF1IGFscmVhZHkKPiBkb2VzLCBidXQganVzdCBpbiBjYXNlIGRyb3AgYSBkZWJ1Z2dpbmcgUE9J
U09OLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNv
bT4KPiBSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4g
LS0tCj4gIG1tL2htbS5jIHwgOSArKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9o
bW0uYwo+IGluZGV4IGM3MDJjZDcyNjUxYjUzLi42ODAyZGU3MDgwZDE3MiAxMDA2NDQKPiAtLS0g
YS9tbS9obW0uYwo+ICsrKyBiL21tL2htbS5jCj4gQEAgLTI4NCwxOCArMjg0LDEzIEBAIEVYUE9S
VF9TWU1CT0woaG1tX21pcnJvcl9yZWdpc3Rlcik7Cj4gICAqLwo+ICB2b2lkIGhtbV9taXJyb3Jf
dW5yZWdpc3RlcihzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9yKQo+ICB7Cj4gLQlzdHJ1Y3QgaG1t
ICpobW0gPSBSRUFEX09OQ0UobWlycm9yLT5obW0pOwo+IC0KPiAtCWlmIChobW0gPT0gTlVMTCkK
PiAtCQlyZXR1cm47Cj4gKwlzdHJ1Y3QgaG1tICpobW0gPSBtaXJyb3ItPmhtbTsKPiAgCj4gIAlk
b3duX3dyaXRlKCZobW0tPm1pcnJvcnNfc2VtKTsKPiAgCWxpc3RfZGVsX2luaXQoJm1pcnJvci0+
bGlzdCk7Cj4gLQkvKiBUbyBwcm90ZWN0IHVzIGFnYWluc3QgZG91YmxlIHVucmVnaXN0ZXIgLi4u
ICovCj4gLQltaXJyb3ItPmhtbSA9IE5VTEw7Cj4gIAl1cF93cml0ZSgmaG1tLT5taXJyb3JzX3Nl
bSk7Cj4gLQo+ICAJaG1tX3B1dChobW0pOwo+ICsJbWVtc2V0KCZtaXJyb3ItPmhtbSwgUE9JU09O
X0lOVVNFLCBzaXplb2YobWlycm9yLT5obW0pKTsKCkkgaGFkbid0IHRob3VnaHQgb2YgUE9JU09O
XyogZm9yIHRoZXNlIHR5cGVzIG9mIGNhc2VzLCBpdCdzIGEgCmdvb2QgdGVjaG5pcXVlIHRvIHJl
bWVtYmVyLgoKSSBub3RpY2VkIHRoYXQgdGhpcyBpcyBub3cgZG9uZSBvdXRzaWRlIG9mIHRoZSBs
b2NrLCBidXQgdGhhdApmb2xsb3dzIGRpcmVjdGx5IGZyb20geW91ciBjb21taXQgZGVzY3JpcHRp
b24sIHNvIHRoYXQgYWxsIGxvb2tzIApjb3JyZWN0LgoKPiAgfQo+ICBFWFBPUlRfU1lNQk9MKGht
bV9taXJyb3JfdW5yZWdpc3Rlcik7Cj4gIAo+IAoKCiAgICBSZXZpZXdlZC1ieTogSm9obiBIdWJi
YXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJ
QQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
