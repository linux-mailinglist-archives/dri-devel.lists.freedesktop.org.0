Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4386346409
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4521A6EC35;
	Tue, 23 Mar 2021 15:58:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5AE06EC2A
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:45 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 54/70] drm/i915/selftests: Prepare mocs tests for
 obj->mm.lock removal
Date: Tue, 23 Mar 2021 16:50:43 +0100
Message-Id: <20210323155059.628690-55-maarten.lankhorst@linux.intel.com>
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

VXNlIHBpbl9tYXBfdW5sb2NrZWQgd2hlbiB3ZSdyZSBub3QgaG9sZGluZyBsb2Nrcy4KClNpZ25l
ZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBs
aW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfbW9j
cy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfbW9jcy5jIGIv
ZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfbW9jcy5jCmluZGV4IDAxZGQwNTBkNDE2
MS4uZTU1YTg4N2QxMWUyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9ndC9zZWxm
dGVzdF9tb2NzLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ3Qvc2VsZnRlc3RfbW9jcy5j
CkBAIC03OSw3ICs3OSw3IEBAIHN0YXRpYyBpbnQgbGl2ZV9tb2NzX2luaXQoc3RydWN0IGxpdmVf
bW9jcyAqYXJnLCBzdHJ1Y3QgaW50ZWxfZ3QgKmd0KQogCWlmIChJU19FUlIoYXJnLT5zY3JhdGNo
KSkKIAkJcmV0dXJuIFBUUl9FUlIoYXJnLT5zY3JhdGNoKTsKIAotCWFyZy0+dmFkZHIgPSBpOTE1
X2dlbV9vYmplY3RfcGluX21hcChhcmctPnNjcmF0Y2gtPm9iaiwgSTkxNV9NQVBfV0IpOworCWFy
Zy0+dmFkZHIgPSBpOTE1X2dlbV9vYmplY3RfcGluX21hcF91bmxvY2tlZChhcmctPnNjcmF0Y2gt
Pm9iaiwgSTkxNV9NQVBfV0IpOwogCWlmIChJU19FUlIoYXJnLT52YWRkcikpIHsKIAkJZXJyID0g
UFRSX0VSUihhcmctPnZhZGRyKTsKIAkJZ290byBlcnJfc2NyYXRjaDsKLS0gCjIuMzEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
