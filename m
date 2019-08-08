Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B7A85E98
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 11:37:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 290C56E750;
	Thu,  8 Aug 2019 09:37:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43DC66E750
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 09:37:04 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A7A6530BD1CD;
 Thu,  8 Aug 2019 09:37:03 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 640165EE1D;
 Thu,  8 Aug 2019 09:37:03 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 949A917444; Thu,  8 Aug 2019 11:37:02 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/8] scsi: core: fix the dma_max_mapping_size call
Date: Thu,  8 Aug 2019 11:36:55 +0200
Message-Id: <20190808093702.29512-2-kraxel@redhat.com>
In-Reply-To: <20190808093702.29512-1-kraxel@redhat.com>
References: <20190808093702.29512-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 08 Aug 2019 09:37:03 +0000 (UTC)
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
Cc: "Martin K . Petersen" <martin.petersen@oracle.com>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 open list <linux-kernel@vger.kernel.org>, tzimmermann@suse.de,
 Christoph Hellwig <hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+CgpXZSBzaG91bGQgb25seSBjYWxs
IGRtYV9tYXhfbWFwcGluZ19zaXplIGZvciBkZXZpY2VzIHRoYXQgaGF2ZSBhIERNQSBtYXNrCnNl
dCwgb3RoZXJ3aXNlIHdlIGNhbiBydW4gaW50byBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSB0
aGF0IHdpbGwgY3Jhc2gKdGhlIHN5c3RlbS4KCkFsc28gd2UgbmVlZCB0byBkbyByaWdodCBzaGlm
dCB0byBnZXQgdGhlIHNlY3RvcnMgZnJvbSB0aGUgc2l6ZSBpbiBieXRlcywKbm90IGEgbGVmdCBz
aGlmdC4KCkZpeGVzOiBiZGQxN2JkZWY3ZDggKCJzY3NpOiBjb3JlOiB0YWtlIHRoZSBETUEgbWF4
IG1hcHBpbmcgc2l6ZSBpbnRvIGFjY291bnQiKQpSZXBvcnRlZC1ieTogQmFydCBWYW4gQXNzY2hl
IDxidmFuYXNzY2hlQGFjbS5vcmc+ClJlcG9ydGVkLWJ5OiBNaW5nIExlaSA8dG9tLmxlaW1pbmdA
Z21haWwuY29tPgpUZXN0ZWQtYnk6IEd1aWxoZXJtZSBHLiBQaWNjb2xpIDxncGljY29saUBjYW5v
bmljYWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
U2lnbmVkLW9mZi1ieTogTWFydGluIEsuIFBldGVyc2VuIDxtYXJ0aW4ucGV0ZXJzZW5Ab3JhY2xl
LmNvbT4KKGNoZXJyeSBwaWNrZWQgZnJvbSBjb21taXQgMWI1ZDlhNmU5ODM1MGUwNzEzYjRmYWEx
YjA0ZThmMjM5ZjYzYjU4MSkKLS0tCiBkcml2ZXJzL3Njc2kvc2NzaV9saWIuYyB8IDYgKysrKy0t
CiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc2NzaS9zY3NpX2xpYi5jIGIvZHJpdmVycy9zY3NpL3Njc2lfbGliLmMK
aW5kZXggOTM4MTE3MWMyZmMwLi4xMWU2NGI1MDQ5N2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2Nz
aS9zY3NpX2xpYi5jCisrKyBiL2RyaXZlcnMvc2NzaS9zY3NpX2xpYi5jCkBAIC0xNzg0LDggKzE3
ODQsMTAgQEAgdm9pZCBfX3Njc2lfaW5pdF9xdWV1ZShzdHJ1Y3QgU2NzaV9Ib3N0ICpzaG9zdCwg
c3RydWN0IHJlcXVlc3RfcXVldWUgKnEpCiAJCWJsa19xdWV1ZV9tYXhfaW50ZWdyaXR5X3NlZ21l
bnRzKHEsIHNob3N0LT5zZ19wcm90X3RhYmxlc2l6ZSk7CiAJfQogCi0Jc2hvc3QtPm1heF9zZWN0
b3JzID0gbWluX3QodW5zaWduZWQgaW50LCBzaG9zdC0+bWF4X3NlY3RvcnMsCi0JCQlkbWFfbWF4
X21hcHBpbmdfc2l6ZShkZXYpIDw8IFNFQ1RPUl9TSElGVCk7CisJaWYgKGRldi0+ZG1hX21hc2sp
IHsKKwkJc2hvc3QtPm1heF9zZWN0b3JzID0gbWluX3QodW5zaWduZWQgaW50LCBzaG9zdC0+bWF4
X3NlY3RvcnMsCisJCQkJZG1hX21heF9tYXBwaW5nX3NpemUoZGV2KSA+PiBTRUNUT1JfU0hJRlQp
OworCX0KIAlibGtfcXVldWVfbWF4X2h3X3NlY3RvcnMocSwgc2hvc3QtPm1heF9zZWN0b3JzKTsK
IAlpZiAoc2hvc3QtPnVuY2hlY2tlZF9pc2FfZG1hKQogCQlibGtfcXVldWVfYm91bmNlX2xpbWl0
KHEsIEJMS19CT1VOQ0VfSVNBKTsKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
