Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FBB5262A
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 10:12:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9AB16E092;
	Tue, 25 Jun 2019 08:12:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FC56E092;
 Tue, 25 Jun 2019 08:12:26 +0000 (UTC)
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=hirez.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hfgXg-0003Dx-KG; Tue, 25 Jun 2019 08:11:04 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 56053209FFF54; Tue, 25 Jun 2019 10:11:03 +0200 (CEST)
Date: Tue, 25 Jun 2019 10:11:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: [RFC][PATCH] wake_up_var() memory ordering
Message-ID: <20190625081103.GU3436@hirez.programming.kicks-ass.net>
References: <20190624165012.GH3436@hirez.programming.kicks-ass.net>
 <32379.1561449061@warthog.procyon.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <32379.1561449061@warthog.procyon.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FeL4YGXndhcHsWSAlte0b7Wx3ZKgDBGUgp4zwa60pPc=; b=tuUzdHIExne/eeS1c00vc7gjS
 AB3LJq0ZQ++Fg6J9CyRBrX4gTrDnwlDJ/Tlg4VwE9EZRX0L7mpJs2iWaNLbecP/UkjiJXVhaFuinv
 efEBhY3azsP53SGPaXLJ7K4+xH3UrVJBVbab7TYd/NhRi4NM6b2joLRQHY3MMZZkKc+ZdLVuLI7OE
 dre6EZ2IAwApDLiwNd+y6XYWNYjwUZwMMPYQNsdKeZs0D9c7jfiuKmdqNZ4YkOKC/SzkotBgMJg+i
 24yIjZQ5KzGpb++2nZrAY8EI3/jnnNxtQW1CqqPB5Krupk3Igd6R4aRfeq60YT3cfWKiHmI6GoOIp
 WwO2NS7gw==;
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
Cc: Martin Brandenburg <martin@omnibond.com>, Mike Snitzer <snitzer@redhat.com>,
 linux-aio@kvack.org, David Airlie <airlied@linux.ie>,
 samba-technical@lists.samba.org, Will Deacon <will.deacon@arm.com>,
 dri-devel@lists.freedesktop.org, "J. Bruce Fields" <bfields@fieldses.org>,
 Chris Mason <clm@fb.com>, dm-devel@redhat.com, keyrings@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-afs@lists.infradead.org,
 Alasdair Kergon <agk@redhat.com>, Mike Marshall <hubcap@omnibond.com>,
 linux-cifs@vger.kernel.org, rds-devel@oss.oracle.com,
 Andreas Gruenbacher <agruenba@redhat.com>, linux-rdma@vger.kernel.org,
 James Morris <jmorris@namei.org>, cluster-devel@redhat.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
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
 linux-arm-kernel@lists.infradead.org, linux-cachefs@redhat.com,
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

Cihzb3JyeSBmb3IgY3Jvc3MtcG9zdGluZyB0byBtb2RlcmF0ZWQgbGlzdHMgYnR3LCBJJ3ZlIHNp
bmNlCiBhY3F1aXJlZCBhIHBhdGNoIHRvIGdldF9tYWludGFpbmVycy5wbCB0aGF0IHdpbCBleGNs
dWRlIHRoZW0KIGluIHRoZSBmdXR1cmUpCgpPbiBUdWUsIEp1biAyNSwgMjAxOSBhdCAwODo1MTow
MUFNICswMTAwLCBEYXZpZCBIb3dlbGxzIHdyb3RlOgo+IFBldGVyIFppamxzdHJhIDxwZXRlcnpA
aW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4gCj4gPiBJIHRyaWVkIHVzaW5nIHdha2VfdXBfdmFyKCkg
dG9kYXkgYW5kIGFjY2lkZW50YWxseSBub3RpY2VkIHRoYXQgaXQKPiA+IGRpZG4ndCBpbXBseSBh
biBzbXBfbWIoKSBhbmQgc3BlY2lmaWNhbGx5IHJlcXVpcmVzIGl0IHRocm91Z2gKPiA+IHdha2Vf
dXBfYml0KCkgLyB3YWl0cXVldWVfYWN0aXZlKCkuCj4gCj4gVGhpbmtpbmcgYWJvdXQgaXQgYWdh
aW4sIEknbSBub3Qgc3VyZSB3aHkgeW91IG5lZWQgdG8gYWRkIHRoZSBiYXJyaWVyIHdoZW4KPiB3
YWtlX3VwKCkgKHdoaWNoIHRoaXMgaXMgYSB3cmFwcGVyIGFyb3VuZCkgaXMgcmVxdWlyZWQgdG8g
aW1wb3NlIGEgYmFycmllciBhdAo+IHRoZSBmcm9udCBpZiB0aGVyZSdzIGFueXRoaW5nIHRvIHdh
a2UgdXAgKGllLiB0aGUgd2FpdCBxdWV1ZSBpc24ndCBlbXB0eSkuCj4gCj4gSWYgdGhpcyBpcyBp
bnN1ZmZpY2llbnQsIGRvZXMgaXQgbWFrZSBzZW5zZSBqdXN0IHRvIGhhdmUgd2FrZV91cCooKSBm
dW5jdGlvbnMKPiBkbyBhbiB1bmNvbmRpdGlvbmFsIHJlbGVhc2Ugb3IgZnVsbCBiYXJyaWVyIHJp
Z2h0IGF0IHRoZSBmcm9udCwgcmF0aGVyIHRoYW4gaXQKPiBiZWluZyBjb25kaXRpb25hbCBvbiBz
b21ldGhpbmcgYmVpbmcgd29rZW4gdXA/CgpUaGUgY3VycHJpdCBpcyBfX3dha2VfdXBfYml0KCkn
cyB1c2FnZSBvZiB3YWl0cXVldWVfYWN0aXZlKCk7IGl0IGlzIHRoaXMKbGF0dGVyIChzZWUgaXRz
IGNvbW1lbnQpIHRoYXQgcmVxdWlyZXMgdGhlIHNtcF9tYigpLgoKd2FrZV91cF9iaXQoKSBhbmQg
d2FrZV91cF92YXIoKSBhcmUgd3JhcHBlcnMgYXJvdW5kIF9fd2FrZV91cF9iaXQoKS4KCldpdGhv
dXQgdGhpcyBiYXJyaWVyIGl0IGlzIHBvc3NpYmxlIGZvciB0aGUgd2FpdHF1ZXVlX2FjdGl2ZSgp
IGxvYWQgdG8KYmUgaG9pc3RlZCBvdmVyIHRoZSBjb25kPXRydWUgc3RvcmUgYW5kIHRoZSByZW1v
dGUgZW5kIGNhbiBtaXNzIHRoZQpzdG9yZSBhbmQgd2UgY2FuIG1pc3MgaXRzIGVucXVldWUgYW5k
IHdlJ2xsIGFsbCBtaXNzIGEgd2FrZXVwIGFuZCBnZXQKc3R1Y2suCgpBZGRpbmcgYW4gc21wX21i
KCkgKG9yIHVzZSB3cV9oYXNfc2xlZXBlcigpKSBpbiBfX3dha2VfdXBfYml0KCkgd291bGQgYmUK
bmljZSwgYnV0IEkgZmVhciBzb21lIHBlb3BsZSB3aWxsIGNvbXBsYWluIGFib3V0IG92ZXJoZWFk
LCBlc3AuIHNpbmNlCmFib3V0IGhhbGYgdGhlIHNpdGVzIGRvbid0IG5lZWQgdGhlIGJhcnJpZXIg
ZHVlIHRvIGJlaW5nIGJlaGluZAp0ZXN0X2FuZF9jbGVhcl9iaXQoKSBhbmQgdGhlIG90aGVyIGhh
bGYgdXNpbmcgc21wX21iX19hZnRlcl9hdG9taWMoKQphZnRlciBzb21lIGNsZWFyX2JpdCooKSB2
YXJpYW50LgoKVGhlcmUncyBhIGZldyBzaXRlcyB0aGF0IHNlZW0gdG8gb3Blbi1jb2RlCndhaXRf
dmFyX2V2ZW50KCkvd2FrZV91cF92YXIoKSBhbmQgdGhvc2UgYWN0dWFsbHkgbmVlZCB0aGUgZnVs
bApzbXBfbWIoKSwgYnV0IHRoZW4gbWF5YmUgdGhleSBzaG91bGQgYmUgY29udmVydGVkIHRvIHZh
ciBpbnN0cmVhZCBvZiBiaXQKYW55d2F5LgoKPiA+IEBAIC02MTksOSArNjE0LDcgQEAgc3RhdGlj
IGludCBkdmJfdXNiX2ZlX3NsZWVwKHN0cnVjdCBkdmJfZnJvbnRlbmQgKmZlKQo+ID4gIGVycjoK
PiA+ICAJaWYgKCFhZGFwLT5zdXNwZW5kX3Jlc3VtZV9hY3RpdmUpIHsKPiA+ICAJCWFkYXAtPmFj
dGl2ZV9mZSA9IC0xOwo+IAo+IEknbSB3b25kZXJpbmcgaWYgdGhlcmUncyBhIG1pc3NpbmcgYmFy
cmllciBoZXJlLiAgU2hvdWxkIHRoZSBjbGVhcl9iaXQoKSBvbgo+IHRoZSBuZXh0IGxpbmUgYmUg
Y2xlYXJfYml0X3VubG9jaygpIG9yIGNsZWFyX2JpdF9yZWxlYXNlKCk/CgpUaGF0IGxvb2tzIHJl
YXNvbmFibGUsIGJ1dCBJJ2QgbGlrZSB0byBoZWFyIGZyb20gdGhlIERWQiBmb2xrcyBvbiB0aGF0
LgoKPiA+IC0JCWNsZWFyX2JpdChBREFQX1NMRUVQLCAmYWRhcC0+c3RhdGVfYml0cyk7Cj4gPiAt
CQlzbXBfbWJfX2FmdGVyX2F0b21pYygpOwo+ID4gLQkJd2FrZV91cF9iaXQoJmFkYXAtPnN0YXRl
X2JpdHMsIEFEQVBfU0xFRVApOwo+ID4gKwkJY2xlYXJfYW5kX3dha2VfdXBfYml0KEFEQVBfU0xF
RVAsICZhZGFwLT5zdGF0ZV9iaXRzKTsKPiA+ICAJfQo+ID4gIAo+ID4gIAlkZXZfZGJnKCZkLT51
ZGV2LT5kZXYsICIlczogcmV0PSVkXG4iLCBfX2Z1bmNfXywgcmV0KTsKPiA+IGRpZmYgLS1naXQg
YS9mcy9hZnMvZnNfcHJvYmUuYyBiL2ZzL2Fmcy9mc19wcm9iZS5jCj4gPiBpbmRleCBjZmU2MmIx
NTRmNjguLjM3N2VlMDdkNWY3NiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2Fmcy9mc19wcm9iZS5jCj4g
PiArKysgYi9mcy9hZnMvZnNfcHJvYmUuYwo+ID4gQEAgLTE4LDYgKzE4LDcgQEAgc3RhdGljIGJv
b2wgYWZzX2ZzX3Byb2JlX2RvbmUoc3RydWN0IGFmc19zZXJ2ZXIgKnNlcnZlcikKPiA+ICAKPiA+
ICAJd2FrZV91cF92YXIoJnNlcnZlci0+cHJvYmVfb3V0c3RhbmRpbmcpOwo+ID4gIAljbGVhcl9i
aXRfdW5sb2NrKEFGU19TRVJWRVJfRkxfUFJPQklORywgJnNlcnZlci0+ZmxhZ3MpOwo+ID4gKwlz
bXBfbWJfX2FmdGVyX2F0b21pYygpOwo+ID4gIAl3YWtlX3VwX2JpdCgmc2VydmVyLT5mbGFncywg
QUZTX1NFUlZFUl9GTF9QUk9CSU5HKTsKPiA+ICAJcmV0dXJuIHRydWU7Cj4gPiAgfQo+IAo+IExv
b2tpbmcgYXQgdGhpcyBhbmQgdGhlIGR2YiBvbmUsIGRvZXMgaXQgbWFrZSBzZW5zZSB0byBzdGlj
ayB0aGUgcmVsZWFzZQo+IHNlbWFudGljcyBvZiBjbGVhcl9iaXRfdW5sb2NrKCkgaW50byBjbGVh
cl9hbmRfd2FrZV91cF9iaXQoKT8KCkkgd2FzIHRoaW5raW5nIG9mIGFkZGluZyBhbm90aGVyIGhl
bHBlciwgbWF5YmUgdW5sb2NrX2FuZF93YWtlX3VwX2JpdCgpCnRoYXQgaW5jbHVkZWQgdGhhdCBl
eHRyYSBiYXJyaWVyLCBidXQgbWF5YmUgbWFraW5nIGl0IHVuY29uZGl0aW9uYWwKaXNuJ3QgdGhl
IHdvcnN0IGlkZWEuCgo+IEFsc28sIHNob3VsZCBjbGVhcl9iaXRfdW5sb2NrKCkgYmUgcmVuYW1l
ZCB0byBjbGVhcl9iaXRfcmVsZWFzZSgpIChhbmQKPiBzaW1pbGFybHkgdGVzdF9hbmRfc2V0X2Jp
dF9sb2NrKCkgLT4gdGVzdF9hbmRfc2V0X2JpdF9hY3F1aXJlKCkpIGlmIHdlIHNlZW0gdG8KPiBi
ZSB0cnlpbmcgdG8gc3RhbmRhcmRpc2Ugb24gdGhhdCB0ZXJtaW5vbG9neS4KClRoYXQgZGVmaW5p
dGVseSBtYWtlcyBzZW5zZSB0byBtZSwgdGhlcmUncyBvbmx5IDE1NyBjbGVhcl9iaXRfdW5sb2Nr
KCkKYW5kIDc2IHRlc3RfYW5kX3NldF9iaXRfbG9jaygpIHVzZXJzIChub3RlIHRoZSBhc3ltZXRy
eSBvZiB0aGF0KS4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
