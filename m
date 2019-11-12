Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C107F9B85
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 22:10:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E8C6EBEE;
	Tue, 12 Nov 2019 21:10:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C31596EBEE
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 21:10:48 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb1fa00000>; Tue, 12 Nov 2019 13:09:52 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 13:10:48 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 13:10:48 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 21:10:47 +0000
Subject: Re: [PATCH v3 00/23] mm/gup: track dma-pinned pages: FOLL_PIN,
 FOLL_LONGTERM
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112203802.GD5584@ziepe.ca>
X-Nvconfidentiality: public
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <02fa935c-3469-b766-b691-5660084b60b9@nvidia.com>
Date: Tue, 12 Nov 2019 13:10:47 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191112203802.GD5584@ziepe.ca>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573592992; bh=FYNiQqIIwAjaPTLdgZDFjzpc3PZA+IOd8Qzq/L3NYFI=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=XDTPGbX/pfLSLEPMZj0U4ST8nWeqLQb9L0gJo2fojuRXhn2sbJZCbDvwG00vq+XIQ
 colylZtLpZg40dx1ABr6UMyL7nDz+Ko0zZq5udmfA2v8o8KV6jbQ8nMJaMjSxXz3jT
 /IQas6U39IMXowKsu+Lp15YvwNvsj9I4GEW1qSNrdbdQur8MbFNPpL74slNbnNTKiw
 2tvXn1JIXwNPZ2+bJmHJ2nQzCpfl0RwWLH4Y7hj0SisnidmxgFdWv36tY7VU9S2345
 uRxyqWTOY6lQqCfoY1uSgUmsGBjI6laWSw8oWM5BJSMXcH/MubF7tkJ0NoA3AfLsvB
 eNrIf7Db8lhiQ==
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

T24gMTEvMTIvMTkgMTI6MzggUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPiBPbiBNb24sIE5v
diAxMSwgMjAxOSBhdCAwNDowNjozN1BNIC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4+IEhp
LAo+Pgo+PiBUaGUgY292ZXIgbGV0dGVyIGlzIGxvbmcsIHNvIHRoZSBtb3JlIGltcG9ydGFudCBz
dHVmZiBpcyBmaXJzdDoKPj4KPj4gKiBKYXNvbiwgaWYgeW91IG9yIHNvbWVvbmUgY291bGQgbG9v
ayBhdCB0aGUgdGhlIFZGSU8gY2xlYW51cCAocGF0Y2ggOCkKPj4gICBhbmQgY29udmVyc2lvbiB0
byBGT0xMX1BJTiAocGF0Y2ggMTgpLCB0byBtYWtlIHN1cmUgaXQncyB1c2Ugb2YKPj4gICByZW1v
dGUgYW5kIGxvbmd0ZXJtIGd1cCBtYXRjaGVzIHdoYXQgd2UgZGlzY3Vzc2VkIGR1cmluZyB0aGUg
cmV2aWV3Cj4+ICAgb2YgdjIsIEknZCBhcHByZWNpYXRlIGl0Lgo+Pgo+PiAqIEFsc28gZm9yIEph
c29uIGFuZCBJQjogYXMgbm90ZWQgYmVsb3csIGluIHBhdGNoIDExLCBJIGFtICh0b28/KSBib2xk
bHkKPj4gICBjb252ZXJ0aW5nIGZyb20gcHV0X3VzZXJfcGFnZXMoKSB0byByZWxlYXNlX3BhZ2Vz
KCkuCj4gCj4gV2h5IGFyZSB3ZSBkb2luZyB0aGlzPyBJIHRoaW5rIHRoaW5ncyBnb3QgY29uZnVz
ZWQgaGVyZSBzb21lcGxhY2UsIGFzCgoKQmVjYXVzZToKCmEpIFRoZXNlIG5lZWQgcHV0X3BhZ2Uo
KSBjYWxscywgIGFuZAoKYikgdGhlcmUgaXMgbm8gcHV0X3BhZ2VzKCkgY2FsbCwgYnV0IHRoZXJl
IGlzIGEgcmVsZWFzZV9wYWdlcygpIGNhbGwgdGhhdAppcywgYXJndWFibHksIHdoYXQgcHV0X3Bh
Z2VzKCkgd291bGQgYmUuCgoKPiB0aGUgY29tbWVudCBzdGlsbCBzYXlzOgo+IAo+IC8qKgo+ICAq
IHB1dF91c2VyX3BhZ2UoKSAtIHJlbGVhc2UgYSBndXAtcGlubmVkIHBhZ2UKPiAgKiBAcGFnZTog
ICAgICAgICAgICBwb2ludGVyIHRvIHBhZ2UgdG8gYmUgcmVsZWFzZWQKPiAgKgo+ICAqIFBhZ2Vz
IHRoYXQgd2VyZSBwaW5uZWQgdmlhIGdldF91c2VyX3BhZ2VzKigpIG11c3QgYmUgcmVsZWFzZWQg
dmlhCj4gICogZWl0aGVyIHB1dF91c2VyX3BhZ2UoKSwgb3Igb25lIG9mIHRoZSBwdXRfdXNlcl9w
YWdlcyooKSByb3V0aW5lcwo+ICAqIGJlbG93LgoKCk9oaGgsIEkgbWlzc2VkIHRob3NlIGNvbW1l
bnRzLiBUaGV5IG5lZWQgdG8gYWxsIGJlIGNoYW5nZWQgb3ZlciB0bwpzYXkgInBhZ2VzIHRoYXQg
d2VyZSBwaW5uZWQgdmlhIHBpbl91c2VyX3BhZ2VzKigpIG9yIApwaW5fbG9uZ3Rlcm1fcGFnZXMq
KCkgbXVzdCBiZSByZWxlYXNlZCB2aWEgcHV0X3VzZXJfcGFnZSooKS4iCgpUaGUgZ2V0X3VzZXJf
cGFnZXMqKCkgcGFnZXMgbXVzdCBzdGlsbCBiZSByZWxlYXNlZCB2aWEgcHV0X3BhZ2UuCgpUaGUg
Y2h1cm4gaXMgZHVlIHRvIGEgZmFpcmx5IHNpZ25pZmljYW50IGNoYW5nZSBpbiBzdHJhdGVneSwg
d2hpcwppczogaW5zdGVhZCBvZiBjaGFuZ2luZyBhbGwgZ2V0X3VzZXJfcGFnZXMqKCkgc2l0ZXMg
dG8gY2FsbCAKcHV0X3VzZXJfcGFnZSgpLCBjaGFuZ2Ugc2VsZWN0ZWQgc2l0ZXMgdG8gY2FsbCBw
aW5fdXNlcl9wYWdlcyooKSBvciAKcGluX2xvbmd0ZXJtX3BhZ2VzKigpLCBwbHVzIHB1dF91c2Vy
X3BhZ2UoKS4KClRoYXQgYWxsb3dzIGluY3JlbWVudGFsbHkgY29udmVydGluZyB0aGUga2VybmVs
IG92ZXIgdG8gdXNpbmcgdGhlCm5ldyBwaW4gQVBJcywgd2l0aG91dCB0YWtpbmcgb24gdGhlIGh1
Z2UgcmlzayBvZiBhIGJpZyBvbmUtc2hvdApjb252ZXJzaW9uLiAKClNvLCBJJ3ZlIGVuZGVkIHVw
IHdpdGggb25lIHBsYWNlIHRoYXQgYWN0dWFsbHkgbmVlZHMgdG8gZ2V0IHJldmVydGVkCmJhY2sg
dG8gZ2V0X3VzZXJfcGFnZXMoKSwgYW5kIHRoYXQncyB0aGUgSUIgT0RQIGNvZGUuCgo+IAo+IEkg
ZmVlbCBsaWtlIGlmIHB1dF91c2VyX3BhZ2VzKCkgaXMgbm90IHRoZSBjb3JyZWN0IHdheSB0byB1
bmRvCj4gZ2V0X3VzZXJfcGFnZXMoKSB0aGVuIGl0IG5lZWRzIHRvIGJlIGRlbGV0ZWQuCj4gCgpZ
ZXMsIHlvdSdyZSByaWdodC4gSSdsbCBmaXggdGhlIHB1dF91c2VyX3BhZ2UgY29tbWVudHMoKSBh
cyBkZXNjcmliZWQuCgoKdGhhbmtzLAoKSm9obiBIdWJiYXJkCk5WSURJQQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
