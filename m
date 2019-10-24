Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D704CE35C1
	for <lists+dri-devel@lfdr.de>; Thu, 24 Oct 2019 16:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5015B6E426;
	Thu, 24 Oct 2019 14:42:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EC326E42C
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Oct 2019 14:42:48 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 392ABB92A;
 Thu, 24 Oct 2019 14:42:47 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@redhat.com, sean@poorly.run, daniel@ffwll.ch, sam@ravnborg.org,
 noralf@tronnes.org
Subject: [PATCH 4/5] drm/udl: Map BO memory pages in unencrypted mode
Date: Thu, 24 Oct 2019 16:42:36 +0200
Message-Id: <20191024144237.8898-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191024144237.8898-1-tzimmermann@suse.de>
References: <20191024144237.8898-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHVkbCBkcml2ZXIncyBmYmRldiBjb2RlIG1hcHMgcGFnZXMgaW4gdW5lbmNyeXB0ZWQgbW9k
ZS4gVG8gc3dpdGNoCm92ZXIgdG8gZ2VuZXJpYyBmYmRldiBlbXVsYXRpb24sIHdlIHNldCB0aGlz
IGZsYWcgaW4gdGhlIEJPIG1hcHBpbmcgY29kZS4KClNpZ25lZC1vZmYtYnk6IFRob21hcyBaaW1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS91ZGwvdWRs
X2dlbS5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jIGIvZHJp
dmVycy9ncHUvZHJtL3VkbC91ZGxfZ2VtLmMKaW5kZXggNmNhMDk3YzI3MGQ2Li42OGU0NzU3ZTgz
ZjUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS91ZGwvdWRsX2dlbS5jCkBAIC0xMDAsNiArMTAwLDkgQEAgaW50IHVkbF9kcm1f
Z2VtX21tYXAoc3RydWN0IGZpbGUgKmZpbHAsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQog
CiAJdXBkYXRlX3ZtX2NhY2hlX2F0dHIodG9fdWRsX2JvKHZtYS0+dm1fcHJpdmF0ZV9kYXRhKSwg
dm1hKTsKIAorCS8qIFdlIGRvbid0IHdhbnQgdGhlIGZyYW1lYnVmZmVyIHRvIGJlIG1hcHBlZCBl
bmNyeXB0ZWQgKi8KKwl2bWEtPnZtX3BhZ2VfcHJvdCA9IHBncHJvdF9kZWNyeXB0ZWQodm1hLT52
bV9wYWdlX3Byb3QpOworCiAJcmV0dXJuIHJldDsKIH0KIApAQCAtMTU4LDcgKzE2MSw3IEBAIGlu
dCB1ZGxfZ2VtX3ZtYXAoc3RydWN0IHVkbF9nZW1fb2JqZWN0ICpvYmopCiAJCQlyZXR1cm4gLUVO
T01FTTsKIAkJcmV0dXJuIDA7CiAJfQotCQkKKwogCXJldCA9IHVkbF9nZW1fZ2V0X3BhZ2VzKG9i
aik7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
