Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA4710CBE2
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 16:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6168889C3F;
	Thu, 28 Nov 2019 15:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A202D89C3F
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 15:37:58 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t2so31628468wrr.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 07:37:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+Dj5QeGhVIw+jJO0yySFJPhYXfPiaBftwUYyrusaKzY=;
 b=jWUyFPBfGaSfWfWXXtdcu6z/jTlIzflieW3a1bWaUaiINqnOkANw2GDa2Ud5dIhY0y
 yeB6GHGQ1PEEbQNjL2k3Jx8ttqm50aqu3L5auhIqm2AM3LRZxuNGoen3/I8AG3cnViFq
 5w63J2eyu16ajI1UiwKKKpv9N+OlraYu9qZtQwnPV4nd5BtTSxEaYXkYxBqq70SfoCGO
 vaOkEGgZzihk3umELKEuWlZF0VlE6xt5/H/vVm7OBU4OCZpsW7gEAfv3mtLAbEGVMbk7
 aLzJnc0CvtfT3ry2EOvuS7tnnRnk7A+jZ1E3scGEDf71reAHKCLWwNR10GvgnqnCEcj0
 hndQ==
X-Gm-Message-State: APjAAAX4ptZQaV5zUB7IjAvMi3utqEEuH2gho/5OIKZGv8IuG4nZ6b6c
 cDL50Va/aKubLTQsc/OymtM=
X-Google-Smtp-Source: APXvYqwS6ivoSIoL1JFkfrZIU83hrx3H7cggPKDcssn9xfif+3YWxM9Ll57LI06q98frR6TkygjpZw==
X-Received: by 2002:adf:9427:: with SMTP id 36mr40495496wrq.166.1574955477119; 
 Thu, 28 Nov 2019 07:37:57 -0800 (PST)
Received: from localhost (pD9E518ED.dip0.t-ipconnect.de. [217.229.24.237])
 by smtp.gmail.com with ESMTPSA id 60sm23844474wrn.86.2019.11.28.07.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 07:37:56 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 7/9] drm/tegra: Silence expected errors on IOMMU attach
Date: Thu, 28 Nov 2019 16:37:39 +0100
Message-Id: <20191128153741.2380419-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128153741.2380419-1-thierry.reding@gmail.com>
References: <20191128153741.2380419-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+Dj5QeGhVIw+jJO0yySFJPhYXfPiaBftwUYyrusaKzY=;
 b=cqT7e+42pcBLNUzMN1laPcYNlu1zTORQr2TV7bJdnQlTWu4bwC9aJkxcRknC91wrVQ
 VMJqdr/fksMMm/pyo2cJRP8DXDjHnQk4U0xC8eQ5Q2eB1iwzJBfU3teahBAnrj/j4duT
 koKAM9qrs4ZmhmvRz3gK+U/6YuEeR6+gc77WUyXSY+C7VuV0DVp1+b88VZ5vGJaJYAU8
 6N2HFCQ9IX+xEEfLzBBIMnFLhFRYpMCvoRZin3ZVmcQCNBtWYwBgu8aaA8w7z5j1rFHo
 JZPpQni4vP1rrwt1RzrOoJkVES4hkRIu2IJhyUTSHUT0fwSblrnzSV31BFMtBQSjcdNc
 /Trw==
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

RnJvbTogVGhpZXJyeSBSZWRpbmcgPHRyZWRpbmdAbnZpZGlhLmNvbT4KClN1YmRldmljZXMgbWF5
IG5vdCBiZSBob29rZWQgdXAgdG8gYW4gSU9NTVUgdmlhIGRldmljZSB0cmVlLiBEZXRlY3Qgc3Vj
aApzaXR1YXRpb25zIGFuZCBhdm9pZCBjb25mdXNpbmcgdXNlcnMgYnkgbm90IGVtaXR0aW5nIGFu
IGVycm9yIG1lc3NhZ2UuCgpTaWduZWQtb2ZmLWJ5OiBUaGllcnJ5IFJlZGluZyA8dHJlZGluZ0Bu
dmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90ZWdyYS9kYy5jICB8IDIgKy0KIGRyaXZl
cnMvZ3B1L2RybS90ZWdyYS9kcm0uYyB8IDQgKy0tLQogZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3Zp
Yy5jIHwgMiArLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMgYi9kcml2ZXJzL2dw
dS9kcm0vdGVncmEvZGMuYwppbmRleCAwYTVmODZiNjFmZGEuLjJiOWEyNWM5NzdjMCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL2RjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Rl
Z3JhL2RjLmMKQEAgLTIwMjcsNyArMjAyNyw3IEBAIHN0YXRpYyBpbnQgdGVncmFfZGNfaW5pdChz
dHJ1Y3QgaG9zdDF4X2NsaWVudCAqY2xpZW50KQogCQlkZXZfd2FybihkYy0+ZGV2LCAiZmFpbGVk
IHRvIGFsbG9jYXRlIHN5bmNwb2ludFxuIik7CiAKIAllcnIgPSBob3N0MXhfY2xpZW50X2lvbW11
X2F0dGFjaChjbGllbnQpOwotCWlmIChlcnIgPCAwKSB7CisJaWYgKGVyciA8IDAgJiYgZXJyICE9
IC1FTk9ERVYpIHsKIAkJZGV2X2VycihjbGllbnQtPmRldiwgImZhaWxlZCB0byBhdHRhY2ggdG8g
ZG9tYWluOiAlZFxuIiwgZXJyKTsKIAkJcmV0dXJuIGVycjsKIAl9CmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMKaW5k
ZXggNTZlNWU3YTVjMTA4Li43YTE2YjUxZWFhMmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS90ZWdyYS9kcm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vdGVncmEvZHJtLmMKQEAgLTkyMCwx
MCArOTIwLDggQEAgaW50IGhvc3QxeF9jbGllbnRfaW9tbXVfYXR0YWNoKHN0cnVjdCBob3N0MXhf
Y2xpZW50ICpjbGllbnQpCiAKIAlpZiAodGVncmEtPmRvbWFpbikgewogCQlncm91cCA9IGlvbW11
X2dyb3VwX2dldChjbGllbnQtPmRldik7Ci0JCWlmICghZ3JvdXApIHsKLQkJCWRldl9lcnIoY2xp
ZW50LT5kZXYsICJmYWlsZWQgdG8gZ2V0IElPTU1VIGdyb3VwXG4iKTsKKwkJaWYgKCFncm91cCkK
IAkJCXJldHVybiAtRU5PREVWOwotCQl9CiAKIAkJaWYgKGRvbWFpbiAhPSB0ZWdyYS0+ZG9tYWlu
KSB7CiAJCQllcnIgPSBpb21tdV9hdHRhY2hfZ3JvdXAodGVncmEtPmRvbWFpbiwgZ3JvdXApOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3RlZ3JhL3ZpYy5jIGIvZHJpdmVycy9ncHUvZHJt
L3RlZ3JhL3ZpYy5jCmluZGV4IGM0ZDgyYjhiMzA2NS4uMzUyNmMyODkyZGRiIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vdGVncmEvdmljLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3RlZ3Jh
L3ZpYy5jCkBAIC0xNjcsNyArMTY3LDcgQEAgc3RhdGljIGludCB2aWNfaW5pdChzdHJ1Y3QgaG9z
dDF4X2NsaWVudCAqY2xpZW50KQogCWludCBlcnI7CiAKIAllcnIgPSBob3N0MXhfY2xpZW50X2lv
bW11X2F0dGFjaChjbGllbnQpOwotCWlmIChlcnIgPCAwKSB7CisJaWYgKGVyciA8IDAgJiYgZXJy
ICE9IC1FTk9ERVYpIHsKIAkJZGV2X2Vycih2aWMtPmRldiwgImZhaWxlZCB0byBhdHRhY2ggdG8g
ZG9tYWluOiAlZFxuIiwgZXJyKTsKIAkJcmV0dXJuIGVycjsKIAl9Ci0tIAoyLjIzLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
