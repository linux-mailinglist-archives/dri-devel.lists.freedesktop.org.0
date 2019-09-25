Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA29BDF81
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 15:55:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B77356EBB3;
	Wed, 25 Sep 2019 13:55:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6E076EBC2
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 13:55:20 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Sep 2019 06:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,548,1559545200"; d="scan'208";a="179820406"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 25 Sep 2019 06:55:17 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 25 Sep 2019 16:55:16 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/4] drm/edid: Make sure the CEA mode arrays have the
 correct amount of modes
Date: Wed, 25 Sep 2019 16:55:02 +0300
Message-Id: <20190925135502.24055-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190925135502.24055-1-ville.syrjala@linux.intel.com>
References: <20190925135502.24055-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
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
Cc: intel-gfc@freedesktop.org, Hans Verkuil <hansverk@cisco.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGRlcGVuZCBvbiBhIHNwZWNpZmljIHJlbGF0aW9uc2hpcCBiZXR3ZWVuIHRoZSBWSUMgbnVtYmVy
IGFuZCB0aGUKaW5kZXggaW4gdGhlIENFQSBtb2RlIGFycmF5cy4gQXNzZXJ0IHRoYXQgdGhlIGFy
cmF5cyBoYXZlIHRoZSBleGNwZWN0ZWQKc2l6ZSB0byBtYWtlIHN1cmUgd2UndmUgbm90IGFjY2lk
ZW50YWxseSBsZWZ0IGhvbGVzIGluIHRoZW0uCgp2MjogUGltcCB0aGUgQlVJTERfQlVHX09OKClz
CgpDYzogSGFucyBWZXJrdWlsIDxoYW5zdmVya0BjaXNjby5jb20+CkNjOiBTaGFzaGFuayBTaGFy
bWEgPHNoYXNoYW5rLnNoYXJtYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2RybV9lZGlkLmMgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2Ry
bV9lZGlkLmMKaW5kZXggMDAwNzAwNGQzMjIxLi4wNmNhYzhlMmFmYzIgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5j
CkBAIC0zMjA5LDYgKzMyMDksOSBAQCBzdGF0aWMgdTggKmRybV9maW5kX2NlYV9leHRlbnNpb24o
Y29uc3Qgc3RydWN0IGVkaWQgKmVkaWQpCiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Rpc3Bs
YXlfbW9kZSAqY2VhX21vZGVfZm9yX3ZpYyh1OCB2aWMpCiB7CisJQlVJTERfQlVHX09OKDEgKyBB
UlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzEpIC0gMSAhPSAxMjcpOworCUJVSUxEX0JVR19PTigx
OTMgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzE5MykgLSAxICE9IDIxOSk7CisKIAlpZiAo
dmljID49IDEgJiYgdmljIDwgMSArIEFSUkFZX1NJWkUoZWRpZF9jZWFfbW9kZXNfMSkpCiAJCXJl
dHVybiAmZWRpZF9jZWFfbW9kZXNfMVt2aWMgLSAxXTsKIAlpZiAodmljID49IDE5MyAmJiB2aWMg
PCAxOTMgKyBBUlJBWV9TSVpFKGVkaWRfY2VhX21vZGVzXzE5MykpCi0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
