Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B2510D4A7
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 12:23:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440E48935C;
	Fri, 29 Nov 2019 11:23:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11E778935C
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2019 11:23:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EA9F5AC82;
 Fri, 29 Nov 2019 11:23:17 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 4E8A01E0B6A; Fri, 29 Nov 2019 12:23:15 +0100 (CET)
Date: Fri, 29 Nov 2019 12:23:15 +0100
From: Jan Kara <jack@suse.cz>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 17/19] powerpc: book3s64: convert to pin_user_pages()
 and put_user_page()
Message-ID: <20191129112315.GB1121@quack2.suse.cz>
References: <20191125231035.1539120-1-jhubbard@nvidia.com>
 <20191125231035.1539120-18-jhubbard@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191125231035.1539120-18-jhubbard@nvidia.com>
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

T24gTW9uIDI1LTExLTE5IDE1OjEwOjMzLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4gMS4gQ29udmVy
dCBmcm9tIGdldF91c2VyX3BhZ2VzKCkgdG8gcGluX3VzZXJfcGFnZXMoKS4KPiAKPiAyLiBBcyBy
ZXF1aXJlZCBieSBwaW5fdXNlcl9wYWdlcygpLCByZWxlYXNlIHRoZXNlIHBhZ2VzIHZpYQo+IHB1
dF91c2VyX3BhZ2UoKS4gSW4gdGhpcyBjYXNlLCBkbyBzbyB2aWEgcHV0X3VzZXJfcGFnZXNfZGly
dHlfbG9jaygpLgo+IAo+IFRoYXQgaGFzIHRoZSBzaWRlIGVmZmVjdCBvZiBjYWxsaW5nIHNldF9w
YWdlX2RpcnR5X2xvY2soKSwgaW5zdGVhZAo+IG9mIHNldF9wYWdlX2RpcnR5KCkuIFRoaXMgaXMg
cHJvYmFibHkgbW9yZSBhY2N1cmF0ZS4KCk1heWJlIG1vcmUgYWNjdXJhdGUgYnV0IGl0IGRvZXNu
J3Qgd29yayBmb3IgbW1faW9tbXVfdW5waW4oKS4gQXMgSSdtCmNoZWNraW5nIG1tX2lvbW11X3Vu
cGluKCkgZ2V0cyBjYWxsZWQgZnJvbSBSQ1UgY2FsbGJhY2sgd2hpY2ggaXMgZXhlY3V0ZWQKaW50
ZXJydXB0IGNvbnRleHQgYW5kIHlvdSBjYW5ub3QgbG9jayBwYWdlcyBmcm9tIHN1Y2ggY29udGV4
dC4gU28geW91IG5lZWQKdG8gcXVldWUgd29yayBmcm9tIHRoZSBSQ1UgY2FsbGJhY2sgYW5kIHRo
ZW4gZG8gdGhlIHJlYWwgd29yayBmcm9tIHRoZQp3b3JrcXVldWUuLi4KCgkJCQkJCQkJSG9uemEK
Cj4gCj4gQXMgQ2hyaXN0b3BoIEhlbGx3aWcgcHV0IGl0LCAic2V0X3BhZ2VfZGlydHkoKSBpcyBv
bmx5IHNhZmUgaWYgd2UgYXJlCj4gZGVhbGluZyB3aXRoIGEgZmlsZSBiYWNrZWQgcGFnZSB3aGVy
ZSB3ZSBoYXZlIHJlZmVyZW5jZSBvbiB0aGUgaW5vZGUgaXQKPiBoYW5ncyBvZmYuIiBbMV0KPiAK
PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDE5MDcyMzE1MzY0MC5HQjcyMEBsc3Qu
ZGUKPiAKPiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4KPiBTaWduZWQtb2ZmLWJ5OiBKb2hu
IEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Cj4gLS0tCj4gIGFyY2gvcG93ZXJwYy9tbS9i
b29rM3M2NC9pb21tdV9hcGkuYyB8IDEyICsrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Bv
d2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMgYi9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQv
aW9tbXVfYXBpLmMKPiBpbmRleCA1NmNjODQ1MjA1NzcuLmZjMTY3MGE2ZmMzYyAxMDA2NDQKPiAt
LS0gYS9hcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMKPiArKysgYi9hcmNoL3Bv
d2VycGMvbW0vYm9vazNzNjQvaW9tbXVfYXBpLmMKPiBAQCAtMTAzLDcgKzEwMyw3IEBAIHN0YXRp
YyBsb25nIG1tX2lvbW11X2RvX2FsbG9jKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBs
b25nIHVhLAo+ICAJZm9yIChlbnRyeSA9IDA7IGVudHJ5IDwgZW50cmllczsgZW50cnkgKz0gY2h1
bmspIHsKPiAgCQl1bnNpZ25lZCBsb25nIG4gPSBtaW4oZW50cmllcyAtIGVudHJ5LCBjaHVuayk7
Cj4gIAo+IC0JCXJldCA9IGdldF91c2VyX3BhZ2VzKHVhICsgKGVudHJ5IDw8IFBBR0VfU0hJRlQp
LCBuLAo+ICsJCXJldCA9IHBpbl91c2VyX3BhZ2VzKHVhICsgKGVudHJ5IDw8IFBBR0VfU0hJRlQp
LCBuLAo+ICAJCQkJRk9MTF9XUklURSB8IEZPTExfTE9OR1RFUk0sCj4gIAkJCQltZW0tPmhwYWdl
cyArIGVudHJ5LCBOVUxMKTsKPiAgCQlpZiAocmV0ID09IG4pIHsKPiBAQCAtMTY3LDkgKzE2Nyw4
IEBAIHN0YXRpYyBsb25nIG1tX2lvbW11X2RvX2FsbG9jKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1
bnNpZ25lZCBsb25nIHVhLAo+ICAJcmV0dXJuIDA7Cj4gIAo+ICBmcmVlX2V4aXQ6Cj4gLQkvKiBm
cmVlIHRoZSByZWZlcmVuY2UgdGFrZW4gKi8KPiAtCWZvciAoaSA9IDA7IGkgPCBwaW5uZWQ7IGkr
KykKPiAtCQlwdXRfcGFnZShtZW0tPmhwYWdlc1tpXSk7Cj4gKwkvKiBmcmVlIHRoZSByZWZlcmVu
Y2VzIHRha2VuICovCj4gKwlwdXRfdXNlcl9wYWdlcyhtZW0tPmhwYWdlcywgcGlubmVkKTsKPiAg
Cj4gIAl2ZnJlZShtZW0tPmhwYXMpOwo+ICAJa2ZyZWUobWVtKTsKPiBAQCAtMjEyLDEwICsyMTEs
OSBAQCBzdGF0aWMgdm9pZCBtbV9pb21tdV91bnBpbihzdHJ1Y3QgbW1faW9tbXVfdGFibGVfZ3Jv
dXBfbWVtX3QgKm1lbSkKPiAgCQlpZiAoIXBhZ2UpCj4gIAkJCWNvbnRpbnVlOwo+ICAKPiAtCQlp
ZiAobWVtLT5ocGFzW2ldICYgTU1fSU9NTVVfVEFCTEVfR1JPVVBfUEFHRV9ESVJUWSkKPiAtCQkJ
U2V0UGFnZURpcnR5KHBhZ2UpOwo+ICsJCXB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soJnBhZ2Us
IDEsCj4gKwkJCQltZW0tPmhwYXNbaV0gJiBNTV9JT01NVV9UQUJMRV9HUk9VUF9QQUdFX0RJUlRZ
KTsKPiAgCj4gLQkJcHV0X3BhZ2UocGFnZSk7Cj4gIAkJbWVtLT5ocGFzW2ldID0gMDsKPiAgCX0K
PiAgfQo+IC0tIAo+IDIuMjQuMAo+IAotLSAKSmFuIEthcmEgPGphY2tAc3VzZS5jb20+ClNVU0Ug
TGFicywgQ1IKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
