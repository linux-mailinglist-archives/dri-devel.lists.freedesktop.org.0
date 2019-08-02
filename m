Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF82481365
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 09:36:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 713086E2CC;
	Mon,  5 Aug 2019 07:34:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4EC6EF4E;
 Fri,  2 Aug 2019 18:49:47 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d4485cb0000>; Fri, 02 Aug 2019 11:49:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 02 Aug 2019 11:49:46 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 02 Aug 2019 11:49:46 -0700
Received: from [10.2.171.217] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 2 Aug
 2019 18:49:45 +0000
Subject: Re: [PATCH 06/34] drm/i915: convert put_page() to put_user_page*()
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Andrew Morton
 <akpm@linux-foundation.org>, <john.hubbard@gmail.com>
References: <20190802022005.5117-1-jhubbard@nvidia.com>
 <20190802022005.5117-7-jhubbard@nvidia.com>
 <156473756254.19842.12384378926183716632@jlahtine-desk.ger.corp.intel.com>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <7d9a9c57-4322-270b-b636-7214019f87e9@nvidia.com>
Date: Fri, 2 Aug 2019 11:48:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <156473756254.19842.12384378926183716632@jlahtine-desk.ger.corp.intel.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Approved-At: Mon, 05 Aug 2019 07:34:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1564771787; bh=S6tEtRzvj2UDxwZj4cj8eQvbGOkT9/8mALKEDpv4kUk=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Y3fHk+98nOh18vMhIm6oxYzfGEP8O2OFNum6iQoB2YYU2gm7Ou5mcASXhMaNa0kba
 BTSi3qY+ef5NxNUgS+af9aZz1Xc0xlcalUQEIFNZpatz8EG3c4tRcTzbThhIfTheTe
 KUIJTej9BZ3lpHo5Yb8ku9IclBxYdC+NGE9oZ9fgbh7w5eghYXLn/xfb7XAp0GzwuH
 IJ6d9B7kXtD+UvM1BqXw9xtNu+yigVn+igq6/71hO2kl6CxZVC/aFF46g+y63m13bY
 ASWUBsfN5BXUM2Pu5Zj4LSXQjLICQo96hEH38MKObK2sbDPzzqMyeBnMmqRYo7/r9E
 eYoSABVJVs3oQ==
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
 David Airlie <airlied@linux.ie>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dave Chinner <david@fromorbit.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, sparclinux@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, ceph-devel@vger.kernel.org,
 devel@driverdev.osuosl.org, rds-devel@oss.oracle.com,
 linux-rdma@vger.kernel.org, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 xen-devel@lists.xenproject.org, devel@lists.orangefs.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8yLzE5IDI6MTkgQU0sIEpvb25hcyBMYWh0aW5lbiB3cm90ZToKPiBRdW90aW5nIGpvaG4u
aHViYmFyZEBnbWFpbC5jb20gKDIwMTktMDgtMDIgMDU6MTk6MzcpCj4+IEZyb206IEpvaG4gSHVi
YmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KPj4KPj4gRm9yIHBhZ2VzIHRoYXQgd2VyZSByZXRh
aW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMKPj4gdmlhIHRo
ZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0X3BhZ2Uo
KSBvcgo+PiByZWxlYXNlX3BhZ2VzKCkuCj4+Cj4+IFRoaXMgaXMgcGFydCBhIHRyZWUtd2lkZSBj
b252ZXJzaW9uLCBhcyBkZXNjcmliZWQgaW4gY29tbWl0IGZjMWQ4ZTdjY2EyZAo+PiAoIm1tOiBp
bnRyb2R1Y2UgcHV0X3VzZXJfcGFnZSooKSwgcGxhY2Vob2xkZXIgdmVyc2lvbnMiKS4KPj4KPj4g
Tm90ZSB0aGF0IHRoaXMgZWZmZWN0aXZlbHkgY2hhbmdlcyB0aGUgY29kZSdzIGJlaGF2aW9yIGlu
Cj4+IGk5MTVfZ2VtX3VzZXJwdHJfcHV0X3BhZ2VzKCk6IGl0IG5vdyBjYWxscyBzZXRfcGFnZV9k
aXJ0eV9sb2NrKCksCj4+IGluc3RlYWQgb2Ygc2V0X3BhZ2VfZGlydHkoKS4gVGhpcyBpcyBwcm9i
YWJseSBtb3JlIGFjY3VyYXRlLgo+IAo+IFdlJ3ZlIGFscmVhZHkgZml4ZWQgdGhpcyBpbiBkcm0t
dGlwIHdoZXJlIHRoZSBjdXJyZW50IGNvZGUgdXNlcwo+IHNldF9wYWdlX2RpcnR5X2xvY2soKS4K
PiAKPiBUaGlzIHdvdWxkIGNvbmZsaWN0IHdpdGggb3VyIHRyZWUuIFJvZHJpZ28gaXMgaGFuZGxp
bmcKPiBkcm0taW50ZWwtbmV4dCBmb3IgNS40LCBzbyB5b3UgZ3V5cyB3YW50IHRvIGNvb3JkaW5h
dGUgaG93Cj4gdG8gbWVyZ2UuCj4gCgpIaSBKb29uYXMsIFJvZHJpZ28sCgpGaXJzdCBvZiBhbGws
IEkgYXBvbG9naXplIGZvciB0aGUgQVBJIGJyZWFrYWdlOiBwdXRfdXNlcl9wYWdlc19kaXJ0eV9s
b2NrKCkKaGFzIGFuIGFkZGl0aW9uYWwgImRpcnR5IiBwYXJhbWV0ZXIuCgpJbiBvcmRlciB0byBk
ZWFsIHdpdGggdGhlIG1lcmdlIHByb2JsZW0sIEknbGwgZHJvcCB0aGlzIHBhdGNoIGZyb20gbXkg
c2VyaWVzLAphbmQgSSdkIHJlY29tbWVuZCB0aGF0IHRoZSBkcm0taW50ZWwtbmV4dCB0YWtlIHRo
ZSBmb2xsb3dpbmcgYXBwcm9hY2g6CgoxKSBGb3Igbm93LCBzL3B1dF9wYWdlL3B1dF91c2VyX3Bh
Z2UvIGluIGk5MTVfZ2VtX3VzZXJwdHJfcHV0X3BhZ2VzKCksCmFuZCBmaXggdXAgdGhlIHNldF9w
YWdlX2RpcnR5KCkgLS0+IHNldF9wYWdlX2RpcnR5X2xvY2soKSBpc3N1ZSwgbGlrZSB0aGlzCihi
YXNlZCBhZ2FpbnN0IGxpbnV4LmdpdCk6CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5
MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYyAKYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkx
NV9nZW1fdXNlcnB0ci5jCmluZGV4IDUyOGI2MTY3ODMzNC4uOTQ3MjFjYzAwOTNiIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKQEAgLTY2NCwxMCArNjY0
LDEwIEBAIGk5MTVfZ2VtX3VzZXJwdHJfcHV0X3BhZ2VzKHN0cnVjdCBkcm1faTkxNV9nZW1fb2Jq
ZWN0ICpvYmosCgogICAgICAgICBmb3JfZWFjaF9zZ3RfcGFnZShwYWdlLCBzZ3RfaXRlciwgcGFn
ZXMpIHsKICAgICAgICAgICAgICAgICBpZiAob2JqLT5tbS5kaXJ0eSkKLSAgICAgICAgICAgICAg
ICAgICAgICAgc2V0X3BhZ2VfZGlydHkocGFnZSk7CisgICAgICAgICAgICAgICAgICAgICAgIHNl
dF9wYWdlX2RpcnR5X2xvY2socGFnZSk7CgogICAgICAgICAgICAgICAgIG1hcmtfcGFnZV9hY2Nl
c3NlZChwYWdlKTsKLSAgICAgICAgICAgICAgIHB1dF9wYWdlKHBhZ2UpOworICAgICAgICAgICAg
ICAgcHV0X3VzZXJfcGFnZShwYWdlKTsKICAgICAgICAgfQogICAgICAgICBvYmotPm1tLmRpcnR5
ID0gZmFsc2U7CgoKVGhhdCB3aWxsIGxlYXZlIHlvdSB3aXRoIHlvdXIgb3JpZ2luYWwgc2V0X3Bh
Z2VfZGlydHlfbG9jaygpIGNhbGxzCmFuZCBldmVyeXRoaW5nIHdvcmtzIHByb3Blcmx5LgoKMikg
TmV4dCBjeWNsZSwgbW92ZSB0byB0aGUgbmV3IHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soKS4K
CnRoYW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKCgo+IFJlZ2FyZHMsIEpvb25hcwo+IApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
