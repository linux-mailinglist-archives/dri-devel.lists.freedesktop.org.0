Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5B611024E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E81D6E9D2;
	Tue,  3 Dec 2019 16:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE95F6E9D2
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2019 16:30:01 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id q10so4397005wrm.11
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Dec 2019 08:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zaSjdjjHF8C8+w85wefmLYd2L9dUshbd+yUVIXEIO0Q=;
 b=S0oV8u767JpbdxsmonMLWoyInLziLMfDVw6ApK+OvFvhJwT5GmUESGl/R9pUaLAl/L
 0Qulg5LFVRN8SeYNoWxTIJ3KyYLwd1USO6FW7WsfCrnU7WmzSrFAqZ+vJeUmh4rZYxqm
 kWG5mfhErS4jjHX8NYS/mCXIbEV6bkALRFctLTQX4MJHqa7XHsCTyNICJdhAF/+pzowr
 YOQWtlB7u0PSMY9isSjkYppM2KkqYB2TQByZcHuI6NzmSNh85s+jq/NiuGybKXww1YCL
 VRCw3Yy5tTw3Psc5n0L5XnCmKkIfVfi0tvIZHInN9Iwxa0R1SRoLt/FCBK3+3nZ68yyj
 CD2A==
X-Gm-Message-State: APjAAAUaQL24IDDBmZ65Cklq+On+qO1ga7nwsEERGNxKiA6sVhdMAaXA
 8f5AzgM9SW3WoENZi/7UTzE=
X-Google-Smtp-Source: APXvYqwNbpQvjg2dXko3xhzf7ho/KJI8CqjxHZ2JvEfhjHiV++UgmaGMUswDcW7mROEshIzY4/eeHA==
X-Received: by 2002:adf:eb46:: with SMTP id u6mr6306849wrn.239.1575390600513; 
 Tue, 03 Dec 2019 08:30:00 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id l204sm3679609wmf.2.2019.12.03.08.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2019 08:29:58 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH] drm/tegra: output: Implement system suspend/resume
Date: Tue,  3 Dec 2019 17:29:57 +0100
Message-Id: <20191203162957.1467114-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=zaSjdjjHF8C8+w85wefmLYd2L9dUshbd+yUVIXEIO0Q=;
 b=FOkbWEz7emVE46TomWiu3oD36RAQzhv+zRD4kcD2pe2kkuHGTJhYAB/7/mFGX05apc
 KMsGkU3IqZ2qIOF1KDe1U6jQ+Qkwzj84PG3844NS8uIuWw8yFUhYNdWkhy/fwGaqqGjT
 TTcJNN2BJrW6mj5JWsCOu+7rdY9YlLA0cesSBh4k4tvuAOhosLwcWG3NQGUK4MKHf4k4
 ZU2xpblt5XHui//mhXVdlDaAx5vwW0T7RpY/pqBTw0clzOmFSO8OhdULfRpkd7WM8CPk
 MLQRETB0DOD6LB1O+kwqkofmb7rfQ/9XkE4cVuKwg3HUdcw6IbilN6YD3dYKazEv0AZg
 zyTA==
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KCkltcGxlbWVudCBnZW5l
cmljIHN5c3RlbSBzdXNwZW5kL3Jlc3VtZSBmdW5jdGlvbnMgdGhhdCBjYW4gYmUgdXNlZCB3aXRo
CmFueSBvdXRwdXQgdHlwZS4gQ3VycmVudGx5IHRoaXMgb25seSBpbXBsZW1lbnRzIGRpc2FibGlu
ZyBhbmQgZW5hYmxpbmcKb2YgdGhlIElSUSBmdW5jdGlvbmFsaXR5IGFjcm9zcyBzeXN0ZW0gc3Vz
cGVuZC9yZXN1bWUuIFRoaXMgcHJldmVudHMgYW4KaW50ZXJydXB0IGZyb20gaGFwcGVuaW5nIGJl
Zm9yZSB0aGUgZGlzcGxheSBkcml2ZXIgaGFzIGZ1bGx5IHJlc3VtZWQuCgpTaWduZWQtb2ZmLWJ5
OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0BudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9vdXRwdXQuYyB8IDE2ICsrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS90
ZWdyYS9zb3IuYyAgICB8IDE3ICsrKysrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDMz
IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKaW5kZXggMzQzNzM3MzRmZjY4Li41
NzIwMzAzMGRkMDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90ZWdyYS9vdXRwdXQuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvb3V0cHV0LmMKQEAgLTI1MCwzICsyNTAsMTkgQEAg
dm9pZCB0ZWdyYV9vdXRwdXRfZmluZF9wb3NzaWJsZV9jcnRjcyhzdHJ1Y3QgdGVncmFfb3V0cHV0
ICpvdXRwdXQsCiAKIAlvdXRwdXQtPmVuY29kZXIucG9zc2libGVfY3J0Y3MgPSBtYXNrOwogfQor
CitpbnQgdGVncmFfb3V0cHV0X3N1c3BlbmQoc3RydWN0IHRlZ3JhX291dHB1dCAqb3V0cHV0KQor
eworCWlmIChvdXRwdXQtPmhwZF9pcnEpCisJCWRpc2FibGVfaXJxKG91dHB1dC0+aHBkX2lycSk7
CisKKwlyZXR1cm4gMDsKK30KKworaW50IHRlZ3JhX291dHB1dF9yZXN1bWUoc3RydWN0IHRlZ3Jh
X291dHB1dCAqb3V0cHV0KQoreworCWlmIChvdXRwdXQtPmhwZF9pcnEpCisJCWVuYWJsZV9pcnEo
b3V0cHV0LT5ocGRfaXJxKTsKKworCXJldHVybiAwOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3RlZ3JhL3Nvci5jIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCmluZGV4IDIw
MGQ5OWUxN2FmZS4uNTcyZTE4NTQ1NTA1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vdGVn
cmEvc29yLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Nvci5jCkBAIC0zOTk1LDkgKzM5
OTUsMTYgQEAgc3RhdGljIGludCB0ZWdyYV9zb3Jfc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAJc3RydWN0IHRlZ3JhX3NvciAqc29yID0gZGV2X2dldF9kcnZkYXRhKGRldik7CiAJaW50IGVy
cjsKIAorCWVyciA9IHRlZ3JhX291dHB1dF9zdXNwZW5kKCZzb3ItPm91dHB1dCk7CisJaWYgKGVy
ciA8IDApIHsKKwkJZGV2X2VycihkZXYsICJmYWlsZWQgdG8gc3VzcGVuZCBvdXRwdXQ6ICVkXG4i
LCBlcnIpOworCQlyZXR1cm4gZXJyOworCX0KKwogCWlmIChzb3ItPmhkbWlfc3VwcGx5KSB7CiAJ
CWVyciA9IHJlZ3VsYXRvcl9kaXNhYmxlKHNvci0+aGRtaV9zdXBwbHkpOwogCQlpZiAoZXJyIDwg
MCkgeworCQkJdGVncmFfb3V0cHV0X3Jlc3VtZSgmc29yLT5vdXRwdXQpOwogCQkJcmV0dXJuIGVy
cjsKIAkJfQogCX0KQEAgLTQwMTYsNiArNDAyMywxNiBAQCBzdGF0aWMgaW50IHRlZ3JhX3Nvcl9y
ZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCQkJcmV0dXJuIGVycjsKIAl9CiAKKwllcnIgPSB0
ZWdyYV9vdXRwdXRfcmVzdW1lKCZzb3ItPm91dHB1dCk7CisJaWYgKGVyciA8IDApIHsKKwkJZGV2
X2VycihkZXYsICJmYWlsZWQgdG8gcmVzdW1lIG91dHB1dDogJWRcbiIsIGVycik7CisKKwkJaWYg
KHNvci0+aGRtaV9zdXBwbHkpCisJCQlyZWd1bGF0b3JfZGlzYWJsZShzb3ItPmhkbWlfc3VwcGx5
KTsKKworCQlyZXR1cm4gZXJyOworCX0KKwogCXJldHVybiAwOwogfQogCi0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
