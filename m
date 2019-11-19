Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9061E1019E6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 08:00:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59CC36E02F;
	Tue, 19 Nov 2019 07:00:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7D506E02F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 07:00:35 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3930f0000>; Mon, 18 Nov 2019 23:00:32 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 18 Nov 2019 23:00:34 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 18 Nov 2019 23:00:34 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 07:00:34 +0000
Subject: Re: [PATCH v5 02/24] mm/gup: factor out duplicate code from four
 routines
To: Jan Kara <jack@suse.cz>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
 <20191115055340.1825745-3-jhubbard@nvidia.com>
 <20191118094604.GC17319@quack2.suse.cz>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <152e2ea9-edd9-f868-7731-ff467d692f5f@nvidia.com>
Date: Mon, 18 Nov 2019 23:00:33 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191118094604.GC17319@quack2.suse.cz>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574146832; bh=u3YCRE77HsuXbqK9BxFmzDLl8JhQHMG9gXXaYRfagTQ=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OHB+eUp2jQQmHLrGYBTtAkydhQax1jgPbRIdqXv/zT7mJheOoxm2jC/o00J+31bDd
 psR1uWZTYTlZpkmYbJIlMzoHbpxnwxoe7ZrZ8UMQNDddfR1HU1k+hUj3JCOx3ZRd5b
 XT8Ag7PAkGX6G4pIQ7geJmQblkDOtgu1RTN+An2f8z0fTBevVuF5GINewI0N+iPfcv
 YgagSYh5LQVW6KL8izWZSAMBRDSFlAEl3uHonusWk1CkuRAUgvh73saFcEMPgIKbUo
 7msrJOumHG3EP3Mzt2Z3Dov3XH2Wq2MWpaj0JPNxYk4UIQaUft9LMOT0FAc0/WGi6i
 OtciRBna4adWA==
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
Cc: Michal Hocko <mhocko@suse.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar
 K . V" <aneesh.kumar@linux.ibm.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTgvMTkgMTo0NiBBTSwgSmFuIEthcmEgd3JvdGU6Cj4gT24gVGh1IDE0LTExLTE5IDIx
OjUzOjE4LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IFRoZXJlIGFyZSBmb3VyIGxvY2F0aW9ucyBp
biBndXAuYyB0aGF0IGhhdmUgYSBmYWlyIGFtb3VudCBvZiBjb2RlCj4+IGR1cGxpY2F0aW9uLiBU
aGlzIG1lYW5zIHRoYXQgY2hhbmdpbmcgb25lIHJlcXVpcmVzIG1ha2luZyB0aGUgc2FtZQo+PiBj
aGFuZ2VzIGluIGZvdXIgcGxhY2VzLCBub3QgdG8gbWVudGlvbiByZWFkaW5nIHRoZSBzYW1lIGNv
ZGUgZm91cgo+PiB0aW1lcywgYW5kIHdvbmRlcmluZyBpZiB0aGVyZSBhcmUgc3VidGxlIGRpZmZl
cmVuY2VzLgo+Pgo+PiBGYWN0b3Igb3V0IHRoZSBjb21tb24gY29kZSBpbnRvIHN0YXRpYyBmdW5j
dGlvbnMsIHRodXMgcmVkdWNpbmcgdGhlCj4+IG92ZXJhbGwgbGluZSBjb3VudCBhbmQgdGhlIGNv
ZGUncyBjb21wbGV4aXR5Lgo+Pgo+PiBBbHNvLCB0YWtlIHRoZSBvcHBvcnR1bml0eSB0byBzbGln
aHRseSBpbXByb3ZlIHRoZSBlZmZpY2llbmN5IG9mIHRoZQo+PiBlcnJvciBjYXNlcywgYnkgZG9p
bmcgYSBtYXNzIHN1YnRyYWN0aW9uIG9mIHRoZSByZWZjb3VudCwgc3Vycm91bmRlZAo+PiBieSBn
ZXRfcGFnZSgpL3B1dF9wYWdlKCkuCj4+Cj4+IEFsc28sIGZ1cnRoZXIgc2ltcGxpZnkgKHNsaWdo
dGx5KSwgYnkgd2FpdGluZyB1bnRpbCB0aGUgdGhlIHN1Y2Nlc3NmdWwKPj4gZW5kIG9mIGVhY2gg
cm91dGluZSwgdG8gaW5jcmVtZW50ICpuci4KPj4KPj4gUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEds
aXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgo+PiBDYzogSmFuIEthcmEgPGphY2tAc3VzZS5jej4K
Pj4gQ2M6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KPj4gQ2M6IENocmlzdG9waCBI
ZWxsd2lnIDxoY2hAbHN0LmRlPgo+PiBDYzogQW5lZXNoIEt1bWFyIEsuViA8YW5lZXNoLmt1bWFy
QGxpbnV4LmlibS5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRA
bnZpZGlhLmNvbT4KPj4gLS0tCj4+ICBtbS9ndXAuYyB8IDk1ICsrKysrKysrKysrKysrKysrKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+ICAxIGZpbGUgY2hhbmdlZCwg
NDAgaW5zZXJ0aW9ucygrKSwgNTUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9tbS9n
dXAuYyBiL21tL2d1cC5jCj4+IGluZGV4IDg1Y2FmNzZiMzAxMi4uODU4NTQxZWEzMGNlIDEwMDY0
NAo+PiAtLS0gYS9tbS9ndXAuYwo+PiArKysgYi9tbS9ndXAuYwo+PiBAQCAtMTk2OSw2ICsxOTY5
LDI5IEBAIHN0YXRpYyBpbnQgX19ndXBfZGV2aWNlX2h1Z2VfcHVkKHB1ZF90IHB1ZCwgcHVkX3Qg
KnB1ZHAsIHVuc2lnbmVkIGxvbmcgYWRkciwKPj4gIH0KPj4gICNlbmRpZgo+PiAgCj4+ICtzdGF0
aWMgaW50IF9fcmVjb3JkX3N1YnBhZ2VzKHN0cnVjdCBwYWdlICpwYWdlLCB1bnNpZ25lZCBsb25n
IGFkZHIsCj4+ICsJCQkgICAgIHVuc2lnbmVkIGxvbmcgZW5kLCBzdHJ1Y3QgcGFnZSAqKnBhZ2Vz
KQo+PiArewo+PiArCWludCBuciA9IDA7Cj4+ICsJaW50IG5yX3JlY29yZGVkX3BhZ2VzID0gMDsK
Pj4gKwo+PiArCWRvIHsKPj4gKwkJcGFnZXNbbnJdID0gcGFnZTsKPj4gKwkJbnIrKzsKPj4gKwkJ
cGFnZSsrOwo+PiArCQlucl9yZWNvcmRlZF9wYWdlcysrOwo+PiArCX0gd2hpbGUgKGFkZHIgKz0g
UEFHRV9TSVpFLCBhZGRyICE9IGVuZCk7Cj4+ICsJcmV0dXJuIG5yX3JlY29yZGVkX3BhZ2VzOwo+
IAo+IG5yID09IG5yX3JlY29yZGVkX3BhZ2VzIHNvIG5vIG5lZWQgZm9yIGJvdGguLi4gQlRXLCBz
dHJ1Y3R1cmluZyB0aGlzIGFzIGEKPiBmb3IgbG9vcCB3b3VsZCBiZSBwcm9iYWJseSBtb3JlIGxv
Z2ljYWwgYW5kIHNob3J0ZXIgbm93Ogo+IAo+IAlmb3IgKG5yID0gMDsgYWRkciAhPSBlbmQ7IGFk
ZHIgKz0gUEFHRV9TSVpFKQo+IAkJcGFnZXNbbnIrK10gPSBwYWdlKys7Cj4gCXJldHVybiBucjsK
PiAKCk5pY2UgdG91Y2gsIEkndmUgYXBwbGllZCBpdC4KCnRoYW5rcywKLS0gCkpvaG4gSHViYmFy
ZApOVklESUEKCgoKPiBUaGUgcmVzdCBvZiB0aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZS4KPiAK
PiAJCQkJCQkJCUhvbnphCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
