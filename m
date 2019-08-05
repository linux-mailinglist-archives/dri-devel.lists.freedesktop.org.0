Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0248192B
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 14:24:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C806E42E;
	Mon,  5 Aug 2019 12:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DFE6E42E
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 12:24:14 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id k21so78478881edq.3
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Aug 2019 05:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RxrjX4U/fxUN1Dp9e/Am5FgsaD/8hK5Dvb/+koNmMzw=;
 b=EXRVEl/LhJgEX3HJ1HlsMiI7Xfw09oGL0oX7H+tug3TBwVUlYqzzkcTDPCN18KXsho
 QSraRcbXHsvDTE7Z89KZwEFfhpFJS1tZzD0QioEpigpWFtd6ssKe/1yfOqIHdpty/ikW
 ocGZG3MnD1ynE/nI5u3l6HRtlgyNvu6ggk+1ieZi4M35qsKjOlL/qdXU1GO5y0Gkm3qJ
 83z423H2TjNBm6dABMcpHYnj6fJei81/yuQjChzEhghWVMddJXP70tvK1cprvV4mOQf6
 jnIXYtOpjWfOYmJXlN8YaOWEAhBnqVeiejHtIQCrl/r96QJkuTancmlSKEGzFynJR3nI
 r0AQ==
X-Gm-Message-State: APjAAAVinNUGz/Di/YPlTCOBKdq3blLZNMwfOnPqjR6zye/CP1dO4gZf
 Lb9DAKQrCNmISR/AgTBt3o56EkhM
X-Google-Smtp-Source: APXvYqzH+51v91+TJiM3IHHGLM7yz5sG6vwbw7Fo3ipopd89IJmcHihoj4dI3+pDmZ3E6pvTxrF+ew==
X-Received: by 2002:a50:9167:: with SMTP id
 f36mr133278887eda.297.1565007852186; 
 Mon, 05 Aug 2019 05:24:12 -0700 (PDT)
Received: from localhost (pD9E51890.dip0.t-ipconnect.de. [217.229.24.144])
 by smtp.gmail.com with ESMTPSA id bq1sm14287534ejb.45.2019.08.05.05.24.11
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 05 Aug 2019 05:24:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 15/21] drm/dp: Add helper to get post-cursor adjustments
Date: Mon,  5 Aug 2019 14:23:44 +0200
Message-Id: <20190805122350.8838-15-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190805122350.8838-1-thierry.reding@gmail.com>
References: <20190805122350.8838-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=RxrjX4U/fxUN1Dp9e/Am5FgsaD/8hK5Dvb/+koNmMzw=;
 b=G9SdxN3g9yyQjhULlqVfD+zTbGR2rs5tH66LlQCYxWv8dVB7yEfpeQNo1sZ3ESKLcH
 OkrH8XJ4+VTPCShHuz9fg1bPxrujJ1ZTMoapa5KUN5SVV6OlB8daSKihcdZaxiPWHPd9
 8wf4eoNJzsiKKCD/5wNUXtYv8tWNTzQJC/EGAagbfHoWOSTM5fgEv+M+OM9tN9Y7W5uj
 /PzyFl1lw56fInrmBnSeQL/sp8qnPqIC6KQFGgfhq5EQzkVwy8FzXZ3IC4G1UlygxjjA
 bEDxqj7zCB+gNFPKTgSqJhhZ7w1PqfR5MvigrbxOFN3KPW2rT/sHx6Em1PJ7E14lrVHj
 Gi0A==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCklmIHRoZSB0cmFuc21p
dHRlciBzdXBwb3J0cyBwcmUtZW1waGFzaXMgcG9zdCBjdXJzb3IyIHRoZSBzaW5rIHdpbGwKcmVx
dWVzdCBhZGp1c3RtZW50cyBpbiBhIHNpbWlsYXIgd2F5IHRvIGhvdyBpdCByZXF1ZXN0cyBhZGp1
c3RtZW50cyB0bwp0aGUgdm9sdGFnZSBzd2luZyBhbmQgcHJlLWVtcGhhc2lzIHNldHRpbmdzLgoK
QWRkIGEgaGVscGVyIHRvIGV4dHJhY3QgdGhlc2UgYWRqdXN0bWVudHMgb24gYSBwZXItbGFuZSBi
YXNpcyBmcm9tIHRoZQpEUENEIGxpbmsgc3RhdHVzLgoKU2lnbmVkLW9mZi1ieTogVGhpZXJyeSBS
ZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hl
bHBlci5jIHwgMTAgKysrKysrKysrKwogaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oICAgICB8
IDEwICsrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2RwX2hlbHBlci5jCmluZGV4IDFmYjNjMjdjZDAxMi4uZjFmMzcwNWZhZGU5IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMKQEAgLTEyMCw2ICsxMjAsMTYgQEAgdTggZHJtX2RwX2dldF9hZGp1
c3RfcmVxdWVzdF9wcmVfZW1waGFzaXMoY29uc3QgdTggbGlua19zdGF0dXNbRFBfTElOS19TVEFU
VVNfU0kKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF9wcmVfZW1w
aGFzaXMpOwogCit1OCBkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3Bvc3RfY3Vyc29yKGNvbnN0
IHU4IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdLAorCQkJCQkgdW5zaWduZWQgaW50
IGxhbmUpCit7CisJdW5zaWduZWQgaW50IG9mZnNldCA9IERQX0FESlVTVF9SRVFVRVNUX1BPU1Rf
Q1VSU09SMjsKKwl1OCB2YWx1ZSA9IGRwX2xpbmtfc3RhdHVzKGxpbmtfc3RhdHVzLCBvZmZzZXQp
OworCisJcmV0dXJuICh2YWx1ZSA+PiAobGFuZSA8PCAxKSkgJiAweDM7Cit9CitFWFBPUlRfU1lN
Qk9MKGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcG9zdF9jdXJzb3IpOworCiB2b2lkIGRybV9k
cF9saW5rX3RyYWluX2Nsb2NrX3JlY292ZXJ5X2RlbGF5KGNvbnN0IHU4IGRwY2RbRFBfUkVDRUlW
RVJfQ0FQX1NJWkVdKQogewogCXVuc2lnbmVkIGludCByZF9pbnRlcnZhbCA9IGRybV9kcF9hdXhf
cmRfaW50ZXJ2YWwoZHBjZCk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVy
LmggYi9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKaW5kZXggZmNmZDJiMTlkNWJkLi5jZDcy
OGI4YTRkZWUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaAorKysgYi9p
bmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKQEAgLTU2Niw2ICs1NjYsMTQgQEAKICMgZGVmaW5l
IERQX0FESlVTVF9QUkVfRU1QSEFTSVNfTEFORTFfU0hJRlQgIDYKIAogI2RlZmluZSBEUF9BREpV
U1RfUkVRVUVTVF9QT1NUX0NVUlNPUjIgICAgICAweDIwYworIyBkZWZpbmUgRFBfQURKVVNUX1BP
U1RfQ1VSU09SMl9MQU5FMF9NQVNLICAweDAzCisjIGRlZmluZSBEUF9BREpVU1RfUE9TVF9DVVJT
T1IyX0xBTkUwX1NISUZUIDAKKyMgZGVmaW5lIERQX0FESlVTVF9QT1NUX0NVUlNPUjJfTEFORTFf
TUFTSyAgMHgwYworIyBkZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VSU09SMl9MQU5FMV9TSElGVCAy
CisjIGRlZmluZSBEUF9BREpVU1RfUE9TVF9DVVJTT1IyX0xBTkUyX01BU0sgIDB4MzAKKyMgZGVm
aW5lIERQX0FESlVTVF9QT1NUX0NVUlNPUjJfTEFORTJfU0hJRlQgNAorIyBkZWZpbmUgRFBfQURK
VVNUX1BPU1RfQ1VSU09SMl9MQU5FM19NQVNLICAweGMwCisjIGRlZmluZSBEUF9BREpVU1RfUE9T
VF9DVVJTT1IyX0xBTkUzX1NISUZUIDYKIAogI2RlZmluZSBEUF9URVNUX1JFUVVFU1QJCQkgICAg
MHgyMTgKICMgZGVmaW5lIERQX1RFU1RfTElOS19UUkFJTklORwkJICAgICgxIDw8IDApCkBAIC0x
MDUzLDYgKzEwNjEsOCBAQCB1OCBkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ZvbHRhZ2UoY29u
c3QgdTggbGlua19zdGF0dXNbRFBfTElOS19TVEFUVVNfU0laRV0sCiAJCQkJICAgICBpbnQgbGFu
ZSk7CiB1OCBkcm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3ByZV9lbXBoYXNpcyhjb25zdCB1OCBs
aW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKIAkJCQkJICBpbnQgbGFuZSk7Cit1OCBk
cm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3Bvc3RfY3Vyc29yKGNvbnN0IHU4IGxpbmtfc3RhdHVz
W0RQX0xJTktfU1RBVFVTX1NJWkVdLAorCQkJCQkgdW5zaWduZWQgaW50IGxhbmUpOwogCiAjZGVm
aW5lIERQX0JSQU5DSF9PVUlfSEVBREVSX1NJWkUJMHhjCiAjZGVmaW5lIERQX1JFQ0VJVkVSX0NB
UF9TSVpFCQkweGYKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
