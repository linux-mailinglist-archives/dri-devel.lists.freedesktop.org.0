Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D1428113D
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 13:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 731CC6E930;
	Fri,  2 Oct 2020 11:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F26056E92F
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 11:31:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id dn5so1274284edb.10
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 04:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=q5ttTU3JdfhxYZzsQWNdwBpKiCCUypOj8L4FjKt2Yuw=;
 b=XJl0Np+CcJP5+GlbUHMJwyTD0/s5fTkt+9YZSq7FCa9I+WmEei4yyiLbND0iC2rjK9
 JXzZdnLTpoDBG2YhCZqVkejDxun7X7tT0BEH4B3cOkf7smmEgV60IO4pxqb2U9d2Nip4
 yTbEsoEnNSMW64+EjgXv8iSGSMF5ERrXOmDENvbvsvXbOJSkAoyAmsd3BZG9hNa6Rjuq
 9HrL/VehDclsxl25VThYAIQbseNSArwuehgtc2HigvZHnv+NP9f2ncBq8wsLqtTYlNSJ
 muWw7Y6iTU/m2miBuY0fm42vvPJ8YsqoIBylYmjR25sa36RVQ6+wWAbrVizjEmZWdw9k
 Rc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=q5ttTU3JdfhxYZzsQWNdwBpKiCCUypOj8L4FjKt2Yuw=;
 b=ggXnR15eDLtOs3wlIVt3VmfzSvOMZf3+dfJfQBudxdknHy6jnRFcbm2Z41XZeXcsR6
 O3FugSh9tWH/CUJt1kCLHfHc4+LENfv7yz7h9qtLQuWRiI1Qi4sXbmi3y7jxjRGU3GUF
 /79zkZiHOQ21WN/U/bIdJDwexXCO6EViEGAA42lhR9706q3WjfdO6Im2Tm555ZEU8ELk
 7po43f2My3Xvr5o7ByyItMnnWKjg81qNTwr/1R96Fej9MUaFfINyqb4FLn7twePs/DPC
 51ceA4yWPY+9g9cAjFx8KWStXkisC7ZYfhec2IyqsplfcUvW/koNF7ZsGmDKjbTRHVfU
 toPQ==
X-Gm-Message-State: AOAM531JP/j7nD/2T9IV7sNKxNqB2ED9tm7iguC2aUKf8yZM4oggL5o6
 s6a25X0k2FJOhRvND86kx13eoN+MDtM=
X-Google-Smtp-Source: ABdhPJy39MXoRWV/wkXNJaIgtxJ2Tk7ZaC7c6LppUSBry+N1JR90ZQBBZakSpBlUSXvEJ2ttLvgUKQ==
X-Received: by 2002:a50:e799:: with SMTP id b25mr1754725edn.225.1601638283409; 
 Fri, 02 Oct 2020 04:31:23 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0ce:8a95:8e6:b4f4])
 by smtp.gmail.com with ESMTPSA id 59sm971368ede.73.2020.10.02.04.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 04:31:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 2/2] drm/ttm: remove no_retry flag
Date: Fri,  2 Oct 2020 13:31:21 +0200
Message-Id: <20201002113121.47823-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002113121.47823-1-christian.koenig@amd.com>
References: <20201002113121.47823-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW1kZ3B1IHdhcyB0aGUgb25seSB1c2VyIG9mIHRoaXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3Rp
YW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgNiArKystLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3R0LmMgICAgICAgICAgICB8IDMgLS0tCiBpbmNsdWRlL2RybS90dG0vdHRtX2RldmljZS5o
ICAgICAgICAgICAgfCAyIC0tCiAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgOCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKaW5kZXgg
YzVmMmI0OTcxZWY3Li4wYTQyMzM5ODU4NzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfdHRtLmMKQEAgLTEyOTgsNiArMTI5OCw5IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0ICph
bWRncHVfdHRtX3R0X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCX0KIAln
dHQtPmdvYmogPSAmYm8tPmJhc2U7CiAKKwkvKiBXZSBvcHQgdG8gYXZvaWQgT09NIG9uIHN5c3Rl
bSBwYWdlcyBhbGxvY2F0aW9ucyAqLworCXBhZ2VfZmxhZ3MgfD0gVFRNX1BBR0VfRkxBR19OT19S
RVRSWTsKKwogCWlmIChkbWFfYWRkcmVzc2luZ19saW1pdGVkKGFkZXYtPmRldikpCiAJCXBhZ2Vf
ZmxhZ3MgfD0gVFRNX1BBR0VfRkxBR19ETUEzMjsKIApAQCAtMTg5NSw5ICsxODk4LDYgQEAgaW50
IGFtZGdwdV90dG1faW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKIAl9CiAJYWRldi0+
bW1hbi5pbml0aWFsaXplZCA9IHRydWU7CiAKLQkvKiBXZSBvcHQgdG8gYXZvaWQgT09NIG9uIHN5
c3RlbSBwYWdlcyBhbGxvY2F0aW9ucyAqLwotCWFkZXYtPm1tYW4uYmRldi5ub19yZXRyeSA9IHRy
dWU7Ci0KIAkvKiBJbml0aWFsaXplIFZSQU0gcG9vbCB3aXRoIGFsbCBvZiBWUkFNIGRpdmlkZWQg
aW50byBwYWdlcyAqLwogCXIgPSBhbWRncHVfdnJhbV9tZ3JfaW5pdChhZGV2KTsKIAlpZiAocikg
ewpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYyBiL2RyaXZlcnMvZ3B1
L2RybS90dG0vdHRtX3R0LmMKaW5kZXggZTJiMWU2YzUzYTA0Li45ODUxNGFiYWE5MzkgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3R0bS90dG1fdHQuYwpAQCAtNTIsOSArNTIsNiBAQCBpbnQgdHRtX3R0X2NyZWF0ZShzdHJ1Y3Qg
dHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29sIHplcm9fYWxsb2MpCiAJaWYgKGJvLT50dG0pCiAJ
CXJldHVybiAwOwogCi0JaWYgKGJkZXYtPm5vX3JldHJ5KQotCQlwYWdlX2ZsYWdzIHw9IFRUTV9Q
QUdFX0ZMQUdfTk9fUkVUUlk7Ci0KIAlzd2l0Y2ggKGJvLT50eXBlKSB7CiAJY2FzZSB0dG1fYm9f
dHlwZV9kZXZpY2U6CiAJCWlmICh6ZXJvX2FsbG9jKQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0v
dHRtL3R0bV9kZXZpY2UuaCBiL2luY2x1ZGUvZHJtL3R0bS90dG1fZGV2aWNlLmgKaW5kZXggYmZj
NmRkODdmMmQzLi5lMGViYTM2YzEzMDkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL3R0bS90dG1f
ZGV2aWNlLmgKKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0bV9kZXZpY2UuaApAQCAtMzI2LDggKzMy
Niw2IEBAIHN0cnVjdCB0dG1fZGV2aWNlIHsKIAkgKi8KIAogCXN0cnVjdCBkZWxheWVkX3dvcmsg
d3E7Ci0KLQlib29sIG5vX3JldHJ5OwogfTsKIAogc3RhdGljIGlubGluZSBzdHJ1Y3QgdHRtX3Jl
c291cmNlX21hbmFnZXIgKgotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
