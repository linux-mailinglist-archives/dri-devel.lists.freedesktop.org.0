Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A67A9155EDB
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 20:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E51A6FD7E;
	Fri,  7 Feb 2020 19:51:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3A86FD76;
 Fri,  7 Feb 2020 19:51:14 +0000 (UTC)
Received: by mail-qk1-x743.google.com with SMTP id w25so295375qki.3;
 Fri, 07 Feb 2020 11:51:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2qKi2lMG7T9Nkk9ZgGR9r/+oG5C3/NSCAfrSVeq2qn4=;
 b=nP4jpFrna4hHdMCSIT0uPqpJcp6KJfk/DccXLChd1AfhNYT1PfS/yLGFIVNTNO5Dbe
 dT1mhSBV1WCFIsjnNvcvQQm8s0Pnd3If4xZJDSQi/p3mXP8hos6tByqSqfOOUqJc68jq
 IZqpSJmuOKYe/fiiUX5osygb+s0FXZM6iu4LK/xyDqEWxhpAooQQ4WuYYjasOvAIz11r
 /f0VSfZFC+exDpbEp9+VcQ3oGs37OWKbXy/md67KV5FlU8M8lWGcErfIYfWXbweOupna
 0GtECSxWuTLel/4YXcC1heUNrTNhWk2z3iwGKuFUI42V9Kn1IeAMNT5WRYue8M1VGM4K
 Lwag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2qKi2lMG7T9Nkk9ZgGR9r/+oG5C3/NSCAfrSVeq2qn4=;
 b=dQLacq//ivqieSRkBg/7jGWOCxbPajuFOSwuY8EkxROA6hnZ1BcP7MmywMtsTmhS14
 fr9veGEuOZ2U9doPJfeWIVl8cf7YTUWIijJvTI8cvFE9sFT8+HVBGajO6imbY/pHxy7+
 aaZtWUMedDBw3bhQ9QQdBJABUXQGrn4AHijcCJD586SfkZ5/8RBDUVcOEQ0NCBDFaM6Z
 bRm5GPMqeCXPObkWK4R5tUiGTF+g4F06Pyub822L7VMorQlIvrhKSSjr7RmAhiiUDmlh
 pjcsjBZ8qplkK79GXVWmB5sg7jV4LrxBVQl6ESw/dCxpzyICLfWcLyq1jlRvK8RY7qXN
 GyKg==
X-Gm-Message-State: APjAAAV61Bbu7iXsT4R7kQOPv7jRcSaIxa7uAiDNfHUh2MUvlHtldSmW
 3JRCEJHh92UqA31/8ECumWQH4gSp
X-Google-Smtp-Source: APXvYqx43FPgLz7YLKSXUzgdqrHaIklpE7bqFk4ve1VwIs4rirwY+slOnoW7EnasL9Wlr663gHMopA==
X-Received: by 2002:a37:a915:: with SMTP id s21mr545009qke.112.1581105073417; 
 Fri, 07 Feb 2020 11:51:13 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:13 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 08/15] drm/amdgpu/firmware: move debugfs init into core amdgpu
 debugfs
Date: Fri,  7 Feb 2020 14:50:51 -0500
Message-Id: <20200207195058.2354-9-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gcmVtb3ZlIHRoZSBsb2FkIGFuZCB1bmxvYWQgZHJtIGNhbGxiYWNrcywKd2Ug
bmVlZCB0byByZW9yZGVyIHRoZSBpbml0IHNlcXVlbmNlIHRvIG1vdmUgYWxsIHRoZSBkcm0KZGVi
dWdmcyBmaWxlIGhhbmRsaW5nLiAgRG8gdGhpcyBmb3IgZmlybXdhcmUuCgpBY2tlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBB
bGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyB8IDQgKysrKwogZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5jICB8IDQgLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKaW5kZXggNzcyMWYxNDE2Y2RiLi41YmY0M2YyMGVjMzAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RlYnVnZnMuYwpAQCAtMTI1Niw2
ICsxMjU2LDEwIEBAIGludCBhbWRncHVfZGVidWdmc19pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNl
ICphZGV2KQogCWlmIChyKQogCQlEUk1fRVJST1IoInJlZ2lzdGVyaW5nIHJlZ2lzdGVyIGRlYnVn
ZnMgZmFpbGVkICglZCkuXG4iLCByKTsKIAorCXIgPSBhbWRncHVfZGVidWdmc19maXJtd2FyZV9p
bml0KGFkZXYpOworCWlmIChyKQorCQlEUk1fRVJST1IoInJlZ2lzdGVyaW5nIGZpcm13YXJlIGRl
YnVnZnMgZmFpbGVkICglZCkuXG4iLCByKTsKKwogCXJldHVybiBhbWRncHVfZGVidWdmc19hZGRf
ZmlsZXMoYWRldiwgYW1kZ3B1X2RlYnVnZnNfbGlzdCwKIAkJCQkJQVJSQVlfU0laRShhbWRncHVf
ZGVidWdmc19saXN0KSk7CiB9CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2
aWNlLmMKaW5kZXggM2VjOTVjMTFlNzQ4Li41YWRmOTM2Y2Y3MzMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTMxMjMsMTAgKzMxMjMsNiBAQCBpbnQg
YW1kZ3B1X2RldmljZV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogCX0gZWxzZQog
CQlhZGV2LT51Y29kZV9zeXNmc19lbiA9IHRydWU7CiAKLQlyID0gYW1kZ3B1X2RlYnVnZnNfZmly
bXdhcmVfaW5pdChhZGV2KTsKLQlpZiAocikKLQkJRFJNX0VSUk9SKCJyZWdpc3RlcmluZyBmaXJt
d2FyZSBkZWJ1Z2ZzIGZhaWxlZCAoJWQpLlxuIiwgcik7Ci0KIAlyID0gYW1kZ3B1X2RlYnVnZnNf
aW5pdChhZGV2KTsKIAlpZiAocikKIAkJRFJNX0VSUk9SKCJDcmVhdGluZyBkZWJ1Z2ZzIGZpbGVz
IGZhaWxlZCAoJWQpLlxuIiwgcik7Ci0tIAoyLjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
