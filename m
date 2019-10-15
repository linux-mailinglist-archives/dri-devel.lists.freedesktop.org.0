Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DEED78B1
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 16:35:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEB196E82A;
	Tue, 15 Oct 2019 14:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C366E827
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 14:35:38 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id r3so24192905wrj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 07:35:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QuUMW2rMNWtJhA68j2jeJV90LIr82dKyQ+YZCelh+40=;
 b=fs/rC0+7wdVV+qImuJnEGFaNcCpJUuBheD5FNRSKwG1/pBDq4wEeBGb5KL4PkLGrrX
 1WVzmk7EKD4bO2dJL5pZbznMjaZyTjCsJ1bC/HOCJnB2ke4KW6dUYGjSbeZU+MAWW6qB
 iRMw/RNIAU+9mOv2eAMkCJjTCsQa8o2EQWoxhLnbZIAAFltPb4fldy6MD0bRPUNDzmhE
 xTBBd0Z0yMB60LQlcjSmZeDA3usfxb5uNeGfa2oigZEgJARkMyBbrhyBSlfDlvIlmJYw
 ERSMOj8MqPt897qQIZKw2SCP1nTy6Vq1P9Rsty/e1KVK5rnVbInJPyH9sU5w6cluiosd
 OHqA==
X-Gm-Message-State: APjAAAVc72fbRDJhK87RePh7p1px5WSU4ZNNNCJRI7HHvhsR9Z72Oy5k
 DzI0X2c6wmpF4wFnujql0jpWEW6+
X-Google-Smtp-Source: APXvYqyc0zgh11Cyul2xQvXBrxN1IsscfWVp1Qa9++Ldxg6qvaXwbgGYztsS5fvxRcSAFx+DynuBUw==
X-Received: by 2002:adf:f90d:: with SMTP id b13mr30575810wrr.316.1571150136024; 
 Tue, 15 Oct 2019 07:35:36 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
 by smtp.gmail.com with ESMTPSA id u26sm24182726wrd.87.2019.10.15.07.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 07:35:35 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/15] drm/dp: Add helper to get post-cursor adjustments
Date: Tue, 15 Oct 2019 16:35:03 +0200
Message-Id: <20191015143509.1104985-10-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191015143509.1104985-1-thierry.reding@gmail.com>
References: <20191015143509.1104985-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QuUMW2rMNWtJhA68j2jeJV90LIr82dKyQ+YZCelh+40=;
 b=WYDO5Y8/MAzosWW55RuN9f2Afd9ptrTyYCCviW3i58OVqco1GbmXXLkHGr+EeNBeV7
 EavxHDm37+Wr0cml2qnyfIfeCuQ54eLx4vo2rMFbzH3RSgbDc3g2nXXLIkeMGKWrRavG
 cfed8OFW+FlBkBGsR83WLQCUiVBtSRUHoXPWlS3qoi1nCmQHh/Tzs9IgDiC8sqjGWM5H
 kk/4mgwFl2s/0gKEiZWkNPnA/TdIRbbwyES4axJ7A2Dvkx/S1UwJi3Rg7Mo/3npa/hTH
 Q8+0zDmWHpp9yf+TWx3VJl1dzPCzoY4g3mYN8YC9GpBo4irIKq8yx1gPRIePhqTsNu3G
 CrTg==
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
YXNpcyBmcm9tIHRoZQpEUENEIGxpbmsgc3RhdHVzLgoKUmV2aWV3ZWQtYnk6IFBoaWxpcHAgWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+ClNpZ25lZC1vZmYtYnk6IFRoaWVycnkgUmVkaW5n
IDx0cmVkaW5nQG52aWRpYS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIu
YyB8IDEwICsrKysrKysrKysKIGluY2x1ZGUvZHJtL2RybV9kcF9oZWxwZXIuaCAgICAgfCAxMCAr
KysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9oZWxwZXIuYwppbmRleCA0YjY2MDEwNzcxZmEuLmRlOGZmOGRkYjQ0NSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJt
X2RwX2hlbHBlci5jCkBAIC0xMjAsNiArMTIwLDE2IEBAIHU4IGRybV9kcF9nZXRfYWRqdXN0X3Jl
cXVlc3RfcHJlX2VtcGhhc2lzKGNvbnN0IHU4IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJ
CiB9CiBFWFBPUlRfU1lNQk9MKGRybV9kcF9nZXRfYWRqdXN0X3JlcXVlc3RfcHJlX2VtcGhhc2lz
KTsKIAordTggZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF9wb3N0X2N1cnNvcihjb25zdCB1OCBs
aW5rX3N0YXR1c1tEUF9MSU5LX1NUQVRVU19TSVpFXSwKKwkJCQkJIHVuc2lnbmVkIGludCBsYW5l
KQoreworCXVuc2lnbmVkIGludCBvZmZzZXQgPSBEUF9BREpVU1RfUkVRVUVTVF9QT1NUX0NVUlNP
UjI7CisJdTggdmFsdWUgPSBkcF9saW5rX3N0YXR1cyhsaW5rX3N0YXR1cywgb2Zmc2V0KTsKKwor
CXJldHVybiAodmFsdWUgPj4gKGxhbmUgPDwgMSkpICYgMHgzOworfQorRVhQT1JUX1NZTUJPTChk
cm1fZHBfZ2V0X2FkanVzdF9yZXF1ZXN0X3Bvc3RfY3Vyc29yKTsKKwogdm9pZCBkcm1fZHBfbGlu
a190cmFpbl9jbG9ja19yZWNvdmVyeV9kZWxheShjb25zdCB1OCBkcGNkW0RQX1JFQ0VJVkVSX0NB
UF9TSVpFXSkKIHsKIAl1bnNpZ25lZCBpbnQgcmRfaW50ZXJ2YWwgPSBkcm1fZHBfYXV4X3JkX2lu
dGVydmFsKGRwY2QpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIv
aW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4IDZjMTJkZTZmN2U0Ni4uZTBiMmMwM2Yz
Y2JiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIvaW5jbHVk
ZS9kcm0vZHJtX2RwX2hlbHBlci5oCkBAIC02MDgsNiArNjA4LDE0IEBACiAjIGRlZmluZSBEUF9B
REpVU1RfUFJFX0VNUEhBU0lTX0xBTkUxX1NISUZUICA2CiAKICNkZWZpbmUgRFBfQURKVVNUX1JF
UVVFU1RfUE9TVF9DVVJTT1IyICAgICAgMHgyMGMKKyMgZGVmaW5lIERQX0FESlVTVF9QT1NUX0NV
UlNPUjJfTEFORTBfTUFTSyAgMHgwMworIyBkZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VSU09SMl9M
QU5FMF9TSElGVCAwCisjIGRlZmluZSBEUF9BREpVU1RfUE9TVF9DVVJTT1IyX0xBTkUxX01BU0sg
IDB4MGMKKyMgZGVmaW5lIERQX0FESlVTVF9QT1NUX0NVUlNPUjJfTEFORTFfU0hJRlQgMgorIyBk
ZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VSU09SMl9MQU5FMl9NQVNLICAweDMwCisjIGRlZmluZSBE
UF9BREpVU1RfUE9TVF9DVVJTT1IyX0xBTkUyX1NISUZUIDQKKyMgZGVmaW5lIERQX0FESlVTVF9Q
T1NUX0NVUlNPUjJfTEFORTNfTUFTSyAgMHhjMAorIyBkZWZpbmUgRFBfQURKVVNUX1BPU1RfQ1VS
U09SMl9MQU5FM19TSElGVCA2CiAKICNkZWZpbmUgRFBfVEVTVF9SRVFVRVNUCQkJICAgIDB4MjE4
CiAjIGRlZmluZSBEUF9URVNUX0xJTktfVFJBSU5JTkcJCSAgICAoMSA8PCAwKQpAQCAtMTEyMSw2
ICsxMTI5LDggQEAgdTggZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF92b2x0YWdlKGNvbnN0IHU4
IGxpbmtfc3RhdHVzW0RQX0xJTktfU1RBVFVTX1NJWkVdLAogCQkJCSAgICAgaW50IGxhbmUpOwog
dTggZHJtX2RwX2dldF9hZGp1c3RfcmVxdWVzdF9wcmVfZW1waGFzaXMoY29uc3QgdTggbGlua19z
dGF0dXNbRFBfTElOS19TVEFUVVNfU0laRV0sCiAJCQkJCSAgaW50IGxhbmUpOwordTggZHJtX2Rw
X2dldF9hZGp1c3RfcmVxdWVzdF9wb3N0X2N1cnNvcihjb25zdCB1OCBsaW5rX3N0YXR1c1tEUF9M
SU5LX1NUQVRVU19TSVpFXSwKKwkJCQkJIHVuc2lnbmVkIGludCBsYW5lKTsKIAogI2RlZmluZSBE
UF9CUkFOQ0hfT1VJX0hFQURFUl9TSVpFCTB4YwogI2RlZmluZSBEUF9SRUNFSVZFUl9DQVBfU0la
RQkJMHhmCi0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
