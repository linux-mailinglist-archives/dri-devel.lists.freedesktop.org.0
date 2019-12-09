Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2D0116F6F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 15:45:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB986E48B;
	Mon,  9 Dec 2019 14:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1FD06E484;
 Mon,  9 Dec 2019 14:45:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Dec 2019 06:45:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,296,1571727600"; d="scan'208";a="219994142"
Received: from plaxmina-desktop.iind.intel.com ([10.106.124.119])
 by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2019 06:45:12 -0800
From: Pankaj Bharadiya <pankaj.laxminarayan.bharadiya@intel.com>
To: pankaj.laxminarayan.bharadiya@intel.com,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Matt Roper <matthew.d.roper@intel.com>,
 Stuart Summers <stuart.summers@intel.com>,
 Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Clint Taylor <Clinton.A.Taylor@intel.com>, Imre Deak <imre.deak@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [Intel-gfx][PATCH] drm/i915/display: cleanup intel_bw_state on i915
 module removal
Date: Mon,  9 Dec 2019 20:09:02 +0530
Message-Id: <20191209143921.9240-1-pankaj.laxminarayan.bharadiya@intel.com>
X-Mailer: git-send-email 2.23.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

aW50ZWxfYndfc3RhdGUgYWxsb2NhdGVkIG1lbW9yeSBpcyBub3QgZ2V0dGluZyBmcmVlZCBldmVu
IGFmdGVyCm1vZHVsZSByZW1vdmFsLgoKa21lbWxlYWsgcmVwb3J0ZWQgYmFja3RyYWNlOgoKICAg
IFs8MDAwMDAwMDA3OTAxOTczOT5dIGttZW1kdXArMHgxNy8weDQwCiAgICBbPDAwMDAwMDAwZDU4
YzFiOWQ+XSBpbnRlbF9id19kdXBsaWNhdGVfc3RhdGUrMHgxYi8weDQwIFtpOTE1XQogICAgWzww
MDAwMDAwMDc0MjNlZDBjPl0gZHJtX2F0b21pY19nZXRfcHJpdmF0ZV9vYmpfc3RhdGUrMHhjYS8w
eDE0MAogICAgWzwwMDAwMDAwMDEwMGUzNTMzPl0gaW50ZWxfYndfYXRvbWljX2NoZWNrKzB4MTMz
LzB4MzUwIFtpOTE1XQogICAgWzwwMDAwMDAwMDEyNmQwZTBjPl0gaW50ZWxfYXRvbWljX2NoZWNr
KzB4MWFiNy8weDIwZDAgW2k5MTVdCiAgICBbPDAwMDAwMDAwZDVkZmMwMDQ+XSBkcm1fYXRvbWlj
X2NoZWNrX29ubHkrMHg1NjMvMHg4MTAKICAgIFs8MDAwMDAwMDBjOTM3OTYxMT5dIGRybV9hdG9t
aWNfY29tbWl0KzB4ZS8weDUwCiAgICBbPDAwMDAwMDAwZWM4MmI3NjU+XSBkcm1fYXRvbWljX2hl
bHBlcl9kaXNhYmxlX2FsbCsweDEzMy8weDE2MAogICAgWzwwMDAwMDAwMDNjNDQ3NjBjPl0gZHJt
X2F0b21pY19oZWxwZXJfc2h1dGRvd24rMHg2NS8weGMwCiAgICBbPDAwMDAwMDAwNDE0ZTNlNWM+
XSBpOTE1X2RyaXZlcl9yZW1vdmUrMHhjYi8weDEzMCBbaTkxNV0KICAgIFs8MDAwMDAwMDBmODU0
NGMyYT5dIGk5MTVfcGNpX3JlbW92ZSsweDE5LzB4NDAgW2k5MTVdCiAgICBbPDAwMDAwMDAwMmRj
YmQxNDg+XSBwY2lfZGV2aWNlX3JlbW92ZSsweDM2LzB4YjAKICAgIFs8MDAwMDAwMDAzYzhjNmIw
YT5dIGRldmljZV9yZWxlYXNlX2RyaXZlcl9pbnRlcm5hbCsweGUwLzB4MWMwCiAgICBbPDAwMDAw
MDAwNTgwZTk1NjY+XSB1bmJpbmRfc3RvcmUrMHhjMy8weDEyMAogICAgWzwwMDAwMDAwMDg2OWQw
ZGY1Pl0ga2VybmZzX2ZvcF93cml0ZSsweDEwNC8weDE5MAogICAgWzwwMDAwMDAwMDRkYzFhMzU1
Pl0gdmZzX3dyaXRlKzB4YjkvMHgxZDAKCkNhbGwgdGhlIGRybV9hdG9taWNfcHJpdmF0ZV9vYmpf
ZmluaSgpLCB3aGljaCBpbnR1cm4gY2FsbHMgdGhlCmludGVsX2J3X2Rlc3Ryb3lfc3RhdGUoKSB0
byBtYWtlIHN1cmUgdGhlIGludGVsX2J3X3N0YXRlIG1lbW9yeSBpcwpmcmVlZCBwcm9wZXJseS4K
ClNpZ25lZC1vZmYtYnk6IFBhbmthaiBCaGFyYWRpeWEgPHBhbmthai5sYXhtaW5hcmF5YW4uYmhh
cmFkaXlhQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVs
X2J3LmMgICAgICB8IDUgKysrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YncuaCAgICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3Bs
YXkuYyB8IDIgKysKIDMgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9idy5jIGIvZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9idy5jCmluZGV4IGRjYjY2YTMzYmU5Yi4uYjIyODY3MWQ1
YTVkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2J3LmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9idy5jCkBAIC00ODYsMyAr
NDg2LDggQEAgaW50IGludGVsX2J3X2luaXQoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUgKmRldl9w
cml2KQogCiAJcmV0dXJuIDA7CiB9CisKK3ZvaWQgaW50ZWxfYndfY2xlYW51cChzdHJ1Y3QgZHJt
X2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYpCit7CisJZHJtX2F0b21pY19wcml2YXRlX29ial9maW5p
KCZkZXZfcHJpdi0+Yndfb2JqKTsKK30KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfYncuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxf
YncuaAppbmRleCA5ZGIxMGFmMDEyZjQuLjIwYjlhZDI0MTgwMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9idy5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2Rpc3BsYXkvaW50ZWxfYncuaApAQCAtMjUsNiArMjUsNyBAQCBzdHJ1Y3QgaW50ZWxfYndf
c3RhdGUgewogCiB2b2lkIGludGVsX2J3X2luaXRfaHcoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUg
KmRldl9wcml2KTsKIGludCBpbnRlbF9id19pbml0KHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdik7Cit2b2lkIGludGVsX2J3X2NsZWFudXAoc3RydWN0IGRybV9pOTE1X3ByaXZhdGUg
KmRldl9wcml2KTsKIGludCBpbnRlbF9id19hdG9taWNfY2hlY2soc3RydWN0IGludGVsX2F0b21p
Y19zdGF0ZSAqc3RhdGUpOwogdm9pZCBpbnRlbF9id19jcnRjX3VwZGF0ZShzdHJ1Y3QgaW50ZWxf
Yndfc3RhdGUgKmJ3X3N0YXRlLAogCQkJICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAq
Y3J0Y19zdGF0ZSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxh
eS5jCmluZGV4IDMxOTBhYTI3ZmZkYy4uNzU2ZWI5MGIxYmIxIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwpAQCAtMTc5MTIsNiArMTc5MTIsOCBAQCB2
b2lkIGludGVsX21vZGVzZXRfZHJpdmVyX3JlbW92ZShzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAq
aTkxNSkKIAogCWludGVsX2dtYnVzX3RlYXJkb3duKGk5MTUpOwogCisJaW50ZWxfYndfY2xlYW51
cChpOTE1KTsKKwogCWRlc3Ryb3lfd29ya3F1ZXVlKGk5MTUtPmZsaXBfd3EpOwogCWRlc3Ryb3lf
d29ya3F1ZXVlKGk5MTUtPm1vZGVzZXRfd3EpOwogCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
