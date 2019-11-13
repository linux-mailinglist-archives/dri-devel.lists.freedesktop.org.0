Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D739FA7FE
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:27:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E2D96EC64;
	Wed, 13 Nov 2019 04:27:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 346A16EC67
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:27:18 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb86210001>; Tue, 12 Nov 2019 20:27:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 20:27:14 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 20:27:14 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:13 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 13 Nov 2019 04:27:13 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb86210003>; Tue, 12 Nov 2019 20:27:13 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 17/23] media/v4l2-core: pin_longterm_pages (FOLL_PIN) and
 put_user_page() conversion
Date: Tue, 12 Nov 2019 20:27:04 -0800
Message-ID: <20191113042710.3997854-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619234; bh=GEhpFyTQIibXhYqN9YRdzJtS2txKyU2Kys/WSrzZyBk=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=YvHG7hxDuvg7L9X2oUv7Sg7l3tB5pmzAdQk1SYOsSRyzdo4bhnNGeSgW+oHYx5i3N
 JnVMDt5URR6uHTrLDgtjzzBxphE+/rM4siwh/RHq47tY95OT/PEaID3Fc8OYhHz0wE
 xTqiy13b0kkH+UtC4qHTrohgwqMY7Gjkhnpo31sc6T1rSHyP3DsdSGof+EIraPrBMH
 YQVSyVDFWCiaP1iME+njq/NEtzzdh97CVvfaVF/DxSjgGDTRSnhah4bEo0q/IcRfIg
 OSHaroUPjTQcVr+ri/YiK3OkxGcoSmFpjxdF6G1QfExDoCctDUuPRxzVSgTgXYH3tZ
 2ye4ZQATgtL5Q==
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
