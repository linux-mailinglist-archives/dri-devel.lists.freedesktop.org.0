Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD815097F
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2A996EC48;
	Mon,  3 Feb 2020 15:14:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D40AA6EC38;
 Mon,  3 Feb 2020 15:14:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 07:14:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="234702411"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 03 Feb 2020 07:14:45 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Feb 2020 17:14:44 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 20/26] drm/i915: Extract intel_hdmi_has_audio()
Date: Mon,  3 Feb 2020 17:13:37 +0200
Message-Id: <20200203151343.14378-21-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
References: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClB1
bGwgdGhlICJkbyB3ZSB3YW50IHRvIGVuYWJsZSBhdWRpbz8iIGNvbXB1dGF0aW9uIGludG8gYSBz
bWFsbCBoZWxwZXIKdG8gbWFrZSBpbnRlbF9oZG1pX2NvbXB1dGVfY29uZmlnKCkgbGVzcyBtZXNz
eS4gV2lsbCBtYWtlIGl0IGVhc2llciB0bwphZGQgbW9yZSBjaGVja3MgZm9yIHRoaXMgbGF0ZXIg
KGVnLiB3ZSBzaG91bGQgYWN0dWFsbHkgYmUgY2hlY2tpbmcKYXQgdGhlIGhibGFuayBpcyBsb25n
IGVub3VnaCBmb3IgYXVkaW8gdHJhbnNtaXNzaW9uKS4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgfCAyOCArKysrKysrKysrKysrKystLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1pLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwppbmRleCA1OTkxYTk5YzQzYTgu
LjMxZmVjMDA1MGY4ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9oZG1pLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZG1p
LmMKQEAgLTI0MDUsNiArMjQwNSwyMyBAQCBzdGF0aWMgYm9vbCBpbnRlbF9oZG1pX2xpbWl0ZWRf
Y29sb3JfcmFuZ2UoY29uc3Qgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKmNydGNfcwogCX0KIH0K
IAorc3RhdGljIGJvb2wgaW50ZWxfaGRtaV9oYXNfYXVkaW8oc3RydWN0IGludGVsX2VuY29kZXIg
KmVuY29kZXIsCisJCQkJIGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRl
LAorCQkJCSBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9zdGF0ZSAqY29ubl9zdGF0ZSkKK3sK
KwlzdHJ1Y3QgaW50ZWxfaGRtaSAqaW50ZWxfaGRtaSA9IGVuY190b19pbnRlbF9oZG1pKGVuY29k
ZXIpOworCWNvbnN0IHN0cnVjdCBpbnRlbF9kaWdpdGFsX2Nvbm5lY3Rvcl9zdGF0ZSAqaW50ZWxf
Y29ubl9zdGF0ZSA9CisJCXRvX2ludGVsX2RpZ2l0YWxfY29ubmVjdG9yX3N0YXRlKGNvbm5fc3Rh
dGUpOworCisJaWYgKCFjcnRjX3N0YXRlLT5oYXNfaGRtaV9zaW5rKQorCQlyZXR1cm4gZmFsc2U7
CisKKwlpZiAoaW50ZWxfY29ubl9zdGF0ZS0+Zm9yY2VfYXVkaW8gPT0gSERNSV9BVURJT19BVVRP
KQorCQlyZXR1cm4gaW50ZWxfaGRtaS0+aGFzX2F1ZGlvOworCWVsc2UKKwkJcmV0dXJuIGludGVs
X2Nvbm5fc3RhdGUtPmZvcmNlX2F1ZGlvID09IEhETUlfQVVESU9fT047Cit9CisKIGludCBpbnRl
bF9oZG1pX2NvbXB1dGVfY29uZmlnKHN0cnVjdCBpbnRlbF9lbmNvZGVyICplbmNvZGVyLAogCQkJ
ICAgICAgc3RydWN0IGludGVsX2NydGNfc3RhdGUgKnBpcGVfY29uZmlnLAogCQkJICAgICAgc3Ry
dWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpCkBAIC0yNDE0LDggKzI0MzEsNiBA
QCBpbnQgaW50ZWxfaGRtaV9jb21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5j
b2RlciwKIAlzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqYWRqdXN0ZWRfbW9kZSA9ICZwaXBlX2Nv
bmZpZy0+aHcuYWRqdXN0ZWRfbW9kZTsKIAlzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9y
ID0gY29ubl9zdGF0ZS0+Y29ubmVjdG9yOwogCXN0cnVjdCBkcm1fc2NkYyAqc2NkYyA9ICZjb25u
ZWN0b3ItPmRpc3BsYXlfaW5mby5oZG1pLnNjZGM7Ci0Jc3RydWN0IGludGVsX2RpZ2l0YWxfY29u
bmVjdG9yX3N0YXRlICppbnRlbF9jb25uX3N0YXRlID0KLQkJdG9faW50ZWxfZGlnaXRhbF9jb25u
ZWN0b3Jfc3RhdGUoY29ubl9zdGF0ZSk7CiAJaW50IHJldDsKIAogCWlmIChhZGp1c3RlZF9tb2Rl
LT5mbGFncyAmIERSTV9NT0RFX0ZMQUdfREJMU0NBTikKQEAgLTI0NDQsMTMgKzI0NTksOCBAQCBp
bnQgaW50ZWxfaGRtaV9jb21wdXRlX2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2Rl
ciwKIAlpZiAoSEFTX1BDSF9TUExJVChkZXZfcHJpdikgJiYgIUhBU19EREkoZGV2X3ByaXYpKQog
CQlwaXBlX2NvbmZpZy0+aGFzX3BjaF9lbmNvZGVyID0gdHJ1ZTsKIAotCWlmIChwaXBlX2NvbmZp
Zy0+aGFzX2hkbWlfc2luaykgewotCQlpZiAoaW50ZWxfY29ubl9zdGF0ZS0+Zm9yY2VfYXVkaW8g
PT0gSERNSV9BVURJT19BVVRPKQotCQkJcGlwZV9jb25maWctPmhhc19hdWRpbyA9IGludGVsX2hk
bWktPmhhc19hdWRpbzsKLQkJZWxzZQotCQkJcGlwZV9jb25maWctPmhhc19hdWRpbyA9Ci0JCQkJ
aW50ZWxfY29ubl9zdGF0ZS0+Zm9yY2VfYXVkaW8gPT0gSERNSV9BVURJT19PTjsKLQl9CisJcGlw
ZV9jb25maWctPmhhc19hdWRpbyA9CisJCWludGVsX2hkbWlfaGFzX2F1ZGlvKGVuY29kZXIsIHBp
cGVfY29uZmlnLCBjb25uX3N0YXRlKTsKIAogCXJldCA9IGludGVsX2hkbWlfY29tcHV0ZV9jbG9j
ayhlbmNvZGVyLCBwaXBlX2NvbmZpZyk7CiAJaWYgKHJldCkKLS0gCjIuMjQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
