Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADA615EEB
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 10:13:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B62489F27;
	Tue,  7 May 2019 08:13:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 665A989F08
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 08:13:44 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id p21so19185302wmc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 07 May 2019 01:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Q+iJ6rJZ2HsKCGJQjBe3G9bfJhGCGmYeQPjdB6XZUQ=;
 b=FS+/31tAQr2qYJowYOfdBcyMh2/GiyGHcqo6qMoJBtaNqk4LEWZ8D2ZnfcLlqx8P9Z
 iiVcD46WU97fDtQoNrVGInmcunHJ9I0XKNvMK+6NI4SU7mFF76l16g9ybgsRhHAd38XQ
 Qm0UvvUqZTBJB8q79JXhLgjLoM4sLVfVcuLcAZGAoY9c1YNb1XgIbVvcNFICaQSIMxC6
 fxy5Vj1wqw9xDeOOyIRZRBkFKZY+AX5FOjwRcs04eX0YO95IxNbWsoMXOYizxBRBNUWd
 04Lk2Y9Ax1QXRKdpCfWHEH/YFFgfgZObitiPKgTQipTYdpcvQY05VpNYgCY+3NasgMC/
 K6zQ==
X-Gm-Message-State: APjAAAVK6roZqAtik6sdCnew2yLdWshO1MM5Zwl2RKlMMwFMwTvbFduF
 +J3hptiU/jIv45QjRBtyCps+pK+A
X-Google-Smtp-Source: APXvYqzOLFWVljOF2QU9ClY5sO5at6xAgMQn2wZXYqjqP+RTu/GPMsjRAd09iFk5LOTEijZrpilNcA==
X-Received: by 2002:a05:600c:22c5:: with SMTP id
 5mr1854714wmg.129.1557216822875; 
 Tue, 07 May 2019 01:13:42 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:c572:e952:8ef0:ace])
 by smtp.gmail.com with ESMTPSA id 67sm13588683wmz.41.2019.05.07.01.13.42
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 07 May 2019 01:13:42 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/9] drm/ttm: use the parent resv for ghost objects
Date: Tue,  7 May 2019 10:13:34 +0200
Message-Id: <20190507081338.2571-5-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190507081338.2571-1-christian.koenig@amd.com>
References: <20190507081338.2571-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/Q+iJ6rJZ2HsKCGJQjBe3G9bfJhGCGmYeQPjdB6XZUQ=;
 b=u0B41Bpkf+2RfaJd47S6Ulh10QiHEJPg8dRoPYbY6IVjPDyTdpoWbi8Jd1rfN9x9IC
 mx6mrYhEugZIhrszq1hwXaHyxL+t2vnbyDYX7xsbCUtsCREKkf/cqOmh3W0DPcFD15IM
 H4XP15Qbjf0P01J315WlO+3abmQxlI4piWGYRMxFC5E8pv5dwYqQx3yT7GV65r2JZIF9
 v5R6RGFoL5nHBR4Eo4kO08XcmuB2mXm52l2TVv4TXUOHiRLwourGejxqCBTUVR64QlXQ
 sDewl1i2nqM8ENlYjZRD3cKyhmc3AKFIdetYO9GJaUtsm357fZMNXd08Lp+qqRnhSB3W
 P3Rw==
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
