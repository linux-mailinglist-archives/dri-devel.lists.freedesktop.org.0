Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC33F106705
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2019 08:25:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631D46E250;
	Fri, 22 Nov 2019 07:25:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53EDD6E250
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2019 07:25:13 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id v201so3667493lfa.11
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Nov 2019 23:25:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XWYrspY3sqn5IhheES0xFmh++L5u8QGvgjG4njd5/Go=;
 b=gyYjCwuqmdoh6xb57hYvmMyAm7S5/tGB8QJTheNjZ712jDR7inV1zi7mIgOtbQVJLl
 qKzlUEumDuWTZ1F2oomn/+mCa+KVKFSeV0MM22lkjHW+AuDf5OnnBmhRwuowK1/c7F1N
 hzXZRcgHhu0+5mxeAm/YVhwTn4QDwIuxYx4+cqx5Z7MeI1svM+GZCTI9PdD4/bBiiy1I
 +OmtBjDxRMGaFtiqvU7KyOYPlj/4R87Ke8KuKFMVI28O17UnzZ0nmCQPknu8nbzFDC0R
 JYO7C1T++rt0/Z2rKulBnUyedB326mktlZOl33QnpoIpkj4kkTFcsy0QqHpx3KGYLSCu
 73rA==
X-Gm-Message-State: APjAAAWTq0HvT8su2XuWV+k7ANERfO3nGkNqnVwsllvI6fPZxKZO9a5p
 B53++rKATeXz1DHajDuocH6DwZjs438CoA==
X-Google-Smtp-Source: APXvYqzIWcSmkySkCPav+tdRJKcqwNHvCv8x+Fg1Tt9wqk1g4zaEkLfqyRjeQ/xuCpiF4Ip4gOFU2A==
X-Received: by 2002:ac2:44af:: with SMTP id c15mr11040869lfm.39.1574407511506; 
 Thu, 21 Nov 2019 23:25:11 -0800 (PST)
Received: from localhost.bredbandsbolaget
 (c-21cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.33])
 by smtp.gmail.com with ESMTPSA id f14sm2651394lfa.67.2019.11.21.23.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Nov 2019 23:25:10 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH 2/2] drm/mcde: Do not needlessly logically and with 3
Date: Fri, 22 Nov 2019 08:25:08 +0100
Message-Id: <20191122072508.25677-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XWYrspY3sqn5IhheES0xFmh++L5u8QGvgjG4njd5/Go=;
 b=w6oWmXgC7g4lyOX/a2UvHPOQbdHjewIuLYi+MGrVTij75HtwmCU7FSbdL90m7TNcAj
 EEYW7ekQsCdSpCLowDnFAWips+9Mj75k1D7Gv6RP7fi/s1IOTj0jmNrkJuCBPTJFD+1C
 fy0HBf7oEipoAIdsfeyeqsDcH/JnOg8+E2fdvffRe34ZgUwQMqctqoQ8mqEtw41kf1GS
 TCuWW0UlYY9GgvCx3GeNQjAM+c+dzOLLRhf9LVRmAy9OyRsM3AgniRPSwb/+0W95KJ6S
 JJrVaDlXoDs0ICQ1woZRL5V+v2nfo8/btS3UKwlIOqCKKBv4eSnJUb19CmTbpwSgrvc1
 HxvQ==
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
Cc: Stephan Gerhold <stephan@gerhold.net>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGkgaW5kZXggaSBhbHdheXMgMC4uMyBpbiB0aGVzZSBzdGF0ZW1lbnRzIHNvIHRoZXJlCmlz
IG5vIG5lZWQgdG8gdGFnICImIDMiIHRvIGNsYW1wIGl0IHRvIDMgaGVyZS4gTWFrZQp0aGUgb3Bl
cmF0b3IgcHJlY2VkZW5jZSBleHBsaWNpdCBldmVuIGlmIGl0J3MgY29ycmVjdAphcyBpdCBpcywg
dGhlIHBhcmFudGhlc2lzIGNyZWF0ZXMgbGVzcyBjb2duaXRpdmUgc3RyZXNzCmZvciBodW1hbnMu
CgpDYzogU3RlcGhhbiBHZXJob2xkIDxzdGVwaGFuQGdlcmhvbGQubmV0PgpTaWduZWQtb2ZmLWJ5
OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL21jZGUvbWNkZV9kc2kuYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L21jZGUvbWNkZV9kc2kuYyBiL2RyaXZlcnMvZ3B1L2RybS9tY2RlL21jZGVfZHNpLmMKaW5kZXgg
ZGMwN2I1MzRmMDFmLi4yMWNlZTRkOWQyZmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9t
Y2RlL21jZGVfZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21jZGUvbWNkZV9kc2kuYwpAQCAt
MjM3LDI1ICsyMzcsMjUgQEAgc3RhdGljIHNzaXplX3QgbWNkZV9kc2lfaG9zdF90cmFuc2Zlcihz
dHJ1Y3QgbWlwaV9kc2lfaG9zdCAqaG9zdCwKIAlpZiAodHhsZW4gPiAwKSB7CiAJCXZhbCA9IDA7
CiAJCWZvciAoaSA9IDA7IGkgPCA0ICYmIGkgPCB0eGxlbjsgaSsrKQotCQkJdmFsIHw9IHR4W2ld
IDw8IChpICYgMykgKiA4OworCQkJdmFsIHw9IHR4W2ldIDw8IChpICogOCk7CiAJfQogCXdyaXRl
bCh2YWwsIGQtPnJlZ3MgKyBEU0lfRElSRUNUX0NNRF9XUkRBVDApOwogCWlmICh0eGxlbiA+IDQp
IHsKIAkJdmFsID0gMDsKIAkJZm9yIChpID0gMDsgaSA8IDQgJiYgKGkgKyA0KSA8IHR4bGVuOyBp
KyspCi0JCQl2YWwgfD0gdHhbaSArIDRdIDw8IChpICYgMykgKiA4OworCQkJdmFsIHw9IHR4W2kg
KyA0XSA8PCAoaSAqIDgpOwogCQl3cml0ZWwodmFsLCBkLT5yZWdzICsgRFNJX0RJUkVDVF9DTURf
V1JEQVQxKTsKIAl9CiAJaWYgKHR4bGVuID4gOCkgewogCQl2YWwgPSAwOwogCQlmb3IgKGkgPSAw
OyBpIDwgNCAmJiAoaSArIDgpIDwgdHhsZW47IGkrKykKLQkJCXZhbCB8PSB0eFtpICsgOF0gPDwg
KGkgJiAzKSAqIDg7CisJCQl2YWwgfD0gdHhbaSArIDhdIDw8IChpICogOCk7CiAJCXdyaXRlbCh2
YWwsIGQtPnJlZ3MgKyBEU0lfRElSRUNUX0NNRF9XUkRBVDIpOwogCX0KIAlpZiAodHhsZW4gPiAx
MikgewogCQl2YWwgPSAwOwogCQlmb3IgKGkgPSAwOyBpIDwgNCAmJiAoaSArIDEyKSA8IHR4bGVu
OyBpKyspCi0JCQl2YWwgfD0gdHhbaSArIDEyXSA8PCAoaSAmIDMpICogODsKKwkJCXZhbCB8PSB0
eFtpICsgMTJdIDw8IChpICogOCk7CiAJCXdyaXRlbCh2YWwsIGQtPnJlZ3MgKyBEU0lfRElSRUNU
X0NNRF9XUkRBVDMpOwogCX0KIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
