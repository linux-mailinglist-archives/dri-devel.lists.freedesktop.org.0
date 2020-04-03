Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC83719DF9D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7FAE6EC7F;
	Fri,  3 Apr 2020 20:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 982B16EC87;
 Fri,  3 Apr 2020 20:40:52 +0000 (UTC)
IronPort-SDR: NxNYl2BcxIVQftcYF4FYpdijSIaSEDrydWMHx+fm/+p5NR9QLOwmObpk9FIFsRqIDnYsJRWrm3
 vNkRJ+apWAEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 13:40:52 -0700
IronPort-SDR: nwpIlFRjDjDnMsJMnL3wTL3InqGhOCc0aAdA+NB2ql6vJN9rohvM7YfJ23xfMR73AUo8jXW41b
 dA28t3OYAlrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; d="scan'208";a="296089844"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 03 Apr 2020 13:40:49 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Apr 2020 23:40:48 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/17] drm: Flatten drm_mode_vrefresh()
Date: Fri,  3 Apr 2020 23:40:00 +0300
Message-Id: <20200403204008.14864-10-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
bW92ZSB0aGUgcG9pbnRsZXNzIHdob2xlLWZ1bmN0aW9uIGluZGVudGF0aW9uLiBBbHNvIGRvbid0
Cm5lZWQgdG8gd29ycnkgYWJvdXQgbmVnYXRpdmUgdmFsdWVzIGFueW1vcmUgc2luY2Ugd2Ugc3dp
dGNoZWQKZXZlcnl0aGluZyB0byB1MTYuCgpSZXZpZXdlZC1ieTogRW1pbCBWZWxpa292IDxlbWls
LnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2
aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX21v
ZGVzLmMgfCAyNiArKysrKysrKysrKystLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKyksIDE0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fbW9kZXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwppbmRleCA3N2Q2
ODEyMDkzMWEuLmYyODY1Zjg4YmQ1NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9t
b2Rlcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYwpAQCAtNzU3LDI0ICs3NTcs
MjIgQEAgRVhQT1JUX1NZTUJPTChkcm1fbW9kZV9zZXRfbmFtZSk7CiAgKi8KIGludCBkcm1fbW9k
ZV92cmVmcmVzaChjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqbW9kZSkKIHsKLQlpbnQg
cmVmcmVzaCA9IDA7CisJdW5zaWduZWQgaW50IG51bSwgZGVuOwogCi0JaWYgKG1vZGUtPmh0b3Rh
bCA+IDAgJiYgbW9kZS0+dnRvdGFsID4gMCkgewotCQl1bnNpZ25lZCBpbnQgbnVtLCBkZW47CisJ
aWYgKG1vZGUtPmh0b3RhbCA9PSAwIHx8IG1vZGUtPnZ0b3RhbCA9PSAwKQorCQlyZXR1cm4gMDsK
IAotCQludW0gPSBtb2RlLT5jbG9jayAqIDEwMDA7Ci0JCWRlbiA9IG1vZGUtPmh0b3RhbCAqIG1v
ZGUtPnZ0b3RhbDsKKwludW0gPSBtb2RlLT5jbG9jayAqIDEwMDA7CisJZGVuID0gbW9kZS0+aHRv
dGFsICogbW9kZS0+dnRvdGFsOwogCi0JCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdf
SU5URVJMQUNFKQotCQkJbnVtICo9IDI7Ci0JCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZM
QUdfREJMU0NBTikKLQkJCWRlbiAqPSAyOwotCQlpZiAobW9kZS0+dnNjYW4gPiAxKQotCQkJZGVu
ICo9IG1vZGUtPnZzY2FuOworCWlmIChtb2RlLT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfSU5URVJM
QUNFKQorCQludW0gKj0gMjsKKwlpZiAobW9kZS0+ZmxhZ3MgJiBEUk1fTU9ERV9GTEFHX0RCTFND
QU4pCisJCWRlbiAqPSAyOworCWlmIChtb2RlLT52c2NhbiA+IDEpCisJCWRlbiAqPSBtb2RlLT52
c2NhbjsKIAotCQlyZWZyZXNoID0gRElWX1JPVU5EX0NMT1NFU1QobnVtLCBkZW4pOwotCX0KLQly
ZXR1cm4gcmVmcmVzaDsKKwlyZXR1cm4gRElWX1JPVU5EX0NMT1NFU1QobnVtLCBkZW4pOwogfQog
RVhQT1JUX1NZTUJPTChkcm1fbW9kZV92cmVmcmVzaCk7CiAKLS0gCjIuMjQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
