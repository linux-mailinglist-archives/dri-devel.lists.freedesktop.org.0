Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 631171335EC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2020 23:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3746E14F;
	Tue,  7 Jan 2020 22:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5168A6E14A
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2020 22:46:02 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1509f90002>; Tue, 07 Jan 2020 14:45:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 07 Jan 2020 14:46:01 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 07 Jan 2020 14:46:01 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 7 Jan
 2020 22:46:01 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Tue, 7 Jan 2020 22:46:01 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e150a290003>; Tue, 07 Jan 2020 14:46:01 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v12 15/22] drm/via: set FOLL_PIN via pin_user_pages_fast()
Date: Tue, 7 Jan 2020 14:45:51 -0800
Message-ID: <20200107224558.2362728-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200107224558.2362728-1-jhubbard@nvidia.com>
References: <20200107224558.2362728-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1578437113; bh=M8m3areLiJXzsWGTzwt0Tom+AGNkSKa8vXpcaZXAT+Q=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=Jep58RA3tD6aH8WePaR+9DeIR0dYIEvsgosT0fTYdM5vW0CPch5FUp9cwqAGvvIrc
 l+dMDIDHGZHB9Q3BfM79AuOWuxUqjxz6RZnpOIctCa2Gdedxm2iag1668j3Gfpysxg
 790sKap/bmuanHWBtf8piNMu5z1uvMDjzlAqxFGj1x+TCqOskP2DLS4k9hAo/o8cPR
 LO0jwFKKO+Yy4UpJrVyARnT0LAdd8W4ukIxzZOiQSpyuNLgM9cnvWlwYZrtMpBhUpM
 wt4mInAAT2V3P95XnM3mUDkRjebC1KEn5i4Vz8zIhMtuoVhNrvH5itiR5rlHp+jgcE
 l2rCTnOEki3JA==
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
 Al Viro <viro@zeniv.linux.org.uk>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>,
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
IDogMCwKIAkJCXZzZy0+cGFnZXMpOwotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
