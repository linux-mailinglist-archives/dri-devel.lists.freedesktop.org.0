Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627382DCD7
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 14:27:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220706E2EF;
	Wed, 29 May 2019 12:27:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D685A6E0FD;
 Wed, 29 May 2019 12:27:06 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id l17so1619699wrm.10;
 Wed, 29 May 2019 05:27:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H1DBpie83K6hVXAyMME3hPzCU6uC+f31L+bIwmOxc8A=;
 b=eQIkGCWTDmrnDxGdm8k+QKSd8Di1CihqUhNv+57U2tzBckyWu6+UAnxO7W8PgCCH/l
 SjYGI+M6inIAaDIqC2sGU4b3ABppW1n9rGGv5GNCARAfAM6e33gnfFZ3zpGJAAyzX24d
 m0EK4jKL5axVc6PXFC5gMwJwaSNepr2NTxw2MUum3btQgAsUcPfBnYJ0v0Oa835Ldl5p
 33vmdZWhzvBgMdE1o+PBfWueocq3jDAMueLtrC1lg7pVaNAO0L6lwce292KZPsGMuXO6
 VVRJNbg5OAZmw0+BIoJedb++VUC9zUvqf/u98haUHK5b157yhUysJ5gqnra3+JHrRnhP
 7epw==
X-Gm-Message-State: APjAAAWTptTXAbuwImdXP0RifKiZZUgbw2dtlTg8anfrOub6bVgEJuAj
 cGJuMZs+bljlwrlUqB9lVkucvrUs
X-Google-Smtp-Source: APXvYqyVUGjJ11XsXU2Wurtz0SAuGngrtxDTchFFCqMOCetXFEeCOl0rKfQENip+3cVZr0rsIdan1Q==
X-Received: by 2002:adf:e903:: with SMTP id f3mr2128884wrm.133.1559132825391; 
 Wed, 29 May 2019 05:27:05 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1ea:e785:ab1c:e514])
 by smtp.gmail.com with ESMTPSA id z25sm6211343wmi.5.2019.05.29.05.27.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 05:27:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/10] drm/ttm: remove manual placement preference
Date: Wed, 29 May 2019 14:26:55 +0200
Message-Id: <20190529122702.13035-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529122702.13035-1-christian.koenig@amd.com>
References: <20190529122702.13035-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H1DBpie83K6hVXAyMME3hPzCU6uC+f31L+bIwmOxc8A=;
 b=usSCJd8EzxcTdX+r+ShkBrPvCZ0nFL4dgwSWzD3O1ljeWHQnX/VVePsCA8Zk0HlvmO
 N1SI3HTgHihP4gRTyYcdeqqN9fCVZgoyQjDlXMBC5TSIDY2uOWFZ723kS3XN5TvpddUt
 BewvOzjJqCPvetCzBbrmwk2rjxXFoxk6aa8xDlYCNfKuwSmTCAkBPTUvHarT5AKwXX1h
 yye1/YNvQvksP2jeRt/SsvJ4U7uLPtZTzBJUF0F+bZDMWypejJEWG1dJsIusTPXWSMF1
 7FGm6QsVKGgmJuSrbkKKg/6UB1zwRElopwNSo0UcvD62LKF6E35uCL5+mgX9IKQGVHg5
 fvwg==
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

SWYgZHJpdmVycyBkb24ndCBwcmVmZXIgYSBzeXN0ZW0gbWVtb3J5IHBsYWNlbWVudAp0aGV5IHNo
b3VsZCBub3QgYnV0IGl0IGludG8gdGhlIHBsYWNlbWVudCBsaXN0IGZpcnN0LgoKU2lnbmVkLW9m
Zi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgfCAxOCArKysrKysrKystLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKaW5kZXggN2I1OWU1ZWNkZTdmLi43MDJjZDg5YWRiZjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpA
QCAtMTAxMiw4ICsxMDEyLDEyIEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCiAJCXR0bV9mbGFnX21hc2tlZCgmY3VyX2ZsYWdzLCBwbGFjZS0+Zmxh
Z3MsCiAJCQkJflRUTV9QTF9NQVNLX01FTVRZUEUpOwogCi0JCWlmIChtZW1fdHlwZSA9PSBUVE1f
UExfU1lTVEVNKQotCQkJYnJlYWs7CisJCWlmIChtZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7
CisJCQltZW0tPm1lbV90eXBlID0gbWVtX3R5cGU7CisJCQltZW0tPnBsYWNlbWVudCA9IGN1cl9m
bGFnczsKKwkJCW1lbS0+bW1fbm9kZSA9IE5VTEw7CisJCQlyZXR1cm4gMDsKKwkJfQogCiAJCXJl
dCA9ICgqbWFuLT5mdW5jLT5nZXRfbm9kZSkobWFuLCBibywgcGxhY2UsIG1lbSk7CiAJCWlmICh1
bmxpa2VseShyZXQpKQpAQCAtMTAyNSwxNiArMTAyOSwxMiBAQCBpbnQgdHRtX2JvX21lbV9zcGFj
ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCQkJCSgqbWFuLT5mdW5jLT5wdXRfbm9k
ZSkobWFuLCBtZW0pOwogCQkJCXJldHVybiByZXQ7CiAJCQl9Ci0JCQlicmVhazsKKwkJCW1lbS0+
bWVtX3R5cGUgPSBtZW1fdHlwZTsKKwkJCW1lbS0+cGxhY2VtZW50ID0gY3VyX2ZsYWdzOworCQkJ
cmV0dXJuIDA7CiAJCX0KIAl9CiAKLQlpZiAoKHR5cGVfb2sgJiYgKG1lbV90eXBlID09IFRUTV9Q
TF9TWVNURU0pKSB8fCBtZW0tPm1tX25vZGUpIHsKLQkJbWVtLT5tZW1fdHlwZSA9IG1lbV90eXBl
OwotCQltZW0tPnBsYWNlbWVudCA9IGN1cl9mbGFnczsKLQkJcmV0dXJuIDA7Ci0JfQotCiAJZm9y
IChpID0gMDsgaSA8IHBsYWNlbWVudC0+bnVtX2J1c3lfcGxhY2VtZW50OyArK2kpIHsKIAkJY29u
c3Qgc3RydWN0IHR0bV9wbGFjZSAqcGxhY2UgPSAmcGxhY2VtZW50LT5idXN5X3BsYWNlbWVudFtp
XTsKIAotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
