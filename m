Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0CC26434
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 15:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0014789A5C;
	Wed, 22 May 2019 13:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C10B6899B7;
 Wed, 22 May 2019 12:59:57 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id f10so2193572wre.7;
 Wed, 22 May 2019 05:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umyXuDR53f1nBsw8g5vLHeO2PpIHOdpaKepmHNteqV8=;
 b=peUvu/pgc4irj66N3P88DodTxNaPzq94x0NGKcOlJDhy++uaN0Y7kh3hq1XYg+yBYo
 zeAnv5ZwofHHlfdtzcC4jWxpkcaAfBwoxD2NDORFfrZtndqCL2zHqF9NhEA5T2zbs1c3
 /0rfYYHX6VOa3sRpChP1sw1Tmexh1c/vAacN3c+86GGaWr7gA1yJ0iE1J7z3WBwSEc33
 8we519q1yKHQmjCr4wOHSyGN7w75xu42eigcH1rhornaYMQF0YIjhA9QiuBeBEKU4CCq
 c7tNZfC4OUMbatqQSV07SX9+RmYoyXRTOS8Qf7hl9q9iQ90ETS0RhJpAZ9JYFl5sTruh
 aybw==
X-Gm-Message-State: APjAAAUUbUZmx2mpFf0zvg8aG3SrmxQsm9liaFC8xd2g2t18G8D1C6ZI
 19LYEi9oxYwv6VUZ1Nr3xaCO5SjC
X-Google-Smtp-Source: APXvYqyN5BORV1I5dnBMKbTfdmCoKxrLikysVyxNg3G5NfqZImkx/OowbClJvRoOSGsxeyRlIo6uGQ==
X-Received: by 2002:adf:9794:: with SMTP id s20mr41973968wrb.104.1558529996389; 
 Wed, 22 May 2019 05:59:56 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b94a:dfe1:fb43:c858])
 by smtp.gmail.com with ESMTPSA id 197sm9723523wma.36.2019.05.22.05.59.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 22 May 2019 05:59:55 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/10] drm/amdgpu: create GDS, GWS and OA in system domain
Date: Wed, 22 May 2019 14:59:46 +0200
Message-Id: <20190522125947.4592-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190522125947.4592-1-christian.koenig@amd.com>
References: <20190522125947.4592-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=umyXuDR53f1nBsw8g5vLHeO2PpIHOdpaKepmHNteqV8=;
 b=G/yiotPW8tuTXNFnGo4AArw1pF6BZ88El/x/AO/o2fi+NY1XmiBOWStzGZqFvF3zZa
 avxxIFQBRS2yw9heVSo+P/oULYiPEXUVpOa6AMn18VcZVjKQnjnlhx2JY3SHzhE2WLoV
 EefyVwlvaXfAr/BrhCVf/ifRW8b4zTIYLn54Q7oNQdpxin35Ck8U+j/4uLIL4BmMdpW/
 AAhBTKNrYIomumMPa/SAHo0guD9zKfTll+ggU85dY2IyITEMoZmOyrOkdTohWC9PabA4
 boxQgEOUMW+RdzRs6kuNkyxlHrVsQZMf9ZPnHQy1isSZNIktKDKPISj1rUXPpxxSdL4t
 Geww==
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
