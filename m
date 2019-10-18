Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382AADC440
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 13:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52766EB2D;
	Fri, 18 Oct 2019 11:58:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64E06EB2B;
 Fri, 18 Oct 2019 11:58:34 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id m18so5849136wmc.1;
 Fri, 18 Oct 2019 04:58:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pKlO/qQntlPw9iSULuUJ8lIG0N8Chmocv+nDMWIp3Q8=;
 b=XI2aiUFrw3u23wx1CFLiKBUj5OMt1p4D8GM9DCJc9Gu8NhqFYkHiWSMHF2aVBJTwZ6
 UFeZD5WokjpWNUd3hUw3RDdl65rqxx3tx8fcOVx9tNWjQ/v5RD7ppuTcmQeyE35jmKY+
 +eA1D56dfiMMnhSxucw8mmPvuFwZOm3qztfB3anF8Je7J+enR0DrCY4bA1UcV6Jqtlhg
 gfvA+10xtEX4Z87AnxFYo0eyASyvsLLAGhXr+O+5Q/+cWVsEtF62o2iN0LhkoGxWjcEl
 xiFIqyAu8V4sIiEhicjVMkb7UruRpCtJ57dCp+I4R+TK3MLk+boDqObKaHBWRLi8wd1L
 pdTQ==
X-Gm-Message-State: APjAAAXmFdYss+YyYigi9ZsDTZpkDiNGOgzSPIC+WQklDdJP0s7cfN2/
 Z1aXDRVTbuWHbvVANcsKKMqhBojm
X-Google-Smtp-Source: APXvYqyaTPYlSth72HSaKwIcrD0yb+5+yUYuNre9km3aNWVz02KAsmGnYWrH+eEzW7PBhJpkuz+gfA==
X-Received: by 2002:a05:600c:241:: with SMTP id 1mr6993786wmj.2.1571399913337; 
 Fri, 18 Oct 2019 04:58:33 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:647d:fe1:fb21:ab57])
 by smtp.gmail.com with ESMTPSA id h125sm7006255wmf.31.2019.10.18.04.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2019 04:58:32 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Subject: [PATCH] drm/ttm: use the parent resv for ghost objects v2
Date: Fri, 18 Oct 2019 13:58:31 +0200
Message-Id: <20191018115831.14951-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pKlO/qQntlPw9iSULuUJ8lIG0N8Chmocv+nDMWIp3Q8=;
 b=L65qTKvrYfpRyc7J4kF48ChITH8FrjdxahdXEp1PFY35CQd636pYEx8pB4F4LMDRkd
 JXYX3gmwMhDTKRNjZO/eUnYa6+GuLLMRLlqL5WcRb0KArgZoazDfMd4UUmfdcUbSWY4v
 R+JOpGKTxwrwV9WwtTZ5PIndKi/hQCHq7GrxJ2iZRy4gsMgATx1VYml+9gyKujh42yvL
 twDo8G4h/KIUxnueIFISlJUMytwc+8D8qJ9nwy/eySVDfDUrMkpMwtCCtPw3yVJtjhC+
 SQqnJ6V9TYaIIBRV/mcMrB3OxbX4nToSPcx0L1Mjf4yoQEapwj4DnCzwAQxlYRTqd/Au
 RjIw==
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

VGhpcyB3YXkgdGhlIFRUTSBpcyBkZXN0cm95ZWQgd2l0aCB0aGUgY29ycmVjdCBkbWFfcmVzdiBv
YmplY3QKbG9ja2VkIGFuZCB3ZSBjYW4gZXZlbiBwaXBlbGluZSBpbXBvcnRlZCBCTyBldmljdGlv
bnMuCgp2MjogTGltaXQgdGhpcyB0byBvbmx5IGNhc2VzIHdoZW4gdGhlIHBhcmVudCBvYmplY3Qg
dXNlcyBhIHNlcGFyYXRlCiAgICByZXNlcnZhdGlvbiBvYmplY3QgYXMgd2VsbC4gVGhpcyBmaXhl
cyBhbm90aGVyIE9PTSBwcm9ibGVtLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8
Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
X3V0aWwuYyB8IDE2ICsrKysrKysrKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3R0bS90
dG1fYm9fdXRpbC5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCmluZGV4IGUw
MzBjMjdmNTNjZi4uNDVlNDQwZjgwYjdiIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdHRt
L3R0bV9ib191dGlsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdXRpbC5jCkBA
IC01MTIsNyArNTEyLDkgQEAgc3RhdGljIGludCB0dG1fYnVmZmVyX29iamVjdF90cmFuc2Zlcihz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAogCWtyZWZfaW5pdCgmZmJvLT5iYXNlLmtyZWYp
OwogCWZiby0+YmFzZS5kZXN0cm95ID0gJnR0bV90cmFuc2ZlcmVkX2Rlc3Ryb3k7CiAJZmJvLT5i
YXNlLmFjY19zaXplID0gMDsKLQlmYm8tPmJhc2UuYmFzZS5yZXN2ID0gJmZiby0+YmFzZS5iYXNl
Ll9yZXN2OworCWlmIChiby0+YmFzZS5yZXN2ID09ICZiby0+YmFzZS5fcmVzdikKKwkJZmJvLT5i
YXNlLmJhc2UucmVzdiA9ICZmYm8tPmJhc2UuYmFzZS5fcmVzdjsKKwogCWRtYV9yZXN2X2luaXQo
ZmJvLT5iYXNlLmJhc2UucmVzdik7CiAJcmV0ID0gZG1hX3Jlc3ZfdHJ5bG9jayhmYm8tPmJhc2Uu
YmFzZS5yZXN2KTsKIAlXQVJOX09OKCFyZXQpOwpAQCAtNzExLDcgKzcxMyw3IEBAIGludCB0dG1f
Ym9fbW92ZV9hY2NlbF9jbGVhbnVwKHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8sCiAJCWlm
IChyZXQpCiAJCQlyZXR1cm4gcmV0OwogCi0JCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKGdob3N0
X29iai0+YmFzZS5yZXN2LCBmZW5jZSk7CisJCWRtYV9yZXN2X2FkZF9leGNsX2ZlbmNlKCZnaG9z
dF9vYmotPmJhc2UuX3Jlc3YsIGZlbmNlKTsKIAogCQkvKioKIAkJICogSWYgd2UncmUgbm90IG1v
dmluZyB0byBmaXhlZCBtZW1vcnksIHRoZSBUVE0gb2JqZWN0CkBAIC03MjQsNyArNzI2LDcgQEAg
aW50IHR0bV9ib19tb3ZlX2FjY2VsX2NsZWFudXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpi
bywKIAkJZWxzZQogCQkJYm8tPnR0bSA9IE5VTEw7CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9z
dF9vYmopOworCQlkbWFfcmVzdl91bmxvY2soJmdob3N0X29iai0+YmFzZS5fcmVzdik7CiAJCXR0
bV9ib19wdXQoZ2hvc3Rfb2JqKTsKIAl9CiAKQEAgLTc2Nyw3ICs3NjksNyBAQCBpbnQgdHRtX2Jv
X3BpcGVsaW5lX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJaWYgKHJldCkK
IAkJCXJldHVybiByZXQ7CiAKLQkJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2UoZ2hvc3Rfb2JqLT5i
YXNlLnJlc3YsIGZlbmNlKTsKKwkJZG1hX3Jlc3ZfYWRkX2V4Y2xfZmVuY2UoJmdob3N0X29iai0+
YmFzZS5fcmVzdiwgZmVuY2UpOwogCiAJCS8qKgogCQkgKiBJZiB3ZSdyZSBub3QgbW92aW5nIHRv
IGZpeGVkIG1lbW9yeSwgdGhlIFRUTSBvYmplY3QKQEAgLTc4MCw3ICs3ODIsNyBAQCBpbnQgdHRt
X2JvX3BpcGVsaW5lX21vdmUoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywKIAkJZWxzZQog
CQkJYm8tPnR0bSA9IE5VTEw7CiAKLQkJdHRtX2JvX3VucmVzZXJ2ZShnaG9zdF9vYmopOworCQlk
bWFfcmVzdl91bmxvY2soJmdob3N0X29iai0+YmFzZS5fcmVzdik7CiAJCXR0bV9ib19wdXQoZ2hv
c3Rfb2JqKTsKIAogCX0gZWxzZSBpZiAoZnJvbS0+ZmxhZ3MgJiBUVE1fTUVNVFlQRV9GTEFHX0ZJ
WEVEKSB7CkBAIC04MzYsNyArODM4LDcgQEAgaW50IHR0bV9ib19waXBlbGluZV9ndXR0aW5nKHN0
cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAot
CXJldCA9IGRtYV9yZXN2X2NvcHlfZmVuY2VzKGdob3N0LT5iYXNlLnJlc3YsIGJvLT5iYXNlLnJl
c3YpOworCXJldCA9IGRtYV9yZXN2X2NvcHlfZmVuY2VzKCZnaG9zdC0+YmFzZS5fcmVzdiwgYm8t
PmJhc2UucmVzdik7CiAJLyogTGFzdCByZXNvcnQsIHdhaXQgZm9yIHRoZSBCTyB0byBiZSBpZGxl
IHdoZW4gd2UgYXJlIE9PTSAqLwogCWlmIChyZXQpCiAJCXR0bV9ib193YWl0KGJvLCBmYWxzZSwg
ZmFsc2UpOwpAQCAtODQ1LDcgKzg0Nyw3IEBAIGludCB0dG1fYm9fcGlwZWxpbmVfZ3V0dGluZyhz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJvKQogCWJvLT5tZW0ubWVtX3R5cGUgPSBUVE1fUExf
U1lTVEVNOwogCWJvLT50dG0gPSBOVUxMOwogCi0JdHRtX2JvX3VucmVzZXJ2ZShnaG9zdCk7CisJ
ZG1hX3Jlc3ZfdW5sb2NrKCZnaG9zdC0+YmFzZS5fcmVzdik7CiAJdHRtX2JvX3B1dChnaG9zdCk7
CiAKIAlyZXR1cm4gMDsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
