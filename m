Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA0F29D04C
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 15:22:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169856E222;
	Mon, 26 Aug 2019 13:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B298D6E155;
 Mon, 26 Aug 2019 13:22:25 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 26 Aug 2019 06:22:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,433,1559545200"; d="scan'208";a="209363507"
Received: from ovasilev-desk1.fi.intel.com ([10.237.72.57])
 by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2019 06:22:24 -0700
From: Oleg Vasilev <oleg.vasilev@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 4/7] drm/i915: utilize subconnector property for DP
Date: Mon, 26 Aug 2019 16:22:13 +0300
Message-Id: <20190826132216.2823-5-oleg.vasilev@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190826132216.2823-1-oleg.vasilev@intel.com>
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgRFAtc3BlY2lmaWMgaW5mb3JtYXRpb24gaXMgc3RvcmVkIGluIGRyaXZlcidzIHN0cnVj
dHVyZXMsIGV2ZXJ5CmRyaXZlciBuZWVkcyB0byBpbXBsZW1lbnQgc3ViY29ubmVjdG9yIHByb3Bl
cnR5IGJ5IGl0c2VsZi4KCnYyOiB1cGRhdGVzIHRvIG1hdGNoIHByZXZpb3VzIGNvbW1pdCBjaGFu
Z2VzCgpSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNv
bT4KVGVzdGVkLWJ5OiBPbGVnIFZhc2lsZXYgPG9sZWcudmFzaWxldkBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KQ2M6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBpbnRlbC1nZnhA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcC5jIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKaW5kZXggNmRhNmE0ODU5ZjA2Li45
Yzk3ZWNlODAzZWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKQEAg
LTU0MzQsNiArNTQzNCwxMCBAQCBpbnRlbF9kcF9kZXRlY3Qoc3RydWN0IGRybV9jb25uZWN0b3Ig
KmNvbm5lY3RvciwKIAlpZiAoc3RhdHVzICE9IGNvbm5lY3Rvcl9zdGF0dXNfY29ubmVjdGVkICYm
ICFpbnRlbF9kcC0+aXNfbXN0KQogCQlpbnRlbF9kcF91bnNldF9lZGlkKGludGVsX2RwKTsKIAor
CWRybV9kcF9zZXRfc3ViY29ubmVjdG9yX3Byb3BlcnR5KGNvbm5lY3RvciwKKwkJCQkJIHN0YXR1
cywKKwkJCQkJIGludGVsX2RwLT5kcGNkLAorCQkJCQkgaW50ZWxfZHAtPmRvd25zdHJlYW1fcG9y
dHMpOwogCXJldHVybiBzdGF0dXM7CiB9CiAKQEAgLTYzMzIsNiArNjMzNiw4IEBAIGludGVsX2Rw
X2FkZF9wcm9wZXJ0aWVzKHN0cnVjdCBpbnRlbF9kcCAqaW50ZWxfZHAsIHN0cnVjdCBkcm1fY29u
bmVjdG9yICpjb25uZWN0CiAJc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9f
aTkxNShjb25uZWN0b3ItPmRldik7CiAJZW51bSBwb3J0IHBvcnQgPSBkcF90b19kaWdfcG9ydChp
bnRlbF9kcCktPmJhc2UucG9ydDsKIAorCWRybV9tb2RlX2FkZF9kcF9zdWJjb25uZWN0b3JfcHJv
cGVydHkoY29ubmVjdG9yKTsKKwogCWlmICghSVNfRzRYKGRldl9wcml2KSAmJiBwb3J0ICE9IFBP
UlRfQSkKIAkJaW50ZWxfYXR0YWNoX2ZvcmNlX2F1ZGlvX3Byb3BlcnR5KGNvbm5lY3Rvcik7CiAK
LS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
