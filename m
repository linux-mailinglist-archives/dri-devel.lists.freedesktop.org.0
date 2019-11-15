Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63501FD4CC
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 06:54:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCD46E291;
	Fri, 15 Nov 2019 05:54:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8317E6E1E9
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 05:53:58 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dce3d6e0003>; Thu, 14 Nov 2019 21:53:50 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Thu, 14 Nov 2019 21:53:47 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Thu, 14 Nov 2019 21:53:47 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:46 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 15 Nov
 2019 05:53:45 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Fri, 15 Nov 2019 05:53:45 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dce3d690004>; Thu, 14 Nov 2019 21:53:45 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 21/24] mm/gup_benchmark: use proper FOLL_WRITE flags
 instead of hard-coding "1"
Date: Thu, 14 Nov 2019 21:53:37 -0800
Message-ID: <20191115055340.1825745-22-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191115055340.1825745-1-jhubbard@nvidia.com>
References: <20191115055340.1825745-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573797230; bh=zwwITV4l72pt0LmhAqpHWuQbAhr06rUfgov5x98Cdpc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=Wo1KOE/292WLrhv09gw5tDX9Gtiub+4TQJPIH0/oYlaTQCnnO3SNn7MBqrkiLZfcb
 0CrQzWIO+Duxbgpw/QPJ2ywwDzz4dFfETf006C+UutkyyxM3plkcT+0OwaF+b9pc2X
 KqFq3jJYGVsyv9gh3HwcanV/NYeQf2RiJik/dlGv0J9lDbHS3d4lcID4Ye34ttZs/M
 NNe4DJGlqHJ4o0PeeJdlmPZP4szxXiUapVynvRURDAG5Tb4gYg7Flmrm9+isC8+dOt
 +zwt5xpT/P0rDyPCKxel/L4bbB35/Pmdq0q1cUNkUKpHyBbnB9Ozf/uROtIQ/1GqNK
 V8aXV7uYq5dnQ==
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

Rml4IHRoZSBndXAgYmVuY2htYXJrIGZsYWdzIHRvIHVzZSB0aGUgc3ltYm9saWMgRk9MTF9XUklU
RSwKaW5zdGVhZCBvZiBhIGhhcmQtY29kZWQgIjEiIHZhbHVlLgoKQWxzbywgY2xlYW4gdXAgdGhl
IGZpbHRlcmluZyBvZiBndXAgZmxhZ3MgYSBsaXR0bGUsIGJ5IGp1c3QgZG9pbmcKaXQgb25jZSBi
ZWZvcmUgaXNzdWluZyBhbnkgb2YgdGhlIGdldF91c2VyX3BhZ2VzKigpIGNhbGxzLiBUaGlzCm1h
a2VzIGl0IGhhcmRlciB0byBvdmVybG9vaywgaW5zdGVhZCBvZiBoYXZpbmcgbGl0dGxlICJndXBf
ZmxhZ3MgJiAxIgpwaHJhc2VzIGluIHRoZSBmdW5jdGlvbiBjYWxscy4KClJldmlld2VkLWJ5OiBJ
cmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFy
ZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXBfYmVuY2htYXJrLmMgICAgICAgICAg
ICAgICAgICAgICAgICAgfCA5ICsrKysrKy0tLQogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0v
Z3VwX2JlbmNobWFyay5jIHwgNiArKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9ndXBfYmVuY2htYXJrLmMgYi9t
bS9ndXBfYmVuY2htYXJrLmMKaW5kZXggN2RkNjAyZDdmOGRiLi43ZmM0NGQyNWVjYTcgMTAwNjQ0
Ci0tLSBhL21tL2d1cF9iZW5jaG1hcmsuYworKysgYi9tbS9ndXBfYmVuY2htYXJrLmMKQEAgLTQ4
LDE4ICs0OCwyMSBAQCBzdGF0aWMgaW50IF9fZ3VwX2JlbmNobWFya19pb2N0bCh1bnNpZ25lZCBp
bnQgY21kLAogCQkJbnIgPSAobmV4dCAtIGFkZHIpIC8gUEFHRV9TSVpFOwogCQl9CiAKKwkJLyog
RmlsdGVyIG91dCBtb3N0IGd1cCBmbGFnczogb25seSBhbGxvdyBhIHRpbnkgc3Vic2V0IGhlcmU6
ICovCisJCWd1cC0+ZmxhZ3MgJj0gRk9MTF9XUklURTsKKwogCQlzd2l0Y2ggKGNtZCkgewogCQlj
YXNlIEdVUF9GQVNUX0JFTkNITUFSSzoKLQkJCW5yID0gZ2V0X3VzZXJfcGFnZXNfZmFzdChhZGRy
LCBuciwgZ3VwLT5mbGFncyAmIDEsCisJCQluciA9IGdldF91c2VyX3BhZ2VzX2Zhc3QoYWRkciwg
bnIsIGd1cC0+ZmxhZ3MsCiAJCQkJCQkgcGFnZXMgKyBpKTsKIAkJCWJyZWFrOwogCQljYXNlIEdV
UF9MT05HVEVSTV9CRU5DSE1BUks6CiAJCQluciA9IGdldF91c2VyX3BhZ2VzKGFkZHIsIG5yLAot
CQkJCQkgICAgKGd1cC0+ZmxhZ3MgJiAxKSB8IEZPTExfTE9OR1RFUk0sCisJCQkJCSAgICBndXAt
PmZsYWdzIHwgRk9MTF9MT05HVEVSTSwKIAkJCQkJICAgIHBhZ2VzICsgaSwgTlVMTCk7CiAJCQli
cmVhazsKIAkJY2FzZSBHVVBfQkVOQ0hNQVJLOgotCQkJbnIgPSBnZXRfdXNlcl9wYWdlcyhhZGRy
LCBuciwgZ3VwLT5mbGFncyAmIDEsIHBhZ2VzICsgaSwKKwkJCW5yID0gZ2V0X3VzZXJfcGFnZXMo
YWRkciwgbnIsIGd1cC0+ZmxhZ3MsIHBhZ2VzICsgaSwKIAkJCQkJICAgIE5VTEwpOwogCQkJYnJl
YWs7CiAJCWRlZmF1bHQ6CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9n
dXBfYmVuY2htYXJrLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ndXBfYmVuY2htYXJr
LmMKaW5kZXggNDg1Y2YwNmVmMDEzLi4zODkzMjdlOWIzMGEgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsuYworKysgYi90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy92bS9ndXBfYmVuY2htYXJrLmMKQEAgLTE4LDYgKzE4LDkgQEAKICNkZWZpbmUgR1VQ
X0xPTkdURVJNX0JFTkNITUFSSwlfSU9XUignZycsIDIsIHN0cnVjdCBndXBfYmVuY2htYXJrKQog
I2RlZmluZSBHVVBfQkVOQ0hNQVJLCQlfSU9XUignZycsIDMsIHN0cnVjdCBndXBfYmVuY2htYXJr
KQogCisvKiBKdXN0IHRoZSBmbGFncyB3ZSBuZWVkLCBjb3BpZWQgZnJvbSBtbS5oOiAqLworI2Rl
ZmluZSBGT0xMX1dSSVRFCTB4MDEJLyogY2hlY2sgcHRlIGlzIHdyaXRhYmxlICovCisKIHN0cnVj
dCBndXBfYmVuY2htYXJrIHsKIAlfX3U2NCBnZXRfZGVsdGFfdXNlYzsKIAlfX3U2NCBwdXRfZGVs
dGFfdXNlYzsKQEAgLTg1LDcgKzg4LDggQEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2
KQogCX0KIAogCWd1cC5ucl9wYWdlc19wZXJfY2FsbCA9IG5yX3BhZ2VzOwotCWd1cC5mbGFncyA9
IHdyaXRlOworCWlmICh3cml0ZSkKKwkJZ3VwLmZsYWdzIHw9IEZPTExfV1JJVEU7CiAKIAlmZCA9
IG9wZW4oIi9zeXMva2VybmVsL2RlYnVnL2d1cF9iZW5jaG1hcmsiLCBPX1JEV1IpOwogCWlmIChm
ZCA9PSAtMSkKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
