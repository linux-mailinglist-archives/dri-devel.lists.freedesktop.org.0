Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EFADD1004EE
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2019 13:01:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A496E49B;
	Mon, 18 Nov 2019 12:01:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 530D16E49B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:01:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 956F2B021;
 Mon, 18 Nov 2019 12:01:20 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 2A7271E4AF8; Mon, 18 Nov 2019 10:46:04 +0100 (CET)
Date: Mon, 18 Nov 2019 10:46:04 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v5 02/24] mm/gup: factor out duplicate code from four
 routines
Message-ID: <20191118094604.GC17319@quack2.suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-3-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191115055340.1825745-3-jhubbard@nvidia.com>
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
 Christoph Hellwig <hch@lst.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1IDE0LTExLTE5IDIxOjUzOjE4LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gVGhlcmUgYXJl
IGZvdXIgbG9jYXRpb25zIGluIGd1cC5jIHRoYXQgaGF2ZSBhIGZhaXIgYW1vdW50IG9mIGNvZGUK
PiBkdXBsaWNhdGlvbi4gVGhpcyBtZWFucyB0aGF0IGNoYW5naW5nIG9uZSByZXF1aXJlcyBtYWtp
bmcgdGhlIHNhbWUKPiBjaGFuZ2VzIGluIGZvdXIgcGxhY2VzLCBub3QgdG8gbWVudGlvbiByZWFk
aW5nIHRoZSBzYW1lIGNvZGUgZm91cgo+IHRpbWVzLCBhbmQgd29uZGVyaW5nIGlmIHRoZXJlIGFy
ZSBzdWJ0bGUgZGlmZmVyZW5jZXMuCj4gCj4gRmFjdG9yIG91dCB0aGUgY29tbW9uIGNvZGUgaW50
byBzdGF0aWMgZnVuY3Rpb25zLCB0aHVzIHJlZHVjaW5nIHRoZQo+IG92ZXJhbGwgbGluZSBjb3Vu
dCBhbmQgdGhlIGNvZGUncyBjb21wbGV4aXR5Lgo+IAo+IEFsc28sIHRha2UgdGhlIG9wcG9ydHVu
aXR5IHRvIHNsaWdodGx5IGltcHJvdmUgdGhlIGVmZmljaWVuY3kgb2YgdGhlCj4gZXJyb3IgY2Fz
ZXMsIGJ5IGRvaW5nIGEgbWFzcyBzdWJ0cmFjdGlvbiBvZiB0aGUgcmVmY291bnQsIHN1cnJvdW5k
ZWQKPiBieSBnZXRfcGFnZSgpL3B1dF9wYWdlKCkuCj4gCj4gQWxzbywgZnVydGhlciBzaW1wbGlm
eSAoc2xpZ2h0bHkpLCBieSB3YWl0aW5nIHVudGlsIHRoZSB0aGUgc3VjY2Vzc2Z1bAo+IGVuZCBv
ZiBlYWNoIHJvdXRpbmUsIHRvIGluY3JlbWVudCAqbnIuCj4gCj4gUmV2aWV3ZWQtYnk6IErDqXLD
tG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+IENjOiBKYW4gS2FyYSA8amFja0BzdXNl
LmN6Pgo+IENjOiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gQ2M6IENocmlzdG9w
aCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IENjOiBBbmVlc2ggS3VtYXIgSy5WIDxhbmVlc2gua3Vt
YXJAbGludXguaWJtLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJk
QG52aWRpYS5jb20+Cj4gLS0tCj4gIG1tL2d1cC5jIHwgOTUgKysrKysrKysrKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQw
IGluc2VydGlvbnMoKyksIDU1IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9tbS9ndXAu
YyBiL21tL2d1cC5jCj4gaW5kZXggODVjYWY3NmIzMDEyLi44NTg1NDFlYTMwY2UgMTAwNjQ0Cj4g
LS0tIGEvbW0vZ3VwLmMKPiArKysgYi9tbS9ndXAuYwo+IEBAIC0xOTY5LDYgKzE5NjksMjkgQEAg
c3RhdGljIGludCBfX2d1cF9kZXZpY2VfaHVnZV9wdWQocHVkX3QgcHVkLCBwdWRfdCAqcHVkcCwg
dW5zaWduZWQgbG9uZyBhZGRyLAo+ICB9Cj4gICNlbmRpZgo+ICAKPiArc3RhdGljIGludCBfX3Jl
Y29yZF9zdWJwYWdlcyhzdHJ1Y3QgcGFnZSAqcGFnZSwgdW5zaWduZWQgbG9uZyBhZGRyLAo+ICsJ
CQkgICAgIHVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQo+ICt7Cj4gKwlp
bnQgbnIgPSAwOwo+ICsJaW50IG5yX3JlY29yZGVkX3BhZ2VzID0gMDsKPiArCj4gKwlkbyB7Cj4g
KwkJcGFnZXNbbnJdID0gcGFnZTsKPiArCQlucisrOwo+ICsJCXBhZ2UrKzsKPiArCQlucl9yZWNv
cmRlZF9wYWdlcysrOwo+ICsJfSB3aGlsZSAoYWRkciArPSBQQUdFX1NJWkUsIGFkZHIgIT0gZW5k
KTsKPiArCXJldHVybiBucl9yZWNvcmRlZF9wYWdlczsKCm5yID09IG5yX3JlY29yZGVkX3BhZ2Vz
IHNvIG5vIG5lZWQgZm9yIGJvdGguLi4gQlRXLCBzdHJ1Y3R1cmluZyB0aGlzIGFzIGEKZm9yIGxv
b3Agd291bGQgYmUgcHJvYmFibHkgbW9yZSBsb2dpY2FsIGFuZCBzaG9ydGVyIG5vdzoKCglmb3Ig
KG5yID0gMDsgYWRkciAhPSBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpFKQoJCXBhZ2VzW25yKytdID0g
cGFnZSsrOwoJcmV0dXJuIG5yOwoKVGhlIHJlc3Qgb2YgdGhlIHBhdGNoIGxvb2tzIGdvb2QgdG8g
bWUuCgoJCQkJCQkJCUhvbnphCgotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNVU0UgTGFi
cywgQ1IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
