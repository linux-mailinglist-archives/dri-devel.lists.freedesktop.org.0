Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 245F08232A
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 18:53:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8FD56E503;
	Mon,  5 Aug 2019 16:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0560E6E503;
 Mon,  5 Aug 2019 16:53:38 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Aug 2019 09:53:12 -0700
X-IronPort-AV: E=Sophos;i="5.64,350,1559545200"; d="scan'208";a="168030649"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com) ([10.7.196.65])
 by orsmga008-auth.jf.intel.com with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 05 Aug 2019 09:53:12 -0700
Date: Mon, 5 Aug 2019 09:53:46 -0700
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: john.hubbard@gmail.com
Subject: Re: [PATCH v2 06/34] drm/i915: convert put_page() to put_user_page*()
Message-ID: <20190805165346.GB25953@intel.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
 <20190804224915.28669-7-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190804224915.28669-7-jhubbard@nvidia.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 intel-gfx@lists.freedesktop.org, linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBBdWcgMDQsIDIwMTkgYXQgMDM6NDg6NDdQTSAtMDcwMCwgam9obi5odWJiYXJkQGdt
YWlsLmNvbSB3cm90ZToKPiBGcm9tOiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Cj4gCj4gRm9yIHBhZ2VzIHRoYXQgd2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCks
IHJlbGVhc2UgdGhvc2UgcGFnZXMKPiB2aWEgdGhlIG5ldyBwdXRfdXNlcl9wYWdlKigpIHJvdXRp
bmVzLCBpbnN0ZWFkIG9mIHZpYSBwdXRfcGFnZSgpIG9yCj4gcmVsZWFzZV9wYWdlcygpLgo+IAo+
IFRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBjb252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29t
bWl0IGZjMWQ4ZTdjY2EyZAo+ICgibW06IGludHJvZHVjZSBwdXRfdXNlcl9wYWdlKigpLCBwbGFj
ZWhvbGRlciB2ZXJzaW9ucyIpLgo+IAo+IFRoaXMgaXMgYSBtZXJnZS1hYmxlIHZlcnNpb24gb2Yg
dGhlIGZpeCwgYmVjYXVzZSBpdCByZXN0cmljdHMKPiBpdHNlbGYgdG8gcHV0X3VzZXJfcGFnZSgp
IGFuZCBwdXRfdXNlcl9wYWdlcygpLCBib3RoIG9mIHdoaWNoCj4gaGF2ZSBub3QgY2hhbmdlZCB0
aGVpciBBUElzLiBMYXRlciwgaTkxNV9nZW1fdXNlcnB0cl9wdXRfcGFnZXMoKQo+IGNhbiBiZSBz
aW1wbGlmaWVkIHRvIHVzZSBwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkuCgpUaGFua3MgZm9y
IHRoYXQuCndpdGggdGhpcyB2ZXJzaW9uIHdlIHdvbid0IGhhdmUgYW55IGNvbmZsaWN0LgoKQWNr
IGZvciBnb2luZyB0aHJvdWdoIG1tIHRyZWUuCgo+IAo+IENjOiBKYW5pIE5pa3VsYSA8amFuaS5u
aWt1bGFAbGludXguaW50ZWwuY29tPgo+IENjOiBKb29uYXMgTGFodGluZW4gPGpvb25hcy5sYWh0
aW5lbkBsaW51eC5pbnRlbC5jb20+Cj4gQ2M6IFJvZHJpZ28gVml2aSA8cm9kcmlnby52aXZpQGlu
dGVsLmNvbT4KPiBDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBpbnRl
bC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMg
fCA2ICsrKy0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9u
cygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1f
dXNlcnB0ci5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYwo+
IGluZGV4IDJjYWE1OTQzMjJiYy4uNzZkZGEyOTIzY2YxIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCj4gQEAgLTUyNyw3ICs1MjcsNyBAQCBfX2k5
MTVfZ2VtX3VzZXJwdHJfZ2V0X3BhZ2VzX3dvcmtlcihzdHJ1Y3Qgd29ya19zdHJ1Y3QgKl93b3Jr
KQo+ICAJfQo+ICAJbXV0ZXhfdW5sb2NrKCZvYmotPm1tLmxvY2spOwo+ICAKPiAtCXJlbGVhc2Vf
cGFnZXMocHZlYywgcGlubmVkKTsKPiArCXB1dF91c2VyX3BhZ2VzKHB2ZWMsIHBpbm5lZCk7Cj4g
IAlrdmZyZWUocHZlYyk7Cj4gIAo+ICAJaTkxNV9nZW1fb2JqZWN0X3B1dChvYmopOwo+IEBAIC02
NDAsNyArNjQwLDcgQEAgc3RhdGljIGludCBpOTE1X2dlbV91c2VycHRyX2dldF9wYWdlcyhzdHJ1
Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQo+ICAJCV9faTkxNV9nZW1fdXNlcnB0cl9zZXRf
YWN0aXZlKG9iaiwgdHJ1ZSk7Cj4gIAo+ICAJaWYgKElTX0VSUihwYWdlcykpCj4gLQkJcmVsZWFz
ZV9wYWdlcyhwdmVjLCBwaW5uZWQpOwo+ICsJCXB1dF91c2VyX3BhZ2VzKHB2ZWMsIHBpbm5lZCk7
Cj4gIAlrdmZyZWUocHZlYyk7Cj4gIAo+ICAJcmV0dXJuIFBUUl9FUlJfT1JfWkVSTyhwYWdlcyk7
Cj4gQEAgLTY3NSw3ICs2NzUsNyBAQCBpOTE1X2dlbV91c2VycHRyX3B1dF9wYWdlcyhzdHJ1Y3Qg
ZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqLAo+ICAJCQlzZXRfcGFnZV9kaXJ0eV9sb2NrKHBhZ2Up
Owo+ICAKPiAgCQltYXJrX3BhZ2VfYWNjZXNzZWQocGFnZSk7Cj4gLQkJcHV0X3BhZ2UocGFnZSk7
Cj4gKwkJcHV0X3VzZXJfcGFnZShwYWdlKTsKPiAgCX0KPiAgCW9iai0+bW0uZGlydHkgPSBmYWxz
ZTsKPiAgCj4gLS0gCj4gMi4yMi4wCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
