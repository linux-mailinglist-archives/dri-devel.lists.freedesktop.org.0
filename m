Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EE2754B5
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jul 2019 18:54:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C666E79E;
	Thu, 25 Jul 2019 16:54:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9877C6E79C;
 Thu, 25 Jul 2019 16:54:02 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 7A38261847; Thu, 25 Jul 2019 16:54:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EE69F60C5F;
 Thu, 25 Jul 2019 16:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EE69F60C5F
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: Use generic bulk clock function
Date: Thu, 25 Jul 2019 10:53:55 -0600
Message-Id: <1564073635-27998-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1564073642;
 bh=JX5a4knX1zlE7Ic/SEaGbhWGGuYLtzUU8dSNGCasgeU=;
 h=From:To:Cc:Subject:Date:From;
 b=lz259GchXqS1PlLGI5Tr5CByuFTtOEcB70GJtw3nTxuq91DEGiJ5koBK0ftEy6wHz
 ukDb5r2vXaD7uHupgB8TqbPP5aEdI8958j3262+v2Dc+ScId9CUjQikEtySLIjPgEY
 UjmRYjULEyQyjQI+2nhc4IIc8odSrqiaDNT7fx7E=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1564073640;
 bh=JX5a4knX1zlE7Ic/SEaGbhWGGuYLtzUU8dSNGCasgeU=;
 h=From:To:Cc:Subject:Date:From;
 b=PXvWRxJgS3p+MdXTXy/lw/0oCGSwBg4JlcQBBGPozVMUNb8G8IppudngNpR/HrgF7
 bFpvpbsfYI7XEKQ5Usz9b9xdd+5AXOSDN9h0jN0sfU2Fd8KnHf7fZth7CH8PMnGrhC
 w1iOd3zB59X6JM+rE7iueb2Uzx/no19asKYVQZIQ=
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none)
 header.from=codeaurora.org
X-Mailman-Original-Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none
 smtp.mailfrom=jcrouse@codeaurora.org
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
Cc: Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Mamta Shukla <mamtashukla555@gmail.com>,
 Andy Gross <andy.gross@linaro.org>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVtb3ZlIHRoZSBob21lYnJld2VkIGJ1bGsgY2xvY2sgZ2V0IGZ1bmN0aW9uIGFuZCByZXBsYWNl
IGl0IHdpdGgKZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkuCgpTaWduZWQtb2ZmLWJ5OiBKb3JkYW4g
Q3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L2FkcmVuby9hNnh4X2dtdS5jIHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5j
ICAgICAgICAgfCA0MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZHJ2LmggICAgICAgICB8ICAxIC0KIGRyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dwdS5jICAgICAgICAgfCAgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDQzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E2eHhfZ211LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5j
CmluZGV4IDJjYTQ3MGUuLjg1ZjE0ZmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
YWRyZW5vL2E2eHhfZ211LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9n
bXUuYwpAQCAtMTE3Miw3ICsxMTcyLDcgQEAgc3RhdGljIGludCBhNnh4X2dtdV9wd3JsZXZlbHNf
cHJvYmUoc3RydWN0IGE2eHhfZ211ICpnbXUpCiAKIHN0YXRpYyBpbnQgYTZ4eF9nbXVfY2xvY2tz
X3Byb2JlKHN0cnVjdCBhNnh4X2dtdSAqZ211KQogewotCWludCByZXQgPSBtc21fY2xrX2J1bGtf
Z2V0KGdtdS0+ZGV2LCAmZ211LT5jbG9ja3MpOworCWludCByZXQgPSBkZXZtX2Nsa19idWxrX2dl
dF9hbGwoZ211LT5kZXYsICZnbXUtPmNsb2Nrcyk7CiAKIAlpZiAocmV0IDwgMSkKIAkJcmV0dXJu
IHJldDsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKaW5kZXggMGUwZmNhMS4uOTZmZTI0YyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZHJ2LmMKQEAgLTc1LDQ2ICs3NSw2IEBAIG1vZHVsZV9wYXJhbShtb2Rlc2V0LCBib29s
LCAwNjAwKTsKICAqIFV0aWwvaGVscGVyczoKICAqLwogCi1pbnQgbXNtX2Nsa19idWxrX2dldChz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBjbGtfYnVsa19kYXRhICoqYnVsaykKLXsKLQlzdHJ1
Y3QgcHJvcGVydHkgKnByb3A7Ci0JY29uc3QgY2hhciAqbmFtZTsKLQlzdHJ1Y3QgY2xrX2J1bGtf
ZGF0YSAqbG9jYWw7Ci0JaW50IGkgPSAwLCByZXQsIGNvdW50OwotCi0JY291bnQgPSBvZl9wcm9w
ZXJ0eV9jb3VudF9zdHJpbmdzKGRldi0+b2Zfbm9kZSwgImNsb2NrLW5hbWVzIik7Ci0JaWYgKGNv
dW50IDwgMSkKLQkJcmV0dXJuIDA7Ci0KLQlsb2NhbCA9IGRldm1fa2NhbGxvYyhkZXYsIHNpemVv
ZihzdHJ1Y3QgY2xrX2J1bGtfZGF0YSAqKSwKLQkJY291bnQsIEdGUF9LRVJORUwpOwotCWlmICgh
bG9jYWwpCi0JCXJldHVybiAtRU5PTUVNOwotCi0Jb2ZfcHJvcGVydHlfZm9yX2VhY2hfc3RyaW5n
KGRldi0+b2Zfbm9kZSwgImNsb2NrLW5hbWVzIiwgcHJvcCwgbmFtZSkgewotCQlsb2NhbFtpXS5p
ZCA9IGRldm1fa3N0cmR1cChkZXYsIG5hbWUsIEdGUF9LRVJORUwpOwotCQlpZiAoIWxvY2FsW2ld
LmlkKSB7Ci0JCQlkZXZtX2tmcmVlKGRldiwgbG9jYWwpOwotCQkJcmV0dXJuIC1FTk9NRU07Ci0J
CX0KLQotCQlpKys7Ci0JfQotCi0JcmV0ID0gZGV2bV9jbGtfYnVsa19nZXQoZGV2LCBjb3VudCwg
bG9jYWwpOwotCi0JaWYgKHJldCkgewotCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7IGkrKykKLQkJ
CWRldm1fa2ZyZWUoZGV2LCAodm9pZCAqKSBsb2NhbFtpXS5pZCk7Ci0JCWRldm1fa2ZyZWUoZGV2
LCBsb2NhbCk7Ci0KLQkJcmV0dXJuIHJldDsKLQl9Ci0KLQkqYnVsayA9IGxvY2FsOwotCXJldHVy
biBjb3VudDsKLX0KLQogc3RydWN0IGNsayAqbXNtX2Nsa19idWxrX2dldF9jbG9jayhzdHJ1Y3Qg
Y2xrX2J1bGtfZGF0YSAqYnVsaywgaW50IGNvdW50LAogCQljb25zdCBjaGFyICpuYW1lKQogewpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmggYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL21zbV9kcnYuaAppbmRleCBlZTdiNTEyLi44NDNjNjhmIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9k
cnYuaApAQCAtMzk5LDcgKzM5OSw2IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBtc21fcGVyZl9kZWJ1
Z2ZzX2NsZWFudXAoc3RydWN0IG1zbV9kcm1fcHJpdmF0ZSAqcHJpdikge30KICNlbmRpZgogCiBz
dHJ1Y3QgY2xrICptc21fY2xrX2dldChzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LCBjb25z
dCBjaGFyICpuYW1lKTsKLWludCBtc21fY2xrX2J1bGtfZ2V0KHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGNsa19idWxrX2RhdGEgKipidWxrKTsKIAogc3RydWN0IGNsayAqbXNtX2Nsa19idWxr
X2dldF9jbG9jayhzdHJ1Y3QgY2xrX2J1bGtfZGF0YSAqYnVsaywgaW50IGNvdW50LAogCWNvbnN0
IGNoYXIgKm5hbWUpOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ3B1LmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHUuYwppbmRleCA0ZWRiODc0Li40NDVhOWY4IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9ncHUuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL21zbV9ncHUuYwpAQCAtNzgzLDcgKzc4Myw3IEBAIHN0YXRpYyBpcnFyZXR1cm5f
dCBpcnFfaGFuZGxlcihpbnQgaXJxLCB2b2lkICpkYXRhKQogCiBzdGF0aWMgaW50IGdldF9jbG9j
a3Moc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldiwgc3RydWN0IG1zbV9ncHUgKmdwdSkKIHsK
LQlpbnQgcmV0ID0gbXNtX2Nsa19idWxrX2dldCgmcGRldi0+ZGV2LCAmZ3B1LT5ncnBfY2xrcyk7
CisJaW50IHJldCA9IGRldm1fY2xrX2J1bGtfZ2V0X2FsbCgmcGRldi0+ZGV2LCAmZ3B1LT5ncnBf
Y2xrcyk7CiAKIAlpZiAocmV0IDwgMSkgewogCQlncHUtPm5yX2Nsb2NrcyA9IDA7Ci0tIAoyLjcu
NAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRl
dmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
