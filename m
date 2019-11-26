Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDD410A095
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:43:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037CF6E114;
	Tue, 26 Nov 2019 14:43:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F288A6E114;
 Tue, 26 Nov 2019 14:43:21 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id g1so12277114qtj.6;
 Tue, 26 Nov 2019 06:43:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dL91F2YjjPBftVhRsoKkOhqcfv8zbWXJmYKKjtVRIZM=;
 b=fQ82PZ29QdWYO5U5LeU2qNcyhFLWt5vQ3sI1r4WSQc90KKnBUI1d2suERb/fkmyVvS
 imr2hQhSviAKPQQyJ1Fd6PkA4/E0ed8/G5nZ7cdZ3KP5qsZV9z1iB4o5eGillhjJ9O3s
 IeBB1bd8dZL94ob54xlK1AOKQ0cbOCQfqTMe5E7Od04FhajbIw0ikPjLvVJZqe817sz5
 rFm4dP0yRh7h6JTZiZsBRB+jY0L7AffKJ3rz4hXlX2JAL3UZrddUU/TBv9VLiIOl8jKp
 Dm1d77kCrKdSywlVG5ytOk2dUCetFlHszHxE0Zj1tJTtFqG+XsPknXLv7fC0EVpIdo+/
 8DjQ==
X-Gm-Message-State: APjAAAW0I78MQ1HykF58K/mjY0KmV303AhtMm6YyknkFpBLM5PqXaELX
 8uBbWiGB54LHHNlCU6+b49216BDR
X-Google-Smtp-Source: APXvYqxZwnUsCEzxdb2lYnQrkrU7sz3wDrZcFjlEMunfXxt+bjwck1GUI5Njgly7HVmTqFxAlGiahQ==
X-Received: by 2002:ac8:5308:: with SMTP id t8mr21900914qtn.51.1574779400554; 
 Tue, 26 Nov 2019 06:43:20 -0800 (PST)
Received: from localhost.localdomain ([71.219.59.120])
 by smtp.gmail.com with ESMTPSA id g7sm5168984qkl.20.2019.11.26.06.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Nov 2019 06:43:19 -0800 (PST)
From: Alex Deucher <alexdeucher@gmail.com>
X-Google-Original-From: Alex Deucher <alexander.deucher@amd.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/radeon: fix r1xx/r2xx register checker for POT textures
Date: Tue, 26 Nov 2019 09:43:10 -0500
Message-Id: <20191126144310.23717-1-alexander.deucher@amd.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dL91F2YjjPBftVhRsoKkOhqcfv8zbWXJmYKKjtVRIZM=;
 b=GJW4PLUOwldCWVBhDRYZNVUaksMZBggVfklgLrIPAhIhLUcb38DfStubDBl6Ma+FOe
 2ORFNZsPB431z03UyBoWZmklkDtQqnNlZWnJa0IABIG0CstTgS3cR3Dh65A17RYIHHs5
 l7/CLzDtueBN+o6T8ljWZXIgDs/z6NWBmzXhc12X7nAKXY2Pkf83VpO++6mRc5Ax5MSd
 Io+4nDcvq+mxq8iJLzYutOeU2HnyfO4vnAUGGk/lqVvTo76wxbhUVtsAv53s8XWtOQSu
 lTWhG0zp20TZ/+4XPmfG4ACejaiuOc9O22aM1OKl2OWi0nC+xk05EW6jVh40HDlPFkIR
 lTbA==
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
Cc: Alex Deucher <alexander.deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2hpZnQgYW5kIG1hc2sgd2VyZSByZXZlcnNlZC4gIE5vdGljZWQgYnkgY2hhbmNlLgoKU2lnbmVk
LW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgotLS0KIGRy
aXZlcnMvZ3B1L2RybS9yYWRlb24vcjEwMC5jIHwgNCArKy0tCiBkcml2ZXJzL2dwdS9kcm0vcmFk
ZW9uL3IyMDAuYyB8IDQgKystLQogMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IxMDAuYwppbmRleCA3MDg5ZGZjOGMyYTkuLjFjY2Vl
NGU1ODgwZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMKKysrIGIv
ZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMTAwLmMKQEAgLTE4MjYsOCArMTgyNiw4IEBAIHN0YXRp
YyBpbnQgcjEwMF9wYWNrZXQwX2NoZWNrKHN0cnVjdCByYWRlb25fY3NfcGFyc2VyICpwLAogCQkJ
dHJhY2stPnRleHR1cmVzW2ldLnVzZV9waXRjaCA9IDE7CiAJCX0gZWxzZSB7CiAJCQl0cmFjay0+
dGV4dHVyZXNbaV0udXNlX3BpdGNoID0gMDsKLQkJCXRyYWNrLT50ZXh0dXJlc1tpXS53aWR0aCA9
IDEgPDwgKChpZHhfdmFsdWUgPj4gUkFERU9OX1RYRk9STUFUX1dJRFRIX1NISUZUKSAmIFJBREVP
Tl9UWEZPUk1BVF9XSURUSF9NQVNLKTsKLQkJCXRyYWNrLT50ZXh0dXJlc1tpXS5oZWlnaHQgPSAx
IDw8ICgoaWR4X3ZhbHVlID4+IFJBREVPTl9UWEZPUk1BVF9IRUlHSFRfU0hJRlQpICYgUkFERU9O
X1RYRk9STUFUX0hFSUdIVF9NQVNLKTsKKwkJCQkJCXRyYWNrLT50ZXh0dXJlc1tpXS53aWR0aCA9
IDEgPDwgKChpZHhfdmFsdWUgJiBSQURFT05fVFhGT1JNQVRfV0lEVEhfTUFTSykgPj4gUkFERU9O
X1RYRk9STUFUX1dJRFRIX1NISUZUKTsKKwkJCXRyYWNrLT50ZXh0dXJlc1tpXS5oZWlnaHQgPSAx
IDw8ICgoaWR4X3ZhbHVlICYgUkFERU9OX1RYRk9STUFUX0hFSUdIVF9NQVNLKSA+PiBSQURFT05f
VFhGT1JNQVRfSEVJR0hUX1NISUZUKTsKIAkJfQogCQlpZiAoaWR4X3ZhbHVlICYgUkFERU9OX1RY
Rk9STUFUX0NVQklDX01BUF9FTkFCTEUpCiAJCQl0cmFjay0+dGV4dHVyZXNbaV0udGV4X2Nvb3Jk
X3R5cGUgPSAyOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMjAwLmMgYi9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3IyMDAuYwppbmRleCA4NDA0MDE0MTNjNTguLmY1ZjJmZmVh
NWFiMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yMjAwLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yMjAwLmMKQEAgLTQ3Niw4ICs0NzYsOCBAQCBpbnQgcjIwMF9w
YWNrZXQwX2NoZWNrKHN0cnVjdCByYWRlb25fY3NfcGFyc2VyICpwLAogCQkJdHJhY2stPnRleHR1
cmVzW2ldLnVzZV9waXRjaCA9IDE7CiAJCX0gZWxzZSB7CiAJCQl0cmFjay0+dGV4dHVyZXNbaV0u
dXNlX3BpdGNoID0gMDsKLQkJCXRyYWNrLT50ZXh0dXJlc1tpXS53aWR0aCA9IDEgPDwgKChpZHhf
dmFsdWUgPj4gUkFERU9OX1RYRk9STUFUX1dJRFRIX1NISUZUKSAmIFJBREVPTl9UWEZPUk1BVF9X
SURUSF9NQVNLKTsKLQkJCXRyYWNrLT50ZXh0dXJlc1tpXS5oZWlnaHQgPSAxIDw8ICgoaWR4X3Zh
bHVlID4+IFJBREVPTl9UWEZPUk1BVF9IRUlHSFRfU0hJRlQpICYgUkFERU9OX1RYRk9STUFUX0hF
SUdIVF9NQVNLKTsKKwkJCXRyYWNrLT50ZXh0dXJlc1tpXS53aWR0aCA9IDEgPDwgKChpZHhfdmFs
dWUgJiBSQURFT05fVFhGT1JNQVRfV0lEVEhfTUFTSykgPj4gUkFERU9OX1RYRk9STUFUX1dJRFRI
X1NISUZUKTsKKwkJCXRyYWNrLT50ZXh0dXJlc1tpXS5oZWlnaHQgPSAxIDw8ICgoaWR4X3ZhbHVl
ICYgUkFERU9OX1RYRk9STUFUX0hFSUdIVF9NQVNLKSA+PiBSQURFT05fVFhGT1JNQVRfSEVJR0hU
X1NISUZUKTsKIAkJfQogCQlpZiAoaWR4X3ZhbHVlICYgUjIwMF9UWEZPUk1BVF9MT09LVVBfRElT
QUJMRSkKIAkJCXRyYWNrLT50ZXh0dXJlc1tpXS5sb29rdXBfZGlzYWJsZSA9IHRydWU7Ci0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
