Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB70FD78AF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3DA46E829;
	Tue, 15 Oct 2019 14:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4522C6E826
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:35 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id b9so24205637wrs.0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6mraHQAwEUV7ol9z6T/Qpn2e/ecfvUtuh1pV5feqasA=;
 b=aaz+vfyOOMRobLeiyEz6eG4xzME4yvbVVI6WNjRRKZu6rgQFnkyInrBrfJu5GGevla
 M+x/J9CAyaL7UY0jFFO61kVMuKqa21qZnB1wHVRrxwTWWrVZakchnWIj7Sn2veQEIrSO
 HS7ZLrNdVHMzSxHyTdTn/kvuHcEPgPla++ltwRxZ+oenvPhamfJLoVuU0tsFeYwFsh0o
 DSu1wlR7N0ftMpRslZpmLuWN0VBqzvGyEMQ5c30CDJlFeOPk/+q3xgVjl+MskdaIUDPJ
 ElaBYV6jCZmRCn9neVQoVOTFVe6tlsDxSZCPiP9VsKfR+DlHqPWRtwpkUXnfggcXAeQ2
 Gnuw==
X-Gm-Message-State: APjAAAVKLDFUdYngpJkwVUQZS6u+PRAKrKJ+hvOf1b+/80YXWVF0eBRe
 TJwIfaoXVWcLDn1XkSVsHNrSnkmm
X-Google-Smtp-Source: APXvYqx6yyaOl03JGelVygcwc8hU9IbYHYleghJyM/ud7FSGhqaEdaxkkSs7sfNQehyVDnHEsrE/5g==
X-Received: by 2002:a05:6000:1051:: with SMTP id
 c17mr5558574wrx.124.1571150132021; 
 Tue, 15 Oct 2019 07:35:32 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id y14sm31055232wrd.84.2019.10.15.07.35.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:28 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/15] drm/dp: Do not busy-loop during link training
Date: Tue, 15 Oct 2019 16:35:01 +0200
Message-Id: <20191015143509.1104985-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6mraHQAwEUV7ol9z6T/Qpn2e/ecfvUtuh1pV5feqasA=;
 b=r8qSZA221vHaxTsSSfnOG7r13F8Ay4UlzLxZVKOOcGbiCS1SPOrCZQAuDo9srJiZxT
 SQpm//Kl+jkEUQq+MarW35/jy1kCtkz2dMDSYRy9V/dp5kkA1Qvp1DIJ0rJWvUaWkFG1
 EKyJEsnnnlacVA7/8pxDXB+o/+1NUIi97pxmSTWX6B6J8o6SArQAMCwFk5gIAZz2Squb
 +ldaXDgqjU/bSxP2+9TP/mQNZ5UUUjAPvBvyKmEL03eLIKIJz82IXuel43xstZiGVbgL
 MvQhUAnAkKfKvu7belhleVxY+yoqQ2PCh+eFleuLVT7qKQ2qDtwfENuzyIQINJ6L/O0i
 WOZg==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVzZSBtaWNyb3NlY29u
ZCBzbGVlcHMgZm9yIHRoZSBjbG9jayByZWNvdmVyeSBhbmQgY2hhbm5lbCBlcXVhbGl6YXRpb24K
ZGVsYXlzIGR1cmluZyBsaW5rIHRyYWluaW5nLiBUaGUgZHVyYXRpb24gb2YgdGhlc2UgZGVsYXlz
IGNhbiBiZSBmcm9tCjEwMCB1cyB1cCB0byAxNiBtcy4gSXQgaXMgcnVkZSB0byBidXN5LWxvb3Ag
Zm9yIHRoYXQgYW1vdW50IG9mIHRpbWUuCgpXaGlsZSBhdCBpdCwgYWxzbyBjb252ZXJ0IHRvIHN0
YW5kYXJkIGNvZGluZyBzdHlsZSBieSBwdXR0aW5nIHRoZQpvcGVuaW5nIGJyYWNlcyBpbiBhIGZ1
bmN0aW9uIGRlZmluaXRpb24gb24gYSBuZXcgbGluZS4KCnYyOiB1c2UgY29ycmVjdCBtdWx0aXBs
aWVyIGZvciB0cmFpbmluZyBkZWxheXMgKFBoaWxpcHAgWmFiZWwpCgpTaWduZWQtb2ZmLWJ5OiBU
aGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfaGVscGVyLmMgfCAzMCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYwppbmRleCA4ZjJkN2M0ODUwY2EuLmFkMjY3MWQyZWU4ZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jCkBAIC0xMjAsMzMgKzEyMCwzOSBAQCB1OCBkcm1fZHBfZ2V0X2FkanVzdF9y
ZXF1ZXN0X3ByZV9lbXBoYXNpcyhjb25zdCB1OCBsaW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19T
SQogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNp
cyk7CiAKLXZvaWQgZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkoY29uc3Qg
dTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pIHsKLQlpbnQgcmRfaW50ZXJ2YWwgPSBkcGNk
W0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgotCQkJICBEUF9UUkFJTklOR19BVVhfUkRf
TUFTSzsKK3ZvaWQgZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tfcmVjb3ZlcnlfZGVsYXkoY29uc3Qg
dTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pCit7CisJdW5zaWduZWQgaW50IHJkX2ludGVy
dmFsID0gZHBjZFtEUF9UUkFJTklOR19BVVhfUkRfSU5URVJWQUxdICYKKwkJCQkJRFBfVFJBSU5J
TkdfQVVYX1JEX01BU0s7CiAKIAlpZiAocmRfaW50ZXJ2YWwgPiA0KQotCQlEUk1fREVCVUdfS01T
KCJBVVggaW50ZXJ2YWwgJWQsIG91dCBvZiByYW5nZSAobWF4IDQpXG4iLAorCQlEUk1fREVCVUdf
S01TKCJBVVggaW50ZXJ2YWwgJXUsIG91dCBvZiByYW5nZSAobWF4IDQpXG4iLAogCQkJICAgICAg
cmRfaW50ZXJ2YWwpOwogCiAJaWYgKHJkX2ludGVydmFsID09IDAgfHwgZHBjZFtEUF9EUENEX1JF
Vl0gPj0gRFBfRFBDRF9SRVZfMTQpCi0JCXVkZWxheSgxMDApOworCQlyZF9pbnRlcnZhbCA9IDEw
MDsKIAllbHNlCi0JCW1kZWxheShyZF9pbnRlcnZhbCAqIDQpOworCQlyZF9pbnRlcnZhbCAqPSA0
ICogVVNFQ19QRVJfTVNFQzsKKworCXVzbGVlcF9yYW5nZShyZF9pbnRlcnZhbCwgcmRfaW50ZXJ2
YWwgKiAyKTsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX2xpbmtfdHJhaW5fY2xvY2tfcmVjb3Zl
cnlfZGVsYXkpOwogCi12b2lkIGRybV9kcF9saW5rX3RyYWluX2NoYW5uZWxfZXFfZGVsYXkoY29u
c3QgdTggZHBjZFtEUF9SRUNFSVZFUl9DQVBfU0laRV0pIHsKLQlpbnQgcmRfaW50ZXJ2YWwgPSBk
cGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgotCQkJICBEUF9UUkFJTklOR19BVVhf
UkRfTUFTSzsKK3ZvaWQgZHJtX2RwX2xpbmtfdHJhaW5fY2hhbm5lbF9lcV9kZWxheShjb25zdCB1
OCBkcGNkW0RQX1JFQ0VJVkVSX0NBUF9TSVpFXSkKK3sKKwl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2
YWwgPSBkcGNkW0RQX1RSQUlOSU5HX0FVWF9SRF9JTlRFUlZBTF0gJgorCQkJCQlEUF9UUkFJTklO
R19BVVhfUkRfTUFTSzsKIAogCWlmIChyZF9pbnRlcnZhbCA+IDQpCi0JCURSTV9ERUJVR19LTVMo
IkFVWCBpbnRlcnZhbCAlZCwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCisJCURSTV9ERUJVR19L
TVMoIkFVWCBpbnRlcnZhbCAldSwgb3V0IG9mIHJhbmdlIChtYXggNClcbiIsCiAJCQkgICAgICBy
ZF9pbnRlcnZhbCk7CiAKIAlpZiAocmRfaW50ZXJ2YWwgPT0gMCkKLQkJdWRlbGF5KDQwMCk7CisJ
CXJkX2ludGVydmFsID0gNDAwOwogCWVsc2UKLQkJbWRlbGF5KHJkX2ludGVydmFsICogNCk7CisJ
CXJkX2ludGVydmFsICo9IDQgKiBVU0VDX1BFUl9NU0VDOworCisJdXNsZWVwX3JhbmdlKHJkX2lu
dGVydmFsLCByZF9pbnRlcnZhbCAqIDIpOwogfQogRVhQT1JUX1NZTUJPTChkcm1fZHBfbGlua190
cmFpbl9jaGFubmVsX2VxX2RlbGF5KTsKIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
