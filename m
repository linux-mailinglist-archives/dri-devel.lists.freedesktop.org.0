Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F125E2FB60D
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jan 2021 13:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84536E870;
	Tue, 19 Jan 2021 12:18:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B420E6E870
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 12:18:25 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id g12so28193823ejf.8
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jan 2021 04:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HW4kWonLF4Jixrj4X71t2cre4ql8cQhva/KG2KMO+DU=;
 b=WI3j5k6+2I1AsHjV/X7RLOPwdxSfiO9z1vcDW0MCEB3fQcQBjrfUXzWbOiJxpf+5UU
 CCnhS5a8m+pakWleZAouKkJsBERp0sxBnG6gFAIdIMJbl/dysEnKYCjN9ayOn0BWSFPO
 Uu9ByTf+1Dr9fDQvKE4qxAnLmfg8mZ/5a7H4bzV83uceSu7NSDepNuxu4Ibsr8pSNLlK
 suMM3SkWLItLjUzxijiR7Vo6CrCCvrsK2/CXAXDpNq5/vuE0grX2iojF2EyDlxDvhVdq
 ecGuJnaUHKMI9OsWNGeTGok1xOQfpccLsHQJsiq23HCJHuerqJKdxe02KjD8ogCuDsDM
 vhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HW4kWonLF4Jixrj4X71t2cre4ql8cQhva/KG2KMO+DU=;
 b=Jzo2PWGzIOlNGhtH5KlTzgGPJEeacJ73Vt3WHQKlQlJ9+A6Bv/AunZUX35IAbY9IS6
 9YiGIcPwhsi+8v//CRH2Off6M6PfRlC/1/Fhv9Y6AcbxWVpRrQF94t+HkA38DXFBKtSK
 0zFn2qkSXbeQS8xmPY8FXQ/qUdRzjpwIbmTaP2vAA0qZ2OFlcNPD9oH/H5Yw321HhQdC
 xHdFZTUhCVnGUGllUXyF8R1lcbcPGUAiHKStmMYFdCM6a/KOZEHPAKo5gwn3+z3HhzfG
 OYcI5OwxVFyqY0ahFQh0WpUatJaiNhBXrdh3GLcB876UFca0dgvcRQFXJYM2TlMSzw+b
 g/wA==
X-Gm-Message-State: AOAM532d5VluWLxneuZa0KAQAuofmtPR9y67az4fuhQiZ92ht9CDOwCV
 gx1DD9zM4K3FM387ZoHtFh0=
X-Google-Smtp-Source: ABdhPJw4UF8RXzE4c3F67oVyR5yr5JRyhxCawLnIEvt17E+O/qrYlOsEt7HiFqWvG+UfYMjOZ4GAbg==
X-Received: by 2002:a17:906:a84a:: with SMTP id
 dx10mr2845692ejb.13.1611058704471; 
 Tue, 19 Jan 2021 04:18:24 -0800 (PST)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b05c:1403:9024:973b])
 by smtp.gmail.com with ESMTPSA id q9sm7090422ejd.113.2021.01.19.04.18.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 04:18:24 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ray.huang@amd.com,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/ttm: add debugfs entry to test pool shrinker v2
Date: Tue, 19 Jan 2021 13:18:20 +0100
Message-Id: <20210119121821.2320-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210119121821.2320-1-christian.koenig@amd.com>
References: <20210119121821.2320-1-christian.koenig@amd.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlZnVsIGZvciB0ZXN0aW5nLgoKdjI6IGFkZCBmc19yZWNsYWltX2FjcXVpcmUoKS9fcmVsZWFz
ZSgpCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jIHwgNTMgKysrKysrKysr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDM1IGluc2VydGlvbnMo
KyksIDE4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRt
X3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwppbmRleCAxZDYxZThmYzBl
ODEuLjk4ZWNiOWM5ODQyYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9v
bC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYwpAQCAtMzMsNiArMzMsNyBA
QAogCiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+CiAjaW5jbHVkZSA8bGludXgvZG1hLW1hcHBp
bmcuaD4KKyNpbmNsdWRlIDxsaW51eC9zY2hlZC9tbS5oPgogCiAjaWZkZWYgQ09ORklHX1g4Ngog
I2luY2x1ZGUgPGFzbS9zZXRfbWVtb3J5Lmg+CkBAIC01MjksNiArNTMwLDI4IEBAIHZvaWQgdHRt
X3Bvb2xfZmluaShzdHJ1Y3QgdHRtX3Bvb2wgKnBvb2wpCiB9CiBFWFBPUlRfU1lNQk9MKHR0bV9w
b29sX2ZpbmkpOwogCisvKiBBcyBsb25nIGFzIHBhZ2VzIGFyZSBhdmFpbGFibGUgbWFrZSBzdXJl
IHRvIHJlbGVhc2UgYXQgbGVhc3Qgb25lICovCitzdGF0aWMgdW5zaWduZWQgbG9uZyB0dG1fcG9v
bF9zaHJpbmtlcl9zY2FuKHN0cnVjdCBzaHJpbmtlciAqc2hyaW5rLAorCQkJCQkgICAgc3RydWN0
IHNocmlua19jb250cm9sICpzYykKK3sKKwl1bnNpZ25lZCBsb25nIG51bV9mcmVlZCA9IDA7CisK
KwlkbworCQludW1fZnJlZWQgKz0gdHRtX3Bvb2xfc2hyaW5rKCk7CisJd2hpbGUgKCFudW1fZnJl
ZWQgJiYgYXRvbWljX2xvbmdfcmVhZCgmYWxsb2NhdGVkX3BhZ2VzKSk7CisKKwlyZXR1cm4gbnVt
X2ZyZWVkOworfQorCisvKiBSZXR1cm4gdGhlIG51bWJlciBvZiBwYWdlcyBhdmFpbGFibGUgb3Ig
U0hSSU5LX0VNUFRZIGlmIHdlIGhhdmUgbm9uZSAqLworc3RhdGljIHVuc2lnbmVkIGxvbmcgdHRt
X3Bvb2xfc2hyaW5rZXJfY291bnQoc3RydWN0IHNocmlua2VyICpzaHJpbmssCisJCQkJCSAgICAg
c3RydWN0IHNocmlua19jb250cm9sICpzYykKK3sKKwl1bnNpZ25lZCBsb25nIG51bV9wYWdlcyA9
IGF0b21pY19sb25nX3JlYWQoJmFsbG9jYXRlZF9wYWdlcyk7CisKKwlyZXR1cm4gbnVtX3BhZ2Vz
ID8gbnVtX3BhZ2VzIDogU0hSSU5LX0VNUFRZOworfQorCiAjaWZkZWYgQ09ORklHX0RFQlVHX0ZT
CiAvKiBDb3VudCB0aGUgbnVtYmVyIG9mIHBhZ2VzIGF2YWlsYWJsZSBpbiBhIHBvb2xfdHlwZSAq
Lwogc3RhdGljIHVuc2lnbmVkIGludCB0dG1fcG9vbF90eXBlX2NvdW50KHN0cnVjdCB0dG1fcG9v
bF90eXBlICpwdCkKQEAgLTYzMywyOSArNjU2LDIxIEBAIGludCB0dG1fcG9vbF9kZWJ1Z2ZzKHN0
cnVjdCB0dG1fcG9vbCAqcG9vbCwgc3RydWN0IHNlcV9maWxlICptKQogfQogRVhQT1JUX1NZTUJP
TCh0dG1fcG9vbF9kZWJ1Z2ZzKTsKIAotI2VuZGlmCi0KLS8qIEFzIGxvbmcgYXMgcGFnZXMgYXJl
IGF2YWlsYWJsZSBtYWtlIHN1cmUgdG8gcmVsZWFzZSBhdCBsZWFzdCBvbmUgKi8KLXN0YXRpYyB1
bnNpZ25lZCBsb25nIHR0bV9wb29sX3Nocmlua2VyX3NjYW4oc3RydWN0IHNocmlua2VyICpzaHJp
bmssCi0JCQkJCSAgICBzdHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjKQorLyogVGVzdCB0aGUgc2hy
aW5rZXIgZnVuY3Rpb25zIGFuZCBkdW1wIHRoZSByZXN1bHQgKi8KK3N0YXRpYyBpbnQgdHRtX3Bv
b2xfZGVidWdmc19zaHJpbmtfc2hvdyhzdHJ1Y3Qgc2VxX2ZpbGUgKm0sIHZvaWQgKmRhdGEpCiB7
Ci0JdW5zaWduZWQgbG9uZyBudW1fZnJlZWQgPSAwOworCXN0cnVjdCBzaHJpbmtfY29udHJvbCBz
YyA9IHsgLmdmcF9tYXNrID0gR0ZQX05PRlMgfTsKIAotCWRvCi0JCW51bV9mcmVlZCArPSB0dG1f
cG9vbF9zaHJpbmsoKTsKLQl3aGlsZSAoIW51bV9mcmVlZCAmJiBhdG9taWNfbG9uZ19yZWFkKCZh
bGxvY2F0ZWRfcGFnZXMpKTsKKwlmc19yZWNsYWltX2FjcXVpcmUoR0ZQX0tFUk5FTCk7CisJc2Vx
X3ByaW50ZihtLCAiJWx1LyVsdVxuIiwgdHRtX3Bvb2xfc2hyaW5rZXJfY291bnQoJm1tX3Nocmlu
a2VyLCAmc2MpLAorCQkgICB0dG1fcG9vbF9zaHJpbmtlcl9zY2FuKCZtbV9zaHJpbmtlciwgJnNj
KSk7CisJZnNfcmVjbGFpbV9yZWxlYXNlKEdGUF9LRVJORUwpOwogCi0JcmV0dXJuIG51bV9mcmVl
ZDsKKwlyZXR1cm4gMDsKIH0KK0RFRklORV9TSE9XX0FUVFJJQlVURSh0dG1fcG9vbF9kZWJ1Z2Zz
X3Nocmluayk7CiAKLS8qIFJldHVybiB0aGUgbnVtYmVyIG9mIHBhZ2VzIGF2YWlsYWJsZSBvciBT
SFJJTktfRU1QVFkgaWYgd2UgaGF2ZSBub25lICovCi1zdGF0aWMgdW5zaWduZWQgbG9uZyB0dG1f
cG9vbF9zaHJpbmtlcl9jb3VudChzdHJ1Y3Qgc2hyaW5rZXIgKnNocmluaywKLQkJCQkJICAgICBz
dHJ1Y3Qgc2hyaW5rX2NvbnRyb2wgKnNjKQotewotCXVuc2lnbmVkIGxvbmcgbnVtX3BhZ2VzID0g
YXRvbWljX2xvbmdfcmVhZCgmYWxsb2NhdGVkX3BhZ2VzKTsKLQotCXJldHVybiBudW1fcGFnZXMg
PyBudW1fcGFnZXMgOiBTSFJJTktfRU1QVFk7Ci19CisjZW5kaWYKIAogLyoqCiAgKiB0dG1fcG9v
bF9tZ3JfaW5pdCAtIEluaXRpYWxpemUgZ2xvYmFscwpAQCAtNjg4LDYgKzcwMyw4IEBAIGludCB0
dG1fcG9vbF9tZ3JfaW5pdCh1bnNpZ25lZCBsb25nIG51bV9wYWdlcykKICNpZmRlZiBDT05GSUdf
REVCVUdfRlMKIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxlKCJwYWdlX3Bvb2wiLCAwNDQ0LCB0dG1fZGVi
dWdmc19yb290LCBOVUxMLAogCQkJICAgICZ0dG1fcG9vbF9kZWJ1Z2ZzX2dsb2JhbHNfZm9wcyk7
CisJZGVidWdmc19jcmVhdGVfZmlsZSgicGFnZV9wb29sX3NocmluayIsIDA0MDAsIHR0bV9kZWJ1
Z2ZzX3Jvb3QsIE5VTEwsCisJCQkgICAgJnR0bV9wb29sX2RlYnVnZnNfc2hyaW5rX2ZvcHMpOwog
I2VuZGlmCiAKIAltbV9zaHJpbmtlci5jb3VudF9vYmplY3RzID0gdHRtX3Bvb2xfc2hyaW5rZXJf
Y291bnQ7Ci0tIAoyLjI1LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbAo=
