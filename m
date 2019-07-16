Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F256B73E
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D89686E285;
	Wed, 17 Jul 2019 07:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1357689BF6
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 11:57:46 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id i18so9328167pgl.11
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 04:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nWIVAdKLsOhFpm09GAp/Kd9PshsoLswOzSbyeHOTCdU=;
 b=DR2TtwnIVnidqYqbkcT8xfcvLoUhPARf2CMuoDDr4DxIietXBD/e1m3pu7dv9o1PQ+
 KrVXmB8e3p2SxZnNqpgAY8hxz+Ih/oyHTL4HDUfr+KIny+FSOMGt+4kzx+nRgmP35Hk8
 ddafThzVqyqA0C9JvScGLm48Xn052wiTBenq5AfUAUwfJe7twlT1zHyuVbXd3LCVb9i4
 BIjYJbRhFo3vqMf4Zx2Fy+mDOhGaXLEmzv1btfHPw4UxtBfdIpL9ldt5zABVBuloYvog
 VruhIalkxGcZeC/sRhAxA2rdKXbOSl+2G0QbHs0f+8lSbRc/ONWiGWPFzjyg/jbjIjft
 0vPA==
X-Gm-Message-State: APjAAAUI5GLNMFdtiUGUJ1o4zhyMmeTOLCNHVgeiFMhs0pZygPAWpHZJ
 DY7pn3iO9wsmDd0iRNQT9gEVpg==
X-Google-Smtp-Source: APXvYqxTC8t4uj70QfHewfzBaIDkzvvu1uDD0OlpvZfH4YnG3dmM1Hlgyw1DNkTVjm6RzdHeRpU9Rw==
X-Received: by 2002:a63:4845:: with SMTP id x5mr32176862pgk.155.1563278265672; 
 Tue, 16 Jul 2019 04:57:45 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id v63sm21937081pfv.174.2019.07.16.04.57.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 16 Jul 2019 04:57:45 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/5] ASoC: hdmi-codec: Add an op to set callback function
 for plug event
Date: Tue, 16 Jul 2019 19:57:21 +0800
Message-Id: <20190716115725.66558-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.510.g264f2c817a-goog
In-Reply-To: <20190716115725.66558-1-cychiang@chromium.org>
References: <20190716115725.66558-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 17 Jul 2019 07:08:01 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nWIVAdKLsOhFpm09GAp/Kd9PshsoLswOzSbyeHOTCdU=;
 b=nAjQz5QdyxYxsW86ujuUIE44kSmMpU20f5gDh636Qlgkd1KX492KN3S6iuNFC5VJ4L
 xxRp+H3X6IawQaYLhF4VuXx53j0KzZy7RBxwXhUsZA0+fbEAfZ+ILiy4pHctPksJfZJ4
 tOY8Hhb4J37n0ADuxtwcdA4GtKE/K10JBVgL4=
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
