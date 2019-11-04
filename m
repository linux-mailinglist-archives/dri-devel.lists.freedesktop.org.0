Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD9BEE527
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 17:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCA3C892D5;
	Mon,  4 Nov 2019 16:52:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A2D892D5
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 16:52:37 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-285-9yNyzIkfPeqtWSV5Ovvavg-1; Mon, 04 Nov 2019 11:52:32 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8FC0C800C73;
 Mon,  4 Nov 2019 16:52:28 +0000 (UTC)
Received: from redhat.com (unknown [10.20.6.178])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3A10B5C1B2;
 Mon,  4 Nov 2019 16:52:23 +0000 (UTC)
Date: Mon, 4 Nov 2019 11:52:21 -0500
From: Jerome Glisse <jglisse@redhat.com>
To: John Hubbard <jhubbard@nvidia.com>
Subject: Re: [PATCH v2 03/18] goldish_pipe: rename local pin_user_pages()
 routine
Message-ID: <20191104165221.GC5134@redhat.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
 <20191103211813.213227-4-jhubbard@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20191103211813.213227-4-jhubbard@nvidia.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 9yNyzIkfPeqtWSV5Ovvavg-1
X-Mimecast-Spam-Score: 0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1572886356;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ta56jBRT26o2oAigonInJcC04rruT/2d6fabGOKHyw=;
 b=WSLa2wKrL8g5aDyoDf02O4k+crqcoTXsQ2EKqq2n6FzaTjqceXHOvCayOCIR1bb5K9cevY
 4X65fFvcBOCVsRohJoclItex595rU3tYdNhZDQ5rVUFYp7EKSwdA9oE4gxRYhiG3A8fEqR
 fFQB7XsZgwY/SgZNM9uNmH3+34EtSUE=
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

T24gU3VuLCBOb3YgMDMsIDIwMTkgYXQgMDE6MTc6NThQTSAtMDgwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IDEuIEF2b2lkIG5hbWluZyBjb25mbGljdHM6IHJlbmFtZSBsb2NhbCBzdGF0aWMgZnVu
Y3Rpb24gZnJvbQo+ICJwaW5fdXNlcl9wYWdlcygpIiB0byAicGluX2dvbGRmaXNoX3BhZ2VzKCki
Lgo+IAo+IEFuIHVwY29taW5nIHBhdGNoIHdpbGwgaW50cm9kdWNlIGEgZ2xvYmFsIHBpbl91c2Vy
X3BhZ2VzKCkKPiBmdW5jdGlvbi4KPiAKPiBSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2Vp
bnlAaW50ZWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZp
ZGlhLmNvbT4KClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNv
bT4KCj4gLS0tCj4gIGRyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jIHwg
MTggKysrKysrKysrLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyks
IDkgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZp
c2gvZ29sZGZpc2hfcGlwZS5jIGIvZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9w
aXBlLmMKPiBpbmRleCBjZWYwMTMzYWE0N2EuLjdlZDJhMjFhMGJhYyAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYwo+ICsrKyBiL2RyaXZlcnMv
cGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCj4gQEAgLTI1NywxMiArMjU3LDEyIEBA
IHN0YXRpYyBpbnQgZ29sZGZpc2hfcGlwZV9lcnJvcl9jb252ZXJ0KGludCBzdGF0dXMpCj4gIAl9
Cj4gIH0KPiAgCj4gLXN0YXRpYyBpbnQgcGluX3VzZXJfcGFnZXModW5zaWduZWQgbG9uZyBmaXJz
dF9wYWdlLAo+IC0JCQkgIHVuc2lnbmVkIGxvbmcgbGFzdF9wYWdlLAo+IC0JCQkgIHVuc2lnbmVk
IGludCBsYXN0X3BhZ2Vfc2l6ZSwKPiAtCQkJICBpbnQgaXNfd3JpdGUsCj4gLQkJCSAgc3RydWN0
IHBhZ2UgKnBhZ2VzW01BWF9CVUZGRVJTX1BFUl9DT01NQU5EXSwKPiAtCQkJICB1bnNpZ25lZCBp
bnQgKml0ZXJfbGFzdF9wYWdlX3NpemUpCj4gK3N0YXRpYyBpbnQgcGluX2dvbGRmaXNoX3BhZ2Vz
KHVuc2lnbmVkIGxvbmcgZmlyc3RfcGFnZSwKPiArCQkJICAgICAgdW5zaWduZWQgbG9uZyBsYXN0
X3BhZ2UsCj4gKwkJCSAgICAgIHVuc2lnbmVkIGludCBsYXN0X3BhZ2Vfc2l6ZSwKPiArCQkJICAg
ICAgaW50IGlzX3dyaXRlLAo+ICsJCQkgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZXNbTUFYX0JVRkZF
UlNfUEVSX0NPTU1BTkRdLAo+ICsJCQkgICAgICB1bnNpZ25lZCBpbnQgKml0ZXJfbGFzdF9wYWdl
X3NpemUpCj4gIHsKPiAgCWludCByZXQ7Cj4gIAlpbnQgcmVxdWVzdGVkX3BhZ2VzID0gKChsYXN0
X3BhZ2UgLSBmaXJzdF9wYWdlKSA+PiBQQUdFX1NISUZUKSArIDE7Cj4gQEAgLTM1NCw5ICszNTQs
OSBAQCBzdGF0aWMgaW50IHRyYW5zZmVyX21heF9idWZmZXJzKHN0cnVjdCBnb2xkZmlzaF9waXBl
ICpwaXBlLAo+ICAJaWYgKG11dGV4X2xvY2tfaW50ZXJydXB0aWJsZSgmcGlwZS0+bG9jaykpCj4g
IAkJcmV0dXJuIC1FUkVTVEFSVFNZUzsKPiAgCj4gLQlwYWdlc19jb3VudCA9IHBpbl91c2VyX3Bh
Z2VzKGZpcnN0X3BhZ2UsIGxhc3RfcGFnZSwKPiAtCQkJCSAgICAgbGFzdF9wYWdlX3NpemUsIGlz
X3dyaXRlLAo+IC0JCQkJICAgICBwaXBlLT5wYWdlcywgJml0ZXJfbGFzdF9wYWdlX3NpemUpOwo+
ICsJcGFnZXNfY291bnQgPSBwaW5fZ29sZGZpc2hfcGFnZXMoZmlyc3RfcGFnZSwgbGFzdF9wYWdl
LAo+ICsJCQkJCSBsYXN0X3BhZ2Vfc2l6ZSwgaXNfd3JpdGUsCj4gKwkJCQkJIHBpcGUtPnBhZ2Vz
LCAmaXRlcl9sYXN0X3BhZ2Vfc2l6ZSk7Cj4gIAlpZiAocGFnZXNfY291bnQgPCAwKSB7Cj4gIAkJ
bXV0ZXhfdW5sb2NrKCZwaXBlLT5sb2NrKTsKPiAgCQlyZXR1cm4gcGFnZXNfY291bnQ7Cj4gLS0g
Cj4gMi4yMy4wCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
