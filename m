Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A693E357D5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 555988961E;
	Wed,  5 Jun 2019 07:33:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D1B389165
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:42 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id c85so5506250pfc.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFvuIRi7rsk2TFp/SSh+b+ezX83xyjP/0LBIMVGRR1U=;
 b=tvip/xgQ+5xBVaZjlibyTgY+l9dQat39Ch/zrN6FGtEPe/sxvl8DP5BypfknF2fZye
 HoFWwHIBD5pmEZ3FXaNgiafWP6UTR+XfoZpSjGnYyJkZeQMM7SIVizAaYI4wptDCOtmw
 UbIXdPFpqgLYuUsXNbLraQtAmbG5QTm+gajJHCcBOwuqGO07/uk6Rr0UdZ5H2U8WVEYG
 /lEIhw1jaT/dCc27lLHpnva9gcds0CTCYR2A/uJUwuzq60DKCK0nkDWCXhU4s3WTgjFy
 +pbsXEqT8CIHOxtsNqiNCBChuNJNCFUczxIVwL55E7ffGn7hlFqkeZ4S9dvqpJwTvg2w
 yXsQ==
X-Gm-Message-State: APjAAAUBHTcr3paY3+jT9FmGyzZDnhpBp0e+MutR/MwQykDwoG0B13XX
 6Bg69uvjVYZf88xLcwvUs57pwTljMWc=
X-Google-Smtp-Source: APXvYqyC0jx/q6tG1m6BADcPh6aQ2BVId4Gl6G3bZIAJ8W2OBXOSwnX7Pbxe8TFCZEK2BpS0Tq2X+A==
X-Received: by 2002:a17:90a:b104:: with SMTP id
 z4mr20745515pjq.102.1559718341700; 
 Wed, 05 Jun 2019 00:05:41 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:40 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 12/15] drm/bridge: tc358767: Introduce tc_pllupdate_pllen()
Date: Wed,  5 Jun 2019 00:05:04 -0700
Message-Id: <20190605070507.11417-13-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFvuIRi7rsk2TFp/SSh+b+ezX83xyjP/0LBIMVGRR1U=;
 b=Y8ygajd/pjZ28xsj4PsaLG4FFFLwbaEUuRrDRgc4vDF7ppGFNWbPFagSK4DqAMuUu5
 /J2cc4UsilVprscnxjgKd6fxkcYXAiPUiM56qskqgpo0/aSUZMKmK2EjkM7KVWMoeLot
 TZ7N8EoHd2L6MCi7KCXKnusi7HD+v+8JyjGlNjx4z9GiuL530XkqO9obPthSurPEBvMO
 fl5lhqy+ya6nwz/hAKr4ORU3NRIPUzf9L7f3k4CkPhqR7T4nKNZPr8JYG3Y+cdqEuwjg
 afR5FTISTBTeYhf/UtpUBCTyvseuCopW25sEeLcMON22zcbahZLzTyqTElCzxRG66v2h
 Lobw==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Archit Taneja <architt@codeaurora.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
 linux-kernel@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Chris Healy <cphealy@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dGNfd2FpdF9wbGxfbG9jaygpIGlzIGFsd2F5cyBjYWxsZWQgYXMgYSBmb2xsb3ctdXAgZm9yIHVw
ZGF0aW5nClBMTFVQREFURSBhbmQgUExMRU4gYml0IG9mIGEgZ2l2ZW4gUExMIGNvbnRyb2wgcmVn
aXN0ZXIuIFRvIHNpbXBsaWZ5CnRoaW5ncywgbWVyZ2UgdGhlIHR3byBvcGVyYXRpb24gaW50byBh
IHNpbmdsZSBoZWxwZXIgZnVuY3Rpb24KdGNfcGxsdXBkYXRlX3BsbGVuKCkgYW5kIGNvbnZlcnQg
dGhlIHJlc3Qgb2YgdGhlIGNvZGUgdG8gdXNlIGl0LiBObwpmdW5jdGlvbmFsIGNoYW5nZSBpbnRl
bmRlZC4KClNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92IDxhbmRyZXcuc21pcm5vdkBnbWFp
bC5jb20+ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlk
ZWFzb25ib2FyZC5jb20+CkNjOiBBcmNoaXQgVGFuZWphIDxhcmNoaXR0QGNvZGVhdXJvcmEub3Jn
PgpDYzogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5nLmNvbT4KQ2M6IExhdXJlbnQgUGlu
Y2hhcnQgPExhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IFRvbWkgVmFsa2Vp
bmVuIDx0b21pLnZhbGtlaW5lbkB0aS5jb20+CkNjOiBBbmRyZXkgR3VzYWtvdiA8YW5kcmV5Lmd1
c2Frb3ZAY29nZW50ZW1iZWRkZWQuY29tPgpDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4KQ2M6IENvcnkgVHVzYXIgPGNvcnkudHVzYXJAemlpLmFlcm8+CkNjOiBDaHJp
cyBIZWFseSA8Y3BoZWFseUBnbWFpbC5jb20+CkNjOiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBwZW5n
dXRyb25peC5kZT4KQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGxpbnV4
LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMgfCAzMCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAxNCBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKaW5kZXggYzU4NzE0ZGFhMGExLi5hMDQ0MDFjZjJhOTIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMKQEAgLTQ2MywxMCArNDYzLDE4IEBAIHN0YXRpYyB1MzIgdGNfc3JjY3RybChz
dHJ1Y3QgdGNfZGF0YSAqdGMpCiAJcmV0dXJuIHJlZzsKIH0KIAotc3RhdGljIHZvaWQgdGNfd2Fp
dF9wbGxfbG9jayhzdHJ1Y3QgdGNfZGF0YSAqdGMpCitzdGF0aWMgaW50IHRjX3BsbHVwZGF0ZV9w
bGxlbihzdHJ1Y3QgdGNfZGF0YSAqdGMsIHVuc2lnbmVkIGludCBwbGxjdHJsKQogeworCWludCBy
ZXQ7CisKKwlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgcGxsY3RybCwgUExMVVBEQVRF
IHwgUExMRU4pOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAkvKiBXYWl0IGZvciBQTEwg
dG8gbG9jazogdXAgdG8gMi4wOSBtcywgZGVwZW5kaW5nIG9uIHJlZmNsayAqLwogCXVzbGVlcF9y
YW5nZSgzMDAwLCA2MDAwKTsKKworCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IHRjX3B4bF9w
bGxfZW4oc3RydWN0IHRjX2RhdGEgKnRjLCB1MzIgcmVmY2xrLCB1MzIgcGl4ZWxjbG9jaykKQEAg
LTU2NiwxMyArNTc0LDcgQEAgc3RhdGljIGludCB0Y19weGxfcGxsX2VuKHN0cnVjdCB0Y19kYXRh
ICp0YywgdTMyIHJlZmNsaywgdTMyIHBpeGVsY2xvY2spCiAJCXJldHVybiByZXQ7CiAKIAkvKiBG
b3JjZSBQTEwgcGFyYW1ldGVyIHVwZGF0ZSBhbmQgZGlzYWJsZSBieXBhc3MgKi8KLQlyZXQgPSBy
ZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgUFhMX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsK
LQlpZiAocmV0KQotCQlyZXR1cm4gcmV0OwotCi0JdGNfd2FpdF9wbGxfbG9jayh0Yyk7Ci0KLQly
ZXR1cm4gMDsKKwlyZXR1cm4gdGNfcGxsdXBkYXRlX3BsbGVuKHRjLCBQWExfUExMQ1RSTCk7CiB9
CiAKIHN0YXRpYyBpbnQgdGNfcHhsX3BsbF9kaXMoc3RydWN0IHRjX2RhdGEgKnRjKQpAQCAtNjQ1
LDE1ICs2NDcsMTMgQEAgc3RhdGljIGludCB0Y19hdXhfbGlua19zZXR1cChzdHJ1Y3QgdGNfZGF0
YSAqdGMpCiAJICogSW5pdGlhbGx5IFBMTHMgYXJlIGluIGJ5cGFzcy4gRm9yY2UgUExMIHBhcmFt
ZXRlciB1cGRhdGUsCiAJICogZGlzYWJsZSBQTEwgYnlwYXNzLCBlbmFibGUgUExMCiAJICovCi0J
cmV0ID0gcmVnbWFwX3dyaXRlKHRjLT5yZWdtYXAsIERQMF9QTExDVFJMLCBQTExVUERBVEUgfCBQ
TExFTik7CisJcmV0ID0gdGNfcGxsdXBkYXRlX3BsbGVuKHRjLCBEUDBfUExMQ1RSTCk7CiAJaWYg
KHJldCkKIAkJZ290byBlcnI7Ci0JdGNfd2FpdF9wbGxfbG9jayh0Yyk7CiAKLQlyZXQgPSByZWdt
YXBfd3JpdGUodGMtPnJlZ21hcCwgRFAxX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsKKwly
ZXQgPSB0Y19wbGx1cGRhdGVfcGxsZW4odGMsIERQMV9QTExDVFJMKTsKIAlpZiAocmV0KQogCQln
b3RvIGVycjsKLQl0Y193YWl0X3BsbF9sb2NrKHRjKTsKIAogCXJldCA9IHRjX3BvbGxfdGltZW91
dCh0YywgRFBfUEhZX0NUUkwsIFBIWV9SRFksIFBIWV9SRFksIDEsIDEwMDApOwogCWlmIChyZXQg
PT0gLUVUSU1FRE9VVCkgewpAQCAtOTMzLDE1ICs5MzMsMTMgQEAgc3RhdGljIGludCB0Y19tYWlu
X2xpbmtfZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIAkJcmV0dXJuIHJldDsKIAogCS8qIFBM
TCBzZXR1cCAqLwotCXJldCA9IHJlZ21hcF93cml0ZSh0Yy0+cmVnbWFwLCBEUDBfUExMQ1RSTCwg
UExMVVBEQVRFIHwgUExMRU4pOworCXJldCA9IHRjX3BsbHVwZGF0ZV9wbGxlbih0YywgRFAwX1BM
TENUUkwpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7Ci0JdGNfd2FpdF9wbGxfbG9jayh0Yyk7
CiAKLQlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgRFAxX1BMTENUUkwsIFBMTFVQREFU
RSB8IFBMTEVOKTsKKwlyZXQgPSB0Y19wbGx1cGRhdGVfcGxsZW4odGMsIERQMV9QTExDVFJMKTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwotCXRjX3dhaXRfcGxsX2xvY2sodGMpOwogCiAJLyog
UmVzZXQvRW5hYmxlIE1haW4gTGlua3MgKi8KIAlkcF9waHlfY3RybCB8PSBEUF9QSFlfUlNUIHwg
UEhZX00xX1JTVCB8IFBIWV9NMF9SU1Q7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
