Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECA42C6494
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C06036EC5E;
	Fri, 27 Nov 2020 12:08:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A536EBA2;
 Fri, 27 Nov 2020 12:08:34 +0000 (UTC)
IronPort-SDR: 9UfuXbzspxDSCscicBXI9LQf7b6wM+TgO+OC4hJJaIjEg6+MQBkq9x9pV6o7yXVm9JRg4ZGkjc
 KYKb8ZNp6Jag==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="168883468"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="168883468"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:34 -0800
IronPort-SDR: 9+4EkRHLlPC7zB86cti1LDfVYuQSY46OsTIwWlWrsy/3bQ9mjfgCuUZxT6A+lCBEkf9H8nu6Wl
 2HBUQ2oAkFtg==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548028752"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:08:32 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 037/162] drm/i915: Take obj lock around set_domain ioctl
Date: Fri, 27 Nov 2020 12:05:13 +0000
Message-Id: <20201127120718.454037-38-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNv
bT4KCldlIG5lZWQgdG8gbG9jayB0aGUgb2JqZWN0IHRvIG1vdmUgaXQgdG8gdGhlIGNvcnJlY3Qg
ZG9tYWluLAphZGQgdGhlIG1pc3NpbmcgbG9jay4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFu
a2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgSGVs
bHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2RvbWFpbi5jIHwgMTggKysrKysrKysrKy0tLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG9tYWluLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG9tYWluLmMKaW5kZXggNTFhMzNjNGY2MWQw
Li5lNjJmOWU4ZGQzMzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9pOTE1
X2dlbV9kb21haW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9nZW1fZG9t
YWluLmMKQEAgLTUxNiw2ICs1MTYsMTAgQEAgaTkxNV9nZW1fc2V0X2RvbWFpbl9pb2N0bChzdHJ1
Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCQlnb3RvIG91dDsKIAl9CiAKKwllcnIg
PSBpOTE1X2dlbV9vYmplY3RfbG9ja19pbnRlcnJ1cHRpYmxlKG9iaiwgTlVMTCk7CisJaWYgKGVy
cikKKwkJZ290byBvdXQ7CisKIAkvKgogCSAqIEZsdXNoIGFuZCBhY3F1aXJlIG9iai0+cGFnZXMg
c28gdGhhdCB3ZSBhcmUgY29oZXJlbnQgdGhyb3VnaAogCSAqIGRpcmVjdCBhY2Nlc3MgaW4gbWVt
b3J5IHdpdGggcHJldmlvdXMgY2FjaGVkIHdyaXRlcyB0aHJvdWdoCkBAIC01MjcsNyArNTMxLDcg
QEAgaTkxNV9nZW1fc2V0X2RvbWFpbl9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lk
ICpkYXRhLAogCSAqLwogCWVyciA9IGk5MTVfZ2VtX29iamVjdF9waW5fcGFnZXMob2JqKTsKIAlp
ZiAoZXJyKQotCQlnb3RvIG91dDsKKwkJZ290byBvdXRfdW5sb2NrOwogCiAJLyoKIAkgKiBBbHJl
YWR5IGluIHRoZSBkZXNpcmVkIHdyaXRlIGRvbWFpbj8gTm90aGluZyBmb3IgdXMgdG8gZG8hCkBA
IC01NDIsMTAgKzU0Niw2IEBAIGk5MTVfZ2VtX3NldF9kb21haW5faW9jdGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlpZiAoUkVBRF9PTkNFKG9iai0+d3JpdGVfZG9tYWlu
KSA9PSByZWFkX2RvbWFpbnMpCiAJCWdvdG8gb3V0X3VucGluOwogCi0JZXJyID0gaTkxNV9nZW1f
b2JqZWN0X2xvY2tfaW50ZXJydXB0aWJsZShvYmosIE5VTEwpOwotCWlmIChlcnIpCi0JCWdvdG8g
b3V0X3VucGluOwotCiAJaWYgKHJlYWRfZG9tYWlucyAmIEk5MTVfR0VNX0RPTUFJTl9XQykKIAkJ
ZXJyID0gaTkxNV9nZW1fb2JqZWN0X3NldF90b193Y19kb21haW4ob2JqLCB3cml0ZV9kb21haW4p
OwogCWVsc2UgaWYgKHJlYWRfZG9tYWlucyAmIEk5MTVfR0VNX0RPTUFJTl9HVFQpCkBAIC01NTYs
MTMgKzU1NiwxNSBAQCBpOTE1X2dlbV9zZXRfZG9tYWluX2lvY3RsKHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHZvaWQgKmRhdGEsCiAJLyogQW5kIGJ1bXAgdGhlIExSVSBmb3IgdGhpcyBhY2Nlc3Mg
Ki8KIAlpOTE1X2dlbV9vYmplY3RfYnVtcF9pbmFjdGl2ZV9nZ3R0KG9iaik7CiAKK291dF91bnBp
bjoKKwlpOTE1X2dlbV9vYmplY3RfdW5waW5fcGFnZXMob2JqKTsKKworb3V0X3VubG9jazoKIAlp
OTE1X2dlbV9vYmplY3RfdW5sb2NrKG9iaik7CiAKLQlpZiAod3JpdGVfZG9tYWluKQorCWlmICgh
ZXJyICYmIHdyaXRlX2RvbWFpbikKIAkJaTkxNV9nZW1fb2JqZWN0X2ludmFsaWRhdGVfZnJvbnRi
dWZmZXIob2JqLCBPUklHSU5fQ1BVKTsKIAotb3V0X3VucGluOgotCWk5MTVfZ2VtX29iamVjdF91
bnBpbl9wYWdlcyhvYmopOwogb3V0OgogCWk5MTVfZ2VtX29iamVjdF9wdXQob2JqKTsKIAlyZXR1
cm4gZXJyOwotLSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
