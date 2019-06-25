Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA45952545
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:51:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75162897D4;
	Tue, 25 Jun 2019 07:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D94897EF;
 Tue, 25 Jun 2019 07:51:37 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D5019307D932;
 Tue, 25 Jun 2019 07:51:26 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-120-57.rdu2.redhat.com
 [10.10.120.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AC7AF6085B;
 Tue, 25 Jun 2019 07:51:02 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [RFC][PATCH] wake_up_var() memory ordering
MIME-Version: 1.0
Content-ID: <32378.1561449061.1@warthog.procyon.org.uk>
Date: Tue, 25 Jun 2019 08:51:01 +0100
Message-ID: <32379.1561449061@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.48]); Tue, 25 Jun 2019 07:51:37 +0000 (UTC)
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
Cc: Martin Brandenburg <martin@omnibond.com>, linux-cachefs@redhat.com,
 Mike Snitzer <snitzer@redhat.com>, linux-aio@kvack.org,
 David Airlie <airlied@linux.ie>, samba-technical@lists.samba.org,
 Will Deacon <will.deacon@arm.com>, dri-devel@lists.freedesktop.org,
 dhowells@redhat.com, Chris Mason <clm@fb.com>, dm-devel@redhat.com,
 keyrings@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 linux-afs@lists.infradead.org, Alasdair Kergon <agk@redhat.com>,
 Mike Marshall <hubcap@omnibond.com>, linux-cifs@vger.kernel.org,
 rds-devel@oss.oracle.com, Andreas Gruenbacher <agruenba@redhat.com>,
 linux-rdma@vger.kernel.org, James Morris <jmorris@namei.org>,
 cluster-devel@redhat.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Paul McKenney <paulmck@linux.vnet.ibm.com>, intel-gfx@lists.freedesktop.org,
 devel@lists.orangefs.org, "Serge E. Hallyn" <serge@hallyn.com>,
 Santosh Shilimkar <santosh.shilimkar@oracle.com>,
 Johan Hedberg <johan.hedberg@gmail.com>, Marcel Holtmann <marcel@holtmann.org>,
 Sean Wang <sean.wang@mediatek.com>, Josef Bacik <josef@toxicpanda.com>,
 linux-fsdevel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Sterba <dsterba@suse.com>,
 MauroCarvalho Chehab <mchehab@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 linux-arm-kernel@lists.infradead.org, "J. Bruce Fields" <bfields@fieldses.org>,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Steve French <sfrench@samba.org>,
 linux-bluetooth@vger.kernel.org, linux-security-module@vger.kernel.org,
 Benjamin LaHaise <bcrl@kvack.org>, Bob Peterson <rpeterso@redhat.com>,
 linux-media@vger.kernel.org, Anna Schumaker <anna.schumaker@netapp.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGV0ZXIgWmlqbHN0cmEgPHBldGVyekBpbmZyYWRlYWQub3JnPiB3cm90ZToKCj4gSSB0cmllZCB1
c2luZyB3YWtlX3VwX3ZhcigpIHRvZGF5IGFuZCBhY2NpZGVudGFsbHkgbm90aWNlZCB0aGF0IGl0
Cj4gZGlkbid0IGltcGx5IGFuIHNtcF9tYigpIGFuZCBzcGVjaWZpY2FsbHkgcmVxdWlyZXMgaXQg
dGhyb3VnaAo+IHdha2VfdXBfYml0KCkgLyB3YWl0cXVldWVfYWN0aXZlKCkuCgpUaGlua2luZyBh
Ym91dCBpdCBhZ2FpbiwgSSdtIG5vdCBzdXJlIHdoeSB5b3UgbmVlZCB0byBhZGQgdGhlIGJhcnJp
ZXIgd2hlbgp3YWtlX3VwKCkgKHdoaWNoIHRoaXMgaXMgYSB3cmFwcGVyIGFyb3VuZCkgaXMgcmVx
dWlyZWQgdG8gaW1wb3NlIGEgYmFycmllciBhdAp0aGUgZnJvbnQgaWYgdGhlcmUncyBhbnl0aGlu
ZyB0byB3YWtlIHVwIChpZS4gdGhlIHdhaXQgcXVldWUgaXNuJ3QgZW1wdHkpLgoKSWYgdGhpcyBp
cyBpbnN1ZmZpY2llbnQsIGRvZXMgaXQgbWFrZSBzZW5zZSBqdXN0IHRvIGhhdmUgd2FrZV91cCoo
KSBmdW5jdGlvbnMKZG8gYW4gdW5jb25kaXRpb25hbCByZWxlYXNlIG9yIGZ1bGwgYmFycmllciBy
aWdodCBhdCB0aGUgZnJvbnQsIHJhdGhlciB0aGFuIGl0CmJlaW5nIGNvbmRpdGlvbmFsIG9uIHNv
bWV0aGluZyBiZWluZyB3b2tlbiB1cD8KCj4gQEAgLTYxOSw5ICs2MTQsNyBAQCBzdGF0aWMgaW50
IGR2Yl91c2JfZmVfc2xlZXAoc3RydWN0IGR2Yl9mcm9udGVuZCAqZmUpCj4gIGVycjoKPiAgCWlm
ICghYWRhcC0+c3VzcGVuZF9yZXN1bWVfYWN0aXZlKSB7Cj4gIAkJYWRhcC0+YWN0aXZlX2ZlID0g
LTE7CgpJJ20gd29uZGVyaW5nIGlmIHRoZXJlJ3MgYSBtaXNzaW5nIGJhcnJpZXIgaGVyZS4gIFNo
b3VsZCB0aGUgY2xlYXJfYml0KCkgb24KdGhlIG5leHQgbGluZSBiZSBjbGVhcl9iaXRfdW5sb2Nr
KCkgb3IgY2xlYXJfYml0X3JlbGVhc2UoKT8KCj4gLQkJY2xlYXJfYml0KEFEQVBfU0xFRVAsICZh
ZGFwLT5zdGF0ZV9iaXRzKTsKPiAtCQlzbXBfbWJfX2FmdGVyX2F0b21pYygpOwo+IC0JCXdha2Vf
dXBfYml0KCZhZGFwLT5zdGF0ZV9iaXRzLCBBREFQX1NMRUVQKTsKPiArCQljbGVhcl9hbmRfd2Fr
ZV91cF9iaXQoQURBUF9TTEVFUCwgJmFkYXAtPnN0YXRlX2JpdHMpOwo+ICAJfQo+ICAKPiAgCWRl
dl9kYmcoJmQtPnVkZXYtPmRldiwgIiVzOiByZXQ9JWRcbiIsIF9fZnVuY19fLCByZXQpOwo+IGRp
ZmYgLS1naXQgYS9mcy9hZnMvZnNfcHJvYmUuYyBiL2ZzL2Fmcy9mc19wcm9iZS5jCj4gaW5kZXgg
Y2ZlNjJiMTU0ZjY4Li4zNzdlZTA3ZDVmNzYgMTAwNjQ0Cj4gLS0tIGEvZnMvYWZzL2ZzX3Byb2Jl
LmMKPiArKysgYi9mcy9hZnMvZnNfcHJvYmUuYwo+IEBAIC0xOCw2ICsxOCw3IEBAIHN0YXRpYyBi
b29sIGFmc19mc19wcm9iZV9kb25lKHN0cnVjdCBhZnNfc2VydmVyICpzZXJ2ZXIpCj4gIAo+ICAJ
d2FrZV91cF92YXIoJnNlcnZlci0+cHJvYmVfb3V0c3RhbmRpbmcpOwo+ICAJY2xlYXJfYml0X3Vu
bG9jayhBRlNfU0VSVkVSX0ZMX1BST0JJTkcsICZzZXJ2ZXItPmZsYWdzKTsKPiArCXNtcF9tYl9f
YWZ0ZXJfYXRvbWljKCk7Cj4gIAl3YWtlX3VwX2JpdCgmc2VydmVyLT5mbGFncywgQUZTX1NFUlZF
Ul9GTF9QUk9CSU5HKTsKPiAgCXJldHVybiB0cnVlOwo+ICB9CgpMb29raW5nIGF0IHRoaXMgYW5k
IHRoZSBkdmIgb25lLCBkb2VzIGl0IG1ha2Ugc2Vuc2UgdG8gc3RpY2sgdGhlIHJlbGVhc2UKc2Vt
YW50aWNzIG9mIGNsZWFyX2JpdF91bmxvY2soKSBpbnRvIGNsZWFyX2FuZF93YWtlX3VwX2JpdCgp
PwoKQWxzbywgc2hvdWxkIGNsZWFyX2JpdF91bmxvY2soKSBiZSByZW5hbWVkIHRvIGNsZWFyX2Jp
dF9yZWxlYXNlKCkgKGFuZApzaW1pbGFybHkgdGVzdF9hbmRfc2V0X2JpdF9sb2NrKCkgLT4gdGVz
dF9hbmRfc2V0X2JpdF9hY3F1aXJlKCkpIGlmIHdlIHNlZW0gdG8KYmUgdHJ5aW5nIHRvIHN0YW5k
YXJkaXNlIG9uIHRoYXQgdGVybWlub2xvZ3kuCgpEYXZpZApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
