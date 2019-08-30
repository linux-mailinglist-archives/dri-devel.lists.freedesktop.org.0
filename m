Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 453D8A3288
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2019 10:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B376E303;
	Fri, 30 Aug 2019 08:31:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68B66E0EF;
 Fri, 30 Aug 2019 02:21:04 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d6888110001>; Thu, 29 Aug 2019 19:21:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 29 Aug 2019 19:21:04 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 29 Aug 2019 19:21:04 -0700
Received: from [10.110.48.201] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 30 Aug
 2019 02:21:03 +0000
Subject: Re: [PATCH v3 00/39] put_user_pages(): miscellaneous call sites
To: Mike Marshall <hubcap@omnibond.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
 <912eb2bd-4102-05c1-5571-c261617ad30b@nvidia.com>
 <CAOg9mSQKGDywcMde2DE42diUS7J8m74Hdv+xp_PJhC39EXZQuw@mail.gmail.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <d453f865-2224-ed53-a2f4-f43d574c130a@nvidia.com>
Date: Thu, 29 Aug 2019 19:21:03 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAOg9mSQKGDywcMde2DE42diUS7J8m74Hdv+xp_PJhC39EXZQuw@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 30 Aug 2019 08:29:17 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1567131666; bh=ws5caXaEY0X3GX3egw6JsJDC0L7OwnIAHkDMK9ZQcE4=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=lYXhjNp4HBVr+BYgUMe2DEXRWP7pA3fMVMIq4VQzqatvWlbnDPrEsnKCBiE6ZhhbV
 BuGRxpedwQr1MI9Tn1NJhnh02ZL+CbJeIz8dqAd2Qcq/Um9BtiJPADIXOlZcstCncy
 XABppoYOnI6ALktCTwAeNOmDcaASXFDbNLko08GV9145MNEG9uXL1hSz3nIKfN4gB6
 aJvb9/R2qa4U0nz3Q4NoBz62iApWrF1vwEQQFD2/+kNtaXa4PL4mUc3fOM6LTqa5jY
 EUWLPGTd1AD0s1DeGs0ju1piHTmsOCEnx83zdnF2KSonnJLO2zkiRrXhnO0owsOgLi
 izOpCgVf4K22w==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm <linux-mm@kvack.org>,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, john.hubbard@gmail.com,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel <ceph-devel@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Linux NFS Mailing List <linux-nfs@vger.kernel.org>, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yOS8yMDE5IDY6MjkgUE0sIE1pa2UgTWFyc2hhbGwgd3JvdGU6Cj4gSGkgSm9obi4uLgo+
IAo+IEkgYWRkZWQgdGhpcyBwYXRjaCBzZXJpZXMgb24gdG9wIG9mIExpbnV4IDUuM3JjNiBhbmQg
cmFuCj4geGZzdGVzdHMgd2l0aCBubyByZWdyZXNzaW9ucy4uLgo+IAo+IEFja2VkLWJ5OiBNaWtl
IE1hcnNoYWxsIDxodWJjYXBAb21uaWJvbmQuY29tPgo+IAoKSGkgTWlrZSAoYW5kIEkgaG9wZSBJ
cmEgYW5kIG90aGVycyBhcmUgcmVhZGluZyBhcyB3ZWxsLCBiZWNhdXNlCkknbSBtYWtpbmcgYSBi
dW5jaCBvZiBjbGFpbXMgZnVydGhlciBkb3duKSwKClRoYXQncyBncmVhdCBuZXdzLCB0aGFua3Mg
Zm9yIHJ1bm5pbmcgdGhhdCB0ZXN0IHN1aXRlIGFuZCBmb3IKdGhlIHJlcG9ydCBhbmQgdGhlIEFD
Sy4KClRoZXJlIGlzIGFuIGludGVyZXN0aW5nIHBhdXNlIHJpZ2h0IG5vdywgZHVlIHRvIHRoZSBm
YWN0IHRoYXQKd2UndmUgbWFkZSBzb21lIHRlbnRhdGl2ZSBkZWNpc2lvbnMgYWJvdXQgZ3VwIHBp
bm5pbmcsIHRoYXQgYWZmZWN0CnRoZSBjYWxsIHNpdGVzLiBBIGtleSBkZWNpc2lvbiBpcyB0aGF0
IG9ubHkgcGFnZXMgdGhhdCB3ZXJlCnJlcXVlc3RlZCB2aWEgRk9MTF9QSU4sIHdpbGwgcmVxdWly
ZSBwdXRfdXNlcl9wYWdlKigpIHRvIHJlbGVhc2UKdGhlbS4gVGhlcmUgYXJlIDQgbWFpbiBjYXNl
cywgd2hpY2ggd2VyZSBmaXJzdCBleHBsYWluZWQgYnkgSmFuCkthcmEgYW5kIFZsYXN0aW1pbCBC
YWJrYSwgYW5kIGFyZSBub3cgd3JpdHRlbiB1cCBpbiBteSBGT0xMX1BJTgpwYXRjaCBbMV0uCgpT
bywgd2hhdCB0aGF0IG1lYW5zIGZvciB0aGlzIHNlcmllcyBpcyB0aGF0OgoKMS4gU29tZSBjYWxs
IHNpdGVzIChtbG9jay5jIGZvciBleGFtcGxlLCBhbmQgYSBsb3Qgb2YgdGhlIG1tLyBmaWxlcwpp
biBmYWN0LCBhbmQgbW9yZSkgd2lsbCBub3QgYmUgY29udmVydGVkOiBzb21lIG9mIHRoZXNlIHBh
dGNoZXMgd2lsbApnZXQgZHJvcHBlZCwgZXNwZWNpYWxseSBpbiBtbS8uCgoyLiBDYWxsIHNpdGVz
IHRoYXQgZG8gRGlyZWN0SU8gb3IgUkRNQSB3aWxsIG5lZWQgdG8gc2V0IEZPTExfUElOLCBhbmQK
d2lsbCBhbHNvIG5lZWQgdG8gY2FsbCBwdXRfdXNlcl9wYWdlKCkuCgozLiBDYWxsIHNpdGVzIHRo
YXQgZG8gUkRNQSB3aWxsIG5lZWQgdG8gc2V0IEZPTExfTE9OR1RFUk0gKmFuZCogRk9MTF9QSU4s
CgogICAgMy5hLiAuLi5hbmQgd2lsbCBhdCBsZWFzdCBpbiBzb21lIGNhc2VzIG5lZWQgdG8gcHJv
dmlkZSBhIGxpbmsgdG8gYQogICAgdmFkZHJfcGluIG9iamVjdCwgYW5kIHRodXMgYmFjayB0byBh
IHN0cnVjdCBmaWxlKi4uLm1heWJlLiBTdGlsbAogICAgdW5kZXIgZGlzY3Vzc2lvbi4KCjQuIEl0
J3MgZGVzaXJhYmxlIHRvIGtlZXAgRk9MTF8qIGZsYWdzIChvciBhdCBsZWFzdCBGT0xMX1BJTikg
aW50ZXJuYWwKdG8gdGhlIGd1cCgpIGNhbGxzLiBUaGF0IGltcGxpZXMgdXNpbmcgYSB3cmFwcGVy
IGNhbGwgc3VjaCBhcyBJcmEncwp2YWRkcl9waW5fW3VzZXJdX3BhZ2VzKCksIGluc3RlYWQgb2Yg
Z3VwKCksIGFuZCB2YWRkcl91bnBpbl9bdXNlcl1fcGFnZXMoKQppbnN0ZWFkIG9mIHB1dF91c2Vy
X3BhZ2UqKCkuCgo1LiBXZSBkb24ndCB3YW50IHRvIGNodXJuIHRoZSBjYWxsIHNpdGVzIHVubmVj
ZXNzYXJpbHkuCgpXaXRoIHRoYXQgaW4gbWluZCwgSSd2ZSB0YWtlbiBhbm90aGVyIHBhc3MgdGhy
b3VnaCBhbGwgdGhlc2UgcGF0Y2hlcwphbmQgbmFycm93ZWQgaXQgZG93biB0bzoKCiAgICAgYSkg
MTIgY2FsbCBzaXRlcyB0aGF0IEknZCBsaWtlIHRvIGNvbnZlcnQgc29vbiwgYnV0IGV2ZW4gdGhv
c2UKICAgICAgICByZWFsbHkgbG9vayBjbGVhbmVyIHdpdGggYSBmdWxsIGNvbnZlcnNpb24gdG8g
YSB3cmFwcGVyIGNhbGwKICAgICAgICBzaW1pbGFyIHRvIChpZGVudGljYWwgdG8/KSB2YWRkcl9w
aW5fW3VzZXJdX3BhZ2VzKCksIHByb2JhYmx5CiAgICAgICAganVzdCB0aGUgRk9MTF9QSU4gb25s
eSB2YXJpYW50IChub3QgRk9MTF9MT05HVEVSTSkuIFRoYXQKICAgICAgICB3cmFwcGVyIGNhbGwg
aXMgbm90IHJlYWR5IHlldCwgdGhvdWdoLgoKICAgICBiKSBTb21lIG1vcmUgY2FsbCBzaXRlcyB0
aGF0IHJlcXVpcmUgYm90aCBGT0xMX1BJTiBhbmQgRk9MTF9MT05HVEVSTS4KICAgICAgICBEZWZp
bml0ZWx5IHdpbGwgd2FpdCB0byB1c2UgdGhlIHdyYXBwZXIgY2FsbHMgZm9yIHRoZXNlLCBiZWNh
dXNlCiAgICAgICAgdGhleSBtYXkgYWxzbyByZXF1aXJlIGhvb2tpbmcgdXAgdG8gYSBzdHJ1Y3Qg
ZmlsZSouCgogICAgIGMpIEEgZmV3IG1vcmUgdGhhdCB3ZXJlIGFscmVhZHkgYXBwbGllZCwgd2hp
Y2ggaXMgZmluZSwgYmVjYXVzZSB0aGV5CiAgICAgICAgc2hvdyB3aGVyZSB0byBjb252ZXJ0LCBh
bmQgc2ltcGxpZnkgYSBmZXcgc2l0ZXMgYW55d2F5LiBCdXQgdGhleSdsbAogICAgICAgIG5lZWQg
Zm9sbG93LW9uIGNoYW5nZXMgdG8sIG9uZSB3YXkgb3IgYW5vdGhlciwgc2V0IEZPTExfUElOLgoK
ICAgICBkKSBBbmQgb2YgY291cnNlIGEgZmV3IHNpdGVzIHdob3NlIHBhdGNoZXMgZ2V0IGRyb3Bw
ZWQsIGFzIG1lbnRpb25lZAogICAgICAgIGFib3ZlLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAxOTA4MjEwNDA3MjcuMTk2NTAtMy1qaHViYmFyZEBudmlkaWEuY29tCgp0aGFua3Ms
Ci0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
