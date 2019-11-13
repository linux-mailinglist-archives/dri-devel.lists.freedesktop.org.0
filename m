Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92776FB9A7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 21:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1CE66EE4E;
	Wed, 13 Nov 2019 20:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F409B6EE4E
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 20:22:36 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc660b0000>; Wed, 13 Nov 2019 12:22:35 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 12:22:36 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 13 Nov 2019 12:22:36 -0800
Received: from [10.2.160.107] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 20:22:35 +0000
Subject: Re: [PATCH v4 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Ira Weiny <ira.weiny@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-9-jhubbard@nvidia.com>
 <20191113130202.GA26068@ziepe.ca>
 <20191113191705.GE12947@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <290ba4aa-247e-6570-9eff-ccf2087e1120@nvidia.com>
Date: Wed, 13 Nov 2019 12:19:50 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113191705.GE12947@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573676555; bh=FW0krwPwWqciO/Z2LS4wGz5Cikl4rg4mIFXWQ1mXpqU=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=n1t9MMHier43EuFZpftpwQVDKG8oSo9TdOvV+OMzrOIN0Kprv6dkR4Jpu6/PqCqXm
 /jCxLMJDxPPXF7oklQ45MeW/Fl3jyAJJ4cfyLvk1YJ3ZXQloakTUN/6QsjTZ2e8wLd
 Vi5ItQz0+ykvg9G6LEUGgX0gLMaFmq2awJU2Kk5qVpihlMSAmAuGK9LjnFEEtlsHOE
 JOaWrzJR8vtoHRO1QeIa0YnKmF32io8xAGlhrbiuGj5eUhM/rh5jJ0AdTIvnBhqGbA
 tSsPrYCj4XsKBHj/d5S4XMsaWdBoBg5n+7WnTPKexUFAUitbBsugmf2TNoS/6cs3Dr
 dZibHSHNj0z1Q==
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
 kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTMvMTkgMTE6MTcgQU0sIElyYSBXZWlueSB3cm90ZToKLi4uCj4+PiBAQCAtMzQ4LDMz
ICszNDcsMTMgQEAgc3RhdGljIGludCB2YWRkcl9nZXRfcGZuKHN0cnVjdCBtbV9zdHJ1Y3QgKm1t
LCB1bnNpZ25lZCBsb25nIHZhZGRyLAo+Pj4gICAJCWZsYWdzIHw9IEZPTExfV1JJVEU7Cj4+PiAg
IAo+Pj4gICAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+Pj4gLQlpZiAobW0gPT0gY3VycmVu
dC0+bW0pIHsKPj4+IC0JCXJldCA9IGdldF91c2VyX3BhZ2VzKHZhZGRyLCAxLCBmbGFncyB8IEZP
TExfTE9OR1RFUk0sIHBhZ2UsCj4+PiAtCQkJCSAgICAgdm1hcyk7Cj4+PiAtCX0gZWxzZSB7Cj4+
PiAtCQlyZXQgPSBnZXRfdXNlcl9wYWdlc19yZW1vdGUoTlVMTCwgbW0sIHZhZGRyLCAxLCBmbGFn
cywgcGFnZSwKPj4+IC0JCQkJCSAgICB2bWFzLCBOVUxMKTsKPj4+IC0JCS8qCj4+PiAtCQkgKiBU
aGUgbGlmZXRpbWUgb2YgYSB2YWRkcl9nZXRfcGZuKCkgcGFnZSBwaW4gaXMKPj4+IC0JCSAqIHVz
ZXJzcGFjZS1jb250cm9sbGVkLiBJbiB0aGUgZnMtZGF4IGNhc2UgdGhpcyBjb3VsZAo+Pj4gLQkJ
ICogbGVhZCB0byBpbmRlZmluaXRlIHN0YWxscyBpbiBmaWxlc3lzdGVtIG9wZXJhdGlvbnMuCj4+
PiAtCQkgKiBEaXNhbGxvdyBhdHRlbXB0cyB0byBwaW4gZnMtZGF4IHBhZ2VzIHZpYSB0aGlzCj4+
PiAtCQkgKiBpbnRlcmZhY2UuCj4+PiAtCQkgKi8KPj4+IC0JCWlmIChyZXQgPiAwICYmIHZtYV9p
c19mc2RheCh2bWFzWzBdKSkgewo+Pj4gLQkJCXJldCA9IC1FT1BOT1RTVVBQOwo+Pj4gLQkJCXB1
dF9wYWdlKHBhZ2VbMF0pOwo+Pj4gLQkJfQo+Pj4gLQl9Cj4+PiAtCXVwX3JlYWQoJm1tLT5tbWFw
X3NlbSk7Cj4+PiAtCj4+PiArCXJldCA9IGdldF91c2VyX3BhZ2VzX3JlbW90ZShOVUxMLCBtbSwg
dmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwKPj4+ICsJCQkJICAgIHBhZ2UsIE5VTEws
IE5VTEwpOwo+Pj4gICAJaWYgKHJldCA9PSAxKSB7Cj4+PiAgIAkJKnBmbiA9IHBhZ2VfdG9fcGZu
KHBhZ2VbMF0pOwo+Pj4gICAJCXJldHVybiAwOwo+Pgo+PiBNaW5kIHRoZSByZXR1cm4gd2l0aCB0
aGUgbG9jayBoZWxkIHRoaXMgbmVlZHMgc29tZSBnb3RvIHVud2luZAo+IAo+IEFoIHllYS4uLiAg
cmV0cmFjdCBteSByZXZpZXdlZCBieS4uLiAgOi0oCj4gCgpvb29wcywgZW1iYXJyYXNzZWQgdGhh
dCBJIG1pc3NlZCB0aGF0LCBnb29kIGNhdGNoLiBXaWxsIHJlcG9zdCB3aXRoIGl0IGZpeGVkLgoK
Cgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
