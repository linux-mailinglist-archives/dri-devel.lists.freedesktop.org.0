Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A722A64BE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Nov 2020 14:00:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FEF26E14B;
	Wed,  4 Nov 2020 13:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7306B6E14B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Nov 2020 13:00:28 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id p93so22326755edd.7
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Nov 2020 05:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=23Cccxb6RuXPZczvPOgWsDdvCjv+mNzZAZdH/ArSwGg=;
 b=csb107U0pOdS1Z+yOk9WbtbxjmpN0eGM+dED3xLW1M+cQhpaYHaCBc3gRQmR2h4Ye6
 L2mMuKMLVGlD1azXzFUiqLlHPRvpZOzrvNwT9i+PfuLeq+ltgnspNog5vq7zHI157Ikz
 7OFLc9Hv7VdMPTaY6uy3YbuM1GQzPfeWYN+r+9GSB1xIiIJMS6WK+i4byXG1q8l41MhU
 jUY7JNng+TaStyjh4cc8llvmAoPZyHFAQ7Sf6anGBbEdXjVhuEU2IGqE+AHMf/8aS3gU
 BiHX7eSygWOQH78ryhJaHzLhC1sEM5S5iTCpQGmpdfw0pKc0c/LXKv1GbBtjb8HMTv/B
 XXLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=23Cccxb6RuXPZczvPOgWsDdvCjv+mNzZAZdH/ArSwGg=;
 b=jwiEsD/0xaj05nMCgTa/eBdNrKrJSA/oLKCtzqZoMS/dXXwyO9Tt+LO3CXgn+ayUs0
 CR8p8H9c93jDbH/meKonvsLN4QkKYhgSL/hokOnOrHe1UDX6Ko7WPy2KMVDGNhbls0Pn
 j78/6sbHr/Ulvyl7fMTLK7sw8S7zA6LD2VOQCYiiOBHdYeJ/MuKn4psJl3rxmU0S7Vr+
 TpOdxa+XKcGjs9G8+8CR/Mc+lsSG2SNO1+LRFk6XNJpKodGFYuzqyBqZXJdzYtp9lVdn
 m0cr/85DLF/DBMG+W/iGYpM9ic9KM0uMCOW0vNxpvbBXUbQdttEgxSEvekAew8J543Q/
 4Lhg==
X-Gm-Message-State: AOAM531fKwFEkEpvxnVaOI7ztLUpwQJsE7pC0woQibO/sVvQnZuxdnUX
 +NAlpN9tEOu769tlNOY39YgQRm4of+8=
X-Google-Smtp-Source: ABdhPJxPEZ3lndZBUhoiJZpEK4OjvITvy5ODnf73GUt1ZZGj7aaXG0Tv0KSYVyeWOfHJIZ/G86jjCA==
X-Received: by 2002:a05:6402:1cb2:: with SMTP id
 cz18mr11059506edb.388.1604494826857; 
 Wed, 04 Nov 2020 05:00:26 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:429e:5ba2:6ddc:d941])
 by smtp.gmail.com with ESMTPSA id l20sm978801eja.40.2020.11.04.05.00.26
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 05:00:26 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/amdgpu: stop using pages with
 drm_prime_sg_to_page_addr_arrays
Date: Wed,  4 Nov 2020 14:00:22 +0100
Message-Id: <20201104130024.264974-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201104130024.264974-1-christian.koenig@amd.com>
References: <20201104130024.264974-1-christian.koenig@amd.com>
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
aXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyB8IDYgKysrLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAz
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2Ft
ZGdwdV90dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRl
eCBjMDFjMDYwZTRhYzUuLmQ2NzgxYjQ3OTgzOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV90dG0uYwpAQCAtMTAzNiw4ICsxMDM2LDggQEAgc3RhdGljIGludCBhbWRncHVfdHRt
X3R0X3Bpbl91c2VycHRyKHN0cnVjdCB0dG1fYm9fZGV2aWNlICpiZGV2LAogCQlnb3RvIHJlbGVh
c2Vfc2c7CiAKIAkvKiBjb252ZXJ0IFNHIHRvIGxpbmVhciBhcnJheSBvZiBwYWdlcyBhbmQgZG1h
IGFkZHJlc3NlcyAqLwotCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2cs
IHR0bS0+cGFnZXMsCi0JCQkJCSBndHQtPnR0bS5kbWFfYWRkcmVzcywgdHRtLT5udW1fcGFnZXMp
OworCWRybV9wcmltZV9zZ190b19wYWdlX2FkZHJfYXJyYXlzKHR0bS0+c2csIE5VTEwsIGd0dC0+
dHRtLmRtYV9hZGRyZXNzLAorCQkJCQkgdHRtLT5udW1fcGFnZXMpOwogCiAJcmV0dXJuIDA7CiAK
QEAgLTEzODIsNyArMTM4Miw3IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X3R0bV90dF9wb3B1bGF0ZShz
dHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIAkJCXR0bS0+c2cgPSBzZ3Q7CiAJCX0KIAotCQlk
cm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNnLCB0dG0tPnBhZ2VzLAorCQlk
cm1fcHJpbWVfc2dfdG9fcGFnZV9hZGRyX2FycmF5cyh0dG0tPnNnLCBOVUxMLAogCQkJCQkJIGd0
dC0+dHRtLmRtYV9hZGRyZXNzLAogCQkJCQkJIHR0bS0+bnVtX3BhZ2VzKTsKIAkJcmV0dXJuIDA7
Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
