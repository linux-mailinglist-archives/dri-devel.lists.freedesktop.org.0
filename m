Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2EC357C7
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 09:33:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80C67895A8;
	Wed,  5 Jun 2019 07:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39C4B89362
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 07:05:24 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id s11so14278921pfm.12
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 00:05:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XgORgJz2civFnf3JPNeTbcWwHZBa/hdHBoQiM2otHkM=;
 b=uSWNasQ65JJhwni3X2xTCUWVgxkIkzyjRuxQ/BJpAmLfSrdclOadNub4s91zQMtZWs
 0ECMPAiqdWXEGld/Pi0cMz9Rr0VzDbJ7qjGt//cVCqUUKKg6/g1gUUx+OI9yTKMpCGTP
 ubp0tu7mCQzToIu1ujM1tDqf5lT962db2PMZhgwA2WUuXeYXpcB62V1IsszBnhGkj0S0
 oFBSeEn/JdjkEtSdOHsXByOKahVa55xMtpWN88AoN0POIp53yJ41z7nu4k0B9TFmMyqy
 17tyg00LNGkaskd6Tua78plq4r14R97DQY9dw3J/3omuNuxRJyoApEL/rajtOnpbYueA
 MrXQ==
X-Gm-Message-State: APjAAAVopUHVLv3ybrAhJO1B52pwBa/9lKTgmjWc7tozN0xSncbsEyPW
 +EditgYoaWyjwur95HPtysY5VSR9ns8=
X-Google-Smtp-Source: APXvYqwRDK7bClOTnZ2vYtsiCmEOhixT5TOMWzo+qM3mLXAhRRfos3unkQcydH4NA6ybZe3DmSMvgA==
X-Received: by 2002:a63:e358:: with SMTP id o24mr2409745pgj.78.1559718323398; 
 Wed, 05 Jun 2019 00:05:23 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d132sm6527348pfd.61.2019.06.05.00.05.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 00:05:22 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/15] drm/bridge: tc358767: Simplify tc_poll_timeout()
Date: Wed,  5 Jun 2019 00:04:53 -0700
Message-Id: <20190605070507.11417-2-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190605070507.11417-1-andrew.smirnov@gmail.com>
References: <20190605070507.11417-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 05 Jun 2019 07:33:22 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XgORgJz2civFnf3JPNeTbcWwHZBa/hdHBoQiM2otHkM=;
 b=eH00neYSh7+Uuk3fa+0te52F39630X0h9Ql8M7fGODiNzU+dGyrfpLzY/c1ql48tEN
 xMkvrpa9uaq9N5gKz2eCSl2GfmxoZYnWz833Z9ZOxKg3962WaT/9KHL0V2SehgOv1PlH
 eoDaPIhIp79QpqJ7sERYNmopyo5lhYtixOdwGpE9LJHrsJ9TQMjPzUAOAm8++0YDC/Gf
 sQCIo2JRunRuqVmcx4w+DF3Nj/S5dkr9kUVRYRsga1+b7aB1WoN/VRcfZruB+CKWsPU9
 Hudm4D6yKAfwnhaVIU6q/m1DUmVrLkQo6GPfwbM+J7G8jtsBKdE7dG1gLhu73HcfSi2j
 9ONA==
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

SW1wbGVtZW50YXRpb24gb2YgdGNfcG9sbF90aW1lb3V0KCkgaXMgYWxtb3N0IGEgMTAwJSBjb3B5
LWFuZC1wYXN0ZSBvZgp0aGUgY29kZSBmb3IgcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KCkuIFJl
cGxhY2UgY29waWVkIGNvZGUgd2l0aCBhCmNhbGwgdG8gdGhlIG9yaWdpbmFsLiBXaGlsZSBhdCBp
dCBjaGFuZ2UgdGNfcG9sbF90aW1lb3V0IHRvIGFjY2VwdAoic3RydWN0IHRjX2RhdGEgKiIgaW5z
dGVhZCBvZiAic3RydWN0IHJlZ21hcCAqIiBmb3IgYnJldml0eS4gTm8KZnVuY3Rpb25hbCBjaGFu
Z2UgaW50ZW5kZWQuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZXkgU21pcm5vdiA8YW5kcmV3LnNtaXJu
b3ZAZ21haWwuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5n
LmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KQ2M6IEFyY2hpdCBUYW5lamEgPGFyY2hpdHRAY29kZWF1cm9yYS5vcmc+
CkNjOiBBbmRyemVqIEhhamRhIDxhLmhhamRhQHNhbXN1bmcuY29tPgpDYzogTGF1cmVudCBQaW5j
aGFydCA8TGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPgpDYzogVG9taSBWYWxrZWlu
ZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KQ2M6IEFuZHJleSBHdXNha292IDxhbmRyZXkuZ3Vz
YWtvdkBjb2dlbnRlbWJlZGRlZC5jb20+CkNjOiBQaGlsaXBwIFphYmVsIDxwLnphYmVsQHBlbmd1
dHJvbml4LmRlPgpDYzogQ29yeSBUdXNhciA8Y29yeS50dXNhckB6aWkuYWVybz4KQ2M6IENocmlz
IEhlYWx5IDxjcGhlYWx5QGdtYWlsLmNvbT4KQ2M6IEx1Y2FzIFN0YWNoIDxsLnN0YWNoQHBlbmd1
dHJvbml4LmRlPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpDYzogbGludXgt
a2VybmVsQHZnZXIua2VybmVsLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3
NjcuYyB8IDI2ICsrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBp
bnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY3LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMK
aW5kZXggNThlM2NhMGUyNWFmLi5mYjhhMTk0MmVjNTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4
NzY3LmMKQEAgLTI2NCwzNCArMjY0LDIxIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IHRjX2RhdGEg
KmNvbm5lY3Rvcl90b190YyhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqYykKIAkJCWdvdG8gZXJyOwkJ
CQlcCiAJfSB3aGlsZSAoMCkKIAotc3RhdGljIGlubGluZSBpbnQgdGNfcG9sbF90aW1lb3V0KHN0
cnVjdCByZWdtYXAgKm1hcCwgdW5zaWduZWQgaW50IGFkZHIsCitzdGF0aWMgaW5saW5lIGludCB0
Y19wb2xsX3RpbWVvdXQoc3RydWN0IHRjX2RhdGEgKnRjLCB1bnNpZ25lZCBpbnQgYWRkciwKIAkJ
CQkgIHVuc2lnbmVkIGludCBjb25kX21hc2ssCiAJCQkJICB1bnNpZ25lZCBpbnQgY29uZF92YWx1
ZSwKIAkJCQkgIHVuc2lnbmVkIGxvbmcgc2xlZXBfdXMsIHU2NCB0aW1lb3V0X3VzKQogewotCWt0
aW1lX3QgdGltZW91dCA9IGt0aW1lX2FkZF91cyhrdGltZV9nZXQoKSwgdGltZW91dF91cyk7CiAJ
dW5zaWduZWQgaW50IHZhbDsKLQlpbnQgcmV0OwogCi0JZm9yICg7OykgewotCQlyZXQgPSByZWdt
YXBfcmVhZChtYXAsIGFkZHIsICZ2YWwpOwotCQlpZiAocmV0KQotCQkJYnJlYWs7Ci0JCWlmICgo
dmFsICYgY29uZF9tYXNrKSA9PSBjb25kX3ZhbHVlKQotCQkJYnJlYWs7Ci0JCWlmICh0aW1lb3V0
X3VzICYmIGt0aW1lX2NvbXBhcmUoa3RpbWVfZ2V0KCksIHRpbWVvdXQpID4gMCkgewotCQkJcmV0
ID0gcmVnbWFwX3JlYWQobWFwLCBhZGRyLCAmdmFsKTsKLQkJCWJyZWFrOwotCQl9Ci0JCWlmIChz
bGVlcF91cykKLQkJCXVzbGVlcF9yYW5nZSgoc2xlZXBfdXMgPj4gMikgKyAxLCBzbGVlcF91cyk7
Ci0JfQotCXJldHVybiByZXQgPzogKCgodmFsICYgY29uZF9tYXNrKSA9PSBjb25kX3ZhbHVlKSA/
IDAgOiAtRVRJTUVET1VUKTsKKwlyZXR1cm4gcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KHRjLT5y
ZWdtYXAsIGFkZHIsIHZhbCwKKwkJCQkJKHZhbCAmIGNvbmRfbWFzaykgPT0gY29uZF92YWx1ZSwK
KwkJCQkJc2xlZXBfdXMsIHRpbWVvdXRfdXMpOwogfQogCiBzdGF0aWMgaW50IHRjX2F1eF93YWl0
X2J1c3koc3RydWN0IHRjX2RhdGEgKnRjLCB1bnNpZ25lZCBpbnQgdGltZW91dF9tcykKIHsKLQly
ZXR1cm4gdGNfcG9sbF90aW1lb3V0KHRjLT5yZWdtYXAsIERQMF9BVVhTVEFUVVMsIEFVWF9CVVNZ
LCAwLAorCXJldHVybiB0Y19wb2xsX3RpbWVvdXQodGMsIERQMF9BVVhTVEFUVVMsIEFVWF9CVVNZ
LCAwLAogCQkJICAgICAgIDEwMDAsIDEwMDAgKiB0aW1lb3V0X21zKTsKIH0KIApAQCAtNTk4LDgg
KzU4NSw3IEBAIHN0YXRpYyBpbnQgdGNfYXV4X2xpbmtfc2V0dXAoc3RydWN0IHRjX2RhdGEgKnRj
KQogCXRjX3dyaXRlKERQMV9QTExDVFJMLCBQTExVUERBVEUgfCBQTExFTik7CiAJdGNfd2FpdF9w
bGxfbG9jayh0Yyk7CiAKLQlyZXQgPSB0Y19wb2xsX3RpbWVvdXQodGMtPnJlZ21hcCwgRFBfUEhZ
X0NUUkwsIFBIWV9SRFksIFBIWV9SRFksIDEsCi0JCQkgICAgICAxMDAwKTsKKwlyZXQgPSB0Y19w
b2xsX3RpbWVvdXQodGMsIERQX1BIWV9DVFJMLCBQSFlfUkRZLCBQSFlfUkRZLCAxLCAxMDAwKTsK
IAlpZiAocmV0ID09IC1FVElNRURPVVQpIHsKIAkJZGV2X2Vycih0Yy0+ZGV2LCAiVGltZW91dCB3
YWl0aW5nIGZvciBQSFkgdG8gYmVjb21lIHJlYWR5Iik7CiAJCXJldHVybiByZXQ7Ci0tIAoyLjIx
LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
