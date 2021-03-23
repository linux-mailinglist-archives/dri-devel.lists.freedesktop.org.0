Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B76346436
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 16:59:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7089E6EC3C;
	Tue, 23 Mar 2021 15:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1E206EC0F
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 15:57:43 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v9 21/70] drm/i915: Rework clflush to work correctly without
 obj->mm.lock.
Date: Tue, 23 Mar 2021 16:50:10 +0100
Message-Id: <20210323155059.628690-22-maarten.lankhorst@linux.intel.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
References: <20210323155059.628690-1-maarten.lankhorst@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UGluIGluIHRoZSBjYWxsZXIsIG5vdCBpbiB0aGUgd29yayBpdHNlbGYuIFRoaXMgc2hvdWxkIGFs
c28Kd29yayBiZXR0ZXIgZm9yIGRtYS1mZW5jZSBhbm5vdGF0aW9ucy4KClNpZ25lZC1vZmYtYnk6
IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+ClJl
dmlld2VkLWJ5OiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5pbnRl
bC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NsZmx1c2guYyB8
IDE1ICsrKysrKystLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9nZW0vaTkxNV9n
ZW1fY2xmbHVzaC5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NsZmx1c2gu
YwppbmRleCBhMjhmOGM5MTJhM2UuLmU0YzI0NTU4ZWFhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvZ2VtL2k5MTVfZ2VtX2NsZmx1c2guYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9nZW0vaTkxNV9nZW1fY2xmbHVzaC5jCkBAIC0yNywxNSArMjcsOCBAQCBzdGF0aWMgdm9p
ZCBfX2RvX2NsZmx1c2goc3RydWN0IGRybV9pOTE1X2dlbV9vYmplY3QgKm9iaikKIHN0YXRpYyBp
bnQgY2xmbHVzaF93b3JrKHN0cnVjdCBkbWFfZmVuY2Vfd29yayAqYmFzZSkKIHsKIAlzdHJ1Y3Qg
Y2xmbHVzaCAqY2xmbHVzaCA9IGNvbnRhaW5lcl9vZihiYXNlLCB0eXBlb2YoKmNsZmx1c2gpLCBi
YXNlKTsKLQlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAqb2JqID0gY2xmbHVzaC0+b2JqOwot
CWludCBlcnI7CiAKLQllcnIgPSBpOTE1X2dlbV9vYmplY3RfcGluX3BhZ2VzKG9iaik7Ci0JaWYg
KGVycikKLQkJcmV0dXJuIGVycjsKLQotCV9fZG9fY2xmbHVzaChvYmopOwotCWk5MTVfZ2VtX29i
amVjdF91bnBpbl9wYWdlcyhvYmopOworCV9fZG9fY2xmbHVzaChjbGZsdXNoLT5vYmopOwogCiAJ
cmV0dXJuIDA7CiB9CkBAIC00NCw2ICszNyw3IEBAIHN0YXRpYyB2b2lkIGNsZmx1c2hfcmVsZWFz
ZShzdHJ1Y3QgZG1hX2ZlbmNlX3dvcmsgKmJhc2UpCiB7CiAJc3RydWN0IGNsZmx1c2ggKmNsZmx1
c2ggPSBjb250YWluZXJfb2YoYmFzZSwgdHlwZW9mKCpjbGZsdXNoKSwgYmFzZSk7CiAKKwlpOTE1
X2dlbV9vYmplY3RfdW5waW5fcGFnZXMoY2xmbHVzaC0+b2JqKTsKIAlpOTE1X2dlbV9vYmplY3Rf
cHV0KGNsZmx1c2gtPm9iaik7CiB9CiAKQEAgLTYxLDYgKzU1LDExIEBAIHN0YXRpYyBzdHJ1Y3Qg
Y2xmbHVzaCAqY2xmbHVzaF93b3JrX2NyZWF0ZShzdHJ1Y3QgZHJtX2k5MTVfZ2VtX29iamVjdCAq
b2JqKQogCWlmICghY2xmbHVzaCkKIAkJcmV0dXJuIE5VTEw7CiAKKwlpZiAoX19pOTE1X2dlbV9v
YmplY3RfZ2V0X3BhZ2VzKG9iaikgPCAwKSB7CisJCWtmcmVlKGNsZmx1c2gpOworCQlyZXR1cm4g
TlVMTDsKKwl9CisKIAlkbWFfZmVuY2Vfd29ya19pbml0KCZjbGZsdXNoLT5iYXNlLCAmY2xmbHVz
aF9vcHMpOwogCWNsZmx1c2gtPm9iaiA9IGk5MTVfZ2VtX29iamVjdF9nZXQob2JqKTsgLyogb2Jq
IDwtPiBjbGZsdXNoIGN5Y2xlICovCiAKLS0gCjIuMzEuMAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
