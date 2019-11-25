Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E14109616
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 00:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 278516E193;
	Mon, 25 Nov 2019 23:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 585506E113
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2019 23:10:54 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ddc5f7f0000>; Mon, 25 Nov 2019 15:10:56 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 25 Nov 2019 15:10:53 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 25 Nov 2019 15:10:53 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 25 Nov
 2019 23:10:53 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 25 Nov 2019 23:10:52 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5ddc5f7a0000>; Mon, 25 Nov 2019 15:10:52 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 11/19] drm/via: set FOLL_PIN via pin_user_pages_fast()
Date: Mon, 25 Nov 2019 15:10:27 -0800
Message-ID: <20191125231035.1539120-12-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191125231035.1539120-1-jhubbard@nvidia.com>
References: <20191125231035.1539120-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574723456; bh=ky7gpstoQdJr5rtxFEQnjpS0lvKe5L6cg7jiu/68ipE=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=J+YLib50L7MWejYivXcoG436SDLbAl1sHPPhErtSMF2e5mLm+2EUx8TiD97Nw8KMG
 RdM+sYx5me28kt/hXiB0hoyjds3MjQaijSn88xGmWNmvj/s6ir3a5BHH/ayIIoEQiT
 IWjJHz1LC/y81BKP6CETNcL6uKKDFaMtPmF+9RoI0hkbjNBDZV24yhOIL9S4Skc/I2
 fmO1P5XpTKXK+e2pIbainxuCnmJvkaHKfTFA+MQ2Gv06+agBDhyTEl5hvctuH8kYye
 eGFlw+MWg36Di6ZWRFGsaXGeWRvkxyB2nJJU0GLh22ULG3+OXrZZC6bImysvVAkuEz
 3ss/HN8lZ6rRg==
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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

Q29udmVydCBkcm0vdmlhIHRvIHVzZSB0aGUgbmV3IHBpbl91c2VyX3BhZ2VzX2Zhc3QoKSBjYWxs
LCB3aGljaCBzZXRzCkZPTExfUElOLiBTZXR0aW5nIEZPTExfUElOIGlzIG5vdyByZXF1aXJlZCBm
b3IgY29kZSB0aGF0IHJlcXVpcmVzCnRyYWNraW5nIG9mIHBpbm5lZCBwYWdlcywgYW5kIHRoZXJl
Zm9yZSBmb3IgYW55IGNvZGUgdGhhdCBjYWxscwpwdXRfdXNlcl9wYWdlKCkuCgpJbiBwYXJ0aWFs
IGFudGljaXBhdGlvbiBvZiB0aGlzIHdvcmssIHRoZSBkcm0vdmlhIGRyaXZlciB3YXMgYWxyZWFk
eQpjYWxsaW5nIHB1dF91c2VyX3BhZ2UoKSBpbnN0ZWFkIG9mIHB1dF9wYWdlKCkuIFRoZXJlZm9y
ZSwgaW4gb3JkZXIgdG8KY29udmVydCBmcm9tIHRoZSBnZXRfdXNlcl9wYWdlcygpL3B1dF9wYWdl
KCkgbW9kZWwsIHRvIHRoZQpwaW5fdXNlcl9wYWdlcygpL3B1dF91c2VyX3BhZ2UoKSBtb2RlbCwg
dGhlIG9ubHkgY2hhbmdlIHJlcXVpcmVkCmlzIHRvIGNoYW5nZSBnZXRfdXNlcl9wYWdlcygpIHRv
IHBpbl91c2VyX3BhZ2VzKCkuCgpBY2tlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRl
ckBmZndsbC5jaD4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRoYXQu
Y29tPgpSZXZpZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZpYS92
aWFfZG1hYmxpdC5jIGIvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5jCmluZGV4IDNk
YjAwMGFhY2QyNi4uMzdjNWU1NzI5OTNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmlh
L3ZpYV9kbWFibGl0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3ZpYS92aWFfZG1hYmxpdC5jCkBA
IC0yMzksNyArMjM5LDcgQEAgdmlhX2xvY2tfYWxsX2RtYV9wYWdlcyhkcm1fdmlhX3NnX2luZm9f
dCAqdnNnLCAgZHJtX3ZpYV9kbWFibGl0X3QgKnhmZXIpCiAJdnNnLT5wYWdlcyA9IHZ6YWxsb2Mo
YXJyYXlfc2l6ZShzaXplb2Yoc3RydWN0IHBhZ2UgKiksIHZzZy0+bnVtX3BhZ2VzKSk7CiAJaWYg
KE5VTEwgPT0gdnNnLT5wYWdlcykKIAkJcmV0dXJuIC1FTk9NRU07Ci0JcmV0ID0gZ2V0X3VzZXJf
cGFnZXNfZmFzdCgodW5zaWduZWQgbG9uZyl4ZmVyLT5tZW1fYWRkciwKKwlyZXQgPSBwaW5fdXNl
cl9wYWdlc19mYXN0KCh1bnNpZ25lZCBsb25nKXhmZXItPm1lbV9hZGRyLAogCQkJdnNnLT5udW1f
cGFnZXMsCiAJCQl2c2ctPmRpcmVjdGlvbiA9PSBETUFfRlJPTV9ERVZJQ0UgPyBGT0xMX1dSSVRF
IDogMCwKIAkJCXZzZy0+cGFnZXMpOwotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
