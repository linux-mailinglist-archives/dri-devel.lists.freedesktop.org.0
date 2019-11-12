Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0BDF83F2
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:07:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60B206EA09;
	Tue, 12 Nov 2019 00:07:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947BA6EA05
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:10 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7b00000>; Mon, 11 Nov 2019 16:07:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:10 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 11 Nov 2019 16:07:10 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:09 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:08 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7ab0000>; Mon, 11 Nov 2019 16:07:08 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 05/23] goldish_pipe: rename local pin_user_pages() routine
Date: Mon, 11 Nov 2019 16:06:42 -0800
Message-ID: <20191112000700.3455038-6-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517233; bh=OvCIL0+nr8EQ3ucOYL7z+Bd4Y3AXJzaosdg9/Wp2t2k=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=V83Mm/mgD13wOskCVUg3jXnnwavnPQ3ylc/JhyLve0YbkPqUMMHZTXt9R3Coa9qBI
 80xP6p17NB70zDrJDKM0H06sAl8/jk3I6sztgeF1r+2JvnRlR/gRrgYjRd7k2qYRvF
 +etmspepNCoSfoh6DuJ9/Tl8quVDHw6f0ZMNYbPHAmdMqdIErdjTDHj7kfctfYwHYJ
 JrQM4B4WS9e1j6/4cRSDe44i8Ut0ljDfyI3fIr7hg3xeYD37/uLAn+pj5hfJLOPdfS
 YfZPx8xiCB4HatUs9wFbCohJOTXKLLcrnHTUpGh/cMLJ3coAlt4cJM6JmF3rNz8d1h
 pWma1MKSn5Urw==
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

MS4gQXZvaWQgbmFtaW5nIGNvbmZsaWN0czogcmVuYW1lIGxvY2FsIHN0YXRpYyBmdW5jdGlvbiBm
cm9tCiJwaW5fdXNlcl9wYWdlcygpIiB0byAicGluX2dvbGRmaXNoX3BhZ2VzKCkiLgoKQW4gdXBj
b21pbmcgcGF0Y2ggd2lsbCBpbnRyb2R1Y2UgYSBnbG9iYWwgcGluX3VzZXJfcGFnZXMoKQpmdW5j
dGlvbi4KClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4K
UmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KU2lnbmVkLW9mZi1i
eTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvcGxhdGZv
cm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jIHwgMTggKysrKysrKysrLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jIGIvZHJpdmVycy9wbGF0
Zm9ybS9nb2xkZmlzaC9nb2xkZmlzaF9waXBlLmMKaW5kZXggY2VmMDEzM2FhNDdhLi43ZWQyYTIx
YTBiYWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlw
ZS5jCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCkBAIC0y
NTcsMTIgKzI1NywxMiBAQCBzdGF0aWMgaW50IGdvbGRmaXNoX3BpcGVfZXJyb3JfY29udmVydChp
bnQgc3RhdHVzKQogCX0KIH0KIAotc3RhdGljIGludCBwaW5fdXNlcl9wYWdlcyh1bnNpZ25lZCBs
b25nIGZpcnN0X3BhZ2UsCi0JCQkgIHVuc2lnbmVkIGxvbmcgbGFzdF9wYWdlLAotCQkJICB1bnNp
Z25lZCBpbnQgbGFzdF9wYWdlX3NpemUsCi0JCQkgIGludCBpc193cml0ZSwKLQkJCSAgc3RydWN0
IHBhZ2UgKnBhZ2VzW01BWF9CVUZGRVJTX1BFUl9DT01NQU5EXSwKLQkJCSAgdW5zaWduZWQgaW50
ICppdGVyX2xhc3RfcGFnZV9zaXplKQorc3RhdGljIGludCBwaW5fZ29sZGZpc2hfcGFnZXModW5z
aWduZWQgbG9uZyBmaXJzdF9wYWdlLAorCQkJICAgICAgdW5zaWduZWQgbG9uZyBsYXN0X3BhZ2Us
CisJCQkgICAgICB1bnNpZ25lZCBpbnQgbGFzdF9wYWdlX3NpemUsCisJCQkgICAgICBpbnQgaXNf
d3JpdGUsCisJCQkgICAgICBzdHJ1Y3QgcGFnZSAqcGFnZXNbTUFYX0JVRkZFUlNfUEVSX0NPTU1B
TkRdLAorCQkJICAgICAgdW5zaWduZWQgaW50ICppdGVyX2xhc3RfcGFnZV9zaXplKQogewogCWlu
dCByZXQ7CiAJaW50IHJlcXVlc3RlZF9wYWdlcyA9ICgobGFzdF9wYWdlIC0gZmlyc3RfcGFnZSkg
Pj4gUEFHRV9TSElGVCkgKyAxOwpAQCAtMzU0LDkgKzM1NCw5IEBAIHN0YXRpYyBpbnQgdHJhbnNm
ZXJfbWF4X2J1ZmZlcnMoc3RydWN0IGdvbGRmaXNoX3BpcGUgKnBpcGUsCiAJaWYgKG11dGV4X2xv
Y2tfaW50ZXJydXB0aWJsZSgmcGlwZS0+bG9jaykpCiAJCXJldHVybiAtRVJFU1RBUlRTWVM7CiAK
LQlwYWdlc19jb3VudCA9IHBpbl91c2VyX3BhZ2VzKGZpcnN0X3BhZ2UsIGxhc3RfcGFnZSwKLQkJ
CQkgICAgIGxhc3RfcGFnZV9zaXplLCBpc193cml0ZSwKLQkJCQkgICAgIHBpcGUtPnBhZ2VzLCAm
aXRlcl9sYXN0X3BhZ2Vfc2l6ZSk7CisJcGFnZXNfY291bnQgPSBwaW5fZ29sZGZpc2hfcGFnZXMo
Zmlyc3RfcGFnZSwgbGFzdF9wYWdlLAorCQkJCQkgbGFzdF9wYWdlX3NpemUsIGlzX3dyaXRlLAor
CQkJCQkgcGlwZS0+cGFnZXMsICZpdGVyX2xhc3RfcGFnZV9zaXplKTsKIAlpZiAocGFnZXNfY291
bnQgPCAwKSB7CiAJCW11dGV4X3VubG9jaygmcGlwZS0+bG9jayk7CiAJCXJldHVybiBwYWdlc19j
b3VudDsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
