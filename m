Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F9F7EEC1
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:19:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAA4C6ED10;
	Fri,  2 Aug 2019 08:19:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D871F6E888;
 Fri,  2 Aug 2019 02:39:01 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d43a24e0000>; Thu, 01 Aug 2019 19:39:10 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 01 Aug 2019 19:39:01 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 01 Aug 2019 19:39:01 -0700
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 02:39:00 +0000
Subject: Re: [PATCH 00/34] put_user_pages(): miscellaneous call sites
To: <john.hubbard@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
References: <20190802021653.4882-1-jhubbard@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <ec87b662-0fc2-0951-1337-a91b4888201b@nvidia.com>
Date: Thu, 1 Aug 2019 19:39:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190802021653.4882-1-jhubbard@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564713550; bh=uB7qKWJf2vIk7MCI51NrKGKnU0tjP3n9YQM4FSsQ99A=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=aftmkmmNomCdfG4/nsU7QFjmse0kzSiVn7k6qdyITGQKtpIb7fXB3ira93x2ikjhP
 hh9fWh6OxSH7I4ITUxx9rk4nMXoUcCl6xE7j7d8OaKs0QzK3tWjGXYe1PPsA5+CMkF
 sKiN+5/hdBTh4TsmJWAPetkvcksKG1W7KX4K24lGpfHw6t/QQ4fbKf5zlriq/zHiCI
 WN7lLvY4tFrWOLTfdOFRIa/sFBuq00RVcHrLnsHi/Dnbw2dVeWXrugMTAYnP04jnRA
 tXP1GLNpYcsDC/T0sb/csl6pvYXC87xnKjlVca8dQdSp/cuFTGUobSHcHyKfqM9q/X
 eCw5n+JFkzHyg==
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
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xLzE5IDc6MTYgUE0sIGpvaG4uaHViYmFyZEBnbWFpbC5jb20gd3JvdGU6Cj4gRnJvbTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IAo+IEhpLAo+IAo+IFRoZXNlIGFy
ZSBiZXN0IGNoYXJhY3Rlcml6ZWQgYXMgbWlzY2VsbGFuZW91cyBjb252ZXJzaW9uczogbWFueSAo
bm90IGFsbCkKPiBjYWxsIHNpdGVzIHRoYXQgZG9uJ3QgaW52b2x2ZSBiaW92ZWMgb3IgaW92X2l0
ZXIsIG5vciBtbS8uIEl0IGFsc28gbGVhdmVzCj4gb3V0IGEgZmV3IGNhbGwgc2l0ZXMgdGhhdCBy
ZXF1aXJlIHNvbWUgbW9yZSB3b3JrLiBUaGVzZSBhcmUgbW9zdGx5IHByZXR0eQo+IHNpbXBsZSBv
bmVzLgo+IAo+IEl0J3MgcHJvYmFibHkgYmVzdCB0byBzZW5kIGFsbCBvZiB0aGVzZSB2aWEgQW5k
cmV3J3MgLW1tIHRyZWUsIGFzc3VtaW5nCj4gdGhhdCB0aGVyZSBhcmUgbm8gc2lnbmlmaWNhbnQg
bWVyZ2UgY29uZmxpY3RzIHdpdGggb25nb2luZyB3b3JrIGluIG90aGVyCj4gdHJlZXMgKHdoaWNo
IEkgZG91YnQsIGdpdmVuIHRoYXQgdGhlc2UgYXJlIHNtYWxsIGNoYW5nZXMpLgo+IAoKSW4gY2Fz
ZSBhbnlvbmUgaXMgd29uZGVyaW5nLCB0aGlzIHRydW5jYXRlZCBzZXJpZXMgaXMgZHVlIHRvIGEg
c2NyaXB0IGZhaWx1cmU6CmdpdC1zZW5kLWVtYWlsIGNob2tlcyB3aGVuIGl0IGhpdHMgZW1haWwg
YWRkcmVzc2VzIHdob3NlIG5hbWVzIGhhdmUgYQpjb21tYSBpbiB0aGVtLCBhcyBoYXBwZW5lZCBo
ZXJlIHdpdGggcGF0Y2ggMDAwMy4gIAoKUGxlYXNlIGRpc3JlZ2FyZCB0aGlzIHNldCBhbmQgcmVw
bHkgdG8gdGhlIG90aGVyIHRocmVhZC4KCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
