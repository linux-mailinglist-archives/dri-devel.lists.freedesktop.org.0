Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3091270E1C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 02:25:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269F289F49;
	Tue, 23 Jul 2019 00:25:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D1189E2C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 00:25:37 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2019 17:25:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,297,1559545200"; d="scan'208";a="180568074"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga002.jf.intel.com with ESMTP; 22 Jul 2019 17:25:34 -0700
Date: Mon, 22 Jul 2019 17:25:34 -0700
From: Ira Weiny <ira.weiny@intel.com>
To: john.hubbard@gmail.com
Subject: Re: [PATCH 3/3] net/xdp: convert put_page() to put_user_page*()
Message-ID: <20190723002534.GA10284@iweiny-DESK2.sc.intel.com>
References: <20190722223415.13269-1-jhubbard@nvidia.com>
 <20190722223415.13269-4-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190722223415.13269-4-jhubbard@nvidia.com>
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
 John Hubbard <jhubbard@nvidia.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
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

T24gTW9uLCBKdWwgMjIsIDIwMTkgYXQgMDM6MzQ6MTVQTSAtMDcwMCwgam9obi5odWJiYXJkQGdt
YWlsLmNvbSB3cm90ZToKPiBGcm9tOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Cj4gCj4gRm9yIHBhZ2VzIHRoYXQgd2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCks
IHJlbGVhc2UgdGhvc2UgcGFnZXMKPiB2aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRp
bmVzLCBpbnN0ZWFkIG9mIHZpYSBwdXRfcGFnZSgpIG9yCj4gcmVsZWFzZV9wYWdlcygpLgo+IAo+
IFRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29t
bWl0IGZjMWQ4ZTdjY2EyZAo+ICgibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdlKigpLCBwbGFj
ZWhvbGRlciB2ZXJzaW9ucyIpLgo+IAo+IENjOiBCasO2cm4gVMO2cGVsIDxiam9ybi50b3BlbEBp
bnRlbC5jb20+Cj4gQ2M6IE1hZ251cyBLYXJsc3NvbiA8bWFnbnVzLmthcmxzc29uQGludGVsLmNv
bT4KPiBDYzogRGF2aWQgUy4gTWlsbGVyIDxkYXZlbUBkYXZlbWxvZnQubmV0Pgo+IENjOiBuZXRk
ZXZAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFy
ZEBudmlkaWEuY29tPgo+IC0tLQo+ICBuZXQveGRwL3hkcF91bWVtLmMgfCA5ICstLS0tLS0tLQo+
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL25ldC94ZHAveGRwX3VtZW0uYyBiL25ldC94ZHAveGRwX3VtZW0uYwo+IGluZGV4
IDgzZGU3NGNhNzI5YS4uMDMyNWExNzkxNWRlIDEwMDY0NAo+IC0tLSBhL25ldC94ZHAveGRwX3Vt
ZW0uYwo+ICsrKyBiL25ldC94ZHAveGRwX3VtZW0uYwo+IEBAIC0xNjYsMTQgKzE2Niw3IEBAIHZv
aWQgeGRwX3VtZW1fY2xlYXJfZGV2KHN0cnVjdCB4ZHBfdW1lbSAqdW1lbSkKPiAgCj4gIHN0YXRp
YyB2b2lkIHhkcF91bWVtX3VucGluX3BhZ2VzKHN0cnVjdCB4ZHBfdW1lbSAqdW1lbSkKPiAgewo+
IC0JdW5zaWduZWQgaW50IGk7Cj4gLQo+IC0JZm9yIChpID0gMDsgaSA8IHVtZW0tPm5wZ3M7IGkr
Kykgewo+IC0JCXN0cnVjdCBwYWdlICpwYWdlID0gdW1lbS0+cGdzW2ldOwo+IC0KPiAtCQlzZXRf
cGFnZV9kaXJ0eV9sb2NrKHBhZ2UpOwo+IC0JCXB1dF9wYWdlKHBhZ2UpOwo+IC0JfQo+ICsJcHV0
X3VzZXJfcGFnZXNfZGlydHlfbG9jayh1bWVtLT5wZ3MsIHVtZW0tPm5wZ3MpOwoKV2hhdCBpcyB0
aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoaXMgYW5kCgpfX3B1dF91c2VyX3BhZ2VzKHVtZW0tPnBn
cywgdW1lbS0+bnBncywgUFVQX0ZMQUdTX0RJUlRZX0xPQ0spOwoKPwoKSSdtIGEgYml0IGNvbmNl
cm5lZCB3aXRoIGFkZGluZyBhbm90aGVyIGZvcm0gb2YgdGhlIHNhbWUgaW50ZXJmYWNlLiAgV2Ug
c2hvdWxkCmVpdGhlciBoYXZlIDEgY2FsbCB3aXRoIGZsYWdzIChlbnVtIGluIHRoaXMgY2FzZSkg
b3IgbXVsdGlwbGUgY2FsbHMuICBHaXZlbiB0aGUKcHJldmlvdXMgZGlzY3Vzc2lvbiBsZXRzIG1v
dmUgaW4gdGhlIGRpcmVjdGlvbiBvZiBoYXZpbmcgdGhlIGVudW0gYnV0IGRvbid0CmludHJvZHVj
ZSBhbm90aGVyIGNhbGxlciBvZiB0aGUgIm9sZCIgaW50ZXJmYWNlLgoKU28gSSB0aGluayBvbiB0
aGlzIHBhdGNoIE5BSyBmcm9tIG1lLgoKSSBhbHNvIGRvbid0IGxpa2UgaGF2aW5nIGEgX18qIGNh
bGwgaW4gdGhlIGV4cG9ydGVkIGludGVyZmFjZSBidXQgdGhlcmUgaXMgYQpfX2dldF91c2VyX3Bh
Z2VzX2Zhc3QoKSBjYWxsIHNvIEkgZ3Vlc3MgdGhlcmUgaXMgcHJlY2VkZW50LiAgOi0vCgpJcmEK
Cj4gIAo+ICAJa2ZyZWUodW1lbS0+cGdzKTsKPiAgCXVtZW0tPnBncyA9IE5VTEw7Cj4gLS0gCj4g
Mi4yMi4wCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
