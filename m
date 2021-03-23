Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8712D3463ED
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E5E56EBFD;
	Tue, 23 Mar 2021 15:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 355C06EC23
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:45 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 48/70] drm/i915/selftests: Prepare object tests for
 obj->mm.lock removal.
Date: Tue, 23 Mar 2021 16:50:37 +0100
Message-Id: <20210323155059.628690-49-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udmVydCBhIHNpbmdsZSBwaW5fcGFnZXMgY2FsbCB0byB1c2UgdGhlIHVubG9ja2VkIHZlcnNp
b24uCgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogVGhvbWFzIEhlbGxzdHLDtm0gPHRob21hcy5o
ZWxsc3Ryb21AbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9z
ZWxmdGVzdHMvaTkxNV9nZW1fb2JqZWN0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9nZW0vc2VsZnRlc3RzL2k5MTVfZ2VtX29iamVjdC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL3NlbGZ0ZXN0cy9pOTE1X2dlbV9vYmplY3QuYwppbmRleCBiZjg1M2M0MGVjNjUuLjc0MGVl
ODA4NmEyNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL3NlbGZ0ZXN0cy9p
OTE1X2dlbV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vc2VsZnRlc3Rz
L2k5MTVfZ2VtX29iamVjdC5jCkBAIC00Nyw3ICs0Nyw3IEBAIHN0YXRpYyBpbnQgaWd0X2dlbV9o
dWdlKHZvaWQgKmFyZykKIAlpZiAoSVNfRVJSKG9iaikpCiAJCXJldHVybiBQVFJfRVJSKG9iaik7
CiAKLQllcnIgPSBpOTE1X2dlbV9vYmplY3RfcGluX3BhZ2VzKG9iaik7CisJZXJyID0gaTkxNV9n
ZW1fb2JqZWN0X3Bpbl9wYWdlc191bmxvY2tlZChvYmopOwogCWlmIChlcnIpIHsKIAkJcHJfZXJy
KCJGYWlsZWQgdG8gYWxsb2NhdGUgJXUgcGFnZXMgKCVsdSB0b3RhbCksIGVycj0lZFxuIiwKIAkJ
ICAgICAgIG5yZWFsLCBvYmotPmJhc2Uuc2l6ZSAvIFBBR0VfU0laRSwgZXJyKTsKLS0gCjIuMzEu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
