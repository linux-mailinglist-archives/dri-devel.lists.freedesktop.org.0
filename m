Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE8381355
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:35:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF736E297;
	Mon,  5 Aug 2019 07:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BBA6E312;
 Sat,  3 Aug 2019 01:41:39 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d44e6540001>; Fri, 02 Aug 2019 18:41:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 02 Aug 2019 18:41:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 02 Aug 2019 18:41:39 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sat, 3 Aug
 2019 01:41:38 +0000
Subject: Re: [PATCH 31/34] nfs: convert put_page() to put_user_page*()
To: Calum Mackay <calum.mackay@oracle.com>, <john.hubbard@gmail.com>, Andrew
 Morton <akpm@linux-foundation.org>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-32-jhubbard@nvidia.com>
 <1738cb1e-15d8-0bbe-5362-341664f6efc8@oracle.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <db136399-ed87-56ea-bd6e-e5d29b145eda@nvidia.com>
Date: Fri, 2 Aug 2019 18:41:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1738cb1e-15d8-0bbe-5362-341664f6efc8@oracle.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564796500; bh=zc1wJBCk6oa4TZJ5kpnxYLs8I/mCQFC0KqXiV/MQqAc=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OLRFKsHoXBw1TGfx4yjE0Mz6/NwSHjUP/99RYZUV8BmAJcU3vy970b00AWaqBbqwn
 eDliId8mLescIf+v3MwQ2SrvN7VrnEwLTirEIw8jXzAjeXgqN3dtxI2Suyrp0L+f3G
 YPfLBq5YLuEzykUeYyNQ/IXUTk0ew3pKoxF86cxfpvc0Iih+8axjrF9wmXCYOssEh/
 dFyCupj1u3LqFaTu0iXYZzaL8I/Fkdd+Hdao45WQIFetVoCK43sV9CCZfHZ6uY+1an
 0Rm4XSFjiP2H1hfdLpXkesSoEJK75cPPtD+8sANcEv6R5DjbxYeg7dbcB8wnnzerOG
 BX10+9E+Fxe0Q==
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yLzE5IDY6MjcgUE0sIENhbHVtIE1hY2theSB3cm90ZToKPiBPbiAwMi8wOC8yMDE5IDM6
MjAgYW0sIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Ci4uLiAKPiBTaW5jZSBpdCdzIHN0
YXRpYywgYW5kIG9ubHkgY2FsbGVkIHR3aWNlLCBtaWdodCBpdCBiZSBiZXR0ZXIgdG8gY2hhbmdl
IGl0cyB0d28gY2FsbGVycyBbbmZzX2RpcmVjdF97cmVhZCx3cml0ZX1fc2NoZWR1bGVfaW92ZWMo
KV0gdG8gY2FsbCBwdXRfdXNlcl9wYWdlcygpIGRpcmVjdGx5LCBhbmQgcmVtb3ZlIG5mc19kaXJl
Y3RfcmVsZWFzZV9wYWdlcygpIGVudGlyZWx5Pwo+IAo+IHRoYW5rcywKPiBjYWx1bS4KPiAKPiAK
Pj4gwqAgwqAgdm9pZCBuZnNfaW5pdF9jaW5mb19mcm9tX2RyZXEoc3RydWN0IG5mc19jb21taXRf
aW5mbyAqY2luZm8sCj4+CiAKSGkgQ2FsdW0sCgpBYnNvbHV0ZWx5ISBJcyBpdCBPSyB0byBhZGQg
eW91ciByZXZpZXdlZC1ieSwgd2l0aCB0aGUgZm9sbG93aW5nIGluY3JlbWVudGFsCnBhdGNoIG1h
ZGUgdG8gdGhpcyBvbmU/CgpkaWZmIC0tZ2l0IGEvZnMvbmZzL2RpcmVjdC5jIGIvZnMvbmZzL2Rp
cmVjdC5jCmluZGV4IGIwMGI4OWRkYTNjNS4uYzBjMWI5ZjJjMDY5IDEwMDY0NAotLS0gYS9mcy9u
ZnMvZGlyZWN0LmMKKysrIGIvZnMvbmZzL2RpcmVjdC5jCkBAIC0yNzYsMTEgKzI3Niw2IEBAIHNz
aXplX3QgbmZzX2RpcmVjdF9JTyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAq
aXRlcikKICAgICAgICByZXR1cm4gbmZzX2ZpbGVfZGlyZWN0X3dyaXRlKGlvY2IsIGl0ZXIpOwog
fQogCi1zdGF0aWMgdm9pZCBuZnNfZGlyZWN0X3JlbGVhc2VfcGFnZXMoc3RydWN0IHBhZ2UgKipw
YWdlcywgdW5zaWduZWQgaW50IG5wYWdlcykKLXsKLSAgICAgICBwdXRfdXNlcl9wYWdlcyhwYWdl
cywgbnBhZ2VzKTsKLX0KLQogdm9pZCBuZnNfaW5pdF9jaW5mb19mcm9tX2RyZXEoc3RydWN0IG5m
c19jb21taXRfaW5mbyAqY2luZm8sCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBuZnNfZGlyZWN0X3JlcSAqZHJlcSkKIHsKQEAgLTUxMCw3ICs1MDUsNyBAQCBzdGF0aWMgc3Np
emVfdCBuZnNfZGlyZWN0X3JlYWRfc2NoZWR1bGVfaW92ZWMoc3RydWN0IG5mc19kaXJlY3RfcmVx
ICpkcmVxLAogICAgICAgICAgICAgICAgICAgICAgICBwb3MgKz0gcmVxX2xlbjsKICAgICAgICAg
ICAgICAgICAgICAgICAgZHJlcS0+Ynl0ZXNfbGVmdCAtPSByZXFfbGVuOwogICAgICAgICAgICAg
ICAgfQotICAgICAgICAgICAgICAgbmZzX2RpcmVjdF9yZWxlYXNlX3BhZ2VzKHBhZ2V2ZWMsIG5w
YWdlcyk7CisgICAgICAgICAgICAgICBwdXRfdXNlcl9wYWdlcyhwYWdldmVjLCBucGFnZXMpOwog
ICAgICAgICAgICAgICAga3ZmcmVlKHBhZ2V2ZWMpOwogICAgICAgICAgICAgICAgaWYgKHJlc3Vs
dCA8IDApCiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwpAQCAtOTMzLDcgKzkyOCw3IEBA
IHN0YXRpYyBzc2l6ZV90IG5mc19kaXJlY3Rfd3JpdGVfc2NoZWR1bGVfaW92ZWMoc3RydWN0IG5m
c19kaXJlY3RfcmVxICpkcmVxLAogICAgICAgICAgICAgICAgICAgICAgICBwb3MgKz0gcmVxX2xl
bjsKICAgICAgICAgICAgICAgICAgICAgICAgZHJlcS0+Ynl0ZXNfbGVmdCAtPSByZXFfbGVuOwog
ICAgICAgICAgICAgICAgfQotICAgICAgICAgICAgICAgbmZzX2RpcmVjdF9yZWxlYXNlX3BhZ2Vz
KHBhZ2V2ZWMsIG5wYWdlcyk7CisgICAgICAgICAgICAgICBwdXRfdXNlcl9wYWdlcyhwYWdldmVj
LCBucGFnZXMpOwogICAgICAgICAgICAgICAga3ZmcmVlKHBhZ2V2ZWMpOwogICAgICAgICAgICAg
ICAgaWYgKHJlc3VsdCA8IDApCiAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwoKCgp0aGFu
a3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
