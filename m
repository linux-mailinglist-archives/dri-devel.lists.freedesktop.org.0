Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D562C40B3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Nov 2020 13:59:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7AB6E996;
	Wed, 25 Nov 2020 12:59:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 343176E997
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 12:59:22 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id q16so2419694edv.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Nov 2020 04:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=svYx8C2mOw+D0g7Fnl7ET+TO8pEYTFtTIzHQ3zBXsuM=;
 b=WQ5n+tOfxWOef+FXVwldDgjMiyneOoZgpPAVFMOu2PyaX7eJL/CDBrCPuYQVvO4JH1
 XFi1YS8a6zvwNARVjDk9XgNv59IImpTHSQc8q9LW5MiIh6vuL5oUrveer9D0MBrMr4kc
 Atc0LxN8KOPgzAWuDffJ/0uWNc0Hv6CHAxn7exgbIBWroshxZiwRDF912hyYEwbLKtJf
 fJei99kDCn/XulbUNTWS6RoDeUiefWR3jcnx/Ms8sIQxdIbZHBW0hWyOUL6uVp+rdZyU
 fPPT6lqcmSXnPzogxIHzFUm7VUc7XQGJSIwgpmMfmw5B6e18UoZER4iQCrK1s/Xg7xjg
 TOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=svYx8C2mOw+D0g7Fnl7ET+TO8pEYTFtTIzHQ3zBXsuM=;
 b=ouMcRrPVHGxPIgDg+1LUVT0ZucxJp425KoY/Xrbi4XAgePSHKsiF8z49K7B6fU4wcv
 P73g7KIv+mmCD92o9MDeyZCjAjfQEGdIwzvBHEy8y1e2gMzpQ2b6wlrDq+IuURm48fkl
 NlMm7NcDGeIjw4Y3ZmJGnJ2xemDnoO1OXCdwC6GU3SaLKwmnW+yn3yKh0G3m9quz3ngP
 M8ZG75ubl4nJxEaoEeCPT3PTJQ+HOFJcHHWt/4o+zavTmFr8LNhZao69qCcpnQerlxXz
 4d2kDOlZhNSxX+cW9GDGWpZmJZyTxMF7QeeU0OlwVChLMsUt4Jj//YBtxJsYjzRA6EMN
 rrcA==
X-Gm-Message-State: AOAM533M1Z2653gACIfLKQZyDnXlQnY/zlumHRiUkfI3DFAYxLUCfS/3
 p9XeQVuO49EfQrYStUmj8SX52TtMwyY=
X-Google-Smtp-Source: ABdhPJyaTaCMIGqiSJ9ABVuOyccpTxCmHrJpufg9te5hJRepWc1l+mrrBjjW/jLkcuP/fOSQv6hSKw==
X-Received: by 2002:aa7:d5d7:: with SMTP id d23mr3274532eds.203.1606309160688; 
 Wed, 25 Nov 2020 04:59:20 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:87d9:eeff:99f6:84c2])
 by smtp.gmail.com with ESMTPSA id z19sm1203188ejj.101.2020.11.25.04.59.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 04:59:20 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/7] drm/radeon: stop using pages with
 drm_prime_sg_to_page_addr_arrays v2
Date: Wed, 25 Nov 2020 13:59:13 +0100
Message-Id: <20201125125919.1372-1-christian.koenig@amd.com>
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

VGhpcyBpcyBkZXByZWNhdGVkLgoKdjI6IGFsc28gdXNlIHR0bV9zZ190dF9pbml0IHRvIGF2b2lk
IGFsbG9jYXRpbmcgdGhlIHBhZ2UgYXJyYXkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fdHRtLmMgfCAxMSArKysrKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3JhZGVvbl90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCmlu
ZGV4IDBjYTM4MWI5NWQzZC4uNWQwMGIzZGZmMzg4IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl90dG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl90dG0uYwpAQCAtNDAxLDggKzQwMSw4IEBAIHN0YXRpYyBpbnQgcmFkZW9uX3R0bV90dF9waW5f
dXNlcnB0cihzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwgc3RydWN0IHR0bV90dCAqCiAJaWYg
KHIpCiAJCWdvdG8gcmVsZWFzZV9zZzsKIAotCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJy
YXlzKHR0bS0+c2csIHR0bS0+cGFnZXMsCi0JCQkJCSBndHQtPnR0bS5kbWFfYWRkcmVzcywgdHRt
LT5udW1fcGFnZXMpOworCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2cs
IE5VTEwsIGd0dC0+dHRtLmRtYV9hZGRyZXNzLAorCQkJCQkgdHRtLT5udW1fcGFnZXMpOwogCiAJ
cmV0dXJuIDA7CiAKQEAgLTU0Miw3ICs1NDIsNyBAQCBzdGF0aWMgc3RydWN0IHR0bV90dCAqcmFk
ZW9uX3R0bV90dF9jcmVhdGUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAllbHNlCiAJ
CWNhY2hpbmcgPSB0dG1fY2FjaGVkOwogCi0JaWYgKHR0bV9kbWFfdHRfaW5pdCgmZ3R0LT50dG0s
IGJvLCBwYWdlX2ZsYWdzLCBjYWNoaW5nKSkgeworCWlmICh0dG1fc2dfdHRfaW5pdCgmZ3R0LT50
dG0sIGJvLCBwYWdlX2ZsYWdzLCBjYWNoaW5nKSkgewogCQlrZnJlZShndHQpOwogCQlyZXR1cm4g
TlVMTDsKIAl9CkBAIC01ODAsOCArNTgwLDkgQEAgc3RhdGljIGludCByYWRlb25fdHRtX3R0X3Bv
cHVsYXRlKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCX0KIAogCWlmIChzbGF2ZSAmJiB0
dG0tPnNnKSB7Ci0JCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIHR0
bS0+cGFnZXMsCi0JCQkJCQkgZ3R0LT50dG0uZG1hX2FkZHJlc3MsIHR0bS0+bnVtX3BhZ2VzKTsK
KwkJZHJtX3ByaW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXModHRtLT5zZywgTlVMTCwKKwkJCQkJ
CSBndHQtPnR0bS5kbWFfYWRkcmVzcywKKwkJCQkJCSB0dG0tPm51bV9wYWdlcyk7CiAJCXJldHVy
biAwOwogCX0KIAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwK
