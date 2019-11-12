Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0E2F8401
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:07:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C85286EA0F;
	Tue, 12 Nov 2019 00:07:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F4B96EA0F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:16 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7750000>; Mon, 11 Nov 2019 16:06:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 11 Nov 2019 16:07:15 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:15 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:14 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7b10000>; Mon, 11 Nov 2019 16:07:14 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 10/23] goldish_pipe: convert to pin_user_pages() and
 put_user_page()
Date: Mon, 11 Nov 2019 16:06:47 -0800
Message-ID: <20191112000700.3455038-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517173; bh=1bdN1LXqKv0ya/hHPLN7inRIruwmJpRdnobIHlrvKRo=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=KzkkAZESmQXtGSFgWwG+sXWHcksTmOK88stfKoP8k1nw0eg1k1n7n7k3KMTtt0LyG
 G89SLPYAyfVse2C8PIFzEzOT6xIYX+TUEXtBuPp+eAwOy54UbelYtqyqYRfIRGokVS
 KCJTgNJMCoG5Dc2Ygi8THMLQHTfJujxgoYbVH600GHZ4enTwSOnsVCoyICAGe2fjvO
 /0L8YgDcIW+ZlGcSbHQM34bM/FhTobXA+62TTUAJfBP8JBJErh3UMcVSM7INQlIM3y
 qOQMbPuE1s239xB9nXq2bwxnUuRlqaYgrXILTdYi6kCr7loexReBQ0+AZOHiaWjxHU
 p5XXsz50ik9HQ==
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
L3IvMjAxOTA3MjMxNTM2NDAuR0I3MjBAbHN0LmRlCgpSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxp
cmEud2VpbnlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJk
QG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBl
LmMgfCAxNyArKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMTQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS9nb2xkZmlz
aC9nb2xkZmlzaF9waXBlLmMgYi9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3Bp
cGUuYwppbmRleCA3ZWQyYTIxYTBiYWMuLjYzNWE4YmMxYjQ4MCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9wbGF0Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBlLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9y
bS9nb2xkZmlzaC9nb2xkZmlzaF9waXBlLmMKQEAgLTI3NCw3ICsyNzQsNyBAQCBzdGF0aWMgaW50
IHBpbl9nb2xkZmlzaF9wYWdlcyh1bnNpZ25lZCBsb25nIGZpcnN0X3BhZ2UsCiAJCSppdGVyX2xh
c3RfcGFnZV9zaXplID0gbGFzdF9wYWdlX3NpemU7CiAJfQogCi0JcmV0ID0gZ2V0X3VzZXJfcGFn
ZXNfZmFzdChmaXJzdF9wYWdlLCByZXF1ZXN0ZWRfcGFnZXMsCisJcmV0ID0gcGluX3VzZXJfcGFn
ZXNfZmFzdChmaXJzdF9wYWdlLCByZXF1ZXN0ZWRfcGFnZXMsCiAJCQkJICAhaXNfd3JpdGUgPyBG
T0xMX1dSSVRFIDogMCwKIAkJCQkgIHBhZ2VzKTsKIAlpZiAocmV0IDw9IDApCkBAIC0yODUsMTgg
KzI4NSw2IEBAIHN0YXRpYyBpbnQgcGluX2dvbGRmaXNoX3BhZ2VzKHVuc2lnbmVkIGxvbmcgZmly
c3RfcGFnZSwKIAlyZXR1cm4gcmV0OwogfQogCi1zdGF0aWMgdm9pZCByZWxlYXNlX3VzZXJfcGFn
ZXMoc3RydWN0IHBhZ2UgKipwYWdlcywgaW50IHBhZ2VzX2NvdW50LAotCQkJICAgICAgIGludCBp
c193cml0ZSwgczMyIGNvbnN1bWVkX3NpemUpCi17Ci0JaW50IGk7Ci0KLQlmb3IgKGkgPSAwOyBp
IDwgcGFnZXNfY291bnQ7IGkrKykgewotCQlpZiAoIWlzX3dyaXRlICYmIGNvbnN1bWVkX3NpemUg
PiAwKQotCQkJc2V0X3BhZ2VfZGlydHkocGFnZXNbaV0pOwotCQlwdXRfcGFnZShwYWdlc1tpXSk7
Ci0JfQotfQotCiAvKiBQb3B1bGF0ZSB0aGUgY2FsbCBwYXJhbWV0ZXJzLCBtZXJnaW5nIGFkamFj
ZW50IHBhZ2VzIHRvZ2V0aGVyICovCiBzdGF0aWMgdm9pZCBwb3B1bGF0ZV9yd19wYXJhbXMoc3Ry
dWN0IHBhZ2UgKipwYWdlcywKIAkJCSAgICAgICBpbnQgcGFnZXNfY291bnQsCkBAIC0zNzIsNyAr
MzYwLDggQEAgc3RhdGljIGludCB0cmFuc2Zlcl9tYXhfYnVmZmVycyhzdHJ1Y3QgZ29sZGZpc2hf
cGlwZSAqcGlwZSwKIAogCSpjb25zdW1lZF9zaXplID0gcGlwZS0+Y29tbWFuZF9idWZmZXItPnJ3
X3BhcmFtcy5jb25zdW1lZF9zaXplOwogCi0JcmVsZWFzZV91c2VyX3BhZ2VzKHBpcGUtPnBhZ2Vz
LCBwYWdlc19jb3VudCwgaXNfd3JpdGUsICpjb25zdW1lZF9zaXplKTsKKwlwdXRfdXNlcl9wYWdl
c19kaXJ0eV9sb2NrKHBpcGUtPnBhZ2VzLCBwYWdlc19jb3VudCwKKwkJCQkgICFpc193cml0ZSAm
JiAqY29uc3VtZWRfc2l6ZSA+IDApOwogCiAJbXV0ZXhfdW5sb2NrKCZwaXBlLT5sb2NrKTsKIAly
ZXR1cm4gMDsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
