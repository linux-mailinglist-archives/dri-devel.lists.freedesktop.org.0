Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72234F8413
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:08:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73654893CD;
	Tue, 12 Nov 2019 00:07:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFDDF890DF
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:24 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7840000>; Mon, 11 Nov 2019 16:06:28 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:24 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 11 Nov 2019 16:07:24 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:23 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:22 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7b90002>; Mon, 11 Nov 2019 16:07:22 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 17/23] media/v4l2-core: pin_longterm_pages (FOLL_PIN) and
 put_user_page() conversion
Date: Mon, 11 Nov 2019 16:06:54 -0800
Message-ID: <20191112000700.3455038-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517188; bh=GEhpFyTQIibXhYqN9YRdzJtS2txKyU2Kys/WSrzZyBk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=j23aF6SRUen0YpYJHRc36hCPrcNFmaf1Sspp55AxN7SrAQXXqax6dRUmy0JvmNGRc
 u0MpdS14Jm9miNTgK1wzXZoX/13Y0bhlLKhQukrla4DOeLuT1Nr4mzyuJ7BVAnOTED
 LygPYrmrpoaDCaQGcXGHUTvJE30JgnWmJvVlF0ZaqTVe3HnBGGg86evwpinm/nBx7C
 RpSufllOzuEu+h3RY867f0PdpSIjlCRZHPg2cpFFtVIB1kage+mtuUAEYfgeoz+kPf
 iYZIsm8irI4/Q4QdeZUDeJCAg2aZN4dNQPnSF/5rDeBhJgXMx0L8QPm3tDbSBFCFEC
 tUgkh4YaE/z/Q==
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
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
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

MS4gQ2hhbmdlIHY0bDIgZnJvbSBnZXRfdXNlcl9wYWdlcyhGT0xMX0xPTkdURVJNKSwgdG8KcGlu
X2xvbmd0ZXJtX3BhZ2VzKCksIHdoaWNoIHNldHMgYm90aCBGT0xMX0xPTkdURVJNIGFuZCBGT0xM
X1BJTi4KCjIuIEJlY2F1c2UgYWxsIEZPTExfUElOLWFjcXVpcmVkIHBhZ2VzIG11c3QgYmUgcmVs
ZWFzZWQgdmlhCnB1dF91c2VyX3BhZ2UoKSwgYWxzbyBjb252ZXJ0IHRoZSBwdXRfcGFnZSgpIGNh
bGwgb3ZlciB0bwpwdXRfdXNlcl9wYWdlc19kaXJ0eV9sb2NrKCkuCgpBY2tlZC1ieTogSGFucyBW
ZXJrdWlsIDxodmVya3VpbC1jaXNjb0B4czRhbGwubmw+ClJldmlld2VkLWJ5OiBJcmEgV2Vpbnkg
PGlyYS53ZWlueUBpbnRlbC5jb20+CkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJA
a2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEu
Y29tPgotLS0KIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jIHwgMTMg
KysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEt
c2cuYyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jCmluZGV4IDI4
MjYyMTkwYzNhYi4uOWI5YzViMzdiZjU5IDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDIt
Y29yZS92aWRlb2J1Zi1kbWEtc2cuYworKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRl
b2J1Zi1kbWEtc2cuYwpAQCAtMTgzLDEyICsxODMsMTIgQEAgc3RhdGljIGludCB2aWRlb2J1Zl9k
bWFfaW5pdF91c2VyX2xvY2tlZChzdHJ1Y3QgdmlkZW9idWZfZG1hYnVmICpkbWEsCiAJZHByaW50
aygxLCAiaW5pdCB1c2VyIFsweCVseCsweCVseCA9PiAlZCBwYWdlc11cbiIsCiAJCWRhdGEsIHNp
emUsIGRtYS0+bnJfcGFnZXMpOwogCi0JZXJyID0gZ2V0X3VzZXJfcGFnZXMoZGF0YSAmIFBBR0Vf
TUFTSywgZG1hLT5ucl9wYWdlcywKLQkJCSAgICAgZmxhZ3MgfCBGT0xMX0xPTkdURVJNLCBkbWEt
PnBhZ2VzLCBOVUxMKTsKKwllcnIgPSBwaW5fbG9uZ3Rlcm1fcGFnZXMoZGF0YSAmIFBBR0VfTUFT
SywgZG1hLT5ucl9wYWdlcywKKwkJCQkgZmxhZ3MsIGRtYS0+cGFnZXMsIE5VTEwpOwogCiAJaWYg
KGVyciAhPSBkbWEtPm5yX3BhZ2VzKSB7CiAJCWRtYS0+bnJfcGFnZXMgPSAoZXJyID49IDApID8g
ZXJyIDogMDsKLQkJZHByaW50aygxLCAiZ2V0X3VzZXJfcGFnZXM6IGVycj0lZCBbJWRdXG4iLCBl
cnIsCisJCWRwcmludGsoMSwgInBpbl9sb25ndGVybV9wYWdlczogZXJyPSVkIFslZF1cbiIsIGVy
ciwKIAkJCWRtYS0+bnJfcGFnZXMpOwogCQlyZXR1cm4gZXJyIDwgMCA/IGVyciA6IC1FSU5WQUw7
CiAJfQpAQCAtMzQ5LDExICszNDksOCBAQCBpbnQgdmlkZW9idWZfZG1hX2ZyZWUoc3RydWN0IHZp
ZGVvYnVmX2RtYWJ1ZiAqZG1hKQogCUJVR19PTihkbWEtPnNnbGVuKTsKIAogCWlmIChkbWEtPnBh
Z2VzKSB7Ci0JCWZvciAoaSA9IDA7IGkgPCBkbWEtPm5yX3BhZ2VzOyBpKyspIHsKLQkJCWlmIChk
bWEtPmRpcmVjdGlvbiA9PSBETUFfRlJPTV9ERVZJQ0UpCi0JCQkJc2V0X3BhZ2VfZGlydHlfbG9j
ayhkbWEtPnBhZ2VzW2ldKTsKLQkJCXB1dF9wYWdlKGRtYS0+cGFnZXNbaV0pOwotCQl9CisJCXB1
dF91c2VyX3BhZ2VzX2RpcnR5X2xvY2soZG1hLT5wYWdlcywgZG1hLT5ucl9wYWdlcywKKwkJCQkJ
ICBkbWEtPmRpcmVjdGlvbiA9PSBETUFfRlJPTV9ERVZJQ0UpOwogCQlrZnJlZShkbWEtPnBhZ2Vz
KTsKIAkJZG1hLT5wYWdlcyA9IE5VTEw7CiAJfQotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
