Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BA6EAC33
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3CA6EDE7;
	Thu, 31 Oct 2019 09:04:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3066EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:40 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba13890000>; Wed, 30 Oct 2019 15:49:45 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:39 -0700
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:39 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:38 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba13800002>; Wed, 30 Oct 2019 15:49:38 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 04/19] media/v4l2-core: set pages dirty upon releasing DMA
 buffers
Date: Wed, 30 Oct 2019 15:49:15 -0700
Message-ID: <20191030224930.3990755-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475785; bh=XaBaipSsjoikJvkLH7RaOydN/WuSGfkJsZAiwvM/xPE=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=TDqU50c8TwyKmMgf/QDOTe3Vi1bVOitaLNonh0qiMoxrjojMp0wTfRux4Swk2FHl5
 JJGYBcwT3ZevDeLVWf4S6QuZMQ0Lgc76irFx0ekQH8Fnv8kyfOshtxUwj3keS3tCY7
 F5D1m4A2EQr/qED8mKHWtZbO0i+cEcxHpr70Q6RxWH8mk6sYhzR72caMlrH7U/2DJ9
 cwN4vjQSS67t9JZPJ0DxjZGJhW0NmpX9Xjg5px4Z3HhCMFeEogkJ4W63rXbQ49reo0
 Ta0Ru6XcEQojtc0AiLrAqhP/0gk5Gf5yaXkfGpmKAPqaQeMlSaBzLhwCOZG/jsUpVJ
 ChKFrWebViYAg==
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

QWZ0ZXIgRE1BIGlzIGNvbXBsZXRlLCBhbmQgdGhlIGRldmljZSBhbmQgQ1BVIGNhY2hlcyBhcmUg
c3luY2hyb25pemVkLAppdCdzIHN0aWxsIHJlcXVpcmVkIHRvIG1hcmsgdGhlIENQVSBwYWdlcyBh
cyBkaXJ0eSwgaWYgdGhlIGRhdGEgd2FzCmNvbWluZyBmcm9tIHRoZSBkZXZpY2UuIEhvd2V2ZXIs
IHRoaXMgZHJpdmVyIHdhcyBqdXN0IGlzc3VpbmcgYQpiYXJlIHB1dF9wYWdlKCkgY2FsbCwgd2l0
aG91dCBhbnkgc2V0X3BhZ2VfZGlydHkqKCkgY2FsbC4KCkZpeCB0aGUgcHJvYmxlbSwgYnkgY2Fs
bGluZyBzZXRfcGFnZV9kaXJ0eV9sb2NrKCkgaWYgdGhlIENQVSBwYWdlcwp3ZXJlIHBvdGVudGlh
bGx5IHJlY2VpdmluZyBkYXRhIGZyb20gdGhlIGRldmljZS4KCkNjOiBNYXVybyBDYXJ2YWxobyBD
aGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxq
aHViYmFyZEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVm
LWRtYS1zZy5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBk
ZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3ZpZGVvYnVm
LWRtYS1zZy5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtZG1hLXNnLmMKaW5k
ZXggNjZhNmM2YzIzNmE3Li4yODI2MjE5MGMzYWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEv
djRsMi1jb3JlL3ZpZGVvYnVmLWRtYS1zZy5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3Jl
L3ZpZGVvYnVmLWRtYS1zZy5jCkBAIC0zNDksOCArMzQ5LDExIEBAIGludCB2aWRlb2J1Zl9kbWFf
ZnJlZShzdHJ1Y3QgdmlkZW9idWZfZG1hYnVmICpkbWEpCiAJQlVHX09OKGRtYS0+c2dsZW4pOwog
CiAJaWYgKGRtYS0+cGFnZXMpIHsKLQkJZm9yIChpID0gMDsgaSA8IGRtYS0+bnJfcGFnZXM7IGkr
KykKKwkJZm9yIChpID0gMDsgaSA8IGRtYS0+bnJfcGFnZXM7IGkrKykgeworCQkJaWYgKGRtYS0+
ZGlyZWN0aW9uID09IERNQV9GUk9NX0RFVklDRSkKKwkJCQlzZXRfcGFnZV9kaXJ0eV9sb2NrKGRt
YS0+cGFnZXNbaV0pOwogCQkJcHV0X3BhZ2UoZG1hLT5wYWdlc1tpXSk7CisJCX0KIAkJa2ZyZWUo
ZG1hLT5wYWdlcyk7CiAJCWRtYS0+cGFnZXMgPSBOVUxMOwogCX0KLS0gCjIuMjMuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
