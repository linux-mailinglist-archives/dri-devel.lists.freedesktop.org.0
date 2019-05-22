Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E7326422
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 15:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBA8898FD;
	Wed, 22 May 2019 12:59:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9065B897FF;
 Wed, 22 May 2019 12:59:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id 15so2111232wmg.5;
 Wed, 22 May 2019 05:59:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jq8eCDm7hHzYcz/NTklaD2AjPc+iD+A7w7cUO/mlO7A=;
 b=rT05p9y5klQGxO8kDNAYUTxr5s/7OQa7nMdFUi8d2v5qyRLIlHPrHwjT0SELpAbxri
 hWF0EJYselk9s1poA4FkX5ik1DH/to0tyw56mDpf15gLspO7QMPhutYO49y+TAR32wOo
 Vht2O+W8lL6JKvDzEgtDwGz/Ba2QnW+YbAORg8GcUkxbNW+PUYG/e1PgK0yem3y4mo66
 AxWyu1ZZXt9wD6c7YYwTmajjlbNPfzVyNhFe0cWg3EGsYRPaAeyIrEiZ4q2mF00dX89W
 BiBNiWURwMr9nLSVyXejbIu/SMRRjk1SXmChSRJPYg57r7CKjaba7lbgrUrRO/dVtuUJ
 5Waw==
X-Gm-Message-State: APjAAAVrdliiqsasnTv6Vd11vMfll6K+tQaDTCU8Wm9LSd0aH++fS3bG
 PZcfGZb+TENgVM9ZHc/v2yw=
X-Google-Smtp-Source: APXvYqx5uxpf6zpF5I+UINrDvXj2qKZo3n8CG1WDyK2iKAVWEudItE1EmRhvrpgKQyuFLJ6Kz8IFgw==
X-Received: by 2002:a1c:8004:: with SMTP id b4mr7537819wmd.79.1558529991383;
 Wed, 22 May 2019 05:59:51 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b94a:dfe1:fb43:c858])
 by smtp.gmail.com with ESMTPSA id 197sm9723523wma.36.2019.05.22.05.59.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 05:59:50 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 03/10] drm/ttm: remove manual placement preference
Date: Wed, 22 May 2019 14:59:40 +0200
Message-Id: <20190522125947.4592-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522125947.4592-1-christian.koenig@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jq8eCDm7hHzYcz/NTklaD2AjPc+iD+A7w7cUO/mlO7A=;
 b=av3ZqD3mvqOp66Bsd+4FKEhvXkM0a4hvmwqgQhe3N7//+mXXOsmwpCmPLs1pMQ5C8Z
 x0enN5Rpk/k0BB1/Y8/b1H5GTqDFcPyadJ+RXefvYGPBEYei1irS8rysd9IMNGZLpCR8
 G0nDrZL05GyoHRlF2InNzYYVCuew+Gfg6xZ5/UbOMaWu7rbMlX2w+p4KehyGRo1KwI7v
 Ra55YvEEnKOFa8iI66o54JM+8elUb4X1EZfT2ARNDRV5VFCWRZGTJIqDMCfIOvoLX9ir
 aoZRiOWUGF/DtbaNvZWCgRWl5yE/3qjfclqPm4qIaGtkcR5RonQftB8Qg0FOTQz7zazO
 V6jw==
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
LmMKaW5kZXggNDMzNjg5M2NiMzVlLi5iMjk3OTlhZWRiNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYwpA
QCAtMTAxMSw4ICsxMDExLDEyIEBAIGludCB0dG1fYm9fbWVtX3NwYWNlKHN0cnVjdCB0dG1fYnVm
ZmVyX29iamVjdCAqYm8sCiAJCXR0bV9mbGFnX21hc2tlZCgmY3VyX2ZsYWdzLCBwbGFjZS0+Zmxh
Z3MsCiAJCQkJflRUTV9QTF9NQVNLX01FTVRZUEUpOwogCi0JCWlmIChtZW1fdHlwZSA9PSBUVE1f
UExfU1lTVEVNKQotCQkJYnJlYWs7CisJCWlmIChtZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNKSB7
CisJCQltZW0tPm1lbV90eXBlID0gbWVtX3R5cGU7CisJCQltZW0tPnBsYWNlbWVudCA9IGN1cl9m
bGFnczsKKwkJCW1lbS0+bW1fbm9kZSA9IE5VTEw7CisJCQlyZXR1cm4gMDsKKwkJfQogCiAJCXJl
dCA9ICgqbWFuLT5mdW5jLT5nZXRfbm9kZSkobWFuLCBibywgcGxhY2UsIG1lbSk7CiAJCWlmICh1
bmxpa2VseShyZXQpKQpAQCAtMTAyNCwxNiArMTAyOCwxMiBAQCBpbnQgdHRtX2JvX21lbV9zcGFj
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
