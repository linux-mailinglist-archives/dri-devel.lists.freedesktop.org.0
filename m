Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA604D052
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 509716E5A9;
	Thu, 20 Jun 2019 14:26:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7BB6E59B;
 Thu, 20 Jun 2019 14:26:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 07:26:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="186821426"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 20 Jun 2019 07:26:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Jun 2019 17:26:42 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm: Do not use bitwise OR to set picure_aspect_ratio
Date: Thu, 20 Jun 2019 17:26:35 +0300
Message-Id: <20190620142639.17518-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
References: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCmVu
dW0gaGRtaV9waWN0dXJlX2FzcGVjdCBpcyBub3QgYSBiaXRtYXNrLCBzbyBkb24ndCB1c2UgYml0
d2lzZSBPUgp0byBwb3B1bGF0ZSBpdC4KCkNjOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1p
dC5lZHU+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51
eC5pbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9tb2Rlcy5jIHwgOCArKysrLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVzLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X21vZGVzLmMKaW5kZXggNTdlNjQwODI4OGM4Li41M2FjYzY3NTZlZTAgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fbW9kZXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX21vZGVz
LmMKQEAgLTE5NjYsMTYgKzE5NjYsMTYgQEAgaW50IGRybV9tb2RlX2NvbnZlcnRfdW1vZGUoc3Ry
dWN0IGRybV9kZXZpY2UgKmRldiwKIAogCXN3aXRjaCAoaW4tPmZsYWdzICYgRFJNX01PREVfRkxB
R19QSUNfQVJfTUFTSykgewogCWNhc2UgRFJNX01PREVfRkxBR19QSUNfQVJfNF8zOgotCQlvdXQt
PnBpY3R1cmVfYXNwZWN0X3JhdGlvIHw9IEhETUlfUElDVFVSRV9BU1BFQ1RfNF8zOworCQlvdXQt
PnBpY3R1cmVfYXNwZWN0X3JhdGlvID0gSERNSV9QSUNUVVJFX0FTUEVDVF80XzM7CiAJCWJyZWFr
OwogCWNhc2UgRFJNX01PREVfRkxBR19QSUNfQVJfMTZfOToKLQkJb3V0LT5waWN0dXJlX2FzcGVj
dF9yYXRpbyB8PSBIRE1JX1BJQ1RVUkVfQVNQRUNUXzE2Xzk7CisJCW91dC0+cGljdHVyZV9hc3Bl
Y3RfcmF0aW8gPSBIRE1JX1BJQ1RVUkVfQVNQRUNUXzE2Xzk7CiAJCWJyZWFrOwogCWNhc2UgRFJN
X01PREVfRkxBR19QSUNfQVJfNjRfMjc6Ci0JCW91dC0+cGljdHVyZV9hc3BlY3RfcmF0aW8gfD0g
SERNSV9QSUNUVVJFX0FTUEVDVF82NF8yNzsKKwkJb3V0LT5waWN0dXJlX2FzcGVjdF9yYXRpbyA9
IEhETUlfUElDVFVSRV9BU1BFQ1RfNjRfMjc7CiAJCWJyZWFrOwogCWNhc2UgRFJNX01PREVfRkxB
R19QSUNfQVJfMjU2XzEzNToKLQkJb3V0LT5waWN0dXJlX2FzcGVjdF9yYXRpbyB8PSBIRE1JX1BJ
Q1RVUkVfQVNQRUNUXzI1Nl8xMzU7CisJCW91dC0+cGljdHVyZV9hc3BlY3RfcmF0aW8gPSBIRE1J
X1BJQ1RVUkVfQVNQRUNUXzI1Nl8xMzU7CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCW91dC0+cGlj
dHVyZV9hc3BlY3RfcmF0aW8gPSBIRE1JX1BJQ1RVUkVfQVNQRUNUX05PTkU7Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
