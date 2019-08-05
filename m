Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F78F81923
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 256D16E418;
	Mon,  5 Aug 2019 12:24:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF686E411
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:01 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w13so78528395eds.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o24+g7i8BW53Ww6DPFOLfHhFLMp/ZTsBJbxWhHmrH7E=;
 b=c6R6W+qBHA6LFNr6STNnMQpxJvEO/eSAZNIlC0S16yNyg8AtG+hEbp8kThbaVdLWQ6
 rdEd+LMrfjZSyOcZdv3ViL2iBlHDncz6ddER8I2Ma5sd94qj/upqut0vONJiLnkGHLCp
 kgwkFdxxVpyO0ymooS6FWqDpILVmX6WwsDrzQ0ejww03RIANT4AmZKm70+0y6aUPQpDw
 70RN69cpSnhFQyyX/QaPvgCS3mnFLmDxwm5MB2IqNshqV0nl3t843rLjhMaPgCwJ8QLh
 SgHYWOHMgLEI/sQxIGuIiC1caWJ9e306qAue4H9LdqGGBgWUQmHXxEv2cal0ty1YOySP
 /7DA==
X-Gm-Message-State: APjAAAUHLN+YvvBk1vsMyuqwXumotvoOXIH65ItbdEaaCfBe+b2ELK/W
 /kQxgOG8M7Eslr+PDpRiCRxzS7ip
X-Google-Smtp-Source: APXvYqzM+BoQHDJIJF1At4mt0MMkKTSCXqSWW/cOFQTPyEf7SaYNFi8OgXTNzk6K/ViDkw/g2YgPIA==
X-Received: by 2002:a17:906:2544:: with SMTP id
 j4mr80655196ejb.221.1565007839406; 
 Mon, 05 Aug 2019 05:23:59 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id w14sm20064535eda.69.2019.08.05.05.23.58
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:23:58 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 06/21] drm/dp: Probe link using existing parsing helpers
Date: Mon,  5 Aug 2019 14:23:35 +0200
Message-Id: <20190805122350.8838-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=o24+g7i8BW53Ww6DPFOLfHhFLMp/ZTsBJbxWhHmrH7E=;
 b=pZzGs4TkU+F0ZDVlRg98FyO2oJHob83zc6YJPkdyLsQJgfgwwVXrlqfIlA2elTm6/7
 kvX2277o7fWcc05hevArjCnjFXTsf1bmNkddwzioBeVRws7wq+Y4Ie0LsoCkc2JF1Djp
 0R5rzwqVZmJ01FmheLrvqFu/2wFChKfQbElHLhLqaJ/6TX7IrQV+38Lz+IBbOq7nwgA4
 0abGz7Z/2UZ8fKYZZUh/JVhFesfySNUjyzI1GpTwO6k19TIVaQiorS2XF7v9Fhzou1Ow
 KOkGv1GPqsTUjCIqSewfoq0RlTQX8BZ9tHnT3anlhuLgqSXljzKq3aKgrmomOSkZ+8jX
 9Psw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClVzZSBleGlzdGluZyBw
YXJzaW5nIGhlbHBlcnMgdG8gcHJvYmUgYSBEaXNwbGF5UG9ydCBsaW5rLgoKU2lnbmVkLW9mZi1i
eTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIGlu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAy
NCBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCmlu
ZGV4IGJkZjk5OWJiNmNmYS4uY2RmNDllOGQ1ZTNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vZHJtX2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMK
QEAgLTMyMCw2ICszMjAsMjIgQEAgc3NpemVfdCBkcm1fZHBfZHBjZF93cml0ZShzdHJ1Y3QgZHJt
X2RwX2F1eCAqYXV4LCB1bnNpZ25lZCBpbnQgb2Zmc2V0LAogfQogRVhQT1JUX1NZTUJPTChkcm1f
ZHBfZHBjZF93cml0ZSk7CiAKKy8qKgorICogZHJtX2RwX2RwY2RfcmVhZF9saW5rX2NhcHMoKSAt
IHJlYWQgRFBDRCBsaW5rIGNhcGFiaWxpdGllcworICogQGF1eDogRGlzcGxheVBvcnQgQVVYIGNo
YW5uZWwKKyAqIEBjYXBzOiBidWZmZXIgdG8gc3RvcmUgdGhlIGxpbmsgY2FwYWJpbGl0aWVzIGlu
CisgKgorICogUmV0dXJuczoKKyAqIFRoZSBudW1iZXIgb2YgYnl0ZXMgdHJhbnNmZXJyZWQgb24g
c3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24KKyAqIGZhaWx1cmUuCisgKi8KK2lu
dCBkcm1fZHBfZHBjZF9yZWFkX2xpbmtfY2FwcyhzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAorCQkJ
ICAgICAgIHU4IGNhcHNbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdKQoreworCXJldHVybiBkcm1fZHBf
ZHBjZF9yZWFkKGF1eCwgRFBfRFBDRF9SRVYsIGNhcHMsIERQX1JFQ0VJVkVSX0NBUF9TSVpFKTsK
K30KK0VYUE9SVF9TWU1CT0woZHJtX2RwX2RwY2RfcmVhZF9saW5rX2NhcHMpOworCiAvKioKICAq
IGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMoKSAtIHJlYWQgRFBDRCBsaW5rIHN0YXR1cyAo
Ynl0ZXMgMHgyMDItMHgyMDcpCiAgKiBAYXV4OiBEaXNwbGF5UG9ydCBBVVggY2hhbm5lbApAQCAt
Mzc2LDIxICszOTIsMjAgQEAgc3RhdGljIHZvaWQgZHJtX2RwX2xpbmtfcmVzZXQoc3RydWN0IGRy
bV9kcF9saW5rICpsaW5rKQogICovCiBpbnQgZHJtX2RwX2xpbmtfcHJvYmUoc3RydWN0IGRybV9k
cF9hdXggKmF1eCwgc3RydWN0IGRybV9kcF9saW5rICpsaW5rKQogewotCXU4IHZhbHVlc1szXTsK
Kwl1OCB2YWx1ZXNbRFBfUkVDRUlWRVJfQ0FQX1NJWkVdOwogCWludCBlcnI7CiAKIAlkcm1fZHBf
bGlua19yZXNldChsaW5rKTsKIAotCWVyciA9IGRybV9kcF9kcGNkX3JlYWQoYXV4LCBEUF9EUENE
X1JFViwgdmFsdWVzLCBzaXplb2YodmFsdWVzKSk7CisJZXJyID0gZHJtX2RwX2RwY2RfcmVhZF9s
aW5rX2NhcHMoYXV4LCB2YWx1ZXMpOwogCWlmIChlcnIgPCAwKQogCQlyZXR1cm4gZXJyOwogCi0J
bGluay0+cmV2aXNpb24gPSB2YWx1ZXNbMF07Ci0JbGluay0+bWF4X3JhdGUgPSBkcm1fZHBfYndf
Y29kZV90b19saW5rX3JhdGUodmFsdWVzWzFdKTsKLQlsaW5rLT5tYXhfbGFuZXMgPSB2YWx1ZXNb
Ml0gJiBEUF9NQVhfTEFORV9DT1VOVF9NQVNLOworCWxpbmstPnJldmlzaW9uID0gdmFsdWVzW0RQ
X0RQQ0RfUkVWXTsKKwlsaW5rLT5tYXhfcmF0ZSA9IGRybV9kcF9tYXhfbGlua19yYXRlKHZhbHVl
cyk7CisJbGluay0+bWF4X2xhbmVzID0gZHJtX2RwX21heF9sYW5lX2NvdW50KHZhbHVlcyk7CiAK
LQlpZiAodmFsdWVzWzJdICYgRFBfRU5IQU5DRURfRlJBTUVfQ0FQKQotCQlsaW5rLT5jYXBzLmVu
aGFuY2VkX2ZyYW1pbmcgPSB0cnVlOworCWxpbmstPmNhcHMuZW5oYW5jZWRfZnJhbWluZyA9IGRy
bV9kcF9lbmhhbmNlZF9mcmFtZV9jYXAodmFsdWVzKTsKIAogCWxpbmstPnJhdGUgPSBsaW5rLT5t
YXhfcmF0ZTsKIAlsaW5rLT5sYW5lcyA9IGxpbmstPm1heF9sYW5lczsKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApp
bmRleCAyNzU5ZjhkN2U5MGQuLjYwYmIwMzBjODU4ZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0v
ZHJtX2RwX2hlbHBlci5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaApAQCAtMTM1
MCw2ICsxMzUwLDggQEAgc3RhdGljIGlubGluZSBzc2l6ZV90IGRybV9kcF9kcGNkX3dyaXRlYihz
dHJ1Y3QgZHJtX2RwX2F1eCAqYXV4LAogCXJldHVybiBkcm1fZHBfZHBjZF93cml0ZShhdXgsIG9m
ZnNldCwgJnZhbHVlLCAxKTsKIH0KIAoraW50IGRybV9kcF9kcGNkX3JlYWRfbGlua19jYXBzKHN0
cnVjdCBkcm1fZHBfYXV4ICphdXgsCisJCQkgICAgICAgdTggY2Fwc1tEUF9SRUNFSVZFUl9DQVBf
U0laRV0pOwogaW50IGRybV9kcF9kcGNkX3JlYWRfbGlua19zdGF0dXMoc3RydWN0IGRybV9kcF9h
dXggKmF1eCwKIAkJCQkgdTggc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdKTsKIAotLSAKMi4y
Mi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
