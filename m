Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5903E2A64BD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 14:00:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C0846E12A;
	Wed,  4 Nov 2020 13:00:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7AE16E12A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 13:00:27 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id 7so29656000ejm.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 05:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sp9G62/bWxxZj0EBO2PNX38wP43KVF8wOkDsxtXIzmY=;
 b=HHaVOrlT0trbFytisDLOq1ASx9N28PNQQrTnEL9V0v6B3tW5dP3QKwLaoAaFyV0ziN
 +l4hAWwP77a3bi0cpgeZi5wcfTOUURTRO++scZfArHG7IIUdlfwHSYw0lGT/rdnNa0GM
 emIe4KH+AUEHwWeXFks0hAPpOS+8Avz6Lz/zw/n8XXaFC7dyfK/iWyP+F6li/aRS27PM
 2MOa23DgHMf6k1T8qyv05unuGUz/YlVIGAeEh4I7aTZcvIsjk7ibE3RsgAS45cB0RxX2
 UbtClbnnQp9WctjW5QFO8fizN7HqXxZORyFiCuP/cZr6EjXYO+XhiKRuSj75ANgX/LVt
 Blvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sp9G62/bWxxZj0EBO2PNX38wP43KVF8wOkDsxtXIzmY=;
 b=ozJoCltvsxZdEhowLqa2ZXH2Vo1OHLAP3vGl7hTmMORun5xOLPUqvuUWQeH+P9HFOj
 Jzq56jbJhb/dIzzeGt43I8qz7siLveR7DbZKzJw6KfO9tyVLpwcNdzQnnvWgh+jJsr5J
 GZMgCejLhPONMmsSeasq5GPwOU5XQBdIvT+C0srOSj/kabMSdbXmnh3bK9cimQtfJB3I
 DyTmtHpbaCpCWze4LCn/jVcO4xbzBqTC8fzyX2FVorC1MXFdBferwhiBpZ8E5NsnHPkn
 v4Hi+BM3WgHyPdor5uoShwwwg5pmhBMERWSX9wNx7hYo9WAzWxC1z2AlR1lVn8GM3Z+q
 od0Q==
X-Gm-Message-State: AOAM532t5KSDlJO5qP8uVpM7eKcRVvNEkD1kVtIb29CYPhsTN8TEWIVc
 0y54e2XbSs6knOEbG+G/rTLTxDjdaUM=
X-Google-Smtp-Source: ABdhPJxAJoJAOGgmQKqJ4JoRK5Rr98tEJGponZqj0C0kdoIujEi6PVKBCI0v6lqwzT1t3lONS1smNQ==
X-Received: by 2002:a17:906:128d:: with SMTP id
 k13mr24298997ejb.78.1604494826153; 
 Wed, 04 Nov 2020 05:00:26 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:429e:5ba2:6ddc:d941])
 by smtp.gmail.com with ESMTPSA id l20sm978801eja.40.2020.11.04.05.00.25
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 05:00:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/radeon: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Date: Wed,  4 Nov 2020 14:00:21 +0100
Message-Id: <20201104130024.264974-1-christian.koenig@amd.com>
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

VGhpcyBpcyBkZXByZWNhdGVkLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hy
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X3R0bS5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
dHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwppbmRleCA5NTAzOGFj
MzM4MmUuLmY0MWZjZWUzNWY3MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9y
YWRlb25fdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKQEAg
LTQ5NCw4ICs0OTQsOCBAQCBzdGF0aWMgaW50IHJhZGVvbl90dG1fdHRfcGluX3VzZXJwdHIoc3Ry
dWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsIHN0cnVjdCB0dG1fdHQgKgogCWlmIChyKQogCQlnb3Rv
IHJlbGVhc2Vfc2c7CiAKLQlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNn
LCB0dG0tPnBhZ2VzLAotCQkJCQkgZ3R0LT50dG0uZG1hX2FkZHJlc3MsIHR0bS0+bnVtX3BhZ2Vz
KTsKKwlkcm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNnLCBOVUxMLCBndHQt
PnR0bS5kbWFfYWRkcmVzcywKKwkJCQkJIHR0bS0+bnVtX3BhZ2VzKTsKIAogCXJldHVybiAwOwog
CkBAIC02NzMsOCArNjczLDkgQEAgc3RhdGljIGludCByYWRlb25fdHRtX3R0X3BvcHVsYXRlKHN0
cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCX0KIAogCWlmIChzbGF2ZSAmJiB0dG0tPnNnKSB7
Ci0JCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIHR0bS0+cGFnZXMs
Ci0JCQkJCQkgZ3R0LT50dG0uZG1hX2FkZHJlc3MsIHR0bS0+bnVtX3BhZ2VzKTsKKwkJZHJtX3By
aW1lX3NnX3RvX3BhZ2VfYWRkcl9hcnJheXModHRtLT5zZywgTlVMTCwKKwkJCQkJCSBndHQtPnR0
bS5kbWFfYWRkcmVzcywKKwkJCQkJCSB0dG0tPm51bV9wYWdlcyk7CiAJCXJldHVybiAwOwogCX0K
IAotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWwK
