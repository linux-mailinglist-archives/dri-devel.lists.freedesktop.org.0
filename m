Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1F519ECE
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2019 16:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1502989D73;
	Fri, 10 May 2019 14:13:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD4089D66
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 14:13:21 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id i3so1965809wml.4
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2019 07:13:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vSMG+N7hPANlYs2uU2pbOrDIYXTh0p0GtIts8lliX7A=;
 b=ZTKrmD7qce084LDi9RgHZz+AT+4HkmqEu81YCHw8Rz3G5ejqENugotrBTpcsN/NwTD
 vWmWs6Q2MkjE5S7cPnTg2Udbt5qzYyppqDtFX77VnIUwCgNFDJmc6DtvcrnjO16NZYna
 FNb+Ao4icGbs50/4F1v2RnT92B5OK7gEWNtOxf7RqJfBBKAXln+3o7Ss7KgMJ6GhWO5X
 rw7JM6yRLVq4szK1p4goGWRorB7g2Z2A9BV9wqPLLnTUohMDS9DmRL/fd2vQXsUvyQQb
 Si1w2KkWdxqk6TPjzeB4gTWT1nPmauImfFM/dE2uA0pPArx4PHPml01/mJbMEOljb662
 M7Xw==
X-Gm-Message-State: APjAAAVuk9WRtQ4WevRhG+G4VgfXwoVlpKaNM2wwAOsj9dyoDajfKCKJ
 lol6H/JfTjDdQ+dfJBnC3/jHvX4p
X-Google-Smtp-Source: APXvYqzpFq9XXlWORJJKDsxPnBi5q0PRHln/3tpit6boaQ+62R2DpmyUjS2rTzzyuXeRoj90VMfdoQ==
X-Received: by 2002:a05:600c:224d:: with SMTP id
 a13mr6974211wmm.25.1557497600579; 
 Fri, 10 May 2019 07:13:20 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d0ce:46fc:479d:f2c1])
 by smtp.gmail.com with ESMTPSA id a5sm7218050wrt.10.2019.05.10.07.13.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 10 May 2019 07:13:19 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: Marek.Olsak@amd.com, David1.Zhou@amd.com, Prike.Liang@amd.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/amd/display: use ttm_eu_reserve_buffers instead of
 amdgpu_bo_reserve
Date: Fri, 10 May 2019 16:13:15 +0200
Message-Id: <20190510141316.1746-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190510141316.1746-1-christian.koenig@amd.com>
References: <20190510141316.1746-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vSMG+N7hPANlYs2uU2pbOrDIYXTh0p0GtIts8lliX7A=;
 b=CvJjyMmDopOZQ4JUGeNIpPnvHKnX6Uhq7rsc126tyb7vbyGylMpg35XTOKdsN76hbF
 wBLustwx3wUo8SVXYp1QpssQCLSswNne1J/TZ2f+q3AuC+hb9skt67IHeGiLlfOUgizy
 17/FOhEhfzGeO+xl99nsAvta1zyUH/tTwVFVbg3zBBnp2GCGlfitt1VWO0oGCZNbhAWH
 /59Eqy8eJ8hkFbKM/51XhyegpPSQY1iWM+rZBw7oyIm1hbYDfQJRztrDNzVCMsF6Vrwe
 uPxx5/B/Icuv3ExbskWeXg5vEDcTllnJ/P/jyxeXHlVXMN+0JC1KUuCeNogY+17pU5vY
 VmAw==
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

RnJvbTogQ2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KCmFkZCB0aWNrZXQgZm9y
IGRpc3BsYXkgYm8sIHNvIHRoYXQgaXQgY2FuIHByZWVtcHQgYnVzeSBiby4KCkNoYW5nZS1JZDog
STlmMDMxY2RjYzgyNjdkZTAwZTgxOWFlMzAzYmFhMGE1MmRmOGViYjkKU2lnbmVkLW9mZi1ieTog
Q2h1bm1pbmcgWmhvdSA8ZGF2aWQxLnpob3VAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlh
biBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KLS0tCiAuLi4vZ3B1L2RybS9hbWQv
ZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtLmMgfCAyMSArKysrKysrKysrKysrKy0tLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYwppbmRleCBk
N2Y5ZDM5OTg2NDEuLmY4ODFmNjY3ODQ5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbS5jCkBAIC00MTc2LDYgKzQxNzYsOSBAQCBzdGF0
aWMgaW50IGRtX3BsYW5lX2hlbHBlcl9wcmVwYXJlX2ZiKHN0cnVjdCBkcm1fcGxhbmUgKnBsYW5l
LAogCXN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2OwogCXN0cnVjdCBhbWRncHVfYm8gKnJibzsK
IAlzdHJ1Y3QgZG1fcGxhbmVfc3RhdGUgKmRtX3BsYW5lX3N0YXRlX25ldywgKmRtX3BsYW5lX3N0
YXRlX29sZDsKKwlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7CisJc3RydWN0IHR0bV92YWxpZGF0ZV9i
dWZmZXIgdHY7CisJc3RydWN0IHd3X2FjcXVpcmVfY3R4IHRpY2tldDsKIAl1aW50NjRfdCB0aWxp
bmdfZmxhZ3M7CiAJdWludDMyX3QgZG9tYWluOwogCWludCByOwpAQCAtNDE5Miw5ICs0MTk1LDE3
IEBAIHN0YXRpYyBpbnQgZG1fcGxhbmVfaGVscGVyX3ByZXBhcmVfZmIoc3RydWN0IGRybV9wbGFu
ZSAqcGxhbmUsCiAJb2JqID0gbmV3X3N0YXRlLT5mYi0+b2JqWzBdOwogCXJibyA9IGdlbV90b19h
bWRncHVfYm8ob2JqKTsKIAlhZGV2ID0gYW1kZ3B1X3R0bV9hZGV2KHJiby0+dGJvLmJkZXYpOwot
CXIgPSBhbWRncHVfYm9fcmVzZXJ2ZShyYm8sIGZhbHNlKTsKLQlpZiAodW5saWtlbHkociAhPSAw
KSkKKwlJTklUX0xJU1RfSEVBRCgmbGlzdCk7CisKKwl0di5ibyA9ICZyYm8tPnRibzsKKwl0di5u
dW1fc2hhcmVkID0gMTsKKwlsaXN0X2FkZCgmdHYuaGVhZCwgJmxpc3QpOworCisJciA9IHR0bV9l
dV9yZXNlcnZlX2J1ZmZlcnMoJnRpY2tldCwgJmxpc3QsIGZhbHNlLCBOVUxMKTsKKwlpZiAocikg
eworCQlkZXZfZXJyKGFkZXYtPmRldiwgImZhaWwgdG8gcmVzZXJ2ZSBibyAoJWQpXG4iLCByKTsK
IAkJcmV0dXJuIHI7CisJfQogCiAJaWYgKHBsYW5lLT50eXBlICE9IERSTV9QTEFORV9UWVBFX0NV
UlNPUikKIAkJZG9tYWluID0gYW1kZ3B1X2Rpc3BsYXlfc3VwcG9ydGVkX2RvbWFpbnMoYWRldik7
CkBAIC00MjA1LDIxICs0MjE2LDIxIEBAIHN0YXRpYyBpbnQgZG1fcGxhbmVfaGVscGVyX3ByZXBh
cmVfZmIoc3RydWN0IGRybV9wbGFuZSAqcGxhbmUsCiAJaWYgKHVubGlrZWx5KHIgIT0gMCkpIHsK
IAkJaWYgKHIgIT0gLUVSRVNUQVJUU1lTKQogCQkJRFJNX0VSUk9SKCJGYWlsZWQgdG8gcGluIGZy
YW1lYnVmZmVyIHdpdGggZXJyb3IgJWRcbiIsIHIpOwotCQlhbWRncHVfYm9fdW5yZXNlcnZlKHJi
byk7CisJCXR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZ0aWNrZXQsICZsaXN0KTsKIAkJcmV0
dXJuIHI7CiAJfQogCiAJciA9IGFtZGdwdV90dG1fYWxsb2NfZ2FydCgmcmJvLT50Ym8pOwogCWlm
ICh1bmxpa2VseShyICE9IDApKSB7CiAJCWFtZGdwdV9ib191bnBpbihyYm8pOwotCQlhbWRncHVf
Ym9fdW5yZXNlcnZlKHJibyk7CisJCXR0bV9ldV9iYWNrb2ZmX3Jlc2VydmF0aW9uKCZ0aWNrZXQs
ICZsaXN0KTsKIAkJRFJNX0VSUk9SKCIlcCBiaW5kIGZhaWxlZFxuIiwgcmJvKTsKIAkJcmV0dXJu
IHI7CiAJfQogCiAJYW1kZ3B1X2JvX2dldF90aWxpbmdfZmxhZ3MocmJvLCAmdGlsaW5nX2ZsYWdz
KTsKIAotCWFtZGdwdV9ib191bnJlc2VydmUocmJvKTsKKwl0dG1fZXVfYmFja29mZl9yZXNlcnZh
dGlvbigmdGlja2V0LCAmbGlzdCk7CiAKIAlhZmItPmFkZHJlc3MgPSBhbWRncHVfYm9fZ3B1X29m
ZnNldChyYm8pOwogCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
