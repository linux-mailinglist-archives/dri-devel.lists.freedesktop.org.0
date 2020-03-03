Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4721784CE
	for <lists+dri-devel@lfdr.de>; Tue,  3 Mar 2020 22:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD186E0FA;
	Tue,  3 Mar 2020 21:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 303 seconds by postgrey-1.36 at gabe;
 Tue, 03 Mar 2020 21:20:26 UTC
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6636E0FA;
 Tue,  3 Mar 2020 21:20:26 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e5ec8c20000>; Tue, 03 Mar 2020 13:14:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 03 Mar 2020 13:15:23 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 03 Mar 2020 13:15:23 -0800
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Mar
 2020 21:15:21 +0000
Subject: Re: [PATCH v2] nouveau/hmm: map pages after migration
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200303010023.2983-1-rcampbell@nvidia.com>
 <20200303124229.GH26318@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <1f27ac9e-7ddf-6e4f-25ea-063ef6c78761@nvidia.com>
Date: Tue, 3 Mar 2020 13:15:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200303124229.GH26318@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1583270082; bh=22wphWyEQ9kA/NT134DIsydKvoJeEto8s37Q83fcwtM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=I3g3W9bniGHs2rCu0yfLWPfwG56cNXGXLhCicraDzGKkb8e8gDWo+Z8OzaNStF2hu
 y3pYgrOQBhye2JydvTdoCV80OZvDgk5j81+ak7Zq2hHmG07zCQUH2Df5BLAaJajL0C
 Xjb7yXcjyaBSRn+6ANiN9Cocmi4gH/WT0MKD7iDsS9f5EEQMqToUxA3wTmt8msDvmf
 7qHk5rrgkRKLNqpsboRa/an6DDqsJ7qWGmLT8mf5YdHQB93cIuMlydQHqkNU3rvTY6
 rhVXu0wQdLr/wATCoZe0XCmCGMZN2smS+n55V57w4wiyJiOnxXbX34fiMJ6MTiG68I
 ocqAAhJ0YEmjQ==
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
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jerome Glisse <jglisse@redhat.com>,
 Ben Skeggs <bskeggs@redhat.com>, John
 Hubbard <jhubbard@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ck9uIDMvMy8yMCA0OjQyIEFNLCBKYXNvbiBHdW50aG9ycGUgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MDIsIDIwMjAgYXQgMDU6MDA6MjNQTSAtMDgwMCwgUmFscGggQ2FtcGJlbGwgd3JvdGU6Cj4+IFdo
ZW4gbWVtb3J5IGlzIG1pZ3JhdGVkIHRvIHRoZSBHUFUsIGl0IGlzIGxpa2VseSB0byBiZSBhY2Nl
c3NlZCBieSBHUFUKPj4gY29kZSBzb29uIGFmdGVyd2FyZHMuIEluc3RlYWQgb2Ygd2FpdGluZyBm
b3IgYSBHUFUgZmF1bHQsIG1hcCB0aGUKPj4gbWlncmF0ZWQgbWVtb3J5IGludG8gdGhlIEdQVSBw
YWdlIHRhYmxlcyB3aXRoIHRoZSBzYW1lIGFjY2VzcyBwZXJtaXNzaW9ucwo+PiBhcyB0aGUgc291
cmNlIENQVSBwYWdlIHRhYmxlIGVudHJpZXMuIFRoaXMgcHJlc2VydmVzIGNvcHkgb24gd3JpdGUK
Pj4gc2VtYW50aWNzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBi
ZWxsQG52aWRpYS5jb20+Cj4+IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPj4g
Q2M6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KPj4gQ2M6ICJKw6lyw7RtZSBH
bGlzc2UiIDxqZ2xpc3NlQHJlZGhhdC5jb20+Cj4+IENjOiBCZW4gU2tlZ2dzIDxic2tlZ2dzQHJl
ZGhhdC5jb20+Cj4+IC0tLQo+Pgo+PiBPcmlnaW5hbGx5IHRoaXMgcGF0Y2ggd2FzIHRhcmdldGVk
IGZvciBKYXNvbidzIHJkbWEgdHJlZSBzaW5jZSBvdGhlciBITU0KPj4gcmVsYXRlZCBjaGFuZ2Vz
IHdlcmUgcXVldWVkIHRoZXJlLiBOb3cgdGhhdCB0aG9zZSBoYXZlIGJlZW4gbWVyZ2VkLCB0aGlz
Cj4+IHBhdGNoIGp1c3QgY29udGFpbnMgY2hhbmdlcyB0byBub3V2ZWF1IHNvIGl0IGNvdWxkIGdv
IHRocm91Z2ggYW55IHRyZWUuCj4+IEkgZ3Vlc3MgQmVuIFNrZWdncycgdHJlZSB3b3VsZCBiZSBh
cHByb3ByaWF0ZS4KPiAKPiBZZXAKPiAKPj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IG5vdXZlYXVf
cGZubWFwX2FyZ3MgKgo+PiArbm91dmVhdV9wZm5zX3RvX2FyZ3Modm9pZCAqcGZucykKPiAKPiBk
b24ndCB1c2Ugc3RhdGljIGlubGluZSBpbnNpZGUgQyBmaWxlcwoKT0suCgo+PiArewo+PiArCXN0
cnVjdCBudmlmX3ZtbV9wZm5tYXBfdjAgKnAgPQo+PiArCQljb250YWluZXJfb2YocGZucywgc3Ry
dWN0IG52aWZfdm1tX3Bmbm1hcF92MCwgcGh5cyk7Cj4+ICsKPj4gKwlyZXR1cm4gY29udGFpbmVy
X29mKHAsIHN0cnVjdCBub3V2ZWF1X3Bmbm1hcF9hcmdzLCBwKTsKPiAKPiBBbmQgdGhpcyBzaG91
bGQganVzdCBiZQo+IAo+ICAgICByZXR1cm4gY29udGFpbmVyX29mKHBmbnMsIHN0cnVjdCBub3V2
ZWF1X3Bmbm1hcF9hcmdzLCBwLnBoeXMpOwoKTXVjaCBzaW1wbGVyLCB0aGFua3MuCgo+PiArc3Rh
dGljIHN0cnVjdCBub3V2ZWF1X3N2bW0gKgo+PiArbm91dmVhdV9maW5kX3N2bW0oc3RydWN0IG5v
dXZlYXVfc3ZtICpzdm0sIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQo+PiArewo+PiArCXN0cnVjdCBu
b3V2ZWF1X2l2bW0gKml2bW07Cj4+ICsKPj4gKwlsaXN0X2Zvcl9lYWNoX2VudHJ5KGl2bW0sICZz
dm0tPmluc3QsIGhlYWQpIHsKPj4gKwkJaWYgKGl2bW0tPnN2bW0tPm5vdGlmaWVyLm1tID09IG1t
KQo+PiArCQkJcmV0dXJuIGl2bW0tPnN2bW07Cj4+ICsJfQo+PiArCXJldHVybiBOVUxMOwo+PiAr
fQo+IAo+IElzIHRoaXMgcmUtaW1wbGVtZW50aW5nIG1tdV9ub3RpZmllcl9nZXQoKSA/Cj4gCj4g
SmFzb24KCk5vdCBxdWl0ZS4gVGhpcyBpcyBiZWluZyBjYWxsZWQgZnJvbSBhbiBpb2N0bCgpIGNh
bGwgb24gdGhlIEdQVSBkZXZpY2UKZmlsZSB3aGljaCBjYWxscyBub3V2ZWF1X3N2bW1fYmluZCgp
IHdoaWNoIGxvY2tzIG1tYXBfc2VtIGZvciByZWFkaW5nLAp3YWxrcyB0aGUgdm1hcyBmb3IgdGhl
IGFkZHJlc3MgcmFuZ2UgZ2l2ZW4gaW4gdGhlIGlvY3RsKCkgZGF0YSwgYW5kIG1pZ3JhdGVzCnRo
ZSBwYWdlcyB0byB0aGUgR1BVIG1lbW9yeS4KbW11X25vdGlmaWVyX2dldCgpIHdvdWxkIHRyeSB0
byBsb2NrIG1tYXBfc2VtIGZvciB3cml0aW5nIHNvIHRoYXQgd291bGQgZGVhZGxvY2suCkJ1dCBp
dCBpcyBzaW1pbGFyIGluIHRoYXQgdGhlIEdQVSBzcGVjaWZpYyBwcm9jZXNzIGNvbnRleHQgKG5v
dXZlYXVfc3ZtbSkgbmVlZHMKdG8gYmUgZm91bmQgZm9yIHRoZSBnaXZlbiBpb2N0bCBjYWxsZXIu
CklmIGZpbmRfZ2V0X21tdV9ub3RpZmllcigpIHdhcyBleHBvcnRlZCwgSSB0aGluayB0aGF0IGNv
dWxkIHdvcmsuCk5vdyB0aGF0IEkgbG9vayBhdCB0aGlzIGFnYWluLCB0aGVyZSBpcyBhbiBlYXNp
ZXIgd2F5IHRvIGZpbmQgdGhlIHN2bW0gYW5kIEkgc2VlCnNvbWUgb3RoZXIgYnVncyB0aGF0IG5l
ZWQgZml4aW5nLiBJJ2xsIHBvc3QgYSB2MyBhcyBzb29uIGFzIEkgZ2V0IHRob3NlIHdyaXR0ZW4K
YW5kIHRlc3RlZC4KClRoYW5rcyBmb3IgdGhlIHJldmlldy4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
