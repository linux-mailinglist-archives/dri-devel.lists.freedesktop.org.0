Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D9A7D3DC
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65DC6E34C;
	Thu,  1 Aug 2019 03:45:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED766E34A
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:45:09 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id t132so33262505pgb.9
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:45:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=sPsp2eqITZnw2b8QC7bn0VV3MJP+delfGQJVfFYbiRk=;
 b=Yy880lnvfELkfUjuBb4+ZjKbs3Wi1ysgNZ8gRnKCBN4OCsnxlTLx69NNa/jW73Lgqj
 ldItp+G8RuuDiDstBdE0e7aogq5V/tV75U9Fw69ngN6yTFm2125xg2Vm9IZWrSEy2Uaq
 EZX4ZCJIw+/YVOEJy7BLvwarke1dP0wFcyuyjU6dBxcRw54aBqQDH0BxExsY1/FrsnYb
 xj0cTQcZKka4EhEteyqQiGSrW4ZapBW7RrHUs7iHG8X7u4c/rCw9Ppod08IDaEPkq1ji
 PDs3YC3/79vTOU4YCVQxS0CC05x29ABKfVk7n43Q2rECTLWGktHGSFmKY2l1axQQXpdc
 MVSQ==
X-Gm-Message-State: APjAAAUBzdcqkZ0g2Y2GixEG2hqNef5N0n9EiL42toOYQ/y8P9yHBcgg
 9sIft6gkFzUtwi64Rqh1cuX88A==
X-Google-Smtp-Source: APXvYqz9J417rd70yrAxKPQ3YRSZltq4+t8BRMIPsxRjNDEPI645+q4kTkFqUGRKHPTAlVKDPrfaxQ==
X-Received: by 2002:aa7:81d9:: with SMTP id c25mr51766726pfn.255.1564631107496; 
 Wed, 31 Jul 2019 20:45:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.45.05
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:45:06 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 14/26] drm: kirin: Move ade crtc/plane help functions to
 driver_data
Date: Thu,  1 Aug 2019 03:44:27 +0000
Message-Id: <20190801034439.98227-15-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=sPsp2eqITZnw2b8QC7bn0VV3MJP+delfGQJVfFYbiRk=;
 b=dc3g+ccVISsD+XlJfNn6R+VKW6AYYAiONlIwe8IU3AI6iT5eUtwLhaCJbpLJzy4AmG
 JOLlaIB3eOSsJgUD2NpkU5i6OprDNKMJsnqPjgnhA5SzrHyNmul1V63b2JlhqtKgjaBy
 MeKUEwl22xTMvmP6z3Zb/x4Uv3k0S90nDT1h5sAnjEOY1Nn6jCZm3lZcNd/FBKJLoqI2
 Erbb7yS7qNkSo/m2YvpQ2vjqbVOIiLch05MzYqUN8WKeevWeK6P7FTuO5T6xJ6q/bK4H
 ac3vpQXKQaUmJf++/N6I04Sbo1rCscRkHBoFaWkSrOkbuwVtKqYWwLmhO/tprDj2HQ5Q
 BHUw==
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
Cc: Xu YiPing <xuyiping@hisilicon.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Rongrong Zou <zourongrong@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgoKQXMgcGFydCBvZiByZWZh
Y3RvcmluZyB0aGUga2lyaW4gZHJpdmVyIHRvIGJldHRlciBzdXBwb3J0CmRpZmZlcmVudCBoYXJk
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggbW92ZXMgdGhlIGNydGMKYW5kIHBsYW5lIGZ1bmNz
L2hlbHBlcl9mdW5jcyB0byB0aGUgc3RydWN0IGtpcmluX2RybV9kYXRhLgoKVGhpcyB3aWxsIG1h
a2UgaXQgZWFzaWVyIHRvIGFkZCBzdXBwb3J0IGZvciBuZXcgZGV2aWNlcwp2aWEgYSBuZXcga2ly
aW5fZHJtX2RhdGEgc3RydWN0dXJlLgoKQ2M6IFJvbmdyb25nIFpvdSA8em91cm9uZ3JvbmdAZ21h
aWwuY29tPgpDYzogRGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgpDYzogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogZHJpLWRldmVsIDxkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnPgpDYzogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpSZXZpZXdl
ZC1ieTogU2FtIFJhdm5ib3JnIDxzYW1AcmF2bmJvcmcub3JnPgpTaWduZWQtb2ZmLWJ5OiBYdSBZ
aVBpbmcgPHh1eWlwaW5nQGhpc2lsaWNvbi5jb20+Cltqc3R1bHR6OiByZXdvcmRlZCBjb21taXQg
bWVzc2FnZV0KU2lnbmVkLW9mZi1ieTogSm9obiBTdHVsdHogPGpvaG4uc3R1bHR6QGxpbmFyby5v
cmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMg
fCAxNSArKysrKysrKysrLS0tLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2ly
aW5fZHJtX2Rydi5oIHwgIDUgKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29u
L2tpcmluL2tpcmluX2RybV9hZGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4v
a2lyaW5fZHJtX2FkZS5jCmluZGV4IGFjYWUyODE1ZWRlZC4uMDI5NzMzODY0YWE4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9hZGUuYwpAQCAtNjAy
LDEzICs2MDIsMTMgQEAgc3RhdGljIGludCBhZGVfY3J0Y19pbml0KHN0cnVjdCBkcm1fZGV2aWNl
ICpkZXYsIHN0cnVjdCBkcm1fY3J0YyAqY3J0YywKIAljcnRjLT5wb3J0ID0gcG9ydDsKIAogCXJl
dCA9IGRybV9jcnRjX2luaXRfd2l0aF9wbGFuZXMoZGV2LCBjcnRjLCBwbGFuZSwgTlVMTCwKLQkJ
CQkJJmFkZV9jcnRjX2Z1bmNzLCBOVUxMKTsKKwkJCQkJYWRlX2RyaXZlcl9kYXRhLmNydGNfZnVu
Y3MsIE5VTEwpOwogCWlmIChyZXQpIHsKIAkJRFJNX0VSUk9SKCJmYWlsZWQgdG8gaW5pdCBjcnRj
LlxuIik7CiAJCXJldHVybiByZXQ7CiAJfQogCi0JZHJtX2NydGNfaGVscGVyX2FkZChjcnRjLCAm
YWRlX2NydGNfaGVscGVyX2Z1bmNzKTsKKwlkcm1fY3J0Y19oZWxwZXJfYWRkKGNydGMsIGFkZV9k
cml2ZXJfZGF0YS5jcnRjX2hlbHBlcl9mdW5jcyk7CiAKIAlyZXR1cm4gMDsKIH0KQEAgLTkxNywx
NCArOTE3LDE1IEBAIHN0YXRpYyBpbnQgYWRlX3BsYW5lX2luaXQoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgc3RydWN0IGtpcmluX3BsYW5lICprcGxhbmUsCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJl
dDsKIAotCXJldCA9IGRybV91bml2ZXJzYWxfcGxhbmVfaW5pdChkZXYsICZrcGxhbmUtPmJhc2Us
IDEsICZhZGVfcGxhbmVfZnVuY3MsCi0JCQkJICAgICAgIGZtdHMsIGZtdHNfY250LCBOVUxMLCB0
eXBlLCBOVUxMKTsKKwlyZXQgPSBkcm1fdW5pdmVyc2FsX3BsYW5lX2luaXQoZGV2LCAma3BsYW5l
LT5iYXNlLCAxLAorCQkJCQlhZGVfZHJpdmVyX2RhdGEucGxhbmVfZnVuY3MsIGZtdHMsCisJCQkJ
CWZtdHNfY250LCBOVUxMLCB0eXBlLCBOVUxMKTsKIAlpZiAocmV0KSB7CiAJCURSTV9FUlJPUigi
ZmFpbCB0byBpbml0IHBsYW5lLCBjaD0lZFxuIiwga3BsYW5lLT5jaCk7CiAJCXJldHVybiByZXQ7
CiAJfQogCi0JZHJtX3BsYW5lX2hlbHBlcl9hZGQoJmtwbGFuZS0+YmFzZSwgJmFkZV9wbGFuZV9o
ZWxwZXJfZnVuY3MpOworCWRybV9wbGFuZV9oZWxwZXJfYWRkKCZrcGxhbmUtPmJhc2UsIGFkZV9k
cml2ZXJfZGF0YS5wbGFuZV9oZWxwZXJfZnVuY3MpOwogCiAJcmV0dXJuIDA7CiB9CkBAIC0xMDU2
LDYgKzEwNTcsMTAgQEAgc3RhdGljIHZvaWQgYWRlX2RybV9jbGVhbnVwKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCiB9CiAKIHN0cnVjdCBraXJpbl9kcm1fZGF0YSBhZGVfZHJpdmVyX2Rh
dGEgPSB7CisJLmNydGNfaGVscGVyX2Z1bmNzID0gJmFkZV9jcnRjX2hlbHBlcl9mdW5jcywKKwku
Y3J0Y19mdW5jcyA9ICZhZGVfY3J0Y19mdW5jcywKKwkucGxhbmVfaGVscGVyX2Z1bmNzID0gJmFk
ZV9wbGFuZV9oZWxwZXJfZnVuY3MsCisJLnBsYW5lX2Z1bmNzID0gJmFkZV9wbGFuZV9mdW5jcywK
IAkuaW5pdCA9IGFkZV9kcm1faW5pdCwKIAkuY2xlYW51cCA9IGFkZV9kcm1fY2xlYW51cAogfTsK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Ry
di5oIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmgKaW5k
ZXggY2QyZWFhNjUzZGI3Li43MGIwNGU2NTc4OWMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9oaXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9o
aXNpbGljb24va2lyaW4va2lyaW5fZHJtX2Rydi5oCkBAIC0zNSw2ICszNSwxMSBAQCBzdHJ1Y3Qg
a2lyaW5fcGxhbmUgewogCiAvKiBkaXNwbGF5IGNvbnRyb2xsZXIgaW5pdC9jbGVhbnVwIG9wcyAq
Lwogc3RydWN0IGtpcmluX2RybV9kYXRhIHsKKwljb25zdCBzdHJ1Y3QgZHJtX2NydGNfaGVscGVy
X2Z1bmNzICpjcnRjX2hlbHBlcl9mdW5jczsKKwljb25zdCBzdHJ1Y3QgZHJtX2NydGNfZnVuY3Mg
KmNydGNfZnVuY3M7CisJY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJfZnVuY3MgKnBsYW5l
X2hlbHBlcl9mdW5jczsKKwljb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNzICAqcGxhbmVfZnVu
Y3M7CisKIAlpbnQgKCppbml0KShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KTsKIAl2b2lk
ICgqY2xlYW51cCkoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldik7CiB9OwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
