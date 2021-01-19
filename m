Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E3D2FB5C4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 12:48:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1373989B45;
	Tue, 19 Jan 2021 11:48:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C88289B45
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 11:48:45 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id g12so28075798ejf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 03:48:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5r/FjrrCdLZI6Zy/lRfB4xmTQg6SkJWSsT4W2XVVOw=;
 b=uEAw5hH90crzBz9EPvV+V3RaLlMOc5rCtv0YZ0ng/47gCjfJr93bJ17DvrB9kas9LC
 61q05W50gTAiI7lu5iPqStg8+GZEI1fZNVemnnvT1YPK5+4tSCi3YkeXWJ0iuCJ0ERG/
 k4XbNzNKlt7UUuyZ+62YVpj4QGxWjtuI8Qz0rSLReSyIEMxtF/nFqETKF1F7FO532Gv5
 d+rdxevGPNuBxYiG+Uu8bufseSwryzVoFmMCNG3V35BmzK4CuJb7BlMxFrR3d2vevwhV
 mEZJGRi8Aig0aJw6zkiwBrqFI8guyNfdwPro9d42gAYTStUx3e/O5aqRPtF7xPigXE2z
 kTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h5r/FjrrCdLZI6Zy/lRfB4xmTQg6SkJWSsT4W2XVVOw=;
 b=rSNcLHZywju2Kl2DGhTOQiIPmDXxZHZmHIyGsguAnfXaRvOdpV+y5esgjLv+dUucQy
 31HXylPiyWKH6WAdaeG/1zbU8jDWaTjRAruv65bUKtu0ewYoOgu78zT63aHOOMzCsE2X
 D3sJ2gT/CJyonY8UYilMYEt1yX9ZGP/8imdKDcyvQgYCVUpHV9IOsq5S3g5vaeURcni7
 3oAq6h4GbbpIKMtGfo7lAtteUcG2zZgj9pldV9oIfzK7RMXeKrKGQQ6DafJEbrAQLrtR
 lg33HKYoBREwjHS1mgsMmivLvCWdBudQw6NDdP2FLVjupwQtOtgznQq3icFNSl12zXpq
 MKzA==
X-Gm-Message-State: AOAM532qHmBnR5UTvajTNwoYoTNCYwATONNenf/lHU8PiA7b0x18bpRI
 ljZpYHdneV6SBMqVEQBOTBI=
X-Google-Smtp-Source: ABdhPJxXetfJzOWn9agKcOVfq33c7uhF56U3l4LCXn5HEyM8SgSLxWsMnpkWdhTXtfB1IU6URZ2MkQ==
X-Received: by 2002:a17:906:35c9:: with SMTP id
 p9mr2866440ejb.310.1611056923761; 
 Tue, 19 Jan 2021 03:48:43 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b05c:1403:9024:973b])
 by smtp.gmail.com with ESMTPSA id k6sm10632109ejb.84.2021.01.19.03.48.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 03:48:43 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: peterz@infradead.org,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/syncobj: make lockdep complain on WAIT_FOR_SUBMIT v3
Date: Tue, 19 Jan 2021 12:48:41 +0100
Message-Id: <20210119114841.2003-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RFJNX1NZTkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQgY2FuJ3QgYmUgdXNlZCB3aGVu
IHdlIGhvbGQgbG9ja3MKc2luY2Ugd2UgYXJlIGJhc2ljYWxseSB3YWl0aW5nIGZvciB1c2Vyc3Bh
Y2UgdG8gZG8gc29tZXRoaW5nLgoKSG9sZGluZyBhIGxvY2sgd2hpbGUgZG9pbmcgc28gY2FuIHRy
aXZpYWwgZGVhZGxvY2sgd2l0aCBwYWdlIGZhdWx0cwpldGMuLi4KClNvIG1ha2UgbG9ja2RlcCBj
b21wbGFpbiB3aGVuIGEgZHJpdmVyIHRyaWVzIHRvIGRvIHRoaXMuCgp2MjogQWRkIGxvY2tkZXBf
YXNzZXJ0X25vbmVfaGVsZCgpIG1hY3JvLgp2MzogQWRkIG1pZ2h0X3NsZWVwKCkgYW5kIGFsc28g
dXNlIGxvY2tkZXBfYXNzZXJ0X25vbmVfaGVsZCgpIGluIHRoZQogICAgSU9DVEwgcGF0aC4KClNp
Z25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8IDEyICsrKysrKysrKysrKwogaW5j
bHVkZS9saW51eC9sb2NrZGVwLmggICAgICAgfCAgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAx
NyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2Jq
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYwppbmRleCA2ZTc0ZTY3NDVlY2EuLjll
Y2ZlYzFlNTU2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMKQEAgLTM4Nyw2ICszODcsMTUgQEAgaW50
IGRybV9zeW5jb2JqX2ZpbmRfZmVuY2Uoc3RydWN0IGRybV9maWxlICpmaWxlX3ByaXZhdGUsCiAJ
aWYgKCFzeW5jb2JqKQogCQlyZXR1cm4gLUVOT0VOVDsKIAorCS8qIFdhaXRpbmcgZm9yIHVzZXJz
cGFjZSB3aXRoIGxvY2tzIGhlbHAgaXMgaWxsZWdhbCBjYXVzZSB0aGF0IGNhbgorCSAqIHRyaXZp
YWwgZGVhZGxvY2sgd2l0aCBwYWdlIGZhdWx0cyBmb3IgZXhhbXBsZS4gTWFrZSBsb2NrZGVwIGNv
bXBsYWluCisJICogYWJvdXQgaXQgZWFybHkgb24uCisJICovCisJaWYgKGZsYWdzICYgRFJNX1NZ
TkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQpIHsKKwkJbWlnaHRfc2xlZXAoKTsKKwkJ
bG9ja2RlcF9hc3NlcnRfbm9uZV9oZWxkX29uY2UoKTsKKwl9CisKIAkqZmVuY2UgPSBkcm1fc3lu
Y29ial9mZW5jZV9nZXQoc3luY29iaik7CiAJZHJtX3N5bmNvYmpfcHV0KHN5bmNvYmopOwogCkBA
IC05NDAsNiArOTQ5LDkgQEAgc3RhdGljIHNpZ25lZCBsb25nIGRybV9zeW5jb2JqX2FycmF5X3dh
aXRfdGltZW91dChzdHJ1Y3QgZHJtX3N5bmNvYmogKipzeW5jb2JqcywKIAl1aW50NjRfdCAqcG9p
bnRzOwogCXVpbnQzMl90IHNpZ25hbGVkX2NvdW50LCBpOwogCisJaWYgKGZsYWdzICYgRFJNX1NZ
TkNPQkpfV0FJVF9GTEFHU19XQUlUX0ZPUl9TVUJNSVQpCisJCWxvY2tkZXBfYXNzZXJ0X25vbmVf
aGVsZF9vbmNlKCk7CisKIAlwb2ludHMgPSBrbWFsbG9jX2FycmF5KGNvdW50LCBzaXplb2YoKnBv
aW50cyksIEdGUF9LRVJORUwpOwogCWlmIChwb2ludHMgPT0gTlVMTCkKIAkJcmV0dXJuIC1FTk9N
RU07CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2xvY2tkZXAuaCBiL2luY2x1ZGUvbGludXgv
bG9ja2RlcC5oCmluZGV4IGI5ZTlhZGVjNzNlOC4uNmViMTE3YzBkMGYzIDEwMDY0NAotLS0gYS9p
bmNsdWRlL2xpbnV4L2xvY2tkZXAuaAorKysgYi9pbmNsdWRlL2xpbnV4L2xvY2tkZXAuaApAQCAt
MzEwLDYgKzMxMCwxMCBAQCBleHRlcm4gdm9pZCBsb2NrX3VucGluX2xvY2soc3RydWN0IGxvY2tk
ZXBfbWFwICpsb2NrLCBzdHJ1Y3QgcGluX2Nvb2tpZSk7CiAJCVdBUk5fT05fT05DRShkZWJ1Z19s
b2NrcyAmJiAhbG9ja2RlcF9pc19oZWxkKGwpKTsJXAogCX0gd2hpbGUgKDApCiAKKyNkZWZpbmUg
bG9ja2RlcF9hc3NlcnRfbm9uZV9oZWxkX29uY2UoKQlkbyB7CQkJCVwKKwkJV0FSTl9PTl9PTkNF
KGRlYnVnX2xvY2tzICYmIGN1cnJlbnQtPmxvY2tkZXBfZGVwdGgpOwlcCisJfSB3aGlsZSAoMCkK
KwogI2RlZmluZSBsb2NrZGVwX3JlY3Vyc2luZyh0c2spCSgodHNrKS0+bG9ja2RlcF9yZWN1cnNp
b24pCiAKICNkZWZpbmUgbG9ja2RlcF9waW5fbG9jayhsKQlsb2NrX3Bpbl9sb2NrKCYobCktPmRl
cF9tYXApCkBAIC0zODcsNiArMzkxLDcgQEAgZXh0ZXJuIGludCBsb2NrZGVwX2lzX2hlbGQoY29u
c3Qgdm9pZCAqKTsKICNkZWZpbmUgbG9ja2RlcF9hc3NlcnRfaGVsZF93cml0ZShsKQlkbyB7ICh2
b2lkKShsKTsgfSB3aGlsZSAoMCkKICNkZWZpbmUgbG9ja2RlcF9hc3NlcnRfaGVsZF9yZWFkKGwp
CQlkbyB7ICh2b2lkKShsKTsgfSB3aGlsZSAoMCkKICNkZWZpbmUgbG9ja2RlcF9hc3NlcnRfaGVs
ZF9vbmNlKGwpCQlkbyB7ICh2b2lkKShsKTsgfSB3aGlsZSAoMCkKKyNkZWZpbmUgbG9ja2RlcF9h
c3NlcnRfbm9uZV9oZWxkX29uY2UoKQlkbyB7IH0gd2hpbGUgKDApCiAKICNkZWZpbmUgbG9ja2Rl
cF9yZWN1cnNpbmcodHNrKQkJCSgwKQogCi0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
