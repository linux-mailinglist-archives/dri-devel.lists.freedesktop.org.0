Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 287CAF83ED
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:07:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B766D6EA05;
	Tue, 12 Nov 2019 00:07:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 697AE6EA05
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:11 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7b10000>; Mon, 11 Nov 2019 16:07:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:11 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:10 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:09 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7ac0001>; Mon, 11 Nov 2019 16:07:09 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 06/23] IB/umem: use get_user_pages_fast() to pin DMA pages
Date: Mon, 11 Nov 2019 16:06:43 -0800
Message-ID: <20191112000700.3455038-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517233; bh=PPNQFWxgYbSBG60Oh3uZy3iaVFj8VG12aJVlvrNgBtA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=KhLyNKkCzhj34VhXuUGSIyHKFQpNlddwQKTMNRSggrE3w/lk5jSmv2ZPbZbufxy2D
 DwaHNn9deLnwb+9S3bnPYQt2Y8a3N/x+xRd7lyCZjJtBVXS48USN4LyP/T0wSL31A9
 PHqCuFVCls1I4InDR/rmL4jQ59eW6S2dzy1GP6jDulz/TY3IS2beeDr/v5uOBQkkt8
 cgTue/HPtPzjoomkooCtsjx52sbOSGnuwdu4CRFlEX4ieAvkNbohjJOFrY+GPgctFC
 eybfSvcxdSFjY5MlzuusMY1vIOFT2942rU66o5rV0txugAXwkPygIU4TkcCtTuqA4d
 LT2EnhJx44zxw==
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

QW5kIGdldCByaWQgb2YgdGhlIG1tYXBfc2VtIGNhbGxzLCBhcyBwYXJ0IG9mIHRoYXQuIE5vdGUK
dGhhdCBnZXRfdXNlcl9wYWdlc19mYXN0KCkgd2lsbCwgaWYgbmVjZXNzYXJ5LCBmYWxsIGJhY2sg
dG8KX19ndXBfbG9uZ3Rlcm1fdW5sb2NrZWQoKSwgd2hpY2ggdGFrZXMgdGhlIG1tYXBfc2VtIGFz
IG5lZWRlZC4KClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+CkNj
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0B6aWVwZS5jYT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJi
YXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3Vt
ZW0uYyB8IDE3ICsrKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2luZmluaWJhbmQvY29y
ZS91bWVtLmMgYi9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMKaW5kZXggMjQyNDRhMmY2
OGNjLi4zZDY2NGEyNTM5ZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3Vt
ZW0uYworKysgYi9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMKQEAgLTI3MSwxNiArMjcx
LDEzIEBAIHN0cnVjdCBpYl91bWVtICppYl91bWVtX2dldChzdHJ1Y3QgaWJfdWRhdGEgKnVkYXRh
LCB1bnNpZ25lZCBsb25nIGFkZHIsCiAJc2cgPSB1bWVtLT5zZ19oZWFkLnNnbDsKIAogCXdoaWxl
IChucGFnZXMpIHsKLQkJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwotCQlyZXQgPSBnZXRfdXNl
cl9wYWdlcyhjdXJfYmFzZSwKLQkJCQkgICAgIG1pbl90KHVuc2lnbmVkIGxvbmcsIG5wYWdlcywK
LQkJCQkJICAgUEFHRV9TSVpFIC8gc2l6ZW9mIChzdHJ1Y3QgcGFnZSAqKSksCi0JCQkJICAgICBn
dXBfZmxhZ3MgfCBGT0xMX0xPTkdURVJNLAotCQkJCSAgICAgcGFnZV9saXN0LCBOVUxMKTsKLQkJ
aWYgKHJldCA8IDApIHsKLQkJCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7CisJCXJldCA9IGdldF91
c2VyX3BhZ2VzX2Zhc3QoY3VyX2Jhc2UsCisJCQkJCSAgbWluX3QodW5zaWduZWQgbG9uZywgbnBh
Z2VzLAorCQkJCQkJUEFHRV9TSVpFIC8KKwkJCQkJCXNpemVvZihzdHJ1Y3QgcGFnZSAqKSksCisJ
CQkJCSAgZ3VwX2ZsYWdzIHwgRk9MTF9MT05HVEVSTSwgcGFnZV9saXN0KTsKKwkJaWYgKHJldCA8
IDApCiAJCQlnb3RvIHVtZW1fcmVsZWFzZTsKLQkJfQogCiAJCWN1cl9iYXNlICs9IHJldCAqIFBB
R0VfU0laRTsKIAkJbnBhZ2VzICAgLT0gcmV0OwpAQCAtMjg4LDggKzI4NSw2IEBAIHN0cnVjdCBp
Yl91bWVtICppYl91bWVtX2dldChzdHJ1Y3QgaWJfdWRhdGEgKnVkYXRhLCB1bnNpZ25lZCBsb25n
IGFkZHIsCiAJCXNnID0gaWJfdW1lbV9hZGRfc2dfdGFibGUoc2csIHBhZ2VfbGlzdCwgcmV0LAog
CQkJZG1hX2dldF9tYXhfc2VnX3NpemUoY29udGV4dC0+ZGV2aWNlLT5kbWFfZGV2aWNlKSwKIAkJ
CSZ1bWVtLT5zZ19uZW50cyk7Ci0KLQkJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAl9CiAKIAlz
Z19tYXJrX2VuZChzZyk7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
