Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E80FF254E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2019 03:25:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F546EE6C;
	Thu,  7 Nov 2019 02:25:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286EF6EE6C
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2019 02:25:10 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 Nov 2019 18:25:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,276,1569308400"; d="scan'208";a="227685020"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by fmsmga004.fm.intel.com with ESMTP; 06 Nov 2019 18:25:08 -0800
Date: Wed, 6 Nov 2019 18:25:08 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191107022508.GB32084@iweiny-DESK2.sc.intel.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <20191105131032.GG25005@rapoport-lnx>
 <9ac948a4-59bf-2427-2007-e460aad2848a@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ac948a4-59bf-2427-2007-e460aad2848a@nvidia.com>
User-Agent: Mutt/1.11.1 (2018-12-01)
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAKPiAKPiAuLi4KPiA+PiArVGhpcyBkb2N1bWVudCBkZXNjcmliZXMgdGhlIGZvbGxvd2luZyBm
dW5jdGlvbnM6IDo6Cj4gPj4gKwo+ID4+ICsgcGluX3VzZXJfcGFnZXMKPiA+PiArIHBpbl91c2Vy
X3BhZ2VzX2Zhc3QKPiA+PiArIHBpbl91c2VyX3BhZ2VzX3JlbW90ZQo+ID4+ICsKPiA+PiArIHBp
bl9sb25ndGVybV9wYWdlcwo+ID4+ICsgcGluX2xvbmd0ZXJtX3BhZ2VzX2Zhc3QKPiA+PiArIHBp
bl9sb25ndGVybV9wYWdlc19yZW1vdGUKPiA+PiArCj4gPj4gK0Jhc2ljIGRlc2NyaXB0aW9uIG9m
IEZPTExfUElOCj4gPj4gKz09PT09PT09PT09PT09PT09PT09PT09PT09PT09Cj4gPj4gKwo+ID4+
ICtBIG5ldyBmbGFnIGZvciBnZXRfdXNlcl9wYWdlcyAoImd1cCIpIGhhcyBiZWVuIGFkZGVkOiBG
T0xMX1BJTi4gRk9MTF9QSU4gaGFzCj4gPiAKPiA+IENvbnNpZGVyIHJlYWRpbmcgdGhpcyBhZnRl
ciwgc2F5LCBoYWxmIGEgeWVhciA7LSkKPiA+IAo+IAo+IE9LLCBPSy4gSSBrbmV3IHdoZW4gSSB3
cm90ZSB0aGF0IHRoYXQgaXQgd2FzIG5vdCBnb2luZyB0byBzdGF5IG5ldyBmb3JldmVyLCBidXQK
PiBzb21laG93IGZhaWxlZCB0byB3cml0ZSB0aGUgcmlnaHQgdGhpbmcgYW55d2F5LiA6KSAKPiAK
PiBIZXJlJ3MgYSByZXZpc2VkIHNldCBvZiBwYXJhZ3JhcGhzOgo+IAo+IEJhc2ljIGRlc2NyaXB0
aW9uIG9mIEZPTExfUElOCj4gPT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KPiAKPiBGT0xM
X1BJTiBhbmQgRk9MTF9MT05HVEVSTSBhcmUgZmxhZ3MgdGhhdCBjYW4gYmUgcGFzc2VkIHRvIHRo
ZSBnZXRfdXNlcl9wYWdlcyooKQo+ICgiZ3VwIikgZmFtaWx5IG9mIGZ1bmN0aW9ucy4gRk9MTF9Q
SU4gaGFzIHNpZ25pZmljYW50IGludGVyYWN0aW9ucyBhbmQKPiBpbnRlcmRlcGVuZGVuY2llcyB3
aXRoIEZPTExfTE9OR1RFUk0sIHNvIGJvdGggYXJlIGNvdmVyZWQgaGVyZS4KPiAKPiBCb3RoIEZP
TExfUElOIGFuZCBGT0xMX0xPTkdURVJNIGFyZSBpbnRlcm5hbCB0byBndXAsIG1lYW5pbmcgdGhh
dCBuZWl0aGVyCj4gRk9MTF9QSU4gbm9yIEZPTExfTE9OR1RFUk0gc2hvdWxkIG5vdCBhcHBlYXIg
YXQgdGhlIGd1cCBjYWxsIHNpdGVzLiBUaGlzIGFsbG93cwo+IHRoZSBhc3NvY2lhdGVkIHdyYXBw
ZXIgZnVuY3Rpb25zICAocGluX3VzZXJfcGFnZXMoKSBhbmQgb3RoZXJzKSB0byBzZXQgdGhlCj4g
Y29ycmVjdCBjb21iaW5hdGlvbiBvZiB0aGVzZSBmbGFncywgYW5kIHRvIGNoZWNrIGZvciBwcm9i
bGVtcyBhcyB3ZWxsLgoKSSBsaWtlIHRoaXMgcmV2aXNpb24gYXMgd2VsbC4KCklyYQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
