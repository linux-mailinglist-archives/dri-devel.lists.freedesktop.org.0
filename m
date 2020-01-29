Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C6B14D38E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 00:25:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FDA06E462;
	Wed, 29 Jan 2020 23:25:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9860E6E462;
 Wed, 29 Jan 2020 23:25:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Jan 2020 15:25:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,379,1574150400"; d="scan'208";a="316345184"
Received: from josouza-mobl.jf.intel.com (HELO josouza-MOBL.intel.com)
 ([10.24.13.17])
 by fmsmga001.fm.intel.com with ESMTP; 29 Jan 2020 15:25:00 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mst: Fix possible NULL pointer dereference in
 drm_dp_mst_process_up_req()
Date: Wed, 29 Jan 2020 15:24:48 -0800
Message-Id: <20200129232448.84704-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.25.0
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
Cc: Sean Paul <sean@poorly.run>, intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIERQIHNwZWNpZmljYXRpb24sIERQX1NJTktfRVZFTlRfTk9USUZZIGlzIGFs
c28gYQpicm9hZGNhc3QgbWVzc2FnZSBidXQgYXMgdGhpcyBmdW5jdGlvbiBvbmx5IGhhbmRsZXMK
RFBfQ09OTkVDVElPTl9TVEFUVVNfTk9USUZZIEkgd2lsbCBvbmx5IG1ha2UgdGhlIHN0YXRpYwph
bmFseXplciB0aGF0IGNhdWdodCB0aGlzIGlzc3VlIGhhcHB5IGJ5IG5vdCBjYWxsaW5nCmRybV9k
cF9nZXRfbXN0X2JyYW5jaF9kZXZpY2VfYnlfZ3VpZCgpIHdpdGggYSBOVUxMIGd1aWQsIGNhdXNp
bmcKZHJtX2RwX21zdF9wcm9jZXNzX3VwX3JlcSgpIHRvIHJldHVybiBpbiB0aGUgImlmICghbXN0
YikiIHJpZ2h0CmJlbGxvdy4KCkZpeGVzOiA5NDA4Y2M5NGViMDQgKCJkcm0vZHBfbXN0OiBIYW5k
bGUgVVAgcmVxdWVzdHMgYXN5bmNocm9ub3VzbHkiKQpDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVk
aGF0LmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpTaWduZWQtb2ZmLWJ5OiBK
b3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX21zdF90b3BvbG9neS5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9w
b2xvZ3kuYwppbmRleCAyM2NmNDZiZmVmNzQuLmE4MTEyNDdjZWNmZSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2RybV9kcF9tc3RfdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX21zdF90b3BvbG9neS5jCkBAIC0zODI5LDcgKzM4MjksOCBAQCBkcm1fZHBfbXN0X3By
b2Nlc3NfdXBfcmVxKHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAogCQllbHNl
IGlmIChtc2ctPnJlcV90eXBlID09IERQX1JFU09VUkNFX1NUQVRVU19OT1RJRlkpCiAJCQlndWlk
ID0gbXNnLT51LnJlc291cmNlX3N0YXQuZ3VpZDsKIAotCQltc3RiID0gZHJtX2RwX2dldF9tc3Rf
YnJhbmNoX2RldmljZV9ieV9ndWlkKG1nciwgZ3VpZCk7CisJCWlmIChndWlkKQorCQkJbXN0YiA9
IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2VfYnlfZ3VpZChtZ3IsIGd1aWQpOwogCX0gZWxz
ZSB7CiAJCW1zdGIgPSBkcm1fZHBfZ2V0X21zdF9icmFuY2hfZGV2aWNlKG1nciwgaGRyLT5sY3Qs
IGhkci0+cmFkKTsKIAl9Ci0tIAoyLjI1LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbAo=
