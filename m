Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C0AD372901
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 12:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 563A16EAC2;
	Tue,  4 May 2021 10:27:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCFF06EAC2;
 Tue,  4 May 2021 10:27:45 +0000 (UTC)
IronPort-SDR: 0Dg+JCJaCD5RAjYSCxPVHrqzT2++G6Y+GWW4CjtnenF1veXYOPR7EyI18u7880SGyoop0quc6g
 0fagjVyWxeUA==
X-IronPort-AV: E=McAfee;i="6200,9189,9973"; a="195894462"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="195894462"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 03:27:45 -0700
IronPort-SDR: kn8MzPP//AJUiqcHtD3CHnd8VPyPdGYMsS+an6D6Opf5RcZ9SDf05SKE4um7/AK9FMCQBN5GaM
 wCXmmgXR1n2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="389919052"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 04 May 2021 03:27:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 04 May 2021 13:27:42 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Use drm_mode_is_420_only() instead of open coding it
Date: Tue,  4 May 2021 13:27:42 +0300
Message-Id: <20210504102742.7005-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: intel-gfx@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
cGxhY2UgdGhlIG9wZW4gY29kZWQgZHJtX21vZGVfaXNfNDIwX29ubHkoKSB3aXRoIHRoZSByZWFs
IHRoaW5nLgoKTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLgoKQ2M6IFdlcm5lciBTZW1iYWNoIDx3c2VA
dHV4ZWRvY29tcHV0ZXJzLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVz
LmMgfCAxMyArKysrLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA5
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwppbmRleCAzM2E5M2ZhMjRlYjEuLjEyZmNiYjdj
ZTE3OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fbW9kZXMuYwpAQCAtMTE3NiwxNiArMTE3NiwxMSBAQCBlbnVtIGRybV9t
b2RlX3N0YXR1cwogZHJtX21vZGVfdmFsaWRhdGVfeWNiY3I0MjAoY29uc3Qgc3RydWN0IGRybV9k
aXNwbGF5X21vZGUgKm1vZGUsCiAJCQkgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
KQogewotCXU4IHZpYyA9IGRybV9tYXRjaF9jZWFfbW9kZShtb2RlKTsKLQllbnVtIGRybV9tb2Rl
X3N0YXR1cyBzdGF0dXMgPSBNT0RFX09LOwotCXN0cnVjdCBkcm1faGRtaV9pbmZvICpoZG1pID0g
JmNvbm5lY3Rvci0+ZGlzcGxheV9pbmZvLmhkbWk7Ci0KLQlpZiAodGVzdF9iaXQodmljLCBoZG1p
LT55NDIwX3ZkYl9tb2RlcykpIHsKLQkJaWYgKCFjb25uZWN0b3ItPnljYmNyXzQyMF9hbGxvd2Vk
KQotCQkJc3RhdHVzID0gTU9ERV9OT180MjA7Ci0JfQorCWlmICghY29ubmVjdG9yLT55Y2Jjcl80
MjBfYWxsb3dlZCAmJgorCSAgICBkcm1fbW9kZV9pc180MjBfb25seSgmY29ubmVjdG9yLT5kaXNw
bGF5X2luZm8sIG1vZGUpKQorCQlyZXR1cm4gTU9ERV9OT180MjA7CiAKLQlyZXR1cm4gc3RhdHVz
OworCXJldHVybiBNT0RFX09LOwogfQogRVhQT1JUX1NZTUJPTChkcm1fbW9kZV92YWxpZGF0ZV95
Y2JjcjQyMCk7CiAKLS0gCjIuMjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCg==
