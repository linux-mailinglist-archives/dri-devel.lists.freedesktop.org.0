Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C39434B2CE
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jun 2019 09:11:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 212466E2DF;
	Wed, 19 Jun 2019 07:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87AC6E29B
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jun 2019 05:27:47 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id w10so4326036pgj.7
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 22:27:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f3azL3W8aECugncjqHtY+kqD7WaDuHbuCaFEu1OGnwg=;
 b=ThqGHofDaHM023XpDNi6HUBzCbrkh8zBHfbnf61b4yZ5/09BN5fiaQ+VqS4vpMhgIP
 2YiHZxALmdqsG0oBDg2U+N82nnLWu3+ahUGdg+yj33LOoe7oAeSUHmfk+3HxgnlbV0md
 2QeLj1KmS/i0SsvQrRNiU+pazWqRIaI+DfUrpkrG+lcNDzn/oMDTAp9A5vZUBxa0uwVT
 2Yi73PHjMg45ne/Rx/4cQw+6kXVvEUJo1eDF5C4AyI/9XxZWyTmfhPBdnEUHRlqcIoUY
 JOc1s86Afe7AmengV7xTFgNljcLs+X1P4RokR88wijeQdkSqyQPjJVPii+KHknbvuLdn
 F0yQ==
X-Gm-Message-State: APjAAAUdAQWzWxAylBf6U97NxuppZjC43dGIYARwjLELk6qQlQT1zDv+
 oBSVHISPe6i78HitD7t4nZef1tFMT44=
X-Google-Smtp-Source: APXvYqx+sbfkzIncexlHUWyP7+glgUeMN/W5Y4ZeR5hh8JjKLRcsO98Xx24AQBU5yL9J91D7Uo6q4A==
X-Received: by 2002:a63:87c8:: with SMTP id i191mr6137310pge.131.1560922066899; 
 Tue, 18 Jun 2019 22:27:46 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id l44sm534742pje.29.2019.06.18.22.27.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 22:27:46 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 10/15] drm/bridge: tc358767: Introduce tc_set_syspllparam()
Date: Tue, 18 Jun 2019 22:27:11 -0700
Message-Id: <20190619052716.16831-11-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190619052716.16831-1-andrew.smirnov@gmail.com>
References: <20190619052716.16831-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 19 Jun 2019 07:10:14 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f3azL3W8aECugncjqHtY+kqD7WaDuHbuCaFEu1OGnwg=;
 b=qOV1Py2zpsvamHrouGGaPf4EIv82LZbwIl9ntHtz6B7ZpmdkfN2mhOyx2LOFvnzdS+
 KrcUBGMLmQsV/gDqw4Day24vGjCx+1n8H1G/IuGZv1l9ViFAyhUjwjVPIf7Tb//A6ayH
 ef3Yr4HVz9e/IpwL4DZEy4kJxrPIBlzvFCDbnIe2Q1bu8VzUUhimAeFSeC3SzmfBmLMN
 6eUNz6llh8HhzRVSuuJ/i1cya//sWgJy+0AVsOwkb23ztlK/itxmH+40qaMBbU0YTmNq
 F7Gjm+CNLzlz3cu53oyNJ02v/tUhlsryaRPrOa87Qxg2lhIxVFf4JNURiAl16AmxNRJw
 e1ow==
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

TW92ZSBjb21tb24gY29kZSBjb252ZXJ0aW5nIGNsb2NrIHJhdGUgdG8gYW4gYXBwcm9wcmlhdGUg
Y29uc3RhbnQgYW5kCmNvbmZpZ3VyaW5nIFNZU19QTExQQVJBTSByZWdpc3RlciBpbnRvIGEgc2Vw
YXJhdGUgcm91dGluZSBhbmQgY29udmVydAp0aGUgcmVzdCBvZiB0aGUgY29kZSB0byB1c2UgaXQu
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNt
aXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KUmV2aWV3ZWQtYnk6IEFu
ZHJ6ZWogSGFqZGEgPGEuaGFqZGFAc2Ftc3VuZy5jb20+CkNjOiBBbmRyemVqIEhhamRhIDxhLmhh
amRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNv
bT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+
CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogQ2hyaXMgSGVh
bHkgPGNwaGVhbHlAZ21haWwuY29tPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVy
bz4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwot
LS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDQ2ICsrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzMCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggYjAxYzFjODM0MWUx
Li43YTNhMWIyZDVjNTYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3
NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTU2NSwzNSAr
NTY1LDQwIEBAIHN0YXRpYyBpbnQgdGNfc3RyZWFtX2Nsb2NrX2NhbGMoc3RydWN0IHRjX2RhdGEg
KnRjKQogCXJldHVybiByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgRFAwX1ZJRE1OR0VOMSwgMzI3
NjgpOwogfQogCi1zdGF0aWMgaW50IHRjX2F1eF9saW5rX3NldHVwKHN0cnVjdCB0Y19kYXRhICp0
YykKK3N0YXRpYyBpbnQgdGNfc2V0X3N5c3BsbHBhcmFtKHN0cnVjdCB0Y19kYXRhICp0YykKIHsK
IAl1bnNpZ25lZCBsb25nIHJhdGU7Ci0JdTMyIGRwMF9hdXhjZmcxOwotCXUzMiB2YWx1ZTsKLQlp
bnQgcmV0OworCXUzMiBwbGxwYXJhbSA9IFNZU0NMS19TRUxfTFNDTEsgfCBMU0NMS19ESVZfMjsK
IAogCXJhdGUgPSBjbGtfZ2V0X3JhdGUodGMtPnJlZmNsayk7CiAJc3dpdGNoIChyYXRlKSB7CiAJ
Y2FzZSAzODQwMDAwMDoKLQkJdmFsdWUgPSBSRUZfRlJFUV8zOE00OworCQlwbGxwYXJhbSB8PSBS
RUZfRlJFUV8zOE00OwogCQlicmVhazsKIAljYXNlIDI2MDAwMDAwOgotCQl2YWx1ZSA9IFJFRl9G
UkVRXzI2TTsKKwkJcGxscGFyYW0gfD0gUkVGX0ZSRVFfMjZNOwogCQlicmVhazsKIAljYXNlIDE5
MjAwMDAwOgotCQl2YWx1ZSA9IFJFRl9GUkVRXzE5TTI7CisJCXBsbHBhcmFtIHw9IFJFRl9GUkVR
XzE5TTI7CiAJCWJyZWFrOwogCWNhc2UgMTMwMDAwMDA6Ci0JCXZhbHVlID0gUkVGX0ZSRVFfMTNN
OworCQlwbGxwYXJhbSB8PSBSRUZfRlJFUV8xM007CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWRl
dl9lcnIodGMtPmRldiwgIkludmFsaWQgcmVmY2xrIHJhdGU6ICVsdSBIelxuIiwgcmF0ZSk7CiAJ
CXJldHVybiAtRUlOVkFMOwogCX0KIAorCXJldHVybiByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwg
U1lTX1BMTFBBUkFNLCBwbGxwYXJhbSk7Cit9CisKK3N0YXRpYyBpbnQgdGNfYXV4X2xpbmtfc2V0
dXAoc3RydWN0IHRjX2RhdGEgKnRjKQoreworCWludCByZXQ7CisJdTMyIGRwMF9hdXhjZmcxOwor
CiAJLyogU2V0dXAgRFAtUEhZIC8gUExMICovCi0JdmFsdWUgfD0gU1lTQ0xLX1NFTF9MU0NMSyB8
IExTQ0xLX0RJVl8yOwotCXJldCA9IHJlZ21hcF93cml0ZSh0Yy0+cmVnbWFwLCBTWVNfUExMUEFS
QU0sIHZhbHVlKTsKKwlyZXQgPSB0Y19zZXRfc3lzcGxscGFyYW0odGMpOwogCWlmIChyZXQpCiAJ
CWdvdG8gZXJyOwogCkBAIC04NTIsNyArODU3LDYgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtf
ZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIHsKIAlzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4ID0g
JnRjLT5hdXg7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gdGMtPmRldjsKLQl1bnNpZ25lZCBpbnQg
cmF0ZTsKIAl1MzIgZHBfcGh5X2N0cmw7CiAJdTMyIHZhbHVlOwogCWludCByZXQ7CkBAIC04ODAs
MjUgKzg4NCw3IEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0
YSAqdGMpCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJhdGUgPSBjbGtfZ2V0X3JhdGUo
dGMtPnJlZmNsayk7Ci0Jc3dpdGNoIChyYXRlKSB7Ci0JY2FzZSAzODQwMDAwMDoKLQkJdmFsdWUg
PSBSRUZfRlJFUV8zOE00OwotCQlicmVhazsKLQljYXNlIDI2MDAwMDAwOgotCQl2YWx1ZSA9IFJF
Rl9GUkVRXzI2TTsKLQkJYnJlYWs7Ci0JY2FzZSAxOTIwMDAwMDoKLQkJdmFsdWUgPSBSRUZfRlJF
UV8xOU0yOwotCQlicmVhazsKLQljYXNlIDEzMDAwMDAwOgotCQl2YWx1ZSA9IFJFRl9GUkVRXzEz
TTsKLQkJYnJlYWs7Ci0JZGVmYXVsdDoKLQkJcmV0dXJuIC1FSU5WQUw7Ci0JfQotCXZhbHVlIHw9
IFNZU0NMS19TRUxfTFNDTEsgfCBMU0NMS19ESVZfMjsKLQlyZXQgPSByZWdtYXBfd3JpdGUodGMt
PnJlZ21hcCwgU1lTX1BMTFBBUkFNLCB2YWx1ZSk7CisJcmV0ID0gdGNfc2V0X3N5c3BsbHBhcmFt
KHRjKTsKIAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
