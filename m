Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AB7A54E6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2019 13:31:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45CC89AF3;
	Mon,  2 Sep 2019 11:31:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 863EB89AF3
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Sep 2019 11:31:44 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l11so4834380wrx.5
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Sep 2019 04:31:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e7Xsv2Cgzc/LOhD+/++Nzp5vNva2EjBIgaO7wKng8Rc=;
 b=XYApuBqFgoaC/m6GQYuXg4fxNMCZJ0jnrXz1EiWQ3VOuRWHp6iGc1Pmz3+hYz6qMaw
 zJKDYHTRzw5gga2q1NT95goF+C/9lsWbDNIfUF0xNl798o3g/CX/yID6PdNSlFKxiWGJ
 q21n2SWpp1eO+n630+0X+wOgl89jGLvDiw1plRXZ/qHjEXccUQWtwsaFolMwtHTkB652
 sW+XVZaez4Q5Puz/efjRFzNtpCOD5flS84Ajg/3dLeTA+gl7R9hA3gh2pV0FriZz+Q34
 Tl4uHsnV04QhWUOV47AAOgesuyBvZh09gDUA1vhijO78DJ29Sgghwewj3JHQoScES4ID
 dVNQ==
X-Gm-Message-State: APjAAAWsNN+YhTm0NM1SyuB+ly9z1ZM/CRH4nark4RxMXMFBVFjAOuPC
 nWX44BCjT8EDo0V/NEixJQsxThKi
X-Google-Smtp-Source: APXvYqyEEtJOyvBeDrZd+IukiURPXI0ZeOXFV5ko4HASziwcPwpQY1tz+iUIfDsrvLw44HMzTYdQ0w==
X-Received: by 2002:adf:fd03:: with SMTP id e3mr26927710wrr.291.1567423902735; 
 Mon, 02 Sep 2019 04:31:42 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id r5sm13027756wmh.35.2019.09.02.04.31.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 04:31:41 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 09/21] drm/dp: Read channel coding capability from sink
Date: Mon,  2 Sep 2019 13:31:09 +0200
Message-Id: <20190902113121.31323-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902113121.31323-1-thierry.reding@gmail.com>
References: <20190902113121.31323-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e7Xsv2Cgzc/LOhD+/++Nzp5vNva2EjBIgaO7wKng8Rc=;
 b=MVmeltBuQfn94cSndU8qSvHTnSB9o2C/vWVMmvbTkKDKnR79aPB3xFPV3cUtJTxlqF
 KvG+vtgfe2hrLb5ZjGHE4cVmbtYK8LAa2Hqlf954gJqiG8ugib4hbG39JiD8xn1K+K2s
 y2nGY8eCXfSWTAwilmGRA9Sc4wwW4daGTwYWxVBuz0beUiwh66WgSVZw7ivuY4WLfqc0
 7n6tA0iVPpdbUvDxSLLuuI2QbeE9pXrMkj6xLXaaQy+UADJsjYvy8G1NbZcKZUb2t053
 SsYfFAihhR18f/DOvQ+Mxxv8OgOnq78xb1EXkH7qaonmywMms7q8uJVyP8smFpRJuS4O
 FA0g==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClBhcnNlIGZyb20gdGhl
IHNpbmsgY2FwYWJpbGl0aWVzIHdoZXRoZXIgb3Igbm90IGl0IHN1cHBvcnRzIEFOU0kgOEIvMTBC
CmNoYW5uZWwgY29kaW5nIGFzIHNwZWNpZmllZCBpbiBBTlNJIFgzLjIzMC0xOTk0LCBjbGF1c2Ug
MTEuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgfCAzICsrKwogaW5jbHVkZS9kcm0v
ZHJtX2RwX2hlbHBlci5oICAgICB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5j
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBjNDdkNzg5NzNjMWUuLjFj
MjM4MTk2YzhiNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0zNTcsNiArMzU3LDcgQEAg
c3RhdGljIHZvaWQgZHJtX2RwX2xpbmtfY2Fwc19yZXNldChzdHJ1Y3QgZHJtX2RwX2xpbmtfY2Fw
cyAqY2FwcykKIAljYXBzLT5lbmhhbmNlZF9mcmFtaW5nID0gZmFsc2U7CiAJY2Fwcy0+dHBzM19z
dXBwb3J0ZWQgPSBmYWxzZTsKIAljYXBzLT5mYXN0X3RyYWluaW5nID0gZmFsc2U7CisJY2Fwcy0+
Y2hhbm5lbF9jb2RpbmcgPSBmYWxzZTsKIH0KIAogdm9pZCBkcm1fZHBfbGlua19jYXBzX2NvcHko
c3RydWN0IGRybV9kcF9saW5rX2NhcHMgKmRlc3QsCkBAIC0zNjUsNiArMzY2LDcgQEAgdm9pZCBk
cm1fZHBfbGlua19jYXBzX2NvcHkoc3RydWN0IGRybV9kcF9saW5rX2NhcHMgKmRlc3QsCiAJZGVz
dC0+ZW5oYW5jZWRfZnJhbWluZyA9IHNyYy0+ZW5oYW5jZWRfZnJhbWluZzsKIAlkZXN0LT50cHMz
X3N1cHBvcnRlZCA9IHNyYy0+dHBzM19zdXBwb3J0ZWQ7CiAJZGVzdC0+ZmFzdF90cmFpbmluZyA9
IHNyYy0+ZmFzdF90cmFpbmluZzsKKwlkZXN0LT5jaGFubmVsX2NvZGluZyA9IHNyYy0+Y2hhbm5l
bF9jb2Rpbmc7CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kcF9saW5rX2NhcHNfY29weSk7CiAKQEAg
LTQxMiw2ICs0MTQsNyBAQCBpbnQgZHJtX2RwX2xpbmtfcHJvYmUoc3RydWN0IGRybV9kcF9hdXgg
KmF1eCwgc3RydWN0IGRybV9kcF9saW5rICpsaW5rKQogCWxpbmstPmNhcHMuZW5oYW5jZWRfZnJh
bWluZyA9IGRybV9kcF9lbmhhbmNlZF9mcmFtZV9jYXAodmFsdWVzKTsKIAlsaW5rLT5jYXBzLnRw
czNfc3VwcG9ydGVkID0gZHJtX2RwX3RwczNfc3VwcG9ydGVkKHZhbHVlcyk7CiAJbGluay0+Y2Fw
cy5mYXN0X3RyYWluaW5nID0gZHJtX2RwX2Zhc3RfdHJhaW5pbmdfY2FwKHZhbHVlcyk7CisJbGlu
ay0+Y2Fwcy5jaGFubmVsX2NvZGluZyA9IGRybV9kcF9jaGFubmVsX2NvZGluZ19zdXBwb3J0ZWQo
dmFsdWVzKTsKIAogCWxpbmstPnJhdGUgPSBsaW5rLT5tYXhfcmF0ZTsKIAlsaW5rLT5sYW5lcyA9
IGxpbmstPm1heF9sYW5lczsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIu
aCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCBhYjk4ZWJiMzAyYTkuLmQxNDRk
M2E1NGRiYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCisrKyBiL2lu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtOTUsNiArOTUsNyBAQAogIyBkZWZpbmUgRFBf
REVUQUlMRURfQ0FQX0lORk9fQVZBSUxBQkxFCSAgICAoMSA8PCA0KSAvKiBEUEkgKi8KIAogI2Rl
ZmluZSBEUF9NQUlOX0xJTktfQ0hBTk5FTF9DT0RJTkcgICAgICAgICAweDAwNgorIyBkZWZpbmUg
RFBfQ0FQX0FOU0lfOEIxMEIJCSAgICAoMSA8PCAwKQogCiAjZGVmaW5lIERQX0RPV05fU1RSRUFN
X1BPUlRfQ09VTlQJICAgIDB4MDA3CiAjIGRlZmluZSBEUF9QT1JUX0NPVU5UX01BU0sJCSAgICAw
eDBmCkBAIC0xMjE1LDYgKzEyMTYsMTIgQEAgZHJtX2RwX3Npbmtfc3VwcG9ydHNfZmVjKGNvbnN0
IHU4IGZlY19jYXBhYmxlKQogCXJldHVybiBmZWNfY2FwYWJsZSAmIERQX0ZFQ19DQVBBQkxFOwog
fQogCitzdGF0aWMgaW5saW5lIGJvb2wKK2RybV9kcF9jaGFubmVsX2NvZGluZ19zdXBwb3J0ZWQo
Y29uc3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCit7CisJcmV0dXJuIGRwY2RbRFBf
TUFJTl9MSU5LX0NIQU5ORUxfQ09ESU5HXSAmIERQX0NBUF9BTlNJXzhCMTBCOworfQorCiAvKgog
ICogRGlzcGxheVBvcnQgQVVYIGNoYW5uZWwKICAqLwpAQCAtMTM3MSwxMSArMTM3OCwxMyBAQCBp
bnQgZHJtX2RwX2RwY2RfcmVhZF9saW5rX3N0YXR1cyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAog
ICogQGVuaGFuY2VkX2ZyYW1pbmc6IGVuaGFuY2VkIGZyYW1pbmcgY2FwYWJpbGl0eSAobWFuZGF0
b3J5IGFzIG9mIERQIDEuMikKICAqIEB0cHMzX3N1cHBvcnRlZDogdHJhaW5pbmcgcGF0dGVybiBz
ZXF1ZW5jZSAzIHN1cHBvcnRlZCBmb3IgZXF1YWxpemF0aW9uCiAgKiBAZmFzdF90cmFpbmluZzog
QVVYIENIIGhhbmRzaGFrZSBub3QgcmVxdWlyZWQgZm9yIGxpbmsgdHJhaW5pbmcKKyAqIEBjaGFu
bmVsX2NvZGluZzogQU5TSSA4Qi8xMEIgY2hhbm5lbCBjb2RpbmcgY2FwYWJpbGl0eQogICovCiBz
dHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyB7CiAJYm9vbCBlbmhhbmNlZF9mcmFtaW5nOwogCWJvb2wg
dHBzM19zdXBwb3J0ZWQ7CiAJYm9vbCBmYXN0X3RyYWluaW5nOworCWJvb2wgY2hhbm5lbF9jb2Rp
bmc7CiB9OwogCiB2b2lkIGRybV9kcF9saW5rX2NhcHNfY29weShzdHJ1Y3QgZHJtX2RwX2xpbmtf
Y2FwcyAqZGVzdCwKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
