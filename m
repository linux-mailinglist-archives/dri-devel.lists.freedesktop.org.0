Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C51524AB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 09:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4654D6E04B;
	Tue, 25 Jun 2019 07:28:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lb2-smtp-cloud7.xs4all.net (lb2-smtp-cloud7.xs4all.net
 [194.109.24.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D6689CF1
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2019 16:10:47 +0000 (UTC)
Received: from tschai.fritz.box ([46.9.252.75])
 by smtp-cloud7.xs4all.net with ESMTPA
 id fRRKhHRxHF85OfRRShZabW; Mon, 24 Jun 2019 18:03:39 +0200
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
To: linux-media@vger.kernel.org
Subject: [PATCHv8 07/13] drm/i915/intel_hdmi: use
 cec_notifier_conn_(un)register
Date: Mon, 24 Jun 2019 18:03:24 +0200
Message-Id: <20190624160330.38048-8-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
References: <20190624160330.38048-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHHansUyGVXBysIw83Mx+bRjZGJT/Z8Zf6NsbpPtkX3RRqVmBXKFM6o+UHfbRcYyh+qucjbgPKjQu+b6PY7Q8ggJzLbvXhQixSiVRtNg+sEXzfaKMnhE
 5Odn//YSx8h1UhGB5hrMEbmwXveFfKHQ3stgENRQujroOMukNbwqdXxU9oEdtVD7uNn2Zbrg5jSo0kzqyU2tTk7yc0nCRenmqFiX4TpJUiKn1Ge6v+rmTfQj
 KEDgTbqGa4k/NugARg5b5+ofFOfwc08YSQu1hGcJXzBzv+Cv50gcrh/hJ0uVGfQGjP8myMa4czNvTLN5ZEtutekV4iIoa6xOPw/o6Favdak=
X-Mailman-Approved-At: Tue, 25 Jun 2019 07:27:07 +0000
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
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dariusz Marcinkiewicz <darekm@google.com>, dri-devel@lists.freedesktop.org,
 Cheng-yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFyaXVzeiBNYXJjaW5raWV3aWN6IDxkYXJla21AZ29vZ2xlLmNvbT4KClVzZSB0aGUg
bmV3IGNlY19ub3RpZmllcl9jb25uXyh1bilyZWdpc3RlcigpIGZ1bmN0aW9ucyB0bwoodW4pcmVn
aXN0ZXIgdGhlIG5vdGlmaWVyIGZvciB0aGUgSERNSSBjb25uZWN0b3IsIGFuZCBmaWxsIGluCnRo
ZSBjZWNfY29ubmVjdG9yX2luZm8uCgpTaWduZWQtb2ZmLWJ5OiBEYXJpdXN6IE1hcmNpbmtpZXdp
Y3ogPGRhcmVrbUBnb29nbGUuY29tPgpTaWduZWQtb2ZmLWJ5OiBIYW5zIFZlcmt1aWwgPGh2ZXJr
dWlsLWNpc2NvQHhzNGFsbC5ubD4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1p
LmMgfCAxMyArKysrKysrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspLCA0
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hk
bWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYwppbmRleCAzNGJlMmNmZDBl
YzguLjA1YTVjY2MxNTE3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxf
aGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYwpAQCAtMjY3MCw4
ICsyNjcwLDkgQEAgaW50ZWxfaGRtaV9jb25uZWN0b3JfcmVnaXN0ZXIoc3RydWN0IGRybV9jb25u
ZWN0b3IgKmNvbm5lY3RvcikKIAogc3RhdGljIHZvaWQgaW50ZWxfaGRtaV9kZXN0cm95KHN0cnVj
dCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCiB7Ci0JaWYgKGludGVsX2F0dGFjaGVkX2hkbWko
Y29ubmVjdG9yKS0+Y2VjX25vdGlmaWVyKQotCQljZWNfbm90aWZpZXJfcHV0KGludGVsX2F0dGFj
aGVkX2hkbWkoY29ubmVjdG9yKS0+Y2VjX25vdGlmaWVyKTsKKwlzdHJ1Y3QgY2VjX25vdGlmaWVy
ICpuID0gaW50ZWxfYXR0YWNoZWRfaGRtaShjb25uZWN0b3IpLT5jZWNfbm90aWZpZXI7CisKKwlj
ZWNfbm90aWZpZXJfY29ubl91bnJlZ2lzdGVyKG4pOwogCiAJaW50ZWxfY29ubmVjdG9yX2Rlc3Ry
b3koY29ubmVjdG9yKTsKIH0KQEAgLTI5NjgsNiArMjk2OSw3IEBAIHZvaWQgaW50ZWxfaGRtaV9p
bml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9wb3J0ICppbnRlbF9kaWdfcG9ydCwK
IAlzdHJ1Y3QgZHJtX2RldmljZSAqZGV2ID0gaW50ZWxfZW5jb2Rlci0+YmFzZS5kZXY7CiAJc3Ry
dWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2ID0gdG9faTkxNShkZXYpOwogCWVudW0gcG9y
dCBwb3J0ID0gaW50ZWxfZW5jb2Rlci0+cG9ydDsKKwlzdHJ1Y3QgY2VjX2Nvbm5lY3Rvcl9pbmZv
IGNvbm5faW5mbzsKIAogCURSTV9ERUJVR19LTVMoIkFkZGluZyBIRE1JIGNvbm5lY3RvciBvbiBw
b3J0ICVjXG4iLAogCQkgICAgICBwb3J0X25hbWUocG9ydCkpOwpAQCAtMzAyMCw4ICszMDIyLDEx
IEBAIHZvaWQgaW50ZWxfaGRtaV9pbml0X2Nvbm5lY3RvcihzdHJ1Y3QgaW50ZWxfZGlnaXRhbF9w
b3J0ICppbnRlbF9kaWdfcG9ydCwKIAkJSTkxNV9XUklURShQRUdfQkFORF9HQVBfREFUQSwgKHRl
bXAgJiB+MHhmKSB8IDB4ZCk7CiAJfQogCi0JaW50ZWxfaGRtaS0+Y2VjX25vdGlmaWVyID0gY2Vj
X25vdGlmaWVyX2dldF9jb25uKGRldi0+ZGV2LAotCQkJCQkJCSBwb3J0X2lkZW50aWZpZXIocG9y
dCkpOworCWNlY19maWxsX2Nvbm5faW5mb19mcm9tX2RybSgmY29ubl9pbmZvLCBjb25uZWN0b3Ip
OworCisJaW50ZWxfaGRtaS0+Y2VjX25vdGlmaWVyID0KKwkJY2VjX25vdGlmaWVyX2Nvbm5fcmVn
aXN0ZXIoZGV2LT5kZXYsIHBvcnRfaWRlbnRpZmllcihwb3J0KSwKKwkJCQkJICAgJmNvbm5faW5m
byk7CiAJaWYgKCFpbnRlbF9oZG1pLT5jZWNfbm90aWZpZXIpCiAJCURSTV9ERUJVR19LTVMoIkNF
QyBub3RpZmllciBnZXQgZmFpbGVkXG4iKTsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
