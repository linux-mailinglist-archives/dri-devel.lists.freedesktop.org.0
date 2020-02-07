Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D955C155ED0
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 20:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9373C6FD6F;
	Fri,  7 Feb 2020 19:51:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A736FD6C;
 Fri,  7 Feb 2020 19:51:10 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id w8so273951qts.11;
 Fri, 07 Feb 2020 11:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O1jdP4CEORovm2VR+Fw+/VJ73Y3rqRpk3hpguLeOylg=;
 b=Y8tbKX9V0bsUrlHlP5JVNVW4khKM/2I1ukPFr1qJTFP01ucuoOz8FPxAMmVyV5Vl7S
 FYA31LEMS4V4nayk+YiIAKVnHN7p9U2ocUgFXSM7rq33DD3jJ4Um9vawMDktu5KcKbb7
 wqvzZ0Q51ue2Y0apuroXUOr4g6NJ4xwQDt9qNNlJn0AuyVyLv9IOVixHw2v/agW6qhOO
 W1X4qTvF+NbWhgyIStjxLQlXKWmnHXYmnfRhzEo7RL5Pvh4bFe/nbJkWjaAhcGWPvtku
 AMKQDyt/J5z6PU36ONL0f+udCR/xUGi8jrkggS00Di8E4TJNScbMmS9ZU7jQqsRlQUfy
 xOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=O1jdP4CEORovm2VR+Fw+/VJ73Y3rqRpk3hpguLeOylg=;
 b=eaigP/TPcbGTaLNh3E3CFcC0CpKjOfHA57SkG75cGOgLA4quoHCYu4ptjvIFQSJItH
 GzudxdeBFbiXL5WC8hBCoRqLjY9fBonMaJh9SIskPqbsR6+nZ1kEIn+afHriqT4SDdgB
 C5sh+WmTiihkAh8I/18nrHCB3cx+2jzvs7I56TWL+uH9IafCiByl/4C11cfR+Bfr++Pz
 wZ4VXbSFTSI7jRZXaVgWl0oG1MSK2g9yQczLeEza+DrU04kmjDtLQZzhAupsecGyTEfH
 nrCv9ATQnbSyJxpnlWyLrnFTT6gtOsl20em4EVL7fAdUmaxQZ5O+WFVZthTrDU0t4rmJ
 H92A==
X-Gm-Message-State: APjAAAW1nfLTCGM2IXKkmkpluqw0mIF7aAitObTNl16u8JbhG2ND9uzI
 q7GzO39rqxdayiynwqztTe8ZbGqm
X-Google-Smtp-Source: APXvYqw57GQhOzatx6DLONDFO41YN9OoHqT2jEg9qJZ1NdjhVGvY+eq793wdQ9XcplLR3o6nsiWsrQ==
X-Received: by 2002:ac8:5215:: with SMTP id r21mr471203qtn.77.1581105069809;
 Fri, 07 Feb 2020 11:51:09 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:09 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 04/15] drm/amdgpu/sa: move debugfs init into core amdgpu
 debugfs
Date: Fri,  7 Feb 2020 14:50:47 -0500
Message-Id: <20200207195058.2354-5-alexander.deucher@amd.com>
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
dWdmcyBmaWxlIGhhbmRsaW5nLiAgRG8gdGhpcyBmb3IgU0EgKHN1YiBhbGxvY2F0b3IpLgoKQWNr
ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgfCA0ICsrKysKIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jICAgICAgfCA3ICsrLS0tLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCAgfCAxICsKIDMgZmlsZXMgY2hh
bmdlZCwgNyBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfZGVidWdmcy5jCmluZGV4IGMxZDY2Y2M2ZTZkOC4uODRjNWU5ZjIz
Yzc2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGVidWdm
cy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZWJ1Z2ZzLmMKQEAg
LTEyNDEsNiArMTI0MSwxMCBAQCBpbnQgYW1kZ3B1X2RlYnVnZnNfaW5pdChzdHJ1Y3QgYW1kZ3B1
X2RldmljZSAqYWRldikKIAkJcmV0dXJuIHI7CiAJfQogCisJaWYgKGFtZGdwdV9kZWJ1Z2ZzX3Nh
X2luaXQoYWRldikpIHsKKwkJZGV2X2VycihhZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVnaXN0ZXIg
ZGVidWdmcyBmaWxlIGZvciBTQVxuIik7CisJfQorCiAJcmV0dXJuIGFtZGdwdV9kZWJ1Z2ZzX2Fk
ZF9maWxlcyhhZGV2LCBhbWRncHVfZGVidWdmc19saXN0LAogCQkJCQlBUlJBWV9TSVpFKGFtZGdw
dV9kZWJ1Z2ZzX2xpc3QpKTsKIH0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pYi5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2liLmMK
aW5kZXggNmUwZjk3YWZiMDMwLi5hYmYyODZmMmJjNWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9pYi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9pYi5jCkBAIC00OCw3ICs0OCw2IEBACiAgKiBwcm9kdWNlIGNvbW1hbmQgYnVm
ZmVycyB3aGljaCBhcmUgc2VuZCB0byB0aGUga2VybmVsIGFuZAogICogcHV0IGluIElCcyBmb3Ig
ZXhlY3V0aW9uIGJ5IHRoZSByZXF1ZXN0ZWQgcmluZy4KICAqLwotc3RhdGljIGludCBhbWRncHVf
ZGVidWdmc19zYV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAogLyoqCiAgKiBh
bWRncHVfaWJfZ2V0IC0gcmVxdWVzdCBhbiBJQiAoSW5kaXJlY3QgQnVmZmVyKQpAQCAtMjk1LDkg
KzI5NCw3IEBAIGludCBhbWRncHVfaWJfcG9vbF9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICph
ZGV2KQogCX0KIAogCWFkZXYtPmliX3Bvb2xfcmVhZHkgPSB0cnVlOwotCWlmIChhbWRncHVfZGVi
dWdmc19zYV9pbml0KGFkZXYpKSB7Ci0JCWRldl9lcnIoYWRldi0+ZGV2LCAiZmFpbGVkIHRvIHJl
Z2lzdGVyIGRlYnVnZnMgZmlsZSBmb3IgU0FcbiIpOwotCX0KKwogCXJldHVybiAwOwogfQogCkBA
IC00MjEsNyArNDE4LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0IGFtZGdw
dV9kZWJ1Z2ZzX3NhX2xpc3RbXSA9IHsKIAogI2VuZGlmCiAKLXN0YXRpYyBpbnQgYW1kZ3B1X2Rl
YnVnZnNfc2FfaW5pdChzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikKK2ludCBhbWRncHVfZGVi
dWdmc19zYV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KQogewogI2lmIGRlZmluZWQo
Q09ORklHX0RFQlVHX0ZTKQogCXJldHVybiBhbWRncHVfZGVidWdmc19hZGRfZmlsZXMoYWRldiwg
YW1kZ3B1X2RlYnVnZnNfc2FfbGlzdCwgMSk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmggYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
bWRncHVfb2JqZWN0LmgKaW5kZXggMjZhNjU0Y2JkNTMwLi43ZDQxZjdiOWEzNDAgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaAorKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKQEAgLTMzMCw2ICszMzAsNyBA
QCB2b2lkIGFtZGdwdV9zYV9ib19mcmVlKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LAogdm9p
ZCBhbWRncHVfc2FfYm9fZHVtcF9kZWJ1Z19pbmZvKHN0cnVjdCBhbWRncHVfc2FfbWFuYWdlciAq
c2FfbWFuYWdlciwKIAkJCQkJIHN0cnVjdCBzZXFfZmlsZSAqbSk7CiAjZW5kaWYKK2ludCBhbWRn
cHVfZGVidWdmc19zYV9pbml0KHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2KTsKIAogYm9vbCBh
bWRncHVfYm9fc3VwcG9ydF91c3djKHU2NCBib19mbGFncyk7CiAKLS0gCjIuMjQuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
