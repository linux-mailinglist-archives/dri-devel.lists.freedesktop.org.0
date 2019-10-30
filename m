Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A44E7EAC38
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA0996EDE5;
	Thu, 31 Oct 2019 09:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991276EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:42 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba138b0000>; Wed, 30 Oct 2019 15:49:47 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:42 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:42 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:41 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:40 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba13830000>; Wed, 30 Oct 2019 15:49:40 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 06/19] goldish_pipe: convert to pin_user_pages() and
 put_user_page()
Date: Wed, 30 Oct 2019 15:49:17 -0700
Message-ID: <20191030224930.3990755-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475787; bh=w1mGkll55W/F61ikcVy7cICFWorcB7JiCtRQJEe0514=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=peTnoPWML8WCJAUu8vvOzOvbfQQErovk+TwLtVZgw6WFjHDzECbbi8VfezEKC0nUb
 oXVTkAZI3Pql6PtBqLYGZ7aJjNZR3R9OUybtwSpMXJTlJaX5zAO5D7bhEP/IdgL7Gq
 2Dsi9XUoaFagZBsoMTaUXUQH1cRFS+2d7LM6ywVFaN4KvOe7841rUdbANPYeyjIz/x
 yfdslwhoUrsu0jtrilAjuu4ea6C5Rj52zqv1cItlim2f/+U1fa4dft9nx846RvZrS9
 whgQbKGIIEIwLKNT+yUksO/PfTG5Tiu3Cyf3wLtvqqD5Ql68s+IbjsZL7KiMqEF83R
 1TsgH97tFJpgg==
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>,
 Mike Kravetz <mike.kravetz@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MS4gQ2FsbCB0aGUgbmV3IGdsb2JhbCBwaW5fdXNlcl9wYWdlc19mYXN0KCksIGZyb20gcGluX2dv
bGRmaXNoX3BhZ2VzKCkuCgoyLiBBcyByZXF1aXJlZCBieSBwaW5fdXNlcl9wYWdlcygpLCByZWxl
YXNlIHRoZXNlIHBhZ2VzIHZpYQpwdXRfdXNlcl9wYWdlKCkuIEluIHRoaXMgY2FzZSwgZG8gc28g
dmlhIHB1dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soKS4KClRoYXQgaGFzIHRoZSBzaWRlIGVmZmVj
dCBvZiBjYWxsaW5nIHNldF9wYWdlX2RpcnR5X2xvY2soKSwgaW5zdGVhZApvZiBzZXRfcGFnZV9k
aXJ0eSgpLiBUaGlzIGlzIHByb2JhYmx5IG1vcmUgYWNjdXJhdGUuCgpBcyBDaHJpc3RvcGggSGVs
bHdpZyBwdXQgaXQsICJzZXRfcGFnZV9kaXJ0eSgpIGlzIG9ubHkgc2FmZSBpZiB3ZSBhcmUKZGVh
bGluZyB3aXRoIGEgZmlsZSBiYWNrZWQgcGFnZSB3aGVyZSB3ZSBoYXZlIHJlZmVyZW5jZSBvbiB0
aGUgaW5vZGUgaXQKaGFuZ3Mgb2ZmLiIgWzFdCgpBbm90aGVyIHNpZGUgZWZmZWN0IGlzIHRoYXQg
dGhlIHJlbGVhc2UgY29kZSBpcyBzaW1wbGlmaWVkIGJlY2F1c2UKdGhlIHBhZ2VbXSBsb29wIGlz
IG5vdyBpbiBndXAuYyBpbnN0ZWFkIG9mIGhlcmUsIHNvIGp1c3QgZGVsZXRlIHRoZQpsb2NhbCBy
ZWxlYXNlX3VzZXJfcGFnZXMoKSBlbnRpcmVseSwgYW5kIGNhbGwKcHV0X3VzZXJfcGFnZXNfZGly
dHlfbG9jaygpIGRpcmVjdGx5LCBpbnN0ZWFkLgoKWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJh
cmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9n
b2xkZmlzaF9waXBlLmMgfCAxNyArKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0
Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBlLmMgYi9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNo
L2dvbGRmaXNoX3BpcGUuYwppbmRleCA3ZWQyYTIxYTBiYWMuLjYzNWE4YmMxYjQ4MCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBlLmMKKysrIGIvZHJp
dmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBlLmMKQEAgLTI3NCw3ICsyNzQsNyBA
QCBzdGF0aWMgaW50IHBpbl9nb2xkZmlzaF9wYWdlcyh1bnNpZ25lZCBsb25nIGZpcnN0X3BhZ2Us
CiAJCSppdGVyX2xhc3RfcGFnZV9zaXplID0gbGFzdF9wYWdlX3NpemU7CiAJfQogCi0JcmV0ID0g
Z2V0X3VzZXJfcGFnZXNfZmFzdChmaXJzdF9wYWdlLCByZXF1ZXN0ZWRfcGFnZXMsCisJcmV0ID0g
cGluX3VzZXJfcGFnZXNfZmFzdChmaXJzdF9wYWdlLCByZXF1ZXN0ZWRfcGFnZXMsCiAJCQkJICAh
aXNfd3JpdGUgPyBGT0xMX1dSSVRFIDogMCwKIAkJCQkgIHBhZ2VzKTsKIAlpZiAocmV0IDw9IDAp
CkBAIC0yODUsMTggKzI4NSw2IEBAIHN0YXRpYyBpbnQgcGluX2dvbGRmaXNoX3BhZ2VzKHVuc2ln
bmVkIGxvbmcgZmlyc3RfcGFnZSwKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgdm9pZCByZWxl
YXNlX3VzZXJfcGFnZXMoc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IHBhZ2VzX2NvdW50LAotCQkJ
ICAgICAgIGludCBpc193cml0ZSwgczMyIGNvbnN1bWVkX3NpemUpCi17Ci0JaW50IGk7Ci0KLQlm
b3IgKGkgPSAwOyBpIDwgcGFnZXNfY291bnQ7IGkrKykgewotCQlpZiAoIWlzX3dyaXRlICYmIGNv
bnN1bWVkX3NpemUgPiAwKQotCQkJc2V0X3BhZ2VfZGlydHkocGFnZXNbaV0pOwotCQlwdXRfcGFn
ZShwYWdlc1tpXSk7Ci0JfQotfQotCiAvKiBQb3B1bGF0ZSB0aGUgY2FsbCBwYXJhbWV0ZXJzLCBt
ZXJnaW5nIGFkamFjZW50IHBhZ2VzIHRvZ2V0aGVyICovCiBzdGF0aWMgdm9pZCBwb3B1bGF0ZV9y
d19wYXJhbXMoc3RydWN0IHBhZ2UgKipwYWdlcywKIAkJCSAgICAgICBpbnQgcGFnZXNfY291bnQs
CkBAIC0zNzIsNyArMzYwLDggQEAgc3RhdGljIGludCB0cmFuc2Zlcl9tYXhfYnVmZmVycyhzdHJ1
Y3QgZ29sZGZpc2hfcGlwZSAqcGlwZSwKIAogCSpjb25zdW1lZF9zaXplID0gcGlwZS0+Y29tbWFu
ZF9idWZmZXItPnJ3X3BhcmFtcy5jb25zdW1lZF9zaXplOwogCi0JcmVsZWFzZV91c2VyX3BhZ2Vz
KHBpcGUtPnBhZ2VzLCBwYWdlc19jb3VudCwgaXNfd3JpdGUsICpjb25zdW1lZF9zaXplKTsKKwlw
dXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKHBpcGUtPnBhZ2VzLCBwYWdlc19jb3VudCwKKwkJCQkg
ICFpc193cml0ZSAmJiAqY29uc3VtZWRfc2l6ZSA+IDApOwogCiAJbXV0ZXhfdW5sb2NrKCZwaXBl
LT5sb2NrKTsKIAlyZXR1cm4gMDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
