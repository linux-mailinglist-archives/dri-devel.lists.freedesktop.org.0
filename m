Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1935C1004F8
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:01:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B526E6E4B5;
	Mon, 18 Nov 2019 12:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74E816E4A5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:01:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BB66FB02C;
 Mon, 18 Nov 2019 12:01:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 7DE191E4B03; Mon, 18 Nov 2019 10:49:18 +0100 (CET)
Date: Mon, 18 Nov 2019 10:49:18 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 07/24] IB/umem: use get_user_pages_fast() to pin DMA
 pages
Message-ID: <20191118094918.GE17319@quack2.suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-8-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115055340.1825745-8-jhubbard@nvidia.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, Jason Gunthorpe <jgg@mellanox.com>,
 Vlastimil Babka <vbabka@suse.cz>,
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

T24gVGh1IDE0LTExLTE5IDIxOjUzOjIzLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gQW5kIGdldCBy
aWQgb2YgdGhlIG1tYXBfc2VtIGNhbGxzLCBhcyBwYXJ0IG9mIHRoYXQuIE5vdGUKPiB0aGF0IGdl
dF91c2VyX3BhZ2VzX2Zhc3QoKSB3aWxsLCBpZiBuZWNlc3NhcnksIGZhbGwgYmFjayB0bwo+IF9f
Z3VwX2xvbmd0ZXJtX3VubG9ja2VkKCksIHdoaWNoIHRha2VzIHRoZSBtbWFwX3NlbSBhcyBuZWVk
ZWQuCj4gCj4gUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4K
PiBSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KCkxvb2tzIGdvb2QgdG8g
bWUuIFlvdSBjYW4gYWRkOgoKUmV2aWV3ZWQtYnk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+CgoJ
CQkJCQkJCUhvbnphCgoKPiAtLS0KPiAgZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5jIHwg
MTcgKysrKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3Jl
L3VtZW0uYyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYwo+IGluZGV4IDI0MjQ0YTJm
NjhjYy4uM2Q2NjRhMjUzOWViIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3Jl
L3VtZW0uYwo+ICsrKyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYwo+IEBAIC0yNzEs
MTYgKzI3MSwxMyBAQCBzdHJ1Y3QgaWJfdW1lbSAqaWJfdW1lbV9nZXQoc3RydWN0IGliX3VkYXRh
ICp1ZGF0YSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICAJc2cgPSB1bWVtLT5zZ19oZWFkLnNnbDsK
PiAgCj4gIAl3aGlsZSAobnBhZ2VzKSB7Cj4gLQkJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwo+
IC0JCXJldCA9IGdldF91c2VyX3BhZ2VzKGN1cl9iYXNlLAo+IC0JCQkJICAgICBtaW5fdCh1bnNp
Z25lZCBsb25nLCBucGFnZXMsCj4gLQkJCQkJICAgUEFHRV9TSVpFIC8gc2l6ZW9mIChzdHJ1Y3Qg
cGFnZSAqKSksCj4gLQkJCQkgICAgIGd1cF9mbGFncyB8IEZPTExfTE9OR1RFUk0sCj4gLQkJCQkg
ICAgIHBhZ2VfbGlzdCwgTlVMTCk7Cj4gLQkJaWYgKHJldCA8IDApIHsKPiAtCQkJdXBfcmVhZCgm
bW0tPm1tYXBfc2VtKTsKPiArCQlyZXQgPSBnZXRfdXNlcl9wYWdlc19mYXN0KGN1cl9iYXNlLAo+
ICsJCQkJCSAgbWluX3QodW5zaWduZWQgbG9uZywgbnBhZ2VzLAo+ICsJCQkJCQlQQUdFX1NJWkUg
Lwo+ICsJCQkJCQlzaXplb2Yoc3RydWN0IHBhZ2UgKikpLAo+ICsJCQkJCSAgZ3VwX2ZsYWdzIHwg
Rk9MTF9MT05HVEVSTSwgcGFnZV9saXN0KTsKPiArCQlpZiAocmV0IDwgMCkKPiAgCQkJZ290byB1
bWVtX3JlbGVhc2U7Cj4gLQkJfQo+ICAKPiAgCQljdXJfYmFzZSArPSByZXQgKiBQQUdFX1NJWkU7
Cj4gIAkJbnBhZ2VzICAgLT0gcmV0Owo+IEBAIC0yODgsOCArMjg1LDYgQEAgc3RydWN0IGliX3Vt
ZW0gKmliX3VtZW1fZ2V0KHN0cnVjdCBpYl91ZGF0YSAqdWRhdGEsIHVuc2lnbmVkIGxvbmcgYWRk
ciwKPiAgCQlzZyA9IGliX3VtZW1fYWRkX3NnX3RhYmxlKHNnLCBwYWdlX2xpc3QsIHJldCwKPiAg
CQkJZG1hX2dldF9tYXhfc2VnX3NpemUoY29udGV4dC0+ZGV2aWNlLT5kbWFfZGV2aWNlKSwKPiAg
CQkJJnVtZW0tPnNnX25lbnRzKTsKPiAtCj4gLQkJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKPiAg
CX0KPiAgCj4gIAlzZ19tYXJrX2VuZChzZyk7Cj4gLS0gCj4gMi4yNC4wCj4gCi0tIApKYW4gS2Fy
YSA8amFja0BzdXNlLmNvbT4KU1VTRSBMYWJzLCBDUgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
