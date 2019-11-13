Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4F0FB89F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 20:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7EE76EE19;
	Wed, 13 Nov 2019 19:17:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9ABD6EE19
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 19:17:08 +0000 (UTC)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Nov 2019 11:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,301,1569308400"; d="scan'208";a="379324206"
Received: from iweiny-desk2.sc.intel.com ([10.3.52.157])
 by orsmga005.jf.intel.com with ESMTP; 13 Nov 2019 11:17:06 -0800
Date: Wed, 13 Nov 2019 11:17:06 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v4 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
Message-ID: <20191113191705.GE12947@iweiny-DESK2.sc.intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-9-jhubbard@nvidia.com>
 <20191113130202.GA26068@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191113130202.GA26068@ziepe.ca>
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
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
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

T24gV2VkLCBOb3YgMTMsIDIwMTkgYXQgMDk6MDI6MDJBTSAtMDQwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFR1ZSwgTm92IDEyLCAyMDE5IGF0IDA4OjI2OjU1UE0gLTA4MDAsIEpvaG4g
SHViYmFyZCB3cm90ZToKPiA+IEFzIGl0IHNheXMgaW4gdGhlIHVwZGF0ZWQgY29tbWVudCBpbiBn
dXAuYzogY3VycmVudCBGT0xMX0xPTkdURVJNCj4gPiBiZWhhdmlvciBpcyBpbmNvbXBhdGlibGUg
d2l0aCBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIGJlY2F1c2Ugb2YgdGhlCj4gPiBGUyBEQVggY2hl
Y2sgcmVxdWlyZW1lbnQgb24gdm1hcy4KPiA+IAo+ID4gSG93ZXZlciwgdGhlIGNvcnJlc3BvbmRp
bmcgcmVzdHJpY3Rpb24gaW4gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKCkgd2FzCj4gPiBzbGlnaHRs
eSBzdHJpY3RlciB0aGFuIGlzIGFjdHVhbGx5IHJlcXVpcmVkOiBpdCBmb3JiYWRlIGFsbAo+ID4g
Rk9MTF9MT05HVEVSTSBjYWxsZXJzLCBidXQgd2UgY2FuIGFjdHVhbGx5IGFsbG93IEZPTExfTE9O
R1RFUk0gY2FsbGVycwo+ID4gdGhhdCBkbyBub3Qgc2V0IHRoZSAibG9ja2VkIiBhcmcuCj4gPiAK
PiA+IFVwZGF0ZSB0aGUgY29kZSBhbmQgY29tbWVudHMgYWNjb3JkaW5nbHksIGFuZCB1cGRhdGUg
dGhlIFZGSU8gY2FsbGVyCj4gPiB0byB0YWtlIGFkdmFudGFnZSBvZiB0aGlzLCBmaXhpbmcgYSBi
dWcgYXMgYSByZXN1bHQ6IHRoZSBWRklPIGNhbGxlcgo+ID4gaXMgbG9naWNhbGx5IGEgRk9MTF9M
T05HVEVSTSB1c2VyLgo+ID4gCj4gPiBBbHNvLCByZW1vdmUgYW4gdW5uZXNzYXJ5IHBhaXIgb2Yg
Y2FsbHMgdGhhdCB3ZXJlIHJlbGVhc2luZyBhbmQKPiA+IHJlYWNxdWlyaW5nIHRoZSBtbWFwX3Nl
bS4gVGhlcmUgaXMgbm8gbmVlZCB0byBhdm9pZCBob2xkaW5nIG1tYXBfc2VtCj4gPiBqdXN0IGlu
IG9yZGVyIHRvIGNhbGwgcGFnZV90b19wZm4oKS4KPiA+IAo+ID4gQWxzbywgbW92ZSB0aGUgREFY
IGNoZWNrICgiaWYgYSBWTUEgaXMgREFYLCBkb24ndCBhbGxvdyBsb25nIHRlcm0KPiA+IHBpbm5p
bmciKSBmcm9tIHRoZSBWRklPIGNhbGwgc2l0ZSwgYWxsIHRoZSB3YXkgaW50byB0aGUgaW50ZXJu
YWxzCj4gPiBvZiBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSBhbmQgX19ndXBfbG9uZ3Rlcm1fbG9j
a2VkKCkuIFRoYXQgaXM6Cj4gPiBnZXRfdXNlcl9wYWdlc19yZW1vdGUoKSBjYWxscyBfX2d1cF9s
b25ndGVybV9sb2NrZWQoKSwgd2hpY2ggaW4gdHVybgo+ID4gY2FsbHMgY2hlY2tfZGF4X3ZtYXMo
KS4gSXQncyBsaWdodGx5IGV4cGxhaW5lZCBpbiB0aGUgY29tbWVudHMgYXMgd2VsbC4KPiA+IAo+
ID4gVGhhbmtzIHRvIEphc29uIEd1bnRob3JwZSBmb3IgcG9pbnRpbmcgb3V0IGEgY2xlYW4gd2F5
IHRvIGZpeCB0aGlzLAo+ID4gYW5kIHRvIERhbiBXaWxsaWFtcyBmb3IgaGVscGluZyBjbGFyaWZ5
IHRoZSBEQVggcmVmYWN0b3JpbmcuCj4gPiAKPiA+IFN1Z2dlc3RlZC1ieTogSmFzb24gR3VudGhv
cnBlIDxqZ2dAemllcGUuY2E+Cj4gPiBDYzogRGFuIFdpbGxpYW1zIDxkYW4uai53aWxsaWFtc0Bp
bnRlbC5jb20+Cj4gPiBDYzogSmVyb21lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+ID4g
Q2M6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEpv
aG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiA+ICBkcml2ZXJzL3ZmaW8vdmZpb19p
b21tdV90eXBlMS5jIHwgMjUgKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gIG1tL2d1cC5j
ICAgICAgICAgICAgICAgICAgICAgICAgfCAyNyArKysrKysrKysrKysrKysrKysrKysrLS0tLS0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDI4IGRlbGV0aW9ucygtKQo+
ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEuYyBiL2Ry
aXZlcnMvdmZpby92ZmlvX2lvbW11X3R5cGUxLmMKPiA+IGluZGV4IGQ4NjQyNzdlYTE2Zi4uNzMw
MWI3MTBjOWE0IDEwMDY0NAo+ID4gKysrIGIvZHJpdmVycy92ZmlvL3ZmaW9faW9tbXVfdHlwZTEu
Ywo+ID4gQEAgLTM0MCw3ICszNDAsNiBAQCBzdGF0aWMgaW50IHZhZGRyX2dldF9wZm4oc3RydWN0
IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFkZHIsCj4gPiAgewo+ID4gIAlzdHJ1Y3Qg
cGFnZSAqcGFnZVsxXTsKPiA+ICAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWE7Cj4gPiAtCXN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hc1sxXTsKPiA+ICAJdW5zaWduZWQgaW50IGZsYWdzID0g
MDsKPiA+ICAJaW50IHJldDsKPiA+ICAKPiA+IEBAIC0zNDgsMzMgKzM0NywxMyBAQCBzdGF0aWMg
aW50IHZhZGRyX2dldF9wZm4oc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgdmFk
ZHIsCj4gPiAgCQlmbGFncyB8PSBGT0xMX1dSSVRFOwo+ID4gIAo+ID4gIAlkb3duX3JlYWQoJm1t
LT5tbWFwX3NlbSk7Cj4gPiAtCWlmIChtbSA9PSBjdXJyZW50LT5tbSkgewo+ID4gLQkJcmV0ID0g
Z2V0X3VzZXJfcGFnZXModmFkZHIsIDEsIGZsYWdzIHwgRk9MTF9MT05HVEVSTSwgcGFnZSwKPiA+
IC0JCQkJICAgICB2bWFzKTsKPiA+IC0JfSBlbHNlIHsKPiA+IC0JCXJldCA9IGdldF91c2VyX3Bh
Z2VzX3JlbW90ZShOVUxMLCBtbSwgdmFkZHIsIDEsIGZsYWdzLCBwYWdlLAo+ID4gLQkJCQkJICAg
IHZtYXMsIE5VTEwpOwo+ID4gLQkJLyoKPiA+IC0JCSAqIFRoZSBsaWZldGltZSBvZiBhIHZhZGRy
X2dldF9wZm4oKSBwYWdlIHBpbiBpcwo+ID4gLQkJICogdXNlcnNwYWNlLWNvbnRyb2xsZWQuIElu
IHRoZSBmcy1kYXggY2FzZSB0aGlzIGNvdWxkCj4gPiAtCQkgKiBsZWFkIHRvIGluZGVmaW5pdGUg
c3RhbGxzIGluIGZpbGVzeXN0ZW0gb3BlcmF0aW9ucy4KPiA+IC0JCSAqIERpc2FsbG93IGF0dGVt
cHRzIHRvIHBpbiBmcy1kYXggcGFnZXMgdmlhIHRoaXMKPiA+IC0JCSAqIGludGVyZmFjZS4KPiA+
IC0JCSAqLwo+ID4gLQkJaWYgKHJldCA+IDAgJiYgdm1hX2lzX2ZzZGF4KHZtYXNbMF0pKSB7Cj4g
PiAtCQkJcmV0ID0gLUVPUE5PVFNVUFA7Cj4gPiAtCQkJcHV0X3BhZ2UocGFnZVswXSk7Cj4gPiAt
CQl9Cj4gPiAtCX0KPiA+IC0JdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKPiA+IC0KPiA+ICsJcmV0
ID0gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKE5VTEwsIG1tLCB2YWRkciwgMSwgZmxhZ3MgfCBGT0xM
X0xPTkdURVJNLAo+ID4gKwkJCQkgICAgcGFnZSwgTlVMTCwgTlVMTCk7Cj4gPiAgCWlmIChyZXQg
PT0gMSkgewo+ID4gIAkJKnBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2VbMF0pOwo+ID4gIAkJcmV0dXJu
IDA7Cj4gCj4gTWluZCB0aGUgcmV0dXJuIHdpdGggdGhlIGxvY2sgaGVsZCB0aGlzIG5lZWRzIHNv
bWUgZ290byB1bndpbmQKCkFoIHllYS4uLiAgcmV0cmFjdCBteSByZXZpZXdlZCBieS4uLiAgOi0o
CgpJcmEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
