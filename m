Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DD9AE6D6
	for <lists+dri-devel@lfdr.de>; Tue, 10 Sep 2019 11:24:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DBA0891AA;
	Tue, 10 Sep 2019 09:24:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4591088A72;
 Tue, 10 Sep 2019 09:24:39 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id l11so18630992wrx.5;
 Tue, 10 Sep 2019 02:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uMuZP7ae3jQSmPJxfzdT1AuoiOVioivsFcerfWTar0I=;
 b=aGlhsc5KZQuSj4bwuMlMY050FFMb/54pVveVnLuZXrGERDui+tIrvbISyRTQ1sxV8Z
 p4X9sOPmZKY2B6wn6mZfNNT7OFOODxZJQItIWLHwg7lf+jtUEusYpxIxe9JcbWATTyqr
 wpduQQ3N7s+gfpBY31lxIXgS3AO1bCVP7PY6xRq3AEHx/iHFrlh3e54IJBB5S44yH2jA
 KinjDt5dbYBTfTY1qLwfCllDk5Pq+wsBWUJIEM7lG41eCtOHfkfaaTqOVO8Jv9o8w0cW
 +0jXrZfNiuqu5i/p3m/bZ98W5PyRG322S6UHynlc+kSW3NQCwH/LshqGOMijD4KXkrC8
 cDMQ==
X-Gm-Message-State: APjAAAWHL4MvDFDfGJhL1kCJbGJAnNlIyN+bYa/aLUOaFa1hrC6e+n0Q
 gCpECS4yj/3rlhQBFQNR0jm8D0+S
X-Google-Smtp-Source: APXvYqx6+pgvikc3potRQ4K53aLpfJxiZil5TH1iDMasCap4CiXWx76/tfREBxzbu6EVWJ98n5BZEA==
X-Received: by 2002:adf:dd04:: with SMTP id a4mr25146354wrm.340.1568107477442; 
 Tue, 10 Sep 2019 02:24:37 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:1cd:7d57:6942:ab1b])
 by smtp.gmail.com with ESMTPSA id e12sm6107036wrw.37.2019.09.10.02.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Sep 2019 02:24:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: amd-gfx@lists.freedesktop.org
Subject: [PATCH 7/9] drm/amdgpu: allocate PDs/PTs with no_gpu_wait in a page
 fault
Date: Tue, 10 Sep 2019 11:24:29 +0200
Message-Id: <20190910092431.37471-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190910092431.37471-1-christian.koenig@amd.com>
References: <20190910092431.37471-1-christian.koenig@amd.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uMuZP7ae3jQSmPJxfzdT1AuoiOVioivsFcerfWTar0I=;
 b=LB5HHv85MoIteiYPWXkPfospN5bypGu1uHNw2I1WrE78WoPYPPlrO/PnYVbWQf8uk2
 ADa4qZ5wbivZM7HGRO5n2Y5TiwsiV87x5zgh58p6TiXr2IdXx7czA+x+qs6f/5Pw2bwE
 zSa5HMbQcNA5J3C+mTWIT4rSrKcDjHgcU1mXhO+yy1+HDlGfgNWp0bDMiTyqrbCv3YVV
 xy6caULKMUBEuvqnBWhZjtvULVBz/dZUc5Hg/wEcqgM3bFga2A11vN5M6nMOMN2X0e4B
 G2uRi4MgUuTtNKETDSkZ8tNQfJ7QOTP1yw4B4/p2ia+LiQiG5r9CIbp4wz82HVA3Tym4
 MDoQ==
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

V2hpbGUgaGFuZGxpbmcgYSBwYWdlIGZhdWx0IHdlIGNhbid0IHdhaXQgZm9yIG90aGVyIG9uZ29p
bmcgR1BVCm9wZXJhdGlvbnMgb3Igd2UgY2FuIHBvdGVudGlhbGx5IHJ1biBpbnRvIGRlYWRsb2Nr
cy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlzdGlhbi5rb2VuaWdAYW1k
LmNvbT4KUmV2aWV3ZWQtYnk6IEZlbGl4IEt1ZWhsaW5nIDxGZWxpeC5LdWVobGluZ0BhbWQuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuYyB8IDIgKy0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaCB8IDEgKwogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3ZtLmMgICAgIHwgOCArKysrKy0tLQogMyBmaWxl
cyBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCmluZGV4IDA0NzY3OTA1ZjAwNC4uNTEwZDA0
ZmQ2ZTVmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2Jq
ZWN0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCkBA
IC00NTEsNyArNDUxLDcgQEAgc3RhdGljIGludCBhbWRncHVfYm9fZG9fY3JlYXRlKHN0cnVjdCBh
bWRncHVfZGV2aWNlICphZGV2LAogewogCXN0cnVjdCB0dG1fb3BlcmF0aW9uX2N0eCBjdHggPSB7
CiAJCS5pbnRlcnJ1cHRpYmxlID0gKGJwLT50eXBlICE9IHR0bV9ib190eXBlX2tlcm5lbCksCi0J
CS5ub193YWl0X2dwdSA9IGZhbHNlLAorCQkubm9fd2FpdF9ncHUgPSBicC0+bm9fd2FpdF9ncHUs
CiAJCS5yZXN2ID0gYnAtPnJlc3YsCiAJCS5mbGFncyA9IFRUTV9PUFRfRkxBR19BTExPV19SRVNf
RVZJQ1QKIAl9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X29iamVjdC5oIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oCmlu
ZGV4IDVhM2MxNzc5ZTIwMC4uZTZkZGQwNDhhOTg0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X29iamVjdC5oCkBAIC00MSw2ICs0MSw3IEBAIHN0cnVjdCBhbWRncHVfYm9f
cGFyYW0gewogCXUzMgkJCQlwcmVmZXJyZWRfZG9tYWluOwogCXU2NAkJCQlmbGFnczsKIAllbnVt
IHR0bV9ib190eXBlCQl0eXBlOworCWJvb2wJCQkJbm9fd2FpdF9ncHU7CiAJc3RydWN0IHJlc2Vy
dmF0aW9uX29iamVjdAkqcmVzdjsKIH07CiAKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X3ZtLmMKaW5kZXggNmM5NGM1YTU2MmNmLi4zYjk1NGI1M2E0NTAgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV92bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV92bS5jCkBAIC04MjEsNyArODIxLDggQEAgc3RhdGljIGludCBhbWRn
cHVfdm1fY2xlYXJfYm8oc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsCiAgKiBAYnA6IHJlc3Vs
dGluZyBCTyBhbGxvY2F0aW9uIHBhcmFtZXRlcnMKICAqLwogc3RhdGljIHZvaWQgYW1kZ3B1X3Zt
X2JvX3BhcmFtKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2LCBzdHJ1Y3QgYW1kZ3B1X3ZtICp2
bSwKLQkJCSAgICAgICBpbnQgbGV2ZWwsIHN0cnVjdCBhbWRncHVfYm9fcGFyYW0gKmJwKQorCQkJ
ICAgICAgIGludCBsZXZlbCwgYm9vbCBkaXJlY3QsCisJCQkgICAgICAgc3RydWN0IGFtZGdwdV9i
b19wYXJhbSAqYnApCiB7CiAJbWVtc2V0KGJwLCAwLCBzaXplb2YoKmJwKSk7CiAKQEAgLTgzNiw2
ICs4MzcsNyBAQCBzdGF0aWMgdm9pZCBhbWRncHVfdm1fYm9fcGFyYW0oc3RydWN0IGFtZGdwdV9k
ZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVfdm0gKnZtLAogCWVsc2UgaWYgKCF2bS0+cm9vdC5i
YXNlLmJvIHx8IHZtLT5yb290LmJhc2UuYm8tPnNoYWRvdykKIAkJYnAtPmZsYWdzIHw9IEFNREdQ
VV9HRU1fQ1JFQVRFX1NIQURPVzsKIAlicC0+dHlwZSA9IHR0bV9ib190eXBlX2tlcm5lbDsKKwli
cC0+bm9fd2FpdF9ncHUgPSBkaXJlY3Q7CiAJaWYgKHZtLT5yb290LmJhc2UuYm8pCiAJCWJwLT5y
ZXN2ID0gdm0tPnJvb3QuYmFzZS5iby0+dGJvLnJlc3Y7CiB9CkBAIC04NzcsNyArODc5LDcgQEAg
c3RhdGljIGludCBhbWRncHVfdm1fYWxsb2NfcHRzKHN0cnVjdCBhbWRncHVfZGV2aWNlICphZGV2
LAogCWlmIChlbnRyeS0+YmFzZS5ibykKIAkJcmV0dXJuIDA7CiAKLQlhbWRncHVfdm1fYm9fcGFy
YW0oYWRldiwgdm0sIGN1cnNvci0+bGV2ZWwsICZicCk7CisJYW1kZ3B1X3ZtX2JvX3BhcmFtKGFk
ZXYsIHZtLCBjdXJzb3ItPmxldmVsLCBkaXJlY3QsICZicCk7CiAKIAlyID0gYW1kZ3B1X2JvX2Ny
ZWF0ZShhZGV2LCAmYnAsICZwdCk7CiAJaWYgKHIpCkBAIC0yNzEzLDcgKzI3MTUsNyBAQCBpbnQg
YW1kZ3B1X3ZtX2luaXQoc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCBhbWRncHVf
dm0gKnZtLAogCQl2bS0+dXBkYXRlX2Z1bmNzID0gJmFtZGdwdV92bV9zZG1hX2Z1bmNzOwogCXZt
LT5sYXN0X3VwZGF0ZSA9IE5VTEw7CiAKLQlhbWRncHVfdm1fYm9fcGFyYW0oYWRldiwgdm0sIGFk
ZXYtPnZtX21hbmFnZXIucm9vdF9sZXZlbCwgJmJwKTsKKwlhbWRncHVfdm1fYm9fcGFyYW0oYWRl
diwgdm0sIGFkZXYtPnZtX21hbmFnZXIucm9vdF9sZXZlbCwgZmFsc2UsICZicCk7CiAJaWYgKHZt
X2NvbnRleHQgPT0gQU1ER1BVX1ZNX0NPTlRFWFRfQ09NUFVURSkKIAkJYnAuZmxhZ3MgJj0gfkFN
REdQVV9HRU1fQ1JFQVRFX1NIQURPVzsKIAlyID0gYW1kZ3B1X2JvX2NyZWF0ZShhZGV2LCAmYnAs
ICZyb290KTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
