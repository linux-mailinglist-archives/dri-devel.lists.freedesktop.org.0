Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B202A54E4
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2242A89ACD;
	Mon,  2 Sep 2019 11:31:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D50089A56
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:40 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id y19so13663829wrd.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UuAX1Q/obsshJhXb3BsYkkCieyMsB5L6bSjqTkGzkgA=;
 b=DHAzzvobmh570rT5nVzyIgHuF+jA2DeOo+FqjKvoPnUrKAax2bde9ZaI2S3GmEP94R
 9c0TOCYI1Z3S2lMHbrKUBPYJWR6n2laEQ/nZNBHO4+c8YyWnlg4Wt+UVSjfEefQiQYXE
 hZluEdn86hkno91IIl8QmGtAX2B+M515f3ukPVcjFnKaiPVHYrg2A2JZF+Sgsdrse1IO
 DGsfml8PEg1eZLA/DKucrY2tIBZj/07TXbk7fr+eW1GCc1A22YrDFgu3OWRjs+978w1R
 yi6JbAPF1RUkUwEhdwPTJ/Bcb75UPD2AUw/FOpLh1kjbfyuxlkmTdXqPYjrl+sXnWTvC
 QYwQ==
X-Gm-Message-State: APjAAAVya9Ow+BGtRQ0ffdeCpya3kcQ957DAkZ3/XEs+nhHxsDM5aF5n
 dGbuunpSru3dDDAdyeWYJC2JfTz2
X-Google-Smtp-Source: APXvYqwnTNdAUwopfY81g4XO2b7UzS3b+tAAeSGHt+oGXOCqomhZgJX02KjLmimjXorVBnA0nJaq8w==
X-Received: by 2002:adf:fdd0:: with SMTP id i16mr35433894wrs.260.1567423898327; 
 Mon, 02 Sep 2019 04:31:38 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id o25sm10845982wmc.36.2019.09.02.04.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:37 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/21] drm/dp: Read fast training capability from link
Date: Mon,  2 Sep 2019 13:31:07 +0200
Message-Id: <20190902113121.31323-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UuAX1Q/obsshJhXb3BsYkkCieyMsB5L6bSjqTkGzkgA=;
 b=ZdiRMG/WN4/0cI7eEHAFNke3U64V/QNEUhjpJO9lblAgZB/315FkLcfQtNYsX3aUIj
 eiqmSH9AUrkKYzMfqW2HBthTSv1tjuGwpIWXkVS/ere+CWGVI8jF5kDoLrhNmFKXn0bT
 HFNPTc3gv32C23rX/GCsisMIGvPfp2Wq4K3xg2boqyatBN4uoSn9nlIA+CDk2CdxmioI
 mwqfnZLj8BWBpoiMWfIwHbcggnVaZHdTYRQJodLWK4k2TKdjLgRs/3bJUEgIuKNVFx0o
 OGBxwc6NOkFx2G/eY7vanZAu4EyDGXaNkKfGg/PZrQFGy1RkkCDO08PPKRGumYluygN3
 WbBA==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoaWxlIHByb2Jpbmcg
dGhlIERpc3BsYXlQb3J0IGxpbmssIHF1ZXJ5IHRoZSBmYXN0IHRyYWluaW5nIGNhcGFiaWxpdHku
CklmIHN1cHBvcnRlZCwgZHJpdmVycyBjYW4gdXNlIHRoZSBmYXN0IGxpbmsgdHJhaW5pbmcgc2Vx
dWVuY2UgaW5zdGVhZCBvZgp0aGUgbW9yZSBpbnZvbHZlZCBmdWxsIGxpbmsgdHJhaW5pbmcgc2Vx
dWVuY2UuCgpSZXZpZXdlZC1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5k
ZT4KU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0t
CiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgMyArKysKIGluY2x1ZGUvZHJtL2Ry
bV9kcF9oZWxwZXIuaCAgICAgfCA5ICsrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMiBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5kZXggY2RmNDllOGQ1ZTNhLi43NGU0
ZmNlYWNlN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpAQCAtMzU1LDEyICszNTUsMTQgQEAg
RVhQT1JUX1NZTUJPTChkcm1fZHBfZHBjZF9yZWFkX2xpbmtfc3RhdHVzKTsKIHN0YXRpYyB2b2lk
IGRybV9kcF9saW5rX2NhcHNfcmVzZXQoc3RydWN0IGRybV9kcF9saW5rX2NhcHMgKmNhcHMpCiB7
CiAJY2Fwcy0+ZW5oYW5jZWRfZnJhbWluZyA9IGZhbHNlOworCWNhcHMtPmZhc3RfdHJhaW5pbmcg
PSBmYWxzZTsKIH0KIAogdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHkoc3RydWN0IGRybV9kcF9s
aW5rX2NhcHMgKmRlc3QsCiAJCQkgICBjb25zdCBzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAqc3Jj
KQogewogCWRlc3QtPmVuaGFuY2VkX2ZyYW1pbmcgPSBzcmMtPmVuaGFuY2VkX2ZyYW1pbmc7CisJ
ZGVzdC0+ZmFzdF90cmFpbmluZyA9IHNyYy0+ZmFzdF90cmFpbmluZzsKIH0KIEVYUE9SVF9TWU1C
T0woZHJtX2RwX2xpbmtfY2Fwc19jb3B5KTsKIApAQCAtNDA2LDYgKzQwOCw3IEBAIGludCBkcm1f
ZHBfbGlua19wcm9iZShzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LCBzdHJ1Y3QgZHJtX2RwX2xpbmsg
KmxpbmspCiAJbGluay0+bWF4X2xhbmVzID0gZHJtX2RwX21heF9sYW5lX2NvdW50KHZhbHVlcyk7
CiAKIAlsaW5rLT5jYXBzLmVuaGFuY2VkX2ZyYW1pbmcgPSBkcm1fZHBfZW5oYW5jZWRfZnJhbWVf
Y2FwKHZhbHVlcyk7CisJbGluay0+Y2Fwcy5mYXN0X3RyYWluaW5nID0gZHJtX2RwX2Zhc3RfdHJh
aW5pbmdfY2FwKHZhbHVlcyk7CiAKIAlsaW5rLT5yYXRlID0gbGluay0+bWF4X3JhdGU7CiAJbGlu
ay0+bGFuZXMgPSBsaW5rLT5tYXhfbGFuZXM7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1f
ZHBfaGVscGVyLmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXggNjBiYjAzMGM4
NThkLi5jMTQ4ZjU2ODUxOTUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIu
aAorKysgYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTExNDMsNiArMTE0MywxMyBA
QCBkcm1fZHBfZW5oYW5jZWRfZnJhbWVfY2FwKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQ
X1NJWkVdKQogCQkoZHBjZFtEUF9NQVhfTEFORV9DT1VOVF0gJiBEUF9FTkhBTkNFRF9GUkFNRV9D
QVApOwogfQogCitzdGF0aWMgaW5saW5lIGJvb2wKK2RybV9kcF9mYXN0X3RyYWluaW5nX2NhcChj
b25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKK3sKKwlyZXR1cm4gZHBjZFtEUF9E
UENEX1JFVl0gPj0gMHgxMSAmJgorCQkoZHBjZFtEUF9NQVhfRE9XTlNQUkVBRF0gJiBEUF9OT19B
VVhfSEFORFNIQUtFX0xJTktfVFJBSU5JTkcpOworfQorCiBzdGF0aWMgaW5saW5lIGJvb2wKIGRy
bV9kcF90cHMzX3N1cHBvcnRlZChjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkK
IHsKQEAgLTEzNjIsOSArMTM2OSwxMSBAQCBpbnQgZHJtX2RwX2RwY2RfcmVhZF9saW5rX3N0YXR1
cyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogLyoqCiAgKiBzdHJ1Y3QgZHJtX2RwX2xpbmtfY2Fw
cyAtIERQIGxpbmsgY2FwYWJpbGl0aWVzCiAgKiBAZW5oYW5jZWRfZnJhbWluZzogZW5oYW5jZWQg
ZnJhbWluZyBjYXBhYmlsaXR5IChtYW5kYXRvcnkgYXMgb2YgRFAgMS4yKQorICogQGZhc3RfdHJh
aW5pbmc6IEFVWCBDSCBoYW5kc2hha2Ugbm90IHJlcXVpcmVkIGZvciBsaW5rIHRyYWluaW5nCiAg
Ki8KIHN0cnVjdCBkcm1fZHBfbGlua19jYXBzIHsKIAlib29sIGVuaGFuY2VkX2ZyYW1pbmc7CisJ
Ym9vbCBmYXN0X3RyYWluaW5nOwogfTsKIAogdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHkoc3Ry
dWN0IGRybV9kcF9saW5rX2NhcHMgKmRlc3QsCi0tIAoyLjIyLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
