Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAC8D367FE2
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 13:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A5C06E17E;
	Thu, 22 Apr 2021 11:58:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5A626E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 11:57:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id h10so53075036edt.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 04:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RyxbsL4I5tzT/D4sikUJuyWpnpV8fZPDZh0GZn+re0=;
 b=Y1v5JWuvjEQ1tr9GWsYtQOM2M3bawY7EJ1Wunxo+bdXnW4+pbzxxSp/ZKC7nt4gC7D
 qQF4OGglffNXCZhIZ94FSNXK8HbPOu7aeHVXnrOakJEk/ODibs3kptLtDj4n+NRDFfj2
 QygkSHogRLvcjVNgjDibw0kGMAiCdCJRDfQ7gfQcs9SW8WTV6kh1bKwdBxHsgCgs1ZeL
 cNJL77BtQNRFSqIBNo9xmnbgqSB1KUDrd36y8ziV9pyMqzM4sAgTn/C6pqCOmf1d6V/t
 3ZT1xKDOXfvVbfXpoVcb+Y4fL/JASEQ6XiAYqbpsCqFVhN1mj1FgtHNp0U3V31KlJR3K
 hVUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6RyxbsL4I5tzT/D4sikUJuyWpnpV8fZPDZh0GZn+re0=;
 b=Ob5/kvt3rvnBNBKX2Hd6+9nHDIxCXovvShPJ06zqX4F9YJmjgoz33dq6y56Nw2At6o
 TwqriYBQIrwjcmlF0m5tpxWCSQe+dSRnk7hqOPP8DHLdNANAfPeXepuoT4vXUu31oimp
 iK/jSI6nNatE+3jlXk23Il3N7sqm4uJIHWw6U+qMDjHYWcf7OcJU3hHRr5goWowlThiE
 8Tb7b0vGQBZASSjPU5SNCKrX1hatgTUO1rd+hfEAQEjnJRvLeKlYRiNDt0W6dVBL7SYo
 j4DjcZ/K3B667533gvVIxNF5KnUqXQ4einIF229cOl6V8XdJtTNfm+QaSZwZRHOgMqxl
 tj6Q==
X-Gm-Message-State: AOAM532Pypppf6SIiQqYoiPHVdGrIakl6qahK5Ne3JN+VOHV0pTmwkPb
 8B7dNuzKF+CyAAKpRtXtKVxyFviXDeo=
X-Google-Smtp-Source: ABdhPJz2HBTG1UxqQ8NyCBWnJoisfnGDS/LfQdhOyoHs4jAbwYrKox/P9RI5CMZ4NmPam1leUf9eAw==
X-Received: by 2002:a05:6402:8:: with SMTP id d8mr3317741edu.368.1619092678606; 
 Thu, 22 Apr 2021 04:57:58 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:6035:34f9:3e8d:a180])
 by smtp.gmail.com with ESMTPSA id o17sm1915128edt.92.2021.04.22.04.57.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 04:57:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix error handling if no BO can be swapped out v4
Date: Thu, 22 Apr 2021 13:57:57 +0200
Message-Id: <20210422115757.3946-1-christian.koenig@amd.com>
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
Cc: shiwu.zhang@amd.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogU2hpd3UgWmhhbmcgPHNoaXd1LnpoYW5nQGFtZC5jb20+CgpJbiBjYXNlIHRoYXQgYWxs
IHByZS1hbGxvY2F0ZWQgQk9zIGFyZSBidXN5LCBqdXN0IGNvbnRpbnVlIHRvIHBvcHVsYXRlCkJP
cyBzaW5jZSBsaWtlbHkgaGFsZiBvZiBzeXN0ZW0gbWVtb3J5IGluIHRvdGFsIGlzIHN0aWxsIGZy
ZWUuCgp2NCAoY2hrKTogZml4IGNvZGUgbW92ZWQgdG8gVk1XR0ZYIGFzIHdlbGwKClNpZ25lZC1v
ZmYtYnk6IFNoaXd1IFpoYW5nIDxzaGl3dS56aGFuZ0BhbWQuY29tPgpSZXZpZXdlZC1ieTogQ2hy
aXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBD
aHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL3R0bS90dG1fZGV2aWNlLmMgICAgfCAyICstCiBkcml2ZXJzL2dwdS9kcm0vdHRtL3R0
bV90dC5jICAgICAgICB8IDIgKysKIGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdHRtX21lbW9yeS5j
IHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMgYi9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9kZXZpY2UuYwppbmRleCAxZjIwMjQxNjRkNzIuLjVkYzkyYjA1NmYw
YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fZGV2aWNlLmMKQEAgLTExMiw3ICsxMTIsNyBAQCBpbnQgdHRt
X2dsb2JhbF9zd2Fwb3V0KHN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCAqY3R4LCBnZnBfdCBnZnBf
ZmxhZ3MpCiB7CiAJc3RydWN0IHR0bV9nbG9iYWwgKmdsb2IgPSAmdHRtX2dsb2I7CiAJc3RydWN0
IHR0bV9kZXZpY2UgKmJkZXY7Ci0JaW50IHJldCA9IC1FQlVTWTsKKwlpbnQgcmV0ID0gMDsKIAog
CW11dGV4X2xvY2soJnR0bV9nbG9iYWxfbXV0ZXgpOwogCWxpc3RfZm9yX2VhY2hfZW50cnkoYmRl
diwgJmdsb2ItPmRldmljZV9saXN0LCBkZXZpY2VfbGlzdCkgewpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL3R0bS90dG1fdHQuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3R0LmMKaW5k
ZXggNDhjNDA3Y2ZmMTEyLi41MzllMDIzMmNiM2IgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90dG0vdHRtX3R0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fdHQuYwpAQCAtMzI5
LDYgKzMyOSw4IEBAIGludCB0dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2UgKmJkZXYs
CiAJICAgICAgIHR0bV9kbWEzMl9wYWdlc19saW1pdCkgewogCiAJCXJldCA9IHR0bV9nbG9iYWxf
c3dhcG91dChjdHgsIEdGUF9LRVJORUwpOworCQlpZiAocmV0ID09IDApCisJCQlicmVhazsKIAkJ
aWYgKHJldCA8IDApCiAJCQlnb3RvIGVycm9yOwogCX0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92bXdnZngvdHRtX21lbW9yeS5jIGIvZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC90dG1fbWVt
b3J5LmMKaW5kZXggMTA0Yjk1YThjN2EyLi5hZWIwYTIyYTJjMzQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS92bXdnZngvdHRtX21lbW9yeS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92bXdn
ZngvdHRtX21lbW9yeS5jCkBAIC0yODAsNyArMjgwLDcgQEAgc3RhdGljIHZvaWQgdHRtX3Nocmlu
ayhzdHJ1Y3QgdHRtX21lbV9nbG9iYWwgKmdsb2IsIGJvb2wgZnJvbV93cSwKIAkJc3Bpbl91bmxv
Y2soJmdsb2ItPmxvY2spOwogCQlyZXQgPSB0dG1fZ2xvYmFsX3N3YXBvdXQoY3R4LCBHRlBfS0VS
TkVMKTsKIAkJc3Bpbl9sb2NrKCZnbG9iLT5sb2NrKTsKLQkJaWYgKHVubGlrZWx5KHJldCA8IDAp
KQorCQlpZiAodW5saWtlbHkocmV0IDw9IDApKQogCQkJYnJlYWs7CiAJfQogCi0tIAoyLjI1LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
