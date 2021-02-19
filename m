Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2CF31F95A
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 13:22:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE6F6E02C;
	Fri, 19 Feb 2021 12:22:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204D76E02C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 12:22:15 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 678BE8017C;
 Fri, 19 Feb 2021 13:22:13 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/shmem-helpers: vunmap: Don't put pages for dma-buf
Date: Fri, 19 Feb 2021 13:22:03 +0100
Message-Id: <20210219122203.51130-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Kb38TzQD c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=dRmqwjifyJexxtqKRP4A:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZG1hLWJ1ZiBpbXBvcnRpbmcgd2FzIHJld29ya2VkIGluIGNvbW1pdCA3ZDJjZDcyYTlhYTMKKCJk
cm0vc2htZW0taGVscGVyczogU2ltcGxpZnkgZG1hLWJ1ZiBpbXBvcnRpbmciKS4gQmVmb3JlIHRo
YXQgY29tbWl0CmRybV9nZW1fc2htZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKCkgZGlkIHNldCAt
PnBhZ2VzX3VzZV9jb3VudD0xIGFuZApkcm1fZ2VtX3NobWVtX3Z1bm1hcF9sb2NrZWQoKSBjb3Vs
ZCBjYWxsIGRybV9nZW1fc2htZW1fcHV0X3BhZ2VzKCkKdW5jb25kaXRpb25hbGx5LiBOb3cgd2l0
aG91dCB0aGUgdXNlIGNvdW50IHNldCwgcHV0IHBhZ2VzIGlzIGNhbGxlZCBhbHNvCm9uIGRtYS1i
dWZzLiBGaXggdGhpcyBieSBvbmx5IHB1dHRpbmcgcGFnZXMgaWYgaXQncyBub3QgaW1wb3J0ZWQu
CgpGaXhlczogN2QyY2Q3MmE5YWEzICgiZHJtL3NobWVtLWhlbHBlcnM6IFNpbXBsaWZ5IGRtYS1i
dWYgaW1wb3J0aW5nIikKQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KU2lnbmVkLW9mZi1i
eTogTm9yYWxmIFRyw7hubmVzIDxub3JhbGZAdHJvbm5lcy5vcmc+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgfCA3ICsrKystLS0KIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9zaG1l
bV9oZWxwZXIuYwppbmRleCA5ODI1YzM3OGRmYTYuLmM4YTY1NDdhMTc1NyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2RybV9nZW1fc2htZW1faGVscGVyLmMKQEAgLTM1NywxMyArMzU3LDE0IEBAIHN0YXRpYyB2
b2lkIGRybV9nZW1fc2htZW1fdnVubWFwX2xvY2tlZChzdHJ1Y3QgZHJtX2dlbV9zaG1lbV9vYmpl
Y3QgKnNobWVtLAogCWlmICgtLXNobWVtLT52bWFwX3VzZV9jb3VudCA+IDApCiAJCXJldHVybjsK
IAotCWlmIChvYmotPmltcG9ydF9hdHRhY2gpCisJaWYgKG9iai0+aW1wb3J0X2F0dGFjaCkgewog
CQlkbWFfYnVmX3Z1bm1hcChvYmotPmltcG9ydF9hdHRhY2gtPmRtYWJ1ZiwgbWFwKTsKLQllbHNl
CisJfSBlbHNlIHsKIAkJdnVubWFwKHNobWVtLT52YWRkcik7CisJCWRybV9nZW1fc2htZW1fcHV0
X3BhZ2VzKHNobWVtKTsKKwl9CiAKIAlzaG1lbS0+dmFkZHIgPSBOVUxMOwotCWRybV9nZW1fc2ht
ZW1fcHV0X3BhZ2VzKHNobWVtKTsKIH0KIAogLyoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
