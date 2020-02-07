Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFFC155EE4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 20:51:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78B726FD8C;
	Fri,  7 Feb 2020 19:51:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B690A6FD86;
 Fri,  7 Feb 2020 19:51:18 +0000 (UTC)
Received: by mail-qk1-x744.google.com with SMTP id p10so116431qkk.5;
 Fri, 07 Feb 2020 11:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L1GhNIx2PtGdglnqeJklgMjlbabviVksiURR6t7YZis=;
 b=ikMmYJwCTIkBMS9frwO3MRwmVg354wSQuIMZBYbBsyO69KipXIap8s7uUsADUrP6e0
 +uT38HW+FWmEH39v6X5VHtzT0pD+GQbN/A4WThbNgSH09fXX2LeZd+QkVWWHbrqjeE94
 FBQAjtQDVwdew1hJQGNWlOKeb2qUwhCoOn9iOpzsOETAoP+EIPbDje5oi/247GRXx2Yi
 SHZ6g5ALx7aO6jRnd0KyXhXZ8hUr0bJXnnHGYxs6huJ0D43+sjJlQpF6IYXsEQzRqxJb
 kM7+fks8GxnKy1QQ+p0CHMmQQ1rfp5P1+322NfbWrOJ9oFNXIbu7VEaoTuKbh7EcPj46
 CN0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1GhNIx2PtGdglnqeJklgMjlbabviVksiURR6t7YZis=;
 b=i6O83fyuW2j2gjBJMVOua6Xz3MO1vs9QUT+zl6ACDihZJmaYDwFsbV1DThEfSRZ71S
 8AnvDMqIjk1TeT//bkhpWV8jc1KtyLOkd8+xaWx+LiqAxn7MbBPX/9t9ofiwiHPouyrL
 dxg3IjuzA90T+PfWj1qY6MlOVna6hF+JkRCSKpJjFbe7TUFFmn//XwOif5mdEpxwxlYc
 FUcKsETTpoL0s1RntRIqCjaqmLH9vaQOsJVqut/995n7/XSRjtSM+Z8zBAk3nZuXt2o6
 bvHZghHNkWedh+KmR+27FE1V4S+DttA2YgzCnNYc4vdQrLfbkvPae4cK4kdmf6BhYfto
 S5hQ==
X-Gm-Message-State: APjAAAXeI2nesTN5ixOShRK4PyR6iGqeaif5VmmWW4xs3qqRarw3P7Lt
 lWNAx64ZhTZipJIUP4YYzExjqS4T
X-Google-Smtp-Source: APXvYqxpLke40XqSCzKCHk+JIyQEP/Z1BLV1P0iqX7n8HbJTNgrar/wMOmzS4rTEdnNfYMzYtn4aRA==
X-Received: by 2002:a37:9bc6:: with SMTP id d189mr566083qke.44.1581105077709; 
 Fri, 07 Feb 2020 11:51:17 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id w16sm1752226qkj.135.2020.02.07.11.51.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Feb 2020 11:51:17 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 12/15] drm/amdgpu/display: add a late register connector
 callback
Date: Fri,  7 Feb 2020 14:50:55 -0500
Message-Id: <20200207195058.2354-13-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207195058.2354-1-alexander.deucher@amd.com>
References: <20200207195058.2354-1-alexander.deucher@amd.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VG8gaGFuZGxlIGRlYnVnZnMgc2V0dXAgb24gbm9uIERQIE1TVCBjb25uZWN0b3JzLgoKUmV2aWV3
ZWQtYnk6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgpBY2tlZC1ieTog
Q2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgpTaWduZWQtb2ZmLWJ5
OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Ci0tLQogLi4uL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jICB8IDE4ICsrKysrKysrKysrKysr
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVf
ZG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMK
aW5kZXggYWY4MTU1NzA4NTY5Li5iNjE5MDA3OWVkM2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwpAQCAtNDQ4Niw2ICs0NDg2LDE5
IEBAIGFtZGdwdV9kbV9jb25uZWN0b3JfYXRvbWljX2R1cGxpY2F0ZV9zdGF0ZShzdHJ1Y3QgZHJt
X2Nvbm5lY3RvciAqY29ubmVjdG9yKQogCXJldHVybiAmbmV3X3N0YXRlLT5iYXNlOwogfQogCitz
dGF0aWMgaW50CithbWRncHVfZG1fY29ubmVjdG9yX2xhdGVfcmVnaXN0ZXIoc3RydWN0IGRybV9j
b25uZWN0b3IgKmNvbm5lY3RvcikKK3sKKwlzdHJ1Y3QgYW1kZ3B1X2RtX2Nvbm5lY3RvciAqYW1k
Z3B1X2RtX2Nvbm5lY3RvciA9CisJCXRvX2FtZGdwdV9kbV9jb25uZWN0b3IoY29ubmVjdG9yKTsK
KworI2lmIGRlZmluZWQoQ09ORklHX0RFQlVHX0ZTKQorCWNvbm5lY3Rvcl9kZWJ1Z2ZzX2luaXQo
YW1kZ3B1X2RtX2Nvbm5lY3Rvcik7CisjZW5kaWYKKworCXJldHVybiAwOworfQorCiBzdGF0aWMg
Y29uc3Qgc3RydWN0IGRybV9jb25uZWN0b3JfZnVuY3MgYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9mdW5j
cyA9IHsKIAkucmVzZXQgPSBhbWRncHVfZG1fY29ubmVjdG9yX2Z1bmNzX3Jlc2V0LAogCS5kZXRl
Y3QgPSBhbWRncHVfZG1fY29ubmVjdG9yX2RldGVjdCwKQEAgLTQ0OTUsNiArNDUwOCw3IEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2Nvbm5lY3Rvcl9mdW5jcyBhbWRncHVfZG1fY29ubmVjdG9y
X2Z1bmNzID0gewogCS5hdG9taWNfZGVzdHJveV9zdGF0ZSA9IGRybV9hdG9taWNfaGVscGVyX2Nv
bm5lY3Rvcl9kZXN0cm95X3N0YXRlLAogCS5hdG9taWNfc2V0X3Byb3BlcnR5ID0gYW1kZ3B1X2Rt
X2Nvbm5lY3Rvcl9hdG9taWNfc2V0X3Byb3BlcnR5LAogCS5hdG9taWNfZ2V0X3Byb3BlcnR5ID0g
YW1kZ3B1X2RtX2Nvbm5lY3Rvcl9hdG9taWNfZ2V0X3Byb3BlcnR5LAorCS5sYXRlX3JlZ2lzdGVy
ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl9sYXRlX3JlZ2lzdGVyLAogCS5lYXJseV91bnJlZ2lzdGVy
ID0gYW1kZ3B1X2RtX2Nvbm5lY3Rvcl91bnJlZ2lzdGVyCiB9OwogCkBAIC01ODM0LDEwICs1ODQ4
LDYgQEAgc3RhdGljIGludCBhbWRncHVfZG1fY29ubmVjdG9yX2luaXQoc3RydWN0IGFtZGdwdV9k
aXNwbGF5X21hbmFnZXIgKmRtLAogCWRybV9jb25uZWN0b3JfYXR0YWNoX2VuY29kZXIoCiAJCSZh
Y29ubmVjdG9yLT5iYXNlLCAmYWVuY29kZXItPmJhc2UpOwogCi0jaWYgZGVmaW5lZChDT05GSUdf
REVCVUdfRlMpCi0JY29ubmVjdG9yX2RlYnVnZnNfaW5pdChhY29ubmVjdG9yKTsKLSNlbmRpZgot
CiAJaWYgKGNvbm5lY3Rvcl90eXBlID09IERSTV9NT0RFX0NPTk5FQ1RPUl9EaXNwbGF5UG9ydAog
CQl8fCBjb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05ORUNUT1JfZURQKQogCQlhbWRncHVf
ZG1faW5pdGlhbGl6ZV9kcF9jb25uZWN0b3IoZG0sIGFjb25uZWN0b3IpOwotLSAKMi4yNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
