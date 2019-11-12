Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60863F9D3A
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 23:43:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AD06EC1C;
	Tue, 12 Nov 2019 22:42:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 860EB6EC1C
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 22:42:58 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb353a0000>; Tue, 12 Nov 2019 14:42:02 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 14:42:58 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 14:42:58 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 22:42:57 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <20191112204338.GE5584@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <0db36e86-b779-01af-77e7-469af2a2e19c@nvidia.com>
Date: Tue, 12 Nov 2019 14:42:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112204338.GE5584@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573598522; bh=Y5yk8f3O0SqpmKkLqVvRBWCkW319hAOZ+63Twi/leN0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=k73DbqVF1ro4BGXqtoOXY8+RqyGGe2g09YDUx2SX8XytMdTG+dmOpX+jHtYX3sy0m
 jqRakpKDfOE8+KOF078kMgEWeRTrM64RVzrIc5oOooDxqIVboTzwD8VSvvTsbdqRvZ
 VUfhjLhHIl5v6iMhsEkxxPV8LaL6dE8RS69ywE4DWS3/QelSGNxpH0rJ4kmEm//y+p
 XXB4Gdx5hRr2SYYAicrcdd+BO7VysNir33yZ/MmfzzivcmZz0JpK+nUr9PhYe4icqS
 koYHksTWwDMw0phfipFOQbYisXKLuZUJMy7LSz/++6j9kUwwcPzjslXYFXKOkRwY0a
 JDLTwENrLW26A==
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
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTIvMTkgMTI6NDMgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKLi4uCj4+IC0JCX0K
Pj4gKwlyZXQgPSBnZXRfdXNlcl9wYWdlc19yZW1vdGUoTlVMTCwgbW0sIHZhZGRyLCAxLCBmbGFn
cyB8IEZPTExfTE9OR1RFUk0sCj4+ICsJCQkJICAgIHBhZ2UsIHZtYXMsIE5VTEwpOwo+PiArCS8q
Cj4+ICsJICogVGhlIGxpZmV0aW1lIG9mIGEgdmFkZHJfZ2V0X3BmbigpIHBhZ2UgcGluIGlzCj4+
ICsJICogdXNlcnNwYWNlLWNvbnRyb2xsZWQuIEluIHRoZSBmcy1kYXggY2FzZSB0aGlzIGNvdWxk
Cj4+ICsJICogbGVhZCB0byBpbmRlZmluaXRlIHN0YWxscyBpbiBmaWxlc3lzdGVtIG9wZXJhdGlv
bnMuCj4+ICsJICogRGlzYWxsb3cgYXR0ZW1wdHMgdG8gcGluIGZzLWRheCBwYWdlcyB2aWEgdGhp
cwo+PiArCSAqIGludGVyZmFjZS4KPj4gKwkgKi8KPj4gKwlpZiAocmV0ID4gMCAmJiB2bWFfaXNf
ZnNkYXgodm1hc1swXSkpIHsKPj4gKwkJcmV0ID0gLUVPUE5PVFNVUFA7Cj4+ICsJCXB1dF9wYWdl
KHBhZ2VbMF0pOwo+PiAgCX0KPiAKPiBBRkFJSyB0aGlzIGNodW5rIGlzIHJlZHVuZGFudCBub3cg
YXMgaXQgaXMgc29tZSBoYWNrIHRvIGVtdWxhdGUKPiBGT0xMX0xPTkdURVJNPyBTbyB2bWFzIGNh
biBiZSBkZWxldGVkIHRvby4KCkxldCBtZSBmaXJzdCBtYWtlIHN1cmUgSSB1bmRlcnN0YW5kIHdo
YXQgRGFuIGhhcyBpbiBtaW5kIGZvciB0aGUgdm1hCmNoZWNraW5nLCBpbiB0aGUgb3RoZXIgdGhy
ZWFkLi4uCgo+IAo+IEFsc28gdW5jbGVhciB3aHkgdGhpcyBmdW5jdGlvbiBoYXMgdGhpczoKPiAK
PiAgICAgICAgIHVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7Cj4gCj4gICAgICAgICBpZiAocmV0ID09
IDEpIHsKPiAgICAgICAgICAgICAgICAgKnBmbiA9IHBhZ2VfdG9fcGZuKHBhZ2VbMF0pOwo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgIH0KPiAKPiAgICAgICAgIGRvd25fcmVh
ZCgmbW0tPm1tYXBfc2VtKTsKPiAKClllcywgdGhhdCdzIHJlYWxseSBvZGQuIEl0J3Mgbm90IGdv
b2QgdG8gcmVsZWFzZSBhbmQgcmV0YWtlIHRoZSBsb2NrCmFueXdheSBpbiBnZW5lcmFsICh3aXRo
b3V0IHJlLWNoZWNraW5nIHRoaW5ncyksIGFuZCAgY2VydGFpbmx5IGl0IGlzCm5vdCByZXF1aXJl
ZCB0byByZWxlYXNlIG1tYXBfc2VtIGluIG9yZGVyIHRvIGNhbGwgcGFnZV90b19wZm4oKS4KCkkn
dmUgcmVtb3ZlZCB0aGF0IHVwX3JlYWQoKS9kb3duX3JlYWQoKSBwYWlyLCBmb3IgdjQuCgoKdGhh
bmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
