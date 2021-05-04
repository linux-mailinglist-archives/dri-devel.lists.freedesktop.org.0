Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B13C372AFB
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 15:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92D996EAD8;
	Tue,  4 May 2021 13:27:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B86F6EAD8
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 13:27:39 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id a4so13160910ejk.1
 for <dri-devel@lists.freedesktop.org>; Tue, 04 May 2021 06:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nuORuQTU95EWpyN3aVNvO4CGFM+6HYiDJI6uiNGdUoQ=;
 b=A8b+D+Ia+/17DSrFD1piGjK7SfULZNv1d+R2jy3lcv6Lz2yDO+s3FHfqHK2q0gmDp1
 VIdvvtBq82jRGbUgN5j4t/O/6Du6gq9THE0Q94Nv8dTLZoGVik9g4LS2txIoivRL+jfk
 GjkaqP9MniU3Gm0z8cFQbGxw1dVkbNRGohxdEzV1cOavT+evTgdrrw+OAY5HN7aVTF8B
 n+KhRsWsJOcYY73PHtMSFb9SiPMd9meiDsf1AKOW5Y2Bu6lY/qCoxiU+43t3mKE6mWlj
 JMX+ezWpUdS1VKvt5ub6JHeHiq6Myk2spF/7VaWs3fL8p+hWs2QmePP0023AR3xdWKSc
 BXBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nuORuQTU95EWpyN3aVNvO4CGFM+6HYiDJI6uiNGdUoQ=;
 b=jROauZZK+8Y8J9dm42M3aq5+nNji8cxecE4P5sf2+UmTsr8URWC04KFcSwDrQAoCsY
 lL7H4TCwd7ozMV3U74uOmzkcucZf9ajwIKxarbMNwZnUxv3w1QhF+HUsDQgjlNmoGMH8
 Kzf3FOFRZWtOOD4kzVqLS/2w3Iz1btqMjFo9VegopQAFQ5NFFRx1WWDAVvrpwt/yFlw+
 pFu/yKEJk8CKITSd9Un9xm+gOwHp3ZYRoMWL/2SeILBN9OLXVmf4AzGx2uezT1HHr8TJ
 GqePKVXnvbDZlPxMP7JWufoSYwCEJgZcQwc4XflJjCZOuqJc/2Nc4NkgpAC8SIoZOpYb
 lFUg==
X-Gm-Message-State: AOAM532u5Rs/6ihTU6i3O7dUaqnu/aeYKU3MgPrfuJwHxLrB4Aig2hmR
 S3w3Vk95TNJgsuz+jzdzIiDS8TgVvoQ=
X-Google-Smtp-Source: ABdhPJy2P50oRHkxuGmXYjRsjZcHpkQarHSfNzkiQtv3YsyIcXwd/lprzV1LvAa8GcQcEaxA8ii98g==
X-Received: by 2002:a17:906:2e17:: with SMTP id
 n23mr22412601eji.266.1620134857855; 
 Tue, 04 May 2021 06:27:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:4a5c:1943:c73d:c4c9])
 by smtp.gmail.com with ESMTPSA id q18sm3114036edd.3.2021.05.04.06.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 06:27:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] drm/nouveau: add DMA-buf user fence support
Date: Tue,  4 May 2021 15:27:26 +0200
Message-Id: <20210504132729.2046-10-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210504132729.2046-1-christian.koenig@amd.com>
References: <20210504132729.2046-1-christian.koenig@amd.com>
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

SnVzdCBhZGQgdGhlIGNhbGwgYmVmb3JlIHRha2luZyBsb2Nrcy4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfZ2VtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5j
CmluZGV4IGE3MGU4MjQxM2ZhNy4uZTM0OWE4YjMyNTQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2dlbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfZ2VtLmMKQEAgLTU1Miw2ICs1NTIsNyBAQCBub3V2ZWF1X2dlbV9wdXNoYnVmX3Zh
bGlkYXRlKHN0cnVjdCBub3V2ZWF1X2NoYW5uZWwgKmNoYW4sCiAJCQkgICAgIHN0cnVjdCB2YWxp
ZGF0ZV9vcCAqb3AsIGJvb2wgKmFwcGx5X3JlbG9jcykKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9jbGkg
KmNsaSA9IG5vdXZlYXVfY2xpKGZpbGVfcHJpdik7CisJdW5zaWduZWQgaW50IGk7CiAJaW50IHJl
dDsKIAogCUlOSVRfTElTVF9IRUFEKCZvcC0+bGlzdCk7CkBAIC01NTksNiArNTYwLDE3IEBAIG5v
dXZlYXVfZ2VtX3B1c2hidWZfdmFsaWRhdGUoc3RydWN0IG5vdXZlYXVfY2hhbm5lbCAqY2hhbiwK
IAlpZiAobnJfYnVmZmVycyA9PSAwKQogCQlyZXR1cm4gMDsKIAorCWZvciAoaSA9IDA7IGkgPCBu
cl9idWZmZXJzOyBpKyspIHsKKwkJc3RydWN0IGRybV9ub3V2ZWF1X2dlbV9wdXNoYnVmX2JvICpi
ID0gJnBiYm9baV07CisJCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqZ2VtOworCisJCWdlbSA9IGRy
bV9nZW1fb2JqZWN0X2xvb2t1cChmaWxlX3ByaXYsIGItPmhhbmRsZSk7CisJCWlmICghZ2VtKQor
CQkJcmV0dXJuIC1FTk9FTlQ7CisJCWRtYV9yZXN2X3N5bmNfdXNlcl9mZW5jZShnZW0tPnJlc3Yp
OworCQlkcm1fZ2VtX29iamVjdF9wdXQoZ2VtKTsKKwl9CisKIAlyZXQgPSB2YWxpZGF0ZV9pbml0
KGNoYW4sIGZpbGVfcHJpdiwgcGJibywgbnJfYnVmZmVycywgb3ApOwogCWlmICh1bmxpa2VseShy
ZXQpKSB7CiAJCWlmIChyZXQgIT0gLUVSRVNUQVJUU1lTKQotLSAKMi4yNS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
