Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E48C9264574
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 13:49:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 669296E90E;
	Thu, 10 Sep 2020 11:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE5256E908
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 11:49:09 +0000 (UTC)
Received: by mail-ej1-x644.google.com with SMTP id j11so8306414ejk.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fWzPWD8C6fPdCybwRhwQ4tEF0XEg5i7qlu4pHHlHFfg=;
 b=Is3USw1IjZQZ+ML+53RoQgMWmEFyiG8QG3f7Pj9GGDb54F8J1vfOiZMzFTuBBiZyaG
 9bk5xXMNF0tAm1YPnzuMR+crmHEUMaYuYZOcFy05uiY4u+fLo3FUfKDosIHmTiRkSM50
 N0dAQadKiEon6yFhbuZzHT7/6MTyINP9WBfVnFm6/pF8Vt2RD+d3A70q++HZ4f58WHGa
 itkFzd4Da1oVW23jg9yi1nfqvZCN8bhBxo40gh1lOej1xtFR40H8TEfnzUhRdjvplrOV
 7IHjT8BVEWiWs0BBaKM5mMbZg6PEkK6KE00T1gMPnpspwjja4qwXaJCXVz9nFKNSoy+G
 /TIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fWzPWD8C6fPdCybwRhwQ4tEF0XEg5i7qlu4pHHlHFfg=;
 b=lNPqNRSE/eG4Nh4MPQGG6K8v9FRXyXFMhbe8OF+Cu24GL/SdkREuu8W/KfWXbKgjfs
 NAaHlQFQH1Udo2UKCw2KsURV8AffuGKVs9+Fv7kCsyFqODzCx5aJtGtgeM5bm2l5wNO+
 gjMv6gU0Ablo/bAmv4V4FboArJqaAO7brCuJ67cq2iaY/JuD3hDQJyY8GyOSxEB8f7Hc
 YeCQNRjLun2637ljD7td3aPGq5+4wsWACDVZzWLDMwnjA4aIBOTE4D3Fkn06KOXidlmx
 1FZMDVKT4LmjKiTF5lChxxrm5qArHlhzWLK50INZDInnyB/xwPvaySLvdodKkmTukUw2
 Rjrg==
X-Gm-Message-State: AOAM533MeoVIydfD8P7JqJ5StSookfaEmVARVltFRO4T0BJ/tpleXJaQ
 vpgLeAeKB+4UBIuGC0fURZfQQMuaM0I=
X-Google-Smtp-Source: ABdhPJz+Yrbc1CtAoyZslDX7o1qUz5I5/WZqpgx4iHAX8Z3kdZsA5w0rwBYHOstpgzQwtHLY2Eb0Dg==
X-Received: by 2002:a17:906:6b0b:: with SMTP id
 q11mr8657116ejr.412.1599738548267; 
 Thu, 10 Sep 2020 04:49:08 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:70f6:b740:8639:ef8a])
 by smtp.gmail.com with ESMTPSA id q27sm6438007ejd.74.2020.09.10.04.49.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 04:49:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, airlied@gmail.com, bskeggs@redhat.com,
 kraxel@redhat.com
Subject: [PATCH 1/4] drm/vram-helper: stop using TTM placement flags
Date: Thu, 10 Sep 2020 13:49:03 +0200
Message-Id: <20200910114906.2873-1-christian.koenig@amd.com>
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

VGhvc2UgYXJlIGdvaW5nIHRvIGJlIHJlbW92ZWQsIHN0b3AgdXNpbmcgdGhlbSBoZXJlLgoKSW5z
dGVhZCBkZWZpbmUgc2VwYXJhdGUgZmxhZ3MgZm9yIHRoZSBoZWxwZXIuCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuYyB8IDE0ICsrKysrKysrKy0tLS0tCiBpbmNs
dWRlL2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmggICAgIHwgIDcgKysrLS0tLQogMiBmaWxlcyBj
aGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2dlbV92cmFtX2hlbHBlci5jCmluZGV4IDZhN2UwNzg4ZDhmMC4uYTg0YjhhMTdjNWQ2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV92cmFtX2hlbHBlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZ2VtX3ZyYW1faGVscGVyLmMKQEAgLTEzNSwyMCArMTM1LDIzIEBAIHN0
YXRpYyB2b2lkIHR0bV9idWZmZXJfb2JqZWN0X2Rlc3Ryb3koc3RydWN0IHR0bV9idWZmZXJfb2Jq
ZWN0ICpibykKIHN0YXRpYyB2b2lkIGRybV9nZW1fdnJhbV9wbGFjZW1lbnQoc3RydWN0IGRybV9n
ZW1fdnJhbV9vYmplY3QgKmdibywKIAkJCQkgICB1bnNpZ25lZCBsb25nIHBsX2ZsYWcpCiB7CisJ
dTMyIGludmFyaWFudF9mbGFncyA9IDA7CiAJdW5zaWduZWQgaW50IGk7CiAJdW5zaWduZWQgaW50
IGMgPSAwOwotCXUzMiBpbnZhcmlhbnRfZmxhZ3MgPSBwbF9mbGFnICYgVFRNX1BMX0ZMQUdfVE9Q
RE9XTjsKKworCWlmIChwbF9mbGFnICYgRFJNX0dFTV9WUkFNX1BMX0ZMQUdfVE9QRE9XTikKKwkJ
cGxfZmxhZyA9IFRUTV9QTF9GTEFHX1RPUERPV047CiAKIAlnYm8tPnBsYWNlbWVudC5wbGFjZW1l
bnQgPSBnYm8tPnBsYWNlbWVudHM7CiAJZ2JvLT5wbGFjZW1lbnQuYnVzeV9wbGFjZW1lbnQgPSBn
Ym8tPnBsYWNlbWVudHM7CiAKLQlpZiAocGxfZmxhZyAmIFRUTV9QTF9GTEFHX1ZSQU0pCisJaWYg
KHBsX2ZsYWcgJiBEUk1fR0VNX1ZSQU1fUExfRkxBR19WUkFNKQogCQlnYm8tPnBsYWNlbWVudHNb
YysrXS5mbGFncyA9IFRUTV9QTF9GTEFHX1dDIHwKIAkJCQkJICAgICBUVE1fUExfRkxBR19VTkNB
Q0hFRCB8CiAJCQkJCSAgICAgVFRNX1BMX0ZMQUdfVlJBTSB8CiAJCQkJCSAgICAgaW52YXJpYW50
X2ZsYWdzOwogCi0JaWYgKHBsX2ZsYWcgJiBUVE1fUExfRkxBR19TWVNURU0pCisJaWYgKHBsX2Zs
YWcgJiBEUk1fR0VNX1ZSQU1fUExfRkxBR19TWVNURU0pCiAJCWdiby0+cGxhY2VtZW50c1tjKytd
LmZsYWdzID0gVFRNX1BMX01BU0tfQ0FDSElORyB8CiAJCQkJCSAgICAgVFRNX1BMX0ZMQUdfU1lT
VEVNIHwKIAkJCQkJICAgICBpbnZhcmlhbnRfZmxhZ3M7CkBAIC0xODksNyArMTkyLDggQEAgc3Rh
dGljIGludCBkcm1fZ2VtX3ZyYW1faW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWFjY19z
aXplID0gdHRtX2JvX2RtYV9hY2Nfc2l6ZShiZGV2LCBzaXplLCBzaXplb2YoKmdibykpOwogCiAJ
Z2JvLT5iby5iZGV2ID0gYmRldjsKLQlkcm1fZ2VtX3ZyYW1fcGxhY2VtZW50KGdibywgVFRNX1BM
X0ZMQUdfVlJBTSB8IFRUTV9QTF9GTEFHX1NZU1RFTSk7CisJZHJtX2dlbV92cmFtX3BsYWNlbWVu
dChnYm8sIERSTV9HRU1fVlJBTV9QTF9GTEFHX1ZSQU0gfAorCQkJICAgICAgIERSTV9HRU1fVlJB
TV9QTF9GTEFHX1NZU1RFTSk7CiAKIAlyZXQgPSB0dG1fYm9faW5pdChiZGV2LCAmZ2JvLT5ibywg
c2l6ZSwgdHRtX2JvX3R5cGVfZGV2aWNlLAogCQkJICAmZ2JvLT5wbGFjZW1lbnQsIHBnX2FsaWdu
LCBmYWxzZSwgYWNjX3NpemUsCkBAIC02NDcsNyArNjUxLDcgQEAgc3RhdGljIGJvb2wgZHJtX2lz
X2dlbV92cmFtKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiBzdGF0aWMgdm9pZCBkcm1f
Z2VtX3ZyYW1fYm9fZHJpdmVyX2V2aWN0X2ZsYWdzKHN0cnVjdCBkcm1fZ2VtX3ZyYW1fb2JqZWN0
ICpnYm8sCiAJCQkJCSAgICAgICBzdHJ1Y3QgdHRtX3BsYWNlbWVudCAqcGwpCiB7Ci0JZHJtX2dl
bV92cmFtX3BsYWNlbWVudChnYm8sIFRUTV9QTF9GTEFHX1NZU1RFTSk7CisJZHJtX2dlbV92cmFt
X3BsYWNlbWVudChnYm8sIERSTV9HRU1fVlJBTV9QTF9GTEFHX1NZU1RFTSk7CiAJKnBsID0gZ2Jv
LT5wbGFjZW1lbnQ7CiB9CiAKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9o
ZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaAppbmRleCAwMzUzMzJm
MzcyM2YuLmE1ZTQ3N2JmOTZjYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2dlbV92cmFt
X2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9nZW1fdnJhbV9oZWxwZXIuaApAQCAtOSw3
ICs5LDYgQEAKICNpbmNsdWRlIDxkcm0vZHJtX21vZGVzLmg+CiAjaW5jbHVkZSA8ZHJtL3R0bS90
dG1fYm9fYXBpLmg+CiAjaW5jbHVkZSA8ZHJtL3R0bS90dG1fYm9fZHJpdmVyLmg+Ci0jaW5jbHVk
ZSA8ZHJtL3R0bS90dG1fcGxhY2VtZW50Lmg+CiAKICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4g
LyogZm9yIGNvbnRhaW5lcl9vZigpICovCiAKQEAgLTIwLDkgKzE5LDkgQEAgc3RydWN0IGRybV9z
aW1wbGVfZGlzcGxheV9waXBlOwogc3RydWN0IGZpbHA7CiBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Q7
CiAKLSNkZWZpbmUgRFJNX0dFTV9WUkFNX1BMX0ZMQUdfVlJBTQlUVE1fUExfRkxBR19WUkFNCi0j
ZGVmaW5lIERSTV9HRU1fVlJBTV9QTF9GTEFHX1NZU1RFTQlUVE1fUExfRkxBR19TWVNURU0KLSNk
ZWZpbmUgRFJNX0dFTV9WUkFNX1BMX0ZMQUdfVE9QRE9XTglUVE1fUExfRkxBR19UT1BET1dOCisj
ZGVmaW5lIERSTV9HRU1fVlJBTV9QTF9GTEFHX1NZU1RFTQkoMSA8PCAwKQorI2RlZmluZSBEUk1f
R0VNX1ZSQU1fUExfRkxBR19WUkFNCSgxIDw8IDEpCisjZGVmaW5lIERSTV9HRU1fVlJBTV9QTF9G
TEFHX1RPUERPV04JKDEgPDwgMikKIAogLyoKICAqIEJ1ZmZlci1vYmplY3QgaGVscGVycwotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
