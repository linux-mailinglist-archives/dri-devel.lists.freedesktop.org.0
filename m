Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BB91179FF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF706E5CA;
	Mon,  9 Dec 2019 22:54:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAF196E5B6
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:07 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed0890002>; Mon, 09 Dec 2019 14:54:01 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:54:07 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 09 Dec 2019 14:54:07 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:54:06 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:54:05 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed08c0000>; Mon, 09 Dec 2019 14:54:05 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 18/26] media/v4l2-core: pin_user_pages (FOLL_PIN) and
 put_user_page() conversion
Date: Mon, 9 Dec 2019 14:53:36 -0800
Message-ID: <20191209225344.99740-19-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932041; bh=sXkMwo6nCTbLEEe6A0fE3HZE6drkGcT2bf/xg2miV08=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=FLOLQRiKgJJoAnuC+6tqDLJ5k4Jl5KPBtJul6duA8UksyeoiLHe0mg9wwGhRcVPgD
 qrmOL/x9WFC5Kn2QviSXFvyY2IJci50VP0l5oS6WDgklv9lSmhxVO7HDGjbYrv/x3R
 ebwMMcIePmZD4je2i8s10CQ1B35w84LWehpnXy/7Tkmu2ovAYTZEazrvVGUnBwCQzD
 x7/fJV0sh3T04qcuIqC/ei7scvRhAlk9WMYIyA4RGCzrtZx3J+fAVUyWvHGVSgLbiJ
 H6AoiklJUdkLhVMRyvzNXZGN1mUx1DfMaEIy+/EaOEvxv0nktjLyVJLdBEMm0npPYy
 +iKopMyawnngQ==
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

MS4gQ2hhbmdlIHY0bDIgZnJvbSBnZXRfdXNlcl9wYWdlcygpIHRvIHBpbl91c2VyX3BhZ2VzKCku
CgoyLiBCZWNhdXNlIGFsbCBGT0xMX1BJTi1hY3F1aXJlZCBwYWdlcyBtdXN0IGJlIHJlbGVhc2Vk
IHZpYQpwdXRfdXNlcl9wYWdlKCksIGFsc28gY29udmVydCB0aGUgcHV0X3BhZ2UoKSBjYWxsIG92
ZXIgdG8KcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jaygpLgoKQWNrZWQtYnk6IEhhbnMgVmVya3Vp
bCA8aHZlcmt1aWwtY2lzY29AeHM0YWxsLm5sPgpDYzogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50
ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+
Ci0tLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMgfCAxMSArKysr
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtc2cuYyBi
L2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jCmluZGV4IDI4MjYyMTkw
YzNhYi4uMTYyYTI2MzNiMWUzIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92
aWRlb2J1Zi1kbWEtc2cuYworKysgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1k
bWEtc2cuYwpAQCAtMTgzLDEyICsxODMsMTIgQEAgc3RhdGljIGludCB2aWRlb2J1Zl9kbWFfaW5p
dF91c2VyX2xvY2tlZChzdHJ1Y3QgdmlkZW9idWZfZG1hYnVmICpkbWEsCiAJZHByaW50aygxLCAi
aW5pdCB1c2VyIFsweCVseCsweCVseCA9PiAlZCBwYWdlc11cbiIsCiAJCWRhdGEsIHNpemUsIGRt
YS0+bnJfcGFnZXMpOwogCi0JZXJyID0gZ2V0X3VzZXJfcGFnZXMoZGF0YSAmIFBBR0VfTUFTSywg
ZG1hLT5ucl9wYWdlcywKKwllcnIgPSBwaW5fdXNlcl9wYWdlcyhkYXRhICYgUEFHRV9NQVNLLCBk
bWEtPm5yX3BhZ2VzLAogCQkJICAgICBmbGFncyB8IEZPTExfTE9OR1RFUk0sIGRtYS0+cGFnZXMs
IE5VTEwpOwogCiAJaWYgKGVyciAhPSBkbWEtPm5yX3BhZ2VzKSB7CiAJCWRtYS0+bnJfcGFnZXMg
PSAoZXJyID49IDApID8gZXJyIDogMDsKLQkJZHByaW50aygxLCAiZ2V0X3VzZXJfcGFnZXM6IGVy
cj0lZCBbJWRdXG4iLCBlcnIsCisJCWRwcmludGsoMSwgInBpbl91c2VyX3BhZ2VzOiBlcnI9JWQg
WyVkXVxuIiwgZXJyLAogCQkJZG1hLT5ucl9wYWdlcyk7CiAJCXJldHVybiBlcnIgPCAwID8gZXJy
IDogLUVJTlZBTDsKIAl9CkBAIC0zNDksMTEgKzM0OSw4IEBAIGludCB2aWRlb2J1Zl9kbWFfZnJl
ZShzdHJ1Y3QgdmlkZW9idWZfZG1hYnVmICpkbWEpCiAJQlVHX09OKGRtYS0+c2dsZW4pOwogCiAJ
aWYgKGRtYS0+cGFnZXMpIHsKLQkJZm9yIChpID0gMDsgaSA8IGRtYS0+bnJfcGFnZXM7IGkrKykg
ewotCQkJaWYgKGRtYS0+ZGlyZWN0aW9uID09IERNQV9GUk9NX0RFVklDRSkKLQkJCQlzZXRfcGFn
ZV9kaXJ0eV9sb2NrKGRtYS0+cGFnZXNbaV0pOwotCQkJcHV0X3BhZ2UoZG1hLT5wYWdlc1tpXSk7
Ci0JCX0KKwkJcHV0X3VzZXJfcGFnZXNfZGlydHlfbG9jayhkbWEtPnBhZ2VzLCBkbWEtPm5yX3Bh
Z2VzLAorCQkJCQkgIGRtYS0+ZGlyZWN0aW9uID09IERNQV9GUk9NX0RFVklDRSk7CiAJCWtmcmVl
KGRtYS0+cGFnZXMpOwogCQlkbWEtPnBhZ2VzID0gTlVMTDsKIAl9Ci0tIAoyLjI0LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
