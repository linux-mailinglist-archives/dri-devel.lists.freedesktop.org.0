Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 279A91D49FD
	for <lists+dri-devel@lfdr.de>; Fri, 15 May 2020 11:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2CAD6EC39;
	Fri, 15 May 2020 09:54:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259046EC35;
 Fri, 15 May 2020 09:54:11 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id z72so1960682wmc.2;
 Fri, 15 May 2020 02:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LUExjU2XTxgqMjmujYynjDialW7+jMU42M0B+uiUV/Y=;
 b=X0h5Z+wnnFQqU6TpwFt8Qf61V+AHZDickaWHmnAHSyFr6KI8IhuKs62GnZReh6xCV8
 ssPiGBYonSSQhW9Yf314A6TlNm3al4GgLEoj2FOeRTYH2R71X8O/TxJG8rXALCBnRB3Q
 WH17mTvM/JpboS8M0vRzAfh8RVTJSoB6SMabBqdKwdCXB+TJQvh3XqDqxLcfUT0xUM1r
 RvcfI3NDRUW03mdCec7PK7rkZlPU8lNVeZ6SI7pZVkw+186zmPn3UFni5VmZUiXZDU2U
 Yllv1Nsgk17LvhbzjZDrRkfkGN/KY1LbHLIBxcrJjQbWNTqioMVLSbZNhJxogOVmZ47C
 zBYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LUExjU2XTxgqMjmujYynjDialW7+jMU42M0B+uiUV/Y=;
 b=cq2az1PvTEc+t7IUPYQz+HsobA8Nq8xYIzA0PFAqbEgjIRERpO1vmtk22I2kVT4zcZ
 yE8K1UDymn//kjiuOxRK60WJarfnQU0/07CmEJZHp8L/7xrMuE8jTERivM7VZxPjUNds
 E3fgcfONxU3bXnisWy0xP7x4WDpqkhdHTsK4nqjlr7oouXsoTf8YPDmfYidr0iM28RYA
 UgcS4qvAzazOcosI5a/ALn24wAk7zhf4JvwAfJfCKnkVT0nY5xvbZ5/FAePhIQbTSD94
 tLkfdwW+nonMavte4cT75CKumYi/pr0o5R9nZo5zYBIcugicpKiBd6Dlbqsp9Ovv3SFu
 8rMA==
X-Gm-Message-State: AOAM530o4YutJTb2ZWy7809l/ReE5RbAxkTHvRW41AW70rMsIlbqWae8
 zRVoRSxVSoxG+2jthO2ZDZNVCS6q
X-Google-Smtp-Source: ABdhPJwAtrlk+4xfJhh48GTLeoCeohdKmJ8CEoVKH2zYdsQM7LHT16itLvMNHM2FrOQLj29OSvANkw==
X-Received: by 2002:a05:600c:2299:: with SMTP id
 25mr3171519wmf.138.1589536449567; 
 Fri, 15 May 2020 02:54:09 -0700 (PDT)
Received: from localhost.localdomain
 (cpc91192-cmbg18-2-0-cust374.5-4.cable.virginm.net. [80.6.113.119])
 by smtp.gmail.com with ESMTPSA id s12sm2705817wmc.7.2020.05.15.02.54.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 02:54:09 -0700 (PDT)
From: Emil Velikov <emil.l.velikov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/38] drm/amdgpu: use the unlocked drm_gem_object_put
Date: Fri, 15 May 2020 10:50:47 +0100
Message-Id: <20200515095118.2743122-8-emil.l.velikov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
References: <20200515095118.2743122-1-emil.l.velikov@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, emil.l.velikov@gmail.com,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KClRoZSBkcml2
ZXIgZG9lcyBub3QgaG9sZCBzdHJ1Y3RfbXV0ZXgsIHRodXMgdXNpbmcgdGhlIGxvY2tlZCB2ZXJz
aW9uIG9mCnRoZSBoZWxwZXIgaXMgaW5jb3JyZWN0LgoKQ2M6IEFsZXggRGV1Y2hlciA8YWxleGFu
ZGVyLmRldWNoZXJAYW1kLmNvbT4KQ2M6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2Vu
aWdAYW1kLmNvbT4KQ2M6IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCkZpeGVzOiBhMzk0
MTQ3MTZjYTAgKCJkcm0vYW1kZ3B1OiBhZGQgaW5kZXBlbmRlbnQgRE1BLWJ1ZiBpbXBvcnQgdjki
KToKU2lnbmVkLW9mZi1ieTogRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+
CkFja2VkLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RtYV9idWYuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfZG1hX2J1Zi5jCmluZGV4IDQzZDhlZDdkYmQwMC4uNjUyYzU3YTNiODQ3IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZG1hX2J1Zi5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kbWFfYnVmLmMKQEAgLTU4Nyw3
ICs1ODcsNyBAQCBzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKmFtZGdwdV9nZW1fcHJpbWVfaW1wb3J0
KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCiAJYXR0YWNoID0gZG1hX2J1Zl9keW5hbWljX2F0dGFj
aChkbWFfYnVmLCBkZXYtPmRldiwKIAkJCQkJJmFtZGdwdV9kbWFfYnVmX2F0dGFjaF9vcHMsIG9i
aik7CiAJaWYgKElTX0VSUihhdHRhY2gpKSB7Ci0JCWRybV9nZW1fb2JqZWN0X3B1dChvYmopOwor
CQlkcm1fZ2VtX29iamVjdF9wdXRfdW5sb2NrZWQob2JqKTsKIAkJcmV0dXJuIEVSUl9DQVNUKGF0
dGFjaCk7CiAJfQogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
