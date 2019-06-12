Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAB842568
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2019 14:20:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2BD089483;
	Wed, 12 Jun 2019 12:20:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa2.bahnhof.se (ste-pvt-msa2.bahnhof.se
 [213.80.101.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6510F89483
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 12:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTP id B32C43F792;
 Wed, 12 Jun 2019 14:20:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -3.099
X-Spam-Level: 
X-Spam-Status: No, score=-3.099 tagged_above=-999 required=6.31
 tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 URIBL_RED=0.001] autolearn=ham autolearn_force=no
Received: from ste-pvt-msa2.bahnhof.se ([127.0.0.1])
 by localhost (ste-ftg-msa2.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YFDHihGaaJKs; Wed, 12 Jun 2019 14:20:05 +0200 (CEST)
Received: from mail1.shipmail.org (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35]) (Authenticated sender: mb878879)
 by ste-pvt-msa2.bahnhof.se (Postfix) with ESMTPA id D94A63F771;
 Wed, 12 Jun 2019 14:20:03 +0200 (CEST)
Received: from localhost.localdomain (h-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id 6C3313619A3;
 Wed, 12 Jun 2019 14:20:03 +0200 (CEST)
Subject: Re: [PATCH v5 3/9] mm: Add write-protect and clean utilities for
 address space ranges
To: Christoph Hellwig <hch@infradead.org>
References: <20190612064243.55340-1-thellstrom@vmwopensource.org>
 <20190612064243.55340-4-thellstrom@vmwopensource.org>
 <20190612112349.GA20226@infradead.org>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28VMware=29?=
 <thellstrom@vmwopensource.org>
Organization: VMware Inc.
Message-ID: <a004e1a5-bdc5-6508-039e-8d97a9d3cb68@vmwopensource.org>
Date: Wed, 12 Jun 2019 14:20:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190612112349.GA20226@infradead.org>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=vmwopensource.org; s=mail; t=1560342003;
 bh=6NfMWfvQeoRy9SPu4DRek4214/12osldJKiSUF/Om8o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=g9JQd7iXbBFiJ9k/DFvRCemp/a055P3v1B/2XGHSPrmLckFXXamHhLxVJb7ZMt9f5
 jYLGqeoMp1N46VhXUk47+FPdynyWNASQeTHzpZ9jHQ6CUrTYeWqqkzDzRovkQI4o8Z
 Sf04V6HvJKonDRhebjhwGvZ/BTi//2F1blpTwSKE=
X-Mailman-Original-Authentication-Results: ste-pvt-msa2.bahnhof.se;
 dkim=pass (1024-bit key;
 unprotected) header.d=vmwopensource.org header.i=@vmwopensource.org
 header.b=g9JQd7iX; 
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: ste-ftg-msa2.bahnhof.se
 (amavisd-new); 
 dkim=pass (1024-bit key) header.d=vmwopensource.org
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Thomas Hellstrom <thellstrom@vmware.com>, Michal Hocko <mhocko@suse.com>,
 Rik van Riel <riel@surriel.com>, pv-drivers@vmware.com,
 Minchan Kim <minchan@kernel.org>, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Peter Zijlstra <peterz@infradead.org>,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-graphics-maintainer@vmware.com, Matthew Wilcox <willy@infradead.org>,
 Huang Ying <ying.huang@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 nadav.amit@gmail.com, Souptick Joarder <jrdr.linux@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gNi8xMi8xOSAxOjIzIFBNLCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiBPbiBXZWQsIEp1
biAxMiwgMjAxOSBhdCAwODo0MjozN0FNICswMjAwLCBUaG9tYXMgSGVsbHN0csO2bSAoVk13YXJl
KSB3cm90ZToKPj4gRnJvbTogVGhvbWFzIEhlbGxzdHJvbSA8dGhlbGxzdHJvbUB2bXdhcmUuY29t
Pgo+Pgo+PiBBZGQgdHdvIHV0aWxpdGllcyB0byBhKSB3cml0ZS1wcm90ZWN0IGFuZCBiKSBjbGVh
biBhbGwgcHRlcyBwb2ludGluZyBpbnRvCj4+IGEgcmFuZ2Ugb2YgYW4gYWRkcmVzcyBzcGFjZS4K
Pj4gVGhlIHV0aWxpdGllcyBhcmUgaW50ZW5kZWQgdG8gYWlkIGluIHRyYWNraW5nIGRpcnR5IHBh
Z2VzIChlaXRoZXIKPj4gZHJpdmVyLWFsbG9jYXRlZCBzeXN0ZW0gbWVtb3J5IG9yIHBjaSBkZXZp
Y2UgbWVtb3J5KS4KPj4gVGhlIHdyaXRlLXByb3RlY3QgdXRpbGl0eSBzaG91bGQgYmUgdXNlZCBp
biBjb25qdW5jdGlvbiB3aXRoCj4+IHBhZ2VfbWt3cml0ZSgpIGFuZCBwZm5fbWt3cml0ZSgpIHRv
IHRyaWdnZXIgd3JpdGUgcGFnZS1mYXVsdHMgb24gcGFnZQo+PiBhY2Nlc3Nlcy4gVHlwaWNhbGx5
IG9uZSB3b3VsZCB3YW50IHRvIHVzZSB0aGlzIG9uIHNwYXJzZSBhY2Nlc3NlcyBpbnRvCj4+IGxh
cmdlIG1lbW9yeSByZWdpb25zLiBUaGUgY2xlYW4gdXRpbGl0eSBzaG91bGQgYmUgdXNlZCB0byB1
dGlsaXplCj4+IGhhcmR3YXJlIGRpcnR5aW5nIGZ1bmN0aW9uYWxpdHkgYW5kIGF2b2lkIHRoZSBv
dmVyaGVhZCBvZiBwYWdlLWZhdWx0cywKPj4gdHlwaWNhbGx5IG9uIGxhcmdlIGFjY2Vzc2VzIGlu
dG8gc21hbGwgbWVtb3J5IHJlZ2lvbnMuCj4gUGxlYXNlIHVzZSBFWFBPUlRfU1lNQk9MX0dQTCwg
anVzdCBsaWtlIGZvciBhcHBseV90b19wYWdlX3JhbmdlIGFuZAo+IGZyaWVuZHMuCgpTb3VuZHMg
cmVhc29uYWJsZSBpZiB0aGlzIHVzZXMgYWxyZWFkeSBFWFBPUlRfU1lNQk9MX0dQTCdkIApmdW5j
dGlvbmFsaXR5LiBJJ2xsIHJlc3Bpbi4KCj4gICAgQWxzbyBpbiBnZW5lcmFsIG5ldyBjb3JlIGZ1
bmN0aW9uYWxpdHkgbGlrZSB0aGlzIHNob3VsZCBnbwo+IGFsb25nIHdpdGggdGhlIGFjdHVhbCB1
c2VyLCB3ZSBkb24ndCBuZWVkIHRvIHJlcGVhdCB0aGUgaG1tIGRpc2FzdGVyLgoKSSBzZWUgaW4g
eW91ciBsYXRlciBtZXNzYWdlIHRoYXQgeW91IG5vdGljZWQgdGhlIG90aGVyIHBhdGNoZXMuIFRo
ZXJlJ3MgCmFsc28gdXNlci1zcGFjZSBmdW5jdGlvbmFsaXR5IGluIG1lc2EgdGhhdCBleGNlcmNp
c2VzIHRoaXMuCgovVGhvbWFzCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
