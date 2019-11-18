Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB3101B11
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 232496EBAC;
	Tue, 19 Nov 2019 08:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com
 [IPv6:2a00:1450:4864:20::142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48F3A6E827
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 20:05:50 +0000 (UTC)
Received: by mail-lf1-x142.google.com with SMTP id l28so5405946lfj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:05:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=elZWeE6UcuQp3DEzgdQgaL5jKLTt+cOSPUtF3y9TNa4=;
 b=AKlLZZn3kicedVYpCfOpaGS/CJlqWvvGoVsqDWqB5UikODrmCItd0X/8ypGw429t5X
 gUDsz+N879l5NJ/WyWNrgGoJsiWlsrEMMc0RtOiTPrbwfLiRAUhm9JtwfusfwflGbeY+
 CvblDiY9/VGd62I2q6XJx/Us01iOa8MUCdtPOBF8XnY5lTRuLOMuTL9gJRvO9RV+O78e
 /v6wtWS8AgpHLxr2h86hmP4bBOG5vCC0r9BUc1qsW9++NgRZH5dK+SBzfg35Kn6DcnRz
 9WRXF8Nigz+5HzKHbZhVFf0VUERKVPIgrQyYV0Lehbw/58sWIh0aAJ+tMuqQYdt/eNGr
 ccWA==
X-Gm-Message-State: APjAAAWmsbHpzbr92KjRwJ/wjrwjRmVg9STZd9mm16xbxOmuCyoo9wiy
 IkozgkH5EsKthdT4ZJp3tVg=
X-Google-Smtp-Source: APXvYqzeJRAE++Yzki9UJ98MMjtqUsLFff7ZYuUVv6qYq5NYvloMtXahcKAZxpKSThtQeJfpU/MEiQ==
X-Received: by 2002:ac2:4a8a:: with SMTP id l10mr816734lfp.185.1574107548766; 
 Mon, 18 Nov 2019 12:05:48 -0800 (PST)
Received: from localhost.localdomain (79-139-233-37.dynamic.spd-mgts.ru.
 [79.139.233.37])
 by smtp.gmail.com with ESMTPSA id j23sm9166942lji.41.2019.11.18.12.05.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2019 12:05:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>,
 Georgi Djakov <georgi.djakov@linaro.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v1 18/29] memory: tegra20-emc: Continue probing if timings/IRQ
 are missing in device-tree
Date: Mon, 18 Nov 2019 23:02:36 +0300
Message-Id: <20191118200247.3567-19-digetx@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118200247.3567-1-digetx@gmail.com>
References: <20191118200247.3567-1-digetx@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=elZWeE6UcuQp3DEzgdQgaL5jKLTt+cOSPUtF3y9TNa4=;
 b=bdAg91BC7ySUYH4sCX/GvLhlH61/SVZBlLXA+AgeAWMbPzQ0WUMiXN1C//dc774oBe
 0RlnlfFVzOCWhVgpOc+W+vMK7nCmF2auinzsygXORlxIe+MuqtgczrPzZFcLBKF/jBhI
 HJbogqZbGxbFOyC7nh+PyQ7MVpKLwSyMMyPDEp70t8veTacmaBkmisXAxE8RoyxHGacD
 iaKBk8MiKcCilSx09+6ya9laXjQC/RTYtiBFth/R22JjINQzQ3y/DXv/5SpAfY1UH78o
 ROHWKltjPZ7/jkhz1vUYzS3LOyaBksnJ+EY9/lg5nuzvGw5QaWIoZRCwN9eTZ2ZSw5WU
 usfg==
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-pm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RU1DIGRyaXZlciB3aWxsIGJlY29tZSBtYW5kYXRvcnkgYWZ0ZXIgbWFraW5nIGl0IGludGVyY29u
bmVjdCBwcm92aWRlcgpiZWNhdXNlIGludGVyY29ubmVjdCB1c2VycyBsaWtlIGRpc3BsYXkgY29u
dHJvbGxlciBkcml2ZXIgd2lsbCBmYWlsIHRvCnByb2JlIHVzaW5nIG5ld2VyIGRldmljZS10cmVl
cyB0aGF0IGhhdmUgaW50ZXJjb25uZWN0IHByb3BlcnRpZXMuIFRodXMKbWFrZSBkcml2ZXIgdG8g
cHJvYmUgZXZlbiBpZiB0aW1pbmdzIG9yIElSUSBhcmUgbWlzc2luZyBpbiBkZXZpY2UtdHJlZSwK
dGhlIGZyZXF1ZW5jeSBzY2FsaW5nIHdvbid0IGJlIGF2YWlsYWJsZSBpbiB0aGlzIGNhc2UgYmVj
YXVzZSB0aGVyZSB3aWxsCmJlIG9ubHkgb25lIGZyZXF1ZW5jeSBhdmFpbGFibGUsIHRoZSBmcmVx
dWVuY3kgdGhhdCBpcyBsZWZ0IGZyb20KYm9vdGxvYWRlci4KClNpZ25lZC1vZmYtYnk6IERtaXRy
eSBPc2lwZW5rbyA8ZGlnZXR4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL21lbW9yeS90ZWdyYS90
ZWdyYTIwLWVtYy5jIHwgNjEgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMzEgaW5zZXJ0aW9ucygrKSwgMzAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9tZW1vcnkvdGVncmEvdGVncmEyMC1lbWMuYyBiL2RyaXZlcnMvbWVtb3J5L3RlZ3Jh
L3RlZ3JhMjAtZW1jLmMKaW5kZXggZDJlZmQwYzY1OGMwLi4yOGJkOWZkNGMzYzkgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvbWVtb3J5L3RlZ3JhL3RlZ3JhMjAtZW1jLmMKKysrIGIvZHJpdmVycy9tZW1v
cnkvdGVncmEvdGVncmEyMC1lbWMuYwpAQCAtMzgxLDYgKzM4MSwxMSBAQCB0ZWdyYV9lbWNfZmlu
ZF9ub2RlX2J5X3JhbV9jb2RlKHN0cnVjdCBkZXZpY2UgKmRldikKIAl1MzIgdmFsdWUsIHJhbV9j
b2RlOwogCWludCBlcnI7CiAKKwlpZiAob2ZfZ2V0X2NoaWxkX2NvdW50KGRldi0+b2Zfbm9kZSkg
PT0gMCkgeworCQlkZXZfaW5mbyhkZXYsICJkZXZpY2UtdHJlZSBkb2Vzbid0IGhhdmUgbWVtb3J5
IHRpbWluZ3NcbiIpOworCQlyZXR1cm4gTlVMTDsKKwl9CisKIAlpZiAoIW9mX3Byb3BlcnR5X3Jl
YWRfYm9vbChkZXYtPm9mX25vZGUsICJudmlkaWEsdXNlLXJhbS1jb2RlIikpCiAJCXJldHVybiBv
Zl9ub2RlX2dldChkZXYtPm9mX25vZGUpOwogCkBAIC00NDksNiArNDU0LDkgQEAgc3RhdGljIGxv
bmcgZW1jX3JvdW5kX3JhdGUodW5zaWduZWQgbG9uZyByYXRlLAogCXN0cnVjdCB0ZWdyYV9lbWMg
KmVtYyA9IGFyZzsKIAl1bnNpZ25lZCBpbnQgaTsKIAorCWlmICghZW1jLT5udW1fdGltaW5ncykK
KwkJcmV0dXJuIGNsa19nZXRfcmF0ZShlbWMtPmNsayk7CisKIAltaW5fcmF0ZSA9IG1pbihtaW5f
cmF0ZSwgZW1jLT50aW1pbmdzW2VtYy0+bnVtX3RpbWluZ3MgLSAxXS5yYXRlKTsKIAogCWZvciAo
aSA9IDA7IGkgPCBlbWMtPm51bV90aW1pbmdzOyBpKyspIHsKQEAgLTQ4NCwzOCArNDkyLDIxIEBA
IHN0YXRpYyBpbnQgdGVncmFfZW1jX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJc3RydWN0IHRlZ3JhX2VtYyAqZW1jOwogCWludCBpcnEsIGVycjsKIAotCS8qIGRyaXZlciBo
YXMgbm90aGluZyB0byBkbyBpbiBhIGNhc2Ugb2YgbWVtb3J5IHRpbWluZyBhYnNlbmNlICovCi0J
aWYgKG9mX2dldF9jaGlsZF9jb3VudChwZGV2LT5kZXYub2Zfbm9kZSkgPT0gMCkgewotCQlkZXZf
aW5mbygmcGRldi0+ZGV2LAotCQkJICJFTUMgZGV2aWNlIHRyZWUgbm9kZSBkb2Vzbid0IGhhdmUg
bWVtb3J5IHRpbWluZ3NcbiIpOwotCQlyZXR1cm4gMDsKLQl9Ci0KLQlpcnEgPSBwbGF0Zm9ybV9n
ZXRfaXJxKHBkZXYsIDApOwotCWlmIChpcnEgPCAwKSB7Ci0JCWRldl9lcnIoJnBkZXYtPmRldiwg
ImludGVycnVwdCBub3Qgc3BlY2lmaWVkXG4iKTsKLQkJZGV2X2VycigmcGRldi0+ZGV2LCAicGxl
YXNlIHVwZGF0ZSB5b3VyIGRldmljZSB0cmVlXG4iKTsKLQkJcmV0dXJuIGlycTsKLQl9Ci0KLQlu
cCA9IHRlZ3JhX2VtY19maW5kX25vZGVfYnlfcmFtX2NvZGUoJnBkZXYtPmRldik7Ci0JaWYgKCFu
cCkKLQkJcmV0dXJuIC1FSU5WQUw7Ci0KIAllbWMgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwg
c2l6ZW9mKCplbWMpLCBHRlBfS0VSTkVMKTsKLQlpZiAoIWVtYykgewotCQlvZl9ub2RlX3B1dChu
cCk7CisJaWYgKCFlbWMpCiAJCXJldHVybiAtRU5PTUVNOwotCX0KIAogCWluaXRfY29tcGxldGlv
bigmZW1jLT5jbGtfaGFuZHNoYWtlX2NvbXBsZXRlKTsKIAllbWMtPmNsa19uYi5ub3RpZmllcl9j
YWxsID0gdGVncmFfZW1jX2Nsa19jaGFuZ2Vfbm90aWZ5OwogCWVtYy0+ZGV2ID0gJnBkZXYtPmRl
djsKIAotCWVyciA9IHRlZ3JhX2VtY19sb2FkX3RpbWluZ3NfZnJvbV9kdChlbWMsIG5wKTsKLQlv
Zl9ub2RlX3B1dChucCk7Ci0JaWYgKGVycikKLQkJcmV0dXJuIGVycjsKKwlucCA9IHRlZ3JhX2Vt
Y19maW5kX25vZGVfYnlfcmFtX2NvZGUoJnBkZXYtPmRldik7CisJaWYgKG5wKSB7CisJCWVyciA9
IHRlZ3JhX2VtY19sb2FkX3RpbWluZ3NfZnJvbV9kdChlbWMsIG5wKTsKKwkJb2Zfbm9kZV9wdXQo
bnApOworCQlpZiAoZXJyKQorCQkJcmV0dXJuIGVycjsKKwl9CiAKIAllbWMtPnJlZ3MgPSBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7CiAJaWYgKElTX0VSUihlbWMtPnJl
Z3MpKQpAQCAtNTI1LDExICs1MTYsMjEgQEAgc3RhdGljIGludCB0ZWdyYV9lbWNfcHJvYmUoc3Ry
dWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoZXJyKQogCQlyZXR1cm4gZXJyOwogCi0J
ZXJyID0gZGV2bV9yZXF1ZXN0X2lycSgmcGRldi0+ZGV2LCBpcnEsIHRlZ3JhX2VtY19pc3IsIDAs
Ci0JCQkgICAgICAgZGV2X25hbWUoJnBkZXYtPmRldiksIGVtYyk7Ci0JaWYgKGVycikgewotCQlk
ZXZfZXJyKCZwZGV2LT5kZXYsICJmYWlsZWQgdG8gcmVxdWVzdCBJUlEjJXU6ICVkXG4iLCBpcnEs
IGVycik7Ci0JCXJldHVybiBlcnI7CisJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsK
KwlpZiAoaXJxIDwgMCkgeworCQlkZXZfZXJyKCZwZGV2LT5kZXYsICJpbnRlcnJ1cHQgbm90IHNw
ZWNpZmllZFxuIik7CisJCWRldl9lcnIoJnBkZXYtPmRldiwgInBsZWFzZSB1cGRhdGUgeW91ciBk
ZXZpY2UgdHJlZVxuIik7CisJCWRldl9lcnIoJnBkZXYtPmRldiwgImZyZXF1ZW5jeSBzY2FsaW5n
IGRpc2FibGVkXG4iKTsKKworCQllbWMtPm51bV90aW1pbmdzID0gMDsKKwl9IGVsc2UgeworCQll
cnIgPSBkZXZtX3JlcXVlc3RfaXJxKCZwZGV2LT5kZXYsIGlycSwgdGVncmFfZW1jX2lzciwgMCwK
KwkJCQkgICAgICAgZGV2X25hbWUoJnBkZXYtPmRldiksIGVtYyk7CisJCWlmIChlcnIpIHsKKwkJ
CWRldl9lcnIoJnBkZXYtPmRldiwgImZhaWxlZCB0byByZXF1ZXN0IElSUSMldTogJWRcbiIsCisJ
CQkJaXJxLCBlcnIpOworCQkJcmV0dXJuIGVycjsKKwkJfQogCX0KIAogCXRlZ3JhMjBfY2xrX3Nl
dF9lbWNfcm91bmRfY2FsbGJhY2soZW1jX3JvdW5kX3JhdGUsIGVtYyk7Ci0tIAoyLjIzLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
