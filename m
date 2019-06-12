Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72228433A8
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 09:31:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E94F894A7;
	Thu, 13 Jun 2019 07:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C873289468
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 08:33:23 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id s24so6323510plr.8
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2019 01:33:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=keSCKeia5rVqG04ZabahyFVQsK++406Zomkh+XqD9yQ=;
 b=IzaM2AQEe9Gk7Z1c1XAR1CcdiwMKXgaH0Ff06fEWenEunol9BIqUYIpQew58UAzaqz
 SUolOc/f59/tTBCVo79clnij/pitPgVxxK0HgznMTSUJKtf/4a/uDEkwDbxCERUL/bEI
 BH5arkCRbUT21QY+H6nd3QE5cKwdb+cB7q71bw68wDy3Nbidxz8Hper4T2e/22CHDuex
 ctaZnRa3u5AUbLH6PdGFS2fruCUwf4du+zjyDEaLIfURg2mHJrHc1g/Cl7nbVSEsRTjm
 GDIhRqrvisijrcxiROk/5QbOdZ0YBney5yPDN+rKAR08RwzhmQrIfTiFa54a82rtJlCy
 8wLA==
X-Gm-Message-State: APjAAAUIP+vvO41F3hdlz9RrMIpHyDPwm1iCUvkYN1Q4RPLzofTm2D6e
 s4/Sh6VaIOEUGlp8kHxiWyYPWGLJyi0=
X-Google-Smtp-Source: APXvYqw77IJvfmWESu6Fkz82MTk/bw5xbnFo/exhAZ9jZ6mrHPK6zgE4uZhDbO5/R00RiYh0KcLtDQ==
X-Received: by 2002:a17:902:8648:: with SMTP id
 y8mr33003851plt.238.1560328403048; 
 Wed, 12 Jun 2019 01:33:23 -0700 (PDT)
Received: from localhost.lan (c-24-22-235-96.hsd1.wa.comcast.net.
 [24.22.235.96])
 by smtp.gmail.com with ESMTPSA id d21sm18845991pfr.162.2019.06.12.01.33.21
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 12 Jun 2019 01:33:22 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 11/15] drm/bridge: tc358767: Introduce tc_set_syspllparam()
Date: Wed, 12 Jun 2019 01:32:48 -0700
Message-Id: <20190612083252.15321-12-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190612083252.15321-1-andrew.smirnov@gmail.com>
References: <20190612083252.15321-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 13 Jun 2019 07:27:23 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=keSCKeia5rVqG04ZabahyFVQsK++406Zomkh+XqD9yQ=;
 b=QVByu2HoT/nJlM5jE+eRfFtcHUFhKeuuqDodq0ul6OOOgMr75lXrDL3cNBmC15cZwd
 X3V8aj+gm0LNuwqKoV9D2Ou78mRrJwhR5nc1aMN5uw7a6ttOmvkB3no1d5UlbiERk9W2
 MQ8gr1nupekFxtel9//SMGCDjzHOSCEa2u4lbE4Xa0t6tWo5VOfZ3cS50UVDVXccmvEl
 lGGkPoTnpBJ1z0JAM6tdwmOtEAmdnOCmIIva682+RoWyPPmvPAZbxiRL+mGu00VCsN8E
 h0sHAo0NxKjcPJvwDacIHL+xIWsiwRKkewUdYOR4H9lwGumfL0QBQn5QFle1HTkQxG12
 qF2w==
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
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKaW5kZXggNGJiOWIxNWUxMzI0
Li5hYzU1YjU5MjQ5ZTMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3
NjcuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY3LmMKQEAgLTU4MSwzNSAr
NTgxLDQwIEBAIHN0YXRpYyBpbnQgdGNfc3RyZWFtX2Nsb2NrX2NhbGMoc3RydWN0IHRjX2RhdGEg
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
CWdvdG8gZXJyOwogCkBAIC04NjgsNyArODczLDYgQEAgc3RhdGljIGludCB0Y19tYWluX2xpbmtf
ZW5hYmxlKHN0cnVjdCB0Y19kYXRhICp0YykKIHsKIAlzdHJ1Y3QgZHJtX2RwX2F1eCAqYXV4ID0g
JnRjLT5hdXg7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gdGMtPmRldjsKLQl1bnNpZ25lZCBpbnQg
cmF0ZTsKIAl1MzIgZHBfcGh5X2N0cmw7CiAJdTMyIHZhbHVlOwogCWludCByZXQ7CkBAIC04OTYs
MjUgKzkwMCw3IEBAIHN0YXRpYyBpbnQgdGNfbWFpbl9saW5rX2VuYWJsZShzdHJ1Y3QgdGNfZGF0
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
