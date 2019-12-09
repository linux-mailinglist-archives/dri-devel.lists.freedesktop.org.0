Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7AF117A02
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7436E5C3;
	Mon,  9 Dec 2019 22:54:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B41D16E5A9
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:06 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed0880000>; Mon, 09 Dec 2019 14:54:00 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:54:06 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 09 Dec 2019 14:54:06 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:54:05 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:54:05 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:54:04 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed08b0001>; Mon, 09 Dec 2019 14:54:04 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 17/26] media/v4l2-core: set pages dirty upon releasing DMA
 buffers
Date: Mon, 9 Dec 2019 14:53:35 -0800
Message-ID: <20191209225344.99740-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932040; bh=icmjko9fP8b/hMTtebs5M97o7j6aV8LjauIhhN3vqys=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=DlzNORspoY3IcbrrDr8+bnHB4h7q+P+DGEtEhbY08yzURYq1vJGNQWAWQmRCeWCWl
 UFmfAdNFXLrOqK9IKqVy5RupwYZYEVgBLSrG86HDYxLs1GsAfa8slJNjIV4/yyX1aG
 3qrem1agPB97tyda6vdWbP68snz4Crj8DSc3sNuPDMRfsYnlJmkD8TOLhLB018mT5F
 tyGcUC/tS522BuVz/XijreXQ1m79tGmosD352oUwovn+l78Hexk4351Z1UUrdrRgwD
 LXfZ6rHvBPSwc/UU6+wIujh+Huur4QV4wgTFUbL2GL1AT7u/Lf06MghWZ/uXXx6z1o
 Vpwd6NPdSPrIQ==
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
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Dan Williams <dan.j.williams@intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Magnus Karlsson <magnus.karlsson@intel.com>, Jens Axboe <axboe@kernel.dk>,
 netdev@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>,
 stable@vger.kernel.org, linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org,
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
bGx5IHJlY2VpdmluZyBkYXRhIGZyb20gdGhlIGRldmljZS4KClJldmlld2VkLWJ5OiBDaHJpc3Rv
cGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KQWNrZWQtYnk6IEhhbnMgVmVya3VpbCA8aHZlcmt1aWwt
Y2lzY29AeHM0YWxsLm5sPgpDYzogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5l
bC5vcmc+CkNjOiA8c3RhYmxlQHZnZXIua2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBI
dWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3Jl
L3ZpZGVvYnVmLWRtYS1zZy5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9u
cygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3Jl
L3ZpZGVvYnVmLWRtYS1zZy5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1h
LXNnLmMKaW5kZXggNjZhNmM2YzIzNmE3Li4yODI2MjE5MGMzYWIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jCisrKyBiL2RyaXZlcnMvbWVkaWEv
djRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jCkBAIC0zNDksOCArMzQ5LDExIEBAIGludCB2aWRl
b2J1Zl9kbWFfZnJlZShzdHJ1Y3QgdmlkZW9idWZfZG1hYnVmICpkbWEpCiAJQlVHX09OKGRtYS0+
c2dsZW4pOwogCiAJaWYgKGRtYS0+cGFnZXMpIHsKLQkJZm9yIChpID0gMDsgaSA8IGRtYS0+bnJf
cGFnZXM7IGkrKykKKwkJZm9yIChpID0gMDsgaSA8IGRtYS0+bnJfcGFnZXM7IGkrKykgeworCQkJ
aWYgKGRtYS0+ZGlyZWN0aW9uID09IERNQV9GUk9NX0RFVklDRSkKKwkJCQlzZXRfcGFnZV9kaXJ0
eV9sb2NrKGRtYS0+cGFnZXNbaV0pOwogCQkJcHV0X3BhZ2UoZG1hLT5wYWdlc1tpXSk7CisJCX0K
IAkJa2ZyZWUoZG1hLT5wYWdlcyk7CiAJCWRtYS0+cGFnZXMgPSBOVUxMOwogCX0KLS0gCjIuMjQu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
