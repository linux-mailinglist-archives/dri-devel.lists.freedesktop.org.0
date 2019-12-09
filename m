Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D151179F6
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C706E5AB;
	Mon,  9 Dec 2019 22:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2425D6E5AB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:03 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed0760000>; Mon, 09 Dec 2019 14:53:42 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:54:02 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 09 Dec 2019 14:54:02 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:53:57 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:53:57 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed0840000>; Mon, 09 Dec 2019 14:53:56 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 08/26] mm/gup: allow FOLL_FORCE for get_user_pages_fast()
Date: Mon, 9 Dec 2019 14:53:26 -0800
Message-ID: <20191209225344.99740-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932022; bh=8yMeFiIYMbIInu28JyKhLAF6qs4QGFVvzis+XDEEE9w=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=TwbYjuNxLCNiku9hlj7Cg/pJ/IpeV4xiPpYuvKt8MTqelgsBfJLDpYOGbCDudB4Le
 liqarKq31qZIpvYqiqMLE+vqavFd9qoKhGR7g2gqLA/yVd2+6rjxjR17o0INhL8VVi
 SLT5lIZRfnum04N96WfLBhg4hGSv2O1wDoQLhhU3voDklCEBjq5Z93GEcKra1OQ8cK
 Rc1+yiQk2G0oy0pDHhNFPFnmKweogxWyAHTrvO7JLXf/6pFp+kuUbrghVdp/Gy01ff
 Mj0NtfAW+IUuWf+4wxxDLU1dchVOYwP2qmtddp6oJAFnDHYfpsrVgyxGp33Ba7OQ0j
 xLoz8AJeDDZBg==
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
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@intel.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, linux-block@vger.kernel.org,
 Leon Romanovsky <leonro@mellanox.com>,
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

Q29tbWl0IDgxN2JlMTI5ZTZmMiAoIm1tOiB2YWxpZGF0ZSBnZXRfdXNlcl9wYWdlc19mYXN0IGZs
YWdzIikgYWxsb3dlZApvbmx5IEZPTExfV1JJVEUgYW5kIEZPTExfTE9OR1RFUk0gdG8gYmUgcGFz
c2VkIHRvIGdldF91c2VyX3BhZ2VzX2Zhc3QoKS4KVGhpcywgY29tYmluZWQgd2l0aCB0aGUgZmFj
dCB0aGF0IGdldF91c2VyX3BhZ2VzX2Zhc3QoKSBmYWxscyBiYWNrIHRvCiJzbG93IGd1cCIsIHdo
aWNoICpkb2VzKiBhY2NlcHQgRk9MTF9GT1JDRSwgbGVhZHMgdG8gYW4gb2RkIHNpdHVhdGlvbjoK
aWYgeW91IG5lZWQgRk9MTF9GT1JDRSwgeW91IGNhbm5vdCBjYWxsIGdldF91c2VyX3BhZ2VzX2Zh
c3QoKS4KClRoZXJlIGRvZXMgbm90IGFwcGVhciB0byBiZSBhbnkgcmVhc29uIGZvciBmaWx0ZXJp
bmcgb3V0IEZPTExfRk9SQ0UuClRoZXJlIGlzIG5vdGhpbmcgaW4gdGhlIF9mYXN0KCkgaW1wbGVt
ZW50YXRpb24gdGhhdCByZXF1aXJlcyB0aGF0IHdlCmF2b2lkIHdyaXRpbmcgdG8gdGhlIHBhZ2Vz
LiBTbyBpdCBhcHBlYXJzIHRvIGhhdmUgYmVlbiBhbiBvdmVyc2lnaHQuCgpGaXggYnkgYWxsb3dp
bmcgRk9MTF9GT1JDRSB0byBiZSBzZXQgZm9yIGdldF91c2VyX3BhZ2VzX2Zhc3QoKS4KCkZpeGVz
OiA4MTdiZTEyOWU2ZjIgKCJtbTogdmFsaWRhdGUgZ2V0X3VzZXJfcGFnZXNfZmFzdCBmbGFncyIp
CkNjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IExlb24gUm9t
YW5vdnNreSA8bGVvbnJvQG1lbGxhbm94LmNvbT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJk
IDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIG1tL2d1cC5jIHwgMyArKy0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tbS9ndXAu
YyBiL21tL2d1cC5jCmluZGV4IGMwYzU2ODg4ZTdjYy4uOTU4YWIwNzU3Mzg5IDEwMDY0NAotLS0g
YS9tbS9ndXAuYworKysgYi9tbS9ndXAuYwpAQCAtMjQxNCw3ICsyNDE0LDggQEAgaW50IGdldF91
c2VyX3BhZ2VzX2Zhc3QodW5zaWduZWQgbG9uZyBzdGFydCwgaW50IG5yX3BhZ2VzLAogCXVuc2ln
bmVkIGxvbmcgYWRkciwgbGVuLCBlbmQ7CiAJaW50IG5yID0gMCwgcmV0ID0gMDsKIAotCWlmIChX
QVJOX09OX09OQ0UoZ3VwX2ZsYWdzICYgfihGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSkpKQor
CWlmIChXQVJOX09OX09OQ0UoZ3VwX2ZsYWdzICYgfihGT0xMX1dSSVRFIHwgRk9MTF9MT05HVEVS
TSB8CisJCQkJICAgICAgIEZPTExfRk9SQ0UpKSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKIAlzdGFy
dCA9IHVudGFnZ2VkX2FkZHIoc3RhcnQpICYgUEFHRV9NQVNLOwotLSAKMi4yNC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
