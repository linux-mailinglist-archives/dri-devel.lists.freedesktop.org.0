Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5AEF9CEF
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 23:24:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BA96EC07;
	Tue, 12 Nov 2019 22:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 931436EC07
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 22:24:33 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb31200000>; Tue, 12 Nov 2019 14:24:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 14:24:33 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 14:24:33 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 22:24:32 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Dan Williams <dan.j.williams@intel.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
Date: Tue, 12 Nov 2019 14:24:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573597472; bh=UAR1d5GKJU/1KahVmHwOR6A9jK9nwoB3wSa2dPf7qQ0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=SCx0hF/22GHwsQWIhebJkJWfDE6W1v3w54kBd61ULtK+gIirCeDvEe+mYnEHJgwF3
 N309YgZ8A546WwB5IQMwcVMEM6bPuxfgNODHVHbvBgEiVWtLyxj0B398vc3JKHqHLW
 fYVbOfGFayiJTsvTBYUVssA0KXLzsSF47AIiXijFRvt1VZIYNmWsBao0fUMlxfVb9y
 FK/kGRlw4DPqDT/iEi5HrOqFBttHVHyJMVpOjnpKQsoAEutvLb0R76IcvAhSMz3Te2
 8LwQjMHLUXqcwuSETUK6U7GZZJxoHzli9rQ73NjcXdAxPWo6WYwRsOMHLimlMGza1W
 kJHm8uWG9iU5g==
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
Cc: Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTIvMTkgMTo1NyBQTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgouLi4KPj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMgYi9kcml2ZXJzL3ZmaW8vdmZpb19p
b21tdV90eXBlMS5jCj4+IGluZGV4IGQ4NjQyNzdlYTE2Zi4uMDE3Njg5YjdjMzJiIDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL3ZmaW8vdmZpb19pb21tdV90eXBlMS5jCj4+ICsrKyBiL2RyaXZlcnMv
dmZpby92ZmlvX2lvbW11X3R5cGUxLmMKPj4gQEAgLTM0OCwyNCArMzQ4LDIwIEBAIHN0YXRpYyBp
bnQgdmFkZHJfZ2V0X3BmbihzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB2YWRk
ciwKPj4gICAgICAgICAgICAgICAgIGZsYWdzIHw9IEZPTExfV1JJVEU7Cj4+Cj4+ICAgICAgICAg
ZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+PiAtICAgICAgIGlmIChtbSA9PSBjdXJyZW50LT5t
bSkgewo+PiAtICAgICAgICAgICAgICAgcmV0ID0gZ2V0X3VzZXJfcGFnZXModmFkZHIsIDEsIGZs
YWdzIHwgRk9MTF9MT05HVEVSTSwgcGFnZSwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHZtYXMpOwo+PiAtICAgICAgIH0gZWxzZSB7Cj4+IC0gICAgICAgICAgICAgICBy
ZXQgPSBnZXRfdXNlcl9wYWdlc19yZW1vdGUoTlVMTCwgbW0sIHZhZGRyLCAxLCBmbGFncywgcGFn
ZSwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB2bWFzLCBO
VUxMKTsKPj4gLSAgICAgICAgICAgICAgIC8qCj4+IC0gICAgICAgICAgICAgICAgKiBUaGUgbGlm
ZXRpbWUgb2YgYSB2YWRkcl9nZXRfcGZuKCkgcGFnZSBwaW4gaXMKPj4gLSAgICAgICAgICAgICAg
ICAqIHVzZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNhc2UgdGhpcyBjb3VsZAo+
PiAtICAgICAgICAgICAgICAgICogbGVhZCB0byBpbmRlZmluaXRlIHN0YWxscyBpbiBmaWxlc3lz
dGVtIG9wZXJhdGlvbnMuCj4+IC0gICAgICAgICAgICAgICAgKiBEaXNhbGxvdyBhdHRlbXB0cyB0
byBwaW4gZnMtZGF4IHBhZ2VzIHZpYSB0aGlzCj4+IC0gICAgICAgICAgICAgICAgKiBpbnRlcmZh
Y2UuCj4+IC0gICAgICAgICAgICAgICAgKi8KPj4gLSAgICAgICAgICAgICAgIGlmIChyZXQgPiAw
ICYmIHZtYV9pc19mc2RheCh2bWFzWzBdKSkgewo+PiAtICAgICAgICAgICAgICAgICAgICAgICBy
ZXQgPSAtRU9QTk9UU1VQUDsKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgcHV0X3BhZ2UocGFn
ZVswXSk7Cj4+IC0gICAgICAgICAgICAgICB9Cj4+ICsgICAgICAgcmV0ID0gZ2V0X3VzZXJfcGFn
ZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MgfCBGT0xMX0xPTkdURVJNLAo+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwYWdlLCB2bWFzLCBOVUxMKTsKPiAK
PiBIbW0sIHdoYXQncyB0aGUgcG9pbnQgb2YgcGFzc2luZyBGT0xMX0xPTkdURVJNIHRvCj4gZ2V0
X3VzZXJfcGFnZXNfcmVtb3RlKCkgaWYgZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKCkgaXMgbm90IGdv
aW5nIHRvCj4gY2hlY2sgdGhlIHZtYT8gSSB0aGluayB3ZSBnb3QgdG8gdGhpcyBjb2RlIHN0YXRl
IGJlY2F1c2UgdGhlCgpGT0xMX0xPTkdURVJNIGlzIHNob3J0LWxpdmVkIGluIHRoaXMgbG9jYXRp
b24sIGJlY2F1c2UgcGF0Y2ggMjMgCigibW0vZ3VwOiByZW1vdmUgc3VwcG9ydCBmb3IgZ3VwKEZP
TExfTE9OR1RFUk0pIikgcmVtb3ZlcyBpdCwgYWZ0ZXIKY2FsbGVycyBhcmUgY2hhbmdlZCBvdmVy
IHRvIHBpbl9sb25ndGVybV9wYWdlcyooKS4KClNvIEZPTExfTE9OR1RFUk0gaXMgbm90IGRvaW5n
IG11Y2ggbm93LCBidXQgaXQgaXMgYmFzaWNhbGx5IGEgbWFya2VyIGZvcgoiY2hhbmdlIGd1cChG
T0xMX0xPTkdURVJNKSB0byBwaW5fbG9uZ3Rlcm1fcGFnZXMoKSIsIGFuZCBwYXRjaCAxOAphY3R1
YWxseSBtYWtlcyB0aGF0IGNoYW5nZS4KCkFuZCB0aGVuIHBpbl9sb25ndGVybV9wYWdlcyooKSBp
cywgaW4gdHVybiwgYSB3YXkgdG8gbWFyayBhbGwgdGhlIApwbGFjZXMgdGhhdCBuZWVkIGZpbGUg
c3lzdGVtIGFuZC9vciB1c2VyIHNwYWNlIGludGVyYWN0aW9ucyAobGF5b3V0CmxlYXNlcywgZXRj
KSwgYXMgcGVyICJDYXNlIDI6IFJETUEiIGluIHRoZSBuZXcgCkRvY3VtZW50YXRpb24vdm0vcGlu
X3VzZXJfcGFnZXMucnN0LgoKPiBnZXRfdXNlcl9wYWdlcygpIHZzIGdldF91c2VyX3BhZ2VzX3Jl
bW90ZSgpIHNwbGl0IHByZWRhdGVkIHRoZQo+IGludHJvZHVjdGlvbiBvZiBGT0xMX0xPTkdURVJN
LgoKWWVzLiBBbmQgSSBkbyB3YW50IGNsZWFuIHRoaXMgdXAgYXMgSSBnbywgc28gd2UgZG9uJ3Qg
ZW5kIHVwIHdpdGgKc3RhbGUgY29uY2VwdHMgbGluZ2VyaW5nIGluIGd1cC5jLi4uCgo+IAo+IEkg
dGhpbmsgY2hlY2tfdm1hX2ZsYWdzKCkgc2hvdWxkIGRvIHRoZSAoKEZPTExfTE9OR1RFUk0gfCBG
T0xMX0dFVCkgJiYKPiB2bWFfaXNfZnNkYXgoKSkgY2hlY2sgYW5kIHRoYXQgd291bGQgYWxzbyBy
ZW1vdmUgdGhlIG5lZWQgZm9yCj4gX19ndXBfbG9uZ3Rlcm1fbG9ja2VkLgo+IAoKR29vZCBpZGVh
LCBidXQgdGhlcmUgaXMgc3RpbGwgdGhlIGNhbGwgdG8gY2hlY2tfYW5kX21pZ3JhdGVfY21hX3Bh
Z2VzKCksIAppbnNpZGUgX19ndXBfbG9uZ3Rlcm1fbG9ja2VkKCkuICBTbyBpdCdzIGEgbGl0dGxl
IG1vcmUgaW52b2x2ZWQgYW5kCndlIGNhbid0IHRyaXZpYWxseSBkZWxldGUgX19ndXBfbG9uZ3Rl
cm1fbG9ja2VkKCkgeWV0LCByaWdodD8KCgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElB
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
