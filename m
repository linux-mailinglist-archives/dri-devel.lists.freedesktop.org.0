Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2032CBD8
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 18:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C833E6E247;
	Tue, 28 May 2019 16:26:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7FA6E237;
 Tue, 28 May 2019 16:26:09 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id w9so3588260wmi.0;
 Tue, 28 May 2019 09:26:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umyXuDR53f1nBsw8g5vLHeO2PpIHOdpaKepmHNteqV8=;
 b=uculbr+KqMFxkbKYi5NGfO/j8znCD/fdbcf7wW5zQ1vQDaYmwTluqVDelYGFSgErud
 1InOqIBrNLw+7FfrEVMLbhqh4TPtMVFs/Zinmq43QNoMj7F794Y+Al8WnGBxojglNVNv
 WoSYk138fDS1zpav2UHU7i8HC2N9gJSzZ6sDUef7bIuwtac7PUTx2TkwkMO9P73Qfb51
 85+3TDOa8+MjmmafSzLb9RpT26odp26K6Xnw7q0sG2CQ4ULVRJu8YAK42Xt8MM9/oHMo
 6U9ApFRk9Kx5NwX+cxJ9esYt0GvHXSFmCfFV338B9WA/HkoaHyqDQKPoREeeNjx3AdIO
 R5+A==
X-Gm-Message-State: APjAAAU7OBpsgtLMIdbs899kn0us1bF8+5Ovrq6VPGoEnOq61YOhNp8z
 qexw5HFvUlILmoVZCo3zYhLFoawT
X-Google-Smtp-Source: APXvYqypZiFOs3mYlZdSMdrQoLu4gJ//CFoKn9L30SrUFf9Cx8CJN9RVjaFH4sJaUQtFS9hjiDd7fA==
X-Received: by 2002:a1c:f507:: with SMTP id t7mr3806213wmh.149.1559060767315; 
 Tue, 28 May 2019 09:26:07 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:3163:ab92:73d9:6693])
 by smtp.gmail.com with ESMTPSA id f10sm28835470wrg.24.2019.05.28.09.26.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 09:26:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: David1.Zhou@amd.com, Marek.Olsak@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/10] drm/amdgpu: create GDS, GWS and OA in system domain
Date: Tue, 28 May 2019 18:25:56 +0200
Message-Id: <20190528162557.1280-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190528162557.1280-1-christian.koenig@amd.com>
References: <20190528162557.1280-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=umyXuDR53f1nBsw8g5vLHeO2PpIHOdpaKepmHNteqV8=;
 b=GahPXCyJhO4YYTOwzhVuNQdM0887TnbvMAgRtMJacfARFE4w37UoFNokUq2fNj28Qp
 I8WpXltKGKLfnEMgy5IAjUGFjLD4h/93mMXqPRDOhmJpb1rv6libmH4INcMx+FrAyWrw
 FdfPYfIVRyVVlOpjiaRklwMMnedJsC82fFk8cZ54Pm+XHisCBdry5KpbIXGE/fPBqrfb
 DBhIyCnMa818cVxlolvxXxYM0kqNFOJ927qPMBYD8tN85OkXnUhaqDnP3/UPk5k5tbiQ
 qgnCTZDqRiEtZxTmxrTdPPgqrXbC/MY9e9GBlJVDOs/X2ULoEt11JfTw2HHkov3JsYLe
 9/0Q==
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

QW5kIG9ubHkgbW92ZSB0aGVtIGluIG9uIHZhbGlkYXRpb24uIFRoaXMgYWxsb3dzIGZvciBiZXR0
ZXIgY29udHJvbAp3aGVuIG11bHRpcGxlIHByb2Nlc3NlcyBhcmUgZmlnaHRpbmcgb3ZlciB0aG9z
ZSByZXNvdXJjZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4u
a29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29i
amVjdC5jIHwgNiArKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVf
b2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKaW5k
ZXggOTNiMmM1YTQ4YTcxLi4zMDQ5MzQyOTg1MWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfb2JqZWN0LmMKQEAgLTQ5NSw3ICs0OTUsMTEgQEAgc3RhdGljIGludCBhbWRn
cHVfYm9fZG9fY3JlYXRlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogI2VuZGlmCiAKIAli
by0+dGJvLmJkZXYgPSAmYWRldi0+bW1hbi5iZGV2OwotCWFtZGdwdV9ib19wbGFjZW1lbnRfZnJv
bV9kb21haW4oYm8sIGJwLT5kb21haW4pOworCWlmIChicC0+ZG9tYWluICYgKEFNREdQVV9HRU1f
RE9NQUlOX0dXUyB8IEFNREdQVV9HRU1fRE9NQUlOX09BIHwKKwkJCSAgQU1ER1BVX0dFTV9ET01B
SU5fR0RTKSkKKwkJYW1kZ3B1X2JvX3BsYWNlbWVudF9mcm9tX2RvbWFpbihibywgQU1ER1BVX0dF
TV9ET01BSU5fQ1BVKTsKKwllbHNlCisJCWFtZGdwdV9ib19wbGFjZW1lbnRfZnJvbV9kb21haW4o
Ym8sIGJwLT5kb21haW4pOwogCWlmIChicC0+dHlwZSA9PSB0dG1fYm9fdHlwZV9rZXJuZWwpCiAJ
CWJvLT50Ym8ucHJpb3JpdHkgPSAxOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
