Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F52101BD1
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:17:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD61F6EC8B;
	Tue, 19 Nov 2019 08:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9116ECA3
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:16:56 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3a4f80001>; Tue, 19 Nov 2019 00:16:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:16:56 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 00:16:56 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 08:16:54 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:16:54 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd3a4f40003>; Tue, 19 Nov 2019 00:16:53 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 07/24] IB/umem: use get_user_pages_fast() to pin DMA pages
Date: Tue, 19 Nov 2019 00:16:26 -0800
Message-ID: <20191119081643.1866232-8-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119081643.1866232-1-jhubbard@nvidia.com>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574151416; bh=qyPjlUl206QVQFHI7iGgz2aRN3LekupswNOi4m6XHTs=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=C/4j2Ax2OS6VlULIgk5V051kdWkhb8CwK4u1nEFjvU7FGhWo+SOaPjxv2+kMYcz50
 Fbv3ivGA3mzl0XlszydzZaAfJC8hTV64iGW5KvtR9IPQeqiX+/Lx4gFVqcvwRKJxOz
 bdn+M9/CpEcAQnpFWvUUuF5H8ukEBthaW6m/TYHmjPuh4S9q7Xzg8yZ3bGUxkhfBjn
 YhQ1RwZ+o+ewsBCuuKbP8qfxFx0uSBIicaZd7B1Q4B3+p5RN+ZoXe7lOpLYHupZZry
 yMZFzHrpjAEokWWBzmcYSdPgZdcbNl63KdX/xsxbFR5miemdWrzQekD2bugodL6Cx4
 kYHxTaxO13+DA==
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
 linux-mm@kvack.org, Paul
 Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>, Jason
 Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
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
IG5lZWRlZC4KClJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpSZXZpZXdlZC1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpSZXZpZXdlZC1ieTogSXJhIFdl
aW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpo
dWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5jIHwg
MTcgKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEx
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0u
YyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYwppbmRleCAyNDI0NGEyZjY4Y2MuLjNk
NjY0YTI1MzllYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5jCisr
KyBiL2RyaXZlcnMvaW5maW5pYmFuZC9jb3JlL3VtZW0uYwpAQCAtMjcxLDE2ICsyNzEsMTMgQEAg
c3RydWN0IGliX3VtZW0gKmliX3VtZW1fZ2V0KHN0cnVjdCBpYl91ZGF0YSAqdWRhdGEsIHVuc2ln
bmVkIGxvbmcgYWRkciwKIAlzZyA9IHVtZW0tPnNnX2hlYWQuc2dsOwogCiAJd2hpbGUgKG5wYWdl
cykgewotCQlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7Ci0JCXJldCA9IGdldF91c2VyX3BhZ2Vz
KGN1cl9iYXNlLAotCQkJCSAgICAgbWluX3QodW5zaWduZWQgbG9uZywgbnBhZ2VzLAotCQkJCQkg
ICBQQUdFX1NJWkUgLyBzaXplb2YgKHN0cnVjdCBwYWdlICopKSwKLQkJCQkgICAgIGd1cF9mbGFn
cyB8IEZPTExfTE9OR1RFUk0sCi0JCQkJICAgICBwYWdlX2xpc3QsIE5VTEwpOwotCQlpZiAocmV0
IDwgMCkgewotCQkJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKKwkJcmV0ID0gZ2V0X3VzZXJfcGFn
ZXNfZmFzdChjdXJfYmFzZSwKKwkJCQkJICBtaW5fdCh1bnNpZ25lZCBsb25nLCBucGFnZXMsCisJ
CQkJCQlQQUdFX1NJWkUgLworCQkJCQkJc2l6ZW9mKHN0cnVjdCBwYWdlICopKSwKKwkJCQkJICBn
dXBfZmxhZ3MgfCBGT0xMX0xPTkdURVJNLCBwYWdlX2xpc3QpOworCQlpZiAocmV0IDwgMCkKIAkJ
CWdvdG8gdW1lbV9yZWxlYXNlOwotCQl9CiAKIAkJY3VyX2Jhc2UgKz0gcmV0ICogUEFHRV9TSVpF
OwogCQlucGFnZXMgICAtPSByZXQ7CkBAIC0yODgsOCArMjg1LDYgQEAgc3RydWN0IGliX3VtZW0g
KmliX3VtZW1fZ2V0KHN0cnVjdCBpYl91ZGF0YSAqdWRhdGEsIHVuc2lnbmVkIGxvbmcgYWRkciwK
IAkJc2cgPSBpYl91bWVtX2FkZF9zZ190YWJsZShzZywgcGFnZV9saXN0LCByZXQsCiAJCQlkbWFf
Z2V0X21heF9zZWdfc2l6ZShjb250ZXh0LT5kZXZpY2UtPmRtYV9kZXZpY2UpLAogCQkJJnVtZW0t
PnNnX25lbnRzKTsKLQotCQl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOwogCX0KIAogCXNnX21hcmtf
ZW5kKHNnKTsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
