Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489B24ABBF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 22:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA696E23F;
	Tue, 18 Jun 2019 20:25:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61B8F6E23F;
 Tue, 18 Jun 2019 20:25:37 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id j19so17058213qtr.12;
 Tue, 18 Jun 2019 13:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TIBkr0/rm+35I5D7kp+sjlYQTXR18bhJrUdb3/bbQ84=;
 b=fXuopqOvIkF27L/i74UwBxr5yQ14EfErTF9MWEYfglGIpOfyvhtjqKXYK9mjbOCYcO
 EmVqt9FFgkhDtfEEByvn8Vbh56KxTlP8EZGO/toRNvQ/KRCDrjZZcPBdi9wDPxck+GuF
 YJpNwnV3WV84hJMvAyhubqVfkU5XE14cdVv4PMweOUcyjMOckVO4pJCyXfxBJP13lQD1
 c/92gpal77IdLBgotNUn9Jaaad1bOsG+077LkN9PDGwj4YIzxtVJU5IwCwuBLBO9mmfd
 4JURp20dN/nkYT/jjnpGYc9p6uv7DypjHvERiGOr4SSSySnUrRCm81T0oH29Xs11oEBl
 I3Vw==
X-Gm-Message-State: APjAAAWwSyiMufjGDyOhngV8J25McRE8SVsX07c7/SPePucY90XOankl
 3cz9Ir04RzTaYRsiKPL7EFbYUP0Eqeo=
X-Google-Smtp-Source: APXvYqzC40YKPX8T0MLddHulG6MVab9KyzdiIugXiY2lSC7GvTD8kn2aajJ7FYhNz2sI74Hn0qiCWg==
X-Received: by 2002:a0c:bd9a:: with SMTP id n26mr29411009qvg.25.1560889535497; 
 Tue, 18 Jun 2019 13:25:35 -0700 (PDT)
Received: from localhost ([2601:184:4780:7861:5010:5849:d76d:b714])
 by smtp.gmail.com with ESMTPSA id k15sm7617420qtg.22.2019.06.18.13.25.34
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 13:25:35 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/msm/dpu: add icc voting in dpu_mdss_init
Date: Tue, 18 Jun 2019 13:24:12 -0700
Message-Id: <20190618202425.15259-5-robdclark@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190618202425.15259-1-robdclark@gmail.com>
References: <20190618202425.15259-1-robdclark@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TIBkr0/rm+35I5D7kp+sjlYQTXR18bhJrUdb3/bbQ84=;
 b=JzIaP7LAy2wIvaikkMC1orlL4s5PdBVDz4CL4pDrdsxcbFxQRrSSI6av7lg5iyWeJx
 D6gxxbjD9PKpHOyVDhnbqfDiULIz7Xrzm7DrPEROmjz+evt2xCbXAQAjwSdYq0SrjMam
 d65vYOkms8s/UaeijLu6MzXEPxKO8aykgjttdDO1+xZjpgTpLNInekcKX+0TQHd+OxcI
 V4TM/sPVhXKFA4BoLbdMkvLYn5r4Mu1t5pcdHsKUK/MNscjvtiMsWyHt30Z+qnUMFpR4
 BuVXt6I5vzGJdtx/Gx734zD92abVTPq+3S2GCnodb4U//4k8vFeAWOzGN3SlX87A/LVu
 2PCA==
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
 Jayant Shekhar <jshekhar@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Sean Paul <sean@poorly.run>, Georgi Djakov <georgi.djakov@linaro.org>,
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
IGIxZDA0MzdhYzdiNi4uOTg2OTE1YmJiYzAyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
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
