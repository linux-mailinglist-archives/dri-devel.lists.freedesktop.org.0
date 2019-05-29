Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E982DCE6
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 14:27:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522836E2E9;
	Wed, 29 May 2019 12:27:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A6626E2E9;
 Wed, 29 May 2019 12:27:12 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id w13so1611276wru.11;
 Wed, 29 May 2019 05:27:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=umyXuDR53f1nBsw8g5vLHeO2PpIHOdpaKepmHNteqV8=;
 b=gLfBKz4ObyTZR8yveOC2WmzJQopbQgud6NKilipohyOMJI/lof46+zTVLxzh/i+a4U
 2/U7VfSXbpG09pI9pegr1hyIkm71vOGxndfwlNNWQshu1/PLhC3XxCGMIX5B6GZTLje2
 auB7U4RvmIp1t29sNC7WZcLokro+BSV0KtBKfQb5zSJeMOjtu54VQEMiHo6FL25VSRPm
 XwnBhqhbLdoKJoyKLzOELjFJzzVJV6OBz/5oiBSqMzOqcT32CmAiyJNiiBEp0S19+Nmw
 gZ+/7Xod7eGNp77qqA64Es1aiRnyvbnxpRIkSRMg9brbvsPfDUvKUALq/WCvDOzYlYQn
 O8Hw==
X-Gm-Message-State: APjAAAX19I23Ysz5OCQlC4hPqrs+Tu2akQ+kO4H4fgG1CWWctwVV7omk
 4ysPl8ZwBJvgc79za/CR48ZWes5k
X-Google-Smtp-Source: APXvYqw4LIzA1GUe/Apm/u0XVbXweOcZVgdloINAemw3Fw39W7DF6a03xvjdk2t9yefm1v4RRr0NLA==
X-Received: by 2002:adf:e446:: with SMTP id t6mr7678299wrm.115.1559132830637; 
 Wed, 29 May 2019 05:27:10 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1ea:e785:ab1c:e514])
 by smtp.gmail.com with ESMTPSA id z25sm6211343wmi.5.2019.05.29.05.27.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 05:27:10 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH 09/10] drm/amdgpu: create GDS, GWS and OA in system domain
Date: Wed, 29 May 2019 14:27:01 +0200
Message-Id: <20190529122702.13035-9-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190529122702.13035-1-christian.koenig@amd.com>
References: <20190529122702.13035-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=umyXuDR53f1nBsw8g5vLHeO2PpIHOdpaKepmHNteqV8=;
 b=jy2MNbSdImcuzBurp9IYZYy1buEkjYgl3Ne+vdLDhDOBOmUAIY3mETzrplYALyNqwb
 kzfEXV5WpHQh9A40FKsWgXCILL7e8x6PI6excYpxSErryVEF2o1D0+yWEYJSXUts5gTe
 mdMhz6OntQFG+BuA7uBLtCoWTctgS//ej5zAmXgQ4B0SEBNAJ7CiQz3miDtOIkcEEAli
 OwKWpKJ03lJRoByHpQ+5QrUMXBysrn/xhT7KBMvibQOjo+BQO1cyJU2tomcobXOrrMBD
 6HhqYSWYjzyUi7p+E3anJFHy3194i0xzpilBblkL2Zq4iLUdhFahmXXdwP2VR7F0NAPO
 iQNw==
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
