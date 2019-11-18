Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AF80100502
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:01:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2BD6E4B6;
	Mon, 18 Nov 2019 12:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28F806E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:01:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E731CB061;
 Mon, 18 Nov 2019 12:01:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 7EC421E4B09; Mon, 18 Nov 2019 11:16:58 +0100 (CET)
Date: Mon, 18 Nov 2019 11:16:58 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 11/24] goldish_pipe: convert to pin_user_pages() and
 put_user_page()
Message-ID: <20191118101658.GG17319@quack2.suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-12-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115055340.1825745-12-jhubbard@nvidia.com>
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
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
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

T24gVGh1IDE0LTExLTE5IDIxOjUzOjI3LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gMS4gQ2FsbCB0
aGUgbmV3IGdsb2JhbCBwaW5fdXNlcl9wYWdlc19mYXN0KCksIGZyb20gcGluX2dvbGRmaXNoX3Bh
Z2VzKCkuCj4gCj4gMi4gQXMgcmVxdWlyZWQgYnkgcGluX3VzZXJfcGFnZXMoKSwgcmVsZWFzZSB0
aGVzZSBwYWdlcyB2aWEKPiBwdXRfdXNlcl9wYWdlKCkuIEluIHRoaXMgY2FzZSwgZG8gc28gdmlh
IHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soKS4KPiAKPiBUaGF0IGhhcyB0aGUgc2lkZSBlZmZl
Y3Qgb2YgY2FsbGluZyBzZXRfcGFnZV9kaXJ0eV9sb2NrKCksIGluc3RlYWQKPiBvZiBzZXRfcGFn
ZV9kaXJ0eSgpLiBUaGlzIGlzIHByb2JhYmx5IG1vcmUgYWNjdXJhdGUuCj4gCj4gQXMgQ2hyaXN0
b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBvbmx5IHNhZmUgaWYgd2Ug
YXJlCj4gZGVhbGluZyB3aXRoIGEgZmlsZSBiYWNrZWQgcGFnZSB3aGVyZSB3ZSBoYXZlIHJlZmVy
ZW5jZSBvbiB0aGUgaW5vZGUgaXQKPiBoYW5ncyBvZmYuIiBbMV0KPiAKPiBBbm90aGVyIHNpZGUg
ZWZmZWN0IGlzIHRoYXQgdGhlIHJlbGVhc2UgY29kZSBpcyBzaW1wbGlmaWVkIGJlY2F1c2UKPiB0
aGUgcGFnZVtdIGxvb3AgaXMgbm93IGluIGd1cC5jIGluc3RlYWQgb2YgaGVyZSwgc28ganVzdCBk
ZWxldGUgdGhlCj4gbG9jYWwgcmVsZWFzZV91c2VyX3BhZ2VzKCkgZW50aXJlbHksIGFuZCBjYWxs
Cj4gcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpIGRpcmVjdGx5LCBpbnN0ZWFkLgo+IAo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMTkwNzIzMTUzNjQwLkdCNzIwQGxzdC5kZQo+
IAo+IFJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKTG9va3MgZ29vZCB0
byBtZS4gWW91IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4K
CgkJCQkJCQkJSG9uemEKCj4gLS0tCj4gIGRyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZp
c2hfcGlwZS5jIHwgMTcgKysrLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxh
dGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jIGIvZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlz
aC9nb2xkZmlzaF9waXBlLmMKPiBpbmRleCA3ZWQyYTIxYTBiYWMuLjYzNWE4YmMxYjQ4MCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYwo+ICsr
KyBiL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCj4gQEAgLTI3NCw3
ICsyNzQsNyBAQCBzdGF0aWMgaW50IHBpbl9nb2xkZmlzaF9wYWdlcyh1bnNpZ25lZCBsb25nIGZp
cnN0X3BhZ2UsCj4gIAkJKml0ZXJfbGFzdF9wYWdlX3NpemUgPSBsYXN0X3BhZ2Vfc2l6ZTsKPiAg
CX0KPiAgCj4gLQlyZXQgPSBnZXRfdXNlcl9wYWdlc19mYXN0KGZpcnN0X3BhZ2UsIHJlcXVlc3Rl
ZF9wYWdlcywKPiArCXJldCA9IHBpbl91c2VyX3BhZ2VzX2Zhc3QoZmlyc3RfcGFnZSwgcmVxdWVz
dGVkX3BhZ2VzLAo+ICAJCQkJICAhaXNfd3JpdGUgPyBGT0xMX1dSSVRFIDogMCwKPiAgCQkJCSAg
cGFnZXMpOwo+ICAJaWYgKHJldCA8PSAwKQo+IEBAIC0yODUsMTggKzI4NSw2IEBAIHN0YXRpYyBp
bnQgcGluX2dvbGRmaXNoX3BhZ2VzKHVuc2lnbmVkIGxvbmcgZmlyc3RfcGFnZSwKPiAgCXJldHVy
biByZXQ7Cj4gIH0KPiAgCj4gLXN0YXRpYyB2b2lkIHJlbGVhc2VfdXNlcl9wYWdlcyhzdHJ1Y3Qg
cGFnZSAqKnBhZ2VzLCBpbnQgcGFnZXNfY291bnQsCj4gLQkJCSAgICAgICBpbnQgaXNfd3JpdGUs
IHMzMiBjb25zdW1lZF9zaXplKQo+IC17Cj4gLQlpbnQgaTsKPiAtCj4gLQlmb3IgKGkgPSAwOyBp
IDwgcGFnZXNfY291bnQ7IGkrKykgewo+IC0JCWlmICghaXNfd3JpdGUgJiYgY29uc3VtZWRfc2l6
ZSA+IDApCj4gLQkJCXNldF9wYWdlX2RpcnR5KHBhZ2VzW2ldKTsKPiAtCQlwdXRfcGFnZShwYWdl
c1tpXSk7Cj4gLQl9Cj4gLX0KPiAtCj4gIC8qIFBvcHVsYXRlIHRoZSBjYWxsIHBhcmFtZXRlcnMs
IG1lcmdpbmcgYWRqYWNlbnQgcGFnZXMgdG9nZXRoZXIgKi8KPiAgc3RhdGljIHZvaWQgcG9wdWxh
dGVfcndfcGFyYW1zKHN0cnVjdCBwYWdlICoqcGFnZXMsCj4gIAkJCSAgICAgICBpbnQgcGFnZXNf
Y291bnQsCj4gQEAgLTM3Miw3ICszNjAsOCBAQCBzdGF0aWMgaW50IHRyYW5zZmVyX21heF9idWZm
ZXJzKHN0cnVjdCBnb2xkZmlzaF9waXBlICpwaXBlLAo+ICAKPiAgCSpjb25zdW1lZF9zaXplID0g
cGlwZS0+Y29tbWFuZF9idWZmZXItPnJ3X3BhcmFtcy5jb25zdW1lZF9zaXplOwo+ICAKPiAtCXJl
bGVhc2VfdXNlcl9wYWdlcyhwaXBlLT5wYWdlcywgcGFnZXNfY291bnQsIGlzX3dyaXRlLCAqY29u
c3VtZWRfc2l6ZSk7Cj4gKwlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBpcGUtPnBhZ2VzLCBw
YWdlc19jb3VudCwKPiArCQkJCSAgIWlzX3dyaXRlICYmICpjb25zdW1lZF9zaXplID4gMCk7Cj4g
IAo+ICAJbXV0ZXhfdW5sb2NrKCZwaXBlLT5sb2NrKTsKPiAgCXJldHVybiAwOwo+IC0tIAo+IDIu
MjQuMAo+IAotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNVU0UgTGFicywgQ1IKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
