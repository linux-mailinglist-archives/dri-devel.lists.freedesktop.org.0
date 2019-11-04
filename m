Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07133EE677
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 18:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E76A6E7AD;
	Mon,  4 Nov 2019 17:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24216E7AD
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 17:45:01 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-426-fsjodwpeO-WySaLYuw_60g-1; Mon, 04 Nov 2019 12:44:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3BE31005500;
 Mon,  4 Nov 2019 17:44:52 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7484E600C4;
 Mon,  4 Nov 2019 17:44:47 +0000 (UTC)
Date: Mon, 4 Nov 2019 12:44:45 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 09/18] drm/via: set FOLL_PIN via pin_user_pages_fast()
Message-ID: <20191104174445.GF5134@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-10-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-10-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: fsjodwpeO-WySaLYuw_60g-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572889500;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YOrYp+dHNK++F3TdjbhwlDZUdTKuNCY8bLNbrJapJJQ=;
 b=ZN2NiQ3rqfZx8iq/tcB47dII+1zdUZU6gUqQ4N8Z0uxbTlfsiZIkqz6vF1vrIrxOICEcO1
 zXPYT73zyFDZ8egp7B9jlBNEp2PrQ2Fwmpat2lNWT0Yr8vtU7gIo2gYEhwFHA8E1WV4z2H
 zB6SnQ6/dYsdwm16bO7XCMOS7zXdP1Q=
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
 linux-block@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
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

T24gU3VuLCBOb3YgMDMsIDIwMTkgYXQgMDE6MTg6MDRQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IENvbnZlcnQgZHJtL3ZpYSB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlc19mYXN0
KCkgY2FsbCwgd2hpY2ggc2V0cwo+IEZPTExfUElOLiBTZXR0aW5nIEZPTExfUElOIGlzIG5vdyBy
ZXF1aXJlZCBmb3IgY29kZSB0aGF0IHJlcXVpcmVzCj4gdHJhY2tpbmcgb2YgcGlubmVkIHBhZ2Vz
LCBhbmQgdGhlcmVmb3JlIGZvciBhbnkgY29kZSB0aGF0IGNhbGxzCj4gcHV0X3VzZXJfcGFnZSgp
Lgo+IAo+IFJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKUGxlYXNlIGJl
IG1vcmUgZXhwbGljaXQgdGhhdCB2aWFfZG1hYmxpdC5jIGlzIGFscmVhZHkgdXNpbmcgcHV0X3Vz
ZXJfcGFnZSgpCmFzIGkgYW0gZXhwZWN0aW5nIHRoYXQgYW55IGNvbnZlcnNpb24gdG8gcGluX3Vz
ZXJfcGFnZXMqKCkgbXVzdCBiZSBwYWlyIHdpdGgKYSBwdXRfdXNlcl9wYWdlKCkuIEkgZmluZCBh
Ym92ZSBjb21taXQgbWVzc2FnZSBiaXQgdW5jbGVhciBmcm9tIHRoYXQgUE9WLgoKUmV2aWV3ZWQt
Ynk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQuY29tPgoKCj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92aWEvdmlhX2RtYWJsaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQu
Ywo+IGluZGV4IDNkYjAwMGFhY2QyNi4uMzdjNWU1NzI5OTNhIDEwMDY0NAo+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92aWEvdmlhX2RtYWJsaXQuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS92aWEv
dmlhX2RtYWJsaXQuYwo+IEBAIC0yMzksNyArMjM5LDcgQEAgdmlhX2xvY2tfYWxsX2RtYV9wYWdl
cyhkcm1fdmlhX3NnX2luZm9fdCAqdnNnLCAgZHJtX3ZpYV9kbWFibGl0X3QgKnhmZXIpCj4gIAl2
c2ctPnBhZ2VzID0gdnphbGxvYyhhcnJheV9zaXplKHNpemVvZihzdHJ1Y3QgcGFnZSAqKSwgdnNn
LT5udW1fcGFnZXMpKTsKPiAgCWlmIChOVUxMID09IHZzZy0+cGFnZXMpCj4gIAkJcmV0dXJuIC1F
Tk9NRU07Cj4gLQlyZXQgPSBnZXRfdXNlcl9wYWdlc19mYXN0KCh1bnNpZ25lZCBsb25nKXhmZXIt
Pm1lbV9hZGRyLAo+ICsJcmV0ID0gcGluX3VzZXJfcGFnZXNfZmFzdCgodW5zaWduZWQgbG9uZyl4
ZmVyLT5tZW1fYWRkciwKPiAgCQkJdnNnLT5udW1fcGFnZXMsCj4gIAkJCXZzZy0+ZGlyZWN0aW9u
ID09IERNQV9GUk9NX0RFVklDRSA/IEZPTExfV1JJVEUgOiAwLAo+ICAJCQl2c2ctPnBhZ2VzKTsK
PiAtLSAKPiAyLjIzLjAKPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
