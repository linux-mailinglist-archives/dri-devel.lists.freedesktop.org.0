Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64108B1CA3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA2766EF3B;
	Fri, 13 Sep 2019 11:52:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 702AF6EF39;
 Fri, 13 Sep 2019 11:52:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:49 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="190282870"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 8/9] drm/amdgpu: use drm_debug_enabled() to check for debug
 categories
Date: Fri, 13 Sep 2019 14:51:45 +0300
Message-Id: <6ba0f21e48118bebd88eb7ba24b5b68b0be49f63.1568375189.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568375189.git.jani.nikula@intel.com>
References: <cover.1568375189.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgYmV0dGVyIGFic3RyYWN0aW9uIG9mIHRoZSBkcm1fZGVidWcgZ2xvYmFsIHZhcmlhYmxl
IGluIHRoZQpmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCkNjOiBBbGV4IERldWNoZXIg
PGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+CkNjOiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+CkNjOiBEYXZpZCAoQ2h1bk1pbmcpIFpob3UgPERhdmlkMS5aaG91
QGFtZC5jb20+CkNjOiBhbWQtZ2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5
OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9zbXVfdjExXzBfaTJjLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9zbXVfdjExXzBfaTJjLmMKaW5kZXggNGE1OTUxMDM2OTI3Li41ZjE3YmQ0ODk5ZTIgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L3NtdV92MTFfMF9pMmMuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9zbXVfdjExXzBfaTJjLmMKQEAgLTIzNCw3ICsyMzQs
NyBAQCBzdGF0aWMgdWludDMyX3Qgc211X3YxMV8wX2kyY190cmFuc21pdChzdHJ1Y3QgaTJjX2Fk
YXB0ZXIgKmNvbnRyb2wsCiAJRFJNX0RFQlVHX0RSSVZFUigiSTJDX1RyYW5zbWl0KCksIGFkZHJl
c3MgPSAleCwgYnl0ZXMgPSAlZCAsIGRhdGE6ICIsCiAJCSAodWludDE2X3QpYWRkcmVzcywgbnVt
Ynl0ZXMpOwogCi0JaWYgKGRybV9kZWJ1ZyAmIERSTV9VVF9EUklWRVIpIHsKKwlpZiAoZHJtX2Rl
YnVnX2VuYWJsZWQoRFJNX1VUX0RSSVZFUikpIHsKIAkJcHJpbnRfaGV4X2R1bXAoS0VSTl9JTkZP
LCAiZGF0YTogIiwgRFVNUF9QUkVGSVhfTk9ORSwKIAkJCSAgICAgICAxNiwgMSwgZGF0YSwgbnVt
Ynl0ZXMsIGZhbHNlKTsKIAl9CkBAIC0zODgsNyArMzg4LDcgQEAgc3RhdGljIHVpbnQzMl90IHNt
dV92MTFfMF9pMmNfcmVjZWl2ZShzdHJ1Y3QgaTJjX2FkYXB0ZXIgKmNvbnRyb2wsCiAJRFJNX0RF
QlVHX0RSSVZFUigiSTJDX1JlY2VpdmUoKSwgYWRkcmVzcyA9ICV4LCBieXRlcyA9ICVkLCBkYXRh
IDoiLAogCQkgICh1aW50MTZfdClhZGRyZXNzLCBieXRlc19yZWNlaXZlZCk7CiAKLQlpZiAoZHJt
X2RlYnVnICYgRFJNX1VUX0RSSVZFUikgeworCWlmIChkcm1fZGVidWdfZW5hYmxlZChEUk1fVVRf
RFJJVkVSKSkgewogCQlwcmludF9oZXhfZHVtcChLRVJOX0lORk8sICJkYXRhOiAiLCBEVU1QX1BS
RUZJWF9OT05FLAogCQkJICAgICAgIDE2LCAxLCBkYXRhLCBieXRlc19yZWNlaXZlZCwgZmFsc2Up
OwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
