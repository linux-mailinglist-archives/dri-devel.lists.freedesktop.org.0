Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1613F8400
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 01:07:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D0E36EA13;
	Tue, 12 Nov 2019 00:07:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73AA6EA0F
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2019 00:07:20 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dc9f7bb0000>; Mon, 11 Nov 2019 16:07:23 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 11 Nov 2019 16:07:20 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 11 Nov 2019 16:07:20 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 12 Nov
 2019 00:07:20 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Tue, 12 Nov 2019 00:07:19 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dc9f7b50003>; Mon, 11 Nov 2019 16:07:18 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 14/23] fs/io_uring: set FOLL_PIN via pin_user_pages()
Date: Mon, 11 Nov 2019 16:06:51 -0800
Message-ID: <20191112000700.3455038-15-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191112000700.3455038-1-jhubbard@nvidia.com>
References: <20191112000700.3455038-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573517243; bh=JGzVxjkq7RUQ8oMNLIEnYl2kvvauj6PckGww94CdhYA=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=dtrLh9SWLRdw6PX3vOEYVbDwP5rXYl+Z084f1/41lIx5jOckvj48bpZIb3QKiKvS8
 EiUpJMH10AO0sZ3WIbPTzpRCzEmK7CwBwUTngL4bUg9ENPjwqA3LQxG7VJkrnsnZKn
 xt0RBUYD1lfBhCcLxZKjC2ZgHLuHAt4vUJr1H5DKsmGeTn5JRvpe5L0ToxTyELkqAp
 Sn56SxFS78D4kUkuucIgSnMczGsI7gGFSoTdRlMLriaEdgrOjUM+mJRGPdxeaIA0Tj
 vOlq1yc3ZS1Ui4kNjjddg7ITTuKySXmzU4DEFo3QcBBEQ5nOQNfWTtaxf/p1lt8uTG
 SzmwrtkLZlpEA==
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

Q29udmVydCBmcy9pb191cmluZyB0byB1c2UgdGhlIG5ldyBwaW5fdXNlcl9wYWdlcygpIGNhbGws
IHdoaWNoIHNldHMKRk9MTF9QSU4uIFNldHRpbmcgRk9MTF9QSU4gaXMgbm93IHJlcXVpcmVkIGZv
ciBjb2RlIHRoYXQgcmVxdWlyZXMKdHJhY2tpbmcgb2YgcGlubmVkIHBhZ2VzLCBhbmQgdGhlcmVm
b3JlIGZvciBhbnkgY29kZSB0aGF0IGNhbGxzCnB1dF91c2VyX3BhZ2UoKS4KCkluIHBhcnRpYWwg
YW50aWNpcGF0aW9uIG9mIHRoaXMgd29yaywgdGhlIGlvX3VyaW5nIGNvZGUgd2FzIGFscmVhZHkK
Y2FsbGluZyBwdXRfdXNlcl9wYWdlKCkgaW5zdGVhZCBvZiBwdXRfcGFnZSgpLiBUaGVyZWZvcmUs
IGluIG9yZGVyIHRvCmNvbnZlcnQgZnJvbSB0aGUgZ2V0X3VzZXJfcGFnZXMoKS9wdXRfcGFnZSgp
IG1vZGVsLCB0byB0aGUKcGluX3VzZXJfcGFnZXMoKS9wdXRfdXNlcl9wYWdlKCkgbW9kZWwsIHRo
ZSBvbmx5IGNoYW5nZSByZXF1aXJlZApoZXJlIGlzIHRvIGNoYW5nZSBnZXRfdXNlcl9wYWdlcygp
IHRvIHBpbl9sb25ndGVybV9wYWdlcygpLgoKUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndl
aW55QGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IEplbnMgQXhib2UgPGF4Ym9lQGtlcm5lbC5kaz4K
U2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGZz
L2lvX3VyaW5nLmMgfCA1ICsrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ZzL2lvX3VyaW5nLmMgYi9mcy9pb191cmluZy5j
CmluZGV4IGY5YTM4OTk4ZjJmYy4uMGYzMDdmMmM3Y2FjIDEwMDY0NAotLS0gYS9mcy9pb191cmlu
Zy5jCisrKyBiL2ZzL2lvX3VyaW5nLmMKQEAgLTM0MzMsOSArMzQzMyw4IEBAIHN0YXRpYyBpbnQg
aW9fc3FlX2J1ZmZlcl9yZWdpc3RlcihzdHJ1Y3QgaW9fcmluZ19jdHggKmN0eCwgdm9pZCBfX3Vz
ZXIgKmFyZywKIAogCQlyZXQgPSAwOwogCQlkb3duX3JlYWQoJmN1cnJlbnQtPm1tLT5tbWFwX3Nl
bSk7Ci0JCXByZXQgPSBnZXRfdXNlcl9wYWdlcyh1YnVmLCBucl9wYWdlcywKLQkJCQkgICAgICBG
T0xMX1dSSVRFIHwgRk9MTF9MT05HVEVSTSwKLQkJCQkgICAgICBwYWdlcywgdm1hcyk7CisJCXBy
ZXQgPSBwaW5fbG9uZ3Rlcm1fcGFnZXModWJ1ZiwgbnJfcGFnZXMsIEZPTExfV1JJVEUsIHBhZ2Vz
LAorCQkJCQkgIHZtYXMpOwogCQlpZiAocHJldCA9PSBucl9wYWdlcykgewogCQkJLyogZG9uJ3Qg
c3VwcG9ydCBmaWxlIGJhY2tlZCBtZW1vcnkgKi8KIAkJCWZvciAoaiA9IDA7IGogPCBucl9wYWdl
czsgaisrKSB7Ci0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
