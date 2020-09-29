Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3DC827C4F3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Sep 2020 13:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211C289E8C;
	Tue, 29 Sep 2020 11:23:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428E389E8C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 11:23:09 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id p15so14421417ejm.7
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Sep 2020 04:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75onsUiYZDPKUoPfk+ULF3bocgPd4SNa0iZmlQ7V8lA=;
 b=AMJTdhKmFLDt56XZODIvLT7sLm2deH/obqVfwflX1ZjAL/1pHST7eliRzFmWlaPro/
 OXud1x5vsl+cEuple26CfuValSuZb7t+zjg+4Nkmm7siniGdIHSUAsF4RaFMhQGUDzOv
 DGu1LlRBxRMszP41x2EzXsVAYsoGEuy94Mx3GNwSrOqM55NwTqJ8i9EJPlcxaKgGSkod
 j8rnwBsq+UQC6VHglyZvVBkz1iAQPDRwiz8vossrXfK3zsA9P/skvA4OGBzrxM7Ne9vr
 LhciJeGv1R30xsNAsuWXsoLRenBJdUWBUzXLij9V3hazJarflh4hV/YyGdO7RwuRjeut
 ql9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=75onsUiYZDPKUoPfk+ULF3bocgPd4SNa0iZmlQ7V8lA=;
 b=V+YNDKbKA+O6t7qN0Xw5BXKMiuzkXEotHm5MOmf42CPRONHnbh5ZboT/b3dxFgWxZ+
 oGbtkRUTGOIEUGbmJzmOB8T1Lyi/uioUHNgv1NYShCg/Xh/IJr5baOCh7WUdwhfCze6i
 hztTg9n4pQLkLImrl90/AadUzEbhqDhxHyB5r+0O9ZbIC7nFnJGTvyflnEPdKI3XW1JJ
 gxj3ZFeXbtUhv4dyZamBiI3X9TXO/+/GOoHb+NyuEeI4LMqQ40drnjccfaCVgRspzSkT
 Sf2blBg/T36gqFDg26ktj63Up0MJ6mkztxK1YmdfGyMD2TiYfrY83YuLjsLw0yRjLy1N
 +wWA==
X-Gm-Message-State: AOAM533AXknNDFlXAIrXeMHhIoOGAzvLOkPwg4uWejyp4NriqpOic+kO
 gOJ29H/OYRPWqz6p6bRZbc9zaw490+U=
X-Google-Smtp-Source: ABdhPJxzEYAJjxBg4M1p5gHc6ghqE7oEpIsQSlPioRJkaDdaSA8dydq5Ndtg8p9QCoQ5VIhO8aNSow==
X-Received: by 2002:a17:906:270f:: with SMTP id
 z15mr3283553ejc.6.1601378587951; 
 Tue, 29 Sep 2020 04:23:07 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1c3a:33fc:3eec:ae1d])
 by smtp.gmail.com with ESMTPSA id ce14sm5839479edb.25.2020.09.29.04.23.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 04:23:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: kraxel@redhat.com, airlied@redhat.com, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/qxl: fix usage of ttm_bo_init
Date: Tue, 29 Sep 2020 13:23:06 +0200
Message-Id: <20200929112306.80952-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
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

V2UgbmVlZCB0byB1c2UgdHRtX2JvX2luaXRfcmVzZXJ2ZWQgaGVyZSB0byBtYWtlIHN1cmUKdGhh
dCB0aGUgQk8gaXMgcGlubmVkIGJlZm9yZSBpdCBiZWNvbWVzIHZpc2libGUgb24gdGhlIExSVS4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9vYmplY3QuYyB8IDggKysrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMgYi9kcml2ZXJzL2dwdS9kcm0vcXhs
L3F4bF9vYmplY3QuYwppbmRleCBkMzYzNWUzZTMyNjcuLmM4YjY3ZTdhM2YwMiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfb2JqZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJt
L3F4bC9xeGxfb2JqZWN0LmMKQEAgLTEwNiw2ICsxMDYsNyBAQCBpbnQgcXhsX2JvX2NyZWF0ZShz
dHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKIAkJICBzdHJ1Y3QgcXhsX3N1cmZhY2UgKnN1cmYsCiAJ
CSAgc3RydWN0IHF4bF9ibyAqKmJvX3B0cikKIHsKKwlzdHJ1Y3QgdHRtX29wZXJhdGlvbl9jdHgg
Y3R4ID0geyAha2VybmVsLCBmYWxzZSB9OwogCXN0cnVjdCBxeGxfYm8gKmJvOwogCWVudW0gdHRt
X2JvX3R5cGUgdHlwZTsKIAlpbnQgcjsKQEAgLTEzNCw5ICsxMzUsOSBAQCBpbnQgcXhsX2JvX2Ny
ZWF0ZShzdHJ1Y3QgcXhsX2RldmljZSAqcWRldiwKIAogCXF4bF90dG1fcGxhY2VtZW50X2Zyb21f
ZG9tYWluKGJvLCBkb21haW4pOwogCi0JciA9IHR0bV9ib19pbml0KCZxZGV2LT5tbWFuLmJkZXYs
ICZiby0+dGJvLCBzaXplLCB0eXBlLAotCQkJJmJvLT5wbGFjZW1lbnQsIDAsICFrZXJuZWwsIHNp
emUsCi0JCQlOVUxMLCBOVUxMLCAmcXhsX3R0bV9ib19kZXN0cm95KTsKKwlyID0gdHRtX2JvX2lu
aXRfcmVzZXJ2ZWQoJnFkZXYtPm1tYW4uYmRldiwgJmJvLT50Ym8sIHNpemUsIHR5cGUsCisJCQkJ
ICZiby0+cGxhY2VtZW50LCAwLCAmY3R4LCBzaXplLAorCQkJCSBOVUxMLCBOVUxMLCAmcXhsX3R0
bV9ib19kZXN0cm95KTsKIAlpZiAodW5saWtlbHkociAhPSAwKSkgewogCQlpZiAociAhPSAtRVJF
U1RBUlRTWVMpCiAJCQlkZXZfZXJyKHFkZXYtPmRkZXYuZGV2LApAQCAtMTQ2LDYgKzE0Nyw3IEBA
IGludCBxeGxfYm9fY3JlYXRlKHN0cnVjdCBxeGxfZGV2aWNlICpxZGV2LAogCX0KIAlpZiAocGlu
bmVkKQogCQl0dG1fYm9fcGluKCZiby0+dGJvKTsKKwl0dG1fYm9fdW5yZXNlcnZlKCZiby0+dGJv
KTsKIAkqYm9fcHRyID0gYm87CiAJcmV0dXJuIDA7CiB9Ci0tIAoyLjE3LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
