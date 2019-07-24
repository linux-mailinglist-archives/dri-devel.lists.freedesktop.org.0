Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E81397289A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:54:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22186E461;
	Wed, 24 Jul 2019 06:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C956E419
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:31:41 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d37b5040000>; Tue, 23 Jul 2019 18:31:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 23 Jul 2019 18:31:41 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 23 Jul 2019 18:31:41 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 24 Jul
 2019 01:31:40 +0000
Subject: Re: [PATCH v2 1/3] mm/gup: add make_dirty arg to
 put_user_pages_dirty_lock()
To: <john.hubbard@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20190724012606.25844-1-jhubbard@nvidia.com>
 <20190724012606.25844-2-jhubbard@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <5c303c80-57fd-d278-44d5-942597051c9b@nvidia.com>
Date: Tue, 23 Jul 2019 18:31:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190724012606.25844-2-jhubbard@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563931909; bh=81R/Z2rovzmAa3O7DCJ8y2Mm5lAz4O2B1wbIdVhO0d8=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=MZp+92jz2hi7YdN6tLDK8z1eC1uLpMRF40meQ2s9fwq6g4B9htd8sWjxYIZKrFjzq
 rzQ9TatkUJR6cyZROMl6hFqaMQeRYpO03LCBgAZEo3xs0F+nmfoIyTCMuXKQ59L1xS
 gdUa2BTvfnNV4iodEKtUj05VAC8SKCgNUQTrax68+CM02hlPTNXkWRAvG3XSRVplYv
 0MxSrhtKA08RkqMdDIqLCCNArJx3od95qj7DYoZQ3AU4bpKKMac8p4K892FQTy5uer
 EqqNClz/RksPmVn2YSLrccR3IeJg5m2d6OTXLpBTBDx9hmPI0SUF2vYAqIbJdo3jQQ
 nvb6gKNgeakLQ==
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
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-rdma@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Johannes Thumshirn <jthumshirn@suse.de>,
 Ilya Dryomov <idryomov@gmail.com>,
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

T24gNy8yMy8xOSA2OjI2IFBNLCBqb2huLmh1YmJhcmRAZ21haWwuY29tIHdyb3RlOgo+IEZyb206
IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLi4uCj4gKwkJICogMikgVGhpcyBj
b2RlIHNlZXMgdGhlIHBhZ2UgYXMgY2xlYW4sIHNvIGl0IGNhbGxzCj4gKwkJICogc2V0X3BhZ2Vf
ZGlydHkoKS4gVGhlIHBhZ2Ugc3RheXMgZGlydHksIGRlc3BpdGUgYmVpbmcKPiArCQkgKiB3cml0
dGVuIGJhY2ssIHNvIGl0IGdldHMgd3JpdHRlbiBiYWNrIGFnYWluIGluIHRoZQo+ICsJCSAqIG5l
eHQgd3JpdGViYWNrIGN5Y2xlLiBUaGlzIGlzIGhhcm1sZXNzLgo+ICsJCSAqLwo+ICsJCWlmICgh
UGFnZURpcnR5KHBhZ2UpKQo+ICsJCQlzZXRfcGFnZV9kaXJ0eV9sb2NrKHBhZ2UpOwo+ICsJCWJy
ZWFrOwoKYWhlbSwgdGhlIGFib3ZlICJicmVhayIgc2hvdWxkIG5vdCBiZSB0aGVyZSwgaXQncyBh
biBhcnRpZmFjdCwgc29ycnkgYWJvdXQgCnRoYXQuIFdpbGwgY29ycmVjdCBvbiB0aGUgbmV4dCBp
dGVyYXRpb24uCgp0aGFua3MsCi0tIApKb2huIEh1YmJhcmQKTlZJRElBCgoKPiArCQlwdXRfdXNl
cl9wYWdlKHBhZ2UpOwo+ICsJfQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0wocHV0X3VzZXJfcGFnZXNf
ZGlydHlfbG9jayk7Cj4gIAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
