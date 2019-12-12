Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D61111C5AE
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 06:56:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3746EC5D;
	Thu, 12 Dec 2019 05:56:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 243E96EC5D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 05:56:37 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5df1d68d0000>; Wed, 11 Dec 2019 21:56:29 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 11 Dec 2019 21:56:36 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 11 Dec 2019 21:56:36 -0800
Received: from [10.2.165.195] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Dec
 2019 05:56:35 +0000
Subject: Re: [PATCH v9 23/25] mm/gup: track FOLL_PIN pages
To: Jan Kara <jack@suse.cz>
References: <20191211025318.457113-1-jhubbard@nvidia.com>
 <20191211025318.457113-24-jhubbard@nvidia.com>
 <20191211112807.GN1551@quack2.suse.cz>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <f961d0b6-c660-85b9-ad01-53bce74e39e9@nvidia.com>
Date: Wed, 11 Dec 2019 21:53:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <20191211112807.GN1551@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1576130190; bh=WUvMFBOwsTbLT+9CzNbxGtAponFsFsmTJOyg8MjL8ds=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=FEmN6+4G1GNSHQ9ma62bdogDEsqCZsXsEIaHjcQPDlWn9pwbpWLjgQfrMrBBeEdSj
 FM6mg4lpOgy/IhcEn8FJMOG6LimOElAzRvARKC6g/r6+a8Vd22zU1L/UD0NEjft9dN
 GWVMwXWr88jV+CTWITKN5dzOaUf68M9sF68lLze7CfYV21djHqJsEgbERFFSPjmpr/
 olyJvdJq2HOxvqfdOfu+LEejN3wzni65PtCHIw0TqzYuy1xBpB1WLNS9HVw+SbFCHF
 /RLGP2uK4EnMl0JZZPPWfHVUbn6lPlv1O1r1bA/GNYPygAKFUQackrjiYEL+3R7/P3
 Bby+Fir3Qtaeg==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTIvMTEvMTkgMzoyOCBBTSwgSmFuIEthcmEgd3JvdGU6Ci4uLgo+IAo+IFRoZSBwYXRjaCBs
b29rcyBtb3N0bHkgZ29vZCB0byBtZSBub3cuIEp1c3QgYSBmZXcgc21hbGxlciBjb21tZW50cyBi
ZWxvdy4KPiAKPj4gU3VnZ2VzdGVkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6Pgo+PiBTdWdn
ZXN0ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+PiBSZXZpZXdl
ZC1ieTogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPj4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEds
aXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+PiBSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEu
d2VpbnlAaW50ZWwuY29tPgo+IAo+IEkgdGhpbmsgeW91IGluaGVyaXRlZCBoZXJlIHRoZSBSZXZp
ZXdlZC1ieSB0YWdzIGZyb20gdGhlICJhZGQgZmxhZ3MiIHBhdGNoCj4geW91J3ZlIG1lcmdlZCBp
bnRvIHRoaXMgb25lIGJ1dCB0aGF0J3Mgbm90IHJlYWxseSBmYWlyIHNpbmNlIHRoaXMgcGF0Y2gK
PiBkb2VzIG11Y2ggbW9yZS4uLiBJbiBwYXJ0aWN1bGFyIEkgZGlkbid0IGdpdmUgbXkgUmV2aWV3
ZWQtYnkgdGFnIGZvciB0aGlzCj4gcGF0Y2ggeWV0LgoKT0ssIEkndmUgcmVtb3ZlZCB0aG9zZSBy
ZXZpZXdlZC1ieSdzLiAoSSBmZWx0IGJhZCBhYm91dCBkcm9wcGluZyB0aGVtLCBhZnRlcgpwZW9w
bGUgaGFkIGRldm90ZWQgdGltZSB0byByZXZpZXdpbmcsIGJ1dCBJIGRvIHNlZSB0aGF0IGl0J3Mg
d3JvbmcgdG8gaW1wbHkKdGhhdCB0aGV5J3ZlIHJldmlld2VkIHRoaXMgbXVjaCBtdWNoIGxhcmdl
ciB0aGluZy4pCgouLi4KPiAKPiBJIHNvbWV3aGF0IHdvbmRlciBhYm91dCB0aGUgYXN5bW1ldHJ5
IG9mIHRyeV9ncmFiX2NvbXBvdW5kX2hlYWQoKSB2cwo+IHRyeV9ncmFiX3BhZ2UoKSBpbiB0aGUg
dHJlYXRtZW50IG9mICdmbGFncycuIEhvdyBjb3N0bHkgd291bGQgaXQgYmUgdG8gbWFrZQo+IHRo
ZW0gc3ltbWV0cmljIChpLmUuLCBlaXRoZXIgc2V0IEZPTExfR0VUIGZvciB0cnlfZ3JhYl9jb21w
b3VuZF9oZWFkKCkKPiBjYWxsZXJzIG9yIG1ha2Ugc3VyZSBvbmUgb2YgRk9MTF9HRVQsIEZPTExf
UElOIGlzIHNldCBmb3IgdHJ5X2dyYWJfcGFnZSgpKT8KPiAKPiBCZWNhdXNlIHRoaXMgZGlmZmVy
ZW5jZSBsb29rcyBsaWtlIGEgc3VidGxlIGNhdGNoIGluIHRoZSBsb25nIHJ1bi4uLgoKRG9uZS4g
SXQgaXMgb25seSBhIG1vZGVzdCBjb2RlLWxldmVsIGNoYW5nZSwgYXQgbGVhc3QgdGhlIHdheSBJ
J3ZlIGRvbmUgaXQsIHdoaWNoIGlzCnNldHRpbmcgRk9MTF9HRVQgZm9yIHRyeV9ncmFiX2NvbXBv
dW5kX2hlYWQoKS4gSW4gb3JkZXIgdG8gZG8gdGhhdCwgSSBzZXQKaXQgYXQgdGhlIHRvcCBvZiB0
aGUgaW50ZXJuYWwgZ3VwIGZhc3QgY2FsbGluZyBzdGFja3MsIHdoaWNoIGlzIGFjdHVhbGx5IGEg
Z29vZApkZXNpZ24gYW55d2F5OiBndXAgZmFzdCBpcyBsb2dpY2FsbHkgZG9pbmcgRk9MTF9HRVQg
aW4gYWxsIGNhc2VzLiBTbyBzZXR0aW5nCnRoZSBmbGFnIGludGVybmFsbHkgaXMgYWNjdXJhdGUg
YW5kIGNvbnNpc3RlbnQgd2l0aCB0aGUgb3ZlcmFsbCBkZXNpZ24uCgoKPiAuLi4KPiAKPj4gQEAg
LTE1MjIsOCArMTUzNiw4IEBAIHN0cnVjdCBwYWdlICpmb2xsb3dfdHJhbnNfaHVnZV9wbWQoc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4+ICAgc2tpcF9tbG9jazoKPj4gICAJcGFnZSArPSAo
YWRkciAmIH5IUEFHRV9QTURfTUFTSykgPj4gUEFHRV9TSElGVDsKPj4gICAJVk1fQlVHX09OX1BB
R0UoIVBhZ2VDb21wb3VuZChwYWdlKSAmJiAhaXNfem9uZV9kZXZpY2VfcGFnZShwYWdlKSwgcGFn
ZSk7Cj4+IC0JaWYgKGZsYWdzICYgRk9MTF9HRVQpCj4+IC0JCWdldF9wYWdlKHBhZ2UpOwo+PiAr
CWlmICghdHJ5X2dyYWJfcGFnZShwYWdlLCBmbGFncykpCj4+ICsJCXBhZ2UgPSBFUlJfUFRSKC1F
RkFVTFQpOwo+IAo+IEkgdGhpbmsgeW91IG5lZWQgdG8gYWxzbyBtb3ZlIHRoZSB0cnlfZ3JhYl9w
YWdlKCkgZWFybGllciBpbiB0aGUgZnVuY3Rpb24uCj4gQXQgdGhpcyBwb2ludCB0aGUgcGFnZSBt
YXkgYmUgbWFya2VkIGFzIG1sb2NrZWQgYW5kIHlvdSdkIG5lZWQgdG8gdW5kbyB0aGF0Cj4gaW4g
Y2FzZSB0cnlfZ3JhYl9wYWdlKCkgZmFpbHMuCgoKT0ssIEkndmUgbW92ZWQgaXQgdXAsIGFkZGlu
ZyBhICJzdWJwYWdlIiB2YXJpYWJsZSBpbiBvcmRlciB0byBtYWtlIHRoYXQgd29yay4KCj4gCj4+
IGRpZmYgLS1naXQgYS9tbS9odWdldGxiLmMgYi9tbS9odWdldGxiLmMKPj4gaW5kZXggYWM2NWJi
NWUzOGFjLi4wYWFiNmZlMDA3MmYgMTAwNjQ0Cj4+IC0tLSBhL21tL2h1Z2V0bGIuYwo+PiArKysg
Yi9tbS9odWdldGxiLmMKPj4gQEAgLTQzNTYsNyArNDM1NiwxMyBAQCBsb25nIGZvbGxvd19odWdl
dGxiX3BhZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LAo+PiAgIHNhbWVfcGFnZToKPj4gICAJCWlmIChwYWdlcykgewo+PiAgIAkJCXBhZ2VzW2ldID0g
bWVtX21hcF9vZmZzZXQocGFnZSwgcGZuX29mZnNldCk7Cj4+IC0JCQlnZXRfcGFnZShwYWdlc1tp
XSk7Cj4+ICsJCQlpZiAoIXRyeV9ncmFiX3BhZ2UocGFnZXNbaV0sIGZsYWdzKSkgewo+PiArCQkJ
CXNwaW5fdW5sb2NrKHB0bCk7Cj4+ICsJCQkJcmVtYWluZGVyID0gMDsKPj4gKwkJCQllcnIgPSAt
RU5PTUVNOwo+PiArCQkJCVdBUk5fT05fT05DRSgxKTsKPj4gKwkJCQlicmVhazsKPj4gKwkJCX0K
Pj4gICAJCX0KPiAKPiBUaGlzIGZ1bmN0aW9uIGRvZXMgYSByZWZjb3VudCBvdmVyZmxvdyBjaGVj
ayBlYXJseSBzbyB0aGF0IGl0IGRvZXNuJ3QgaGF2ZQo+IHRvIGRvIHRyeV9nZXRfcGFnZSgpIGhl
cmUuIFNvIHRoYXQgY2hlY2sgY2FuIGJlIG5vdyByZW1vdmVkIHdoZW4geW91IGRvCj4gdHJ5X2dy
YWJfcGFnZSgpIGhlcmUgYW55d2F5IHNpbmNlIHRoYXQgZWFybHkgY2hlY2sgc2VlbXMgdG8gYmUg
anVzdCBhIHRpbnkKPiBvcHRpbWl6YXRpb24gQUZBSUNULgo+IAo+IAkJCQkJCQkJSG9uemEKPiAK
Clllcy4gSSd2ZSByZW1vdmVkIGl0LCBnb29kIHNwb3QuCgoKdGhhbmtzLAotLSAKSm9obiBIdWJi
YXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
