Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85CC4101BC6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:17:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266136EC9E;
	Tue, 19 Nov 2019 08:17:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EBE6EC7D
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 08:16:57 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd3a4f60000>; Tue, 19 Nov 2019 00:16:54 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 19 Nov 2019 00:16:57 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 19 Nov 2019 00:16:57 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 19 Nov
 2019 08:16:56 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 19 Nov 2019 08:16:55 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd3a4f60000>; Tue, 19 Nov 2019 00:16:55 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v6 08/24] media/v4l2-core: set pages dirty upon releasing DMA
 buffers
Date: Tue, 19 Nov 2019 00:16:27 -0800
Message-ID: <20191119081643.1866232-9-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119081643.1866232-1-jhubbard@nvidia.com>
References: <20191119081643.1866232-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574151414; bh=baa1oHQC+1Mr0fCveGP8H7qjkYYEgQstEl5cvxrT4lI=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=rdLH5j9mb9V3sRBXrLa+zdQcZJVLChu5WEXlY0+63LFIATZEVNnrE6L672ogsDDD6
 8EKATk9tzWLt2xNYWE1HzzNtuxbeINPIDrW9iN+XLP/+qYwND9kwJ2+x8S2wCciJta
 8bO/Rr1BxvyRDZ1wUXrI4y3imVV9USecFjRYODvr7f7pxditnnZpYi+eqGcbXlM9h1
 RGo58amAyFnLNKTrO+tm679bZcXXB2i609TyhLuWsOLN6uWxcDQ/u/nFgPxhAi4z2J
 WJKccXBVnMtTwNeWL4LFidtaFXcTURHC7VmaUqc9WC5jyAVxF6k3SI7MGUtKWDvQ07
 5Df3ybR2w+qOQ==
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

QWZ0ZXIgRE1BIGlzIGNvbXBsZXRlLCBhbmQgdGhlIGRldmljZSBhbmQgQ1BVIGNhY2hlcyBhcmUg
c3luY2hyb25pemVkLAppdCdzIHN0aWxsIHJlcXVpcmVkIHRvIG1hcmsgdGhlIENQVSBwYWdlcyBh
cyBkaXJ0eSwgaWYgdGhlIGRhdGEgd2FzCmNvbWluZyBmcm9tIHRoZSBkZXZpY2UuIEhvd2V2ZXIs
IHRoaXMgZHJpdmVyIHdhcyBqdXN0IGlzc3VpbmcgYQpiYXJlIHB1dF9wYWdlKCkgY2FsbCwgd2l0
aG91dCBhbnkgc2V0X3BhZ2VfZGlydHkqKCkgY2FsbC4KCkZpeCB0aGUgcHJvYmxlbSwgYnkgY2Fs
bGluZyBzZXRfcGFnZV9kaXJ0eV9sb2NrKCkgaWYgdGhlIENQVSBwYWdlcwp3ZXJlIHBvdGVudGlh
bGx5IHJlY2VpdmluZyBkYXRhIGZyb20gdGhlIGRldmljZS4KCkFja2VkLWJ5OiBIYW5zIFZlcmt1
aWwgPGh2ZXJrdWlsLWNpc2NvQHhzNGFsbC5ubD4KQ2M6IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8
bWNoZWhhYkBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJk
QG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNn
LmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNn
LmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1kbWEtc2cuYwppbmRleCA2NmE2
YzZjMjM2YTcuLjI4MjYyMTkwYzNhYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNv
cmUvdmlkZW9idWYtZG1hLXNnLmMKKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9i
dWYtZG1hLXNnLmMKQEAgLTM0OSw4ICszNDksMTEgQEAgaW50IHZpZGVvYnVmX2RtYV9mcmVlKHN0
cnVjdCB2aWRlb2J1Zl9kbWFidWYgKmRtYSkKIAlCVUdfT04oZG1hLT5zZ2xlbik7CiAKIAlpZiAo
ZG1hLT5wYWdlcykgewotCQlmb3IgKGkgPSAwOyBpIDwgZG1hLT5ucl9wYWdlczsgaSsrKQorCQlm
b3IgKGkgPSAwOyBpIDwgZG1hLT5ucl9wYWdlczsgaSsrKSB7CisJCQlpZiAoZG1hLT5kaXJlY3Rp
b24gPT0gRE1BX0ZST01fREVWSUNFKQorCQkJCXNldF9wYWdlX2RpcnR5X2xvY2soZG1hLT5wYWdl
c1tpXSk7CiAJCQlwdXRfcGFnZShkbWEtPnBhZ2VzW2ldKTsKKwkJfQogCQlrZnJlZShkbWEtPnBh
Z2VzKTsKIAkJZG1hLT5wYWdlcyA9IE5VTEw7CiAJfQotLSAKMi4yNC4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
