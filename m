Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 727121C8BE
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 14:31:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98684892F0;
	Tue, 14 May 2019 12:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33D98892EA;
 Tue, 14 May 2019 12:31:38 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id j187so2261800wma.1;
 Tue, 14 May 2019 05:31:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uhpI2XVf96hFlDtAL/mzWZ1tmY9ymOjWPDnrQ0PFR7g=;
 b=MJTT1/I8Vf1ryb0zy53zcerNjMDYrC8rq8Y/EkwJ7uJ+MmnpK+smET5KIUm/jdEHsp
 GyRfidp3iYRRV44yY5FpKjPFXn51Cor8Tc6Aw0Ja7U1WbrK4ojILY5xNHBvgatXlRGvN
 0bpWhy/I/22DP+LVLcU7bOHff60OnTMVn+1SDCwXt37B8VuIzOxZT7bXgII6zaEQqgTI
 YvxyBKJdzRstuWXrJpwJOoPKShbn+7dfjOdp85Mls8vDzHG1x6/+zfcT8GC78jWlRSoi
 3n3Nv7vv8d6eh8p5tRvlmyA99nCfaxYSmlTN2BUK3v/d2I51PChjs5KpNzHbXwBNhrX1
 qsJQ==
X-Gm-Message-State: APjAAAWikaRSdD/jTzqYcnQcbZvK4S5ODuXMjhy/qvCkBka+GgGO2o1a
 AHir8/0gqgGYBZ1vvBw9hqRkkq3L
X-Google-Smtp-Source: APXvYqxb7JGPajaEK02DALF+lb1w8lQ+7Ymus5sorQP1sgjU8BhLPe66wozCFn6zcBGpWuZI6Qs9+w==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr657524wml.150.1557837096773;
 Tue, 14 May 2019 05:31:36 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:7d94:f6f9:368b:5a3b])
 by smtp.gmail.com with ESMTPSA id n4sm6128704wmb.22.2019.05.14.05.31.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 14 May 2019 05:31:36 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 08/11] drm/ttm: put new BOs immediately on the LRU
Date: Tue, 14 May 2019 14:31:24 +0200
Message-Id: <20190514123127.1650-8-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190514123127.1650-1-christian.koenig@amd.com>
References: <20190514123127.1650-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=uhpI2XVf96hFlDtAL/mzWZ1tmY9ymOjWPDnrQ0PFR7g=;
 b=mEP8QNn1CWaVaTPGU6zZfgyiAoXhSgLf516/kEU/SwlWNdx1W0WtdkGK3y+yCe5vsa
 lFDBvlFsvx+GV/Y/mqrDGHTPX1wyZ6hhsgVQtOcbYuIO8iN4fOnDzhYy6JO6eEVwJqD2
 TyY3uuHcCUcQqc7CISoR9LAIxl4auppCJbnaoUEmommHeAYCEmD8TRK9vPR6wsQEfyVj
 K7I0zDZebBUwdzd/CsDGpIUpexUi+ps1JSEcKc3rBAv53pdv/yNOC6yky+9QnXS83OIW
 J2SMieGP1HfxTTTW6hLkjY9e+dOk+xdbYXGx86iGjvXOPKBINMq0XUQZbN88+ZGPYU/r
 DjQg==
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

VGhpcyB3YXkgdGhleSBhcmUgYXZhaWxhYmxlIGZvciBldmljdGlvbiBpbW1lZGlhdGVseS4KClNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIHwgMTMgKysrKystLS0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1f
Ym8uYwppbmRleCAyMzNiZmI4NjA2OGIuLmEzMDFjODc2YWUzMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5j
CkBAIC0xMzkwLDIxICsxMzkwLDE4IEBAIGludCB0dG1fYm9faW5pdF9yZXNlcnZlZChzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldiwKIAkJV0FSTl9PTighbG9ja2VkKTsKIAl9CiAKLQlpZiAobGlr
ZWx5KCFyZXQpKQorCWlmIChsaWtlbHkoIXJldCkpIHsKKwkJc3Bpbl9sb2NrKCZiZGV2LT5nbG9i
LT5scnVfbG9jayk7CisJCXR0bV9ib19hZGRfdG9fbHJ1KGJvKTsKKwkJc3Bpbl91bmxvY2soJmJk
ZXYtPmdsb2ItPmxydV9sb2NrKTsKIAkJcmV0ID0gdHRtX2JvX3ZhbGlkYXRlKGJvLCBwbGFjZW1l
bnQsIGN0eCk7CisJfQogCiAJaWYgKHVubGlrZWx5KHJldCkpIHsKIAkJaWYgKCFyZXN2KQogCQkJ
dHRtX2JvX3VucmVzZXJ2ZShibyk7CiAKIAkJdHRtX2JvX3B1dChibyk7Ci0JCXJldHVybiByZXQ7
Ci0JfQotCi0JaWYgKHJlc3YgJiYgIShiby0+bWVtLnBsYWNlbWVudCAmIFRUTV9QTF9GTEFHX05P
X0VWSUNUKSkgewotCQlzcGluX2xvY2soJmJkZXYtPmdsb2ItPmxydV9sb2NrKTsKLQkJdHRtX2Jv
X2FkZF90b19scnUoYm8pOwotCQlzcGluX3VubG9jaygmYmRldi0+Z2xvYi0+bHJ1X2xvY2spOwog
CX0KIAogCXJldHVybiByZXQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
