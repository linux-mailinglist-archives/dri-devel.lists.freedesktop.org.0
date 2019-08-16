Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D97B90A04
	for <lists+dri-devel@lfdr.de>; Fri, 16 Aug 2019 23:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A456E394;
	Fri, 16 Aug 2019 21:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 207956E314;
 Fri, 16 Aug 2019 21:10:49 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d571be40000>; Fri, 16 Aug 2019 14:11:00 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 16 Aug 2019 14:10:48 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 16 Aug 2019 14:10:48 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 16 Aug
 2019 21:10:48 +0000
Subject: Re: [PATCH 04/15] mm: remove the pgmap field from struct hmm_vma_walk
To: Jason Gunthorpe <jgg@ziepe.ca>, Dan Williams <dan.j.williams@intel.com>
References: <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <CAPcyv4j_Mxbw+T+yXTMdkrMoS_uxg+TXXgTM_EPBJ8XfXKxytA@mail.gmail.com>
 <20190816004053.GB9929@mellanox.com>
 <CAPcyv4gMPVmY59aQAT64jQf9qXrACKOuV=DfVs4sNySCXJhkdA@mail.gmail.com>
 <20190816122414.GC5412@mellanox.com>
 <CAPcyv4jgHF05gdRoOFZORqeOBE9Z7PhagsSD+LVnjH2dc3mrFg@mail.gmail.com>
 <20190816172846.GJ5398@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <c679d6b2-e7f6-3980-6905-94d48bfb056d@nvidia.com>
Date: Fri, 16 Aug 2019 14:10:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190816172846.GJ5398@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565989860; bh=PJd/tDuHjDQeAiJVFqvLpPZ32U3ebbqcCpFuKHXBESc=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=eE4pqTBhvF6Jo8/onIHf7UdJEMa+f38IaiV8IGyr6VH7sjC6/U7NDUidvZNZrPxGi
 IWqO/9fzHXHdrzVt8mWRqyLtMRcwigQV5w8yH7jqzlnp/q4jIk+1eFwNzlZBsNe1NB
 oPhq4ZrJ8F3y8HabI5/23apg9QjOZvNlVAY4CtZWixb7IRHsZJPoCiKvJXP/lQxFz2
 wdzux9+eXoGrD7TafNg4FaiE1QOgPnlD97QPQs0F0HaZzmUKDI4WRI9CpmvKshvUrP
 ddi04plRaD3gWIBjv3Ah3JRRCsNodqPudA276IOtp9tVqGFsfBROvB1prYQhrsbnah
 NYPaeCyBQzF8w==
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
Cc: "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDgvMTYvMTkgMTA6MjggQU0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBGcmksIEF1
ZyAxNiwgMjAxOSBhdCAxMDoyMTo0MUFNIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gCj4+
PiBXZSBjYW4gZG8gYSBnZXRfZGV2X3BhZ2VtYXAgaW5zaWRlIHRoZSBwYWdlX3dhbGsgYW5kIHRv
dWNoIHRoZSBwZ21hcCwKPj4+IG9yIHdlIGNhbiBkbyB0aGUgJ2RldmljZSBtdXRleCAmJiByZXRy
eScgcGF0dGVybiBhbmQgdG91Y2ggdGhlIHBnbWFwCj4+PiBpbiB0aGUgZHJpdmVyLCB1bmRlciB0
aGF0IGxvY2suCj4+Pgo+Pj4gSG93ZXZlciBpbiBhbGwgY2FzZXMgdGhlIGN1cnJlbnQgZ2V0X2Rl
dl9wYWdlbWFwKCkncyBpbiB0aGUgcGFnZSB3YWxrCj4+PiBhcmUgbm90IG5lY2Vzc2FyeSwgYW5k
IHdlIGNhbiBkZWxldGUgdGhlbS4KPj4KPj4gWWVzLCBhcyBsb25nIGFzICdzdHJ1Y3QgcGFnZScg
aW5zdGFuY2VzIHJlc3VsdGluZyBmcm9tIHRoYXQgbG9va3VwIGFyZQo+PiBub3QgcGFzc2VkIG91
dHNpZGUgb2YgdGhhdCBsb2NrLgo+IAo+IEluZGVlZC4KPiAKPiBBbHNvLCBJIHdhcyByZWZsZWN0
aW5nIG92ZXIgbHVuY2ggdGhhdCB0aGUgaG1tX3JhbmdlX2ZhdWx0IHNob3VsZCBvbmx5Cj4gcmV0
dXJuIERFVklDRV9QUklWQVRFIHBhZ2VzIGZvciB0aGUgY2FsbGVyJ3MgZGV2aWNlIChzZWUgb3Ro
ZXIgdGhyZWFkCj4gd2l0aCBIQ0gpLCBhbmQgaW4gdGhpcyBjYXNlLCB0aGUgY2FsbGVyIHNob3Vs
ZCBhbHNvIGJlIHJlc3BvbnNpYmxlIHRvCj4gZW5zdXJlIHRoYXQgdGhlIGRyaXZlciBpcyBub3Qg
Y2FsbGluZyBobW1fcmFuZ2VfZmF1bHQgYXQgdGhlIHNhbWUgdGltZQo+IGl0IGlzIGRlbGV0aW5n
IGl0J3Mgb3duIERFVklDRV9QUklWQVRFIG1hcHBpbmcgLSBpZSBieSBmZW5jaW5nIGl0cwo+IHBh
Z2UgZmF1bHQgaGFuZGxlci4KClllcywgdGhhdCB3b3VsZCBtYWtlIGl0IGEgb25lIHN0ZXAgcHJv
Y2VzcyB0byBhY2Nlc3MgYW5vdGhlcgpkZXZpY2UncyBtaWdyYXRlZCBtZW1vcnkgcGFnZXMuClJp
Z2h0IG5vdywgaXQgaGFzIHRvIGJlIGEgdHdvIHN0ZXAgcHJvY2VzcyB3aGVyZSB0aGUgY2FsbGVy
IGNhbGxzCmhtbV9yYW5nZV9mYXVsdCwgY2hlY2sgdGhlIHN0cnVjdCBwYWdlIHRvIHNlZSBpZiBp
dCBpcyBkZXZpY2UKcHJpdmF0ZSBhbmQgbm90IG93bmVkLCB0aGVuIGNhbGwgaG1tX3JhbmdlX2Zh
dWx0IGFnYWluIHdpdGgKcmFuZ2UtPnBmbnNbaV0gfD0gcmFuZ2UtPmZsYWdzW0hNTV9QRk5fREVW
SUNFX1BSSVZBVEVdIHRvIGNhdXNlCnRoZSBvdGhlciBkZXZpY2UgdG8gbWlncmF0ZSB0aGUgcGFn
ZSBiYWNrIHRvIHN5c3RlbSBtZW1vcnkuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
