Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A683ECE36
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 12:01:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69126E42E;
	Sat,  2 Nov 2019 11:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EEE66E42E
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 11:01:54 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 02 Nov 2019 04:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,259,1569308400"; d="scan'208";a="206632673"
Received: from mohseni-mobl2.ger.corp.intel.com (HELO
 btopel-mobl.ger.intel.com) ([10.252.42.93])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Nov 2019 04:01:44 -0700
Subject: Re: [PATCH 11/19] net/xdp: set FOLL_PIN via pin_user_pages()
To: John Hubbard <jhubbard@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
 <20191030224930.3990755-12-jhubbard@nvidia.com>
From: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>
Message-ID: <67cd4960-bc17-9603-8d4d-b7b2f68bb373@intel.com>
Date: Sat, 2 Nov 2019 12:01:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191030224930.3990755-12-jhubbard@nvidia.com>
Content-Language: en-US
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
 linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 linux-media@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMjAxOS0xMC0zMCAyMzo0OSwgSm9obiBIdWJiYXJkIHdyb3RlOgo+IENvbnZlcnQgbmV0L3hk
cCB0byB1c2UgdGhlIG5ldyBwaW5fbG9uZ3Rlcm1fcGFnZXMoKSBjYWxsLCB3aGljaCBzZXRzCj4g
Rk9MTF9QSU4uIFNldHRpbmcgRk9MTF9QSU4gaXMgbm93IHJlcXVpcmVkIGZvciBjb2RlIHRoYXQg
cmVxdWlyZXMKPiB0cmFja2luZyBvZiBwaW5uZWQgcGFnZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
Sm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKQWNrZWQtYnk6IEJqw7ZybiBUw7Zw
ZWwgPGJqb3JuLnRvcGVsQGludGVsLmNvbT4KCj4gLS0tCj4gICBuZXQveGRwL3hkcF91bWVtLmMg
fCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL25ldC94ZHAveGRwX3VtZW0uYyBiL25ldC94ZHAveGRwX3Vt
ZW0uYwo+IGluZGV4IDE2ZDVmMzUzMTYzYS4uNGQ1NmRmYjExMzlhIDEwMDY0NAo+IC0tLSBhL25l
dC94ZHAveGRwX3VtZW0uYwo+ICsrKyBiL25ldC94ZHAveGRwX3VtZW0uYwo+IEBAIC0yODUsOCAr
Mjg1LDggQEAgc3RhdGljIGludCB4ZHBfdW1lbV9waW5fcGFnZXMoc3RydWN0IHhkcF91bWVtICp1
bWVtKQo+ICAgCQlyZXR1cm4gLUVOT01FTTsKPiAgIAo+ICAgCWRvd25fcmVhZCgmY3VycmVudC0+
bW0tPm1tYXBfc2VtKTsKPiAtCW5wZ3MgPSBnZXRfdXNlcl9wYWdlcyh1bWVtLT5hZGRyZXNzLCB1
bWVtLT5ucGdzLAo+IC0JCQkgICAgICBndXBfZmxhZ3MgfCBGT0xMX0xPTkdURVJNLCAmdW1lbS0+
cGdzWzBdLCBOVUxMKTsKPiArCW5wZ3MgPSBwaW5fbG9uZ3Rlcm1fcGFnZXModW1lbS0+YWRkcmVz
cywgdW1lbS0+bnBncywgZ3VwX2ZsYWdzLAo+ICsJCQkJICAmdW1lbS0+cGdzWzBdLCBOVUxMKTsK
PiAgIAl1cF9yZWFkKCZjdXJyZW50LT5tbS0+bW1hcF9zZW0pOwo+ICAgCj4gICAJaWYgKG5wZ3Mg
IT0gdW1lbS0+bnBncykgewo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
