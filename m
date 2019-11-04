Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0A2EE51D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 17:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA83A89203;
	Mon,  4 Nov 2019 16:51:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA69C89203
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:51:35 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-zE3MYcgnMCiZjQzFEos_IQ-1; Mon, 04 Nov 2019 11:51:30 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AF6E8017DD;
 Mon,  4 Nov 2019 16:51:26 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E86D5C1B2;
 Mon,  4 Nov 2019 16:51:20 +0000 (UTC)
Date: Mon, 4 Nov 2019 11:51:18 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 02/18] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191104165118.GB5134@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-3-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-3-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: zE3MYcgnMCiZjQzFEos_IQ-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572886294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TXrEUfVJUcd1erXFQw9FjfdFZzoYFLyJ24kgJsiz4yg=;
 b=FA5pznYbTukMnXNxUYEsr2a+sllUt2kUWtAghROFSu5I3R1caZebkFMC7bhvO3LvtAkDE/
 Q+vG1DDObqg4RQRmF1Ui4k8QwslEzxZl3u5pAyodA4YKKyO29NUXIZJsgk++a/ZANOwxAf
 057fbnJH43/COtEdZ8dXVklRKI09/xQ=
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMDMsIDIwMTkgYXQgMDE6MTc6NTdQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IFRoZXJlIGFyZSBmb3VyIGxvY2F0aW9ucyBpbiBndXAuYyB0aGF0IGhhdmUgYSBmYWly
IGFtb3VudCBvZiBjb2RlCj4gZHVwbGljYXRpb24uIFRoaXMgbWVhbnMgdGhhdCBjaGFuZ2luZyBv
bmUgcmVxdWlyZXMgbWFraW5nIHRoZSBzYW1lCj4gY2hhbmdlcyBpbiBmb3VyIHBsYWNlcywgbm90
IHRvIG1lbnRpb24gcmVhZGluZyB0aGUgc2FtZSBjb2RlIGZvdXIKPiB0aW1lcywgYW5kIHdvbmRl
cmluZyBpZiB0aGVyZSBhcmUgc3VidGxlIGRpZmZlcmVuY2VzLgo+IAo+IEZhY3RvciBvdXQgdGhl
IGNvbW1vbiBjb2RlIGludG8gc3RhdGljIGZ1bmN0aW9ucywgdGh1cyByZWR1Y2luZyB0aGUKPiBv
dmVyYWxsIGxpbmUgY291bnQgYW5kIHRoZSBjb2RlJ3MgY29tcGxleGl0eS4KPiAKPiBBbHNvLCB0
YWtlIHRoZSBvcHBvcnR1bml0eSB0byBzbGlnaHRseSBpbXByb3ZlIHRoZSBlZmZpY2llbmN5IG9m
IHRoZQo+IGVycm9yIGNhc2VzLCBieSBkb2luZyBhIG1hc3Mgc3VidHJhY3Rpb24gb2YgdGhlIHJl
ZmNvdW50LCBzdXJyb3VuZGVkCj4gYnkgZ2V0X3BhZ2UoKS9wdXRfcGFnZSgpLgo+IAo+IEFsc28s
IGZ1cnRoZXIgc2ltcGxpZnkgKHNsaWdodGx5KSwgYnkgd2FpdGluZyB1bnRpbCB0aGUgdGhlIHN1
Y2Nlc3NmdWwKPiBlbmQgb2YgZWFjaCByb3V0aW5lLCB0byBpbmNyZW1lbnQgKm5yLgo+IAo+IENj
OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gQ2M6IENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPgo+IENjOiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3VtYXJAbGludXgu
aWJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5j
b20+CgpHb29kIGNsZWFudXAuCgpSZXZpZXdlZC1ieTogSsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3Nl
QHJlZGhhdC5jb20+Cgo+IC0tLQo+ICBtbS9ndXAuYyB8IDEwNCArKysrKysrKysrKysrKysrKysr
KysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA0
NSBpbnNlcnRpb25zKCspLCA1OSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvbW0vZ3Vw
LmMgYi9tbS9ndXAuYwo+IGluZGV4IDg1Y2FmNzZiMzAxMi4uMTk5ZGE5OWU4ZmZjIDEwMDY0NAo+
IC0tLSBhL21tL2d1cC5jCj4gKysrIGIvbW0vZ3VwLmMKPiBAQCAtMTk2OSw2ICsxOTY5LDM0IEBA
IHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2VfcHVkKHB1ZF90IHB1ZCwgcHVkX3QgKnB1ZHAs
IHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgfQo+ICAjZW5kaWYKPiAgCj4gK3N0YXRpYyBpbnQgX19y
ZWNvcmRfc3VicGFnZXMoc3RydWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAr
CQkJICAgICB1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IG5yKQo+
ICt7Cj4gKwlpbnQgbnJfcmVjb3JkZWRfcGFnZXMgPSAwOwo+ICsKPiArCWRvIHsKPiArCQlwYWdl
c1tucl0gPSBwYWdlOwo+ICsJCW5yKys7Cj4gKwkJcGFnZSsrOwo+ICsJCW5yX3JlY29yZGVkX3Bh
Z2VzKys7Cj4gKwl9IHdoaWxlIChhZGRyICs9IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOwo+ICsJ
cmV0dXJuIG5yX3JlY29yZGVkX3BhZ2VzOwo+ICt9Cj4gKwo+ICtzdGF0aWMgdm9pZCBwdXRfY29t
cG91bmRfaGVhZChzdHJ1Y3QgcGFnZSAqcGFnZSwgaW50IHJlZnMpCj4gK3sKPiArCS8qIERvIGEg
Z2V0X3BhZ2UoKSBmaXJzdCwgaW4gY2FzZSByZWZzID09IHBhZ2UtPl9yZWZjb3VudCAqLwo+ICsJ
Z2V0X3BhZ2UocGFnZSk7Cj4gKwlwYWdlX3JlZl9zdWIocGFnZSwgcmVmcyk7Cj4gKwlwdXRfcGFn
ZShwYWdlKTsKPiArfQo+ICsKPiArc3RhdGljIHZvaWQgX19odWdlX3B0X2RvbmUoc3RydWN0IHBh
Z2UgKmhlYWQsIGludCBucl9yZWNvcmRlZF9wYWdlcywgaW50ICpucikKPiArewo+ICsJKm5yICs9
IG5yX3JlY29yZGVkX3BhZ2VzOwo+ICsJU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7Cj4gK30KPiAr
Cj4gICNpZmRlZiBDT05GSUdfQVJDSF9IQVNfSFVHRVBECj4gIHN0YXRpYyB1bnNpZ25lZCBsb25n
IGh1Z2VwdGVfYWRkcl9lbmQodW5zaWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwK
PiAgCQkJCSAgICAgIHVuc2lnbmVkIGxvbmcgc3opCj4gQEAgLTE5OTgsMzMgKzIwMjYsMjAgQEAg
c3RhdGljIGludCBndXBfaHVnZXB0ZShwdGVfdCAqcHRlcCwgdW5zaWduZWQgbG9uZyBzeiwgdW5z
aWduZWQgbG9uZyBhZGRyLAo+ICAJLyogaHVnZXBhZ2VzIGFyZSBuZXZlciAic3BlY2lhbCIgKi8K
PiAgCVZNX0JVR19PTighcGZuX3ZhbGlkKHB0ZV9wZm4ocHRlKSkpOwo+ICAKPiAtCXJlZnMgPSAw
Owo+ICAJaGVhZCA9IHB0ZV9wYWdlKHB0ZSk7Cj4gLQo+ICAJcGFnZSA9IGhlYWQgKyAoKGFkZHIg
JiAoc3otMSkpID4+IFBBR0VfU0hJRlQpOwo+IC0JZG8gewo+IC0JCVZNX0JVR19PTihjb21wb3Vu
ZF9oZWFkKHBhZ2UpICE9IGhlYWQpOwo+IC0JCXBhZ2VzWypucl0gPSBwYWdlOwo+IC0JCSgqbnIp
Kys7Cj4gLQkJcGFnZSsrOwo+IC0JCXJlZnMrKzsKPiAtCX0gd2hpbGUgKGFkZHIgKz0gUEFHRV9T
SVpFLCBhZGRyICE9IGVuZCk7Cj4gKwlyZWZzID0gX19yZWNvcmRfc3VicGFnZXMocGFnZSwgYWRk
ciwgZW5kLCBwYWdlcywgKm5yKTsKPiAgCj4gIAloZWFkID0gdHJ5X2dldF9jb21wb3VuZF9oZWFk
KGhlYWQsIHJlZnMpOwo+IC0JaWYgKCFoZWFkKSB7Cj4gLQkJKm5yIC09IHJlZnM7Cj4gKwlpZiAo
IWhlYWQpCj4gIAkJcmV0dXJuIDA7Cj4gLQl9Cj4gIAo+ICAJaWYgKHVubGlrZWx5KHB0ZV92YWwo
cHRlKSAhPSBwdGVfdmFsKCpwdGVwKSkpIHsKPiAtCQkvKiBDb3VsZCBiZSBvcHRpbWl6ZWQgYmV0
dGVyICovCj4gLQkJKm5yIC09IHJlZnM7Cj4gLQkJd2hpbGUgKHJlZnMtLSkKPiAtCQkJcHV0X3Bh
Z2UoaGVhZCk7Cj4gKwkJcHV0X2NvbXBvdW5kX2hlYWQoaGVhZCwgcmVmcyk7Cj4gIAkJcmV0dXJu
IDA7Cj4gIAl9Cj4gIAo+IC0JU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7Cj4gKwlfX2h1Z2VfcHRf
ZG9uZShoZWFkLCByZWZzLCBucik7Cj4gIAlyZXR1cm4gMTsKPiAgfQo+ICAKPiBAQCAtMjA3MSwy
OSArMjA4NiwxOSBAQCBzdGF0aWMgaW50IGd1cF9odWdlX3BtZChwbWRfdCBvcmlnLCBwbWRfdCAq
cG1kcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICAJCQkJCSAgICAgcGFnZXMsIG5yKTsKPiAgCX0K
PiAgCj4gLQlyZWZzID0gMDsKPiAgCXBhZ2UgPSBwbWRfcGFnZShvcmlnKSArICgoYWRkciAmIH5Q
TURfTUFTSykgPj4gUEFHRV9TSElGVCk7Cj4gLQlkbyB7Cj4gLQkJcGFnZXNbKm5yXSA9IHBhZ2U7
Cj4gLQkJKCpucikrKzsKPiAtCQlwYWdlKys7Cj4gLQkJcmVmcysrOwo+IC0JfSB3aGlsZSAoYWRk
ciArPSBQQUdFX1NJWkUsIGFkZHIgIT0gZW5kKTsKPiArCXJlZnMgPSBfX3JlY29yZF9zdWJwYWdl
cyhwYWdlLCBhZGRyLCBlbmQsIHBhZ2VzLCAqbnIpOwo+ICAKPiAgCWhlYWQgPSB0cnlfZ2V0X2Nv
bXBvdW5kX2hlYWQocG1kX3BhZ2Uob3JpZyksIHJlZnMpOwo+IC0JaWYgKCFoZWFkKSB7Cj4gLQkJ
Km5yIC09IHJlZnM7Cj4gKwlpZiAoIWhlYWQpCj4gIAkJcmV0dXJuIDA7Cj4gLQl9Cj4gIAo+ICAJ
aWYgKHVubGlrZWx5KHBtZF92YWwob3JpZykgIT0gcG1kX3ZhbCgqcG1kcCkpKSB7Cj4gLQkJKm5y
IC09IHJlZnM7Cj4gLQkJd2hpbGUgKHJlZnMtLSkKPiAtCQkJcHV0X3BhZ2UoaGVhZCk7Cj4gKwkJ
cHV0X2NvbXBvdW5kX2hlYWQoaGVhZCwgcmVmcyk7Cj4gIAkJcmV0dXJuIDA7Cj4gIAl9Cj4gIAo+
IC0JU2V0UGFnZVJlZmVyZW5jZWQoaGVhZCk7Cj4gKwlfX2h1Z2VfcHRfZG9uZShoZWFkLCByZWZz
LCBucik7Cj4gIAlyZXR1cm4gMTsKPiAgfQo+ICAKPiBAQCAtMjExNCwyOSArMjExOSwxOSBAQCBz
dGF0aWMgaW50IGd1cF9odWdlX3B1ZChwdWRfdCBvcmlnLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQg
bG9uZyBhZGRyLAo+ICAJCQkJCSAgICAgcGFnZXMsIG5yKTsKPiAgCX0KPiAgCj4gLQlyZWZzID0g
MDsKPiAgCXBhZ2UgPSBwdWRfcGFnZShvcmlnKSArICgoYWRkciAmIH5QVURfTUFTSykgPj4gUEFH
RV9TSElGVCk7Cj4gLQlkbyB7Cj4gLQkJcGFnZXNbKm5yXSA9IHBhZ2U7Cj4gLQkJKCpucikrKzsK
PiAtCQlwYWdlKys7Cj4gLQkJcmVmcysrOwo+IC0JfSB3aGlsZSAoYWRkciArPSBQQUdFX1NJWkUs
IGFkZHIgIT0gZW5kKTsKPiArCXJlZnMgPSBfX3JlY29yZF9zdWJwYWdlcyhwYWdlLCBhZGRyLCBl
bmQsIHBhZ2VzLCAqbnIpOwo+ICAKPiAgCWhlYWQgPSB0cnlfZ2V0X2NvbXBvdW5kX2hlYWQocHVk
X3BhZ2Uob3JpZyksIHJlZnMpOwo+IC0JaWYgKCFoZWFkKSB7Cj4gLQkJKm5yIC09IHJlZnM7Cj4g
KwlpZiAoIWhlYWQpCj4gIAkJcmV0dXJuIDA7Cj4gLQl9Cj4gIAo+ICAJaWYgKHVubGlrZWx5KHB1
ZF92YWwob3JpZykgIT0gcHVkX3ZhbCgqcHVkcCkpKSB7Cj4gLQkJKm5yIC09IHJlZnM7Cj4gLQkJ
d2hpbGUgKHJlZnMtLSkKPiAtCQkJcHV0X3BhZ2UoaGVhZCk7Cj4gKwkJcHV0X2NvbXBvdW5kX2hl
YWQoaGVhZCwgcmVmcyk7Cj4gIAkJcmV0dXJuIDA7Cj4gIAl9Cj4gIAo+IC0JU2V0UGFnZVJlZmVy
ZW5jZWQoaGVhZCk7Cj4gKwlfX2h1Z2VfcHRfZG9uZShoZWFkLCByZWZzLCBucik7Cj4gIAlyZXR1
cm4gMTsKPiAgfQo+ICAKPiBAQCAtMjE1MSwyOSArMjE0NiwyMCBAQCBzdGF0aWMgaW50IGd1cF9o
dWdlX3BnZChwZ2RfdCBvcmlnLCBwZ2RfdCAqcGdkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICAJ
CXJldHVybiAwOwo+ICAKPiAgCUJVSUxEX0JVR19PTihwZ2RfZGV2bWFwKG9yaWcpKTsKPiAtCXJl
ZnMgPSAwOwo+ICsKPiAgCXBhZ2UgPSBwZ2RfcGFnZShvcmlnKSArICgoYWRkciAmIH5QR0RJUl9N
QVNLKSA+PiBQQUdFX1NISUZUKTsKPiAtCWRvIHsKPiAtCQlwYWdlc1sqbnJdID0gcGFnZTsKPiAt
CQkoKm5yKSsrOwo+IC0JCXBhZ2UrKzsKPiAtCQlyZWZzKys7Cj4gLQl9IHdoaWxlIChhZGRyICs9
IFBBR0VfU0laRSwgYWRkciAhPSBlbmQpOwo+ICsJcmVmcyA9IF9fcmVjb3JkX3N1YnBhZ2VzKHBh
Z2UsIGFkZHIsIGVuZCwgcGFnZXMsICpucik7Cj4gIAo+ICAJaGVhZCA9IHRyeV9nZXRfY29tcG91
bmRfaGVhZChwZ2RfcGFnZShvcmlnKSwgcmVmcyk7Cj4gLQlpZiAoIWhlYWQpIHsKPiAtCQkqbnIg
LT0gcmVmczsKPiArCWlmICghaGVhZCkKPiAgCQlyZXR1cm4gMDsKPiAtCX0KPiAgCj4gIAlpZiAo
dW5saWtlbHkocGdkX3ZhbChvcmlnKSAhPSBwZ2RfdmFsKCpwZ2RwKSkpIHsKPiAtCQkqbnIgLT0g
cmVmczsKPiAtCQl3aGlsZSAocmVmcy0tKQo+IC0JCQlwdXRfcGFnZShoZWFkKTsKPiArCQlwdXRf
Y29tcG91bmRfaGVhZChoZWFkLCByZWZzKTsKPiAgCQlyZXR1cm4gMDsKPiAgCX0KPiAgCj4gLQlT
ZXRQYWdlUmVmZXJlbmNlZChoZWFkKTsKPiArCV9faHVnZV9wdF9kb25lKGhlYWQsIHJlZnMsIG5y
KTsKPiAgCXJldHVybiAxOwo+ICB9Cj4gIAo+IC0tIAo+IDIuMjMuMAo+IAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
