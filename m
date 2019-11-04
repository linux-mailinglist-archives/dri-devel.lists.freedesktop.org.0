Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CEEEA20
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 21:48:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFBEF6E867;
	Mon,  4 Nov 2019 20:48:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CDF96E867
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 20:48:44 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-XtiEJ6MJOtixJceTBvorsw-1; Mon, 04 Nov 2019 15:48:39 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 279BB1800DFD;
 Mon,  4 Nov 2019 20:48:35 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AEACB5C3F8;
 Mon,  4 Nov 2019 20:48:29 +0000 (UTC)
Date: Mon, 4 Nov 2019 15:48:28 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: David Rientjes <rientjes@google.com>
Subject: Re: [PATCH v2 05/18] mm/gup: introduce pin_user_pages*() and FOLL_PIN
Message-ID: <20191104204828.GC7731@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-6-jhubbard@nvidia.com>
 <alpine.DEB.2.21.1911041231520.74801@chino.kir.corp.google.com>
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.1911041231520.74801@chino.kir.corp.google.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: XtiEJ6MJOtixJceTBvorsw-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572900523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mn5RsMcwjgSz4Uc3SsLk9u7OdhxITCoqvev72K3k0/w=;
 b=hQ9+wUclM/gzvrwXlA0dBmvh/ki8tPcPI4NMrzUSwOoLjc6TTXi4ppLn6A8JYvsmhSCT/q
 9xJ9ZYZR1XsNeEJ6PbCbPyMze2ZLL00duT3IgVl7S51Ld6Zf0Dtf0e8LS6qh+AhfwtBiPB
 MvLGtYW2tZJFAys78ar8r6R6dU8re+M=
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
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
 =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, bpf@vger.kernel.org,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMDQsIDIwMTkgYXQgMTI6MzM6MDlQTSAtMDgwMCwgRGF2aWQgUmllbnRqZXMg
d3JvdGU6Cj4gCj4gCj4gT24gU3VuLCAzIE5vdiAyMDE5LCBKb2huIEh1YmJhcmQgd3JvdGU6Cj4g
Cj4gPiBJbnRyb2R1Y2UgcGluX3VzZXJfcGFnZXMqKCkgdmFyaWF0aW9ucyBvZiBnZXRfdXNlcl9w
YWdlcyooKSBjYWxscywKPiA+IGFuZCBhbHNvIHBpbl9sb25ndGVybV9wYWdlcyooKSB2YXJpYXRp
b25zLgo+ID4gCj4gPiBUaGVzZSB2YXJpYW50cyBhbGwgc2V0IEZPTExfUElOLCB3aGljaCBpcyBh
bHNvIGludHJvZHVjZWQsIGFuZAo+ID4gdGhvcm91Z2hseSBkb2N1bWVudGVkLgo+ID4gCj4gPiBU
aGUgcGluX2xvbmd0ZXJtKigpIHZhcmlhbnRzIGFsc28gc2V0IEZPTExfTE9OR1RFUk0sIGluIGFk
ZGl0aW9uCj4gPiB0byBGT0xMX1BJTjoKPiA+IAo+ID4gICAgIHBpbl91c2VyX3BhZ2VzKCkKPiA+
ICAgICBwaW5fdXNlcl9wYWdlc19yZW1vdGUoKQo+ID4gICAgIHBpbl91c2VyX3BhZ2VzX2Zhc3Qo
KQo+ID4gCj4gPiAgICAgcGluX2xvbmd0ZXJtX3BhZ2VzKCkKPiA+ICAgICBwaW5fbG9uZ3Rlcm1f
cGFnZXNfcmVtb3RlKCkKPiA+ICAgICBwaW5fbG9uZ3Rlcm1fcGFnZXNfZmFzdCgpCj4gPiAKPiA+
IEFsbCBwYWdlcyB0aGF0IGFyZSBwaW5uZWQgdmlhIHRoZSBhYm92ZSBjYWxscywgbXVzdCBiZSB1
bnBpbm5lZCB2aWEKPiA+IHB1dF91c2VyX3BhZ2UoKS4KPiA+IAo+IAo+IEhpIEpvaG4sCj4gCj4g
SSdtIGN1cmlvdXMgd2hhdCBjb25zaWRlcmF0aW9uIGlzIGdpdmVuIHRvIHdoYXQgcGFnZWJsb2Nr
IG1pZ3JhdGUgdHlwZXMgCj4gdGhhdCBGT0xMX1BJTiBhbmQgRk9MTF9MT05HVEVSTSBwYWdlcyBv
cmlnaW5hdGUgZnJvbSwgYXNzdW1pbmcgdGhhdCAKPiBsb25ndGVybSB3b3VsZCB3YW50IHRvIG9y
aWdpbmF0ZSBmcm9tIE1JR1JBVEVfVU5NT1ZBQkxFIHBhZ2VibG9ja3MgZm9yIHRoZSAKPiBwdXJw
b3NlcyBvZiBhbnRpLWZyYWdtZW50YXRpb24/CgpXZSBkbyBub3QgY29udHJvbCBwYWdlIGJsb2Nr
LCBHVVAgY2FuIGhhcHBlbnMgb24gX2FueV8gcGFnZSB0aGF0IGlzCm1hcCBpbnNpZGUgYSBwcm9j
ZXNzIChhbm9ueW1vdXMgcHJpdmF0ZSB2bWEgb3IgcmVndWxhciBmaWxlIGJhY2sgb25lKS4KCkNo
ZWVycywKSsOpcsO0bWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbA==
