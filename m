Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C0BF9BD2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 22:15:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3916EBEF;
	Tue, 12 Nov 2019 21:15:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39FE36EBEF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 21:14:59 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb20d50000>; Tue, 12 Nov 2019 13:15:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 13:14:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 13:14:58 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 21:14:57 +0000
Subject: Re: [PATCH v3 11/23] IB/{core,hw,umem}: set FOLL_PIN, FOLL_LONGTERM
 via pin_longterm_pages*()
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-12-jhubbard@nvidia.com>
 <20191112204449.GF5584@ziepe.ca>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <3513d317-8e29-006f-1624-e9aa94ce9ad5@nvidia.com>
Date: Tue, 12 Nov 2019 13:14:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112204449.GF5584@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573593301; bh=IA5cc3Ug8y/Soy37I3lcgnCK4KJuS9HA5F969hpkGDk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=M+zD7DiTvJEHWyZUscBaWsNyvdd7nW2Z8MINjy6zlNtzbk8yDqUSKZUYoDkjLfsT1
 jhJdgaW8sOVEVYkkTrDIJJa4fwOit67TvUa2zybzBPmS46CYVBpq/47LCJQvGX/3++
 kN6TX/8r3rAiSK8yfXz19Ap8X1CeF0WYNvVBYngtzVePIwXr6m7SCdxfr4dOboh5Y+
 2hlHGc9hiYvLqwfEFqtP6wQ0eViLmw5Mlq+PhJcVMOubS+xNo9DKWwkDLrS4gEKUIZ
 bPZcwVTnmn5+kG5LhprB02X6C6BdeIO1M4uKbavcouV5mwBgzW09isv1UnQ87weLii
 Kt8d5q/apbk1g==
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
 linux-kselftest@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDExLzEyLzE5IDEyOjQ0IFBNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gTW9uLCBO
b3YgMTEsIDIwMTkgYXQgMDQ6MDY6NDhQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdyb3RlOgo+PiBA
QCAtNTQyLDcgKzU0MSw3IEBAIHN0YXRpYyBpbnQgaWJfdW1lbV9vZHBfbWFwX2RtYV9zaW5nbGVf
cGFnZSgKPj4gIAl9Cj4+ICAKPj4gIG91dDoKPj4gLQlwdXRfdXNlcl9wYWdlKHBhZ2UpOwo+PiAr
CXB1dF9wYWdlKHBhZ2UpOwo+PiAgCj4+ICAJaWYgKHJlbW92ZV9leGlzdGluZ19tYXBwaW5nKSB7
Cj4+ICAJCWliX3VtZW1fbm90aWZpZXJfc3RhcnRfYWNjb3VudCh1bWVtX29kcCk7Cj4+IEBAIC02
MzksMTMgKzYzOCwxNCBAQCBpbnQgaWJfdW1lbV9vZHBfbWFwX2RtYV9wYWdlcyhzdHJ1Y3QgaWJf
dW1lbV9vZHAgKnVtZW1fb2RwLCB1NjQgdXNlcl92aXJ0LAo+PiAgCQkvKgo+PiAgCQkgKiBOb3Rl
OiB0aGlzIG1pZ2h0IHJlc3VsdCBpbiByZWR1bmRlbnQgcGFnZSBnZXR0aW5nLiBXZSBjYW4KPj4g
IAkJICogYXZvaWQgdGhpcyBieSBjaGVja2luZyBkbWFfbGlzdCB0byBiZSAwIGJlZm9yZSBjYWxs
aW5nCj4+IC0JCSAqIGdldF91c2VyX3BhZ2VzLiBIb3dldmVyLCB0aGlzIG1ha2UgdGhlIGNvZGUg
bXVjaCBtb3JlCj4+IC0JCSAqIGNvbXBsZXggKGFuZCBkb2Vzbid0IGdhaW4gdXMgbXVjaCBwZXJm
b3JtYW5jZSBpbiBtb3N0IHVzZQo+PiAtCQkgKiBjYXNlcykuCj4+ICsJCSAqIGdldF91c2VyX3Bh
Z2VzLiBIb3dldmVyLCB0aGlzIG1ha2VzIHRoZSBjb2RlIG11Y2gKPj4gKwkJICogbW9yZSBjb21w
bGV4IChhbmQgZG9lc24ndCBnYWluIHVzIG11Y2ggcGVyZm9ybWFuY2UgaW4gbW9zdAo+PiArCQkg
KiB1c2UgY2FzZXMpLgo+PiAgCQkgKi8KPj4gIAkJbnBhZ2VzID0gZ2V0X3VzZXJfcGFnZXNfcmVt
b3RlKG93bmluZ19wcm9jZXNzLCBvd25pbmdfbW0sCj4+IC0JCQkJdXNlcl92aXJ0LCBndXBfbnVt
X3BhZ2VzLAo+PiAtCQkJCWZsYWdzLCBsb2NhbF9wYWdlX2xpc3QsIE5VTEwsIE5VTEwpOwo+PiAr
CQkJCQkgICAgICAgdXNlcl92aXJ0LCBndXBfbnVtX3BhZ2VzLAo+PiArCQkJCQkgICAgICAgZmxh
Z3MsIGxvY2FsX3BhZ2VfbGlzdCwgTlVMTCwKPj4gKwkJCQkJICAgICAgIE5VTEwpOwo+PiAgCQl1
cF9yZWFkKCZvd25pbmdfbW0tPm1tYXBfc2VtKTsKPiAKPiBUaGlzIGlzIGp1c3Qgd2hpdGVzcGFj
ZSBjaHVybj8gRHJvcCBpdC4uCj4gCgoKV2hvb3BzLCB5ZXMuIEl0IGdvdCB0aGVyZSBiZWNhdXNl
IG9mIGdvaW5nIHRocm91Z2ggdGhlIHBpbiooKSBjb252ZXJzaW9uCmFuZCB0aGVuIGEgcmV2ZXJ0
LCBhbmQgbm93IGl0J3MganVzdCB3aGl0ZXNwYWNlLiBJJ2xsIGRyb3AgaXQsIHRoYW5rcyBmb3IK
Y2F0Y2hpbmcgdGhhdC4KCgp0aGFua3MsCgpKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
