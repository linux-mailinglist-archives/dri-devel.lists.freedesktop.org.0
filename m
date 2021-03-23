Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2414F346420
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12A7E6EC4E;
	Tue, 23 Mar 2021 15:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B72836EC27
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:46 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 62/70] drm/i915: Keep userpointer bindings if seqcount is
 unchanged, v2.
Date: Tue, 23 Mar 2021 16:50:51 +0100
Message-Id: <20210323155059.628690-63-maarten.lankhorst@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>, kernel test robot <lkp@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW5zdGVhZCBvZiBmb3JjZSB1bmJpbmRpbmcgYW5kIHJlYmluZGluZyBldmVyeSB0aW1lLCB3ZSB0
cnkgdG8gY2hlY2sKaWYgb3VyIG5vdGlmaWVyIHNlcWNvdW50IGlzIHN0aWxsIGNvcnJlY3Qgd2hl
biBwYWdlcyBhcmUgYm91bmQuIFRoaXMKd2F5IHdlIG9ubHkgcmViaW5kIHVzZXJwdHIgd2hlbiB3
ZSBuZWVkIHRvLCBhbmQgcHJldmVudCBzdGFsbHMuCgpDaGFuZ2VzIHNpbmNlIHYxOgotIE1pc3Np
bmcgbXV0ZXhfdW5sb2NrLCByZXBvcnRlZCBieSBrYnVpbGQuCgpSZXBvcnRlZC1ieToga2VybmVs
IHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+ClJlcG9ydGVkLWJ5OiBEYW4gQ2FycGVudGVyIDxk
YW4uY2FycGVudGVyQG9yYWNsZS5jb20+ClJldmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8
dGhvbWFzLmhlbGxzdHJvbUBpbnRlbC5jb20+CgpTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMgfCAyNyArKysrKysrKysrKysrKysrKyst
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dlbV91c2VycHRyLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fdXNlcnB0ci5jCmluZGV4IDNiYWJlY2Qx
NGI0Ny4uMDliNDIxOWVhYjVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0v
aTkxNV9nZW1fdXNlcnB0ci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1X2dl
bV91c2VycHRyLmMKQEAgLTI4MSwxMiArMjgxLDMzIEBAIGludCBpOTE1X2dlbV9vYmplY3RfdXNl
cnB0cl9zdWJtaXRfaW5pdChzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqKQogCWlmIChy
ZXQpCiAJCXJldHVybiByZXQ7CiAKLQkvKiBNYWtlIHN1cmUgdXNlcnB0ciBpcyB1bmJvdW5kIGZv
ciBuZXh0IGF0dGVtcHQsIHNvIHdlIGRvbid0IHVzZSBzdGFsZSBwYWdlcy4gKi8KLQlyZXQgPSBp
OTE1X2dlbV9vYmplY3RfdXNlcnB0cl91bmJpbmQob2JqLCBmYWxzZSk7CisJLyogb3B0aW1pc3Rp
Y2FsbHkgdHJ5IHRvIHByZXNlcnZlIGN1cnJlbnQgcGFnZXMgd2hpbGUgdW5sb2NrZWQgKi8KKwlp
ZiAoaTkxNV9nZW1fb2JqZWN0X2hhc19wYWdlcyhvYmopICYmCisJICAgICFtbXVfaW50ZXJ2YWxf
Y2hlY2tfcmV0cnkoJm9iai0+dXNlcnB0ci5ub3RpZmllciwKKwkJCQkgICAgICBvYmotPnVzZXJw
dHIubm90aWZpZXJfc2VxKSkgeworCQlzcGluX2xvY2soJmk5MTUtPm1tLm5vdGlmaWVyX2xvY2sp
OworCQlpZiAob2JqLT51c2VycHRyLnB2ZWMgJiYKKwkJICAgICFtbXVfaW50ZXJ2YWxfcmVhZF9y
ZXRyeSgmb2JqLT51c2VycHRyLm5vdGlmaWVyLAorCQkJCQkgICAgIG9iai0+dXNlcnB0ci5ub3Rp
Zmllcl9zZXEpKSB7CisJCQlvYmotPnVzZXJwdHIucGFnZV9yZWYrKzsKKworCQkJLyogV2UgY2Fu
IGtlZXAgdXNpbmcgdGhlIGN1cnJlbnQgYmluZGluZywgdGhpcyBpcyB0aGUgZmFzdHBhdGggKi8K
KwkJCXJldCA9IDE7CisJCX0KKwkJc3Bpbl91bmxvY2soJmk5MTUtPm1tLm5vdGlmaWVyX2xvY2sp
OworCX0KKworCWlmICghcmV0KSB7CisJCS8qIE1ha2Ugc3VyZSB1c2VycHRyIGlzIHVuYm91bmQg
Zm9yIG5leHQgYXR0ZW1wdCwgc28gd2UgZG9uJ3QgdXNlIHN0YWxlIHBhZ2VzLiAqLworCQlyZXQg
PSBpOTE1X2dlbV9vYmplY3RfdXNlcnB0cl91bmJpbmQob2JqLCBmYWxzZSk7CisJfQogCWk5MTVf
Z2VtX29iamVjdF91bmxvY2sob2JqKTsKLQlpZiAocmV0KQorCWlmIChyZXQgPCAwKQogCQlyZXR1
cm4gcmV0OwogCisJaWYgKHJldCA+IDApCisJCXJldHVybiAwOworCiAJbm90aWZpZXJfc2VxID0g
bW11X2ludGVydmFsX3JlYWRfYmVnaW4oJm9iai0+dXNlcnB0ci5ub3RpZmllcik7CiAKIAlwdmVj
ID0ga3ZtYWxsb2NfYXJyYXkobnVtX3BhZ2VzLCBzaXplb2Yoc3RydWN0IHBhZ2UgKiksIEdGUF9L
RVJORUwpOwotLSAKMi4zMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
