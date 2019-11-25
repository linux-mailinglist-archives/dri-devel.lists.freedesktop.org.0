Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD2D108A5E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 09:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A4AA89271;
	Mon, 25 Nov 2019 08:59:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF74D89271
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 08:59:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F1475B308;
 Mon, 25 Nov 2019 08:59:16 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1906B1E0A57; Mon, 25 Nov 2019 09:59:15 +0100 (CET)
Date: Mon, 25 Nov 2019 09:59:15 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH 17/19] powerpc: book3s64: convert to pin_user_pages() and
 put_user_page()
Message-ID: <20191125085915.GB1797@quack2.suse.cz>
References: <20191125042011.3002372-1-jhubbard@nvidia.com>
 <20191125042011.3002372-18-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125042011.3002372-18-jhubbard@nvidia.com>
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
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

T24gU3VuIDI0LTExLTE5IDIwOjIwOjA5LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gMS4gQ29udmVy
dCBmcm9tIGdldF91c2VyX3BhZ2VzKCkgdG8gcGluX3VzZXJfcGFnZXMoKS4KPiAKPiAyLiBBcyBy
ZXF1aXJlZCBieSBwaW5fdXNlcl9wYWdlcygpLCByZWxlYXNlIHRoZXNlIHBhZ2VzIHZpYQo+IHB1
dF91c2VyX3BhZ2UoKS4gSW4gdGhpcyBjYXNlLCBkbyBzbyB2aWEgcHV0X3VzZXJfcGFnZXNfZGly
dHlfbG9jaygpLgo+IAo+IFRoYXQgaGFzIHRoZSBzaWRlIGVmZmVjdCBvZiBjYWxsaW5nIHNldF9w
YWdlX2RpcnR5X2xvY2soKSwgaW5zdGVhZAo+IG9mIHNldF9wYWdlX2RpcnR5KCkuIFRoaXMgaXMg
cHJvYmFibHkgbW9yZSBhY2N1cmF0ZS4KPiAKPiBBcyBDaHJpc3RvcGggSGVsbHdpZyBwdXQgaXQs
ICJzZXRfcGFnZV9kaXJ0eSgpIGlzIG9ubHkgc2FmZSBpZiB3ZSBhcmUKPiBkZWFsaW5nIHdpdGgg
YSBmaWxlIGJhY2tlZCBwYWdlIHdoZXJlIHdlIGhhdmUgcmVmZXJlbmNlIG9uIHRoZSBpbm9kZSBp
dAo+IGhhbmdzIG9mZi4iIFsxXQo+IAo+IDMuIFJlbGVhc2UgZWFjaCBwYWdlIGluIG1lbS0+aHBh
Z2VzW10gKGluc3RlYWQgb2YgbWVtLT5ocGFzW10pLCBiZWNhdXNlCj4gdGhhdCBpcyB0aGUgYXJy
YXkgdGhhdCBwaW5fbG9uZ3Rlcm1fcGFnZXMoKSBmaWxsZWQgaW4uIFRoaXMgaXMgbW9yZQo+IGFj
Y3VyYXRlIGFuZCBzaG91bGQgYmUgYSBsaXR0bGUgc2FmZXIgZnJvbSBhIG1haW50ZW5hbmNlIHBv
aW50IG9mCj4gdmlldy4KCkV4Y2VwdCB0aGF0IHRoaXMgYnJlYWtzIHRoZSBjb2RlLiBocGFnZXMg
aXMgdW5pb25lZCB3aXRoIGhwYXMuLi4KCj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCj4gCj4gU2lnbmVkLW9mZi1ieTogSm9obiBIdWJi
YXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgo+IC0tLQo+ICBhcmNoL3Bvd2VycGMvbW0vYm9vazNz
NjQvaW9tbXVfYXBpLmMgfCAxMiArKysrKy0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5z
ZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBj
L21tL2Jvb2szczY0L2lvbW11X2FwaS5jIGIvYXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2lvbW11
X2FwaS5jCj4gaW5kZXggNTZjYzg0NTIwNTc3Li4xOTYzODNlOGU1YTkgMTAwNjQ0Cj4gLS0tIGEv
YXJjaC9wb3dlcnBjL21tL2Jvb2szczY0L2lvbW11X2FwaS5jCj4gKysrIGIvYXJjaC9wb3dlcnBj
L21tL2Jvb2szczY0L2lvbW11X2FwaS5jCj4gQEAgLTEwMyw3ICsxMDMsNyBAQCBzdGF0aWMgbG9u
ZyBtbV9pb21tdV9kb19hbGxvYyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyB1
YSwKPiAgCWZvciAoZW50cnkgPSAwOyBlbnRyeSA8IGVudHJpZXM7IGVudHJ5ICs9IGNodW5rKSB7
Cj4gIAkJdW5zaWduZWQgbG9uZyBuID0gbWluKGVudHJpZXMgLSBlbnRyeSwgY2h1bmspOwo+ICAK
PiAtCQlyZXQgPSBnZXRfdXNlcl9wYWdlcyh1YSArIChlbnRyeSA8PCBQQUdFX1NISUZUKSwgbiwK
PiArCQlyZXQgPSBwaW5fdXNlcl9wYWdlcyh1YSArIChlbnRyeSA8PCBQQUdFX1NISUZUKSwgbiwK
PiAgCQkJCUZPTExfV1JJVEUgfCBGT0xMX0xPTkdURVJNLAo+ICAJCQkJbWVtLT5ocGFnZXMgKyBl
bnRyeSwgTlVMTCk7Cj4gIAkJaWYgKHJldCA9PSBuKSB7Cj4gQEAgLTE2Nyw5ICsxNjcsOCBAQCBz
dGF0aWMgbG9uZyBtbV9pb21tdV9kb19hbGxvYyhzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWdu
ZWQgbG9uZyB1YSwKPiAgCXJldHVybiAwOwo+ICAKPiAgZnJlZV9leGl0Ogo+IC0JLyogZnJlZSB0
aGUgcmVmZXJlbmNlIHRha2VuICovCj4gLQlmb3IgKGkgPSAwOyBpIDwgcGlubmVkOyBpKyspCj4g
LQkJcHV0X3BhZ2UobWVtLT5ocGFnZXNbaV0pOwo+ICsJLyogZnJlZSB0aGUgcmVmZXJlbmNlcyB0
YWtlbiAqLwo+ICsJcHV0X3VzZXJfcGFnZXMobWVtLT5ocGFnZXMsIHBpbm5lZCk7Cj4gIAo+ICAJ
dmZyZWUobWVtLT5ocGFzKTsKPiAgCWtmcmVlKG1lbSk7Cj4gQEAgLTIxMiwxMCArMjExLDkgQEAg
c3RhdGljIHZvaWQgbW1faW9tbXVfdW5waW4oc3RydWN0IG1tX2lvbW11X3RhYmxlX2dyb3VwX21l
bV90ICptZW0pCj4gIAkJaWYgKCFwYWdlKQo+ICAJCQljb250aW51ZTsKPiAgCj4gLQkJaWYgKG1l
bS0+aHBhc1tpXSAmIE1NX0lPTU1VX1RBQkxFX0dST1VQX1BBR0VfRElSVFkpCj4gLQkJCVNldFBh
Z2VEaXJ0eShwYWdlKTsKPiArCQlwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCZtZW0tPmhwYWdl
c1tpXSwgMSwKPiArCQkJCQkgIE1NX0lPTU1VX1RBQkxFX0dST1VQX1BBR0VfRElSVFkpOwoKQW5k
IHRoZSBkaXJ0eWluZyBjb25kaXRpb24gaXMgd3JvbmcgaGVyZSBhcyB3ZWxsLiBDdXJyZW50bHkg
aXQgaXMgYWx3YXlzCnRydWUuCgoJCQkJCQkJCUhvbnphCi0tIApKYW4gS2FyYSA8amFja0BzdXNl
LmNvbT4KU1VTRSBMYWJzLCBDUgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
