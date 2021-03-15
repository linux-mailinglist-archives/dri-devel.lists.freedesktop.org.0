Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 033BC33C699
	for <lists+dri-devel@lfdr.de>; Mon, 15 Mar 2021 20:14:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC698899D5;
	Mon, 15 Mar 2021 19:14:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5968994D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 19:14:36 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id ox4so52549408ejb.11
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Mar 2021 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WMPOtCBxs2H9TjKbXHVExhNj7fMc+PCRUAafVs4cBgM=;
 b=qgwln9JyK+Owsb4/5RhNAlZdiQ9fRvmj/L2LeQYNnqjDOk8N2+DU94fZeERA14GJqz
 nyWUlbI6eTR9j3tdMbORBbW2qqFECekF7Khf99gGkZeiBD7Z7j61X6v1IRIjVICYsYGq
 dLb2ArcuzRTN6FeYaitQOGGEHu3WpbRv6dpsbLS00LFmn0+Eftcvs0YxqF2Nb4reXhSV
 0sxMixwIvfqO7HA8Jon0NpKwLERLSXl75PfS4zC7r6bt64vefjNOK2FsWMI54o8w6pmy
 GwFkbFQR6bq5dV3fs4g0Kf2icz8ELakOvD6wnpNU7VsrReP7IhipytYUoAp/gTPNnGUH
 2DNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WMPOtCBxs2H9TjKbXHVExhNj7fMc+PCRUAafVs4cBgM=;
 b=XTQfJPW65zf+pMy97fTjA/X1xIe21svqtyxXF3Ai/zIaRaRV/bh6Pc5xO3liKzc++5
 vapRhoumHa5qzI9oUIEed8uqEnhmnFh+FwMqCRpnplXSJa8CCyqDyoD6lM/SkDfyMCOD
 hLIKhwHjl7BfeeNJwYFluXbLqSzFuHHvQ26qePpG1c4WOPILWH03Wx0WyRPyu1s0NoTc
 I1rcRpmbuyBrtG4WulGq6aqVdgj66PrGk08ZV/y8MstE9kBXGOHs+wS16OwY+PhuQaBQ
 WOsGcJK3Ip0Z6DMQAxn/jZnbml56OkiDIVJZQ5jlOWmYZulOas2phEixrZUCVUeDrUYl
 gifg==
X-Gm-Message-State: AOAM5338uHnYHt6F3m4s8LSIzHLHAEsMQHGeq4/W9B6gred/z5eOR2cc
 eFBo02tsOWy4+0SPvyTLJwMRJwiU7N8=
X-Google-Smtp-Source: ABdhPJzlfFkfxjFDXKJX6Ldvk7Z7KKf1Lg/R9RCBScYmwBoYgmr1pM6j8yW20mpOLBeSY6MlndAMPw==
X-Received: by 2002:a17:907:94c3:: with SMTP id
 dn3mr25578825ejc.280.1615835674897; 
 Mon, 15 Mar 2021 12:14:34 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:dffe:4819:8ad9:f8bd])
 by smtp.gmail.com with ESMTPSA id bi26sm7977504ejb.120.2021.03.15.12.14.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 12:14:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/3] drm/nouveau: clean up nouveau_bo_move_ntfy
Date: Mon, 15 Mar 2021 20:14:31 +0100
Message-Id: <20210315191432.153826-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210315191432.153826-1-christian.koenig@amd.com>
References: <20210315191432.153826-1-christian.koenig@amd.com>
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

SnVzdCBhbm90aGVyIGxlZnRvdmVyIGZyb20gYSBUVE0gY2xlYW51cC4KClNpZ25lZC1vZmYtYnk6
IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgfCAxMyArKysrKy0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfYm8uYwppbmRleCBjYTJhOGFlMTkzOGUuLjliYjhjZWUzZGY0MCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtODYxLDkgKzg2MSw4IEBAIG5vdXZlYXVf
Ym9fbW92ZV9pbml0KHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtKQogCU5WX0lORk8oZHJtLCAiTU06
IHVzaW5nICVzIGZvciBidWZmZXIgY29waWVzXG4iLCBuYW1lKTsKIH0KIAotc3RhdGljIHZvaWQK
LW5vdXZlYXVfYm9fbW92ZV9udGZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wg
ZXZpY3QsCi0JCSAgICAgc3RydWN0IHR0bV9yZXNvdXJjZSAqbmV3X3JlZykKK3N0YXRpYyB2b2lk
IG5vdXZlYXVfYm9fbW92ZV9udGZ5KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCisJCQkJ
IHN0cnVjdCB0dG1fcmVzb3VyY2UgKm5ld19yZWcpCiB7CiAJc3RydWN0IG5vdXZlYXVfbWVtICpt
ZW0gPSBuZXdfcmVnID8gbm91dmVhdV9tZW0obmV3X3JlZykgOiBOVUxMOwogCXN0cnVjdCBub3V2
ZWF1X2JvICpudmJvID0gbm91dmVhdV9ibyhibyk7CkBAIC05NDksNyArOTQ4LDcgQEAgbm91dmVh
dV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sIGJvb2wgZXZpY3QsCiAJCQly
ZXR1cm4gcmV0OwogCX0KIAotCW5vdXZlYXVfYm9fbW92ZV9udGZ5KGJvLCBldmljdCwgbmV3X3Jl
Zyk7CisJbm91dmVhdV9ib19tb3ZlX250ZnkoYm8sIG5ld19yZWcpOwogCXJldCA9IHR0bV9ib193
YWl0X2N0eChibywgY3R4KTsKIAlpZiAocmV0KQogCQlnb3RvIG91dF9udGZ5OwpAQCAtMTAxNCw5
ICsxMDEzLDcgQEAgbm91dmVhdV9ib19tb3ZlKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8s
IGJvb2wgZXZpY3QsCiAJfQogb3V0X250Znk6CiAJaWYgKHJldCkgewotCQlzd2FwKCpuZXdfcmVn
LCBiby0+bWVtKTsKLQkJbm91dmVhdV9ib19tb3ZlX250ZnkoYm8sIGZhbHNlLCBuZXdfcmVnKTsK
LQkJc3dhcCgqbmV3X3JlZywgYm8tPm1lbSk7CisJCW5vdXZlYXVfYm9fbW92ZV9udGZ5KGJvLCAm
Ym8tPm1lbSk7CiAJfQogCXJldHVybiByZXQ7CiB9CkBAIC0xMjkwLDcgKzEyODcsNyBAQCBub3V2
ZWF1X2JvX2ZlbmNlKHN0cnVjdCBub3V2ZWF1X2JvICpudmJvLCBzdHJ1Y3Qgbm91dmVhdV9mZW5j
ZSAqZmVuY2UsIGJvb2wgZXhjbAogc3RhdGljIHZvaWQKIG5vdXZlYXVfYm9fZGVsZXRlX21lbV9u
b3RpZnkoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibykKIHsKLQlub3V2ZWF1X2JvX21vdmVf
bnRmeShibywgZmFsc2UsIE5VTEwpOworCW5vdXZlYXVfYm9fbW92ZV9udGZ5KGJvLCBOVUxMKTsK
IH0KIAogc3RydWN0IHR0bV9kZXZpY2VfZnVuY3Mgbm91dmVhdV9ib19kcml2ZXIgPSB7Ci0tIAoy
LjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
