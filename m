Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A40357D2
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846D9895E1;
	Wed,  5 Jun 2019 07:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87EF389165
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:40 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id u22so14299756pfm.3
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wEdoucIRvOwXz8lKtgT8K+SiuGv6C9zcqCSBrAPMFTE=;
 b=EOlfJ1yqUY/iqmTod1oOedPEqhG3QZlbkpeArcpIpBtTbOxax3rp2+vXsDPpImEq83
 6Vy5pfxvCGy87XJwU2aXQYszABZrhhEHIUy4rCfnHJD+zCz0i/9FdLAVJYA47wVer+XX
 VlVxEWcDYz6HR3iS6zyW0w/bZT2nvbHIiBgFPXRcD3VuMT22nQpHCKoLAplle5midx9P
 zmNg9f4/kyC3PdnmxuTO0nArnV0p1pxvqANvTqqYPs0Dox511nqMQOiZCjn4QjG7TX/F
 cVXj3bTofcmCExE+icTCDI2Is+c4Dg47Ji+zTeXYZUlNZMONIyOQVgU/fR6RRnEW1wx2
 KdYg==
X-Gm-Message-State: APjAAAXESgEgh/Cmq+jq+4ybXoXG6F1+EEz3utTydhyqUGU8v10fNVaT
 r4KDes4Pqi4UEq8+kDVj0L6AQ2afw28=
X-Google-Smtp-Source: APXvYqysHjyKNTH4wmvmS0sBKjq4T6J9yXXLxk7wdUG6OpwbwwY5yG4T5uzxamvnGnxUtBrDlp/Fjg==
X-Received: by 2002:a17:90a:d151:: with SMTP id
 t17mr28732792pjw.60.1559718339752; 
 Wed, 05 Jun 2019 00:05:39 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.37
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:39 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 11/15] drm/bridge: tc358767: Introduce tc_set_syspllparam()
Date: Wed,  5 Jun 2019 00:05:03 -0700
Message-Id: <20190605070507.11417-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wEdoucIRvOwXz8lKtgT8K+SiuGv6C9zcqCSBrAPMFTE=;
 b=I5dqH+TzNTJpgyNOOv9015vJ6/TMkO+Gmn883gqBvMlxT+ruw8egkE0RFMPqfHjE5J
 Zlg/pZzS3ilmWxi961+ILbRS/x47rDCdqyx9DwVjIAibiFmMug99/LDJP/cIOvVye6m+
 HqcEfb/OwX/GNSWtkk8qnjnjQdKPi4qXFsGZwothUAkYWWk7M8P7FPrF1ijbcaN+tY4L
 KLk8R+QW8OXw+egbz7OhQcF/o9P1d2+x478Dn9K1iwnCOeFS84p0uP/XdwTFIDuERx96
 GCAgff0Dj+Ruh/xDVSjSUdZE9g7E1jArSLwNUgK2Ahcky0taniezp/8IzqSYNwczZ/5R
 7fwQ==
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

TW92ZSBjb21tb24gY29kZSBjb252ZXJ0aW5nIGNsb2NrIHJhdGUgdG8gYW4gYXBwcm9wcmlhdGUg
Y29uc3RhbnQgYW5kCmNvbmZpZ3VyaW5nIFNZU19QTExQQVJBTSByZWdpc3RlciBpbnRvIGEgc2Vw
YXJhdGUgcm91dGluZSBhbmQgY29udmVydAp0aGUgcmVzdCBvZiB0aGUgY29kZSB0byB1c2UgaXQu
IE5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoKU2lnbmVkLW9mZi1ieTogQW5kcmV5IFNt
aXJub3YgPGFuZHJldy5zbWlybm92QGdtYWlsLmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGlu
Y2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNvbmJvYXJkLmNvbT4KQ2M6IEFyY2hpdCBUYW5l
amEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+CkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNh
bXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5jaGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgpDYzogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6
IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3VzYWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQ
aGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1dHJvbml4LmRlPgpDYzogQ2hyaXMgSGVhbHkgPGNw
aGVhbHlAZ21haWwuY29tPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6
IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1dHJvbml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRy
aXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYyB8IDQ2ICsrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCAzMCBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9k
cml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggN2I4NGZiYjcyOTczLi5jNTg3
MTRkYWEwYTEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjcuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTYwMSwzNSArNjAxLDQw
IEBAIHN0YXRpYyBpbnQgdGNfc3RyZWFtX2Nsb2NrX2NhbGMoc3RydWN0IHRjX2RhdGEgKnRjKQog
CXJldHVybiByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgRFAwX1ZJRE1OR0VOMSwgMzI3NjgpOwog
fQogCi1zdGF0aWMgaW50IHRjX2F1eF9saW5rX3NldHVwKHN0cnVjdCB0Y19kYXRhICp0YykKK3N0
YXRpYyBpbnQgdGNfc2V0X3N5c3BsbHBhcmFtKHN0cnVjdCB0Y19kYXRhICp0YykKIHsKIAl1bnNp
Z25lZCBsb25nIHJhdGU7Ci0JdTMyIGRwMF9hdXhjZmcxOwotCXUzMiB2YWx1ZTsKLQlpbnQgcmV0
OworCXUzMiBwbGxwYXJhbSA9IFNZU0NMS19TRUxfTFNDTEsgfCBMU0NMS19ESVZfMjsKIAogCXJh
dGUgPSBjbGtfZ2V0X3JhdGUodGMtPnJlZmNsayk7CiAJc3dpdGNoIChyYXRlKSB7CiAJY2FzZSAz
ODQwMDAwMDoKLQkJdmFsdWUgPSBSRUZfRlJFUV8zOE00OworCQlwbGxwYXJhbSB8PSBSRUZfRlJF
UV8zOE00OwogCQlicmVhazsKIAljYXNlIDI2MDAwMDAwOgotCQl2YWx1ZSA9IFJFRl9GUkVRXzI2
TTsKKwkJcGxscGFyYW0gfD0gUkVGX0ZSRVFfMjZNOwogCQlicmVhazsKIAljYXNlIDE5MjAwMDAw
OgotCQl2YWx1ZSA9IFJFRl9GUkVRXzE5TTI7CisJCXBsbHBhcmFtIHw9IFJFRl9GUkVRXzE5TTI7
CiAJCWJyZWFrOwogCWNhc2UgMTMwMDAwMDA6Ci0JCXZhbHVlID0gUkVGX0ZSRVFfMTNNOworCQlw
bGxwYXJhbSB8PSBSRUZfRlJFUV8xM007CiAJCWJyZWFrOwogCWRlZmF1bHQ6CiAJCWRldl9lcnIo
dGMtPmRldiwgIkludmFsaWQgcmVmY2xrIHJhdGU6ICVsdSBIelxuIiwgcmF0ZSk7CiAJCXJldHVy
biAtRUlOVkFMOwogCX0KIAorCXJldHVybiByZWdtYXBfd3JpdGUodGMtPnJlZ21hcCwgU1lTX1BM
TFBBUkFNLCBwbGxwYXJhbSk7Cit9CisKK3N0YXRpYyBpbnQgdGNfYXV4X2xpbmtfc2V0dXAoc3Ry
dWN0IHRjX2RhdGEgKnRjKQoreworCWludCByZXQ7CisJdTMyIGRwMF9hdXhjZmcxOworCiAJLyog
U2V0dXAgRFAtUEhZIC8gUExMICovCi0JdmFsdWUgfD0gU1lTQ0xLX1NFTF9MU0NMSyB8IExTQ0xL
X0RJVl8yOwotCXJldCA9IHJlZ21hcF93cml0ZSh0Yy0+cmVnbWFwLCBTWVNfUExMUEFSQU0sIHZh
bHVlKTsKKwlyZXQgPSB0Y19zZXRfc3lzcGxscGFyYW0odGMpOwogCWlmIChyZXQpCiAJCWdvdG8g
ZXJyOwogCkBAIC04ODcsNyArODkyLDYgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtfZW5hYmxl
KHN0cnVjdCB0Y19kYXRhICp0YykKIHsKIAlzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4ID0gJnRjLT5h
dXg7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gdGMtPmRldjsKLQl1bnNpZ25lZCBpbnQgcmF0ZTsK
IAl1MzIgZHBfcGh5X2N0cmw7CiAJdTMyIHZhbHVlOwogCWludCByZXQ7CkBAIC05MTUsMjUgKzkx
OSw3IEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0YSAqdGMp
CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJhdGUgPSBjbGtfZ2V0X3JhdGUodGMtPnJl
ZmNsayk7Ci0Jc3dpdGNoIChyYXRlKSB7Ci0JY2FzZSAzODQwMDAwMDoKLQkJdmFsdWUgPSBSRUZf
RlJFUV8zOE00OwotCQlicmVhazsKLQljYXNlIDI2MDAwMDAwOgotCQl2YWx1ZSA9IFJFRl9GUkVR
XzI2TTsKLQkJYnJlYWs7Ci0JY2FzZSAxOTIwMDAwMDoKLQkJdmFsdWUgPSBSRUZfRlJFUV8xOU0y
OwotCQlicmVhazsKLQljYXNlIDEzMDAwMDAwOgotCQl2YWx1ZSA9IFJFRl9GUkVRXzEzTTsKLQkJ
YnJlYWs7Ci0JZGVmYXVsdDoKLQkJcmV0dXJuIC1FSU5WQUw7Ci0JfQotCXZhbHVlIHw9IFNZU0NM
S19TRUxfTFNDTEsgfCBMU0NMS19ESVZfMjsKLQlyZXQgPSByZWdtYXBfd3JpdGUodGMtPnJlZ21h
cCwgU1lTX1BMTFBBUkFNLCB2YWx1ZSk7CisJcmV0ID0gdGNfc2V0X3N5c3BsbHBhcmFtKHRjKTsK
IAlpZiAocmV0KQogCQlyZXR1cm4gcmV0OwogCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
