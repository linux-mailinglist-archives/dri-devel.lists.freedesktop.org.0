Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3CDD15A09
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C794389D77;
	Tue,  7 May 2019 05:43:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B425E89D77
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2019 05:43:09 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C9E232087F;
 Tue,  7 May 2019 05:43:08 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 3.18 10/10] gpu: ipu-v3: dp: fix CSC handling
Date: Tue,  7 May 2019 01:42:46 -0400
Message-Id: <20190507054247.537-10-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507054247.537-1-sashal@kernel.org>
References: <20190507054247.537-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207789;
 bh=8NQddyDvhDHI0W0/+44DvOna4t2fOYlxJuDCeJ9gO48=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UjSKLp/y9rtbYoRJDjKOoU4bNP+s7EuJRNCFX81bWxRqY87fTXfHLhg6fpGHTS7QU
 oMboPJe7xSls9RUdwGvNZsIjgWyHEG9j6vJ4ETpgdOB3GGyJEjbMfnYJAS4xyWkwc4
 5MI4oU5PQNus4vEYlPCcONGyJ9eIHYnbiqEboAgg=
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
LmMKaW5kZXggOTg2ODZlZGJjZGJiLi4zM2RlM2ExYmFjNDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2lwdS12My9pcHUtZHAuYworKysgYi9kcml2ZXJzL2dwdS9pcHUtdjMvaXB1LWRwLmMKQEAg
LTE5NSw3ICsxOTUsOCBAQCBpbnQgaXB1X2RwX3NldHVwX2NoYW5uZWwoc3RydWN0IGlwdV9kcCAq
ZHAsCiAJCWlwdV9kcF9jc2NfaW5pdChmbG93LCBmbG93LT5mb3JlZ3JvdW5kLmluX2NzLCBmbG93
LT5vdXRfY3MsCiAJCQkJRFBfQ09NX0NPTkZfQ1NDX0RFRl9CT1RIKTsKIAl9IGVsc2UgewotCQlp
ZiAoZmxvdy0+Zm9yZWdyb3VuZC5pbl9jcyA9PSBmbG93LT5vdXRfY3MpCisJCWlmIChmbG93LT5m
b3JlZ3JvdW5kLmluX2NzID09IElQVVYzX0NPTE9SU1BBQ0VfVU5LTk9XTiB8fAorCQkgICAgZmxv
dy0+Zm9yZWdyb3VuZC5pbl9jcyA9PSBmbG93LT5vdXRfY3MpCiAJCQkvKgogCQkJICogZm9yZWdy
b3VuZCBpZGVudGljYWwgdG8gb3V0cHV0LCBhcHBseSBjb2xvcgogCQkJICogY29udmVyc2lvbiBv
biBiYWNrZ3JvdW5kCkBAIC0yNjEsNiArMjYyLDggQEAgdm9pZCBpcHVfZHBfZGlzYWJsZV9jaGFu
bmVsKHN0cnVjdCBpcHVfZHAgKmRwKQogCXN0cnVjdCBpcHVfZHBfcHJpdiAqcHJpdiA9IGZsb3ct
PnByaXY7CiAJdTMyIHJlZywgY3NjOwogCisJZHAtPmluX2NzID0gSVBVVjNfQ09MT1JTUEFDRV9V
TktOT1dOOworCiAJaWYgKCFkcC0+Zm9yZWdyb3VuZCkKIAkJcmV0dXJuOwogCkBAIC0yNjgsOCAr
MjcxLDkgQEAgdm9pZCBpcHVfZHBfZGlzYWJsZV9jaGFubmVsKHN0cnVjdCBpcHVfZHAgKmRwKQog
CiAJcmVnID0gcmVhZGwoZmxvdy0+YmFzZSArIERQX0NPTV9DT05GKTsKIAljc2MgPSByZWcgJiBE
UF9DT01fQ09ORl9DU0NfREVGX01BU0s7Ci0JaWYgKGNzYyA9PSBEUF9DT01fQ09ORl9DU0NfREVG
X0ZHKQotCQlyZWcgJj0gfkRQX0NPTV9DT05GX0NTQ19ERUZfTUFTSzsKKwlyZWcgJj0gfkRQX0NP
TV9DT05GX0NTQ19ERUZfTUFTSzsKKwlpZiAoY3NjID09IERQX0NPTV9DT05GX0NTQ19ERUZfQk9U
SCB8fCBjc2MgPT0gRFBfQ09NX0NPTkZfQ1NDX0RFRl9CRykKKwkJcmVnIHw9IERQX0NPTV9DT05G
X0NTQ19ERUZfQkc7CiAKIAlyZWcgJj0gfkRQX0NPTV9DT05GX0ZHX0VOOwogCXdyaXRlbChyZWcs
IGZsb3ctPmJhc2UgKyBEUF9DT01fQ09ORik7CkBAIC0zNTAsNiArMzU0LDggQEAgaW50IGlwdV9k
cF9pbml0KHN0cnVjdCBpcHVfc29jICppcHUsIHN0cnVjdCBkZXZpY2UgKmRldiwgdW5zaWduZWQg
bG9uZyBiYXNlKQogCW11dGV4X2luaXQoJnByaXYtPm11dGV4KTsKIAogCWZvciAoaSA9IDA7IGkg
PCBJUFVWM19OVU1fRkxPV1M7IGkrKykgeworCQlwcml2LT5mbG93W2ldLmJhY2tncm91bmQuaW5f
Y3MgPSBJUFVWM19DT0xPUlNQQUNFX1VOS05PV047CisJCXByaXYtPmZsb3dbaV0uZm9yZWdyb3Vu
ZC5pbl9jcyA9IElQVVYzX0NPTE9SU1BBQ0VfVU5LTk9XTjsKIAkJcHJpdi0+Zmxvd1tpXS5mb3Jl
Z3JvdW5kLmZvcmVncm91bmQgPSB0cnVlOwogCQlwcml2LT5mbG93W2ldLmJhc2UgPSBwcml2LT5i
YXNlICsgaXB1X2RwX2Zsb3dfYmFzZVtpXTsKIAkJcHJpdi0+Zmxvd1tpXS5wcml2ID0gcHJpdjsK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
