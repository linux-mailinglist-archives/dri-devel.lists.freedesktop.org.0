Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD39104B31
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2019 08:14:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 430E06EB0E;
	Thu, 21 Nov 2019 07:13:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate16.nvidia.com (hqemgate16.nvidia.com [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B67126EAFE
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 07:13:56 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate16.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd639350001>; Wed, 20 Nov 2019 23:13:57 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Wed, 20 Nov 2019 23:13:56 -0800
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Wed, 20 Nov 2019 23:13:56 -0800
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 21 Nov
 2019 07:13:55 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 21 Nov 2019 07:13:55 +0000
Received: from blueforge.nvidia.com (Not Verified[10.110.48.28]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5dd639330008>; Wed, 20 Nov 2019 23:13:55 -0800
From: John Hubbard <jhubbard@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v7 06/24] goldish_pipe: rename local pin_user_pages() routine
Date: Wed, 20 Nov 2019 23:13:36 -0800
Message-ID: <20191121071354.456618-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191121071354.456618-1-jhubbard@nvidia.com>
References: <20191121071354.456618-1-jhubbard@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1574320437; bh=cxrYI8z67LUDSVSVMDkZ4g/06HxDdZi4HuPof8bMOLY=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 In-Reply-To:References:MIME-Version:X-NVConfidentiality:
 Content-Type:Content-Transfer-Encoding;
 b=S9Cs+WYr2e3d+dBh1MPD4feJLhbOZcyw8dghn9WNYs9/Hkq96eA4nlQX8SLiJuPMe
 fa8TC2OrwfA87SSw1m+iKsYukesmaJF4VxTYc2pfaFnKOhqKt61a/xbPvhWQpOkCAL
 VCg20LTmJKdw3RpjAzj9U5M9ELKajIS1WtcQoAcsseQD/JVd/55n1TqHXnDJu8yyFP
 OyiG+IBq0NwMIhllCjWEjMtEz/J1hNk7eJiWOLfoTsB/ykTwHvk2fDMG6WCABXkP3K
 Pq8v7bJY3uphFQGkPppWp6FME5EK8w0gYsgo3pHEegqhADC2I61MQ4XxOn6zph3rKk
 d5kdx13cB77jg==
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
dGlvbi4KClJldmlld2VkLWJ5OiBKYW4gS2FyYSA8amFja0BzdXNlLmN6PgpSZXZpZXdlZC1ieTog
SsOpcsO0bWUgR2xpc3NlIDxqZ2xpc3NlQHJlZGhhdC5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2Vp
bnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvaG4gSHViYmFyZCA8amh1
YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNo
X3BpcGUuYyB8IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0
aW9ucygrKSwgOSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL2dv
bGRmaXNoL2dvbGRmaXNoX3BpcGUuYyBiL2RyaXZlcnMvcGxhdGZvcm0vZ29sZGZpc2gvZ29sZGZp
c2hfcGlwZS5jCmluZGV4IGNlZjAxMzNhYTQ3YS4uN2VkMmEyMWEwYmFjIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3BsYXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYworKysgYi9kcml2ZXJzL3Bs
YXRmb3JtL2dvbGRmaXNoL2dvbGRmaXNoX3BpcGUuYwpAQCAtMjU3LDEyICsyNTcsMTIgQEAgc3Rh
dGljIGludCBnb2xkZmlzaF9waXBlX2Vycm9yX2NvbnZlcnQoaW50IHN0YXR1cykKIAl9CiB9CiAK
LXN0YXRpYyBpbnQgcGluX3VzZXJfcGFnZXModW5zaWduZWQgbG9uZyBmaXJzdF9wYWdlLAotCQkJ
ICB1bnNpZ25lZCBsb25nIGxhc3RfcGFnZSwKLQkJCSAgdW5zaWduZWQgaW50IGxhc3RfcGFnZV9z
aXplLAotCQkJICBpbnQgaXNfd3JpdGUsCi0JCQkgIHN0cnVjdCBwYWdlICpwYWdlc1tNQVhfQlVG
RkVSU19QRVJfQ09NTUFORF0sCi0JCQkgIHVuc2lnbmVkIGludCAqaXRlcl9sYXN0X3BhZ2Vfc2l6
ZSkKK3N0YXRpYyBpbnQgcGluX2dvbGRmaXNoX3BhZ2VzKHVuc2lnbmVkIGxvbmcgZmlyc3RfcGFn
ZSwKKwkJCSAgICAgIHVuc2lnbmVkIGxvbmcgbGFzdF9wYWdlLAorCQkJICAgICAgdW5zaWduZWQg
aW50IGxhc3RfcGFnZV9zaXplLAorCQkJICAgICAgaW50IGlzX3dyaXRlLAorCQkJICAgICAgc3Ry
dWN0IHBhZ2UgKnBhZ2VzW01BWF9CVUZGRVJTX1BFUl9DT01NQU5EXSwKKwkJCSAgICAgIHVuc2ln
bmVkIGludCAqaXRlcl9sYXN0X3BhZ2Vfc2l6ZSkKIHsKIAlpbnQgcmV0OwogCWludCByZXF1ZXN0
ZWRfcGFnZXMgPSAoKGxhc3RfcGFnZSAtIGZpcnN0X3BhZ2UpID4+IFBBR0VfU0hJRlQpICsgMTsK
QEAgLTM1NCw5ICszNTQsOSBAQCBzdGF0aWMgaW50IHRyYW5zZmVyX21heF9idWZmZXJzKHN0cnVj
dCBnb2xkZmlzaF9waXBlICpwaXBlLAogCWlmIChtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJnBp
cGUtPmxvY2spKQogCQlyZXR1cm4gLUVSRVNUQVJUU1lTOwogCi0JcGFnZXNfY291bnQgPSBwaW5f
dXNlcl9wYWdlcyhmaXJzdF9wYWdlLCBsYXN0X3BhZ2UsCi0JCQkJICAgICBsYXN0X3BhZ2Vfc2l6
ZSwgaXNfd3JpdGUsCi0JCQkJICAgICBwaXBlLT5wYWdlcywgJml0ZXJfbGFzdF9wYWdlX3NpemUp
OworCXBhZ2VzX2NvdW50ID0gcGluX2dvbGRmaXNoX3BhZ2VzKGZpcnN0X3BhZ2UsIGxhc3RfcGFn
ZSwKKwkJCQkJIGxhc3RfcGFnZV9zaXplLCBpc193cml0ZSwKKwkJCQkJIHBpcGUtPnBhZ2VzLCAm
aXRlcl9sYXN0X3BhZ2Vfc2l6ZSk7CiAJaWYgKHBhZ2VzX2NvdW50IDwgMCkgewogCQltdXRleF91
bmxvY2soJnBpcGUtPmxvY2spOwogCQlyZXR1cm4gcGFnZXNfY291bnQ7Ci0tIAoyLjI0LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
