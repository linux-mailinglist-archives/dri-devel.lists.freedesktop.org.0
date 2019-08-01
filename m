Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7823C7D3E7
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2019 05:45:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DB086E35F;
	Thu,  1 Aug 2019 03:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC1026E35D
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2019 03:45:23 +0000 (UTC)
Received: by mail-pl1-x641.google.com with SMTP id y8so31515852plr.12
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2019 20:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=2SJ1RQl/uOMyO19jnUD0lNyv6QH0nUllbiw6Ng6yqJk=;
 b=dyQKZe+TGm7VgG5nnj/OZbG4eBi8M0rATj2WQqjShSYY9Rfgpob+4/UGcR10g7zOJn
 tbbBqzUR7I8RJBQxMNIDp8ipZbAONs4xZ2OeDv6k+qX5qeRPn0XWg/7HTHlZsFLqezbd
 ORKEKc8OS2J0JoaHZm+LXt+enmMbqeUKY/rgCikbSCi2MiytQ5rmwNhSRtVczz5xlEbd
 A3OGgghoQC9d2WoTY+Ur1d/5Wd8qAFEv5wL9Wmz9qQD8VoHLC6YPQCUQDTckuMz9byJc
 iD2piIUmjF9690mMMCqumTjAjVWOKsBV1TD21oovH3lraHpkmf6t7Z64eKeNSB6rz44f
 UCDQ==
X-Gm-Message-State: APjAAAUWUhvkKN5m/ZVRe9ALM204lm8EURFfxr+XamDetNGTivPLMXld
 4uK80i8UH2cIMmjlP/TCor/dzA==
X-Google-Smtp-Source: APXvYqx50bex+FQM4c27X8zuOaZqL10cOQtxFJhPZ+qvdQyb47LjqbwwFQWJCaJqsnROXuouyiIZuw==
X-Received: by 2002:a17:902:e2:: with SMTP id
 a89mr124513000pla.210.1564631122837; 
 Wed, 31 Jul 2019 20:45:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 h70sm64775674pgc.36.2019.07.31.20.45.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 20:45:22 -0700 (PDT)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 24/26] drm: kirin: Add alloc_hw_ctx/clean_hw_ctx ops in
 driver data
Date: Thu,  1 Aug 2019 03:44:37 +0000
Message-Id: <20190801034439.98227-25-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190801034439.98227-1-john.stultz@linaro.org>
References: <20190801034439.98227-1-john.stultz@linaro.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=2SJ1RQl/uOMyO19jnUD0lNyv6QH0nUllbiw6Ng6yqJk=;
 b=J9+JMcr9OJwYMvFdAQKEduvl+84Dbc0aKweDgAVS6yk5/OwhMtRLqwB4r2kVnlOsMu
 bD+I8lt4/jXDaMSPdSrQjRhh0kj+/khxqEWaq/lwumFQO39/kuBdW+LsU0+VQJVdVhqQ
 s+Wb186mN++XDw4Qg8lbk9cNdsBm+amjRFNKSkXherrYJvCoTTp4M8WXPiEyGPaxWQTa
 /5Ido9xiaIN1fyY7qYfW7VvSDOP+bR6ZtCdL+QsTyrlPttSRxJQt3lOWLTQF0kyIUaVB
 eEbr4nTKN01fimxQihjv76yuG01+ASJV/ENmAAxuw/dQOH8EGa+4yWpICxWzLaRPdPfJ
 gzzA==
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
d2FyZSByZXZpc2lvbnMsIHRoaXMgcGF0Y2ggY2hhbmdlcyB0aGUKYWxsb2MvY2xlYW5faHdfY3R4
IGZ1bmN0aW9ucyB0byBiZSBjYWxsZWQgdmlhIGRyaXZlcl9kYXRhCnNwZWNpZmljIGZ1bmNpdG9u
IHBvaW50ZXJzLgoKVGhpcyB3aWxsIGFsbG93IHRoZSBhZGVfZHJtX2luaXQgdG8gbGF0ZXIgYmUg
bWFkZSBnZW5lcmljIGFuZAptb3ZlZCB0byBraXJpbl9kcm1fZHJ2LmMKCkNjOiBSb25ncm9uZyBa
b3UgPHpvdXJvbmdyb25nQGdtYWlsLmNvbT4KQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51
eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6IGRyaS1kZXZlbCA8
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJh
dm5ib3JnLm9yZz4KUmV2aWV3ZWQtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4K
U2lnbmVkLW9mZi1ieTogWHUgWWlQaW5nIDx4dXlpcGluZ0BoaXNpbGljb24uY29tPgpbanN0dWx0
ejogUmV3b3JkZWQgY29tbWl0IG1lc3NhZ2VdClNpZ25lZC1vZmYtYnk6IEpvaG4gU3R1bHR6IDxq
b2huLnN0dWx0ekBsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGljb24va2ly
aW4va2lyaW5fZHJtX2FkZS5jIHwgOSArKysrKysrKy0KIGRyaXZlcnMvZ3B1L2RybS9oaXNpbGlj
b24va2lyaW4va2lyaW5fZHJtX2Rydi5oIHwgNSArKysrKwogMiBmaWxlcyBjaGFuZ2VkLCAxMyBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRlLmMgYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxp
Y29uL2tpcmluL2tpcmluX2RybV9hZGUuYwppbmRleCAwOWRjMmMwNzUzM2QuLmY3MjlhMWRlNmUx
NCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1f
YWRlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fYWRl
LmMKQEAgLTk5OSw3ICs5OTksNyBAQCBzdGF0aWMgaW50IGFkZV9kcm1faW5pdChzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQogCQlyZXR1cm4gLUVOT01FTTsKIAl9CiAKLQljdHggPSBhZGVf
aHdfY3R4X2FsbG9jKHBkZXYsICZhZGUtPmNydGMuYmFzZSk7CisJY3R4ID0gYWRlX2RyaXZlcl9k
YXRhLmFsbG9jX2h3X2N0eChwZGV2LCAmYWRlLT5jcnRjLmJhc2UpOwogCWlmIChJU19FUlIoY3R4
KSkgewogCQlEUk1fRVJST1IoImZhaWxlZCB0byBpbml0aWFsaXplIGtpcmluX3ByaXYgaHcgY3R4
XG4iKTsKIAkJcmV0dXJuIC1FSU5WQUw7CkBAIC0xMDM4LDYgKzEwMzgsMTAgQEAgc3RhdGljIGlu
dCBhZGVfZHJtX2luaXQoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlyZXR1cm4gMDsK
IH0KIAorc3RhdGljIHZvaWQgYWRlX2h3X2N0eF9jbGVhbnVwKHZvaWQgKmh3X2N0eCkKK3sKK30K
Kwogc3RhdGljIHZvaWQgYWRlX2RybV9jbGVhbnVwKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpCiB7CiB9CkBAIC0xMDkwLDYgKzEwOTQsOSBAQCBzdHJ1Y3Qga2lyaW5fZHJtX2RhdGEgYWRl
X2RyaXZlcl9kYXRhID0gewogCS5wbGFuZV9mdW5jcyA9ICZhZGVfcGxhbmVfZnVuY3MsCiAJLm1v
ZGVfY29uZmlnX2Z1bmNzID0gJmFkZV9tb2RlX2NvbmZpZ19mdW5jcywKIAorCS5hbGxvY19od19j
dHggPSBhZGVfaHdfY3R4X2FsbG9jLAorCS5jbGVhbnVwX2h3X2N0eCA9IGFkZV9od19jdHhfY2xl
YW51cCwKKwogCS5pbml0ID0gYWRlX2RybV9pbml0LAogCS5jbGVhbnVwID0gYWRlX2RybV9jbGVh
bnVwCiB9OwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJp
bl9kcm1fZHJ2LmggYi9kcml2ZXJzL2dwdS9kcm0vaGlzaWxpY29uL2tpcmluL2tpcmluX2RybV9k
cnYuaAppbmRleCA5NWY1NmM5OTYwZDUuLjE2NjM2MTBkMmNkOCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmgKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2hpc2lsaWNvbi9raXJpbi9raXJpbl9kcm1fZHJ2LmgKQEAgLTQ5LDYgKzQ5LDExIEBA
IHN0cnVjdCBraXJpbl9kcm1fZGF0YSB7CiAJY29uc3Qgc3RydWN0IGRybV9wbGFuZV9oZWxwZXJf
ZnVuY3MgKnBsYW5lX2hlbHBlcl9mdW5jczsKIAljb25zdCBzdHJ1Y3QgZHJtX3BsYW5lX2Z1bmNz
ICAqcGxhbmVfZnVuY3M7CiAJY29uc3Qgc3RydWN0IGRybV9tb2RlX2NvbmZpZ19mdW5jcyAqbW9k
ZV9jb25maWdfZnVuY3M7CisKKwl2b2lkICooKmFsbG9jX2h3X2N0eCkoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldiwKKwkJCSAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0Yyk7CisJdm9pZCAo
KmNsZWFudXBfaHdfY3R4KSh2b2lkICpod19jdHgpOworCiAJaW50ICgqaW5pdCkoc3RydWN0IHBs
YXRmb3JtX2RldmljZSAqcGRldik7CiAJdm9pZCAoKmNsZWFudXApKHN0cnVjdCBwbGF0Zm9ybV9k
ZXZpY2UgKnBkZXYpOwogfTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
