Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF594337C
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2216089349;
	Thu, 13 Jun 2019 07:28:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35118892D8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:25 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id 81so9204574pfy.13
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aOBTu7k51hnvRTEMXk6cCC9yyhEc8M5AYxFi2UI0Je8=;
 b=hl4JSbsKhLAjuJiCCAYueW+iaCfW80Y/ICPQJ78wx/3Yzzj9W2pp1wsi2w+6pBothr
 lYOgjwGbF1FH9h2i0UprqGXE8LE1CHzjIyJMCFICae3ZtQE1cj3tbZMo/8oZB6CmDmpR
 4E21vSl0Eh+k6zuxeC1gUTUJPIgDuN4DEZOfmpJIm5AsDXotkV1yULScXzyjIt5QbUus
 Y6A0c2GVHYg9pgyVTnNzB4TJYwnM9c/YnCuuAPVh78d27xr0J3AJt/q/aoxkefel1ZAY
 f1NnhfpfnxQwQ1vaUhnmUnFy6JKdRUaqlssnV8m5KLCZ3yJU2tVn/KZlGJzt6sBuzoem
 k32w==
X-Gm-Message-State: APjAAAW9Zy+fE5DiwxDkT7gRlp9K6+3SV6b4eSpJF0MxMKQDVQ7eh4j3
 LUSf2uysFFkDfuGKuV14iOX7i0HpBR8=
X-Google-Smtp-Source: APXvYqzZJzylRZUgkeSpqZ4nCtyIo+PFX8dLpdiI8fU2VojR5nFA4Pbmsr3qXOqRU6y5RaCc7AR2zA==
X-Received: by 2002:a17:90a:fa12:: with SMTP id
 cm18mr31456486pjb.137.1560328404386; 
 Wed, 12 Jun 2019 01:33:24 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:23 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 12/15] drm/bridge: tc358767: Introduce tc_pllupdate()
Date: Wed, 12 Jun 2019 01:32:49 -0700
Message-Id: <20190612083252.15321-13-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aOBTu7k51hnvRTEMXk6cCC9yyhEc8M5AYxFi2UI0Je8=;
 b=TlNjNQLy5QEdEHGKMdc8GdhkvesgOfZhS5ONJuqYpL7KCBCyteAmvuUrcB9UEtxd4o
 QC9pXUidu0IdG7ecWazNCiVAhbmJqkT4S9y7qF2Wyj3GAmENKPSzWsSO9yI4zf8Bkxh4
 rk+nbaiyLBxwwn21hP6584o5mBoHZknXcsVNgKXQJqSPBteiAZtqt/bYJa6zvMjUiD+x
 pvE4Vc1TvZedrcpX7EnHEuW4BXxbrQkEbuL/+Mreo6sN5A+YE1wPZdn3AhcHxHlkjd11
 EXOK61SNHayGsssRUAtcB5nbyx0lOiEaQcR3kp4U8tjc6oaaVqhzeE2igAfiRtVvBWsI
 RJUg==
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
NzY3LmMKaW5kZXggYWM1NWI1OTI0OWUzLi4yOGRmNTNmN2MzNDkgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3RjMzU4NzY3LmMKQEAgLTQ0MywxMCArNDQzLDE4IEBAIHN0YXRpYyB1MzIgdGNfc3JjY3RybChz
dHJ1Y3QgdGNfZGF0YSAqdGMpCiAJcmV0dXJuIHJlZzsKIH0KIAotc3RhdGljIHZvaWQgdGNfd2Fp
dF9wbGxfbG9jayhzdHJ1Y3QgdGNfZGF0YSAqdGMpCitzdGF0aWMgaW50IHRjX3BsbHVwZGF0ZShz
dHJ1Y3QgdGNfZGF0YSAqdGMsIHVuc2lnbmVkIGludCBwbGxjdHJsKQogeworCWludCByZXQ7CisK
KwlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgcGxsY3RybCwgUExMVVBEQVRFIHwgUExM
RU4pOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAkvKiBXYWl0IGZvciBQTEwgdG8gbG9j
azogdXAgdG8gMi4wOSBtcywgZGVwZW5kaW5nIG9uIHJlZmNsayAqLwogCXVzbGVlcF9yYW5nZSgz
MDAwLCA2MDAwKTsKKworCXJldHVybiAwOwogfQogCiBzdGF0aWMgaW50IHRjX3B4bF9wbGxfZW4o
c3RydWN0IHRjX2RhdGEgKnRjLCB1MzIgcmVmY2xrLCB1MzIgcGl4ZWxjbG9jaykKQEAgLTU0Niwx
MyArNTU0LDcgQEAgc3RhdGljIGludCB0Y19weGxfcGxsX2VuKHN0cnVjdCB0Y19kYXRhICp0Yywg
dTMyIHJlZmNsaywgdTMyIHBpeGVsY2xvY2spCiAJCXJldHVybiByZXQ7CiAKIAkvKiBGb3JjZSBQ
TEwgcGFyYW1ldGVyIHVwZGF0ZSBhbmQgZGlzYWJsZSBieXBhc3MgKi8KLQlyZXQgPSByZWdtYXBf
d3JpdGUodGMtPnJlZ21hcCwgUFhMX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsKLQlpZiAo
cmV0KQotCQlyZXR1cm4gcmV0OwotCi0JdGNfd2FpdF9wbGxfbG9jayh0Yyk7Ci0KLQlyZXR1cm4g
MDsKKwlyZXR1cm4gdGNfcGxsdXBkYXRlKHRjLCBQWExfUExMQ1RSTCk7CiB9CiAKIHN0YXRpYyBp
bnQgdGNfcHhsX3BsbF9kaXMoc3RydWN0IHRjX2RhdGEgKnRjKQpAQCAtNjI2LDE1ICs2MjgsMTMg
QEAgc3RhdGljIGludCB0Y19hdXhfbGlua19zZXR1cChzdHJ1Y3QgdGNfZGF0YSAqdGMpCiAJICog
SW5pdGlhbGx5IFBMTHMgYXJlIGluIGJ5cGFzcy4gRm9yY2UgUExMIHBhcmFtZXRlciB1cGRhdGUs
CiAJICogZGlzYWJsZSBQTEwgYnlwYXNzLCBlbmFibGUgUExMCiAJICovCi0JcmV0ID0gcmVnbWFw
X3dyaXRlKHRjLT5yZWdtYXAsIERQMF9QTExDVFJMLCBQTExVUERBVEUgfCBQTExFTik7CisJcmV0
ID0gdGNfcGxsdXBkYXRlKHRjLCBEUDBfUExMQ1RSTCk7CiAJaWYgKHJldCkKIAkJZ290byBlcnI7
Ci0JdGNfd2FpdF9wbGxfbG9jayh0Yyk7CiAKLQlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21h
cCwgRFAxX1BMTENUUkwsIFBMTFVQREFURSB8IFBMTEVOKTsKKwlyZXQgPSB0Y19wbGx1cGRhdGUo
dGMsIERQMV9QTExDVFJMKTsKIAlpZiAocmV0KQogCQlnb3RvIGVycjsKLQl0Y193YWl0X3BsbF9s
b2NrKHRjKTsKIAogCXJldCA9IHRjX3BvbGxfdGltZW91dCh0YywgRFBfUEhZX0NUUkwsIFBIWV9S
RFksIFBIWV9SRFksIDEsIDEwMDApOwogCWlmIChyZXQgPT0gLUVUSU1FRE9VVCkgewpAQCAtOTE0
LDE1ICs5MTQsMTMgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfZW5hYmxlKHN0cnVjdCB0Y19k
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
