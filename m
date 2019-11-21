Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C83E1104F95
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 10:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9286EC96;
	Thu, 21 Nov 2019 09:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C10C6EC96
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 09:49:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8A829AE39;
 Thu, 21 Nov 2019 09:49:10 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 0C6121E47FC; Thu, 21 Nov 2019 10:49:08 +0100 (CET)
Date: Thu, 21 Nov 2019 10:49:08 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 02/24] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191121094908.GB18190@quack2.suse.cz>
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

T24gVGh1IDIxLTExLTE5IDAwOjI5OjU5LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gT24gMTEvMjEv
MTkgMTI6MDMgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gT3RoZXJ3aXNlIHRoaXMg
bG9va3MgZmluZSBhbmQgbWlnaHQgYmUgYSB3b3J0aHdoaWxlIGNsZWFudXAgdG8gZmVlZAo+ID4g
QW5kcmV3IGZvciA1LjUgaW5kZXBlbmRlbnQgb2YgdGhlIGd1dCBvZiB0aGUgY2hhbmdlcy4KPiA+
IAo+ID4gUmV2aWV3ZWQtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+ID4gCj4g
Cj4gVGhhbmtzIGZvciB0aGUgcmV2aWV3cyEgU2F5LCBpdCBzb3VuZHMgbGlrZSB5b3VyIHZpZXcg
aGVyZSBpcyB0aGF0IHRoaXMKPiBzZXJpZXMgc2hvdWxkIGJlIHRhcmdldGVkIGF0IDUuNiAobm90
IDUuNSksIGlzIHRoYXQgd2hhdCB5b3UgaGF2ZSBpbiBtaW5kPwo+IEFuZCBnZXQgdGhlIHByZXBh
cmF0b3J5IHBhdGNoZXMgKDEtOSwgYW5kIG1heWJlIGV2ZW4gMTAtMTYpIGludG8gNS41PwoKWWVh
aCwgYWN0dWFsbHkgSSBmZWVsIHRoZSBzYW1lLiBUaGUgbWVyZ2Ugd2luZG93IGlzIGdvaW5nIHRv
IG9wZW4gb24gU3VuZGF5CmFuZCB0aGUgc2VyaWVzIGlzbid0IHN0aWxsIGZ1bGx5IGJha2VkIGFu
ZCBoYXBwaWx5IHNpdHRpbmcgaW4gbGludXgtbmV4dAooYW5kIGxhcmdlciBjaGFuZ2VzIHNob3Vs
ZCByZWFsbHkgc2l0IGluIGxpbnV4LW5leHQgZm9yIGF0IGxlYXN0IGEgd2VlaywKcHJlZmVyYWJs
eSB0d28sIGJlZm9yZSB0aGUgbWVyZ2Ugd2luZG93IG9wZW5zIHRvIGdldCBzb21lIHJlYXNvbmFi
bGUgdGVzdApjb3ZlcmFnZSkuICBTbyBJJ2QgdGFrZSBvdXQgdGhlIGluZGVwZW5kZW50IGVhc3kg
cGF0Y2hlcyB0aGF0IGFyZSBhbHJlYWR5CnJldmlld2VkLCBnZXQgdGhlbSBtZXJnZWQgaW50byBB
bmRyZXcncyAob3Igd2hhdGV2ZXIgb3RoZXIgYXBwcm9wcmlhdGUKdHJlZSkgbm93IHNvIHRoYXQg
dGhleSBnZXQgYXQgbGVhc3QgYSB3ZWVrIG9mIHRlc3RpbmcgaW4gbGludXgtbmV4dCBiZWZvcmUK
Z29pbmcgdXBzdHJlYW0uICBBbmQgdGhlIG1vcmUgaW52b2x2ZWQgYml0cyB3aWxsIGhhdmUgdG8g
d2FpdCBmb3IgNS42IC0Kd2hpY2ggbWVhbnMgbGV0J3MganVzdCBjb250aW51ZSB3b3JraW5nIG9u
IHRoZW0gYXMgd2UgZG8gbm93IGJlY2F1c2UKaWRlYWxseSBpbiA0IHdlZWtzIHdlIHNob3VsZCBo
YXZlIHRoZW0gcmVhZHkgd2l0aCBhbGwgdGhlIHJldmlld3Mgc28gdGhhdAp0aGV5IGNhbiBiZSBw
aWNrZWQgdXAgYW5kIGludGVncmF0ZWQgaW50byBsaW51eC1uZXh0LgoKCQkJCQkJCQlIb256YQot
LSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNVU0UgTGFicywgQ1IKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
