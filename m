Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B0C33C69A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 20:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4CF8994D;
	Mon, 15 Mar 2021 19:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A7F8994D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 19:14:35 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id dm8so18674677edb.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 12:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3skR3uID52sXzIIaHY9dfHkbL7ycu0+IdADCwjmxtQ=;
 b=JQJjunW7N1QPe4ViIKcilKyn+SZXn6HcZbMrR8bRcmYG7gIFpnVquNyDJ+pj1fgkg3
 rF4v0y0DIQROVe9vSGnrDqjKajiwqX2T3NB36f3IGEn6qQLjIO4xO4hQDdI6RvBdf1kf
 Nq5xklQ7irGOJbd5JYLA0wRR2uvDcVh/v7lGZEatabEGtn0s5kqz8wmHxAe7eyHm+U6l
 9fP7jINJwiVXogCS+pKe9CnVbsyKyo79z05We7QwXxZXZnOmm97T4jwQ1q6qO3m8/Nnc
 SfiusqyAzUrfPi/MYIisNLy71bWLKXMtz5UNdwoT596810basChHhL5KQkxcHTW8NaWD
 rS6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3skR3uID52sXzIIaHY9dfHkbL7ycu0+IdADCwjmxtQ=;
 b=OWLpbEGM3mtYDxKAimYQY5OkVujEaFfG0udSTyGQ678b/BLlRJDclGp5nYshy6CcYz
 eJAyDfJ2qtJ7+i2v19mrOWtYgYyXH2bN6WdXbdcLAe/z4RSeY28fkkWAp91q8Dc9E1I+
 KvHjhXUIlinBGcr7Kgc5F8pucVVVru8t71Uyyu5JsUaMY/A0RgOaop4wVuhiOiWptdZv
 90JfzNJNmAjRk3E1lQxEmJBy5qZQcTSmDEqNCN+vwdo3ZWaeCz8XlC4hEccf3Gm3xMW3
 S3sYC+THWXolojxvWv7+hGMsZEwY19JNjHOgYD1UwkUXhNZM6+35TT4d7SBTe7Kfxtab
 Yh3Q==
X-Gm-Message-State: AOAM532hj/Z2CXoFLjNCajgg1ehCXx7MLsOI/Vacro31uXTlUZ8BZKY0
 zqZXA0/XFdJ59myFeQ1ppiHQIu9H0ig=
X-Google-Smtp-Source: ABdhPJw7Zq8+xudVA0I1Jhn6A2KG06am9gTcH5F/khmE21daUJaDEk6GXyuALE3KtEbnnl7Ibcv8pQ==
X-Received: by 2002:aa7:c4cc:: with SMTP id p12mr30958597edr.325.1615835674102; 
 Mon, 15 Mar 2021 12:14:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:dffe:4819:8ad9:f8bd])
 by smtp.gmail.com with ESMTPSA id bi26sm7977504ejb.120.2021.03.15.12.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 12:14:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/qxl: clean up qxl_bo_move_notify
Date: Mon, 15 Mar 2021 20:14:30 +0100
Message-Id: <20210315191432.153826-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

UmVtb3ZlIHRoZSB1bnVzZWQgZXZpY3QgcGFyYW1ldGVyIGFuZCBkcm9wIHN3YXBwaW5nIGJvLT5t
ZW0uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRtLmMgfCAxNiArKysrLS0tLS0t
LS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYyBiL2RyaXZlcnMvZ3B1
L2RybS9xeGwvcXhsX3R0bS5jCmluZGV4IGI3Zjc3ZWI2ODVjYi4uNDdhZmU5NWQwNGExIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF90dG0uYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vcXhsL3F4bF90dG0uYwpAQCAtMTIxLDcgKzEyMSw2IEBAIHN0YXRpYyBzdHJ1Y3QgdHRtX3R0
ICpxeGxfdHRtX3R0X2NyZWF0ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogfQogCiBz
dGF0aWMgdm9pZCBxeGxfYm9fbW92ZV9ub3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKLQkJCSAgICAgICBib29sIGV2aWN0LAogCQkJICAgICAgIHN0cnVjdCB0dG1fcmVzb3VyY2Ug
Km5ld19tZW0pCiB7CiAJc3RydWN0IHF4bF9ibyAqcWJvOwpAQCAtMTQ0LDI5ICsxNDMsMjIgQEAg
c3RhdGljIGludCBxeGxfYm9fbW92ZShzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLCBib29s
IGV2aWN0LAogCXN0cnVjdCB0dG1fcmVzb3VyY2UgKm9sZF9tZW0gPSAmYm8tPm1lbTsKIAlpbnQg
cmV0OwogCi0JcXhsX2JvX21vdmVfbm90aWZ5KGJvLCBldmljdCwgbmV3X21lbSk7CisJcXhsX2Jv
X21vdmVfbm90aWZ5KGJvLCBuZXdfbWVtKTsKIAogCXJldCA9IHR0bV9ib193YWl0X2N0eChibywg
Y3R4KTsKIAlpZiAocmV0KQotCQlnb3RvIG91dDsKKwkJcmV0dXJuIHJldDsKIAogCWlmIChvbGRf
bWVtLT5tZW1fdHlwZSA9PSBUVE1fUExfU1lTVEVNICYmIGJvLT50dG0gPT0gTlVMTCkgewogCQl0
dG1fYm9fbW92ZV9udWxsKGJvLCBuZXdfbWVtKTsKIAkJcmV0dXJuIDA7CiAJfQotCXJldCA9IHR0
bV9ib19tb3ZlX21lbWNweShibywgY3R4LCBuZXdfbWVtKTsKLW91dDoKLQlpZiAocmV0KSB7Ci0J
CXN3YXAoKm5ld19tZW0sIGJvLT5tZW0pOwotCQlxeGxfYm9fbW92ZV9ub3RpZnkoYm8sIGZhbHNl
LCBuZXdfbWVtKTsKLQkJc3dhcCgqbmV3X21lbSwgYm8tPm1lbSk7Ci0JfQotCXJldHVybiByZXQ7
CisJcmV0dXJuIHR0bV9ib19tb3ZlX21lbWNweShibywgY3R4LCBuZXdfbWVtKTsKIH0KIAogc3Rh
dGljIHZvaWQgcXhsX2JvX2RlbGV0ZV9tZW1fbm90aWZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVj
dCAqYm8pCiB7Ci0JcXhsX2JvX21vdmVfbm90aWZ5KGJvLCBmYWxzZSwgTlVMTCk7CisJcXhsX2Jv
X21vdmVfbm90aWZ5KGJvLCBOVUxMKTsKIH0KIAogc3RhdGljIHN0cnVjdCB0dG1fZGV2aWNlX2Z1
bmNzIHF4bF9ib19kcml2ZXIgPSB7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
