Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44965106F57
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 12:15:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4726B6F51F;
	Fri, 22 Nov 2019 11:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5901D6F51F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 11:15:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 21586B2F6;
 Fri, 22 Nov 2019 11:15:04 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4FA541E484C; Fri, 22 Nov 2019 12:15:02 +0100 (CET)
Date: Fri, 22 Nov 2019 12:15:02 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v7 02/24] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191122111502.GC26721@quack2.suse.cz>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-3-jhubbard@nvidia.com>
 <20191121080356.GA24784@lst.de>
 <852f6c27-8b65-547b-89e0-e8f32a4d17b9@nvidia.com>
 <20191121095411.GC18190@quack2.suse.cz>
 <9d0846af-2c4f-7cda-dfcb-1f642943afea@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9d0846af-2c4f-7cda-dfcb-1f642943afea@nvidia.com>
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

T24gVGh1IDIxLTExLTE5IDE4OjU0OjAyLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gT24gMTEvMjEv
MTkgMTo1NCBBTSwgSmFuIEthcmEgd3JvdGU6Cj4gPiBPbiBUaHUgMjEtMTEtMTkgMDA6Mjk6NTks
IEpvaG4gSHViYmFyZCB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBPdGhlcndpc2UgdGhpcyBsb29r
cyBmaW5lIGFuZCBtaWdodCBiZSBhIHdvcnRod2hpbGUgY2xlYW51cCB0byBmZWVkCj4gPiA+ID4g
QW5kcmV3IGZvciA1LjUgaW5kZXBlbmRlbnQgb2YgdGhlIGd1dCBvZiB0aGUgY2hhbmdlcy4KPiA+
ID4gPiAKPiA+ID4gPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gPiA+ID4gCj4gPiA+IAo+ID4gPiBUaGFua3MgZm9yIHRoZSByZXZpZXdzISBTYXksIGl0IHNv
dW5kcyBsaWtlIHlvdXIgdmlldyBoZXJlIGlzIHRoYXQgdGhpcwo+ID4gPiBzZXJpZXMgc2hvdWxk
IGJlIHRhcmdldGVkIGF0IDUuNiAobm90IDUuNSksIGlzIHRoYXQgd2hhdCB5b3UgaGF2ZSBpbiBt
aW5kPwo+ID4gPiBBbmQgZ2V0IHRoZSBwcmVwYXJhdG9yeSBwYXRjaGVzICgxLTksIGFuZCBtYXli
ZSBldmVuIDEwLTE2KSBpbnRvIDUuNT8KPiA+IAo+ID4gT25lIG1vcmUgbm90ZSA6KSBJZiB5b3Ug
YXJlIGdvaW5nIHRvIHB1c2ggcGluX3VzZXJfcGFnZXMoKSBpbnRlcmZhY2VzCj4gPiAod2hpY2gg
SSdtIGZpbmUgd2l0aCksIGl0IHdvdWxkIHByb2JhYmx5IG1ha2Ugc2Vuc2UgdG8gcHVzaCBhbHNv
IHRoZQo+ID4gcHV0X3VzZXJfcGFnZXMoKSAtPiB1bnBpbl91c2VyX3BhZ2VzKCkgcmVuYW1pbmcg
c28gdGhhdCB0aGF0IGluY29uc2lzdGVuY3kKPiA+IGluIG5hbWluZyBkb2VzIG5vdCBleGlzdCBp
biB0aGUgcmVsZWFzZWQgdXBzdHJlYW0ga2VybmVsLgo+ID4gCj4gPiAJCQkJCQkJCUhvbnphCj4g
Cj4gWWVzLCB0aGF0J3Mgd2hhdCB0aGlzIHBhdGNoIHNlcmllcyBkb2VzLiBCdXQgSSdtIG5vdCBz
dXJlIGlmICJwdXNoIiBoZXJlCj4gbWVhbnMsICJwdXNoIG91dDogZGVmZXIgdG8gNS42IiwgInB1
c2ggKG5vdykgaW50byA1LjUiLCBvciAiYWR2b2NhdGUgZm9yIj8KCkkgbWVhbnQgdG8gaW5jbHVk
ZSB0aGUgcGF0Y2ggaW4gdGhlICJmb3IgNS41IiBiYXRjaC4KCj4gSSB3aWxsIG5vdGUgdGhhdCBp
dCdzIG5vdCBnb2luZyB0byBiZSBlYXN5IHRvIHJlbmFtZSBpbiBvbmUgc3RlcCwgbm93Cj4gdGhh
dCB0aGlzIGlzIGJlaW5nIHNwbGl0IHVwLiBCZWNhdXNlIHZhcmlvdXMgcHV0X3VzZXJfcGFnZXMo
KS1iYXNlZCBpdGVtcwo+IGFyZSBnb2luZyBpbnRvIDUuNSB2aWEgZGlmZmVyZW50IG1haW50YWlu
ZXIgdHJlZXMgbm93LiBQcm9iYWJseSBJJ2QgbmVlZAo+IHRvIGludHJvZHVjZSB1bnBpbl91c2Vy
X3BhZ2UoKSBhbG9uZ3NpZGUgcHV0X3VzZXJfcGFnZSgpLi4udGhvdWdodHM/CgpZZXMsIEkgdW5k
ZXJzdGFuZCB0aGF0IG1vdmluZyB0aGF0IHBhdGNoIGZyb20gdGhlIGVuZCBvZiB0aGUgc2VyaWVz
IHdvdWxkCmNhdXNlIGZhaXIgYW1vdW50IG9mIGNvbmZsaWN0cy4gSSB3YXMgaG9waW5nIHRoYXQg
eW91IGNvdWxkIGdlbmVyYXRlIHRoZQpwYXRjaCB3aXRoIHNlZC9Db2NjaW5lbGxlIGFuZCB0aGVu
IHJlYmFzaW5nIHdoYXQgcmVtYWlucyBmb3IgNS42IG9uIHRvcCBvZgp0aGF0IHBhdGNoIHNob3Vs
ZCBub3QgYmUgdGhhdCBwYWluZnVsIHNvIG92ZXJhbGwgaXQgc2hvdWxkIG5vdCBiZSB0aGF0IG11
Y2gKd29yay4gQnV0IEkgbWF5IGJlIHdyb25nIHNvIGlmIGl0IHByb3ZlcyB0byBiZSB0b28gdGVk
aW91cywgbGV0J3MganVzdApwb3N0cG9uZSB0aGUgcmVuYW1pbmcgdG8gNS42LiBJIGRvbid0IGZp
bmQgaGF2aW5nIGJvdGggdW5waW5fdXNlcl9wYWdlKCkKYW5kIHB1dF91c2VyX3BhZ2UoKSBhIGJl
dHRlciBhbHRlcm5hdGl2ZSB0byBjdXJyZW50IHN0YXRlLiBUaGFua3MhCgoJCQkJCQkJCUhvbnph
Ci0tIApKYW4gS2FyYSA8amFja0BzdXNlLmNvbT4KU1VTRSBMYWJzLCBDUgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
