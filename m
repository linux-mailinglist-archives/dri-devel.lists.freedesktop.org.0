Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B35F7FA80C
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 05:27:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7E186EC6B;
	Wed, 13 Nov 2019 04:27:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC026EC69
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 04:27:22 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dcb85ea0005>; Tue, 12 Nov 2019 20:26:18 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 12 Nov 2019 20:27:14 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 12 Nov 2019 20:27:14 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 13 Nov
 2019 04:27:13 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 13 Nov 2019 04:27:13 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dcb86210006>; Tue, 12 Nov 2019 20:27:13 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 20/23] mm/gup_benchmark: use proper FOLL_WRITE flags
 instead of hard-coding "1"
Date: Tue, 12 Nov 2019 20:27:07 -0800
Message-ID: <20191113042710.3997854-21-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191113042710.3997854-1-jhubbard@nvidia.com>
References: <20191113042710.3997854-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1573619178; bh=7Vmsb+9KRgkgzRB+pY1tHWrSRQ+BM3AUrdVPH7GeYFc=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=H9vUdAtX4lkrYvps4Cxbqg5o9D86/82qya+eDd7C4Fkudybq93veQ/F7aDuQv32CK
 3dXOlykPB7k3TRHD1VWLecBebO6L9jcl704BZDowAj8HHmVVRLw1DEulIBFP/ePgqF
 rL6IUQ4WaVVrWO0Yni7Q0V3NR9eR2qbuy0XyBlnfx6e/zmUSOMazFdIAMsNPbMYcVE
 D2/RirPzqzJMhtIOnblA3J2bC3zLcpg+bUOiKKsnJoaEZxNoR8ZLuWHXNzoETQ4l/C
 4GvCB6hy0If9p8ky/s8F9h3e/AH+sZfm8lOyRQ1k+mq5eWdoxvBNL8vjs3HA1aUN6z
 OTgapBu/yCHUg==
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

Rml4IHRoZSBndXAgYmVuY2htYXJrIGZsYWdzIHRvIHVzZSB0aGUgc3ltYm9saWMgRk9MTF9XUklU
RSwKaW5zdGVhZCBvZiBhIGhhcmQtY29kZWQgIjEiIHZhbHVlLgoKQWxzbywgY2xlYW4gdXAgdGhl
IGZpbHRlcmluZyBvZiBndXAgZmxhZ3MgYSBsaXR0bGUsIGJ5IGp1c3QgZG9pbmcKaXQgb25jZSBi
ZWZvcmUgaXNzdWluZyBhbnkgb2YgdGhlIGdldF91c2VyX3BhZ2VzKigpIGNhbGxzLiBUaGlzCm1h
a2VzIGl0IGhhcmRlciB0byBvdmVybG9vaywgaW5zdGVhZCBvZiBoYXZpbmcgbGl0dGxlICJndXBf
ZmxhZ3MgJiAxIgpwaHJhc2VzIGluIHRoZSBmdW5jdGlvbiBjYWxscy4KClNpZ25lZC1vZmYtYnk6
IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9ndXBfYmVuY2htYXJr
LmMgICAgICAgICAgICAgICAgICAgICAgICAgfCA5ICsrKysrKy0tLQogdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMvdm0vZ3VwX2JlbmNobWFyay5jIHwgNiArKysrKy0KIDIgZmlsZXMgY2hhbmdlZCwg
MTEgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9ndXBfYmVu
Y2htYXJrLmMgYi9tbS9ndXBfYmVuY2htYXJrLmMKaW5kZXggN2RkNjAyZDdmOGRiLi43ZmM0NGQy
NWVjYTcgMTAwNjQ0Ci0tLSBhL21tL2d1cF9iZW5jaG1hcmsuYworKysgYi9tbS9ndXBfYmVuY2ht
YXJrLmMKQEAgLTQ4LDE4ICs0OCwyMSBAQCBzdGF0aWMgaW50IF9fZ3VwX2JlbmNobWFya19pb2N0
bCh1bnNpZ25lZCBpbnQgY21kLAogCQkJbnIgPSAobmV4dCAtIGFkZHIpIC8gUEFHRV9TSVpFOwog
CQl9CiAKKwkJLyogRmlsdGVyIG91dCBtb3N0IGd1cCBmbGFnczogb25seSBhbGxvdyBhIHRpbnkg
c3Vic2V0IGhlcmU6ICovCisJCWd1cC0+ZmxhZ3MgJj0gRk9MTF9XUklURTsKKwogCQlzd2l0Y2gg
KGNtZCkgewogCQljYXNlIEdVUF9GQVNUX0JFTkNITUFSSzoKLQkJCW5yID0gZ2V0X3VzZXJfcGFn
ZXNfZmFzdChhZGRyLCBuciwgZ3VwLT5mbGFncyAmIDEsCisJCQluciA9IGdldF91c2VyX3BhZ2Vz
X2Zhc3QoYWRkciwgbnIsIGd1cC0+ZmxhZ3MsCiAJCQkJCQkgcGFnZXMgKyBpKTsKIAkJCWJyZWFr
OwogCQljYXNlIEdVUF9MT05HVEVSTV9CRU5DSE1BUks6CiAJCQluciA9IGdldF91c2VyX3BhZ2Vz
KGFkZHIsIG5yLAotCQkJCQkgICAgKGd1cC0+ZmxhZ3MgJiAxKSB8IEZPTExfTE9OR1RFUk0sCisJ
CQkJCSAgICBndXAtPmZsYWdzIHwgRk9MTF9MT05HVEVSTSwKIAkJCQkJICAgIHBhZ2VzICsgaSwg
TlVMTCk7CiAJCQlicmVhazsKIAkJY2FzZSBHVVBfQkVOQ0hNQVJLOgotCQkJbnIgPSBnZXRfdXNl
cl9wYWdlcyhhZGRyLCBuciwgZ3VwLT5mbGFncyAmIDEsIHBhZ2VzICsgaSwKKwkJCW5yID0gZ2V0
X3VzZXJfcGFnZXMoYWRkciwgbnIsIGd1cC0+ZmxhZ3MsIHBhZ2VzICsgaSwKIAkJCQkJICAgIE5V
TEwpOwogCQkJYnJlYWs7CiAJCWRlZmF1bHQ6CmRpZmYgLS1naXQgYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy92bS9ndXBfYmVuY2htYXJrLmMgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9n
dXBfYmVuY2htYXJrLmMKaW5kZXggNDg1Y2YwNmVmMDEzLi4zODkzMjdlOWIzMGEgMTAwNjQ0Ci0t
LSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL2d1cF9iZW5jaG1hcmsuYworKysgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ndXBfYmVuY2htYXJrLmMKQEAgLTE4LDYgKzE4LDkgQEAK
ICNkZWZpbmUgR1VQX0xPTkdURVJNX0JFTkNITUFSSwlfSU9XUignZycsIDIsIHN0cnVjdCBndXBf
YmVuY2htYXJrKQogI2RlZmluZSBHVVBfQkVOQ0hNQVJLCQlfSU9XUignZycsIDMsIHN0cnVjdCBn
dXBfYmVuY2htYXJrKQogCisvKiBKdXN0IHRoZSBmbGFncyB3ZSBuZWVkLCBjb3BpZWQgZnJvbSBt
bS5oOiAqLworI2RlZmluZSBGT0xMX1dSSVRFCTB4MDEJLyogY2hlY2sgcHRlIGlzIHdyaXRhYmxl
ICovCisKIHN0cnVjdCBndXBfYmVuY2htYXJrIHsKIAlfX3U2NCBnZXRfZGVsdGFfdXNlYzsKIAlf
X3U2NCBwdXRfZGVsdGFfdXNlYzsKQEAgLTg1LDcgKzg4LDggQEAgaW50IG1haW4oaW50IGFyZ2Ms
IGNoYXIgKiphcmd2KQogCX0KIAogCWd1cC5ucl9wYWdlc19wZXJfY2FsbCA9IG5yX3BhZ2VzOwot
CWd1cC5mbGFncyA9IHdyaXRlOworCWlmICh3cml0ZSkKKwkJZ3VwLmZsYWdzIHw9IEZPTExfV1JJ
VEU7CiAKIAlmZCA9IG9wZW4oIi9zeXMva2VybmVsL2RlYnVnL2d1cF9iZW5jaG1hcmsiLCBPX1JE
V1IpOwogCWlmIChmZCA9PSAtMSkKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
