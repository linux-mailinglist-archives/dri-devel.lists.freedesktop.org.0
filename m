Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E64F3FA81F
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:27:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 578F26EC71;
	Wed, 13 Nov 2019 04:27:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046036EC6B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:27:22 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb86220001>; Tue, 12 Nov 2019 20:27:14 -0800
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
 Transport; Wed, 13 Nov 2019 04:27:14 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb86210008>; Tue, 12 Nov 2019 20:27:13 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 22/23] selftests/vm: run_vmtests: invoke gup_benchmark with
 basic FOLL_PIN coverage
Date: Tue, 12 Nov 2019 20:27:09 -0800
Message-ID: <20191113042710.3997854-23-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619234; bh=xFb3SiLgCLKE3iiV7irzvOfCSAuS+AWjP3FT0BNaO3M=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=DgsjhdlReXyuJ0drlL488GUH9xyFOLjXGVKO4gXFtbarzNu1xo25t/005fcj+4p7m
 ySjMokRrAX3SZl+HnnayIKVbjiGhOL7Wxw5b6E8KjYzar/8MGBjlxSaxIj5anUZWFM
 iA9YT1KvsatctqTx6Q1RLvSuo5uisTCoUErwdAJ6bx1xua5wbf4pg0XU4jookzpBPQ
 uBHfOQzggV0YkDuDLmDBHeVLMDctkxkN+TKY8dw3QBjZDCtCdVZIde0yGm2Gs7bWKT
 9mDRB+3Sk4prntMDl/+334/QdLI0iWK9RE6lURAr/m/3/qndKw5vqxyIXA8kCwFbqn
 23j7SkJAvROWA==
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
IGJlaW5nIGVxdWFsLgoKU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlk
aWEuY29tPgotLS0KIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3J1bl92bXRlc3RzIHwgMjIg
KysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykK
CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cyBiL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3J1bl92bXRlc3RzCmluZGV4IDk1MWM1MDdhMjdmNy4u
OTNlOGRjOWE3Y2FkIDEwMDc1NQotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5f
dm10ZXN0cworKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cwpAQCAt
MTA0LDYgKzEwNCwyOCBAQCBlY2hvICJOT1RFOiBUaGUgYWJvdmUgaHVnZXRsYiB0ZXN0cyBwcm92
aWRlIG1pbmltYWwgY292ZXJhZ2UuICBVc2UiCiBlY2hvICIgICAgICBodHRwczovL2dpdGh1Yi5j
b20vbGliaHVnZXRsYmZzL2xpYmh1Z2V0bGJmcy5naXQgZm9yIgogZWNobyAiICAgICAgaHVnZXRs
YiByZWdyZXNzaW9uIHRlc3RpbmcuIgogCitlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLSIKK2VjaG8gInJ1bm5pbmcgJ2d1cF9iZW5jaG1hcmsgLVUnIChu
b3JtYWwvc2xvdyBndXApIgorZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0iCisuL2d1cF9iZW5jaG1hcmsgLVUKK2lmIFsgJD8gLW5lIDAgXTsgdGhlbgor
CWVjaG8gIltGQUlMXSIKKwlleGl0Y29kZT0xCitlbHNlCisJZWNobyAiW1BBU1NdIgorZmkKKwor
ZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tIgorZWNobyAi
cnVubmluZyBndXBfYmVuY2htYXJrIC1jIChwaW5fdXNlcl9wYWdlcykiCitlY2hvICItLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0iCisuL2d1cF9iZW5jaG1hcmsgLWMK
K2lmIFsgJD8gLW5lIDAgXTsgdGhlbgorCWVjaG8gIltGQUlMXSIKKwlleGl0Y29kZT0xCitlbHNl
CisJZWNobyAiW1BBU1NdIgorZmkKKwogZWNobyAiLS0tLS0tLS0tLS0tLS0tLS0tLSIKIGVjaG8g
InJ1bm5pbmcgdXNlcmZhdWx0ZmQiCiBlY2hvICItLS0tLS0tLS0tLS0tLS0tLS0tIgotLSAKMi4y
NC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
