Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CEB5D74F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2019 22:27:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA5B66E03E;
	Tue,  2 Jul 2019 20:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AD86E03D;
 Tue,  2 Jul 2019 20:27:23 +0000 (UTC)
Received: by mail-qk1-x730.google.com with SMTP id b18so15465925qkc.9;
 Tue, 02 Jul 2019 13:27:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f88teEGjW0nN2FOE42nXfLv5A25XcE0eqQQ8ZnR07JU=;
 b=DR103+7MbMjQeT4Hjk9inBqJuuPXtAUTM1IKNPpShNlyzGb3k47J2lJme1FveWP5cK
 v8wHZ4U9qf44iRmFYBruAEIA8krW5AtDZhCbAOtgPncY0fNq+PgcNW8GLzxHMkBIWOZo
 aziFw6G4xMd2WHMPpLKBi9pFZxGXTJpT7ckNjZux7DjkjtFhZ7SzYzAqjiWdvkVRbqqD
 PRfRPleUxyc90szTqutllx51qqf3tiuM2XD5VdjEXk1+lJVX2xPkBclvw7b+jTO6dO+Y
 P0tCI9K5DrE4tdcafYhvnumvjhPbJfzkKKhgsFu+jSA5CJ+aWXzbyk7yVgRzQsdGdM8N
 AFeQ==
X-Gm-Message-State: APjAAAVuAyNMgH9PK/2By+zYzAMjfJwPw/Sv+DAY/KhjTWSEcXzJn5Tu
 QMMCHMC3o8cmFMJBCh0lLvA=
X-Google-Smtp-Source: APXvYqwAlzApaqBBZtvqYr3CR/RH/kfQMFwRY/ZWxa5i4JJUxMfatKd6fTCEHxCx0jSEgts8E1Dq7w==
X-Received: by 2002:a37:a882:: with SMTP id
 r124mr27068226qke.398.1562099242989; 
 Tue, 02 Jul 2019 13:27:22 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id r17sm10510qtf.26.2019.07.02.13.27.22
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 02 Jul 2019 13:27:22 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: mark devices where iommu is managed by driver
Date: Tue,  2 Jul 2019 13:26:19 -0700
Message-Id: <20190702202631.32148-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190702202631.32148-1-robdclark@gmail.com>
References: <20190702202631.32148-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f88teEGjW0nN2FOE42nXfLv5A25XcE0eqQQ8ZnR07JU=;
 b=Ll0agao4aIAnYcVNBBJOi+jd2NnL7QD8TFl2aymNrYa8HK9DfMy3v495p9gROFHA/u
 tBjVOgT8daPT5d2w7eD0aIAJcOnV2Rm0aXDybT+G8nVx45y3yWG9lhFLBDmME6FqEjta
 Ijtfff8L3j7Mg5evQw8L84tr7CfFcwbnR7f3OrWMYv8cO2+3YB5og9XSOe+WXbhBmh0X
 zMnRegRXhZdqaIRGzM4fRFZzs3v+M9wwYnC0urB7YLmpETZ8ohPdGl9Q9vwZkX3eIeTH
 GDEss+h6oeE5WZoM2Or2mJg/DW82eGWfRdwgsyXaTb+yeU+DW8GtpUyBE2U19ecsdLAX
 3X5g==
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
Cc: Rob Clark <robdclark@chromium.org>, aarch64-laptops@lists.linaro.org,
 Jonathan Marek <jonathan@marek.ca>, Boris Brezillon <bbrezillon@kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Mamta Shukla <mamtashukla555@gmail.com>, linux-kernel@vger.kernel.org,
 Bruce Wang <bzwang@chromium.org>, Abhinav Kumar <abhinavk@codeaurora.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Daniel Mack <daniel@zonque.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKU2lnbmVkLW9mZi1ieTog
Um9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vYWRyZW5vL2FkcmVub19kZXZpY2UuYyB8IDEgKwogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNw
L2RwdTEvZHB1X2ttcy5jICAgIHwgMSArCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9t
ZHA1X2ttcy5jICAgfCAxICsKIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jICAgICAgICAg
ICAgICB8IDEgKwogNCBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMKaW5kZXggYjkwNzI0NWQzZDk2Li5kOWFj
OGM0Y2Q4NjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19k
ZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMK
QEAgLTQ0MSw2ICs0NDEsNyBAQCBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZlciBhZHJlbm9f
ZHJpdmVyID0gewogCQkubmFtZSA9ICJhZHJlbm8iLAogCQkub2ZfbWF0Y2hfdGFibGUgPSBkdF9t
YXRjaCwKIAkJLnBtID0gJmFkcmVub19wbV9vcHMsCisJCS5kcml2ZXJfbWFuYWdlc19pb21tdSA9
IHRydWUsCiAJfSwKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9rbXMuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuYwpp
bmRleCAzOTM3OGFjZTU3YTYuLjAwMWZhNzk4NmYzMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlz
cC9kcHUxL2RwdV9rbXMuYwpAQCAtMTEyNyw2ICsxMTI3LDcgQEAgc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgZHB1X2RyaXZlciA9IHsKIAkJLm5hbWUgPSAibXNtX2RwdSIsCiAJCS5vZl9t
YXRjaF90YWJsZSA9IGRwdV9kdF9tYXRjaCwKIAkJLnBtID0gJmRwdV9wbV9vcHMsCisJCS5kcml2
ZXJfbWFuYWdlc19pb21tdSA9IHRydWUsCiAJfSwKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rp
c3AvbWRwNS9tZHA1X2ttcy5jCmluZGV4IDk3MTc5YmVjODkwMi4uMmExYjg3MDlkMGRjIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKQEAgLTExMDAsNiArMTEwMCw3
IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1kcDVfZHJpdmVyID0gewogCQkubmFt
ZSA9ICJtc21fbWRwIiwKIAkJLm9mX21hdGNoX3RhYmxlID0gbWRwNV9kdF9tYXRjaCwKIAkJLnBt
ID0gJm1kcDVfcG1fb3BzLAorCQkuZHJpdmVyX21hbmFnZXNfaW9tbXUgPSB0cnVlLAogCX0sCiB9
OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYyBiL2RyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2Rydi5jCmluZGV4IDMxZGViODdhYmZjNi4uMTYwOTRiOGM1NDE4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9kcnYuYwpAQCAtMTM1Miw2ICsxMzUyLDcgQEAgc3RhdGljIHN0cnVjdCBw
bGF0Zm9ybV9kcml2ZXIgbXNtX3BsYXRmb3JtX2RyaXZlciA9IHsKIAkJLm5hbWUgICA9ICJtc20i
LAogCQkub2ZfbWF0Y2hfdGFibGUgPSBkdF9tYXRjaCwKIAkJLnBtICAgICA9ICZtc21fcG1fb3Bz
LAorCQkuZHJpdmVyX21hbmFnZXNfaW9tbXUgPSB0cnVlLAogCX0sCiB9OwogCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
