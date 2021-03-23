Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD3A3463EA
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:58:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0E6A6E0D8;
	Tue, 23 Mar 2021 15:57:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CB236EC1F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:45 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 12/70] drm/i915: No longer allow exporting userptr through
 dma-buf
Date: Tue, 23 Mar 2021 16:50:01 +0100
Message-Id: <20210323155059.628690-13-maarten.lankhorst@linux.intel.com>
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
 Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIGV4cG9ydCBhIG1lbW9yeSBhZGRyZXNzLCB3ZSB3aWxs
IHByZXZlbnQKYWxsb3dpbmcgYWNjZXNzIHRoaXMgd2F5IHRvIGRpZmZlcmVudCBhZGRyZXNzIHNw
YWNlcyB3aGVuIHdlCnJld29yayB1c2VycHRyIGhhbmRsaW5nLCBzbyBiZXN0IHRvIGV4cGxpY2l0
bHkgZGlzYWJsZSBpdC4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVu
Lmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2
bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+CkFja2VkLWJ5OiBKYXNvbiBFa3N0
cmFuZCA8amFzb25Aamxla3N0cmFuZC5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L2k5MTVfZ2VtX3VzZXJwdHIuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUv
Z2VtL2k5MTVfZ2VtX3VzZXJwdHIuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV91c2VycHRyLmMKaW5kZXggNWExOTY5OWMyZDdlLi4wYzMwY2E1MmRlZTMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX3VzZXJwdHIuYwpAQCAtNjk0LDEwICs2OTQsOSBA
QCBpOTE1X2dlbV91c2VycHRyX3JlbGVhc2Uoc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9i
aikKIHN0YXRpYyBpbnQKIGk5MTVfZ2VtX3VzZXJwdHJfZG1hYnVmX2V4cG9ydChzdHJ1Y3QgZHJt
X2k5MTVfZ2VtX29iamVjdCAqb2JqKQogewotCWlmIChvYmotPnVzZXJwdHIubW11X29iamVjdCkK
LQkJcmV0dXJuIDA7CisJZHJtX2RiZyhvYmotPmJhc2UuZGV2LCAiRXhwb3J0aW5nIHVzZXJwdHIg
bm8gbG9uZ2VyIGFsbG93ZWRcbiIpOwogCi0JcmV0dXJuIGk5MTVfZ2VtX3VzZXJwdHJfaW5pdF9f
bW11X25vdGlmaWVyKG9iaiwgMCk7CisJcmV0dXJuIC1FSU5WQUw7CiB9CiAKIHN0YXRpYyBpbnQK
LS0gCjIuMzEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
Cg==
