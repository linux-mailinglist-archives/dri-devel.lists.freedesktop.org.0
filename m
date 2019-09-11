Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07748B07B9
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:15:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 253746E124;
	Thu, 12 Sep 2019 04:12:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from hqemgate15.nvidia.com (hqemgate15.nvidia.com [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA286E0E2;
 Wed, 11 Sep 2019 22:28:47 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate15.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5d7975230000>; Wed, 11 Sep 2019 15:28:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 11 Sep 2019 15:28:46 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 11 Sep 2019 15:28:46 -0700
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Sep
 2019 22:28:43 +0000
Received: from hqnvemgw01.nvidia.com (172.20.150.20) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Sep 2019 22:28:43 +0000
Received: from rcampbell-dev.nvidia.com (Not Verified[10.110.48.66]) by
 hqnvemgw01.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5d79751a0003>; Wed, 11 Sep 2019 15:28:42 -0700
From: Ralph Campbell <rcampbell@nvidia.com>
To: <linux-mm@kvack.org>
Subject: [PATCH 0/4] HMM tests and minor fixes
Date: Wed, 11 Sep 2019 15:28:25 -0700
Message-ID: <20190911222829.28874-1-rcampbell@nvidia.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-NVConfidentiality: public
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nvidia.com; s=n1; 
 t=1568240931; bh=Dh8YksJO7otMqlUqvnlcy89p09JxR+sFwxCtiGvsYNU=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:X-NVConfidentiality:Content-Type:
 Content-Transfer-Encoding;
 b=OTq660RjB6dzpe60fOzoY+lzAEtGvMCTtmZoIVWmV8sMmeiCyqSIkhLfThszuvYzb
 Ha0CoERgf0L/6cb34YwFmnwIJZEjBTERV3ek1H/GBmMBbY4vlY71RzAZYn7aqaf2qV
 kPH8Wdz/cA/lZBTpiO1DK+kfQb8eq3uoVSBW2P/Q+8fNaiT6POn7oxnFh0GpJOAcR3
 NvejJ2Bw/bSaL44yDphjMPYhLgDhLt7wqqxU5n+bGJ5Id7ueYMWoUKMmfyQ/mhJQDt
 k6+ohnisBrTSSEzHZq0olTXV+Hc1p/35HLmSUfBpwcQRpHOZQwniQdCNWncl7t+pgb
 cpAhUMgiRHdww==
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlc2UgY2hhbmdlcyBhcmUgYmFzZWQgb24gSmFzb24ncyBsYXRlc3QgaG1tIGJyYW5jaC4KUGF0
Y2ggMSB3YXMgcHJldmlvdXNseSBwb3N0ZWQgaGVyZSBbMV0gYnV0IHdhcyBkcm9wcGVkIGZyb20g
dGhlIG9yZ2luYWwKc2VyaWVzLiBIb3BlZnVsbHksIHRoZSB0ZXN0cyB3aWxsIHJlZHVjZSBjb25j
ZXJucyBhYm91dCBlZGdlIGNvbmRpdGlvbnMuCkknbSBzdXJlIG1vcmUgdGVzdHMgY291bGQgYmUg
dXNlZnVsbHkgYWRkZWQgYnV0IEkgdGhvdWdodCB0aGlzIHdhcyBhIGdvb2QKc3RhcnRpbmcgcG9p
bnQuCgpbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vMjAxOTA3MjYwMDU2NTAu
MjU2Ni02LXJjYW1wYmVsbEBudmlkaWEuY29tLwoKUmFscGggQ2FtcGJlbGwgKDQpOgogIG1tL2ht
bTogbWFrZSBmdWxsIHVzZSBvZiB3YWxrX3BhZ2VfcmFuZ2UoKQogIG1tL2htbTogYWxsb3cgc25h
cHNob3Qgb2YgdGhlIHNwZWNpYWwgemVybyBwYWdlCiAgbW0vaG1tOiBhbGxvdyBobW1fcmFuZ2Vf
ZmF1bHQoKSBvZiBtbWFwKFBST1RfTk9ORSkKICBtbS9obW0vdGVzdDogYWRkIHNlbGYgdGVzdHMg
Zm9yIEhNTQoKIE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMyAr
CiBkcml2ZXJzL2NoYXIvS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICAgMTEgKwogZHJpdmVy
cy9jaGFyL01ha2VmaWxlICAgICAgICAgICAgICAgICAgfCAgICAxICsKIGRyaXZlcnMvY2hhci9o
bW1fZG1pcnJvci5jICAgICAgICAgICAgIHwgMTUwNCArKysrKysrKysrKysrKysrKysrKysrKysK
IGluY2x1ZGUvS2J1aWxkICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAgMSArCiBpbmNsdWRl
L3VhcGkvbGludXgvaG1tX2RtaXJyb3IuaCAgICAgICB8ICAgNzQgKysKIG1tL2htbS5jICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDExNyArLQogdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMvdm0vLmdpdGlnbm9yZSAgfCAgICAxICsKIHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL01h
a2VmaWxlICAgIHwgICAgMyArCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9jb25maWcgICAg
ICB8ICAgIDMgKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vaG1tLXRlc3RzLmMgfCAxMzA0
ICsrKysrKysrKysrKysrKysrKysrCiB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9ydW5fdm10
ZXN0cyB8ICAgMTYgKwogdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvdm0vdGVzdF9obW0uc2ggfCAg
MTA1ICsrCiAxMyBmaWxlcyBjaGFuZ2VkLCAzMDc5IGluc2VydGlvbnMoKyksIDY0IGRlbGV0aW9u
cygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvY2hhci9obW1fZG1pcnJvci5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS91YXBpL2xpbnV4L2htbV9kbWlycm9yLmgKIGNyZWF0ZSBt
b2RlIDEwMDY0NCB0b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy92bS9obW0tdGVzdHMuYwogY3JlYXRl
IG1vZGUgMTAwNzU1IHRvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL3ZtL3Rlc3RfaG1tLnNoCgotLSAK
Mi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
