Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AF5F6BD9D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 15:50:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4713689B00;
	Wed, 17 Jul 2019 13:50:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58F9B6E188
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 08:33:43 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id w10so10805838pgj.7
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 01:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWIVAdKLsOhFpm09GAp/Kd9PshsoLswOzSbyeHOTCdU=;
 b=QwpOJCq4kp61Nd2FO17BjrpsgaGB5uNsdG0HBORmxuB1rDVfvxZhEuFXjPtlLLRqTD
 GJ0Ohx81afc1ef29Vciudbm7nqknYV1bp9g6cMpw6Oc4nnkZvK2PAMGgTOuUxGkSNT5u
 N9+qBdE2CXCb/BBcCz6fpE7pTo5QWyVi04jjLESHYzU6Cm5oRWvZy4z3kpJJ/+FxWUFx
 ubl2rzUjSn6AmkbjbNKOfsjpth/Dmp2oGNVam8MpBRVgDVPON62e/OAMmb8Z/5P/6P7u
 YPF9ssbP+TpANxL9kL/PZnIU0KyRXsZnn1qUnQpWaH41HuEvmawDI3+j5S9NEB7Yttok
 oAzQ==
X-Gm-Message-State: APjAAAXg1hWpDCt7RkdHo9I/ZBZ64EN56dy497nJpaohdxTkov2P6Fl6
 eYhenuzmgayQ+3cSprxU3SzyOg==
X-Google-Smtp-Source: APXvYqxW922CsIcP7GhDMAEb73qrZMeDRGfdqCp/Vphtqp6605sAAq1T/HiWE7RXmKjk3ATv4tYVmg==
X-Received: by 2002:a63:c1c:: with SMTP id b28mr7542105pgl.354.1563352422941; 
 Wed, 17 Jul 2019 01:33:42 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id f20sm10577301pgg.56.2019.07.17.01.33.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jul 2019 01:33:42 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/5] ASoC: hdmi-codec: Add an op to set callback function
 for plug event
Date: Wed, 17 Jul 2019 16:33:23 +0800
Message-Id: <20190717083327.47646-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190717083327.47646-1-cychiang@chromium.org>
References: <20190717083327.47646-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 13:50:42 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWIVAdKLsOhFpm09GAp/Kd9PshsoLswOzSbyeHOTCdU=;
 b=LWje8Czn4fMLg4cGgLHBvyg9dnZfrufxj8s9WFgnCPNKID+WleIhuFtbd3K2fZZGhV
 5nzXOUQna3cI73MjREOCP39GzGjDQdxnjU9Eyl5n2WCiFT9xEu17yezcCeFlsjNtSGq4
 fIIBTjJ3LCGHfl/Olx+UCJpq3POAqZHNq3rw8=
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
Cc: alsa-devel@alsa-project.org, dianders@chromium.org,
 linux-rockchip@lists.infradead.org, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, tzungbi@chromium.org,
 Jaroslav Kysela <perex@perex.cz>, Hans Verkuil <hverkuil@xs4all.nl>,
 Russell King <rmk+kernel@armlinux.org.uk>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGFuIG9wIGluIGhkbWlfY29kZWNfb3BzIHNvIGNvZGVjIGRyaXZlciBjYW4gcmVnaXN0ZXIg
Y2FsbGJhY2sKZnVuY3Rpb24gdG8gaGFuZGxlIHBsdWcgZXZlbnQuCgpEcml2ZXIgaW4gRFJNIGNh
biB1c2UgdGhpcyBjYWxsYmFjayBmdW5jdGlvbiB0byByZXBvcnQgY29ubmVjdG9yIHN0YXR1cy4K
ClNpZ25lZC1vZmYtYnk6IENoZW5nLVlpIENoaWFuZyA8Y3ljaGlhbmdAY2hyb21pdW0ub3JnPgot
LS0KIGluY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oICAgIHwgMTcgKysrKysrKysrKysrKwogc291
bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMgfCA0NiArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKwogMiBmaWxlcyBjaGFuZ2VkLCA2MyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmggYi9pbmNsdWRlL3NvdW5kL2hkbWktY29kZWMu
aAppbmRleCA3ZmVhNDk2ZjFmMzQuLjgzYjE3NjgyZTAxYyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9z
b3VuZC9oZG1pLWNvZGVjLmgKKysrIGIvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmgKQEAgLTQ3
LDYgKzQ3LDkgQEAgc3RydWN0IGhkbWlfY29kZWNfcGFyYW1zIHsKIAlpbnQgY2hhbm5lbHM7CiB9
OwogCit0eXBlZGVmIHZvaWQgKCpoZG1pX2NvZGVjX3BsdWdnZWRfY2IpKHN0cnVjdCBkZXZpY2Ug
KmRldiwKKwkJCQkgICAgICBib29sIHBsdWdnZWQpOworCiBzdHJ1Y3QgaGRtaV9jb2RlY19wZGF0
YTsKIHN0cnVjdCBoZG1pX2NvZGVjX29wcyB7CiAJLyoKQEAgLTg4LDYgKzkxLDE0IEBAIHN0cnVj
dCBoZG1pX2NvZGVjX29wcyB7CiAJICovCiAJaW50ICgqZ2V0X2RhaV9pZCkoc3RydWN0IHNuZF9z
b2NfY29tcG9uZW50ICpjb21tZW50LAogCQkJICBzdHJ1Y3QgZGV2aWNlX25vZGUgKmVuZHBvaW50
KTsKKworCS8qCisJICogSG9vayBjYWxsYmFjayBmdW5jdGlvbiB0byBoYW5kbGUgY29ubmVjdG9y
IHBsdWcgZXZlbnQuCisJICogT3B0aW9uYWwKKwkgKi8KKwlpbnQgKCpob29rX3BsdWdnZWRfY2Ip
KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKKwkJCSAgICAgICBoZG1pX2NvZGVjX3Bs
dWdnZWRfY2IgZm4sCisJCQkgICAgICAgc3RydWN0IGRldmljZSAqY29kZWNfZGV2KTsKIH07CiAK
IC8qIEhETUkgY29kZWMgaW5pdGFsaXphdGlvbiBkYXRhICovCkBAIC05OSw2ICsxMTAsMTIgQEAg
c3RydWN0IGhkbWlfY29kZWNfcGRhdGEgewogCXZvaWQgKmRhdGE7CiB9OwogCitzdHJ1Y3Qgc25k
X3NvY19jb21wb25lbnQ7CitzdHJ1Y3Qgc25kX3NvY19qYWNrOworCitpbnQgaGRtaV9jb2RlY19z
ZXRfamFja19kZXRlY3Qoc3RydWN0IHNuZF9zb2NfY29tcG9uZW50ICpjb21wb25lbnQsCisJCQkg
ICAgICAgc3RydWN0IHNuZF9zb2NfamFjayAqamFjayk7CisKICNkZWZpbmUgSERNSV9DT0RFQ19E
UlZfTkFNRSAiaGRtaS1hdWRpby1jb2RlYyIKIAogI2VuZGlmIC8qIF9fSERNSV9DT0RFQ19IX18g
Ki8KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jIGIvc291bmQvc29j
L2NvZGVjcy9oZG1pLWNvZGVjLmMKaW5kZXggMGJmMWM4Y2FkMTA4Li5iNWZkOGYwODcyNmUgMTAw
NjQ0Ci0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jCisrKyBiL3NvdW5kL3NvYy9j
b2RlY3MvaGRtaS1jb2RlYy5jCkBAIC03LDYgKzcsNyBAQAogI2luY2x1ZGUgPGxpbnV4L21vZHVs
ZS5oPgogI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5oPgogI2luY2x1ZGUgPHNvdW5kL2NvcmUuaD4K
KyNpbmNsdWRlIDxzb3VuZC9qYWNrLmg+CiAjaW5jbHVkZSA8c291bmQvcGNtLmg+CiAjaW5jbHVk
ZSA8c291bmQvcGNtX3BhcmFtcy5oPgogI2luY2x1ZGUgPHNvdW5kL3NvYy5oPgpAQCAtMjc0LDYg
KzI3NSw4IEBAIHN0cnVjdCBoZG1pX2NvZGVjX3ByaXYgewogCXN0cnVjdCBzbmRfcGNtX2NobWFw
ICpjaG1hcF9pbmZvOwogCXVuc2lnbmVkIGludCBjaG1hcF9pZHg7CiAJc3RydWN0IG11dGV4IGxv
Y2s7CisJc3RydWN0IHNuZF9zb2NfamFjayAqamFjazsKKwl1bnNpZ25lZCBpbnQgamFja19zdGF0
dXM7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0IHNuZF9zb2NfZGFwbV93aWRnZXQgaGRtaV93
aWRnZXRzW10gPSB7CkBAIC02NjMsNiArNjY2LDQ5IEBAIHN0YXRpYyBpbnQgaGRtaV9kYWlfcHJv
YmUoc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB2b2lk
IGhkbWlfY29kZWNfamFja19yZXBvcnQoc3RydWN0IGhkbWlfY29kZWNfcHJpdiAqaGNwLAorCQkJ
CSAgIHVuc2lnbmVkIGludCBqYWNrX3N0YXR1cykKK3sKKwlpZiAoaGNwLT5qYWNrICYmIGphY2tf
c3RhdHVzICE9IGhjcC0+amFja19zdGF0dXMpIHsKKwkJc25kX3NvY19qYWNrX3JlcG9ydChoY3At
PmphY2ssIGphY2tfc3RhdHVzLCBTTkRfSkFDS19MSU5FT1VUKTsKKwkJaGNwLT5qYWNrX3N0YXR1
cyA9IGphY2tfc3RhdHVzOworCX0KK30KKworc3RhdGljIHZvaWQgcGx1Z2dlZF9jYihzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIGJvb2wgcGx1Z2dlZCkKK3sKKwlzdHJ1Y3QgaGRtaV9jb2RlY19wcml2ICpo
Y3AgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKworCWlmIChwbHVnZ2VkKQorCQloZG1pX2NvZGVj
X2phY2tfcmVwb3J0KGhjcCwgU05EX0pBQ0tfTElORU9VVCk7CisJZWxzZQorCQloZG1pX2NvZGVj
X2phY2tfcmVwb3J0KGhjcCwgMCk7Cit9CisKKy8qKgorICogaGRtaV9jb2RlY19zZXRfamFja19k
ZXRlY3QgLSByZWdpc3RlciBIRE1JIHBsdWdnZWQgY2FsbGJhY2sKKyAqIEBjb21wb25lbnQ6IHRo
ZSBoZG1pLWNvZGVjIGluc3RhbmNlCisgKiBAamFjazogQVNvQyBqYWNrIHRvIHJlcG9ydCAoZGlz
KWNvbm5lY3Rpb24gZXZlbnRzIG9uCisgKi8KK2ludCBoZG1pX2NvZGVjX3NldF9qYWNrX2RldGVj
dChzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQgKmNvbXBvbmVudCwKKwkJCSAgICAgICBzdHJ1Y3Qg
c25kX3NvY19qYWNrICpqYWNrKQoreworCXN0cnVjdCBoZG1pX2NvZGVjX3ByaXYgKmhjcCA9IHNu
ZF9zb2NfY29tcG9uZW50X2dldF9kcnZkYXRhKGNvbXBvbmVudCk7CisJaW50IHJldCA9IC1FT1BO
T1RTVVBQOworCisJaWYgKGhjcC0+aGNkLm9wcy0+aG9va19wbHVnZ2VkX2NiKSB7CisJCWhjcC0+
amFjayA9IGphY2s7CisJCXJldCA9IGhjcC0+aGNkLm9wcy0+aG9va19wbHVnZ2VkX2NiKGNvbXBv
bmVudC0+ZGV2LT5wYXJlbnQsCisJCQkJCQkgICAgaGNwLT5oY2QuZGF0YSwKKwkJCQkJCSAgICBw
bHVnZ2VkX2NiLAorCQkJCQkJICAgIGNvbXBvbmVudC0+ZGV2KTsKKwkJaWYgKHJldCkKKwkJCWhj
cC0+amFjayA9IE5VTEw7CisJfQorCXJldHVybiByZXQ7Cit9CitFWFBPUlRfU1lNQk9MX0dQTCho
ZG1pX2NvZGVjX3NldF9qYWNrX2RldGVjdCk7CisKIHN0YXRpYyBpbnQgaGRtaV9kYWlfc3BkaWZf
cHJvYmUoc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCiB7CiAJc3RydWN0IGhkbWlfY29kZWNfZGFp
Zm10ICpjZiA9IGRhaS0+cGxheWJhY2tfZG1hX2RhdGE7Ci0tIAoyLjIyLjAuNTEwLmcyNjRmMmM4
MTdhLWdvb2cKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
