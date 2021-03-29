Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4013434D166
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 15:38:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74B1A6E419;
	Mon, 29 Mar 2021 13:37:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C764A6E419;
 Mon, 29 Mar 2021 13:37:57 +0000 (UTC)
IronPort-SDR: 4yHfqgmyk8ESSW+cXgnaLPyux+U1JsdMLcqCwD6Ugz3dQsecMR6s706JwtL0dbYdaqgENFeFI0
 nhdWyN5EiNNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9938"; a="188283110"
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="188283110"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:37:57 -0700
IronPort-SDR: QUCGKGgm4hBV9t/JQ793RScxPdeKXWar/xjeN68+vYQr4+G/jTxmBTGpdJ5jMfTQblrDKzy6Yh
 j2QFN3GOAD+w==
X-IronPort-AV: E=Sophos;i="5.81,287,1610438400"; d="scan'208";a="444589323"
Received: from auchter-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.56.199])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2021 06:37:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/edid: use the new displayid iterator for finding
 CEA extension
Date: Mon, 29 Mar 2021 16:37:19 +0300
Message-Id: <e50f876cecbfee369da887ad19350eee0d89b87f.1617024940.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617024940.git.jani.nikula@intel.com>
References: <cover.1617024940.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmVhdGx5IHJlZHVjZSBkaXNwbGF5aWQgYm9pbGVycGxhdGUgaW4gY29kZS4gTm8gZnVuY3Rpb25h
bCBjaGFuZ2VzLgoKUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBs
aW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBp
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgfCAyNSArKysrKysrKyst
LS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCAxNiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZWRpZC5jCmluZGV4IGZiYWE3ZDY3OWNiMi4uNDUyNmUyNTU3ZGNhIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2VkaWQuYwpAQCAtMzI2NiwzNSArMzI2NiwyOCBAQCBjb25zdCB1OCAqZHJtX2ZpbmRf
ZWRpZF9leHRlbnNpb24oY29uc3Qgc3RydWN0IGVkaWQgKmVkaWQsCiAKIHN0YXRpYyBjb25zdCB1
OCAqZHJtX2ZpbmRfY2VhX2V4dGVuc2lvbihjb25zdCBzdHJ1Y3QgZWRpZCAqZWRpZCkKIHsKLQlp
bnQgbGVuZ3RoLCBpZHg7CiAJY29uc3Qgc3RydWN0IGRpc3BsYXlpZF9ibG9jayAqYmxvY2s7CisJ
c3RydWN0IGRpc3BsYXlpZF9pdGVyIGl0ZXI7CiAJY29uc3QgdTggKmNlYTsKLQljb25zdCB1OCAq
ZGlzcGxheWlkOwotCWludCBleHRfaW5kZXg7CisJaW50IGV4dF9pbmRleCA9IDA7CiAKIAkvKiBM
b29rIGZvciBhIHRvcCBsZXZlbCBDRUEgZXh0ZW5zaW9uIGJsb2NrICovCiAJLyogRklYTUU6IG1h
a2UgY2FsbGVycyBpdGVyYXRlIHRocm91Z2ggbXVsdGlwbGUgQ0VBIGV4dCBibG9ja3M/ICovCi0J
ZXh0X2luZGV4ID0gMDsKIAljZWEgPSBkcm1fZmluZF9lZGlkX2V4dGVuc2lvbihlZGlkLCBDRUFf
RVhULCAmZXh0X2luZGV4KTsKIAlpZiAoY2VhKQogCQlyZXR1cm4gY2VhOwogCiAJLyogQ0VBIGJs
b2NrcyBjYW4gYWxzbyBiZSBmb3VuZCBlbWJlZGRlZCBpbiBhIERpc3BsYXlJRCBibG9jayAqLwot
CWV4dF9pbmRleCA9IDA7Ci0JZm9yICg7OykgewotCQlkaXNwbGF5aWQgPSBkcm1fZmluZF9kaXNw
bGF5aWRfZXh0ZW5zaW9uKGVkaWQsICZsZW5ndGgsICZpZHgsCi0JCQkJCQkJICZleHRfaW5kZXgp
OwotCQlpZiAoIWRpc3BsYXlpZCkKLQkJCXJldHVybiBOVUxMOwotCi0JCWlkeCArPSBzaXplb2Yo
c3RydWN0IGRpc3BsYXlpZF9oZHIpOwotCQlmb3JfZWFjaF9kaXNwbGF5aWRfZGIoZGlzcGxheWlk
LCBibG9jaywgaWR4LCBsZW5ndGgpIHsKLQkJCWlmIChibG9jay0+dGFnID09IERBVEFfQkxPQ0tf
Q1RBKQotCQkJCXJldHVybiAoY29uc3QgdTggKilibG9jazsKKwlkaXNwbGF5aWRfaXRlcl9lZGlk
X2JlZ2luKGVkaWQsICZpdGVyKTsKKwlkaXNwbGF5aWRfaXRlcl9mb3JfZWFjaChibG9jaywgJml0
ZXIpIHsKKwkJaWYgKGJsb2NrLT50YWcgPT0gREFUQV9CTE9DS19DVEEpIHsKKwkJCWNlYSA9IChj
b25zdCB1OCAqKWJsb2NrOworCQkJYnJlYWs7CiAJCX0KIAl9CisJZGlzcGxheWlkX2l0ZXJfZW5k
KCZpdGVyKTsKIAotCXJldHVybiBOVUxMOworCXJldHVybiBjZWE7CiB9CiAKIHN0YXRpYyBfX2Fs
d2F5c19pbmxpbmUgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmNlYV9tb2RlX2Zvcl92
aWModTggdmljKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
