Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5D0AF9E31
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 00:29:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 132736E042;
	Tue, 12 Nov 2019 23:29:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C26146E042
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 23:29:15 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb404e0000>; Tue, 12 Nov 2019 15:29:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 15:29:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 12 Nov 2019 15:29:15 -0800
Received: from [10.110.48.28] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 23:29:14 +0000
Subject: Re: [PATCH v3 08/23] vfio, mm: fix get_user_pages_remote() and
 FOLL_LONGTERM
To: Dan Williams <dan.j.williams@intel.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
 <20191112000700.3455038-9-jhubbard@nvidia.com>
 <CAPcyv4hgKEqoxeQJH9R=YiZosvazj308Kk7jJA1NLxJkNenDcQ@mail.gmail.com>
 <471e513c-833f-2f8b-60db-5d9c56a8f766@nvidia.com>
 <CAPcyv4it5fxU71uXFHW_WAAXBw4suQvwWTjX0Wru8xKFoz_dbw@mail.gmail.com>
 <729a16cb-3947-c7cb-c57f-6c917d240665@nvidia.com>
 <CAPcyv4gUe__09cnAh3jeFogJH=sGm9U+8axRq_kCASkdbLfNbQ@mail.gmail.com>
From: John Hubbard <jhubbard@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <337c1eae-0bc0-f10e-1d94-bfaabb458ef1@nvidia.com>
Date: Tue, 12 Nov 2019 15:29:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAPcyv4gUe__09cnAh3jeFogJH=sGm9U+8axRq_kCASkdbLfNbQ@mail.gmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573601358; bh=o6ia2d63RJ0qxkFwgtD+YyXN5GfFC9WoewC+wxSu4kw=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=RAj1WC+waGrwzzu1rcNVg5xTDJ4YFSGOJSfwi2oimLIOQaVkk915bIrPMUaThYfIw
 ky/YXTMGIvWaDuZc47fvOH+PSyqmQoTrBwt0Wa509eFKFDuIhRxPrlGygvCZBlYH7F
 e7G7i7kI+5JBe9jpDcCLEF8nqBf+7Jp0Acs8Bh7NVnPfxELLKIp8A2qiCGfFQtoi0U
 1hVsHCbQquq5G7id5r5AVCDNCbejp+r3iesGNJpN/Jlv6Xqu0/TA5bPv+XypWrU59G
 D1u3GlrRZEncRTYPb/7asQBi8wwD6pWmTiU8qTKzfKwu3yComaEYolsu4mdM+kKDAa
 r3XrSXBXN1ykw==
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

T24gMTEvMTIvMTkgMzoxNCBQTSwgRGFuIFdpbGxpYW1zIHdyb3RlOgouLi4KPj4KPj4gSXMgdGhh
dCBPSywgb3IgZGlkIHlvdSB3YW50IHRvIGdvIGZ1cnRoZXIgKHBvc3NpYmx5IGluIGEgZm9sbG93
LXVwCj4+IHBhdGNoc2V0LCBhcyBJJ20gaG9waW5nIHRvIGdldCB0aGlzIG9uZSBpbiBzb29uKT8K
PiAKPiBUaGF0IGxvb2tzIG9rLiBTb21ldGhpbmcgdG8gbWF5YmUgcHVzaCBkb3duIGludG8gdGhl
IGNvcmUgaW4gYSBmdXR1cmUKCgpHcmVhdCEgSSdsbCBwb3N0IGEgY2xlYW5lZCB1cCB2NCAod2l0
aCB0aGUgZXh0cmFuZW91cyB1cF9yZWFkKCkvZG93bl9yZWFkKCkKcmVtb3ZlZCksIHRoZW4uCgoK
PiBjbGVhbnVwLCBidXQgbm90IHNvbWV0aGluZyB0aGF0IG5lZWRzIHRvIGJlIGRvbmUgbm93Lgo+
IAoKWWVzLiBJJ3ZlIHB1dCB0aGUgRk9MTF9MT05HVEVSTSBjbGVhbnVwIGl0ZW1zIG9uIG15IGxp
c3Qgbm93LCBpbiBjYXNlCnRoZXkgZG9uJ3QgZ2V0IGRvbmUgYXMgcGFydCBvZiBzb21ldGhpbmcg
ZWxzZS4gVGhlcmUncyBhIGxvdCBtb3JlCmNoYW5nZSBjb21pbmcgaW4gdGhpcyBhcmVhLgoKCnRo
YW5rcywKLS0gCkpvaG4gSHViYmFyZApOVklESUEKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
