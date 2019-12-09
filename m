Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4ED1179FB
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 928406E5B2;
	Mon,  9 Dec 2019 22:54:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47A786E5A0
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:03 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed0760001>; Mon, 09 Dec 2019 14:53:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:54:02 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 09 Dec 2019 14:54:02 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:53:59 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:53:57 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed0840004>; Mon, 09 Dec 2019 14:53:57 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 09/26] IB/umem: use get_user_pages_fast() to pin DMA pages
Date: Mon, 9 Dec 2019 14:53:27 -0800
Message-ID: <20191209225344.99740-10-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932022; bh=KTo+Vd9z7NzEKl8A1/yToX+DbFwwWmKCvDQHXC5NnHk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=I/a66LZB+BWjjEwaZhCTiAATPaKcaGOYfmxTxoglFKu01vsrHLxJ6Ocms1ZpOKJ13
 LDzbNCogDa0wWDiois2S1i8eV5jG6NwZ2mCwtsgqFYBoWJD74NSMg3b5BcLbKQc4td
 8sB9aUXgP+XrAcw+9CdXONTKdTy10gL/UdY+6R7Z2nTGWCE1ff37MEfm4AG5B6vZDR
 s/sA43qOwfAqtcnItvNy+tDKr/Mop2nhKo+0mAM+JqKgBRR/AbZM7H52crXltqXn3m
 AcXzLxvPUcxO0Ag1O/S6nUv3oKGi3deUwMVzzxIyKkdYdV6BrZSj/Ndpc0uOcxqFzJ
 pee3JlzYL13IQ==
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
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 Jonathan Corbet <corbet@lwn.net>, linux-rdma@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jason
 Gunthorpe <jgg@mellanox.com>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org, Leon
 Romanovsky <leonro@mellanox.com>,
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
IG5lZWRlZC4KClJldmlld2VkLWJ5OiBMZW9uIFJvbWFub3Zza3kgPGxlb25yb0BtZWxsYW5veC5j
b20+ClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQt
Ynk6IEphbiBLYXJhIDxqYWNrQHN1c2UuY3o+ClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0BtZWxsYW5veC5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4K
LS0tCiBkcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMgfCAxNyArKysrKystLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9pbmZpbmliYW5kL2NvcmUvdW1lbS5jIGIvZHJpdmVycy9pbmZpbmli
YW5kL2NvcmUvdW1lbS5jCmluZGV4IDdhM2I5OTU5N2VhZC4uMjE0ZTg3YWE2MDlkIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2luZmluaWJhbmQvY29yZS91bWVtLmMKKysrIGIvZHJpdmVycy9pbmZpbmli
YW5kL2NvcmUvdW1lbS5jCkBAIC0yNjYsMTYgKzI2NiwxMyBAQCBzdHJ1Y3QgaWJfdW1lbSAqaWJf
dW1lbV9nZXQoc3RydWN0IGliX3VkYXRhICp1ZGF0YSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCXNn
ID0gdW1lbS0+c2dfaGVhZC5zZ2w7CiAKIAl3aGlsZSAobnBhZ2VzKSB7Ci0JCWRvd25fcmVhZCgm
bW0tPm1tYXBfc2VtKTsKLQkJcmV0ID0gZ2V0X3VzZXJfcGFnZXMoY3VyX2Jhc2UsCi0JCQkJICAg
ICBtaW5fdCh1bnNpZ25lZCBsb25nLCBucGFnZXMsCi0JCQkJCSAgIFBBR0VfU0laRSAvIHNpemVv
ZiAoc3RydWN0IHBhZ2UgKikpLAotCQkJCSAgICAgZ3VwX2ZsYWdzIHwgRk9MTF9MT05HVEVSTSwK
LQkJCQkgICAgIHBhZ2VfbGlzdCwgTlVMTCk7Ci0JCWlmIChyZXQgPCAwKSB7Ci0JCQl1cF9yZWFk
KCZtbS0+bW1hcF9zZW0pOworCQlyZXQgPSBnZXRfdXNlcl9wYWdlc19mYXN0KGN1cl9iYXNlLAor
CQkJCQkgIG1pbl90KHVuc2lnbmVkIGxvbmcsIG5wYWdlcywKKwkJCQkJCVBBR0VfU0laRSAvCisJ
CQkJCQlzaXplb2Yoc3RydWN0IHBhZ2UgKikpLAorCQkJCQkgIGd1cF9mbGFncyB8IEZPTExfTE9O
R1RFUk0sIHBhZ2VfbGlzdCk7CisJCWlmIChyZXQgPCAwKQogCQkJZ290byB1bWVtX3JlbGVhc2U7
Ci0JCX0KIAogCQljdXJfYmFzZSArPSByZXQgKiBQQUdFX1NJWkU7CiAJCW5wYWdlcyAgIC09IHJl
dDsKQEAgLTI4Myw4ICsyODAsNiBAQCBzdHJ1Y3QgaWJfdW1lbSAqaWJfdW1lbV9nZXQoc3RydWN0
IGliX3VkYXRhICp1ZGF0YSwgdW5zaWduZWQgbG9uZyBhZGRyLAogCQlzZyA9IGliX3VtZW1fYWRk
X3NnX3RhYmxlKHNnLCBwYWdlX2xpc3QsIHJldCwKIAkJCWRtYV9nZXRfbWF4X3NlZ19zaXplKGNv
bnRleHQtPmRldmljZS0+ZG1hX2RldmljZSksCiAJCQkmdW1lbS0+c2dfbmVudHMpOwotCi0JCXVw
X3JlYWQoJm1tLT5tbWFwX3NlbSk7CiAJfQogCiAJc2dfbWFya19lbmQoc2cpOwotLSAKMi4yNC4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
