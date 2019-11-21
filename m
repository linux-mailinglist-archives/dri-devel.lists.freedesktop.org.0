Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7DF104DFD
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 09:32:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 712246EBA1;
	Thu, 21 Nov 2019 08:32:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 614866EB9F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 08:32:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd64bb20000>; Thu, 21 Nov 2019 00:32:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 21 Nov 2019 00:32:47 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 21 Nov 2019 00:32:47 -0800
Received: from [10.2.169.101] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 08:32:47 +0000
Subject: Re: [PATCH v7 02/24] mm/gup: factor out duplicate code from four
 routines
To: Christoph Hellwig <hch@lst.de>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
 <20191121071354.456618-3-jhubbard@nvidia.com> <20191121080356.GA24784@lst.de>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <852f6c27-8b65-547b-89e0-e8f32a4d17b9@nvidia.com>
Date: Thu, 21 Nov 2019 00:29:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191121080356.GA24784@lst.de>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574325171; bh=zDciOg6KuRn3nxO/F8s9PAXpBobtVEtvpIDiU9i7cho=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=o245NH6j1RBD/91bIgnXA2u+iVZPtUYc4XEd05QhEOZNOiZYzfw/GFcveJvKQudX5
 dLZsGgVUHhvmd1nGNx/JrZ9mxzYaJw5jBv7I9AOtjq55xyJVy978/mkepEaZsZ4Jdh
 F7Q1lJglcDgOm/TfPzXptT+ffg3dPcYqQ/YE2QHKjAn7RuUVlfvjepKyjOT8iLOeP5
 P9RGmGVhbNZZaq2buLl/ZGciWf84d+hZhxGEZwtKDXdTaeOTeOoxk+GuaJBpkc922I
 5UIDntRh0zXkYjneJ/cY0eUs62/fAinVukvPCoGn37W+7eCdxnHrxBHjSsCjqEp6Ly
 txEbXCaryPmyA==
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
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMjEvMTkgMTI6MDMgQU0sIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+IE9uIFdlZCwg
Tm92IDIwLCAyMDE5IGF0IDExOjEzOjMyUE0gLTA4MDAsIEpvaG4gSHViYmFyZCB3cm90ZToKPj4g
VGhlcmUgYXJlIGZvdXIgbG9jYXRpb25zIGluIGd1cC5jIHRoYXQgaGF2ZSBhIGZhaXIgYW1vdW50
IG9mIGNvZGUKPj4gZHVwbGljYXRpb24uIFRoaXMgbWVhbnMgdGhhdCBjaGFuZ2luZyBvbmUgcmVx
dWlyZXMgbWFraW5nIHRoZSBzYW1lCj4+IGNoYW5nZXMgaW4gZm91ciBwbGFjZXMsIG5vdCB0byBt
ZW50aW9uIHJlYWRpbmcgdGhlIHNhbWUgY29kZSBmb3VyCj4+IHRpbWVzLCBhbmQgd29uZGVyaW5n
IGlmIHRoZXJlIGFyZSBzdWJ0bGUgZGlmZmVyZW5jZXMuCj4+Cj4+IEZhY3RvciBvdXQgdGhlIGNv
bW1vbiBjb2RlIGludG8gc3RhdGljIGZ1bmN0aW9ucywgdGh1cyByZWR1Y2luZyB0aGUKPj4gb3Zl
cmFsbCBsaW5lIGNvdW50IGFuZCB0aGUgY29kZSdzIGNvbXBsZXhpdHkuCj4+Cj4+IEFsc28sIHRh
a2UgdGhlIG9wcG9ydHVuaXR5IHRvIHNsaWdodGx5IGltcHJvdmUgdGhlIGVmZmljaWVuY3kgb2Yg
dGhlCj4+IGVycm9yIGNhc2VzLCBieSBkb2luZyBhIG1hc3Mgc3VidHJhY3Rpb24gb2YgdGhlIHJl
ZmNvdW50LCBzdXJyb3VuZGVkCj4+IGJ5IGdldF9wYWdlKCkvcHV0X3BhZ2UoKS4KPj4KPj4gQWxz
bywgZnVydGhlciBzaW1wbGlmeSAoc2xpZ2h0bHkpLCBieSB3YWl0aW5nIHVudGlsIHRoZSB0aGUg
c3VjY2Vzc2Z1bAo+PiBlbmQgb2YgZWFjaCByb3V0aW5lLCB0byBpbmNyZW1lbnQgKm5yLgo+IAo+
IEFueSByZWFzb24gZm9yIHRoZSBzcHVyaW91cyB1bmRlcnNjb3JlIGluIHRoZSBmdW5jdGlvbiBu
YW1lPwoKYXJnZ2hoLCBJIGp1c3QgZml4ZWQgdGhhdCwgYnV0IGFwcGxpZWQgdGhlIGZpeCB0byB0
aGUgd3JvbmcgcGF0Y2ghIFNvIG5vdwpwYXRjaCAxNyAoIm1tL2d1cDogdHJhY2sgRk9MTF9QSU4g
cGFnZXMiKSBpcyBpbXByb3Blcmx5IHJlbmFtaW5nIGl0LCBpbnN0ZWFkCm9mIHRoaXMgcGF0Y2gg
bmFtaW5nIGl0IGNvcnJlY3RseSBpbiB0aGUgZmlyc3QgcGxhY2UuIFdpbGwgZml4LgoKPiAKPiBP
dGhlcndpc2UgdGhpcyBsb29rcyBmaW5lIGFuZCBtaWdodCBiZSBhIHdvcnRod2hpbGUgY2xlYW51
cCB0byBmZWVkCj4gQW5kcmV3IGZvciA1LjUgaW5kZXBlbmRlbnQgb2YgdGhlIGd1dCBvZiB0aGUg
Y2hhbmdlcy4KPiAKPiBSZXZpZXdlZC1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+
Cj4gCgpUaGFua3MgZm9yIHRoZSByZXZpZXdzISBTYXksIGl0IHNvdW5kcyBsaWtlIHlvdXIgdmll
dyBoZXJlIGlzIHRoYXQgdGhpcwpzZXJpZXMgc2hvdWxkIGJlIHRhcmdldGVkIGF0IDUuNiAobm90
IDUuNSksIGlzIHRoYXQgd2hhdCB5b3UgaGF2ZSBpbiBtaW5kPwpBbmQgZ2V0IHRoZSBwcmVwYXJh
dG9yeSBwYXRjaGVzICgxLTksIGFuZCBtYXliZSBldmVuIDEwLTE2KSBpbnRvIDUuNT8KCnRoYW5r
cywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
