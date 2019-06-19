Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB2BF4B2DE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:12:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C1B76E2ED;
	Wed, 19 Jun 2019 07:11:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12B66E297
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:49 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id i189so9009752pfg.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2kXCoWmoCY207aDmCFQDxyIujl2m7dcDq7H8SnON7e4=;
 b=WKe5HH5k2CI8HxPR22LEkA7S47HxeTFBpoWQL5XcK4YX0e1vvwn6a9XriGqtpdTCNc
 esWIQmwAbySf8TCkcV3rJoaMm1U7KFdN7vIAiM8Xf/kkt/4AVqCvTuDP1w9QQNX1Wpsn
 akcj6gfLflioQWE5DO5kZL5y0pi//JrnvxMhEMcjnfLZfENOmRlAr79eKmlThL0wX5u2
 p8EbFuV/VpHjbvWXfiPkoft8E4N4qlGW2ghm9/INaaKseUNS9GK8XxDJXNMeSqRMfoWL
 kdRv2+kw6lqZB2NwJWvq3pMJ32R86C4RbUbesDGhXeAMAPkgRCA1XjMNKM/Lb73IcDPW
 mFRw==
X-Gm-Message-State: APjAAAUPkoQ/V1V343xYnsuygDrnK1Jn1ahASFzdBek45j8YaxE5MEMj
 FDI5gDQSbdNrWrAruXxHECCx/yDcM5M=
X-Google-Smtp-Source: APXvYqzv/yWhDaxL8rWnII5Ehvq1KgetBRjY6FMrs+08Ke20kaoBAQO2LHzabZc+U7Hn5q3xJ8HtxA==
X-Received: by 2002:a63:50a:: with SMTP id 10mr6216801pgf.213.1560922068920;
 Tue, 18 Jun 2019 22:27:48 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.46
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:48 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 11/15] drm/bridge: tc358767: Introduce tc_pllupdate()
Date: Tue, 18 Jun 2019 22:27:12 -0700
Message-Id: <20190619052716.16831-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2kXCoWmoCY207aDmCFQDxyIujl2m7dcDq7H8SnON7e4=;
 b=pHQ+VzdXbpAkLrUC+kwkOLaeJYEz/P+MbIwRa1KSxgDw7C746OEaPUsSczK5yb4eEC
 dbSt+vxH7YZKjM/BBOJrN54PcQOZlvVbS8QBg5QY3hGGSB3tNn+N0CyvcZrlQVmds1RI
 lQnqw4ZT20f620zRXE6ZgBhrjcAKoBbGyZpIL+z6qZ8WLuKnBogKFQQslLW7P5xTDYh+
 qF4Zg3z9EnYK3NSCSq9YITWLl9oPXqQyMf46JBgMIpgh6cyUoxYiUlOGUWboQlFV8erk
 nNXCud44yZzTivpcqR6l5cbihE0wFOUBpIxRlHfMCJfM+OozI085FkUFdZ+XMOf82Clq
 aEpw==
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
Cc: Cory Tusar <cory.tusar@zii.aero>, Andrey Smirnov <andrew.smirnov@gmail.com>,
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
IHNpbmdsZSBoZWxwZXIgZnVuY3Rpb24KdGNfcGxsdXBkYXRlKCkgYW5kIGNvbnZlcnQgdGhlIHJl
c3Qgb2YgdGhlIGNvZGUgdG8gdXNlIGl0LiBObwpmdW5jdGlvbmFsIGNoYW5nZSBpbnRlbmRlZC4K
ClNpZ25lZC1vZmYtYnk6IEFuZHJleSBTbWlybm92IDxhbmRyZXcuc21pcm5vdkBnbWFpbC5jb20+
ClJldmlld2VkLWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+ClJldmlld2VkLWJ5OiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29t
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
NzY3LmMKaW5kZXggN2EzYTFiMmQ1YzU2Li5mZTY3MmY2YmJhNzMgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMKQEAgLTQyNywxMCArNDI3LDE4IEBAIHN0YXRpYyB1MzIgdGNfc3JjY3RybChz
dHJ1Y3QgdGNfZGF0YSAqdGMpCiAJcmV0dXJuIHJlZzsKIH0KIAotc3RhdGljIHZvaWQgdGNfd2Fp
dF9wbGxfbG9jayhzdHJ1Y3QgdGNfZGF0YSAqdGMpCitzdGF0aWMgaW50IHRjX3BsbHVwZGF0ZShz
dHJ1Y3QgdGNfZGF0YSAqdGMsIHVuc2lnbmVkIGludCBwbGxjdHJsKQogeworCWludCByZXQ7CisK
KwlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgcGxsY3RybCwgUExMVVBEQVRFIHwgUExM
RU4pOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAkvKiBXYWl0IGZvciBQTEwgdG8gbG9j
azogdXAgdG8gMi4wOSBtcywgZGVwZW5kaW5nIG9uIHJlZmNsayAqLwogCXVzbGVlcF9yYW5nZSgz
MDAwLCA2MDAwKTsKKworCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IHRjX3B4bF9wbGxfZW4o
c3RydWN0IHRjX2RhdGEgKnRjLCB1MzIgcmVmY2xrLCB1MzIgcGl4ZWxjbG9jaykKQEAgLTUzMCwx
MyArNTM4LDcgQEAgc3RhdGljIGludCB0Y19weGxfcGxsX2VuKHN0cnVjdCB0Y19kYXRhICp0Yywg
dTMyIHJlZmNsaywgdTMyIHBpeGVsY2xvY2spCiAJCXJldHVybiByZXQ7CiAKIAkvKiBGb3JjZSBQ
TEwgcGFyYW1ldGVyIHVwZGF0ZSBhbmQgZGlzYWJsZSBieXBhc3MgKi8KLQlyZXQgPSByZWdtYXBf
d3JpdGUodGMtPnJlZ21hcCwgUFhMX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsKLQlpZiAo
cmV0KQotCQlyZXR1cm4gcmV0OwotCi0JdGNfd2FpdF9wbGxfbG9jayh0Yyk7Ci0KLQlyZXR1cm4g
MDsKKwlyZXR1cm4gdGNfcGxsdXBkYXRlKHRjLCBQWExfUExMQ1RSTCk7CiB9CiAKIHN0YXRpYyBp
bnQgdGNfcHhsX3BsbF9kaXMoc3RydWN0IHRjX2RhdGEgKnRjKQpAQCAtNjEwLDE1ICs2MTIsMTMg
QEAgc3RhdGljIGludCB0Y19hdXhfbGlua19zZXR1cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJICog
SW5pdGlhbGx5IFBMTHMgYXJlIGluIGJ5cGFzcy4gRm9yY2UgUExMIHBhcmFtZXRlciB1cGRhdGUs
CiAJICogZGlzYWJsZSBQTEwgYnlwYXNzLCBlbmFibGUgUExMCiAJICovCi0JcmV0ID0gcmVnbWFw
X3dyaXRlKHRjLT5yZWdtYXAsIERQMF9QTExDVFJMLCBQTExVUERBVEUgfCBQTExFTik7CisJcmV0
ID0gdGNfcGxsdXBkYXRlKHRjLCBEUDBfUExMQ1RSTCk7CiAJaWYgKHJldCkKIAkJZ290byBlcnI7
Ci0JdGNfd2FpdF9wbGxfbG9jayh0Yyk7CiAKLQlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21h
cCwgRFAxX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsKKwlyZXQgPSB0Y19wbGx1cGRhdGUo
dGMsIERQMV9QTExDVFJMKTsKIAlpZiAocmV0KQogCQlnb3RvIGVycjsKLQl0Y193YWl0X3BsbF9s
b2NrKHRjKTsKIAogCXJldCA9IHRjX3BvbGxfdGltZW91dCh0YywgRFBfUEhZX0NUUkwsIFBIWV9S
RFksIFBIWV9SRFksIDEsIDEwMDApOwogCWlmIChyZXQgPT0gLUVUSU1FRE9VVCkgewpAQCAtODk4
LDE1ICs4OTgsMTMgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfZW5hYmxlKHN0cnVjdCB0Y19k
YXRhICp0YykKIAkJcmV0dXJuIHJldDsKIAogCS8qIFBMTCBzZXR1cCAqLwotCXJldCA9IHJlZ21h
cF93cml0ZSh0Yy0+cmVnbWFwLCBEUDBfUExMQ1RSTCwgUExMVVBEQVRFIHwgUExMRU4pOworCXJl
dCA9IHRjX3BsbHVwZGF0ZSh0YywgRFAwX1BMTENUUkwpOwogCWlmIChyZXQpCiAJCXJldHVybiBy
ZXQ7Ci0JdGNfd2FpdF9wbGxfbG9jayh0Yyk7CiAKLQlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJl
Z21hcCwgRFAxX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsKKwlyZXQgPSB0Y19wbGx1cGRh
dGUodGMsIERQMV9QTExDVFJMKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwotCXRjX3dhaXRf
cGxsX2xvY2sodGMpOwogCiAJLyogUmVzZXQvRW5hYmxlIE1haW4gTGlua3MgKi8KIAlkcF9waHlf
Y3RybCB8PSBEUF9QSFlfUlNUIHwgUEhZX00xX1JTVCB8IFBIWV9NMF9SU1Q7Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
