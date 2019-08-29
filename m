Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC32A194E
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 13:49:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 275046E0C0;
	Thu, 29 Aug 2019 11:49:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007E86E0AE;
 Thu, 29 Aug 2019 11:49:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2019 04:49:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,442,1559545200"; d="scan'208";a="380743933"
Received: from ovasilev-desk1.fi.intel.com ([10.237.72.76])
 by fmsmga005.fm.intel.com with ESMTP; 29 Aug 2019 04:49:00 -0700
From: Oleg Vasilev <oleg.vasilev@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/7] drm/i915: utilize subconnector property for DP
Date: Thu, 29 Aug 2019 14:48:51 +0300
Message-Id: <20190829114854.1539-4-oleg.vasilev@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190829114854.1539-1-oleg.vasilev@intel.com>
References: <20190826132216.2823-1-oleg.vasilev@intel.com>
 <20190829114854.1539-1-oleg.vasilev@intel.com>
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
bnRlbF9kcC5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyBiL2Ry
aXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwppbmRleCA2ZGE2YTQ4NTlmMDYu
LjMxOGM3ZTUwY2JhMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9p
bnRlbF9kcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYwpA
QCAtNTQzNCw2ICs1NDM0LDExIEBAIGludGVsX2RwX2RldGVjdChzdHJ1Y3QgZHJtX2Nvbm5lY3Rv
ciAqY29ubmVjdG9yLAogCWlmIChzdGF0dXMgIT0gY29ubmVjdG9yX3N0YXR1c19jb25uZWN0ZWQg
JiYgIWludGVsX2RwLT5pc19tc3QpCiAJCWludGVsX2RwX3Vuc2V0X2VkaWQoaW50ZWxfZHApOwog
CisJaWYgKCFpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHApKQorCQlkcm1fZHBfc2V0X3N1YmNvbm5l
Y3Rvcl9wcm9wZXJ0eShjb25uZWN0b3IsCisJCQkJCQkgc3RhdHVzLAorCQkJCQkJIGludGVsX2Rw
LT5kcGNkLAorCQkJCQkJIGludGVsX2RwLT5kb3duc3RyZWFtX3BvcnRzKTsKIAlyZXR1cm4gc3Rh
dHVzOwogfQogCkBAIC02MzMyLDYgKzYzMzcsOSBAQCBpbnRlbF9kcF9hZGRfcHJvcGVydGllcyhz
dHJ1Y3QgaW50ZWxfZHAgKmludGVsX2RwLCBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdAog
CXN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoY29ubmVjdG9yLT5k
ZXYpOwogCWVudW0gcG9ydCBwb3J0ID0gZHBfdG9fZGlnX3BvcnQoaW50ZWxfZHApLT5iYXNlLnBv
cnQ7CiAKKwlpZiAoIWludGVsX2RwX2lzX2VkcChpbnRlbF9kcCkpCisJCWRybV9tb2RlX2FkZF9k
cF9zdWJjb25uZWN0b3JfcHJvcGVydHkoY29ubmVjdG9yKTsKKwogCWlmICghSVNfRzRYKGRldl9w
cml2KSAmJiBwb3J0ICE9IFBPUlRfQSkKIAkJaW50ZWxfYXR0YWNoX2ZvcmNlX2F1ZGlvX3Byb3Bl
cnR5KGNvbm5lY3Rvcik7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
