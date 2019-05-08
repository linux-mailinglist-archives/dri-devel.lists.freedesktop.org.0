Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00DFD1813E
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 22:43:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EC2089933;
	Wed,  8 May 2019 20:43:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990DF89933;
 Wed,  8 May 2019 20:43:32 +0000 (UTC)
Received: by mail-qt1-x841.google.com with SMTP id j6so71285qtq.1;
 Wed, 08 May 2019 13:43:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XjAj7v9d1aFWP7B+0xfRD5AnYiJJiQMWuu96HEDaElE=;
 b=Ds2mUEC9aevM+hfk7RCtwRzV3d4socdheULY+UPkt7TzEypEVSzozJKqY2bKwGl6UM
 BZttrH07N/rkOnvXXQikll05aaefGH9weDzl8+YJKgXN33BXr03+m2SO3wBTvnKiEtIc
 exAUcG82bcUZ3eiF5cgLSdz9Kr8NGoZBr2jLpeSSdqDMNoir1GBklV6vDxITdxYnSav6
 jPQq6a+wrczQ5weBWyRSbdKxPEfOq0OJLea/5qOn+eXN8OgBO30r81Qpgu6lXK+S8q7r
 vwt0gYDRR+E/5ZHTVVUN8Ei6rQZHUr+Y6e68P04/XbABhjLulR9Faqt2DDaWaxhRbnWz
 q8dw==
X-Gm-Message-State: APjAAAUJHDxnQQ5j0HH6stWtxIRFZc9QQH/+95Fs+28dfYu01Y4O7t8a
 U8E1eco4JwB/E1SimtFTz90NG0BylZI=
X-Google-Smtp-Source: APXvYqxqOuM2hNNnGXrJHF+QOV08Kuzc4qJe/4y5c0uV13OeTKBfj8Qb4Lug/R5PLCbC3M3zwTk6Ig==
X-Received: by 2002:a0c:addd:: with SMTP id x29mr228478qvc.130.1557348211545; 
 Wed, 08 May 2019 13:43:31 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:6268:7a0b:50be:cebc])
 by smtp.gmail.com with ESMTPSA id k4sm290053qth.63.2019.05.08.13.43.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 13:43:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/msm/dpu: add icc voting in dpu_mdss_init
Date: Wed,  8 May 2019 13:42:14 -0700
Message-Id: <20190508204219.31687-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190508204219.31687-1-robdclark@gmail.com>
References: <20190508204219.31687-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XjAj7v9d1aFWP7B+0xfRD5AnYiJJiQMWuu96HEDaElE=;
 b=T/+EnRFMcDyr1RrV7kcej6Ow39TkoY3F1smOkQuf5l6uCBt81vot92yNBQxWOcDcCs
 Qqcl1B6gwDTNOb7/QSYC2yIex/0RVt/KAyODUZgk7kHdAHsNddjHAKXmVj8EdQMDEjeS
 HlcEmwv69jwrzfE22npYldfROske9UHbAXUtubTKxGlxI02N/0wbYoaH73zqmEvQI9AP
 GYc5tFrMYbHozC0mLFtsbszTNH9a8WXkqzIASfNATUOFh5g0q9Fl+NlYX25niLpN8bPA
 PYKfBNMEURawv/KdIN9jPJh5BUJpICniKY5Ach7lZfX4y4zISSmGAeNTiha9hPCbqeUY
 WDcw==
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Jayant Shekhar <jshekhar@codeaurora.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWJoaW5hdiBLdW1hciA8YWJoaW5hdmtAY29kZWF1cm9yYS5vcmc+CgpkcHVfbWRzc19k
ZXN0cm95KCkgY2FuIGdldCBjYWxsZWQgbm90IGp1c3QgZnJvbQptc21fZHJtX3VuaW5pdCgpIGJ1
dCBhbHNvIGZyb20gbXNtX2RybV9iaW5kKCkgaW4gY2FzZQpvZiBhbnkgZmFpbHVyZXMuCgpkcHVf
bWRzc19kZXN0cm95KCkgcmVtb3ZlcyB0aGUgaWNjIHZvdGluZyBieSBjYWxsaW5nCmljY19wdXQu
IFRoaXMgY291bGQgYWNjaWRlbnRhbGx5IHJlbW92ZSB0aGUgdm90aW5nCmRvbmUgYnkgcG1fcnVu
dGltZV9lbmFibGUuCgpUbyBtYWtlIHRoZSB2b3RpbmcgYmFsYW5jZWQgYWRkIGEgbWluaW11bSB2
b3RlIGluCmRwdV9tZHNzX2luaXQoKSB0byBhdm9pZCBhbnkgdW5jbG9ja2VkIGFjY2Vzcy4KClRo
aXMgY2hhbmdlIGRlcGVuZHMgb24gdGhlIGZvbGxvd2luZyBwYXRjaCB3aGljaAppbnRyb2R1Y2Vz
IGludGVyY29ubmVjdCBiaW5kaW5nIHRvIE1EU1MgZHJpdmVyOgoKaHR0cHM6Ly9wYXRjaHdvcmsu
Y29kZWF1cm9yYS5vcmcvcGF0Y2gvNzA4MTU1LwoKU2lnbmVkLW9mZi1ieTogQWJoaW5hdiBLdW1h
ciA8YWJoaW5hdmtAY29kZWF1cm9yYS5vcmc+ClJldmlld2VkLWJ5OiBTZWFuIFBhdWwgPHNlYW5A
cG9vcmx5LnJ1bj4KU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0u
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9tZHNzLmMgfCAxOCAr
KysrKysrKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2Rw
dV9tZHNzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCmluZGV4
IGUzYzU2Y2NkNzM1Ny4uYjQyNTM3YTY2M2Y3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL2Rpc3AvZHB1MS9kcHVfbWRzcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9k
cHUxL2RwdV9tZHNzLmMKQEAgLTQ5LDYgKzQ5LDE2IEBAIHN0YXRpYyBpbnQgZHB1X21kc3NfcGFy
c2VfZGF0YV9idXNfaWNjX3BhdGgoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIAlyZXR1cm4gMDsK
IH0KIAorc3RhdGljIHZvaWQgZHB1X21kc3NfaWNjX3JlcXVlc3RfYncoc3RydWN0IG1zbV9tZHNz
ICptZHNzKQoreworCXN0cnVjdCBkcHVfbWRzcyAqZHB1X21kc3MgPSB0b19kcHVfbWRzcyhtZHNz
KTsKKwlpbnQgaTsKKwl1NjQgYXZnX2J3ID0gZHB1X21kc3MtPm51bV9wYXRocyA/IE1BWF9CVyAv
IGRwdV9tZHNzLT5udW1fcGF0aHMgOiAwOworCisJZm9yIChpID0gMDsgaSA8IGRwdV9tZHNzLT5u
dW1fcGF0aHM7IGkrKykKKwkJaWNjX3NldF9idyhkcHVfbWRzcy0+cGF0aFtpXSwgYXZnX2J3LCBr
QnBzX3RvX2ljYyhNQVhfQlcpKTsKK30KKwogc3RhdGljIHZvaWQgZHB1X21kc3NfaXJxKHN0cnVj
dCBpcnFfZGVzYyAqZGVzYykKIHsKIAlzdHJ1Y3QgZHB1X21kc3MgKmRwdV9tZHNzID0gaXJxX2Rl
c2NfZ2V0X2hhbmRsZXJfZGF0YShkZXNjKTsKQEAgLTE2MCwxMSArMTcwLDkgQEAgc3RhdGljIGlu
dCBkcHVfbWRzc19lbmFibGUoc3RydWN0IG1zbV9tZHNzICptZHNzKQogewogCXN0cnVjdCBkcHVf
bWRzcyAqZHB1X21kc3MgPSB0b19kcHVfbWRzcyhtZHNzKTsKIAlzdHJ1Y3QgZHNzX21vZHVsZV9w
b3dlciAqbXAgPSAmZHB1X21kc3MtPm1wOwotCWludCByZXQsIGk7Ci0JdTY0IGF2Z19idyA9IGRw
dV9tZHNzLT5udW1fcGF0aHMgPyBNQVhfQlcgLyBkcHVfbWRzcy0+bnVtX3BhdGhzIDogMDsKKwlp
bnQgcmV0OwogCi0JZm9yIChpID0gMDsgaSA8IGRwdV9tZHNzLT5udW1fcGF0aHM7IGkrKykKLQkJ
aWNjX3NldF9idyhkcHVfbWRzcy0+cGF0aFtpXSwgYXZnX2J3LCBrQnBzX3RvX2ljYyhNQVhfQlcp
KTsKKwlkcHVfbWRzc19pY2NfcmVxdWVzdF9idyhtZHNzKTsKIAogCXJldCA9IG1zbV9kc3NfZW5h
YmxlX2NsayhtcC0+Y2xrX2NvbmZpZywgbXAtPm51bV9jbGssIHRydWUpOwogCWlmIChyZXQpCkBA
IC0yNzcsNiArMjg1LDggQEAgaW50IGRwdV9tZHNzX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRl
dikKIAogCXBtX3J1bnRpbWVfZW5hYmxlKGRldi0+ZGV2KTsKIAorCWRwdV9tZHNzX2ljY19yZXF1
ZXN0X2J3KHByaXYtPm1kc3MpOworCiAJcG1fcnVudGltZV9nZXRfc3luYyhkZXYtPmRldik7CiAJ
ZHB1X21kc3MtPmh3dmVyc2lvbiA9IHJlYWRsX3JlbGF4ZWQoZHB1X21kc3MtPm1taW8pOwogCXBt
X3J1bnRpbWVfcHV0X3N5bmMoZGV2LT5kZXYpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
