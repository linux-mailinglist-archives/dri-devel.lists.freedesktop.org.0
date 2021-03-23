Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 312583463F1
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:58:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CCF6EC08;
	Tue, 23 Mar 2021 15:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E97826EC0A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:43 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 38/70] drm/i915: Add missing ww lock in intel_dsb_prepare.
Date: Tue, 23 Mar 2021 16:50:27 +0100
Message-Id: <20210323155059.628690-39-maarten.lankhorst@linux.intel.com>
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

QmVjYXVzZSBvZiB0aGUgbG9uZyBsaWZldGltZSBvZiB0aGUgbWFwcGluZywgd2UgY2Fubm90IHdy
YXAgdGhpcyBpbiBhCnNpbXBsZSBsaW1pdGVkIHd3IGxvY2suIEp1c3QgdXNlIHRoZSB1bmxvY2tl
ZCB2ZXJzaW9uIG9mIHBpbl9tYXAsCmJlY2F1c2Ugd2UnbGwgbGlrZWx5IHJlbGVhc2UgdGhlIG1h
cHBpbmcgYSBsb3QgbGF0ZXIsIGluIGEgZGlmZmVyZW50CnRocmVhZC4KClNpZ25lZC1vZmYtYnk6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+ClJl
dmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kc2IuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNiLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RzYi5jCmluZGV4IDU2NmZhNzI0MjdiMy4uODU3
MTI2ODIyYTg4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2RzYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHNiLmMKQEAg
LTI5Myw3ICsyOTMsNyBAQCB2b2lkIGludGVsX2RzYl9wcmVwYXJlKHN0cnVjdCBpbnRlbF9jcnRj
X3N0YXRlICpjcnRjX3N0YXRlKQogCQlnb3RvIG91dDsKIAl9CiAKLQlidWYgPSBpOTE1X2dlbV9v
YmplY3RfcGluX21hcCh2bWEtPm9iaiwgSTkxNV9NQVBfV0MpOworCWJ1ZiA9IGk5MTVfZ2VtX29i
amVjdF9waW5fbWFwX3VubG9ja2VkKHZtYS0+b2JqLCBJOTE1X01BUF9XQyk7CiAJaWYgKElTX0VS
UihidWYpKSB7CiAJCWRybV9lcnIoJmk5MTUtPmRybSwgIkNvbW1hbmQgYnVmZmVyIGNyZWF0aW9u
IGZhaWxlZFxuIik7CiAJCWk5MTVfdm1hX3VucGluX2FuZF9yZWxlYXNlKCZ2bWEsIEk5MTVfVk1B
X1JFTEVBU0VfTUFQKTsKLS0gCjIuMzEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
