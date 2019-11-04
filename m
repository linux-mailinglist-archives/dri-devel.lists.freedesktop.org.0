Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2E8EE4DA
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 17:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344F6E226;
	Mon,  4 Nov 2019 16:39:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC9236E226
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:39:36 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-368-XcpsC-lSP4a7ehsn9d2sxg-1; Mon, 04 Nov 2019 11:39:31 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D6C88017DD;
 Mon,  4 Nov 2019 16:39:27 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id F0A6F5C240;
 Mon,  4 Nov 2019 16:39:20 +0000 (UTC)
Date: Mon, 4 Nov 2019 11:39:19 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 01/18] mm/gup: pass flags arg to __gup_device_*
 functions
Message-ID: <20191104163919.GA5134@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-2-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-2-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: XcpsC-lSP4a7ehsn9d2sxg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572885575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZKRtyHtWqxotoMRVCD2L231GIf5CzzOu6K7yMpGCV1E=;
 b=EISj5KjZrUl3kZNHgeVxg9gzAbcLy4Tpe15p04ZJX+1X/PP0zhFi/jqdDWYjMDEhoU+i0C
 JuU/cWz6scDZOZMQlwE2N2QuxICFFYXRzNVTjImH796mEQWD/wjXHkzq8BvJ4gOxbXcJlq
 N9g+v2tQVhedXU+Lsqq3rbwA789furQ=
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gU3VuLCBOb3YgMDMsIDIwMTkgYXQgMDE6MTc6NTZQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IEEgc3Vic2VxdWVudCBwYXRjaCByZXF1aXJlcyBhY2Nlc3MgdG8gZ3VwIGZsYWdzLCBz
bwo+IHBhc3MgdGhlIGZsYWdzIGFyZ3VtZW50IHRocm91Z2ggdG8gdGhlIF9fZ3VwX2RldmljZV8q
Cj4gZnVuY3Rpb25zLgo+IAo+IEFsc28gcGxhY2F0ZSBjaGVja3BhdGNoLnBsIGJ5IHNob3J0ZW5p
bmcgYSBuZWFyYnkgbGluZS4KPiAKPiBSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlA
aW50ZWwuY29tPgo+IENjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbC5zaHV0ZW1vdkBsaW51
eC5pbnRlbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlk
aWEuY29tPgoKUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29t
PgoKPiAtLS0KPiAgbW0vZ3VwLmMgfCAyOCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPiAKPiBk
aWZmIC0tZ2l0IGEvbW0vZ3VwLmMgYi9tbS9ndXAuYwo+IGluZGV4IDhmMjM2YTMzNWFlOS4uODVj
YWY3NmIzMDEyIDEwMDY0NAo+IC0tLSBhL21tL2d1cC5jCj4gKysrIGIvbW0vZ3VwLmMKPiBAQCAt
MTg5MCw3ICsxODkwLDggQEAgc3RhdGljIGludCBndXBfcHRlX3JhbmdlKHBtZF90IHBtZCwgdW5z
aWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwKPiAgCj4gICNpZiBkZWZpbmVkKENP
TkZJR19BUkNIX0hBU19QVEVfREVWTUFQKSAmJiBkZWZpbmVkKENPTkZJR19UUkFOU1BBUkVOVF9I
VUdFUEFHRSkKPiAgc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZSh1bnNpZ25lZCBsb25nIHBm
biwgdW5zaWduZWQgbG9uZyBhZGRyLAo+IC0JCXVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1Y3QgcGFn
ZSAqKnBhZ2VzLCBpbnQgKm5yKQo+ICsJCQkgICAgIHVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25l
ZCBpbnQgZmxhZ3MsCj4gKwkJCSAgICAgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKPiAg
ewo+ICAJaW50IG5yX3N0YXJ0ID0gKm5yOwo+ICAJc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCA9
IE5VTEw7Cj4gQEAgLTE5MTYsMTMgKzE5MTcsMTQgQEAgc3RhdGljIGludCBfX2d1cF9kZXZpY2Vf
aHVnZSh1bnNpZ25lZCBsb25nIHBmbiwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICB9Cj4gIAo+ICBz
dGF0aWMgaW50IF9fZ3VwX2RldmljZV9odWdlX3BtZChwbWRfdCBvcmlnLCBwbWRfdCAqcG1kcCwg
dW5zaWduZWQgbG9uZyBhZGRyLAo+IC0JCXVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1Y3QgcGFnZSAq
KnBhZ2VzLCBpbnQgKm5yKQo+ICsJCQkJIHVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQg
ZmxhZ3MsCj4gKwkJCQkgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKPiAgewo+ICAJdW5z
aWduZWQgbG9uZyBmYXVsdF9wZm47Cj4gIAlpbnQgbnJfc3RhcnQgPSAqbnI7Cj4gIAo+ICAJZmF1
bHRfcGZuID0gcG1kX3BmbihvcmlnKSArICgoYWRkciAmIH5QTURfTUFTSykgPj4gUEFHRV9TSElG
VCk7Cj4gLQlpZiAoIV9fZ3VwX2RldmljZV9odWdlKGZhdWx0X3BmbiwgYWRkciwgZW5kLCBwYWdl
cywgbnIpKQo+ICsJaWYgKCFfX2d1cF9kZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIsIGVuZCwg
ZmxhZ3MsIHBhZ2VzLCBucikpCj4gIAkJcmV0dXJuIDA7Cj4gIAo+ICAJaWYgKHVubGlrZWx5KHBt
ZF92YWwob3JpZykgIT0gcG1kX3ZhbCgqcG1kcCkpKSB7Cj4gQEAgLTE5MzMsMTMgKzE5MzUsMTQg
QEAgc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wbWQocG1kX3Qgb3JpZywgcG1kX3QgKnBt
ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAgfQo+ICAKPiAgc3RhdGljIGludCBfX2d1cF9kZXZp
Y2VfaHVnZV9wdWQocHVkX3Qgb3JpZywgcHVkX3QgKnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwK
PiAtCQl1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKPiAr
CQkJCSB1bnNpZ25lZCBsb25nIGVuZCwgdW5zaWduZWQgaW50IGZsYWdzLAo+ICsJCQkJIHN0cnVj
dCBwYWdlICoqcGFnZXMsIGludCAqbnIpCj4gIHsKPiAgCXVuc2lnbmVkIGxvbmcgZmF1bHRfcGZu
Owo+ICAJaW50IG5yX3N0YXJ0ID0gKm5yOwo+ICAKPiAgCWZhdWx0X3BmbiA9IHB1ZF9wZm4ob3Jp
ZykgKyAoKGFkZHIgJiB+UFVEX01BU0spID4+IFBBR0VfU0hJRlQpOwo+IC0JaWYgKCFfX2d1cF9k
ZXZpY2VfaHVnZShmYXVsdF9wZm4sIGFkZHIsIGVuZCwgcGFnZXMsIG5yKSkKPiArCWlmICghX19n
dXBfZGV2aWNlX2h1Z2UoZmF1bHRfcGZuLCBhZGRyLCBlbmQsIGZsYWdzLCBwYWdlcywgbnIpKQo+
ICAJCXJldHVybiAwOwo+ICAKPiAgCWlmICh1bmxpa2VseShwdWRfdmFsKG9yaWcpICE9IHB1ZF92
YWwoKnB1ZHApKSkgewo+IEBAIC0xOTUwLDE0ICsxOTUzLDE2IEBAIHN0YXRpYyBpbnQgX19ndXBf
ZGV2aWNlX2h1Z2VfcHVkKHB1ZF90IG9yaWcsIHB1ZF90ICpwdWRwLCB1bnNpZ25lZCBsb25nIGFk
ZHIsCj4gIH0KPiAgI2Vsc2UKPiAgc3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wbWQocG1k
X3Qgb3JpZywgcG1kX3QgKnBtZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPiAtCQl1bnNpZ25lZCBs
b25nIGVuZCwgc3RydWN0IHBhZ2UgKipwYWdlcywgaW50ICpucikKPiArCQkJCSB1bnNpZ25lZCBs
b25nIGVuZCwgdW5zaWduZWQgaW50IGZsYWdzLAo+ICsJCQkJIHN0cnVjdCBwYWdlICoqcGFnZXMs
IGludCAqbnIpCj4gIHsKPiAgCUJVSUxEX0JVRygpOwo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4g
IHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2VfcHVkKHB1ZF90IHB1ZCwgcHVkX3QgKnB1ZHAs
IHVuc2lnbmVkIGxvbmcgYWRkciwKPiAtCQl1bnNpZ25lZCBsb25nIGVuZCwgc3RydWN0IHBhZ2Ug
KipwYWdlcywgaW50ICpucikKPiArCQkJCSB1bnNpZ25lZCBsb25nIGVuZCwgdW5zaWduZWQgaW50
IGZsYWdzLAo+ICsJCQkJIHN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCj4gIHsKPiAgCUJV
SUxEX0JVRygpOwo+ICAJcmV0dXJuIDA7Cj4gQEAgLTIwNjIsNyArMjA2Nyw4IEBAIHN0YXRpYyBp
bnQgZ3VwX2h1Z2VfcG1kKHBtZF90IG9yaWcsIHBtZF90ICpwbWRwLCB1bnNpZ25lZCBsb25nIGFk
ZHIsCj4gIAlpZiAocG1kX2Rldm1hcChvcmlnKSkgewo+ICAJCWlmICh1bmxpa2VseShmbGFncyAm
IEZPTExfTE9OR1RFUk0pKQo+ICAJCQlyZXR1cm4gMDsKPiAtCQlyZXR1cm4gX19ndXBfZGV2aWNl
X2h1Z2VfcG1kKG9yaWcsIHBtZHAsIGFkZHIsIGVuZCwgcGFnZXMsIG5yKTsKPiArCQlyZXR1cm4g
X19ndXBfZGV2aWNlX2h1Z2VfcG1kKG9yaWcsIHBtZHAsIGFkZHIsIGVuZCwgZmxhZ3MsCj4gKwkJ
CQkJICAgICBwYWdlcywgbnIpOwo+ICAJfQo+ICAKPiAgCXJlZnMgPSAwOwo+IEBAIC0yMDkyLDcg
KzIwOTgsOCBAQCBzdGF0aWMgaW50IGd1cF9odWdlX3BtZChwbWRfdCBvcmlnLCBwbWRfdCAqcG1k
cCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IGd1cF9odWdlX3B1
ZChwdWRfdCBvcmlnLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBhZGRyLAo+IC0JCXVuc2ln
bmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsIHN0cnVjdCBwYWdlICoqcGFnZXMsIGlu
dCAqbnIpCj4gKwkJCXVuc2lnbmVkIGxvbmcgZW5kLCB1bnNpZ25lZCBpbnQgZmxhZ3MsCj4gKwkJ
CXN0cnVjdCBwYWdlICoqcGFnZXMsIGludCAqbnIpCj4gIHsKPiAgCXN0cnVjdCBwYWdlICpoZWFk
LCAqcGFnZTsKPiAgCWludCByZWZzOwo+IEBAIC0yMTAzLDcgKzIxMTAsOCBAQCBzdGF0aWMgaW50
IGd1cF9odWdlX3B1ZChwdWRfdCBvcmlnLCBwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBhZGRy
LAo+ICAJaWYgKHB1ZF9kZXZtYXAob3JpZykpIHsKPiAgCQlpZiAodW5saWtlbHkoZmxhZ3MgJiBG
T0xMX0xPTkdURVJNKSkKPiAgCQkJcmV0dXJuIDA7Cj4gLQkJcmV0dXJuIF9fZ3VwX2RldmljZV9o
dWdlX3B1ZChvcmlnLCBwdWRwLCBhZGRyLCBlbmQsIHBhZ2VzLCBucik7Cj4gKwkJcmV0dXJuIF9f
Z3VwX2RldmljZV9odWdlX3B1ZChvcmlnLCBwdWRwLCBhZGRyLCBlbmQsIGZsYWdzLAo+ICsJCQkJ
CSAgICAgcGFnZXMsIG5yKTsKPiAgCX0KPiAgCj4gIAlyZWZzID0gMDsKPiAtLSAKPiAyLjIzLjAK
PiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
