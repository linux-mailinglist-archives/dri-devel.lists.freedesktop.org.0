Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB328F9DC2
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 00:08:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50E76EC1F;
	Tue, 12 Nov 2019 23:08:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 805E16EC1F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 23:08:15 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb3b5e0001>; Tue, 12 Nov 2019 15:08:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 15:08:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 15:08:15 -0800
Received: from [10.110.48.28] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 23:08:14 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Dan Williams <dan.j.williams@intel.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
 <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
 <CAPcyv4it5fxU71uXFHW_WAAXBw4suQvwWTjX0Wru8xKFoz_dbw@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <729a16cb-3947-c7cb-c57f-6c917d240665@nvidia.com>
Date: Tue, 12 Nov 2019 15:08:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4it5fxU71uXFHW_WAAXBw4suQvwWTjX0Wru8xKFoz_dbw@mail.gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573600094; bh=ZOGE9U96RXAj3ATG1sqbSZZ5kwKlu8c/XBmXyMkeZ/I=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=JvY3zmeTvnqgCyD2eBvVojVMLoe0aW2k69Nce6daGQNuZS4OsQi4vkVZmA+1GnELv
 9AW/hBWdwsnm9M2X9ccJ1Q1EuL87OWE6ERhYkDbGlO9dGbrg5s9odv3o6SDYGWmMVY
 GNUfTamy0raCrCHfMqKxT3RFwaKftzmGLH4kXtE5Nu/om60pfZAwk5XUuEq4+pDXr9
 TOA3eiznp+/2/rv+84vF++CRsbBzx7ZRqbdYYs2TfJtMqwkIwZn6qPEjYpAQ+i4CU4
 MYXtb4n7BN0I9m2qMiQj4POMqt1O9QnTa/T3NAcLAnwom6J6Dq4eXTwoMi4Hyuf3+0
 zpRS7T71BD4vw==
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
 KVM list <kvm@vger.kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Dave Chinner <david@fromorbit.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, Linux MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma <linux-rdma@vger.kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 "Linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 bpf@vger.kernel.org, Magnus Karlsson <magnus.karlsson@intel.com>,
 Jens Axboe <axboe@kernel.dk>, Netdev <netdev@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTIvMTkgMjo0MyBQTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgouLi4gCj4gQWgsIHNvcnJ5
LiBUaGlzIHdhcyB0aGUgZmlyc3QgdGltZSBJIGhhZCBsb29rZWQgYXQgdGhpcyBzZXJpZXMgYW5k
Cj4ganVtcGVkIGluIHdpdGhvdXQgcmVhZGluZyB0aGUgYmFja2dyb3VuZC4KPiAKPiBZb3VyIHBh
dGNoIGFzIGlzIGxvb2tzIG9rLCBJIGFzc3VtZSB5b3UndmUgcmVtb3ZlZCB0aGUgRk9MTF9MT05H
VEVSTQo+IHdhcm5pbmcgaW4gZ2V0X3VzZXJfcGFnZXNfcmVtb3RlIGluIGFub3RoZXIgcGF0Y2g/
Cj4gCgpBY3R1YWxseSwgSSBoYXZlbid0IGdvbmUgcXVpdGUgdGhhdCBmYXIuIEFjdHVhbGx5IHRo
aXMgcGF0Y2ggaXMgdGhlIGxhc3QKY2hhbmdlIHRvIHRoYXQgZnVuY3Rpb24uIFRoZXJlZm9yZSwg
YXQgdGhlIGVuZCBvZiB0aGlzIHBhdGNoc2V0LCAKZ2V0X3VzZXJfcGFnZXNfcmVtb3RlKCkgZW5k
cyB1cCB3aXRoIHRoaXMgY2hlY2sgaW4gaXQgd2hpY2gKaXMgYSBsZXNzLXJlc3RyaWN0aXZlIHZl
cnNpb24gb2YgdGhlIHdhcm5pbmc6CgoJLyoKCSAqIEN1cnJlbnQgRk9MTF9MT05HVEVSTSBiZWhh
dmlvciBpcyBpbmNvbXBhdGlibGUgd2l0aAoJICogRkFVTFRfRkxBR19BTExPV19SRVRSWSBiZWNh
dXNlIG9mIHRoZSBGUyBEQVggY2hlY2sgcmVxdWlyZW1lbnQgb24KCSAqIHZtYXMuIEhvd2V2ZXIs
IHRoaXMgb25seSBjb21lcyB1cCBpZiBsb2NrZWQgaXMgc2V0LCBhbmQgdGhlcmUgYXJlCgkgKiBj
YWxsZXJzIHRoYXQgZG8gcmVxdWVzdCBGT0xMX0xPTkdURVJNLCBidXQgZG8gbm90IHNldCBsb2Nr
ZWQuIFNvLAoJICogYWxsb3cgd2hhdCB3ZSBjYW4uCgkgKi8KCWlmIChndXBfZmxhZ3MgJiBGT0xM
X0xPTkdURVJNKSB7CgkJaWYgKFdBUk5fT05fT05DRShsb2NrZWQpKQoJCQlyZXR1cm4gLUVJTlZB
TDsKCX0KCklzIHRoYXQgT0ssIG9yIGRpZCB5b3Ugd2FudCB0byBnbyBmdXJ0aGVyIChwb3NzaWJs
eSBpbiBhIGZvbGxvdy11cApwYXRjaHNldCwgYXMgSSdtIGhvcGluZyB0byBnZXQgdGhpcyBvbmUg
aW4gc29vbik/ICAKCi4uLgo+Pj4gSSB0aGluayBjaGVja192bWFfZmxhZ3MoKSBzaG91bGQgZG8g
dGhlICgoRk9MTF9MT05HVEVSTSB8IEZPTExfR0VUKSAmJgo+Pj4gdm1hX2lzX2ZzZGF4KCkpIGNo
ZWNrIGFuZCB0aGF0IHdvdWxkIGFsc28gcmVtb3ZlIHRoZSBuZWVkIGZvcgo+Pj4gX19ndXBfbG9u
Z3Rlcm1fbG9ja2VkLgo+Pj4KPj4KPj4gR29vZCBpZGVhLCBidXQgdGhlcmUgaXMgc3RpbGwgdGhl
IGNhbGwgdG8gY2hlY2tfYW5kX21pZ3JhdGVfY21hX3BhZ2VzKCksCj4+IGluc2lkZSBfX2d1cF9s
b25ndGVybV9sb2NrZWQoKS4gIFNvIGl0J3MgYSBsaXR0bGUgbW9yZSBpbnZvbHZlZCBhbmQKPj4g
d2UgY2FuJ3QgdHJpdmlhbGx5IGRlbGV0ZSBfX2d1cF9sb25ndGVybV9sb2NrZWQoKSB5ZXQsIHJp
Z2h0Pwo+IAo+IFsgYWRkIEFuZWVzaCBdCj4gCj4gWWVzLCB5b3UncmUgcmlnaHQuIEkgaGFkIG92
ZXJsb29rZWQgdGhhdCBoYWQgc251Y2sgaW4gdGhlcmUuIFRoYXQgdG8KPiBtZSBzaW1pbGFybHkg
bmVlZHMgdG8gYmUgcHVzaGVkIGRvd24gaW50byB0aGUgY29yZSB3aXRoIGl0cyBvd24gRk9MTAo+
IGZsYWcsIG9yIGl0IG5lZWRzIHRvIGJlIGFuIGV4cGxpY2l0IGZpeHVwIHRoYXQgZWFjaCBjYWxs
ZXIgZG9lcyBhZnRlcgo+IGdldF91c2VyX3BhZ2VzLiBUaGUgZmFjdCB0aGF0IG1pZ3JhdGlvbiBz
aWxlbnRseSBoYXBwZW5zIGFzIGEgc2lkZQo+IGVmZmVjdCBvZiBndXAgaXMgdG9vIG1hZ2ljYWwg
Zm9yIG15IHRhc3RlLgo+IAoKWWVzLiBJdCdzIGFuIGludHJ1c2l2ZSBzaWRlIGVmZmVjdCB0aGF0
IGlzIHN1cnByaXNpbmcsIGFuZCBub3QgaW4gYSAKImhhcHB5IHN1cnByaXNlIiB3YXkuIDopIC4g
ICBGaXhpbmcgdXAgdGhlIENNQSBwYWdlcyBieSBzcGxpdHRpbmcgdGhhdApmdW5jdGlvbmFsaXR5
IGludG8gc2VwYXJhdGUgZnVuY3Rpb24gY2FsbHMgc291bmRzIGxpa2UgYW4gaW1wcm92ZW1lbnQK
d29ydGggZXhwbG9yaW5nLgoKCnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
