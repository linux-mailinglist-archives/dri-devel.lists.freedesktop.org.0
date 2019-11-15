Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FC6FD4BF
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 06:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E52D6E20F;
	Fri, 15 Nov 2019 05:54:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BBE36E191
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 05:53:58 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce3d6e0004>; Thu, 14 Nov 2019 21:53:51 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 21:53:47 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 14 Nov 2019 21:53:47 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:46 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:45 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 15 Nov 2019 05:53:45 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dce3d690006>; Thu, 14 Nov 2019 21:53:45 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 23/24] selftests/vm: run_vmtests: invoke gup_benchmark with
 basic FOLL_PIN coverage
Date: Thu, 14 Nov 2019 21:53:39 -0800
Message-ID: <20191115055340.1825745-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115055340.1825745-1-jhubbard@nvidia.com>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573797231; bh=/x1TdCiN4AHV7riFBKV40yDsqqnISHzJ+pPbTJijsU0=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=WUunCF/2BottYAlDcCuCm20owQWL1ByMTQpQ2zlOly+GXipo2PVrbp8e7hs1p9cVS
 pNw3i8S98XfPfEJloNDypS9p3nRCCxSlTHiRMygvX6mLMISCsc7zPWdgVK3TSfe4jL
 lBerTUwF3cFHTUM/Vi1AanKPYVbivFpKvu4/6gntuJBnXivQtvdEy+UVfUWSYClfB6
 cQ3cUTVYvLKUu1tSbA6Fy4kX9e62UPqlIwaWd9mH/lWIwNBRUOuLs5kzHOkJOWjV41
 CWQTJPG6Mepu6T+9gQIMqYeqppPQt/g+ZTPudPyegBzPG6oKK8zIHwcpb1EC1Qs+GD
 m/9wQi7dggQ8A==
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
 Ira Weiny <ira.weiny@intel.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-rdma@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Christoph Hellwig <hch@infradead.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Vlastimil Babka <vbabka@suse.cz>,
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

SXQncyBnb29kIHRvIGhhdmUgYmFzaWMgdW5pdCB0ZXN0IGNvdmVyYWdlIG9mIHRoZSBuZXcgRk9M
TF9QSU4KYmVoYXZpb3IuIEZvcnR1bmF0ZWx5LCB0aGUgZ3VwX2JlbmNobWFyayB1bml0IHRlc3Qg
aXMgZXh0cmVtZWx5CmZhc3QgKGEgZmV3IG1pbGxpc2Vjb25kcyksIHNvIGFkZGluZyBpdCB0aGUg
dGhlIHJ1bl92bXRlc3RzIHN1aXRlCmlzIGdvaW5nIHRvIGNhdXNlIG5vIG5vdGljZWFibGUgY2hh
bmdlIGluIHJ1bm5pbmcgdGltZS4KClNvLCBhZGQgdHdvIG5ldyBpbnZvY2F0aW9ucyB0byBydW5f
dm10ZXN0czoKCjEpIFJ1biBndXBfYmVuY2htYXJrIHdpdGggbm9ybWFsIGdldF91c2VyX3BhZ2Vz
KCkuCgoyKSBSdW4gZ3VwX2JlbmNobWFyayB3aXRoIHBpbl91c2VyX3BhZ2VzKCkuIFRoaXMgaXMg
bXVjaCBsaWtlCnRoZSBmaXJzdCBjYWxsLCBleGNlcHQgdGhhdCBpdCBzZXRzIEZPTExfUElOLgoK
UnVubmluZyB0aGVzZSB0d28gaW4gcXVpY2sgc3VjY2Vzc2lvbiBhbHNvIHByb3ZpZGUgYSB2aXN1
YWwKY29tcGFyaXNvbiBvZiB0aGUgcnVubmluZyB0aW1lcywgd2hpY2ggaXMgY29udmVuaWVudC4K
ClRoZSBuZXcgaW52b2NhdGlvbnMgYXJlIGZhaXJseSBlYXJseSBpbiB0aGUgcnVuX3ZtdGVzdHMg
c2NyaXB0LApiZWNhdXNlIHdpdGggdGVzdCBzdWl0ZXMsIGl0J3MgdXN1YWxseSBwcmVmZXJhYmxl
IHRvIHB1dCB0aGUKc2hvcnRlciwgZmFzdGVyIHRlc3RzIGZpcnN0LCBhbGwgb3RoZXIgdGhpbmdz
IGJlaW5nIGVxdWFsLgoKUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNv
bT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0K
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3J1bl92bXRlc3RzIHwgMjIgKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3ZtL3J1bl92bXRlc3RzCmluZGV4IDk1MWM1MDdhMjdmNy4uNTA0MzM0NzM5N2E2
IDEwMDc1NQotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cworKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cwpAQCAtMTA0LDYgKzEwNCwy
OCBAQCBlY2hvICJOT1RFOiBUaGUgYWJvdmUgaHVnZXRsYiB0ZXN0cyBwcm92aWRlIG1pbmltYWwg
Y292ZXJhZ2UuICBVc2UiCiBlY2hvICIgICAgICBodHRwczovL2dpdGh1Yi5jb20vbGliaHVnZXRs
YmZzL2xpYmh1Z2V0bGJmcy5naXQgZm9yIgogZWNobyAiICAgICAgaHVnZXRsYiByZWdyZXNzaW9u
IHRlc3RpbmcuIgogCitlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLSIKK2VjaG8gInJ1bm5pbmcgJ2d1cF9iZW5jaG1hcmsgLVUnIChub3JtYWwvc2xvdyBn
dXApIgorZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0i
CisuL2d1cF9iZW5jaG1hcmsgLVUKK2lmIFsgJD8gLW5lIDAgXTsgdGhlbgorCWVjaG8gIltGQUlM
XSIKKwlleGl0Y29kZT0xCitlbHNlCisJZWNobyAiW1BBU1NdIgorZmkKKworZWNobyAiLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIgorZWNobyAicnVubmluZyBndXBf
YmVuY2htYXJrIC1iIChwaW5fdXNlcl9wYWdlcykiCitlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0iCisuL2d1cF9iZW5jaG1hcmsgLWIKK2lmIFsgJD8gLW5l
IDAgXTsgdGhlbgorCWVjaG8gIltGQUlMXSIKKwlleGl0Y29kZT0xCitlbHNlCisJZWNobyAiW1BB
U1NdIgorZmkKKwogZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLSIKIGVjaG8gInJ1bm5pbmcgdXNl
cmZhdWx0ZmQiCiBlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0tIgotLSAKMi4yNC4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
