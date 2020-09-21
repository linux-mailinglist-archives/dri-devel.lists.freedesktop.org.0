Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 446E32728FC
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 16:49:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBDB6E3CB;
	Mon, 21 Sep 2020 14:49:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D356E3CB
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 14:49:10 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id b79so13018327wmb.4
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Sep 2020 07:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xRUJd0COa+i3Aa6yqn5QA7E5WTZJ2f/R2EV6GUAkocs=;
 b=ltFpY/qSiSUJ+7a0g7m2inZlHs63u1nn2jP68Qc0wny2G7BxWnpbSd2wSSorxZw76i
 4kaWg6U+36hSWetbaXRfKx2jYk1VOTurjvH9qkKDO6vTrwEQhozcF1FXndiIzuxx9rks
 KMh159sutPS06wef37wCdueit0jMyJ/fqOO5WR6G3qb1l7t4sKgZT9MOfke0YMl7lXkl
 2k25wkUl82gkmXwkZejRg5ulw4X2gOQNacK7/dOXuUVAW/rQQD/5dvMZ97D5BGnZNauH
 2SfKPAYzuYfq2nPMmcILOp8xFuDWQoCQiZVPMaleuDJuc+GaZ41ZRSe0kJVocwUqzCej
 IULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRUJd0COa+i3Aa6yqn5QA7E5WTZJ2f/R2EV6GUAkocs=;
 b=Q7e9jfzm+2YwWByxZdbcLm/1hcScwQWxHIKaKaREwtsHYN3D6BmdltfBe4Ht5qljwc
 jFJY8MicjRSsjE+5OeYkSDrWH1Akz6DzH3Hin6xaNrVim7s1spz9Ew0ja8SD2pRn0fLo
 GI3sAn/Pwiw4vIBs8qOhgN3YRJcCQTcoEDeM7Kd/HqhNdOQ6wV9NRuW4h9ymdNX3J9og
 hL+0aw+/Vn0M5Nytr+gSEjOQ1fr0PYVl2bUI9V+kOlEpsXPkDq0futNtUGzyvwoIJtaR
 qz0jRKmUhcHpqJrn3rhSiLGfP9UJCr8cqhI7NBoenUIESeHT4bjhxdo+4C166+wtLbKy
 cfWQ==
X-Gm-Message-State: AOAM532uicjDU2dB6rPkeNIZBXCwyF/6vVO3l1U5vhQlwwHM7QC6UzV/
 mguQz94+ZSQ+Q9WJ+48XmMQkWQLDx/M=
X-Google-Smtp-Source: ABdhPJy4TIBEKz9Rbb+hjMw53O7hog7qwe040sqX5FeREfU+4VU6VsMEm+nzUfwKnguO5H7doRd8kA==
X-Received: by 2002:a1c:1d52:: with SMTP id d79mr43771wmd.82.1600699749070;
 Mon, 21 Sep 2020 07:49:09 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3482:3104:ab8c:3ac2])
 by smtp.gmail.com with ESMTPSA id i6sm23480992wra.1.2020.09.21.07.49.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Sep 2020 07:49:08 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, airlied@gmail.com, tzimmermann@suse.de,
 bskeggs@redhat.com, kraxel@redhat.com, airlied@redhat.com,
 sroland@vmware.com
Subject: [PATCH 11/11] drm/ttm: remove TTM_PL_FLAG_NO_EVICT
Date: Mon, 21 Sep 2020 16:48:56 +0200
Message-Id: <20200921144856.2797-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921144856.2797-1-christian.koenig@amd.com>
References: <20200921144856.2797-1-christian.koenig@amd.com>
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

Tm90IHVzZWQgYW55IG1vcmUuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJp
c3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyAg
ICB8IDExICsrKy0tLS0tLS0tCiBpbmNsdWRlL2RybS90dG0vdHRtX3BsYWNlbWVudC5oIHwgIDEg
LQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS90
dG0vdHRtX2JvLmMKaW5kZXggMWE0YjI1MDgzMzI2Li41NzM3YjNmYWUxYjMgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2JvLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm8uYwpAQCAtMTE4LDkgKzExOCw2IEBAIHN0YXRpYyB2b2lkIHR0bV9ib19hZGRfbWVtX3Rv
X2xydShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCWlmICghbGlzdF9lbXB0eSgmYm8t
PmxydSkgfHwgYm8tPnBpbl9jb3VudCkKIAkJcmV0dXJuOwogCi0JaWYgKG1lbS0+cGxhY2VtZW50
ICYgVFRNX1BMX0ZMQUdfTk9fRVZJQ1QpCi0JCXJldHVybjsKLQogCW1hbiA9IHR0bV9tYW5hZ2Vy
X3R5cGUoYmRldiwgbWVtLT5tZW1fdHlwZSk7CiAJbGlzdF9hZGRfdGFpbCgmYm8tPmxydSwgJm1h
bi0+bHJ1W2JvLT5wcmlvcml0eV0pOwogCkBAIC0xNjUsOCArMTYyLDcgQEAgdm9pZCB0dG1fYm9f
bW92ZV90b19scnVfdGFpbChzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCXR0bV9ib19k
ZWxfZnJvbV9scnUoYm8pOwogCXR0bV9ib19hZGRfbWVtX3RvX2xydShibywgJmJvLT5tZW0pOwog
Ci0JaWYgKGJ1bGsgJiYgIShiby0+bWVtLnBsYWNlbWVudCAmIFRUTV9QTF9GTEFHX05PX0VWSUNU
KSAmJgotCSAgICAhYm8tPnBpbl9jb3VudCkgeworCWlmIChidWxrICYmICFiby0+cGluX2NvdW50
KSB7CiAJCXN3aXRjaCAoYm8tPm1lbS5tZW1fdHlwZSkgewogCQljYXNlIFRUTV9QTF9UVDoKIAkJ
CXR0bV9ib19idWxrX21vdmVfc2V0X3BvcygmYnVsay0+dHRbYm8tPnByaW9yaXR5XSwgYm8pOwpA
QCAtNTQxLDEyICs1MzcsMTEgQEAgc3RhdGljIHZvaWQgdHRtX2JvX3JlbGVhc2Uoc3RydWN0IGty
ZWYgKmtyZWYpCiAJCXNwaW5fbG9jaygmdHRtX2JvX2dsb2IubHJ1X2xvY2spOwogCiAJCS8qCi0J
CSAqIE1ha2UgTk9fRVZJQ1QgYm9zIGltbWVkaWF0ZWx5IGF2YWlsYWJsZSB0bworCQkgKiBNYWtl
IHBpbm5lZCBib3MgaW1tZWRpYXRlbHkgYXZhaWxhYmxlIHRvCiAJCSAqIHNocmlua2Vycywgbm93
IHRoYXQgdGhleSBhcmUgcXVldWVkIGZvcgogCQkgKiBkZXN0cnVjdGlvbi4KIAkJICovCi0JCWlm
IChiby0+bWVtLnBsYWNlbWVudCAmIFRUTV9QTF9GTEFHX05PX0VWSUNUIHx8IGJvLT5waW5fY291
bnQpIHsKLQkJCWJvLT5tZW0ucGxhY2VtZW50ICY9IH5UVE1fUExfRkxBR19OT19FVklDVDsKKwkJ
aWYgKGJvLT5waW5fY291bnQpIHsKIAkJCWJvLT5waW5fY291bnQgPSAwOwogCQkJdHRtX2JvX2Rl
bF9mcm9tX2xydShibyk7CiAJCQl0dG1fYm9fYWRkX21lbV90b19scnUoYm8sICZiby0+bWVtKTsK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL3R0bS90dG1fcGxhY2VtZW50LmggYi9pbmNsdWRlL2Ry
bS90dG0vdHRtX3BsYWNlbWVudC5oCmluZGV4IGQ0MDIyNjU1ZWFlNC4uNTBlNzJkZjQ4YjhkIDEw
MDY0NAotLS0gYS9pbmNsdWRlL2RybS90dG0vdHRtX3BsYWNlbWVudC5oCisrKyBiL2luY2x1ZGUv
ZHJtL3R0bS90dG1fcGxhY2VtZW50LmgKQEAgLTU4LDcgKzU4LDYgQEAKICNkZWZpbmUgVFRNX1BM
X0ZMQUdfVU5DQUNIRUQgICAgKDEgPDwgMTcpCiAjZGVmaW5lIFRUTV9QTF9GTEFHX1dDICAgICAg
ICAgICgxIDw8IDE4KQogI2RlZmluZSBUVE1fUExfRkxBR19DT05USUdVT1VTICAoMSA8PCAxOSkK
LSNkZWZpbmUgVFRNX1BMX0ZMQUdfTk9fRVZJQ1QgICAgKDEgPDwgMjEpCiAjZGVmaW5lIFRUTV9Q
TF9GTEFHX1RPUERPV04gICAgICgxIDw8IDIyKQogCiAjZGVmaW5lIFRUTV9QTF9NQVNLX0NBQ0hJ
TkcgICAgIChUVE1fUExfRkxBR19DQUNIRUQgfCBcCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
