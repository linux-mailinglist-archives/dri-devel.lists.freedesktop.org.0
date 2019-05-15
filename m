Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E3D1F6A8
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 16:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589DC89257;
	Wed, 15 May 2019 14:38:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 960A6892A9
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 14:38:36 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id o189so307823wmb.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2019 07:38:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Q+iJ6rJZ2HsKCGJQjBe3G9bfJhGCGmYeQPjdB6XZUQ=;
 b=p05CXLKBrAkNlx9szKcSdgA6YdKT5FK4yt484kHJ6A+XkpoJbYewy0t6uYHw5jySnV
 0jgWFFhe0tnqG0IsX8Jb0jUStrJ/0nidiExdoWttgWNQdjwbEiIFGy+b9M41IYocAiB5
 xfbxpwRmGBPHCRcPoFFZoEke8IaDGj4nTjIe8u4UJ196J9GLsa5ifLlw8pGXhdjMgUl/
 wczLsFjszoJymVvPQGSkmMYtIIan4URpNj028DJwmW4ly+Sou+neqidLSCojAxGGqqyB
 dF8pg3BQXzOV8vAPWh4926EgNNJyKe5jADqC5mPoGtKigKcDbyA6gXAclY7Q6RvBM+/B
 8haw==
X-Gm-Message-State: APjAAAWdpYM1J+sXkKBw1KMRdkAv1oadOLuJCWRBOBuvxEzAEAuy0DsT
 KVH9dd7HpPf+NZavTXOCd2qnOtZs
X-Google-Smtp-Source: APXvYqx+qXhJAudADVr948n9GunrxO+9RIoOV29JQRhM+7w4UYgoRvXF2xLlrZ1g0y2FECCVf9LJAA==
X-Received: by 2002:a1c:43c2:: with SMTP id q185mr24022424wma.53.1557931115268; 
 Wed, 15 May 2019 07:38:35 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:fd02:5db:d141:8a62])
 by smtp.gmail.com with ESMTPSA id w7sm2606895wmm.16.2019.05.15.07.38.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 07:38:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/ttm: use the parent resv for ghost objects
Date: Wed, 15 May 2019 16:38:28 +0200
Message-Id: <20190515143831.1639-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190515143831.1639-1-christian.koenig@amd.com>
References: <20190515143831.1639-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/Q+iJ6rJZ2HsKCGJQjBe3G9bfJhGCGmYeQPjdB6XZUQ=;
 b=qlXwRpgNJLYeztVSQbe51kb9SZrUlPtLstOSCOFjr0vJOvBUbxZCATZts6pUp7vZmY
 tKFh6ONtEOmKBuZPefmkx0CQGWyZvOWWKMH4TKwQ8FJuTUBBwQx8GAzWpoBzwhz7nrOg
 wypSyui8ITd9662hiuESWWygFubFqM26be4LBwWEWuzkRyOqCKSHx2ArglRjVkdLMWDT
 EViSduSBTT/bO9GDdhJGAoZqlHu8xkwMYEyb6M2i1/RJdBLUklxCucam7yG0kvtwgUG1
 gYNfY26pKx/qYWx3pkIL9p/IjILwxKU3CL1FLquVz8qNHFjX/YXGjkg1EbtPHI/mq6qh
 rspQ==
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

VGhpcyB3YXkgd2UgY2FuIGV2ZW4gcGlwZWxpbmUgaW1wb3J0ZWQgQk8gZXZpY3Rpb25zLgoKU2ln
bmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYyB8IDE4ICstLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxNyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9ib191dGlsLmMKaW5kZXggODk1ZDc3ZDc5OWU0Li45N2YzNWM0YmRhMzUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvX3V0aWwuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vdHRtL3R0bV9ib191dGlsLmMKQEAgLTQ4Niw3ICs0ODYsNiBAQCBzdGF0aWMg
aW50IHR0bV9idWZmZXJfb2JqZWN0X3RyYW5zZmVyKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAq
Ym8sCiAJCQkJICAgICAgc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICoqbmV3X29iaikKIHsKIAlz
dHJ1Y3QgdHRtX3RyYW5zZmVyX29iaiAqZmJvOwotCWludCByZXQ7CiAKIAlmYm8gPSBrbWFsbG9j
KHNpemVvZigqZmJvKSwgR0ZQX0tFUk5FTCk7CiAJaWYgKCFmYm8pCkBAIC01MTcsMTAgKzUxNiw3
IEBAIHN0YXRpYyBpbnQgdHRtX2J1ZmZlcl9vYmplY3RfdHJhbnNmZXIoc3RydWN0IHR0bV9idWZm
ZXJfb2JqZWN0ICpibywKIAlrcmVmX2luaXQoJmZiby0+YmFzZS5rcmVmKTsKIAlmYm8tPmJhc2Uu
ZGVzdHJveSA9ICZ0dG1fdHJhbnNmZXJlZF9kZXN0cm95OwogCWZiby0+YmFzZS5hY2Nfc2l6ZSA9
IDA7Ci0JZmJvLT5iYXNlLnJlc3YgPSAmZmJvLT5iYXNlLnR0bV9yZXN2OwotCXJlc2VydmF0aW9u
X29iamVjdF9pbml0KGZiby0+YmFzZS5yZXN2KTsKLQlyZXQgPSByZXNlcnZhdGlvbl9vYmplY3Rf
dHJ5bG9jayhmYm8tPmJhc2UucmVzdik7Ci0JV0FSTl9PTighcmV0KTsKKwlyZXNlcnZhdGlvbl9v
YmplY3RfaW5pdCgmZmJvLT5iYXNlLnR0bV9yZXN2KTsKIAogCSpuZXdfb2JqID0gJmZiby0+YmFz
ZTsKIAlyZXR1cm4gMDsKQEAgLTcxNiw4ICs3MTIsNiBAQCBpbnQgdHRtX2JvX21vdmVfYWNjZWxf
Y2xlYW51cChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQlpZiAocmV0KQogCQkJcmV0
dXJuIHJldDsKIAotCQlyZXNlcnZhdGlvbl9vYmplY3RfYWRkX2V4Y2xfZmVuY2UoZ2hvc3Rfb2Jq
LT5yZXN2LCBmZW5jZSk7Ci0KIAkJLyoqCiAJCSAqIElmIHdlJ3JlIG5vdCBtb3ZpbmcgdG8gZml4
ZWQgbWVtb3J5LCB0aGUgVFRNIG9iamVjdAogCQkgKiBuZWVkcyB0byBzdGF5IGFsaXZlLiBPdGhl
cndoaXNlIGhhbmcgaXQgb24gdGhlIGdob3N0CkBAIC03MjksNyArNzIzLDYgQEAgaW50IHR0bV9i
b19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJZWxz
ZQogCQkJYm8tPnR0bSA9IE5VTEw7CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOwog
CQl0dG1fYm9fcHV0KGdob3N0X29iaik7CiAJfQogCkBAIC03NzIsOCArNzY1LDYgQEAgaW50IHR0
bV9ib19waXBlbGluZV9tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCWlmIChy
ZXQpCiAJCQlyZXR1cm4gcmV0OwogCi0JCXJlc2VydmF0aW9uX29iamVjdF9hZGRfZXhjbF9mZW5j
ZShnaG9zdF9vYmotPnJlc3YsIGZlbmNlKTsKLQogCQkvKioKIAkJICogSWYgd2UncmUgbm90IG1v
dmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0CiAJCSAqIG5lZWRzIHRvIHN0YXkg
YWxpdmUuIE90aGVyd2hpc2UgaGFuZyBpdCBvbiB0aGUgZ2hvc3QKQEAgLTc4NSw3ICs3NzYsNiBA
QCBpbnQgdHRtX2JvX3BpcGVsaW5lX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywK
IAkJZWxzZQogCQkJYm8tPnR0bSA9IE5VTEw7CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9v
YmopOwogCQl0dG1fYm9fcHV0KGdob3N0X29iaik7CiAKIAl9IGVsc2UgaWYgKGZyb20tPmZsYWdz
ICYgVFRNX01FTVRZUEVfRkxBR19GSVhFRCkgewpAQCAtODQxLDE2ICs4MzEsMTAgQEAgaW50IHR0
bV9ib19waXBlbGluZV9ndXR0aW5nKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJaWYg
KHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJldCA9IHJlc2VydmF0aW9uX29iamVjdF9jb3B5X2Zl
bmNlcyhnaG9zdC0+cmVzdiwgYm8tPnJlc3YpOwotCS8qIExhc3QgcmVzb3J0LCB3YWl0IGZvciB0
aGUgQk8gdG8gYmUgaWRsZSB3aGVuIHdlIGFyZSBPT00gKi8KLQlpZiAocmV0KQotCQl0dG1fYm9f
d2FpdChibywgZmFsc2UsIGZhbHNlKTsKLQogCW1lbXNldCgmYm8tPm1lbSwgMCwgc2l6ZW9mKGJv
LT5tZW0pKTsKIAliby0+bWVtLm1lbV90eXBlID0gVFRNX1BMX1NZU1RFTTsKIAliby0+dHRtID0g
TlVMTDsKIAotCXR0bV9ib191bnJlc2VydmUoZ2hvc3QpOwogCXR0bV9ib19wdXQoZ2hvc3QpOwog
CiAJcmV0dXJuIDA7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
