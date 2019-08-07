Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0884845F3
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 09:28:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC1336E687;
	Wed,  7 Aug 2019 07:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0D588E4B;
 Wed,  7 Aug 2019 01:34:48 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id t132so42536535pgb.9;
 Tue, 06 Aug 2019 18:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=A5i3Rg5kn+067MlNxvjupwCb7OvZHoHIUYxhc992JlI=;
 b=Fuyym09pT9/C1rTl5Y38RuOpuB/+fWSV0UPblXEHWqu3ipz3o5qb+h/RSD+MrwJiG6
 JJpR5XdKBcLSCFz0bYF2U+/SO8dChuUkfC/TjSwMcw3SnP+4E6vqSg0jBT+BTGdmB5Z1
 z4VBV/qXWyPn7B/hK/jYu1u+o4Pg/ple4HsGd7T+OETndaMQ6H6Gx9LZu415357/FaDF
 53e4VXiq0zYycT9YfaIjnOtblRVWi4d2Wzwvft/emN7NkHi+kBS+OBGa8I2iIZAi2vP7
 oGIYiZNyMo5pSInp0tlZXc2aombWupZ0YJSOvp9ZFpzZwa8GBY47rcR2ulyyboxp7CIK
 HBEg==
X-Gm-Message-State: APjAAAVp8FbgRhqHa9C2vQtEwMXegzztLPG1u/Yac6oLxd6aYtk8PzTi
 5kxTXhV9qs9bm8Qwa9NKgH4=
X-Google-Smtp-Source: APXvYqxXaYo+gh0YYtTix+CeaO6wRH87rvrphHjKjanKlk0flLMZdWbR1kBDDX6DGd+bDWORU88dWA==
X-Received: by 2002:a62:82c2:: with SMTP id w185mr6984715pfd.202.1565141688648; 
 Tue, 06 Aug 2019 18:34:48 -0700 (PDT)
Received: from blueforge.nvidia.com (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id
 u69sm111740800pgu.77.2019.08.06.18.34.47
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 18:34:48 -0700 (PDT)
From: john.hubbard@gmail.com
X-Google-Original-From: jhubbard@nvidia.com
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 40/41] mm/mempolicy.c: convert put_page() to
 put_user_page*()
Date: Tue,  6 Aug 2019 18:33:39 -0700
Message-Id: <20190807013340.9706-41-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190807013340.9706-1-jhubbard@nvidia.com>
References: <20190807013340.9706-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Approved-At: Wed, 07 Aug 2019 07:26:18 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A5i3Rg5kn+067MlNxvjupwCb7OvZHoHIUYxhc992JlI=;
 b=UuxFmnJcCEiWt0xY93+zMuXrIr0kVOIbVkqb6dZDNdX573lgx/iGModXW3xzK9pGPY
 cX+tzVZPKgXMZcfG6ZQsPBSt7kseMu7toLWYUmZdBZq9AOoIRDIMFVmbrRQtXe8+kp+2
 xuf5cY8DkN1gTDTxNyizBF6w883Echl9BWKspGn3wAfNIa3ZXNbfw60ziAuU+jfpWm00
 aE3B42LRws0QrKz6yT/I5rdSznH6+bxJbanBI1rpoulc0fyM/bumlMmxK+EefqH3NUEF
 FOd2q6meN4oVnduhVeiU1hQqU48TiRdVBcpR/X7lAMOhtHAMxLBvoHxdz/5tEjOACTof
 BpeA==
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
Cc: linux-fbdev@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Jan Kara <jack@suse.cz>, kvm@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Dave Chinner <david@fromorbit.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 sparclinux@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, devel@driverdev.osuosl.org,
 rds-devel@oss.oracle.com, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Vlastimil Babka <vbabka@suse.cz>,
 David Rientjes <rientjes@google.com>, xen-devel@lists.xenproject.org,
 devel@lists.orangefs.org, linux-media@vger.kernel.org,
 Andrea Arcangeli <aarcange@redhat.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 John Hubbard <jhubbard@nvidia.com>, intel-gfx@lists.freedesktop.org,
 Dominik Brodowski <linux@dominikbrodowski.net>, linux-block@vger.kernel.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 linux-rpi-kernel@lists.infradead.org, Dan Williams <dan.j.williams@intel.com>,
 zhong jiang <zhongjiang@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, linux-xfs@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgoKRm9yIHBhZ2VzIHRoYXQg
d2VyZSByZXRhaW5lZCB2aWEgZ2V0X3VzZXJfcGFnZXMqKCksIHJlbGVhc2UgdGhvc2UgcGFnZXMK
dmlhIHRoZSBuZXcgcHV0X3VzZXJfcGFnZSooKSByb3V0aW5lcywgaW5zdGVhZCBvZiB2aWEgcHV0
X3BhZ2UoKSBvcgpyZWxlYXNlX3BhZ2VzKCkuCgpUaGlzIGlzIHBhcnQgYSB0cmVlLXdpZGUgY29u
dmVyc2lvbiwgYXMgZGVzY3JpYmVkIGluIGNvbW1pdCBmYzFkOGU3Y2NhMmQKKCJtbTogaW50cm9k
dWNlIHB1dF91c2VyX3BhZ2UqKCksIHBsYWNlaG9sZGVyIHZlcnNpb25zIikuCgpDYzogQW5kcmVh
IEFyY2FuZ2VsaSA8YWFyY2FuZ2VAcmVkaGF0LmNvbT4KQ2M6IEFuc2h1bWFuIEtoYW5kdWFsIDxh
bnNodW1hbi5raGFuZHVhbEBhcm0uY29tPgpDYzogRGF2aWQgUmllbnRqZXMgPHJpZW50amVzQGdv
b2dsZS5jb20+CkNjOiBEb21pbmlrIEJyb2Rvd3NraSA8bGludXhAZG9taW5pa2Jyb2Rvd3NraS5u
ZXQ+CkNjOiBLaXJpbGwgQS4gU2h1dGVtb3YgPGtpcmlsbC5zaHV0ZW1vdkBsaW51eC5pbnRlbC5j
b20+CkNjOiBNaWNoYWwgSG9ja28gPG1ob2Nrb0BzdXNlLmNvbT4KQ2M6IFZsYXN0aW1pbCBCYWJr
YSA8dmJhYmthQHN1c2UuY3o+CkNjOiB6aG9uZyBqaWFuZyA8emhvbmdqaWFuZ0BodWF3ZWkuY29t
PgpTaWduZWQtb2ZmLWJ5OiBKb2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+Ci0tLQog
bW0vbWVtcG9saWN5LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9tbS9tZW1wb2xpY3kuYyBiL21tL21lbXBvbGljeS5j
CmluZGV4IGY0ODY5M2Y3NWIzNy4uNzZhOGU5MzVlMmU2IDEwMDY0NAotLS0gYS9tbS9tZW1wb2xp
Y3kuYworKysgYi9tbS9tZW1wb2xpY3kuYwpAQCAtODMyLDcgKzgzMiw3IEBAIHN0YXRpYyBpbnQg
bG9va3VwX25vZGUoc3RydWN0IG1tX3N0cnVjdCAqbW0sIHVuc2lnbmVkIGxvbmcgYWRkcikKIAll
cnIgPSBnZXRfdXNlcl9wYWdlc19sb2NrZWQoYWRkciAmIFBBR0VfTUFTSywgMSwgMCwgJnAsICZs
b2NrZWQpOwogCWlmIChlcnIgPj0gMCkgewogCQllcnIgPSBwYWdlX3RvX25pZChwKTsKLQkJcHV0
X3BhZ2UocCk7CisJCXB1dF91c2VyX3BhZ2UocCk7CiAJfQogCWlmIChsb2NrZWQpCiAJCXVwX3Jl
YWQoJm1tLT5tbWFwX3NlbSk7Ci0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
