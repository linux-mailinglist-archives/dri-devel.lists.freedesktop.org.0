Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A19C816B13
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 21:18:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D1A6E83C;
	Tue,  7 May 2019 19:18:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF7B6E838;
 Tue,  7 May 2019 19:18:22 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 1F0E160E3E; Tue,  7 May 2019 19:18:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: jcrouse@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5B6F861344;
 Tue,  7 May 2019 19:18:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5B6F861344
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 3/3] drm/msm/adreno: Call pm_runtime_force_suspend() during
 unbind
Date: Tue,  7 May 2019 13:18:11 -0600
Message-Id: <1557256691-25798-4-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
References: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256702;
 bh=n+MGgOW7piyvsLsiVz/M/CyxjIEwd0g1M8E54rA5OVg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XG/3PAjd3WWpDHySxnHlAoJmdQ/JzF+lVfkHPu6yin5Aw/Rv6yS9jdBaY5LmfD1kn
 JPaJUAcKISSpQJqSCraF25qJCrzoPSJIA2DB8mE4+z8NG35O1dpKPjGcmCW3csir/F
 64SJASZYmCHovA74fKd+aoD3UGhkVAo7eT2BInFM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256700;
 bh=n+MGgOW7piyvsLsiVz/M/CyxjIEwd0g1M8E54rA5OVg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eFfbIWItF/1Ia0+70Hz48u0g8rIP3oXgcQpDfC6oBcWjbpdil1uo5O6RwQwydYh07
 pQ2Kr5Ni0EQl56N1vkSl6uYx9brD+FodCxLuBgQxLs9+8dyxL/LCufzJFdjQAKO9cT
 7XaYv2nAsslmO1lik9eirL/extk5jcKdrUhW+PY8=
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
Cc: Douglas Anderson <dianders@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Mamta Shukla <mamtashukla555@gmail.com>,
 Andy Gross <andy.gross@linaro.org>, Sean Paul <sean@poorly.run>,
 Daniel Mack <daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIEdQVSBzcGVjaWZpYyBwbV9zdXNwZW5kIGNvZGUgYXNzdW1lcyB0aGF0IHRoZSBoYXJkd2Fy
ZSBpcyBhY3RpdmUKd2hlbiB0aGUgZnVuY3Rpb24gaXMgY2FsbGVkLCB3aGljaCBpdCB1c3VhbGx5
IGlzIHdoZW4gY2FsbGVkIGFzIHBhcnQKb2YgcG1fcnVudGltZS4gIEJ1dCBkdXJpbmcgdW5iaW5k
LCB0aGUgcG1fc3VzcGVuZCBmdW5jdGlvbnMgYXJlIGNhbGxlZApibGluZGx5IHJlc3VsdGluZyBp
biBhIGJpdCBvZiBhIHdoZW4gdGhlIGhhcmR3YXJlIHdhc24ndCBhbHJlYWR5CmFjdGl2ZSAob3Ig
Ym9vdGVkLCBpbiB0aGUgY2FzZSBvZiB0aGUgR01VKS4KCkluc3RlYWQgb2YgY2FsbGluZyB0aGUg
cG1fc3VzcGVuZCBmdW5jdGlvbiBkaXJlY3RseSwgdXNlCnBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVu
ZCgpIHdoaWNoIHNob3VsZCBjaGVjayB0aGUgY29ycmVjdCBzdGF0ZSBvZgpydW50aW1lIGFuZCBj
YWxsIHRoZSBmdW5jdGlvbnMgb24gb3VyIGJlaGFsZiBvciBza2lwIHRoZW0gaWYgdGhleSBhcmUK
bm90IG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1
cm9yYS5vcmc+Ci0tLQoKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMgICAg
ICB8IDQgKy0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2RldmljZS5jIHwg
MiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ211LmMKaW5kZXggOTE1NWRhZi4uNDQ3NzA2ZCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9nbXUuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dtdS5jCkBAIC0xMjMwLDkgKzEyMzAsNyBA
QCB2b2lkIGE2eHhfZ211X3JlbW92ZShzdHJ1Y3QgYTZ4eF9ncHUgKmE2eHhfZ3B1KQogCWlmIChJ
U19FUlJfT1JfTlVMTChnbXUtPm1taW8pKQogCQlyZXR1cm47CiAKLQlhNnh4X2dtdV9zdG9wKGE2
eHhfZ3B1KTsKLQotCXBtX3J1bnRpbWVfZGlzYWJsZShnbXUtPmRldik7CisJcG1fcnVudGltZV9m
b3JjZV9zdXNwZW5kKGdtdS0+ZGV2KTsKIAogCWlmICghSVNfRVJSKGdtdS0+Z3hwZCkpIHsKIAkJ
cG1fcnVudGltZV9kaXNhYmxlKGdtdS0+Z3hwZCk7CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVu
by9hZHJlbm9fZGV2aWNlLmMKaW5kZXggYjkwNzI0NS4uM2RkOTBkZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2RldmljZS5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vYWRyZW5vL2FkcmVub19kZXZpY2UuYwpAQCAtMzUxLDcgKzM1MSw3IEBAIHN0YXRp
YyB2b2lkIGFkcmVub191bmJpbmQoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2aWNlICpt
YXN0ZXIsCiB7CiAJc3RydWN0IG1zbV9ncHUgKmdwdSA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwog
Ci0JZ3B1LT5mdW5jcy0+cG1fc3VzcGVuZChncHUpOworCXBtX3J1bnRpbWVfZm9yY2Vfc3VzcGVu
ZChkZXYpOwogCWdwdS0+ZnVuY3MtPmRlc3Ryb3koZ3B1KTsKIAogCXNldF9ncHVfcGRldihkZXZf
Z2V0X2RydmRhdGEobWFzdGVyKSwgTlVMTCk7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
