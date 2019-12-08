Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 500CB116A12
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2019 10:48:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08FBE6E3A4;
	Mon,  9 Dec 2019 09:47:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4061B6E0AD
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Dec 2019 17:19:02 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p9so12927010wmc.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Dec 2019 09:19:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/08gW13TofccXenPvhotNWPtw70ZwPRo+rtrcdU/+VA=;
 b=k2OWQO4QX1ZLnTBrnCFimtAjDntxh0MWGp48Jb4HPNEWcI/77AU4p+5dOgJHbuH52s
 qP5Sup3IFKFRrmEt9JxY7u0CWk/Ya/yoWHx3ENde4zyNynYzhtdM2J5FkJEUHTLVck9l
 /zIm/qXS5lJNJ5dhITSUWjYUMp4ejgXXXOr9ZqH7puXniyO6jInnBlOt2z3elwGqAHXX
 yGmIqbT6QjlYcOLm+PaAHDoCjweetB+lM+Xony1v4dIHvX/Ft3Rlu/BowugkeDsdZcLD
 0/4sR57IJUj/sdd2DBWPdmxFYHL8lLktRCs+K0Wj5b1rfRbF/sGbZRIiEFDVK4Kmnqyz
 nrRQ==
X-Gm-Message-State: APjAAAV9sRN+R1AzsyvA8FIFIcWZm2nULsutGAAsFqsx8c0DghODsv9P
 fsRrMGwcxmU/QOFjDoYNinrVPxeP
X-Google-Smtp-Source: APXvYqzl065F05Yt2j+aTRbWAW7DyJzxv18Zx1ZqmxuQS7SJlPzVCkEImtiMCQ5YaYB9e0PK14tHWg==
X-Received: by 2002:a1c:9e49:: with SMTP id h70mr22066604wme.79.1575825540738; 
 Sun, 08 Dec 2019 09:19:00 -0800 (PST)
Received: from localhost.localdomain
 (p200300F1371AD700428D5CFFFEB99DB8.dip0.t-ipconnect.de.
 [2003:f1:371a:d700:428d:5cff:feb9:9db8])
 by smtp.googlemail.com with ESMTPSA id g25sm11791383wmh.3.2019.12.08.09.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Dec 2019 09:18:59 -0800 (PST)
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
To: linux-amlogic@lists.infradead.org,
	narmstrong@baylibre.com
Subject: [PATCH v2 1/2] drm: meson: venc: cvbs: deduplicate the
 meson_cvbs_mode lookup code
Date: Sun,  8 Dec 2019 18:18:31 +0100
Message-Id: <20191208171832.1064772-2-martin.blumenstingl@googlemail.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
References: <20191208171832.1064772-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Dec 2019 09:46:36 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/08gW13TofccXenPvhotNWPtw70ZwPRo+rtrcdU/+VA=;
 b=RRaXPEPB4QQdctB7WfH81TtTfrknUORtdviB7JWOyEw4ddrTwxWAKUr3grmdAiKVw7
 GWjQ6C7MkW8YZYcXN39l2E1cWuLIQnoJkYmORRJp7eWCBwkJKcoXzs+PmgeTyE+pXBLU
 aG1d51PbsZEKMUB3H/e7dLI2xSgV8bgmB1jvLVLbIhn9qaJl8QEbHwVACTBejtCdtM0v
 6xqXG2FnHAAgE671NQJx2ElfdheX1Gzh0NT67meKI/W6X9Z9TytDRj/MNCfcwmzSABdc
 PPiH01A88ITC3kjCyiLrtDI0xVDprYxkRJanqvoVHjconPk8EK/bEBUh2HKW/TgW5q0e
 o7FA==
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGEgdXRpbGl0eSBmdW5jdGlvbiB0byByZW1vdmUgYSBiaXQgb2YgY29kZSBkdXBsaWNhdGlv
biBiZXR3ZWVuCm1lc29uX3ZlbmNfY3Zic19lbmNvZGVyX2F0b21pY19jaGVjaygpIGFuZAptZXNv
bl92ZW5jX2N2YnNfZW5jb2Rlcl9tb2RlX3NldCgpLiBCb3RoIG5lZWQgdG8gbG9vayB1cCB0aGUg
c3RydWN0Cm1lc29uX3ZlbmNfY3ZicyBiYXNlZCBvbiBhIGRybV9kaXNwbGF5X21vZGUuCgpTaWdu
ZWQtb2ZmLWJ5OiBNYXJ0aW4gQmx1bWVuc3RpbmdsIDxtYXJ0aW4uYmx1bWVuc3RpbmdsQGdvb2ds
ZW1haWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYyB8
IDQ0ICsrKysrKysrKysrKystLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRp
b25zKCspLCAyMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVz
b24vbWVzb25fdmVuY19jdmJzLmMgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fdmVuY19j
dmJzLmMKaW5kZXggOWFiMjdhZWNmY2YzLi42YjhhMDc0ZTRmZjQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9tZXNvbi9tZXNvbl92ZW5jX2N2YnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVzb24vbWVzb25fdmVuY19jdmJzLmMKQEAgLTY0LDYgKzY0LDIxIEBAIHN0cnVjdCBtZXNvbl9j
dmJzX21vZGUgbWVzb25fY3Zic19tb2Rlc1tNRVNPTl9DVkJTX01PREVTX0NPVU5UXSA9IHsKIAl9
LAogfTsKIAorc3RhdGljIGNvbnN0IHN0cnVjdCBtZXNvbl9jdmJzX21vZGUgKgorbWVzb25fY3Zi
c19nZXRfbW9kZShjb25zdCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9kZSAqcmVxX21vZGUpCit7CisJ
aW50IGk7CisKKwlmb3IgKGkgPSAwOyBpIDwgTUVTT05fQ1ZCU19NT0RFU19DT1VOVDsgKytpKSB7
CisJCXN0cnVjdCBtZXNvbl9jdmJzX21vZGUgKm1lc29uX21vZGUgPSAmbWVzb25fY3Zic19tb2Rl
c1tpXTsKKworCQlpZiAoZHJtX21vZGVfZXF1YWwocmVxX21vZGUsICZtZXNvbl9tb2RlLT5tb2Rl
KSkKKwkJCXJldHVybiBtZXNvbl9tb2RlOworCX0KKworCXJldHVybiBOVUxMOworfQorCiAvKiBD
b25uZWN0b3IgKi8KIAogc3RhdGljIHZvaWQgbWVzb25fY3Zic19jb25uZWN0b3JfZGVzdHJveShz
dHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQpAQCAtMTM2LDE0ICsxNTEsOCBAQCBzdGF0
aWMgaW50IG1lc29uX3ZlbmNfY3Zic19lbmNvZGVyX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2Vu
Y29kZXIgKmVuY29kZXIsCiAJCQkJCXN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwK
IAkJCQkJc3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpCiB7Ci0JaW50IGk7
Ci0KLQlmb3IgKGkgPSAwOyBpIDwgTUVTT05fQ1ZCU19NT0RFU19DT1VOVDsgKytpKSB7Ci0JCXN0
cnVjdCBtZXNvbl9jdmJzX21vZGUgKm1lc29uX21vZGUgPSAmbWVzb25fY3Zic19tb2Rlc1tpXTsK
LQotCQlpZiAoZHJtX21vZGVfZXF1YWwoJmNydGNfc3RhdGUtPm1vZGUsICZtZXNvbl9tb2RlLT5t
b2RlKSkKLQkJCXJldHVybiAwOwotCX0KKwlpZiAobWVzb25fY3Zic19nZXRfbW9kZSgmY3J0Y19z
dGF0ZS0+bW9kZSkpCisJCXJldHVybiAwOwogCiAJcmV0dXJuIC1FSU5WQUw7CiB9CkBAIC0xOTEs
MjQgKzIwMCwxNyBAQCBzdGF0aWMgdm9pZCBtZXNvbl92ZW5jX2N2YnNfZW5jb2Rlcl9tb2RlX3Nl
dChzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIsCiAJCQkJICAgc3RydWN0IGRybV9kaXNwbGF5
X21vZGUgKm1vZGUsCiAJCQkJICAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKmFkanVzdGVkX21v
ZGUpCiB7CisJY29uc3Qgc3RydWN0IG1lc29uX2N2YnNfbW9kZSAqbWVzb25fbW9kZSA9IG1lc29u
X2N2YnNfZ2V0X21vZGUobW9kZSk7CiAJc3RydWN0IG1lc29uX3ZlbmNfY3ZicyAqbWVzb25fdmVu
Y19jdmJzID0KIAkJCQkJZW5jb2Rlcl90b19tZXNvbl92ZW5jX2N2YnMoZW5jb2Rlcik7CiAJc3Ry
dWN0IG1lc29uX2RybSAqcHJpdiA9IG1lc29uX3ZlbmNfY3Zicy0+cHJpdjsKLQlpbnQgaTsKIAot
CWZvciAoaSA9IDA7IGkgPCBNRVNPTl9DVkJTX01PREVTX0NPVU5UOyArK2kpIHsKLQkJc3RydWN0
IG1lc29uX2N2YnNfbW9kZSAqbWVzb25fbW9kZSA9ICZtZXNvbl9jdmJzX21vZGVzW2ldOworCWlm
IChtZXNvbl9tb2RlKSB7CisJCW1lc29uX3ZlbmNpX2N2YnNfbW9kZV9zZXQocHJpdiwgbWVzb25f
bW9kZS0+ZW5jaSk7CiAKLQkJaWYgKGRybV9tb2RlX2VxdWFsKG1vZGUsICZtZXNvbl9tb2RlLT5t
b2RlKSkgewotCQkJbWVzb25fdmVuY2lfY3Zic19tb2RlX3NldChwcml2LAotCQkJCQkJICBtZXNv
bl9tb2RlLT5lbmNpKTsKLQotCQkJLyogU2V0dXAgMjdNSHogdmNsazIgZm9yIEVOQ0kgYW5kIFZE
QUMgKi8KLQkJCW1lc29uX3ZjbGtfc2V0dXAocHJpdiwgTUVTT05fVkNMS19UQVJHRVRfQ1ZCUywK
LQkJCQkJIE1FU09OX1ZDTEtfQ1ZCUywgTUVTT05fVkNMS19DVkJTLAotCQkJCQkgTUVTT05fVkNM
S19DVkJTLCB0cnVlKTsKLQkJCWJyZWFrOwotCQl9CisJCS8qIFNldHVwIDI3TUh6IHZjbGsyIGZv
ciBFTkNJIGFuZCBWREFDICovCisJCW1lc29uX3ZjbGtfc2V0dXAocHJpdiwgTUVTT05fVkNMS19U
QVJHRVRfQ1ZCUywgTUVTT05fVkNMS19DVkJTLAorCQkJCSBNRVNPTl9WQ0xLX0NWQlMsIE1FU09O
X1ZDTEtfQ1ZCUywgdHJ1ZSk7CiAJfQogfQogCi0tIAoyLjI0LjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
