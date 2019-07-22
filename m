Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C46017126E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 09:14:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59659891C5;
	Tue, 23 Jul 2019 07:14:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9622B89D60
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 18:53:55 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d3606400002>; Mon, 22 Jul 2019 11:53:52 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jul 2019 11:53:55 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jul 2019 11:53:55 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jul
 2019 18:53:54 +0000
Subject: Re: [PATCH 1/3] drivers/gpu/drm/via: convert put_page() to
 put_user_page*()
To: Christoph Hellwig <hch@lst.de>, <john.hubbard@gmail.com>
References: <20190722043012.22945-1-jhubbard@nvidia.com>
 <20190722043012.22945-2-jhubbard@nvidia.com> <20190722093355.GB29538@lst.de>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <397ff3e4-e857-037a-1aee-ff6242e024b2@nvidia.com>
Date: Mon, 22 Jul 2019 11:53:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190722093355.GB29538@lst.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Tue, 23 Jul 2019 07:14:10 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1563821633; bh=dVEAb2CGI+Rcq3kPxf1ySX9mPnHE1aqM1bmhIjbORUc=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=eHxEvTFv6L+WemzCvidD7VMIxCoaZLY3ldBhfjBzZkU7tTVOnh6NzLM6wg9FUplyD
 D0oLKBBvM6hMS+ymKog+umY3MwWGZIg000Hu11aU4hWvthARJqci+aEOiKdQJwehcL
 g9KRex/lwf2eQDuO1uxIJpOwluaSuBN6n5H5p3/H35UorrqHejB2Bci5etFev/kzsH
 bTZinKpQGy/1lJTQI3bAW1mvNHQBX04JheQmgliiNBOIM6Wu8wheO4oaifMprPlbZc
 zESTjrldw/O2jBzSIXIaQxrUMlfL0Jn4pMMdzT87P6IO/CKI34Wp+0rUSLF6zCbFtn
 JG4SfyPwbFkqg==
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
 Sage Weil <sage@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>,
 linux-rdma@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Johannes Thumshirn <jthumshirn@suse.de>,
 Ilya Dryomov <idryomov@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Ming Lei <ming.lei@redhat.com>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Dan Williams <dan.j.williams@intel.com>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Yan Zheng <zyan@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNy8yMi8xOSAyOjMzIEFNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBTdW4sIEp1
bCAyMSwgMjAxOSBhdCAwOTozMDoxMFBNIC0wNzAwLCBqb2huLmh1YmJhcmRAZ21haWwuY29tIHdy
b3RlOgo+PiAgCQlmb3IgKGkgPSAwOyBpIDwgdnNnLT5udW1fcGFnZXM7ICsraSkgewo+PiAgCQkJ
aWYgKE5VTEwgIT0gKHBhZ2UgPSB2c2ctPnBhZ2VzW2ldKSkgewo+PiAgCQkJCWlmICghUGFnZVJl
c2VydmVkKHBhZ2UpICYmIChETUFfRlJPTV9ERVZJQ0UgPT0gdnNnLT5kaXJlY3Rpb24pKQo+PiAt
CQkJCQlTZXRQYWdlRGlydHkocGFnZSk7Cj4+IC0JCQkJcHV0X3BhZ2UocGFnZSk7Cj4+ICsJCQkJ
CXB1dF91c2VyX3BhZ2VzX2RpcnR5KCZwYWdlLCAxKTsKPj4gKwkJCQllbHNlCj4+ICsJCQkJCXB1
dF91c2VyX3BhZ2UocGFnZSk7Cj4+ICAJCQl9Cj4gCj4gQ2FuJ3QganVzdCBwYXNzIGEgZGlydHkg
YXJndW1lbnQgdG8gcHV0X3VzZXJfcGFnZXM/ICBBbHNvIGRvIHdlIHJlYWxseQoKWWVzLCBhbmQg
aW4gZmFjdCB0aGF0IHdvdWxkIGhlbHAgYSBsb3QgbW9yZSB0aGFuIHRoZSBzaW5nbGUgcGFnZSBj
YXNlLAp3aGljaCBpcyByZWFsbHkganVzdCBjb3NtZXRpYyBhZnRlciBhbGwuCgo+IG5lZWQgYSBz
ZXBhcmF0ZSBwdXRfdXNlcl9wYWdlIGZvciB0aGUgc2luZ2xlIHBhZ2UgY2FzZT8KPiBwdXRfdXNl
cl9wYWdlc19kaXJ0eT8KCk5vdCByZWFsbHkuIEknbSBzdGlsbCB6ZXJvaW5nIGluIG9uIHRoZSBp
ZGVhbCBBUEkgZm9yIGFsbCB0aGVzZSBjYWxsIHNpdGVzLAphbmQgSSBhZ3JlZSB0aGF0IHRoZSBh
cHByb2FjaCBiZWxvdyBpcyBjbGVhbmVyLgoKPiAKPiBBbHNvIHRoZSBQYWdlUmVzZXJ2ZWQgY2hl
Y2sgbG9va3MgYm9ndXMsIGFzIEkgY2FuJ3Qgc2VlIGhvdyBhIHJlc2VydmVkCj4gcGFnZSBjYW4g
ZW5kIHVwIGhlcmUuICBTbyBJTUhPIHRoZSBhYm92ZSBzbmlwcGxlZCBzaG91bGQgcmVhbGx5IGxv
b2sKPiBzb21ldGhpbmcgbGlrZSB0aGlzOgo+IAo+IAlwdXRfdXNlcl9wYWdlcyh2c2ctPnBhZ2Vz
W2ldLCB2c2ctPm51bV9wYWdlcywKPiAJCQl2c2ctPmRpcmVjdGlvbiA9PSBETUFfRlJPTV9ERVZJ
Q0UpOwo+IAo+IGluIHRoZSBlbmQuCj4gCgpBZ3JlZWQuCgp0aGFua3MsCi0tIApKb2huIEh1YmJh
cmQKTlZJRElBCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
