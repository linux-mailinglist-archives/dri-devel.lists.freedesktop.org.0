Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1916D71EAC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:06:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C1D6E328;
	Tue, 23 Jul 2019 18:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE166E328
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 18:06:14 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 11:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,299,1559545200"; d="scan'208";a="177367161"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Jul 2019 11:06:13 -0700
Date: Tue, 23 Jul 2019 11:06:13 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 3/3] net/xdp: convert put_page() to put_user_page*()
Message-ID: <20190723180612.GB29729@iweiny-DESK2.sc.intel.com>
References: <20190722223415.13269-1-jhubbard@nvidia.com>
 <20190722223415.13269-4-jhubbard@nvidia.com>
 <20190723002534.GA10284@iweiny-DESK2.sc.intel.com>
 <a4e9b293-11f8-6b3c-cf4d-308e3b32df34@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a4e9b293-11f8-6b3c-cf4d-308e3b32df34@nvidia.com>
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
Cc: Boaz Harrosh <boaz@plexistor.com>, Jan Kara <jack@suse.cz>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Christoph Hellwig <hch@lst.de>, Sage Weil <sage@redhat.com>,
 Miklos Szeredi <miklos@szeredi.hu>, linux-rdma@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Johannes Thumshirn <jthumshirn@suse.de>, Ilya Dryomov <idryomov@gmail.com>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>, john.hubbard@gmail.com,
 Ming Lei <ming.lei@redhat.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
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

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDk6NDE6MzRQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDcvMjIvMTkgNToyNSBQTSwgSXJhIFdlaW55IHdyb3RlOgo+ID4gT24gTW9uLCBK
dWwgMjIsIDIwMTkgYXQgMDM6MzQ6MTVQTSAtMDcwMCwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3
cm90ZToKPiA+ID4gRnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+ID4g
PiAKPiA+ID4gRm9yIHBhZ2VzIHRoYXQgd2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMq
KCksIHJlbGVhc2UgdGhvc2UgcGFnZXMKPiA+ID4gdmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSoo
KSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0X3BhZ2UoKSBvcgo+ID4gPiByZWxlYXNlX3Bh
Z2VzKCkuCj4gPiA+IAo+ID4gPiBUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29udmVyc2lvbiwg
YXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKPiA+ID4gKCJtbTogaW50cm9kdWNl
IHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCj4gPiA+IAo+ID4gPiBD
YzogQmrDtnJuIFTDtnBlbCA8Ympvcm4udG9wZWxAaW50ZWwuY29tPgo+ID4gPiBDYzogTWFnbnVz
IEthcmxzc29uIDxtYWdudXMua2FybHNzb25AaW50ZWwuY29tPgo+ID4gPiBDYzogRGF2aWQgUy4g
TWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0Pgo+ID4gPiBDYzogbmV0ZGV2QHZnZXIua2VybmVs
Lm9yZwo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5j
b20+Cj4gPiA+IC0tLQo+ID4gPiAgIG5ldC94ZHAveGRwX3VtZW0uYyB8IDkgKy0tLS0tLS0tCj4g
PiA+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4IGRlbGV0aW9ucygtKQo+ID4g
PiAKPiA+ID4gZGlmZiAtLWdpdCBhL25ldC94ZHAveGRwX3VtZW0uYyBiL25ldC94ZHAveGRwX3Vt
ZW0uYwo+ID4gPiBpbmRleCA4M2RlNzRjYTcyOWEuLjAzMjVhMTc5MTVkZSAxMDA2NDQKPiA+ID4g
LS0tIGEvbmV0L3hkcC94ZHBfdW1lbS5jCj4gPiA+ICsrKyBiL25ldC94ZHAveGRwX3VtZW0uYwo+
ID4gPiBAQCAtMTY2LDE0ICsxNjYsNyBAQCB2b2lkIHhkcF91bWVtX2NsZWFyX2RldihzdHJ1Y3Qg
eGRwX3VtZW0gKnVtZW0pCj4gPiA+ICAgc3RhdGljIHZvaWQgeGRwX3VtZW1fdW5waW5fcGFnZXMo
c3RydWN0IHhkcF91bWVtICp1bWVtKQo+ID4gPiAgIHsKPiA+ID4gLQl1bnNpZ25lZCBpbnQgaTsK
PiA+ID4gLQo+ID4gPiAtCWZvciAoaSA9IDA7IGkgPCB1bWVtLT5ucGdzOyBpKyspIHsKPiA+ID4g
LQkJc3RydWN0IHBhZ2UgKnBhZ2UgPSB1bWVtLT5wZ3NbaV07Cj4gPiA+IC0KPiA+ID4gLQkJc2V0
X3BhZ2VfZGlydHlfbG9jayhwYWdlKTsKPiA+ID4gLQkJcHV0X3BhZ2UocGFnZSk7Cj4gPiA+IC0J
fQo+ID4gPiArCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2sodW1lbS0+cGdzLCB1bWVtLT5ucGdz
KTsKPiA+IAo+ID4gV2hhdCBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoaXMgYW5kCj4gPiAK
PiA+IF9fcHV0X3VzZXJfcGFnZXModW1lbS0+cGdzLCB1bWVtLT5ucGdzLCBQVVBfRkxBR1NfRElS
VFlfTE9DSyk7Cj4gPiAKPiA+ID8KPiAKPiBObyBkaWZmZXJlbmNlLgo+IAo+ID4gCj4gPiBJJ20g
YSBiaXQgY29uY2VybmVkIHdpdGggYWRkaW5nIGFub3RoZXIgZm9ybSBvZiB0aGUgc2FtZSBpbnRl
cmZhY2UuICBXZSBzaG91bGQKPiA+IGVpdGhlciBoYXZlIDEgY2FsbCB3aXRoIGZsYWdzIChlbnVt
IGluIHRoaXMgY2FzZSkgb3IgbXVsdGlwbGUgY2FsbHMuICBHaXZlbiB0aGUKPiA+IHByZXZpb3Vz
IGRpc2N1c3Npb24gbGV0cyBtb3ZlIGluIHRoZSBkaXJlY3Rpb24gb2YgaGF2aW5nIHRoZSBlbnVt
IGJ1dCBkb24ndAo+ID4gaW50cm9kdWNlIGFub3RoZXIgY2FsbGVyIG9mIHRoZSAib2xkIiBpbnRl
cmZhY2UuCj4gCj4gSSBkaXNhZ3JlZSB0aGF0IHRoaXMgaXMgYSAicHJvYmxlbSIuIFRoZXJlIGlz
IG5vIG1haW50ZW5hbmNlIHBpdGZhbGwgaGVyZTsgdGhlcmUKPiBhcmUgbWVyZWx5IHR3byB3YXlz
IHRvIGNhbGwgdGhlIHB1dF91c2VyX3BhZ2UqKCkgQVBJLiBCb3RoIGFyZSBjb3JyZWN0LCBhbmQK
PiBuZWl0aGVyIG9uZSB3aWxsIGdldCB5b3UgaW50byB0cm91YmxlLgo+IAo+IE5vdCBvbmx5IHRo
YXQsIGJ1dCB0aGVyZSBpcyBhbXBsZSBwcmVjZWRlbnQgZm9yIHRoaXMgYXBwcm9hY2ggaW4gb3Ro
ZXIKPiBrZXJuZWwgQVBJcy4KPiAKPiA+IAo+ID4gU28gSSB0aGluayBvbiB0aGlzIHBhdGNoIE5B
SyBmcm9tIG1lLgo+ID4gCj4gPiBJIGFsc28gZG9uJ3QgbGlrZSBoYXZpbmcgYSBfXyogY2FsbCBp
biB0aGUgZXhwb3J0ZWQgaW50ZXJmYWNlIGJ1dCB0aGVyZSBpcyBhCj4gPiBfX2dldF91c2VyX3Bh
Z2VzX2Zhc3QoKSBjYWxsIHNvIEkgZ3Vlc3MgdGhlcmUgaXMgcHJlY2VkZW50LiAgOi0vCj4gPiAK
PiAKPiBJIHRob3VnaHQgYWJvdXQgdGhpcyBjYXJlZnVsbHksIGFuZCBsb29rZWQgYXQgb3RoZXIg
QVBJcy4gQW5kIEkgbm90aWNlZCB0aGF0Cj4gdGhpbmdzIGxpa2UgX19nZXRfdXNlcl9wYWdlcyoo
KSBhcmUgaG93IGl0J3Mgb2Z0ZW4gZG9uZToKPiAKPiAqIFRoZSBsZWFkaW5nIHVuZGVyc2NvcmVz
IGFyZSBvZnRlbiB1c2VkIGZvciB0aGUgbW9yZSBlbGFib3JhdGUgZm9ybSBvZiB0aGUKPiBjYWxs
IChhcyBvcHBwb3NlZCB0byBkZWNvcmF0aW5nIHRoZSBjb3JlIGZ1bmN0aW9uIG5hbWUgd2l0aCAi
X2ZsYWdzIiwgZm9yCj4gZXhhbXBsZSkuCj4gCj4gKiBUaGVyZSBhcmUgb2Z0ZW4gY2FsbHMgaW4g
d2hpY2ggeW91IGNhbiBlaXRoZXIgY2FsbCB0aGUgc2ltcGxlciBmb3JtLCBvciB0aGUKPiBmb3Jt
IHdpdGggZmxhZ3MgYW5kIGFkZGl0aW9uYWwgb3B0aW9ucywgYW5kIHllcywgeW91J2xsIGdldCB0
aGUgc2FtZSByZXN1bHQuCj4gCj4gT2J2aW91c2x5LCB0aGlzIHN0dWZmIGlzIGFsbCBzdWJqZWN0
IHRvIGEgY2VydGFpbiBhbW91bnQgb2Ygb3BpbmlvbiwgYnV0IEkKPiB0aGluayBJJ20gb24gcmVh
bGx5IHNvbGlkIGdyb3VuZCBhcyBmYXIgYXMgcHJlY2VkZW50IGdvZXMuIFNvIEknbSBwdXNoaW5n
Cj4gYmFjayBvbiB0aGUgTkFLLi4uIDopCgpGYWlyIGVub3VnaC4uLiAgSG93ZXZlciwgd2UgaGF2
ZSBkaXNjdXNzZWQgaW4gdGhlIHBhc3QgaG93IEdVUCBjYW4gYmUgYQpjb25mdXNpbmcgaW50ZXJm
YWNlIHRvIHVzZS4KClNvIEknZCBsaWtlIHRvIHNlZSBpdCBiZSBtb3JlIGRpcmVjdGVkLiAgT25s
eSB1c2luZyB0aGUgX19wdXRfdXNlcl9wYWdlcygpCnZlcnNpb24gYWxsb3dzIHVzIHRvIElEIGNh
bGxlcnMgZWFzaWVyIHRocm91Z2ggYSBncmVwIG9mIFBVUF9GTEFHU19ESVJUWV9MT0NLCmluIGFk
ZGl0aW9uIHRvIGRpcmVjdGluZyB1c2VycyB0byB1c2UgdGhhdCBpbnRlcmZhY2UgcmF0aGVyIHRo
YW4gaGF2aW5nIHRvIHJlYWQKdGhlIEdVUCBjb2RlIHRvIGZpZ3VyZSBvdXQgdGhhdCB0aGUgMiBj
YWxscyBhYm92ZSBhcmUgZXF1YWwuICBJdCBpcyBub3QgYSBodWdlCmRlYWwgYnV0Li4uCgpJcmEK
Cj4gCj4gdGhhbmtzLAo+IC0tIAo+IEpvaG4gSHViYmFyZAo+IE5WSURJQQo+IApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
