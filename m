Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B82E6025A
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jul 2019 10:41:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A88876E421;
	Fri,  5 Jul 2019 08:41:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 235A56E3FC
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jul 2019 04:26:45 +0000 (UTC)
Received: by mail-pf1-x444.google.com with SMTP id p184so3716781pfp.7
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Jul 2019 21:26:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+3G7gaXEJuSaVZO7JAbYh3wKp+iQz6Nh9jSGcVM+k6U=;
 b=cJEPEEuK+XoM6jvStVWstAMOgADEOQ4fzWCIzRd9hFexwveSnrNxPQ3uiVboT7A7mu
 3KBlFWycgltziilIIb7ZvhzqnvpUcqH4pZ7yxjpps3XWR+mZzyYZDvToEnUq0KIfcgEJ
 Dky1LYbFdKeyoihOjyMuzjGQltwMks2P8MXhW6fHG4uj7OjqdM/EnbnCbODK/AF/dvdU
 yxvdQ3SYoiCBksjjQq6bS1WIIsePm1UkKtOHNY2sxDpE3Q6xxXhWaWjarbasl1RFLL5K
 8vYaBfYKH+k2/xtPaDJhv7UuavDXofbldGlsz5cGbR6Ouz7bau2hZLdf0uRj5+KWiN9n
 5+fw==
X-Gm-Message-State: APjAAAV062pKHeJt0xlbJrKTz4ABoPkIX19p22dNnusp4RBJi8SW1B11
 v2X3NJznBU9V/MzhP6R0CkH25w==
X-Google-Smtp-Source: APXvYqxo3SdDzWV2z9ih0ZiNNE3HnS7c3zDkLrVJE1fvL3y0/NYA0aJNny09tyDNEaQonEEmk3XdTw==
X-Received: by 2002:a65:430a:: with SMTP id j10mr2429110pgq.374.1562300804603; 
 Thu, 04 Jul 2019 21:26:44 -0700 (PDT)
Received: from localhost ([2401:fa00:1:b:e688:dfd2:a1a7:2956])
 by smtp.gmail.com with ESMTPSA id b29sm17718645pfr.159.2019.07.04.21.26.41
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 04 Jul 2019 21:26:44 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: hdmi-codec: Add an op to set callback function for
 plug event
Date: Fri,  5 Jul 2019 12:26:20 +0800
Message-Id: <20190705042623.129541-2-cychiang@chromium.org>
X-Mailer: git-send-email 2.22.0.410.gd8fdbe21b5-goog
In-Reply-To: <20190705042623.129541-1-cychiang@chromium.org>
References: <20190705042623.129541-1-cychiang@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 05 Jul 2019 08:41:20 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+3G7gaXEJuSaVZO7JAbYh3wKp+iQz6Nh9jSGcVM+k6U=;
 b=nMtfntFDTuoSfK9/VFf/q1vvFv3BHdF9zSOETr3vqyb6NzVWs4/fbfev94T09R+aUd
 3vNBcFB033ya7IZyhwEjfeccLxwKb4rNzeYxICCdJ6mDfnK8h5MLTINtR+qH1dqoaGr8
 WFkvrCy91KPXVRYCKm4om3V826Sg44F5rrCGA=
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
LS0KIGluY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oICAgIHwgMTYgKysrKysrKysrKysKIHNvdW5k
L3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jIHwgNTIgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgNjggaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oIGIvaW5jbHVkZS9zb3VuZC9oZG1pLWNvZGVjLmgK
aW5kZXggN2ZlYTQ5NmYxZjM0Li4yNmMwMmFiYjhlYmEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvc291
bmQvaGRtaS1jb2RlYy5oCisrKyBiL2luY2x1ZGUvc291bmQvaGRtaS1jb2RlYy5oCkBAIC00Nyw2
ICs0Nyw5IEBAIHN0cnVjdCBoZG1pX2NvZGVjX3BhcmFtcyB7CiAJaW50IGNoYW5uZWxzOwogfTsK
IAordHlwZWRlZiB2b2lkICgqaGRtaV9jb2RlY19wbHVnZ2VkX2NiKShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpkZXYsCisJCQkJICAgICAgYm9vbCBwbHVnZ2VkKTsKKwogc3RydWN0IGhkbWlfY29k
ZWNfcGRhdGE7CiBzdHJ1Y3QgaGRtaV9jb2RlY19vcHMgewogCS8qCkBAIC04OCw2ICs5MSwxMyBA
QCBzdHJ1Y3QgaGRtaV9jb2RlY19vcHMgewogCSAqLwogCWludCAoKmdldF9kYWlfaWQpKHN0cnVj
dCBzbmRfc29jX2NvbXBvbmVudCAqY29tbWVudCwKIAkJCSAgc3RydWN0IGRldmljZV9ub2RlICpl
bmRwb2ludCk7CisKKwkvKgorCSAqIEhvb2sgY2FsbGJhY2sgZnVuY3Rpb24gdG8gaGFuZGxlIGNv
bm5lY3RvciBwbHVnIGV2ZW50LgorCSAqIE9wdGlvbmFsCisJICovCisJaW50ICgqaG9va19wbHVn
Z2VkX2NiKShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCisJCQkgICAgICAgaGRtaV9j
b2RlY19wbHVnZ2VkX2NiIGZuKTsKIH07CiAKIC8qIEhETUkgY29kZWMgaW5pdGFsaXphdGlvbiBk
YXRhICovCkBAIC05OSw2ICsxMDksMTIgQEAgc3RydWN0IGhkbWlfY29kZWNfcGRhdGEgewogCXZv
aWQgKmRhdGE7CiB9OwogCitzdHJ1Y3Qgc25kX3NvY19jb21wb25lbnQ7CitzdHJ1Y3Qgc25kX3Nv
Y19qYWNrOworCitpbnQgaGRtaV9jb2RlY19zZXRfamFja19kZXRlY3Qoc3RydWN0IHNuZF9zb2Nf
Y29tcG9uZW50ICpjb21wb25lbnQsCisJCQkgICAgICAgc3RydWN0IHNuZF9zb2NfamFjayAqamFj
ayk7CisKICNkZWZpbmUgSERNSV9DT0RFQ19EUlZfTkFNRSAiaGRtaS1hdWRpby1jb2RlYyIKIAog
I2VuZGlmIC8qIF9fSERNSV9DT0RFQ19IX18gKi8KZGlmZiAtLWdpdCBhL3NvdW5kL3NvYy9jb2Rl
Y3MvaGRtaS1jb2RlYy5jIGIvc291bmQvc29jL2NvZGVjcy9oZG1pLWNvZGVjLmMKaW5kZXggMGJm
MWM4Y2FkMTA4Li41ZTcwNzVmNzhjMzggMTAwNjQ0Ci0tLSBhL3NvdW5kL3NvYy9jb2RlY3MvaGRt
aS1jb2RlYy5jCisrKyBiL3NvdW5kL3NvYy9jb2RlY3MvaGRtaS1jb2RlYy5jCkBAIC03LDYgKzcs
NyBAQAogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L3N0cmluZy5o
PgogI2luY2x1ZGUgPHNvdW5kL2NvcmUuaD4KKyNpbmNsdWRlIDxzb3VuZC9qYWNrLmg+CiAjaW5j
bHVkZSA8c291bmQvcGNtLmg+CiAjaW5jbHVkZSA8c291bmQvcGNtX3BhcmFtcy5oPgogI2luY2x1
ZGUgPHNvdW5kL3NvYy5oPgpAQCAtMjc0LDYgKzI3NSw4IEBAIHN0cnVjdCBoZG1pX2NvZGVjX3By
aXYgewogCXN0cnVjdCBzbmRfcGNtX2NobWFwICpjaG1hcF9pbmZvOwogCXVuc2lnbmVkIGludCBj
aG1hcF9pZHg7CiAJc3RydWN0IG11dGV4IGxvY2s7CisJc3RydWN0IHNuZF9zb2NfamFjayAqamFj
azsKKwl1bnNpZ25lZCBpbnQgamFja19zdGF0dXM7CiB9OwogCiBzdGF0aWMgY29uc3Qgc3RydWN0
IHNuZF9zb2NfZGFwbV93aWRnZXQgaGRtaV93aWRnZXRzW10gPSB7CkBAIC02NjMsNiArNjY2LDU1
IEBAIHN0YXRpYyBpbnQgaGRtaV9kYWlfcHJvYmUoc3RydWN0IHNuZF9zb2NfZGFpICpkYWkpCiAJ
cmV0dXJuIDA7CiB9CiAKK3N0YXRpYyB2b2lkIGhkbWlfY29kZWNfamFja19yZXBvcnQoc3RydWN0
IGhkbWlfY29kZWNfcHJpdiAqaGNwLAorCQkJCSAgIHVuc2lnbmVkIGludCBqYWNrX3N0YXR1cykK
K3sKKwlpZiAoIWhjcC0+amFjaykKKwkJcmV0dXJuOworCisJaWYgKGphY2tfc3RhdHVzICE9IGhj
cC0+amFja19zdGF0dXMpIHsKKwkJc25kX3NvY19qYWNrX3JlcG9ydChoY3AtPmphY2ssIGphY2tf
c3RhdHVzLCBTTkRfSkFDS19MSU5FT1VUKTsKKwkJaGNwLT5qYWNrX3N0YXR1cyA9IGphY2tfc3Rh
dHVzOworCX0KK30KKworc3RhdGljIHZvaWQgcGx1Z2dlZF9jYihzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2LCBib29sIHBsdWdnZWQpCit7CisJc3RydWN0IHBsYXRmb3JtX2RldmljZSAqY29k
ZWNfcGRldiA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOworCXN0cnVjdCBoZG1pX2NvZGVj
X3ByaXYgKmhjcCA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKGNvZGVjX3BkZXYpOworCisJaWYgKHBs
dWdnZWQpCisJCWhkbWlfY29kZWNfamFja19yZXBvcnQoaGNwLCBTTkRfSkFDS19MSU5FT1VUKTsK
KwllbHNlCisJCWhkbWlfY29kZWNfamFja19yZXBvcnQoaGNwLCAwKTsKK30KKworLyoqCisgKiBo
ZG1pX2NvZGVjX3NldF9qYWNrX2RldGVjdCAtIHJlZ2lzdGVyIEhETUkgcGx1Z2dlZCBjYWxsYmFj
aworICogQGNvbXBvbmVudDogdGhlIGhkbWktY29kZWMgaW5zdGFuY2UKKyAqIEBqYWNrOiBBU29D
IGphY2sgdG8gcmVwb3J0IChkaXMpY29ubmVjdGlvbiBldmVudHMgb24KKyAqLworaW50IGhkbWlf
Y29kZWNfc2V0X2phY2tfZGV0ZWN0KHN0cnVjdCBzbmRfc29jX2NvbXBvbmVudCAqY29tcG9uZW50
LAorCQkJICAgICAgIHN0cnVjdCBzbmRfc29jX2phY2sgKmphY2spCit7CisJc3RydWN0IGhkbWlf
Y29kZWNfcHJpdiAqaGNwID0gc25kX3NvY19jb21wb25lbnRfZ2V0X2RydmRhdGEoY29tcG9uZW50
KTsKKwlpbnQgcmV0OworCisJaWYgKGhjcC0+aGNkLm9wcy0+aG9va19wbHVnZ2VkX2NiKSB7CisJ
CWhjcC0+amFjayA9IGphY2s7CisJCXJldCA9IGhjcC0+aGNkLm9wcy0+aG9va19wbHVnZ2VkX2Ni
KGNvbXBvbmVudC0+ZGV2LT5wYXJlbnQsCisJCQkJCQkgICAgaGNwLT5oY2QuZGF0YSwKKwkJCQkJ
CSAgICBwbHVnZ2VkX2NiKTsKKwkJaWYgKHJldCkgeworCQkJaGNwLT5qYWNrID0gTlVMTDsKKwkJ
CXJldHVybiByZXQ7CisJCX0KKwkJcmV0dXJuIDA7CisJfQorCXJldHVybiAtRU9QTk9UU1VQUDsK
K30KK0VYUE9SVF9TWU1CT0xfR1BMKGhkbWlfY29kZWNfc2V0X2phY2tfZGV0ZWN0KTsKKwogc3Rh
dGljIGludCBoZG1pX2RhaV9zcGRpZl9wcm9iZShzdHJ1Y3Qgc25kX3NvY19kYWkgKmRhaSkKIHsK
IAlzdHJ1Y3QgaGRtaV9jb2RlY19kYWlmbXQgKmNmID0gZGFpLT5wbGF5YmFja19kbWFfZGF0YTsK
LS0gCjIuMjIuMC40MTAuZ2Q4ZmRiZTIxYjUtZ29vZwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
