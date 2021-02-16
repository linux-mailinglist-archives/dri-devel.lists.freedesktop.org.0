Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FA631C743
	for <lists+dri-devel@lfdr.de>; Tue, 16 Feb 2021 09:21:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FF2B89B3B;
	Tue, 16 Feb 2021 08:21:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F335989B3B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 08:21:48 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id g3so8581842edb.11
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Feb 2021 00:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnoo0wmivAjtZsEgEktgO+RKl2tieZPPQBjazmOBOqU=;
 b=Z9Vu0aY51nyWdAxaO8mXDSjbTc43mQTKoZLKO9C80Q9Eizer9riaRFW7Lqs4O782Gh
 wi0i8XWFSUf4jxHteMhIEOc8Lvkx/Phq7OkuBzzw5XE+YS4k0QrLX8GTtnA0UkSDDLUs
 J3crWlj0yKdWAa2Mtk/TeAE/O0HLvyapWLlf8XPalfsFmOsmlhIG3gm0ku4CkotSJ+Uv
 28UkfzIQ32dvxKfkufY0GIGE3R/sfegOpWLT/U0+5ItkJYjm279f7eR8iq4I1wXKqeVE
 Jo5XYUqPGcasDe86VCbcPee8DPAV9qlRHKmeCAP/pXeRTyBwjsHSWizXtdHHpcsyhvlN
 nqbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xnoo0wmivAjtZsEgEktgO+RKl2tieZPPQBjazmOBOqU=;
 b=PQFU+xQH49gOjki8v5Mr9gnw6jmrvBlw7aMS0ENrr1B5bHUcWKpoTdWdbigk0C/OQv
 hSI7JpP+LoEGEXbR8DtYeeJo4BTrRO2Xssqd1dDn4pYo3Th7LMvPcicMwQ9TZ1AN+FqR
 wDuMsUALc2ZChMsWO25QWCqZT3HZL07ZnjjDKdzBXXYopeSAfSk8Jo4QRy4Z/tcHIz//
 niRLqqR+q+ObHZpSuEKZtqze2ieJlYfu+NeGg69DZ0KCU9EGk9bFWlj1Uf6mbJKC7qlX
 i3fPCfmUUHD4s5M2noMz06dVFvnw5Gr1l2QHzJqc+aEwWx5CFiTv4d8tt7Yu0X+hRvgV
 QWcw==
X-Gm-Message-State: AOAM532LoW/VYLGQ5HB42LLGlp/i1RN/6T9+5hfwRdMAxKdUb62eU5Rn
 vcorA3V1KPLjP0lBI642qFk=
X-Google-Smtp-Source: ABdhPJwN0aJw4oDqNgChQKLd0HpHNrQQPz5Yf69fZ8UG0f27hAb0Oqz/qJilxqiV1MOkSJ6vWsMsBA==
X-Received: by 2002:aa7:c887:: with SMTP id p7mr6605831eds.28.1613463707651;
 Tue, 16 Feb 2021 00:21:47 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:d4a8:bc96:3480:def7])
 by smtp.gmail.com with ESMTPSA id yh4sm6051192ejb.29.2021.02.16.00.21.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 00:21:47 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: peterz@infradead.org, mingo@redhat.com, will@kernel.org, apw@canonical.com,
 joe@perches.com, linux-kernel@vger.kernel.org
Subject: [PATCH] mutex: nuke mutex_trylock_recursive
Date: Tue, 16 Feb 2021 09:21:46 +0100
Message-Id: <20210216082146.69286-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

VGhlIGxhc3QgdXNlciB3ZW50IGF3YXkgaW4gdGhlIDUuMTEgY3ljbGUuCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogaW5jbHVk
ZS9saW51eC9tdXRleC5oICB8IDI1IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KIGtlcm5lbC9s
b2NraW5nL211dGV4LmMgfCAxMCAtLS0tLS0tLS0tCiBzY3JpcHRzL2NoZWNrcGF0Y2gucGwgIHwg
IDYgLS0tLS0tCiAzIGZpbGVzIGNoYW5nZWQsIDQxIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvbXV0ZXguaCBiL2luY2x1ZGUvbGludXgvbXV0ZXguaAppbmRleCBkY2Qx
ODVjYmZlNzkuLjBjZDYzMWExOTcyNyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tdXRleC5o
CisrKyBiL2luY2x1ZGUvbGludXgvbXV0ZXguaApAQCAtMTk5LDI5ICsxOTksNCBAQCBleHRlcm4g
dm9pZCBtdXRleF91bmxvY2soc3RydWN0IG11dGV4ICpsb2NrKTsKIAogZXh0ZXJuIGludCBhdG9t
aWNfZGVjX2FuZF9tdXRleF9sb2NrKGF0b21pY190ICpjbnQsIHN0cnVjdCBtdXRleCAqbG9jayk7
CiAKLS8qCi0gKiBUaGVzZSB2YWx1ZXMgYXJlIGNob3NlbiBzdWNoIHRoYXQgRkFJTCBhbmQgU1VD
Q0VTUyBtYXRjaCB0aGUKLSAqIHZhbHVlcyBvZiB0aGUgcmVndWxhciBtdXRleF90cnlsb2NrKCku
Ci0gKi8KLWVudW0gbXV0ZXhfdHJ5bG9ja19yZWN1cnNpdmVfZW51bSB7Ci0JTVVURVhfVFJZTE9D
S19GQUlMRUQgICAgPSAwLAotCU1VVEVYX1RSWUxPQ0tfU1VDQ0VTUyAgID0gMSwKLQlNVVRFWF9U
UllMT0NLX1JFQ1VSU0lWRSwKLX07Ci0KLS8qKgotICogbXV0ZXhfdHJ5bG9ja19yZWN1cnNpdmUg
LSB0cnlsb2NrIHZhcmlhbnQgdGhhdCBhbGxvd3MgcmVjdXJzaXZlIGxvY2tpbmcKLSAqIEBsb2Nr
OiBtdXRleCB0byBiZSBsb2NrZWQKLSAqCi0gKiBUaGlzIGZ1bmN0aW9uIHNob3VsZCBub3QgYmUg
dXNlZCwgX2V2ZXJfLiBJdCBpcyBwdXJlbHkgZm9yIGh5c3RlcmljYWwgR0VNCi0gKiByYWlzaW5z
LCBhbmQgb25jZSB0aG9zZSBhcmUgZ29uZSB0aGlzIHdpbGwgYmUgcmVtb3ZlZC4KLSAqCi0gKiBS
ZXR1cm5zOgotICogIC0gTVVURVhfVFJZTE9DS19GQUlMRUQgICAgLSB0cnlsb2NrIGZhaWxlZCwK
LSAqICAtIE1VVEVYX1RSWUxPQ0tfU1VDQ0VTUyAgIC0gbG9jayBhY3F1aXJlZCwKLSAqICAtIE1V
VEVYX1RSWUxPQ0tfUkVDVVJTSVZFIC0gd2UgYWxyZWFkeSBvd25lZCB0aGUgbG9jay4KLSAqLwot
ZXh0ZXJuIC8qIF9fZGVwcmVjYXRlZCAqLyBfX211c3RfY2hlY2sgZW51bSBtdXRleF90cnlsb2Nr
X3JlY3Vyc2l2ZV9lbnVtCi1tdXRleF90cnlsb2NrX3JlY3Vyc2l2ZShzdHJ1Y3QgbXV0ZXggKmxv
Y2spOwotCiAjZW5kaWYgLyogX19MSU5VWF9NVVRFWF9IICovCmRpZmYgLS1naXQgYS9rZXJuZWwv
bG9ja2luZy9tdXRleC5jIGIva2VybmVsL2xvY2tpbmcvbXV0ZXguYwppbmRleCA1MzUyY2U1MGE5
N2UuLmFkYjkzNTA5MDc2OCAxMDA2NDQKLS0tIGEva2VybmVsL2xvY2tpbmcvbXV0ZXguYworKysg
Yi9rZXJuZWwvbG9ja2luZy9tdXRleC5jCkBAIC04NiwxNiArODYsNiBAQCBib29sIG11dGV4X2lz
X2xvY2tlZChzdHJ1Y3QgbXV0ZXggKmxvY2spCiB9CiBFWFBPUlRfU1lNQk9MKG11dGV4X2lzX2xv
Y2tlZCk7CiAKLV9fbXVzdF9jaGVjayBlbnVtIG11dGV4X3RyeWxvY2tfcmVjdXJzaXZlX2VudW0K
LW11dGV4X3RyeWxvY2tfcmVjdXJzaXZlKHN0cnVjdCBtdXRleCAqbG9jaykKLXsKLQlpZiAodW5s
aWtlbHkoX19tdXRleF9vd25lcihsb2NrKSA9PSBjdXJyZW50KSkKLQkJcmV0dXJuIE1VVEVYX1RS
WUxPQ0tfUkVDVVJTSVZFOwotCi0JcmV0dXJuIG11dGV4X3RyeWxvY2sobG9jayk7Ci19Ci1FWFBP
UlRfU1lNQk9MKG11dGV4X3RyeWxvY2tfcmVjdXJzaXZlKTsKLQogc3RhdGljIGlubGluZSB1bnNp
Z25lZCBsb25nIF9fb3duZXJfZmxhZ3ModW5zaWduZWQgbG9uZyBvd25lcikKIHsKIAlyZXR1cm4g
b3duZXIgJiBNVVRFWF9GTEFHUzsKZGlmZiAtLWdpdCBhL3NjcmlwdHMvY2hlY2twYXRjaC5wbCBi
L3NjcmlwdHMvY2hlY2twYXRjaC5wbAppbmRleCA5MmU4ODhlZDkzOWYuLjE1ZjdmNGZhNmI5OSAx
MDA3NTUKLS0tIGEvc2NyaXB0cy9jaGVja3BhdGNoLnBsCisrKyBiL3NjcmlwdHMvY2hlY2twYXRj
aC5wbApAQCAtNzA2OSwxMiArNzA2OSw2IEBAIHN1YiBwcm9jZXNzIHsKIAkJCX0KIAkJfQogCi0j
IGNoZWNrIGZvciBtdXRleF90cnlsb2NrX3JlY3Vyc2l2ZSB1c2FnZQotCQlpZiAoJGxpbmUgPX4g
L211dGV4X3RyeWxvY2tfcmVjdXJzaXZlLykgewotCQkJRVJST1IoIkxPQ0tJTkciLAotCQkJICAg
ICAgInJlY3Vyc2l2ZSBsb2NraW5nIGlzIGJhZCwgZG8gbm90IHVzZSB0aGlzIGV2ZXIuXG4iIC4g
JGhlcmVjdXJyKTsKLQkJfQotCiAjIGNoZWNrIGZvciBsb2NrZGVwX3NldF9ub3ZhbGlkYXRlX2Ns
YXNzCiAJCWlmICgkbGluZSA9fiAvXi5ccypsb2NrZGVwX3NldF9ub3ZhbGlkYXRlX2NsYXNzXHMq
XCgvIHx8CiAJCSAgICAkbGluZSA9fiAvX19sb2NrZGVwX25vX3ZhbGlkYXRlX19ccypcKS8gKSB7
Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
