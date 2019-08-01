Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DECA7D352
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 04:25:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B69276E32A;
	Thu,  1 Aug 2019 02:25:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09086E329
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 02:25:27 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id d1so335540pgp.4
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 19:25:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4/7lPl2rj2poXuP1vja8rgzK2p3rrqxqlKXCKLI5Gto=;
 b=f3DkMkkFedmTcTw5j5lrrber8iLzXxpsIKXT7bV/eHnTRgE/11UlCK21ZlPO1FyGAg
 YlBWpCyU6guKiKmtmxr41KCs7q6v4xldFTRyEYaL/ug77kV9rYYg1wV8tKOFxBK8jcJ4
 eLY1xmtVMwDgS0kq+S3M4BfVUeyr3WAm29yzh9+uEyrRfx5JJOlr7/LzrREQIXQEn0z9
 SrwSmMHdA5+34OOX8a+XhuBM6r6w0uReDRcJ+8a61MGYyghEp90PhEvkkXDDAvPFzmQ7
 WtEr4AEGQKLjXArLjSMMlVvpshler4VN0LsvEyqRAJFnLWHtKz0rTPjPeJEBPm3+Znyz
 qKOw==
X-Gm-Message-State: APjAAAWNftO0DBW2iKymk6SOmYWO3JEKEAESXcxQv9AVHQFaTEaMAaBt
 9fTx4uG04ZmkAYamiiBQkT9MLtu32JY=
X-Google-Smtp-Source: APXvYqyTgNA+YaDJtYUagVkxrlKlk1ovxvcfhMQCeIvTz1aod7hwAMYQ8L9ZUBBr8aIgeWpfm8tinQ==
X-Received: by 2002:aa7:957c:: with SMTP id x28mr50375901pfq.42.1564626326973; 
 Wed, 31 Jul 2019 19:25:26 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:202:201:bc97:5740:52a7:6875])
 by smtp.gmail.com with ESMTPSA id v184sm64911342pgd.34.2019.07.31.19.25.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 31 Jul 2019 19:25:26 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 2/6] udmabuf: add ability to set access flags on udmabuf
Date: Wed, 31 Jul 2019 19:25:13 -0700
Message-Id: <20190801022517.1903-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190801022517.1903-1-gurchetansingh@chromium.org>
References: <20190801022517.1903-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4/7lPl2rj2poXuP1vja8rgzK2p3rrqxqlKXCKLI5Gto=;
 b=IHg6oecjlDp60ex8JeF95PK5CARL4+ekOWZv75Om8ifP8nadS8rErNorIUH/DrDtL5
 VWB8Rlt+IRHjOdhVOqYw8hS07D990c44TquhL9M8MjHWA1xxuXJ5p+dZ47z/S4qIl16m
 sOC0sWbJ3D8t8Oci+RbBBGCN4w/6psn3HBp/A=
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
Cc: kraxel@redhat.com, Gurchetan Singh <gurchetansingh@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1haW4gdXNlIGZvciB1ZG1hYnVmIGlzIHNlbmRpbmcgZ3Vlc3QgbWVtb3J5IHBhZ2VzCnRv
IHRoZSBob3N0LgoKSXQncyBnZW5lcmFsbHkgYSBiYWQgaWRlYSB0byBoYXZlIHRvIHNlcGFyYXRl
IG1hcHBpbmdzIHdpdGgKZGlmZmVyZW50IGF0dHJpYnV0ZXMuIEZvciBleGFtcGxlLCBhIFdDIG1h
cHBpbmcgdGhlIGd1ZXN0Cmtlcm5lbCBhbmQgY2FjaGVkIG1hcHBpbmcgb24gdGhlIGhvc3QgaXMg
cHJvYmxlbWF0aWMuCgpBZGQgY3JlYXRpb24gdGltZSBmbGFncyBzbyB0aGUgdXNlciBoYXMgcmVz
cG9uc2liaWxpdHkgZm9yCnRoZSBzcGVjaWZpYyB1c2UgY2FzZS4KClNpZ25lZC1vZmYtYnk6IEd1
cmNoZXRhbiBTaW5naCA8Z3VyY2hldGFuc2luZ2hAY2hyb21pdW0ub3JnPgotLS0KIGRyaXZlcnMv
ZG1hLWJ1Zi91ZG1hYnVmLmMgICAgfCA3ICsrKysrKy0KIGluY2x1ZGUvdWFwaS9saW51eC91ZG1h
YnVmLmggfCA1ICsrKystCiAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9kbWEtYnVmL3VkbWFidWYuYyBiL2RyaXZl
cnMvZG1hLWJ1Zi91ZG1hYnVmLmMKaW5kZXggYjM0NWU5MWQ4MzFhLi40ZWNmMmE5NGZlZDMgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi91ZG1hYnVmLmMKKysrIGIvZHJpdmVycy9kbWEtYnVm
L3VkbWFidWYuYwpAQCAtMTg2LDcgKzE4NiwxMiBAQCBzdGF0aWMgbG9uZyB1ZG1hYnVmX2NyZWF0
ZShjb25zdCBzdHJ1Y3QgdWRtYWJ1Zl9jcmVhdGVfbGlzdCAqaGVhZCwKIAlleHBfaW5mby5vcHMg
ID0gJnVkbWFidWZfb3BzOwogCWV4cF9pbmZvLnNpemUgPSB1YnVmLT5wYWdlY291bnQgPDwgUEFH
RV9TSElGVDsKIAlleHBfaW5mby5wcml2ID0gdWJ1ZjsKLQlleHBfaW5mby5mbGFncyA9IE9fUkRX
UjsKKworCWlmICgoaGVhZC0+ZmxhZ3MgJiBVRE1BQlVGX0ZMQUdTX1BST1RfUkVBRCkgJiYKKwkg
ICAgKGhlYWQtPmZsYWdzICYgVURNQUJVRl9GTEFHU19QUk9UX1dSSVRFKSkKKwkJZXhwX2luZm8u
ZmxhZ3MgPSBPX1JEV1I7CisJZWxzZSBpZiAoaGVhZC0+ZmxhZ3MgJiBVRE1BQlVGX0ZMQUdTX1BS
T1RfV1JJVEUpCisJCWV4cF9pbmZvLmZsYWdzID0gT19XUk9OTFk7CiAKIAlidWYgPSBkbWFfYnVm
X2V4cG9ydCgmZXhwX2luZm8pOwogCWlmIChJU19FUlIoYnVmKSkgewpkaWZmIC0tZ2l0IGEvaW5j
bHVkZS91YXBpL2xpbnV4L3VkbWFidWYuaCBiL2luY2x1ZGUvdWFwaS9saW51eC91ZG1hYnVmLmgK
aW5kZXggNDZiNjUzMmVkODU1Li4yMTI5MGNiOTY5NmMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvdWFw
aS9saW51eC91ZG1hYnVmLmgKKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3VkbWFidWYuaApAQCAt
NSw3ICs1LDEwIEBACiAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC9p
b2N0bC5oPgogCi0jZGVmaW5lIFVETUFCVUZfRkxBR1NfQ0xPRVhFQwkweDAxCisjZGVmaW5lIFVE
TUFCVUZfRkxBR1NfQ0xPRVhFQyAgICAweDAxCisjZGVmaW5lIFVETUFCVUZfRkxBR1NfUFJPVF9O
T05FICAweDAyCisjZGVmaW5lIFVETUFCVUZfRkxBR1NfUFJPVF9SRUFEICAweDA0CisjZGVmaW5l
IFVETUFCVUZfRkxBR1NfUFJPVF9XUklURSAweDA4CiAKIHN0cnVjdCB1ZG1hYnVmX2NyZWF0ZSB7
CiAJX191MzIgbWVtZmQ7Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2RyaS1kZXZlbA==
