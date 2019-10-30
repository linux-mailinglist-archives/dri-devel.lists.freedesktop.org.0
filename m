Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE47EAC37
	for <lists+dri-devel@lfdr.de>; Thu, 31 Oct 2019 10:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA8126EDE9;
	Thu, 31 Oct 2019 09:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF8B66EBB5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2019 22:49:56 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dba13990000>; Wed, 30 Oct 2019 15:50:02 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 30 Oct 2019 15:49:56 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 30 Oct 2019 15:49:56 -0700
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 30 Oct
 2019 22:49:56 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Wed, 30 Oct 2019 22:49:55 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dba13910000>; Wed, 30 Oct 2019 15:49:54 -0700
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 17/19] selftests/vm: run_vmtests: invoke gup_benchmark with
 basic FOLL_PIN coverage
Date: Wed, 30 Oct 2019 15:49:28 -0700
Message-ID: <20191030224930.3990755-18-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030224930.3990755-1-jhubbard@nvidia.com>
References: <20191030224930.3990755-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Thu, 31 Oct 2019 09:04:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572475802; bh=rwvy5scTy5JLg+SKsytZrhoxXGIN7QSORs5+YcV8QqY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=XMlwzmlsux1x0Db3R9XtBtpzjYXCTvq1+eH82SOkL7qTi9NIeyo2RiVOugrlMnjXp
 j/blE4LbMu++iqb3TbjZXJt1U/KnPH2iz7i2Q4sFaLCCgAdF8PND1X7rBXqioEEq8Y
 1vN8JSqiWFPRV1/5KAyyd/2JtkDJdFak6VIckw/yDbNnHJznIDf2Pm0gLd3fIW5SAo
 LDRD4oRm1cX1XHRjUB/PWhseuEDhqDXyBVYbFPmMpNl97r8d3/wKZ6uLHzaoEe1wjo
 ZPUzAHtbjU4zpX5BEyECGbg9F/hknFZvXkKdhvHrRgQVy6Gi0jX5prZZqD/X8QGmxF
 dREPidPh4E87g==
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
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
