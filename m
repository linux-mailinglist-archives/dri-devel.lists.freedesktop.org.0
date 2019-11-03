Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E1EDA26
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 08:54:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B2F86E14D;
	Mon,  4 Nov 2019 07:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF7FB6E10F
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 00:40:12 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dbf441e0000>; Sun, 03 Nov 2019 13:18:22 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Sun, 03 Nov 2019 13:18:15 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Sun, 03 Nov 2019 13:18:15 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Sun, 3 Nov
 2019 21:18:15 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Sun, 3 Nov 2019 21:18:15 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dbf44170000>; Sun, 03 Nov 2019 13:18:15 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 03/18] goldish_pipe: rename local pin_user_pages() routine
Date: Sun, 3 Nov 2019 13:17:58 -0800
Message-ID: <20191103211813.213227-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191103211813.213227-1-jhubbard@nvidia.com>
References: <20191103211813.213227-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Mon, 04 Nov 2019 07:54:21 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1572815902; bh=yxndnpa6bj0xuoqPqvRY6Qkte9w9GoWasaTzIgTLBt4=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Transfer-Encoding:Content-Type;
 b=CrZf2JZ8Z1BYEcbLmYpFUD1ZNvhKRHAjpH0YXVbR2NxZF7sRz7rzdYCVUfbyeDKkX
 2g2B6QpG23BEG3g/71RW3OuY9p0N3tXefMp1ZYbFTW1iz2PLwALdJ+mkuVyb1iqsZr
 F8sWxJDJO54yzjEP4wU9YZdl8I/hsHy8pE37+OizFKv6wlKVuaPeh5mzoi0KCgmnBg
 /Y00qBw+/btgnF7T7NnqeETOhIof/gF2HPnAs7yZ+7cxOlyZsmzW+pd420DMcmtwfZ
 vgdXxoB17ve4yALSsXuszIbA5INhDD5JbZJUAmVEfJrKoaspcnukDpzoiq6VEYRf9+
 tELlqsr98UjAA==
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

MS4gQXZvaWQgbmFtaW5nIGNvbmZsaWN0czogcmVuYW1lIGxvY2FsIHN0YXRpYyBmdW5jdGlvbiBm
cm9tCiJwaW5fdXNlcl9wYWdlcygpIiB0byAicGluX2dvbGRmaXNoX3BhZ2VzKCkiLgoKQW4gdXBj
b21pbmcgcGF0Y2ggd2lsbCBpbnRyb2R1Y2UgYSBnbG9iYWwgcGluX3VzZXJfcGFnZXMoKQpmdW5j
dGlvbi4KClJldmlld2VkLWJ5OiBJcmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJz
L3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYyBiL2RyaXZl
cnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZpc2hfcGlwZS5jCmluZGV4IGNlZjAxMzNhYTQ3YS4u
N2VkMmEyMWEwYmFjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRm
aXNoX3BpcGUuYworKysgYi9kcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUu
YwpAQCAtMjU3LDEyICsyNTcsMTIgQEAgc3RhdGljIGludCBnb2xkZmlzaF9waXBlX2Vycm9yX2Nv
bnZlcnQoaW50IHN0YXR1cykKIAl9CiB9CiAKLXN0YXRpYyBpbnQgcGluX3VzZXJfcGFnZXModW5z
aWduZWQgbG9uZyBmaXJzdF9wYWdlLAotCQkJICB1bnNpZ25lZCBsb25nIGxhc3RfcGFnZSwKLQkJ
CSAgdW5zaWduZWQgaW50IGxhc3RfcGFnZV9zaXplLAotCQkJICBpbnQgaXNfd3JpdGUsCi0JCQkg
IHN0cnVjdCBwYWdlICpwYWdlc1tNQVhfQlVGRkVSU19QRVJfQ09NTUFORF0sCi0JCQkgIHVuc2ln
bmVkIGludCAqaXRlcl9sYXN0X3BhZ2Vfc2l6ZSkKK3N0YXRpYyBpbnQgcGluX2dvbGRmaXNoX3Bh
Z2VzKHVuc2lnbmVkIGxvbmcgZmlyc3RfcGFnZSwKKwkJCSAgICAgIHVuc2lnbmVkIGxvbmcgbGFz
dF9wYWdlLAorCQkJICAgICAgdW5zaWduZWQgaW50IGxhc3RfcGFnZV9zaXplLAorCQkJICAgICAg
aW50IGlzX3dyaXRlLAorCQkJICAgICAgc3RydWN0IHBhZ2UgKnBhZ2VzW01BWF9CVUZGRVJTX1BF
Ul9DT01NQU5EXSwKKwkJCSAgICAgIHVuc2lnbmVkIGludCAqaXRlcl9sYXN0X3BhZ2Vfc2l6ZSkK
IHsKIAlpbnQgcmV0OwogCWludCByZXF1ZXN0ZWRfcGFnZXMgPSAoKGxhc3RfcGFnZSAtIGZpcnN0
X3BhZ2UpID4+IFBBR0VfU0hJRlQpICsgMTsKQEAgLTM1NCw5ICszNTQsOSBAQCBzdGF0aWMgaW50
IHRyYW5zZmVyX21heF9idWZmZXJzKHN0cnVjdCBnb2xkZmlzaF9waXBlICpwaXBlLAogCWlmICht
dXRleF9sb2NrX2ludGVycnVwdGlibGUoJnBpcGUtPmxvY2spKQogCQlyZXR1cm4gLUVSRVNUQVJU
U1lTOwogCi0JcGFnZXNfY291bnQgPSBwaW5fdXNlcl9wYWdlcyhmaXJzdF9wYWdlLCBsYXN0X3Bh
Z2UsCi0JCQkJICAgICBsYXN0X3BhZ2Vfc2l6ZSwgaXNfd3JpdGUsCi0JCQkJICAgICBwaXBlLT5w
YWdlcywgJml0ZXJfbGFzdF9wYWdlX3NpemUpOworCXBhZ2VzX2NvdW50ID0gcGluX2dvbGRmaXNo
X3BhZ2VzKGZpcnN0X3BhZ2UsIGxhc3RfcGFnZSwKKwkJCQkJIGxhc3RfcGFnZV9zaXplLCBpc193
cml0ZSwKKwkJCQkJIHBpcGUtPnBhZ2VzLCAmaXRlcl9sYXN0X3BhZ2Vfc2l6ZSk7CiAJaWYgKHBh
Z2VzX2NvdW50IDwgMCkgewogCQltdXRleF91bmxvY2soJnBpcGUtPmxvY2spOwogCQlyZXR1cm4g
cGFnZXNfY291bnQ7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
