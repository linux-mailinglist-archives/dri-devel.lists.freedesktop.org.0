Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CF7931F946
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 13:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBBA6EB23;
	Fri, 19 Feb 2021 12:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F55E6EB25
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 12:17:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 20F2F80079;
 Fri, 19 Feb 2021 13:17:11 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 2/3] drm/probe-helper: Check epoch counter in
 output_poll_execute()
Date: Fri, 19 Feb 2021 13:17:01 +0100
Message-Id: <20210219121702.50964-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210219121702.50964-1-noralf@tronnes.org>
References: <20210219121702.50964-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Kb38TzQD c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=rnb-knuk5dQJkhbuddwA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, Daniel Vetter <daniel.vetter@ffwll.ch>, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtX2hlbHBlcl9ocGRfaXJxX2V2ZW50KCkgY2hlY2tzIHRoZSBlcG9jaCBjb3VudGVyIHRvIGRl
dGVybWluZQpjb25uZWN0b3Igc3RhdHVzIGNoYW5nZS4gVGhpcyB3YXMgaW50cm9kdWNlZCBpbgpj
b21taXQgNTE4NjQyMWNiZmUyICgiZHJtOiBJbnRyb2R1Y2UgZXBvY2ggY291bnRlciB0byBkcm1f
Y29ubmVjdG9yIikuCkRvIHRoZSBzYW1lIGZvciBvdXRwdXRfcG9sbF9leGVjdXRlKCkgc28gaXQg
Y2FuIGRldGVjdCBvdGhlciBjaGFuZ2VzCmJlc2lkZSBjb25uZWN0aW9uIHN0YXR1cyB2YWx1ZSBj
aGFuZ2VzLgoKdjI6Ci0gQWRkIEZpeGVzIHRhZyAoRGFuaWVsKQoKRml4ZXM6IDUxODY0MjFjYmZl
MiAoImRybTogSW50cm9kdWNlIGVwb2NoIGNvdW50ZXIgdG8gZHJtX2Nvbm5lY3RvciIpClJldmll
d2VkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2Zm
LWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2RybV9wcm9iZV9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMK
aW5kZXggZDYwMTc3MjZjYzJhLi5lNTQzMmRjZjY5OTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fcHJvYmVfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9o
ZWxwZXIuYwpAQCAtNjIzLDYgKzYyMyw3IEBAIHN0YXRpYyB2b2lkIG91dHB1dF9wb2xsX2V4ZWN1
dGUoc3RydWN0IHdvcmtfc3RydWN0ICp3b3JrKQogCXN0cnVjdCBkcm1fY29ubmVjdG9yX2xpc3Rf
aXRlciBjb25uX2l0ZXI7CiAJZW51bSBkcm1fY29ubmVjdG9yX3N0YXR1cyBvbGRfc3RhdHVzOwog
CWJvb2wgcmVwb2xsID0gZmFsc2UsIGNoYW5nZWQ7CisJdTY0IG9sZF9lcG9jaF9jb3VudGVyOwog
CiAJaWYgKCFkZXYtPm1vZGVfY29uZmlnLnBvbGxfZW5hYmxlZCkKIAkJcmV0dXJuOwpAQCAtNjU5
LDggKzY2MCw5IEBAIHN0YXRpYyB2b2lkIG91dHB1dF9wb2xsX2V4ZWN1dGUoc3RydWN0IHdvcmtf
c3RydWN0ICp3b3JrKQogCiAJCXJlcG9sbCA9IHRydWU7CiAKKwkJb2xkX2Vwb2NoX2NvdW50ZXIg
PSBjb25uZWN0b3ItPmVwb2NoX2NvdW50ZXI7CiAJCWNvbm5lY3Rvci0+c3RhdHVzID0gZHJtX2hl
bHBlcl9wcm9iZV9kZXRlY3QoY29ubmVjdG9yLCBOVUxMLCBmYWxzZSk7Ci0JCWlmIChvbGRfc3Rh
dHVzICE9IGNvbm5lY3Rvci0+c3RhdHVzKSB7CisJCWlmIChvbGRfZXBvY2hfY291bnRlciAhPSBj
b25uZWN0b3ItPmVwb2NoX2NvdW50ZXIpIHsKIAkJCWNvbnN0IGNoYXIgKm9sZCwgKm5ldzsKIAog
CQkJLyoKQEAgLTY4OSw2ICs2OTEsOSBAQCBzdGF0aWMgdm9pZCBvdXRwdXRfcG9sbF9leGVjdXRl
KHN0cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKIAkJCQkgICAgICBjb25uZWN0b3ItPmJhc2UuaWQs
CiAJCQkJICAgICAgY29ubmVjdG9yLT5uYW1lLAogCQkJCSAgICAgIG9sZCwgbmV3KTsKKwkJCURS
TV9ERUJVR19LTVMoIltDT05ORUNUT1I6JWQ6JXNdIGVwb2NoIGNvdW50ZXIgJWxsdSAtPiAlbGx1
XG4iLAorCQkJCSAgICAgIGNvbm5lY3Rvci0+YmFzZS5pZCwgY29ubmVjdG9yLT5uYW1lLAorCQkJ
CSAgICAgIG9sZF9lcG9jaF9jb3VudGVyLCBjb25uZWN0b3ItPmVwb2NoX2NvdW50ZXIpOwogCiAJ
CQljaGFuZ2VkID0gdHJ1ZTsKIAkJfQotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
