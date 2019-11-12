Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536E9F8419
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:08:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FD486EA17;
	Tue, 12 Nov 2019 00:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 397D06EA14
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:22 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7810002>; Mon, 11 Nov 2019 16:06:25 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:21 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 11 Nov 2019 16:07:21 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:21 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:20 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7b60003>; Mon, 11 Nov 2019 16:07:19 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 15/23] net/xdp: set FOLL_PIN via pin_user_pages()
Date: Mon, 11 Nov 2019 16:06:52 -0800
Message-ID: <20191112000700.3455038-16-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517185; bh=7NW5FVByU2q47q8YXJg0DLnVCFYBzjS19tQtlG28KDY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=Daw1gXi5Nf8jhwQGkFuKATjIjdGTo/8QHCXHZE7HOCQsxIKzJaEMCfUmt1gepoDlz
 wAtZERC/OIZdJ+dC7qyRHHNRHe+c8VRZ6WxtX0ujRzrLUzUNNhd/2aUReq75nVQOnB
 hXYlG0kMXNbnL0FAO1VMoSv0HZQiFBzWo/Le+8G03Vf47g41hmlrLcQOpTobmPcOfd
 3gyGQm9Q39Wz3SpcrYOGhVOaHpFtHfuoItD2ZOM8vvYKso23c3EiSIlN3hYPQ0r19n
 XdosFXuIQ6dG3YNzHqIrFPxXBYW8pEAU+rzMaRN4Ou24/T3o3hVX/yxtTg/YPDbivh
 8HR5xsqA3ACUQ==
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

Q29udmVydCBuZXQveGRwIHRvIHVzZSB0aGUgbmV3IHBpbl9sb25ndGVybV9wYWdlcygpIGNhbGws
IHdoaWNoIHNldHMKRk9MTF9QSU4uIFNldHRpbmcgRk9MTF9QSU4gaXMgbm93IHJlcXVpcmVkIGZv
ciBjb2RlIHRoYXQgcmVxdWlyZXMKdHJhY2tpbmcgb2YgcGlubmVkIHBhZ2VzLgoKSW4gcGFydGlh
bCBhbnRpY2lwYXRpb24gb2YgdGhpcyB3b3JrLCB0aGUgbmV0L3hkcCBjb2RlIHdhcyBhbHJlYWR5
CmNhbGxpbmcgcHV0X3VzZXJfcGFnZSgpIGluc3RlYWQgb2YgcHV0X3BhZ2UoKS4gVGhlcmVmb3Jl
LCBpbiBvcmRlciB0bwpjb252ZXJ0IGZyb20gdGhlIGdldF91c2VyX3BhZ2VzKCkvcHV0X3BhZ2Uo
KSBtb2RlbCwgdG8gdGhlCnBpbl91c2VyX3BhZ2VzKCkvcHV0X3VzZXJfcGFnZSgpIG1vZGVsLCB0
aGUgb25seSBjaGFuZ2UgcmVxdWlyZWQKaGVyZSBpcyB0byBjaGFuZ2UgZ2V0X3VzZXJfcGFnZXMo
KSB0byBwaW5fbG9uZ3Rlcm1fcGFnZXMoKS4KClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53
ZWlueUBpbnRlbC5jb20+CkFja2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybi50b3BlbEBpbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4K
LS0tCiBuZXQveGRwL3hkcF91bWVtLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbmV0L3hkcC94ZHBfdW1lbS5j
IGIvbmV0L3hkcC94ZHBfdW1lbS5jCmluZGV4IDMwNDlhZjI2OWZiZi4uNjZjODE0ODYzY2ZkIDEw
MDY0NAotLS0gYS9uZXQveGRwL3hkcF91bWVtLmMKKysrIGIvbmV0L3hkcC94ZHBfdW1lbS5jCkBA
IC0yOTEsOCArMjkxLDggQEAgc3RhdGljIGludCB4ZHBfdW1lbV9waW5fcGFnZXMoc3RydWN0IHhk
cF91bWVtICp1bWVtKQogCQlyZXR1cm4gLUVOT01FTTsKIAogCWRvd25fcmVhZCgmY3VycmVudC0+
bW0tPm1tYXBfc2VtKTsKLQlucGdzID0gZ2V0X3VzZXJfcGFnZXModW1lbS0+YWRkcmVzcywgdW1l
bS0+bnBncywKLQkJCSAgICAgIGd1cF9mbGFncyB8IEZPTExfTE9OR1RFUk0sICZ1bWVtLT5wZ3Nb
MF0sIE5VTEwpOworCW5wZ3MgPSBwaW5fbG9uZ3Rlcm1fcGFnZXModW1lbS0+YWRkcmVzcywgdW1l
bS0+bnBncywgZ3VwX2ZsYWdzLAorCQkJCSAgJnVtZW0tPnBnc1swXSwgTlVMTCk7CiAJdXBfcmVh
ZCgmY3VycmVudC0+bW0tPm1tYXBfc2VtKTsKIAogCWlmIChucGdzICE9IHVtZW0tPm5wZ3MpIHsK
LS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
