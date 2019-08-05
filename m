Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA4181924
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B44B6E421;
	Mon,  5 Aug 2019 12:24:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 284376E421
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:03 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id k8so78412899edr.11
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dsZrwevSfDTKWVIcj7+Cm4tBEPMgmqHw7yuECIs4VPI=;
 b=lex0kQAu87gGiLT0S0X0StiXXDyXDGOalGcCmov8SntA8+34y6c6X5qg+jdTfBhwFu
 +uthZgL/DK84zuo9SJ391mDckfVAXVyr91raPYWqAUOai9EX8i1izIKCH7SDQcROhuap
 H7DNhi0i0IAe2k8tFpGMzcxdz5JDGBgPrQ5OV+PighnbW/8p0c05+AmU2sHAcH951I0n
 Lqk5Lw/k89EKRnMBh6M52/6IejfrBacawzZro2uTv+37MKJuD57yPmwZp5OVIwFGZxeZ
 G/7Xb0EJAjlH4aQJm6uM7uuJE3RVWZSMBdDSnOGpQdM0tU/lTovV9iMPJysKLjkD0zKG
 bsNw==
X-Gm-Message-State: APjAAAXh+M2HmmVEDQC+ouGv7f048tCszGfrel+XAuDnE8Fv6OvsrV67
 7OnMrsAp7dSfUAvjnBDFKNxvgBFf
X-Google-Smtp-Source: APXvYqy0jpLQRAomO4dBzrgstkhO05q6kvaCKxJHznXCJAvlMRKgKoeMFRodSvgKE56GeHBH8ivccg==
X-Received: by 2002:a17:906:43c4:: with SMTP id
 j4mr116685089ejn.227.1565007840776; 
 Mon, 05 Aug 2019 05:24:00 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id t13sm19671205edd.13.2019.08.05.05.24.00
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:00 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/21] drm/dp: Read fast training capability from link
Date: Mon,  5 Aug 2019 14:23:36 +0200
Message-Id: <20190805122350.8838-7-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dsZrwevSfDTKWVIcj7+Cm4tBEPMgmqHw7yuECIs4VPI=;
 b=Tfk/Jo8Gm4QBCHRNeTrDJ1ZePvJsARhyC3Oxko6GmXxgZ4RY1i0lvJVzfB2aEMDpmK
 mihvnbJAk+Yd6MhOUjnPM4hiLEThS4mCzJ2d/NQiGowZ9mUGqaXkM4voRVYjFq7T2OR3
 QCUb1+lcnDatRWm9NNEV6aLZv7OFT7JPCKsApzZFaM67owo0eE6qk6frWawn8wgwRKjC
 DzJHxNgSg0brrNn/LkbHVgEbPwLISxCDkUEJubGOr2qJYtvIHDphKFZC6rjra0bHnrBS
 0MPjwyhppv78nmC8GYgnz5OUXl/SnR3d47Cj1hV+jV4i8wRTM5EJ3CD8orClU/PwXpJW
 wC2g==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCldoaWxlIHByb2Jpbmcg
dGhlIERpc3BsYXlQb3J0IGxpbmssIHF1ZXJ5IHRoZSBmYXN0IHRyYWluaW5nIGNhcGFiaWxpdHku
CklmIHN1cHBvcnRlZCwgZHJpdmVycyBjYW4gdXNlIHRoZSBmYXN0IGxpbmsgdHJhaW5pbmcgc2Vx
dWVuY2UgaW5zdGVhZCBvZgp0aGUgbW9yZSBpbnZvbHZlZCBmdWxsIGxpbmsgdHJhaW5pbmcgc2Vx
dWVuY2UuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgfCAzICsrKwogaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oICAgICB8IDkgKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDEy
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBl
ci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwppbmRleCBjZGY0OWU4ZDVlM2Eu
Ljc0ZTRmY2VhY2U3ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCkBAIC0zNTUsMTIgKzM1NSwx
NCBAQCBFWFBPUlRfU1lNQk9MKGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMpOwogc3RhdGlj
IHZvaWQgZHJtX2RwX2xpbmtfY2Fwc19yZXNldChzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAqY2Fw
cykKIHsKIAljYXBzLT5lbmhhbmNlZF9mcmFtaW5nID0gZmFsc2U7CisJY2Fwcy0+ZmFzdF90cmFp
bmluZyA9IGZhbHNlOwogfQogCiB2b2lkIGRybV9kcF9saW5rX2NhcHNfY29weShzdHJ1Y3QgZHJt
X2RwX2xpbmtfY2FwcyAqZGVzdCwKIAkJCSAgIGNvbnN0IHN0cnVjdCBkcm1fZHBfbGlua19jYXBz
ICpzcmMpCiB7CiAJZGVzdC0+ZW5oYW5jZWRfZnJhbWluZyA9IHNyYy0+ZW5oYW5jZWRfZnJhbWlu
ZzsKKwlkZXN0LT5mYXN0X3RyYWluaW5nID0gc3JjLT5mYXN0X3RyYWluaW5nOwogfQogRVhQT1JU
X1NZTUJPTChkcm1fZHBfbGlua19jYXBzX2NvcHkpOwogCkBAIC00MDYsNiArNDA4LDcgQEAgaW50
IGRybV9kcF9saW5rX3Byb2JlKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsIHN0cnVjdCBkcm1fZHBf
bGluayAqbGluaykKIAlsaW5rLT5tYXhfbGFuZXMgPSBkcm1fZHBfbWF4X2xhbmVfY291bnQodmFs
dWVzKTsKIAogCWxpbmstPmNhcHMuZW5oYW5jZWRfZnJhbWluZyA9IGRybV9kcF9lbmhhbmNlZF9m
cmFtZV9jYXAodmFsdWVzKTsKKwlsaW5rLT5jYXBzLmZhc3RfdHJhaW5pbmcgPSBkcm1fZHBfZmFz
dF90cmFpbmluZ19jYXAodmFsdWVzKTsKIAogCWxpbmstPnJhdGUgPSBsaW5rLT5tYXhfcmF0ZTsK
IAlsaW5rLT5sYW5lcyA9IGxpbmstPm1heF9sYW5lczsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAppbmRleCA2MGJi
MDMwYzg1OGQuLmMxNDhmNTY4NTE5NSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hl
bHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTE0Myw2ICsxMTQz
LDEzIEBAIGRybV9kcF9lbmhhbmNlZF9mcmFtZV9jYXAoY29uc3QgdTggZHBjZFtEUF9SRUNFSVZF
Ul9DQVBfU0laRV0pCiAJCShkcGNkW0RQX01BWF9MQU5FX0NPVU5UXSAmIERQX0VOSEFOQ0VEX0ZS
QU1FX0NBUCk7CiB9CiAKK3N0YXRpYyBpbmxpbmUgYm9vbAorZHJtX2RwX2Zhc3RfdHJhaW5pbmdf
Y2FwKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQoreworCXJldHVybiBkcGNk
W0RQX0RQQ0RfUkVWXSA+PSAweDExICYmCisJCShkcGNkW0RQX01BWF9ET1dOU1BSRUFEXSAmIERQ
X05PX0FVWF9IQU5EU0hBS0VfTElOS19UUkFJTklORyk7Cit9CisKIHN0YXRpYyBpbmxpbmUgYm9v
bAogZHJtX2RwX3RwczNfc3VwcG9ydGVkKGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlWRVJfQ0FQX1NJ
WkVdKQogewpAQCAtMTM2Miw5ICsxMzY5LDExIEBAIGludCBkcm1fZHBfZHBjZF9yZWFkX2xpbmtf
c3RhdHVzKHN0cnVjdCBkcm1fZHBfYXV4ICphdXgsCiAvKioKICAqIHN0cnVjdCBkcm1fZHBfbGlu
a19jYXBzIC0gRFAgbGluayBjYXBhYmlsaXRpZXMKICAqIEBlbmhhbmNlZF9mcmFtaW5nOiBlbmhh
bmNlZCBmcmFtaW5nIGNhcGFiaWxpdHkgKG1hbmRhdG9yeSBhcyBvZiBEUCAxLjIpCisgKiBAZmFz
dF90cmFpbmluZzogQVVYIENIIGhhbmRzaGFrZSBub3QgcmVxdWlyZWQgZm9yIGxpbmsgdHJhaW5p
bmcKICAqLwogc3RydWN0IGRybV9kcF9saW5rX2NhcHMgewogCWJvb2wgZW5oYW5jZWRfZnJhbWlu
ZzsKKwlib29sIGZhc3RfdHJhaW5pbmc7CiB9OwogCiB2b2lkIGRybV9kcF9saW5rX2NhcHNfY29w
eShzdHJ1Y3QgZHJtX2RwX2xpbmtfY2FwcyAqZGVzdCwKLS0gCjIuMjIuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
