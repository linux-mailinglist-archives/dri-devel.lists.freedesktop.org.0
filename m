Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D49C7117A0B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 23:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFCED6E5BD;
	Mon,  9 Dec 2019 22:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54F96E5BB
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2019 22:54:13 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5deed08f0000>; Mon, 09 Dec 2019 14:54:07 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 09 Dec 2019 14:54:13 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 09 Dec 2019 14:54:13 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 9 Dec
 2019 22:54:12 +0000
Received: from rnnvemgw01.nvidia.com (10.128.109.123) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via
 Frontend Transport; Mon, 9 Dec 2019 22:54:11 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 rnnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5deed0920003>; Mon, 09 Dec 2019 14:54:11 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v8 26/26] selftests/vm: run_vmtests: invoke gup_benchmark with
 basic FOLL_PIN coverage
Date: Mon, 9 Dec 2019 14:53:44 -0800
Message-ID: <20191209225344.99740-27-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191209225344.99740-1-jhubbard@nvidia.com>
References: <20191209225344.99740-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1575932047; bh=efjW/rF0EGuRthlOGEU05IQnyHi57jZRzyopoxtDk8c=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=qV3uJB7VZRPn8h/t1hIu8YevHEQMbA6ytY7EXlbIwT+Y5aVa6SSMTKDXGhoau+Np9
 SXj+sUF5Zt1nGzc+gDnMftMZ783jkTGZpbgnOkcctnZX3s3d6WXHEohuIVF7yzZeGR
 ygw/gKI58lE2sUc35Cy0UmpJw+FO/2bcReyZzeD70yLGqvf4tS0EdeF8RZfC0ASFL8
 7kuLYQ1Ps+1sWrXxax9z07GSCOo44qcTHbB3lxAH77qnnhMi2B1hjBCUkNOq6E9/ek
 Op/wTYdOnk2+V0dbVmV+gE5zCnUDp7xm+aIrH1mszn1QnNw72uwtRJfg/zkFxFZtTv
 8OVY/MKZ8u6pw==
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
IGJlaW5nIGVxdWFsLgoKUmV2aWV3ZWQtYnk6IElyYSBXZWlueSA8aXJhLndlaW55QGludGVsLmNv
bT4KU2lnbmVkLW9mZi1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0K
IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3J1bl92bXRlc3RzIHwgMjIgKysrKysrKysrKysr
KysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cyBiL3Rvb2xzL3Rlc3Rpbmcv
c2VsZnRlc3RzL3ZtL3J1bl92bXRlc3RzCmluZGV4IGE2OTJlYTgyODMxNy4uZGY2YTZiZjNmMjM4
IDEwMDc1NQotLS0gYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cworKysg
Yi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10ZXN0cwpAQCAtMTEyLDYgKzExMiwy
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
