Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B1BEE8C8
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 912746E849;
	Mon,  4 Nov 2019 19:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DE4B6E7E6
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 18:22:25 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc06c670000>; Mon, 04 Nov 2019 10:22:31 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 04 Nov 2019 10:22:24 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 04 Nov 2019 10:22:24 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 4 Nov
 2019 18:22:23 +0000
Subject: Re: [PATCH v2 09/18] drm/via: set FOLL_PIN via pin_user_pages_fast()
To: Jerome Glisse <jglisse@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-10-jhubbard@nvidia.com>
 <20191104174445.GF5134@redhat.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <880dbf76-ba9d-2555-27e4-a656c7cd3296@nvidia.com>
Date: Mon, 4 Nov 2019 10:22:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191104174445.GF5134@redhat.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:09 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572891751; bh=6jW45wKOFDFKBEg0lZ7bTretxwwJVIL7ATzyqCLqcEs=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=q+cPcxTzijEgiG71VTi3ghLiE7GfTQ4coAPAv62hXRzzfbJrqL72vvQzW31t6ElHl
 a14GEr0QvEJ+EgWUGUZvr/G/dg/DO160GJKTWSZ2RJb00ZyoxmozrYK/r7pBI/oTMl
 Ler5Xg8wJ+ZN2h3kBmHfP9Sw6IyvnOUkYQcpRlRzW+raDfRYi607iZ0w1mGtWLJDUd
 OeC58odM3LRQFDuOqtEG4EL4fTJQzFx4oBwJjsq4w851X4PvmAFvjIH2kPLRjgrU0s
 pJjSO5ccYyyba2k6piwVKSCGegs79Mk1YqTR+mkcxWQJ+CLl9VNfnFD05lp5bT2fCz
 LMXjtLCzRFCYw==
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
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvNC8xOSA5OjQ0IEFNLCBKZXJvbWUgR2xpc3NlIHdyb3RlOgo+IE9uIFN1biwgTm92IDAz
LCAyMDE5IGF0IDAxOjE4OjA0UE0gLTA4MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4gQ29udmVy
dCBkcm0vdmlhIHRvIHVzZSB0aGUgbmV3IHBpbl91c2VyX3BhZ2VzX2Zhc3QoKSBjYWxsLCB3aGlj
aCBzZXRzCj4+IEZPTExfUElOLiBTZXR0aW5nIEZPTExfUElOIGlzIG5vdyByZXF1aXJlZCBmb3Ig
Y29kZSB0aGF0IHJlcXVpcmVzCj4+IHRyYWNraW5nIG9mIHBpbm5lZCBwYWdlcywgYW5kIHRoZXJl
Zm9yZSBmb3IgYW55IGNvZGUgdGhhdCBjYWxscwo+PiBwdXRfdXNlcl9wYWdlKCkuCj4+Cj4+IFJl
dmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPiAKPiBQbGVhc2UgYmUgbW9y
ZSBleHBsaWNpdCB0aGF0IHZpYV9kbWFibGl0LmMgaXMgYWxyZWFkeSB1c2luZyBwdXRfdXNlcl9w
YWdlKCkKPiBhcyBpIGFtIGV4cGVjdGluZyB0aGF0IGFueSBjb252ZXJzaW9uIHRvIHBpbl91c2Vy
X3BhZ2VzKigpIG11c3QgYmUgcGFpciB3aXRoCj4gYSBwdXRfdXNlcl9wYWdlKCkuIEkgZmluZCBh
Ym92ZSBjb21taXQgbWVzc2FnZSBiaXQgdW5jbGVhciBmcm9tIHRoYXQgUE9WLgo+IAoKT0suIFRo
aXMgb25lLCBhbmQgdGhlIGZzL2lvX3VyaW5nIChwYXRjaCA5KSBhbmQgbmV0L3hkcCAocGF0Y2gg
MTApIHdlcmUgYWxsCmNhc2VzIHRoYXQgaGFkIHB1dF91c2VyX3BhZ2UoKSBwcmUtZXhpc3Rpbmcu
IEkgd2lsbCBhZGQgc29tZXRoaW5nIGxpa2UgdGhlIApmb2xsb3dpbmcgdG8gZWFjaCBjb21taXQg
ZGVzY3JpcHRpb24sIGZvciB2MzoKCkluIHBhcnRpYWwgYW50aWNpcGF0aW9uIG9mIHRoaXMgd29y
aywgdGhlIGRybS92aWEgZHJpdmVyIHdhcyBhbHJlYWR5IApjYWxsaW5nIHB1dF91c2VyX3BhZ2Uo
KSBpbnN0ZWFkIG9mIHB1dF9wYWdlKCkuIFRoZXJlZm9yZSwgaW4gb3JkZXIgdG8KY29udmVydCBm
cm9tIHRoZSBnZXRfdXNlcl9wYWdlcygpL3B1dF9wYWdlKCkgbW9kZWwsIHRvIHRoZQpwaW5fdXNl
cl9wYWdlcygpL3B1dF91c2VyX3BhZ2UoKSBtb2RlbCwgdGhlIG9ubHkgY2hhbmdlIHJlcXVpcmVk
CmlzIHRvIGNoYW5nZSBnZXRfdXNlcl9wYWdlcygpIHRvIHBpbl91c2VyX3BhZ2VzKCkuCgp0aGFu
a3MsCgpKb2huIEh1YmJhcmQKTlZJRElBCgo+IFJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2Ug
PGpnbGlzc2VAcmVkaGF0LmNvbT4KPiAKPiAKPj4gLS0tCj4+ICBkcml2ZXJzL2dwdS9kcm0vdmlh
L3ZpYV9kbWFibGl0LmMgfCAyICstCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlh
X2RtYWJsaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYwo+PiBpbmRleCAz
ZGIwMDBhYWNkMjYuLjM3YzVlNTcyOTkzYSAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3ZpYS92aWFfZG1hYmxpdC5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJs
aXQuYwo+PiBAQCAtMjM5LDcgKzIzOSw3IEBAIHZpYV9sb2NrX2FsbF9kbWFfcGFnZXMoZHJtX3Zp
YV9zZ19pbmZvX3QgKnZzZywgIGRybV92aWFfZG1hYmxpdF90ICp4ZmVyKQo+PiAgCXZzZy0+cGFn
ZXMgPSB2emFsbG9jKGFycmF5X3NpemUoc2l6ZW9mKHN0cnVjdCBwYWdlICopLCB2c2ctPm51bV9w
YWdlcykpOwo+PiAgCWlmIChOVUxMID09IHZzZy0+cGFnZXMpCj4+ICAJCXJldHVybiAtRU5PTUVN
Owo+PiAtCXJldCA9IGdldF91c2VyX3BhZ2VzX2Zhc3QoKHVuc2lnbmVkIGxvbmcpeGZlci0+bWVt
X2FkZHIsCj4+ICsJcmV0ID0gcGluX3VzZXJfcGFnZXNfZmFzdCgodW5zaWduZWQgbG9uZyl4ZmVy
LT5tZW1fYWRkciwKPj4gIAkJCXZzZy0+bnVtX3BhZ2VzLAo+PiAgCQkJdnNnLT5kaXJlY3Rpb24g
PT0gRE1BX0ZST01fREVWSUNFID8gRk9MTF9XUklURSA6IDAsCj4+ICAJCQl2c2ctPnBhZ2VzKTsK
Pj4gLS0gCj4+IDIuMjMuMAo+Pgo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
