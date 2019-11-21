Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A70104FB9
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 10:54:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F11996EC8C;
	Thu, 21 Nov 2019 09:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 334A06EC8C
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 09:54:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1B5FCAC46;
 Thu, 21 Nov 2019 09:54:13 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 5A11F1E47FC; Thu, 21 Nov 2019 10:54:11 +0100 (CET)
Date: Thu, 21 Nov 2019 10:54:11 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 02/24] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191121095411.GC18190@quack2.suse.cz>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-3-jhubbard@nvidia.com>
 <20191121080356.GA24784@lst.de>
 <852f6c27-8b65-547b-89e0-e8f32a4d17b9@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <852f6c27-8b65-547b-89e0-e8f32a4d17b9@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDIxLTExLTE5IDAwOjI5OjU5LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gPiAKPiA+IE90
aGVyd2lzZSB0aGlzIGxvb2tzIGZpbmUgYW5kIG1pZ2h0IGJlIGEgd29ydGh3aGlsZSBjbGVhbnVw
IHRvIGZlZWQKPiA+IEFuZHJldyBmb3IgNS41IGluZGVwZW5kZW50IG9mIHRoZSBndXQgb2YgdGhl
IGNoYW5nZXMuCj4gPiAKPiA+IFJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxz
dC5kZT4KPiA+IAo+IAo+IFRoYW5rcyBmb3IgdGhlIHJldmlld3MhIFNheSwgaXQgc291bmRzIGxp
a2UgeW91ciB2aWV3IGhlcmUgaXMgdGhhdCB0aGlzCj4gc2VyaWVzIHNob3VsZCBiZSB0YXJnZXRl
ZCBhdCA1LjYgKG5vdCA1LjUpLCBpcyB0aGF0IHdoYXQgeW91IGhhdmUgaW4gbWluZD8KPiBBbmQg
Z2V0IHRoZSBwcmVwYXJhdG9yeSBwYXRjaGVzICgxLTksIGFuZCBtYXliZSBldmVuIDEwLTE2KSBp
bnRvIDUuNT8KCk9uZSBtb3JlIG5vdGUgOikgSWYgeW91IGFyZSBnb2luZyB0byBwdXNoIHBpbl91
c2VyX3BhZ2VzKCkgaW50ZXJmYWNlcwood2hpY2ggSSdtIGZpbmUgd2l0aCksIGl0IHdvdWxkIHBy
b2JhYmx5IG1ha2Ugc2Vuc2UgdG8gcHVzaCBhbHNvIHRoZQpwdXRfdXNlcl9wYWdlcygpIC0+IHVu
cGluX3VzZXJfcGFnZXMoKSByZW5hbWluZyBzbyB0aGF0IHRoYXQgaW5jb25zaXN0ZW5jeQppbiBu
YW1pbmcgZG9lcyBub3QgZXhpc3QgaW4gdGhlIHJlbGVhc2VkIHVwc3RyZWFtIGtlcm5lbC4KCgkJ
CQkJCQkJSG9uemEKLS0gCkphbiBLYXJhIDxqYWNrQHN1c2UuY29tPgpTVVNFIExhYnMsIENSCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
