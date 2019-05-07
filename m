Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C315936
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4D789CF1;
	Tue,  7 May 2019 05:35:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7925A89CE3
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:35:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8FEA72087F;
 Tue,  7 May 2019 05:35:08 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 78/99] gpu: ipu-v3: dp: fix CSC handling
Date: Tue,  7 May 2019 01:32:12 -0400
Message-Id: <20190507053235.29900-78-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207309;
 bh=1a82mOvcxiOhSPOIhzwEn0QxH4OostE6OsD7NBGsYhg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BME5K/sD5zYSCM/8iZB9i6nb4EKQn7godrh87HE0GXFmnGhXTngyly3goTysANOks
 ppWByLuhQYkN5Vih2HmycE2qEnJF6ryVsnwF8+6NCiuRMfKMDzCUVi7A5h9jCNJtbb
 ROvjRx6VXypmechuLkh7s3kwVQCiEHt4EGw5Na2E=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTHVjYXMgU3RhY2ggPGwuc3RhY2hAcGVuZ3V0cm9uaXguZGU+CgpbIFVwc3RyZWFtIGNv
bW1pdCBkNGZhZDBhNDI2YzZlMjZmNDhjOWE3Y2RkMjFhN2ZlOWMxOThkNjQ1IF0KCkluaXRpYWxp
emUgdGhlIGZsb3cgaW5wdXQgY29sb3JzcGFjZXMgdG8gdW5rbm93biBhbmQgcmVzZXQgdG8gdGhh
dCB2YWx1ZQp3aGVuIHRoZSBjaGFubmVsIGdldHMgZGlzYWJsZWQuIFRoaXMgYXZvaWRzIHRoZSBz
dGF0ZSBnZXR0aW5nIG1peGVkIHVwCndpdGggYSBwcmV2aW91cyBtb2RlLgoKQWxzbyBrZWVwIHRo
ZSBDU0Mgc2V0dGluZ3MgZm9yIHRoZSBiYWNrZ3JvdW5kIGZsb3cgaW50YWN0IHdoZW4gZGlzYWJs
aW5nCnRoZSBmb3JlZ3JvdW5kIGZsb3cuCgpSb290LWNhdXNlZC1ieTogSm9uYXRoYW4gTWFyZWsg
PGpvbmF0aGFuQG1hcmVrLmNhPgpTaWduZWQtb2ZmLWJ5OiBMdWNhcyBTdGFjaCA8bC5zdGFjaEBw
ZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5n
dXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3Jn
PgotLS0KIGRyaXZlcnMvZ3B1L2lwdS12My9pcHUtZHAuYyB8IDEyICsrKysrKysrKy0tLQogMSBm
aWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWRwLmMgYi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWRw
LmMKaW5kZXggOWIyYjNmYTQ3OWM0Li41ZTQ0ZmYxZjIwODUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2lwdS12My9pcHUtZHAuYworKysgYi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWRwLmMKQEAg
LTE5NSw3ICsxOTUsOCBAQCBpbnQgaXB1X2RwX3NldHVwX2NoYW5uZWwoc3RydWN0IGlwdV9kcCAq
ZHAsCiAJCWlwdV9kcF9jc2NfaW5pdChmbG93LCBmbG93LT5mb3JlZ3JvdW5kLmluX2NzLCBmbG93
LT5vdXRfY3MsCiAJCQkJRFBfQ09NX0NPTkZfQ1NDX0RFRl9CT1RIKTsKIAl9IGVsc2UgewotCQlp
ZiAoZmxvdy0+Zm9yZWdyb3VuZC5pbl9jcyA9PSBmbG93LT5vdXRfY3MpCisJCWlmIChmbG93LT5m
b3JlZ3JvdW5kLmluX2NzID09IElQVVYzX0NPTE9SU1BBQ0VfVU5LTk9XTiB8fAorCQkgICAgZmxv
dy0+Zm9yZWdyb3VuZC5pbl9jcyA9PSBmbG93LT5vdXRfY3MpCiAJCQkvKgogCQkJICogZm9yZWdy
b3VuZCBpZGVudGljYWwgdG8gb3V0cHV0LCBhcHBseSBjb2xvcgogCQkJICogY29udmVyc2lvbiBv
biBiYWNrZ3JvdW5kCkBAIC0yNjEsNiArMjYyLDggQEAgdm9pZCBpcHVfZHBfZGlzYWJsZV9jaGFu
bmVsKHN0cnVjdCBpcHVfZHAgKmRwLCBib29sIHN5bmMpCiAJc3RydWN0IGlwdV9kcF9wcml2ICpw
cml2ID0gZmxvdy0+cHJpdjsKIAl1MzIgcmVnLCBjc2M7CiAKKwlkcC0+aW5fY3MgPSBJUFVWM19D
T0xPUlNQQUNFX1VOS05PV047CisKIAlpZiAoIWRwLT5mb3JlZ3JvdW5kKQogCQlyZXR1cm47CiAK
QEAgLTI2OCw4ICsyNzEsOSBAQCB2b2lkIGlwdV9kcF9kaXNhYmxlX2NoYW5uZWwoc3RydWN0IGlw
dV9kcCAqZHAsIGJvb2wgc3luYykKIAogCXJlZyA9IHJlYWRsKGZsb3ctPmJhc2UgKyBEUF9DT01f
Q09ORik7CiAJY3NjID0gcmVnICYgRFBfQ09NX0NPTkZfQ1NDX0RFRl9NQVNLOwotCWlmIChjc2Mg
PT0gRFBfQ09NX0NPTkZfQ1NDX0RFRl9GRykKLQkJcmVnICY9IH5EUF9DT01fQ09ORl9DU0NfREVG
X01BU0s7CisJcmVnICY9IH5EUF9DT01fQ09ORl9DU0NfREVGX01BU0s7CisJaWYgKGNzYyA9PSBE
UF9DT01fQ09ORl9DU0NfREVGX0JPVEggfHwgY3NjID09IERQX0NPTV9DT05GX0NTQ19ERUZfQkcp
CisJCXJlZyB8PSBEUF9DT01fQ09ORl9DU0NfREVGX0JHOwogCiAJcmVnICY9IH5EUF9DT01fQ09O
Rl9GR19FTjsKIAl3cml0ZWwocmVnLCBmbG93LT5iYXNlICsgRFBfQ09NX0NPTkYpOwpAQCAtMzQ3
LDYgKzM1MSw4IEBAIGludCBpcHVfZHBfaW5pdChzdHJ1Y3QgaXB1X3NvYyAqaXB1LCBzdHJ1Y3Qg
ZGV2aWNlICpkZXYsIHVuc2lnbmVkIGxvbmcgYmFzZSkKIAltdXRleF9pbml0KCZwcml2LT5tdXRl
eCk7CiAKIAlmb3IgKGkgPSAwOyBpIDwgSVBVVjNfTlVNX0ZMT1dTOyBpKyspIHsKKwkJcHJpdi0+
Zmxvd1tpXS5iYWNrZ3JvdW5kLmluX2NzID0gSVBVVjNfQ09MT1JTUEFDRV9VTktOT1dOOworCQlw
cml2LT5mbG93W2ldLmZvcmVncm91bmQuaW5fY3MgPSBJUFVWM19DT0xPUlNQQUNFX1VOS05PV047
CiAJCXByaXYtPmZsb3dbaV0uZm9yZWdyb3VuZC5mb3JlZ3JvdW5kID0gdHJ1ZTsKIAkJcHJpdi0+
Zmxvd1tpXS5iYXNlID0gcHJpdi0+YmFzZSArIGlwdV9kcF9mbG93X2Jhc2VbaV07CiAJCXByaXYt
PmZsb3dbaV0ucHJpdiA9IHByaXY7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
