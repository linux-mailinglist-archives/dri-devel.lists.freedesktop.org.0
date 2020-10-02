Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4210F280F31
	for <lists+dri-devel@lfdr.de>; Fri,  2 Oct 2020 10:47:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E18E16E283;
	Fri,  2 Oct 2020 08:47:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com
 [IPv6:2a00:1450:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23516E245
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 08:47:14 +0000 (UTC)
Received: by mail-ej1-x641.google.com with SMTP id i26so833660ejb.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Oct 2020 01:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cFt7BZi5Pubqe3hjqgJvgOxkZfsYrXcgJ1HvuiFiPeo=;
 b=oN7c1RPTN+WDVG6R4NGIZvObr+qQJvpqbIVUc9QXwxWoUAv8M9Mq1t7TMPVgD2qS+W
 puTuUi9hop6s8HMLGUFP2XI0+ydTr3S9CLwWhcEcF80izVZ9jm6nk2T1Lx+a9cmPVw+r
 NqLEBTFOczoGgBFNxjzdV91MShmaKjXffgIcf6ru4m63V4cxXOGfFXnEDUxShl4ZM06v
 XsK4VC3z4oHXTNYSDKd0kbgkTH2efV2bwz8OL9ZcD9i0757eUXJ8gcHAUOYmOlR9SLke
 VaG6kQYkJ9/LA1XOWFst6gedAo7FLSotiGsclBLxSbz40mmUt630kSVFTxjXKH5pu3l/
 wLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cFt7BZi5Pubqe3hjqgJvgOxkZfsYrXcgJ1HvuiFiPeo=;
 b=TuSq6I5WzK2gGB4JdlkZ5Xp6+d4ydJT8Gxg8YcGxaIUu6rKnzZmEQEeMD3pnp28//L
 Qo5w8QKIv+A2zMUPe15eTJEY59sLoyAShbLxq8iaZrLMkJ7xmy8yQKIZNNLrFwGZmOQU
 9MLQCWEZs4QEf8ZNJ9oTj9yjO4Sv6Ttw9D0GP8cP91V+eh+h3Dhi9aLDPJThN7IkahaH
 5+a6K1LcAbdTfSNUSWpjUczbIMGgOGaaWmbSDU16r9kmbFzVtlZp9Surx0SIJ1YMr7px
 KkjJbdmA8RcFrCYVrd7ISfqjDXqXGarrizHZMNRjP2Ze2ngqeGdM4HrSTNWI6yKixu40
 4ZyA==
X-Gm-Message-State: AOAM53027ZLOw4IIgBthFvlg8IxIV60T2XomaCQvOa8hpQ8RzwCrxFYL
 REywkj28HK2rRwLfe2B+zMnCfFU3YLI=
X-Google-Smtp-Source: ABdhPJxjbQsoJnryUISokUR+haz96v7hZuRnwFUwQpqHA0gqZosh3vSXxs7J45FjV22Ds2GxmBhyoQ==
X-Received: by 2002:a17:906:b7c1:: with SMTP id
 fy1mr1158086ejb.342.1601628433091; 
 Fri, 02 Oct 2020 01:47:13 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b0ce:8a95:8e6:b4f4])
 by smtp.gmail.com with ESMTPSA id t10sm659153edw.86.2020.10.02.01.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 01:47:12 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, ray.huang@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH 4/4] drm/vmwgfx: move ttm_bo_swapout_all into vmwgfx
Date: Fri,  2 Oct 2020 10:47:07 +0200
Message-Id: <20201002084707.2203-4-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201002084707.2203-1-christian.koenig@amd.com>
References: <20201002084707.2203-1-christian.koenig@amd.com>
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

SXQgaXMgdGhlIHNvbGUgdXNlciBvZiB0aGlzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvD
tm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX2JvLmMgICAgICAgIHwgMTEgLS0tLS0tLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2Rydi5jIHwgIDYgKysrKystCiBpbmNsdWRlL2RybS90dG0vdHRtX2JvX2FwaS5oICAg
ICAgICB8ICAxIC0KIDMgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jIGIvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fYm8uYwppbmRleCA1YzU4MzZjNDI4NGUuLjc0NzA4ZGQ0YThlOSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vdHRtL3R0bV9iby5jCkBAIC0xMzA4LDE3ICsxMzA4LDYgQEAgaW50IHR0bV9ib19zd2Fw
b3V0KHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4KQogfQogRVhQT1JUX1NZTUJPTCh0dG1f
Ym9fc3dhcG91dCk7CiAKLXZvaWQgdHRtX2JvX3N3YXBvdXRfYWxsKHZvaWQpCi17Ci0Jc3RydWN0
IHR0bV9vcGVyYXRpb25fY3R4IGN0eCA9IHsKLQkJLmludGVycnVwdGlibGUgPSBmYWxzZSwKLQkJ
Lm5vX3dhaXRfZ3B1ID0gZmFsc2UKLQl9OwotCi0Jd2hpbGUgKHR0bV9ib19zd2Fwb3V0KCZjdHgp
ID09IDApOwotfQotRVhQT1JUX1NZTUJPTCh0dG1fYm9fc3dhcG91dF9hbGwpOwotCiB2b2lkIHR0
bV9ib190dF9kZXN0cm95KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiB7CiAJaWYgKGJv
LT50dG0gPT0gTlVMTCkKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMKaW5kZXggMmY5OTA3
OWUxMjJiLi5kY2JjYjA0ZmYyN2MgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS92bXdnZngv
dm13Z2Z4X2Rydi5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4X2Rydi5jCkBA
IC0xMzY0LDYgKzEzNjQsMTAgQEAgc3RhdGljIGludCB2bXdfcG1fZnJlZXplKHN0cnVjdCBkZXZp
Y2UgKmtkZXYpCiAJc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGtkZXYpOwogCXN0
cnVjdCBkcm1fZGV2aWNlICpkZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRldik7CiAJc3RydWN0IHZt
d19wcml2YXRlICpkZXZfcHJpdiA9IHZtd19wcml2KGRldik7CisJc3RydWN0IHR0bV9vcGVyYXRp
b25fY3R4IGN0eCA9IHsKKwkJLmludGVycnVwdGlibGUgPSBmYWxzZSwKKwkJLm5vX3dhaXRfZ3B1
ID0gZmFsc2UKKwl9OwogCWludCByZXQ7CiAKIAkvKgpAQCAtMTM4NCw3ICsxMzg4LDcgQEAgc3Rh
dGljIGludCB2bXdfcG1fZnJlZXplKHN0cnVjdCBkZXZpY2UgKmtkZXYpCiAJdm13X2V4ZWNidWZf
cmVsZWFzZV9waW5uZWRfYm8oZGV2X3ByaXYpOwogCXZtd19yZXNvdXJjZV9ldmljdF9hbGwoZGV2
X3ByaXYpOwogCXZtd19yZWxlYXNlX2RldmljZV9lYXJseShkZXZfcHJpdik7Ci0JdHRtX2JvX3N3
YXBvdXRfYWxsKCk7CisJd2hpbGUgKHR0bV9ib19zd2Fwb3V0KCZjdHgpID09IDApOwogCWlmIChk
ZXZfcHJpdi0+ZW5hYmxlX2ZiKQogCQl2bXdfZmlmb19yZXNvdXJjZV9kZWMoZGV2X3ByaXYpOwog
CWlmIChhdG9taWNfcmVhZCgmZGV2X3ByaXYtPm51bV9maWZvX3Jlc291cmNlcykgIT0gMCkgewpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vdHRtL3R0bV9ib19hcGkuaCBiL2luY2x1ZGUvZHJtL3R0
bS90dG1fYm9fYXBpLmgKaW5kZXggZjBmYmVmNzgxN2M2Li42MzBjZTIyODhkZTcgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvZHJtL3R0bS90dG1fYm9fYXBpLmgKKysrIGIvaW5jbHVkZS9kcm0vdHRtL3R0
bV9ib19hcGkuaApAQCAtNTQyLDcgKzU0Miw2IEBAIHNzaXplX3QgdHRtX2JvX2lvKHN0cnVjdCB0
dG1fZGV2aWNlICpiZGV2LCBzdHJ1Y3QgZmlsZSAqZmlscCwKIAkJICBzaXplX3QgY291bnQsIGxv
ZmZfdCAqZl9wb3MsIGJvb2wgd3JpdGUpOwogCiBpbnQgdHRtX2JvX3N3YXBvdXQoc3RydWN0IHR0
bV9vcGVyYXRpb25fY3R4ICpjdHgpOwotdm9pZCB0dG1fYm9fc3dhcG91dF9hbGwodm9pZCk7CiAK
IC8qKgogICogdHRtX2JvX3VzZXNfZW1iZWRkZWRfZ2VtX29iamVjdCAtIGNoZWNrIGlmIHRoZSBn
aXZlbiBibyB1c2VzIHRoZQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
