Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4C3845C6
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E11F6E64B;
	Wed,  7 Aug 2019 07:26:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EB56E554;
 Tue,  6 Aug 2019 20:39:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d49e5760000>; Tue, 06 Aug 2019 13:39:18 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 06 Aug 2019 13:39:17 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 06 Aug 2019 13:39:17 -0700
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 6 Aug
 2019 20:39:16 +0000
Subject: Re: [PATCH v2 01/34] mm/gup: add make_dirty arg to
 put_user_pages_dirty_lock()
To: Ira Weiny <ira.weiny@intel.com>, <john.hubbard@gmail.com>
References: <20190804224915.28669-1-jhubbard@nvidia.com>
 <20190804224915.28669-2-jhubbard@nvidia.com>
 <20190806173945.GA4748@iweiny-DESK2.sc.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <0e232d84-e6ea-159e-91d4-77e938377161@nvidia.com>
Date: Tue, 6 Aug 2019 13:39:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190806173945.GA4748@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1565123958; bh=kP7gTuC3ZdPRsl2ZM8hKtRsMZoJPCXuUqs/7ZYFYlas=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=De7r6lQUtbn+GTEsMqljgVKTlQIrCw8ZESuRqc7w4LEYPASOCDyQM6KfNGQouIjYR
 fh0BckBJVbNT9AbXMQb66ZhMKSleBMpCp4Q67sEppT12m031guaO+mSQiN77Vubrty
 dLwAVLGyjRDyH8bKz/ie59UuEUjWXDBsQB9IGYcfiHyqrDkJ8dhLAwUMAPjRDqyeiY
 KJw8zEX2A8/HIUmoazoyVwItiLDzuGpYh0geDqgdodA5dwJzt0S2azlo+PhdmfDHXO
 6GhmRkzx66GKpfVpxeAm8ztIGHTRgebRJf3i5iJHgoMtdv7J6YmmRpepQCyIfl7KA0
 CyUb7h3ZsvM+w==
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
Cc: linux-fbdev@vger.kernel.org, Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Matthew Wilcox <willy@infradead.org>, sparclinux@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, ceph-devel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-xfs@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC82LzE5IDEwOjM5IEFNLCBJcmEgV2Vpbnkgd3JvdGU6Cj4gT24gU3VuLCBBdWcgMDQsIDIw
MTkgYXQgMDM6NDg6NDJQTSAtMDcwMCwgam9obi5odWJiYXJkQGdtYWlsLmNvbSB3cm90ZToKPj4g
RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgouLi4KPj4gLQo+PiAgLyoq
Cj4+IC0gKiBwdXRfdXNlcl9wYWdlc19kaXJ0eSgpIC0gcmVsZWFzZSBhbmQgZGlydHkgYW4gYXJy
YXkgb2YgZ3VwLXBpbm5lZCBwYWdlcwo+PiAtICogQHBhZ2VzOiAgYXJyYXkgb2YgcGFnZXMgdG8g
YmUgbWFya2VkIGRpcnR5IGFuZCByZWxlYXNlZC4KPj4gKyAqIHB1dF91c2VyX3BhZ2VzX2RpcnR5
X2xvY2soKSAtIHJlbGVhc2UgYW5kIG9wdGlvbmFsbHkgZGlydHkgZ3VwLXBpbm5lZCBwYWdlcwo+
PiArICogQHBhZ2VzOiAgYXJyYXkgb2YgcGFnZXMgdG8gYmUgbWF5YmUgbWFya2VkIGRpcnR5LCBh
bmQgZGVmaW5pdGVseSByZWxlYXNlZC4KPiAKPiBCZXR0ZXIgd291bGQgYmUuCj4gCj4gQHBhZ2Vz
OiAgYXJyYXkgb2YgcGFnZXMgdG8gYmUgcHV0CgpPSywgSSdsbCBjaGFuZ2UgdG8gdGhhdCB3b3Jk
aW5nLgoKPiAKPj4gICAqIEBucGFnZXM6IG51bWJlciBvZiBwYWdlcyBpbiB0aGUgQHBhZ2VzIGFy
cmF5Lgo+PiArICogQG1ha2VfZGlydHk6IHdoZXRoZXIgdG8gbWFyayB0aGUgcGFnZXMgZGlydHkK
Pj4gICAqCj4+ICAgKiAiZ3VwLXBpbm5lZCBwYWdlIiByZWZlcnMgdG8gYSBwYWdlIHRoYXQgaGFz
IGhhZCBvbmUgb2YgdGhlIGdldF91c2VyX3BhZ2VzKCkKPj4gICAqIHZhcmlhbnRzIGNhbGxlZCBv
biB0aGF0IHBhZ2UuCj4+ICAgKgo+PiAgICogRm9yIGVhY2ggcGFnZSBpbiB0aGUgQHBhZ2VzIGFy
cmF5LCBtYWtlIHRoYXQgcGFnZSAob3IgaXRzIGhlYWQgcGFnZSwgaWYgYQo+PiAtICogY29tcG91
bmQgcGFnZSkgZGlydHksIGlmIGl0IHdhcyBwcmV2aW91c2x5IGxpc3RlZCBhcyBjbGVhbi4gVGhl
biwgcmVsZWFzZQo+PiAtICogdGhlIHBhZ2UgdXNpbmcgcHV0X3VzZXJfcGFnZSgpLgo+PiArICog
Y29tcG91bmQgcGFnZSkgZGlydHksIGlmIEBtYWtlX2RpcnR5IGlzIHRydWUsIGFuZCBpZiB0aGUg
cGFnZSB3YXMgcHJldmlvdXNseQo+PiArICogbGlzdGVkIGFzIGNsZWFuLiBJbiBhbnkgY2FzZSwg
cmVsZWFzZXMgYWxsIHBhZ2VzIHVzaW5nIHB1dF91c2VyX3BhZ2UoKSwKPj4gKyAqIHBvc3NpYmx5
IHZpYSBwdXRfdXNlcl9wYWdlcygpLCBmb3IgdGhlIG5vbi1kaXJ0eSBjYXNlLgo+IAo+IEkgZG9u
J3QgdGhpbmsgdXNlcnMgb2YgdGhpcyBpbnRlcmZhY2UgbmVlZCB0aGlzIGxldmVsIG9mIGRldGFp
bC4gIEkgdGhpbmsKPiBzb21ldGhpbmcgbGlrZS4KPiAKPiAgKiBGb3IgZWFjaCBwYWdlIGluIHRo
ZSBAcGFnZXMgYXJyYXksIHJlbGVhc2UgdGhlIHBhZ2UuICBJZiBAbWFrZV9kaXJ0eSBpcwo+ICAq
IHRydWUsIG1hcmsgdGhlIHBhZ2UgZGlydHkgcHJpb3IgdG8gcmVsZWFzZS4KClllcywgaXQgaXMg
dG9vIHdvcmR5LCBJJ2xsIGNoYW5nZSB0byB0aGF0LgoKPiAKLi4uCj4+IC12b2lkIHB1dF91c2Vy
X3BhZ2VzX2RpcnR5X2xvY2soc3RydWN0IHBhZ2UgKipwYWdlcywgdW5zaWduZWQgbG9uZyBucGFn
ZXMpCj4+IC17Cj4+IC0JX19wdXRfdXNlcl9wYWdlc19kaXJ0eShwYWdlcywgbnBhZ2VzLCBzZXRf
cGFnZV9kaXJ0eV9sb2NrKTsKPj4gKwkvKgo+PiArCSAqIFRPRE86IHRoaXMgY2FuIGJlIG9wdGlt
aXplZCBmb3IgaHVnZSBwYWdlczogaWYgYSBzZXJpZXMgb2YgcGFnZXMgaXMKPj4gKwkgKiBwaHlz
aWNhbGx5IGNvbnRpZ3VvdXMgYW5kIHBhcnQgb2YgdGhlIHNhbWUgY29tcG91bmQgcGFnZSwgdGhl
biBhCj4+ICsJICogc2luZ2xlIG9wZXJhdGlvbiB0byB0aGUgaGVhZCBwYWdlIHNob3VsZCBzdWZm
aWNlLgo+PiArCSAqLwo+IAo+IEkgdGhpbmsgdGhpcyBjb21tZW50IGJlbG9uZ3MgdG8gdGhlIGZv
ciBsb29wIGJlbG93Li4uICBvciBqdXN0IHNvbWV0aGluZyBhYm91dAo+IGhvdyB0byBtYWtlIHRo
aXMgYW5kIHB1dF91c2VyX3BhZ2VzKCkgbW9yZSBlZmZpY2llbnQuICBJdCBpcyBvZGQsIHRoYXQg
dGhpcyBpcwo+IHRoZSBzYW1lIGNvbW1lbnQgYXMgaW4gcHV0X3VzZXJfcGFnZXMoKS4uLgoKQWN0
dWFsbHkgSSB0aGluayBJJ2xsIGp1c3QgZGVsZXRlIHRoZSBjb21tZW50IGVudGlyZWx5LCBpdCdz
IGp1c3Qgbm9pc2UgcmVhbGx5LgoKPiAKPiBUaGUgY29kZSBpcyBnb29kLiAgU28uLi4gT3RoZXIg
dGhhbiB0aGUgY29tbWVudHMuCj4gCj4gUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55
QGludGVsLmNvbT4KCgpUaGFua3MgZm9yIHRoZSByZXZpZXchCgoKdGhhbmtzLAotLSAKSm9obiBI
dWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
