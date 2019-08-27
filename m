Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6539E507
	for <lists+dri-devel@lfdr.de>; Tue, 27 Aug 2019 11:58:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B356589650;
	Tue, 27 Aug 2019 09:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E475989650
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 09:58:31 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id q12so18103873wrj.12
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Aug 2019 02:58:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wbdxbxYZcKVLdPE0Y/8WQgSXBgDUmbVqM2Rjtf0OVOI=;
 b=h1bET27gfTAxqMVJjp51O9g1pr6Ejt/xDb2EsjBqQ+ECIFazeq3JbU1F/zkrRW3ehF
 Qvf2SEQZWuR7X4FMRdlP2Ao/nICTU6uHJaE+F1Q8+8zoi8+TpTn7Yy+6gk5WgRYUxOxC
 WFt7eSWU1bqA0RIQKBnxhqJEuUYx+2ACVq46OdKySKjLKye/yL8pztE3Tl4Kutz5rEc5
 WkoeXG0zHH+LEshHA0R88RPFQallev7ncKmXjTM0pMlodcXSJZvpIK4QPI/iWOHsZIBD
 QwLqTNhf95AYw1cxiA1KrtxaPctFtpFmXOJoFue7oSZOOI/7EfUumfTkBMrbucGGxcWa
 OLSw==
X-Gm-Message-State: APjAAAU51Vp4uZE1o4znLUWMwYLgT0MuTcp5CnMH/cO6fdR7X9D5zoVE
 46S4vqrUoTTsoXhauYdi0WiVBqmYQ1JYJg==
X-Google-Smtp-Source: APXvYqzlJBCTaG+pE4o2jLBqQI6zVkgZsqDDyXOyYdI2n3XJFdcBqkqNW7xzsAxTdeooMlTarCQ78Q==
X-Received: by 2002:a5d:5112:: with SMTP id s18mr2484026wrt.34.1566899910193; 
 Tue, 27 Aug 2019 02:58:30 -0700 (PDT)
Received: from bender.baylibre.local
 (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id m6sm10862084wrq.95.2019.08.27.02.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 02:58:29 -0700 (PDT)
From: Neil Armstrong <narmstrong@baylibre.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/meson: add resume/suspend hooks
Date: Tue, 27 Aug 2019 11:58:25 +0200
Message-Id: <20190827095825.21015-3-narmstrong@baylibre.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190827095825.21015-1-narmstrong@baylibre.com>
References: <20190827095825.21015-1-narmstrong@baylibre.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wbdxbxYZcKVLdPE0Y/8WQgSXBgDUmbVqM2Rjtf0OVOI=;
 b=mOB8HFsHRuuCRYt9Kp+g2Vrx/KvyTnWXGglzhl804o2JfqJ/QDMeTgZoO+Ued+xtAJ
 TsIhTzlWDYZdbIWQcdYRQomzPGGDcnNvhXxY5ncQKWOpnCKWoaRWuZ8Vg/I7othlgGnc
 8UMoMLp1R1rWbJ9ya7spTIgvhPMIs0kwWyOxJYppM3Hc2stPXW/gJiRVeOGl9ICcfVOr
 JnOpENKyJyp37NeDesmyZP6FSvgqpY+YBz/ld3SmFp0pMHPad2BWgChIlhkMP3+ugTgm
 VyxwniLooNR/upSBilO/t4y9/bdbW2v+nwtyLjrOKOBljWrmUnAuJRfc+sCrxF07LpAq
 VulA==
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
Cc: khilman@baylibre.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHRoZSBzdXNwZW5kIGFuZCByZXN1bWUgaG9va3MgdG86Ci0gc2F2ZSBhbmQgZGlzYWJsZSB0
aGUgZW50aXJlIERSTSBkcml2ZXIgb24gc3VzcGVuZAotIHJlLWluaXQgdGhlIGVudGlyZSBWUFUg
c3Vic3lzdGVtIG9uIHJlc3VtZSwgdG8gcmVjb3ZlciBDUlRDIGFuZCBwaXhlbApnZW5lcmF0b3Ig
ZnVuY3Rpb25uYWwgdXNhZ2UgYWZ0ZXIgRERSIHN1c3BlbmQsIHRoZW4gcmVjb3ZlciBEUk0gZHJp
dmVyCnN0YXRlCgpTaWduZWQtb2ZmLWJ5OiBOZWlsIEFybXN0cm9uZyA8bmFybXN0cm9uZ0BiYXls
aWJyZS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21lc29uL21lc29uX2Rydi5jIHwgMzIgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlv
bnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKaW5kZXggMjMxMGM5NmZmZjQ2Li5kYzU3
M2ZmZDFmNGMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZXNvbi9tZXNvbl9kcnYuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbWVzb24vbWVzb25fZHJ2LmMKQEAgLTM2MSw2ICszNjEsMzMg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBjb21wb25lbnRfbWFzdGVyX29wcyBtZXNvbl9kcnZfbWFz
dGVyX29wcyA9IHsKIAkudW5iaW5kCT0gbWVzb25fZHJ2X3VuYmluZCwKIH07CiAKK3N0YXRpYyBp
bnQgX19tYXliZV91bnVzZWQgbWVzb25fZHJ2X3BtX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2
KQoreworCXN0cnVjdCBtZXNvbl9kcm0gKnByaXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwor
CWlmICghcHJpdikKKwkJcmV0dXJuIDA7CisKKwlyZXR1cm4gZHJtX21vZGVfY29uZmlnX2hlbHBl
cl9zdXNwZW5kKHByaXYtPmRybSk7Cit9CisKK3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgbWVz
b25fZHJ2X3BtX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCit7CisJc3RydWN0IG1lc29uX2Ry
bSAqcHJpdiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOworCisJaWYgKCFwcml2KQorCQlyZXR1cm4g
MDsKKworCW1lc29uX3ZwdV9pbml0KHByaXYpOworCW1lc29uX3ZlbmNfaW5pdChwcml2KTsKKwlt
ZXNvbl92cHBfaW5pdChwcml2KTsKKwltZXNvbl92aXVfaW5pdChwcml2KTsKKworCWRybV9tb2Rl
X2NvbmZpZ19oZWxwZXJfcmVzdW1lKHByaXYtPmRybSk7CisKKwlyZXR1cm4gMDsKK30KKwogc3Rh
dGljIGludCBjb21wYXJlX29mKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKIHsKIAlE
Uk1fREVCVUdfRFJJVkVSKCJDb21wYXJpbmcgb2Ygbm9kZSAlcE9GIHdpdGggJXBPRlxuIiwKQEAg
LTQ1MiwxMSArNDc5LDE2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIGR0X21h
dGNoW10gPSB7CiB9OwogTU9EVUxFX0RFVklDRV9UQUJMRShvZiwgZHRfbWF0Y2gpOwogCitzdGF0
aWMgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgbWVzb25fZHJ2X3BtX29wcyA9IHsKKwlTRVRfU1lT
VEVNX1NMRUVQX1BNX09QUyhtZXNvbl9kcnZfcG1fc3VzcGVuZCwgbWVzb25fZHJ2X3BtX3Jlc3Vt
ZSkKK307CisKIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIG1lc29uX2RybV9wbGF0Zm9y
bV9kcml2ZXIgPSB7CiAJLnByb2JlICAgICAgPSBtZXNvbl9kcnZfcHJvYmUsCiAJLmRyaXZlciAg
ICAgPSB7CiAJCS5uYW1lCT0gIm1lc29uLWRybSIsCiAJCS5vZl9tYXRjaF90YWJsZSA9IGR0X21h
dGNoLAorCQkucG0gPSAmbWVzb25fZHJ2X3BtX29wcywKIAl9LAogfTsKIAotLSAKMi4yMi4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
