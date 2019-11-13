Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D737EFB9C4
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 21:27:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7E9F6EE4F;
	Wed, 13 Nov 2019 20:27:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270DE6EE4F
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 20:27:20 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcc66ef0001>; Wed, 13 Nov 2019 12:26:23 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 13 Nov 2019 12:27:19 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 13 Nov 2019 12:27:19 -0800
Received: from [10.2.160.107] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 20:27:18 +0000
Subject: Re: [PATCH v4 09/23] mm/gup: introduce pin_user_pages*() and FOLL_PIN
To: Ira Weiny <ira.weiny@intel.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
 <20191113042710.3997854-10-jhubbard@nvidia.com>
 <20191113185902.GB12915@iweiny-DESK2.sc.intel.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <d5b14492-45a9-914e-92db-29592c3634e5@nvidia.com>
Date: Wed, 13 Nov 2019 12:24:32 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191113185902.GB12915@iweiny-DESK2.sc.intel.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573676784; bh=ZP9QEqV97zzS7vyaMLJBGQGSKGW2tyNWtWpkiSoCJc4=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=blBmwo40hUXWDReswYBJ9TKWl7H2L/k0XDDTqLc9LkITedj/TfVhMrycxbdicryg9
 h3wCNANbDFiVSj6oyHjfFnRbLVuCRi3pWpRJRe/jbCLOFnYnWP5+VYQpU1VxmX02Oe
 x63ynn9Lg49xuQZl/cSCofyxC/5cUmsD/0Qztzy4aTmtjHXl5koB/p/oGnI3O50jC6
 JimPfnxSS5Hd9PocW7OekFWFS3ot4vxXyyvMqqBzeRQ9mC6jlTWwR4/WgqeBc/ncw1
 PM3rgjSIKR9vLy74nuxe2z7dV2iTNewdvjl7FyfEINYcs/7W4YGwW/FeVW7CmMMCVV
 2lZpQK+CR/Twg==
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
 Michael Ellerman <mpe@ellerman.id.au>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, linux-block@vger.kernel.org,
 =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTEvMTMvMTkgMTA6NTkgQU0sIElyYSBXZWlueSB3cm90ZToKPiBPbiBUdWUsIE5vdiAxMiwg
MjAxOSBhdCAwODoyNjo1NlBNIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IEludHJvZHVj
ZSBwaW5fdXNlcl9wYWdlcyooKSB2YXJpYXRpb25zIG9mIGdldF91c2VyX3BhZ2VzKigpIGNhbGxz
LAo+PiBhbmQgYWxzbyBwaW5fbG9uZ3Rlcm1fcGFnZXMqKCkgdmFyaWF0aW9ucy4KPj4KPj4gVGhl
c2UgdmFyaWFudHMgYWxsIHNldCBGT0xMX1BJTiwgd2hpY2ggaXMgYWxzbyBpbnRyb2R1Y2VkLCBh
bmQKPj4gdGhvcm91Z2hseSBkb2N1bWVudGVkLgo+Pgo+PiBUaGUgcGluX2xvbmd0ZXJtKigpIHZh
cmlhbnRzIGFsc28gc2V0IEZPTExfTE9OR1RFUk0sIGluIGFkZGl0aW9uCj4+IHRvIEZPTExfUElO
Ogo+Pgo+PiAgICAgIHBpbl91c2VyX3BhZ2VzKCkKPj4gICAgICBwaW5fdXNlcl9wYWdlc19yZW1v
dGUoKQo+PiAgICAgIHBpbl91c2VyX3BhZ2VzX2Zhc3QoKQo+Pgo+PiAgICAgIHBpbl9sb25ndGVy
bV9wYWdlcygpCj4+ICAgICAgcGluX2xvbmd0ZXJtX3BhZ2VzX3JlbW90ZSgpCj4+ICAgICAgcGlu
X2xvbmd0ZXJtX3BhZ2VzX2Zhc3QoKQo+IAo+IEF0IHNvbWUgcG9pbnQgaW4gdGhpcyBjb252ZXJz
YXRpb24gSSB0aG91Z2h0IHdlIHdlcmUgZ29pbmcgdG8gcHV0IGluICJ1bnBpbl8qIgo+IHZlcnNp
b25zIG9mIHRoZXNlLgo+IAo+IElzIHRoYXQgc3RpbGwgaW4gdGhlIHBsYW5zPwo+IAoKV2h5IHll
cyBpdCBpcyEgOikgIERhbmllbCBWZXR0ZXIgYW5kIEphbiBLYXJhIGJvdGggYWxyZWFkeSB3ZWln
aGVkIGluIFsxXSwKaW4gZmF2b3Igb2YgInVucGluX3VzZXJfcGFnZSooKSIsIHJhdGhlciB0aGFu
ICJwdXRfdXNlcl9wYWdlKigpIi4KCkknbGwgY2hhbmdlIHRob3NlIG5hbWVzLgoKWzFdIGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTExMTMxMDEyMTAuR0Q2MzY3QHF1YWNrMi5zdXNlLmN6
CgoKdGhhbmtzLAotLSAKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
