Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A43491558ED
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 15:00:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC746FCB3;
	Fri,  7 Feb 2020 14:00:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C251B6FCB3;
 Fri,  7 Feb 2020 14:00:14 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 06:00:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="279987495"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 07 Feb 2020 06:00:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 16:00:11 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/6] drm: Validate encoder->possible_crtcs
Date: Fri,  7 Feb 2020 15:59:50 +0200
Message-Id: <20200207135950.6655-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldB
Uk4gaWYgdGhlIGVuY29kZXIgcG9zc2libGVfY3J0Y3MgaXMgZWZmZWN0aXZlbHkgZW1wdHkgb3Ig
Y29udGFpbnMKYml0cyBmb3Igbm9uLWV4aXN0aW5nIGNydGNzLgoKVE9ETzogT3Igc2hvdWxkIHdl
IHBlcmhhcHN0IGp1c3QgZmlsdGVyIG91dCBhbnkgYml0IGZvciBhCm5vbi1leGlzaXRpbmcgY3J0
Yz8KCkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4KQ2M6IERhbmll
bCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJt
X2VuY29kZXIuYyB8IDE4ICsrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDE4IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VuY29kZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZW5jb2Rlci5jCmluZGV4IGJjMjI0NmYyN2UwZC4uZjE2YjJh
MjUxOGQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2VuY29kZXIuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VuY29kZXIuYwpAQCAtMTA3LDYgKzEwNywyMyBAQCBzdGF0aWMg
dm9pZCB2YWxpZGF0ZV9wb3NzaWJsZV9jbG9uZXMoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVy
KQogCSAgICAgZW5jb2Rlci0+cG9zc2libGVfY2xvbmVzLCBlbmNvZGVyX21hc2spOwogfQogCitz
dGF0aWMgdm9pZCB2YWxpZGF0ZV9wb3NzaWJsZV9jcnRjcyhzdHJ1Y3QgZHJtX2VuY29kZXIgKmVu
Y29kZXIpCit7CisJc3RydWN0IGRybV9kZXZpY2UgKmRldiA9IGVuY29kZXItPmRldjsKKwlzdHJ1
Y3QgZHJtX2NydGMgKmNydGM7CisJdTMyIGNydGNfbWFzayA9IDA7CisKKwlkcm1fZm9yX2VhY2hf
Y3J0YyhjcnRjLCBkZXYpCisJCWNydGNfbWFzayB8PSBkcm1fY3J0Y19tYXNrKGNydGMpOworCisJ
V0FSTigoZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MgJiBjcnRjX21hc2spID09IDAgfHwKKwkgICAg
IChlbmNvZGVyLT5wb3NzaWJsZV9jcnRjcyAmIH5jcnRjX21hc2spICE9IDAsCisJICAgICAiQm9n
dXMgcG9zc2libGVfY3J0Y3M6ICIKKwkgICAgICJbRU5DT0RFUjolZDolc10gcG9zc2libGVfY3J0
Y3M9MHgleCAoZnVsbCBjcnRjIG1hc2s9MHgleClcbiIsCisJICAgICBlbmNvZGVyLT5iYXNlLmlk
LCBlbmNvZGVyLT5uYW1lLAorCSAgICAgZW5jb2Rlci0+cG9zc2libGVfY3J0Y3MsIGNydGNfbWFz
ayk7Cit9CisKIGludCBkcm1fZW5jb2Rlcl9yZWdpc3Rlcl9hbGwoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikKIHsKIAlzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7CkBAIC0xMTUsNiArMTMyLDcg
QEAgaW50IGRybV9lbmNvZGVyX3JlZ2lzdGVyX2FsbChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2KQog
CWZpeHVwX3Bvc3NpYmxlX2Nsb25lcyhkZXYpOwogCiAJZHJtX2Zvcl9lYWNoX2VuY29kZXIoZW5j
b2RlciwgZGV2KSB7CisJCXZhbGlkYXRlX3Bvc3NpYmxlX2NydGNzKGVuY29kZXIpOwogCQl2YWxp
ZGF0ZV9wb3NzaWJsZV9jbG9uZXMoZW5jb2Rlcik7CiAKIAkJaWYgKGVuY29kZXItPmZ1bmNzLT5s
YXRlX3JlZ2lzdGVyKQotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWwK
