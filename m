Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1883A25523
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2019 18:14:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA10B8940F;
	Tue, 21 May 2019 16:14:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C47CC893EF;
 Tue, 21 May 2019 16:14:24 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 545B26141D; Tue, 21 May 2019 16:14:20 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 60FA76141D;
 Tue, 21 May 2019 16:14:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 60FA76141D
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v2 06/15] drm/msm/adreno: Enable 64 bit mode by default on
 a5xx and a6xx targets
Date: Tue, 21 May 2019 10:13:54 -0600
Message-Id: <1558455243-32746-7-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
References: <1558455243-32746-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558455264;
 bh=InvGDxgPTCcUkHbRKTYeQI7IV+iw8V8b8P4fscHa9hU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mbJ1EIH+vr9feQmAsYPpeYARHWIsv/BGU5sHU4KSH0qsLW8H0M6EmZBf9QXhc25X8
 4KbMNsTVQpQfU68yeYYszcGaujHKD3C49ByAr8pWLQh01iixLqGdRzBFGH3NgW5B0S
 mdQR7wQofuyuLkOFHeVuNEqvjqve7VH5m5k+h4a0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1558455258;
 bh=InvGDxgPTCcUkHbRKTYeQI7IV+iw8V8b8P4fscHa9hU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=USxml1cFYuyAi0WA8NIolqwyyDN1icihVZyjrOSALF/3iIJbVVWPTePugVv7Hl7Yn
 pe6ufZZ7EH2PTyLWfHR+lFSXCW1N1cJhNT2h80EfDJPjOfQlYgYzboyrDJ8LP+ePc6
 gcDyFo8Ri0jFiArioVbnlEh7uJzI3OmORMk3RZEU=
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
Cc: Kees Cook <keescook@chromium.org>, jean-philippe.brucker@arm.com,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 hoegsberg@google.com, Mamta Shukla <mamtashukla555@gmail.com>,
 Sean Paul <sean@poorly.run>, Wen Yang <wen.yang99@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QTVYWCBhbmQgbmV3ZXIgR1BVcyBjYW4gYmUgcnVuIGluIGVpdGhlciAzMiBvciA2NCBiaXQgbW9k
ZS4gVGhlIEdQVQpyZWdpc3RlcnMgYW5kIHRoZSBtaWNyb2NvZGUgdXNlIDY0IGJpdCB2aXJ0dWFs
IGFkZHJlc3NpbmcgaW4gZWl0aGVyCmNhc2UgYnV0IHRoZSB1cHBlciAzMiBiaXRzIGFyZSBpZ25v
cmVkIGlmIHRoZSBHUFUgaXMgaW4gMzIgYml0IG1vZGUuClRoZXJlIGlzIG5vIHBlcmZvcm1hbmNl
IGRpc2FkdmFudGFnZSB0byByZW1haW5pbmcgaW4gNjQgYml0IG1vZGUgZXZlbgppZiB3ZSBhcmUg
b25seSBnZW5lcmF0aW5nIDMyIGJpdCBhZGRyZXNzZXMgc28gc3dpdGNoIG92ZXIgbm93IHRvIHBy
ZXBhcmUKZm9yIHVzaW5nIGFkZHJlc3NlcyBhYm92ZSA0RyBmb3IgdGFyZ2V0cyB0aGF0IHN1cHBv
cnQgdGhlbS4KClNpZ25lZC1vZmYtYnk6IEpvcmRhbiBDcm91c2UgPGpjcm91c2VAY29kZWF1cm9y
YS5vcmc+Ci0tLQoKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgfCAxNCAr
KysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYyB8IDE0
ICsrKysrKysrKysrKysrCiAyIGZpbGVzIGNoYW5nZWQsIDI4IGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYwppbmRleCBlNWZjZWZhLi40M2EyYjRhIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMKQEAgLTY0Miw2ICs2NDIsMjAgQEAgc3Rh
dGljIGludCBhNXh4X2h3X2luaXQoc3RydWN0IG1zbV9ncHUgKmdwdSkKIAkJUkVHX0E1WFhfUkJC
TV9TRUNWSURfVFNCX1RSVVNURURfQkFTRV9ISSwgMHgwMDAwMDAwMCk7CiAJZ3B1X3dyaXRlKGdw
dSwgUkVHX0E1WFhfUkJCTV9TRUNWSURfVFNCX1RSVVNURURfU0laRSwgMHgwMDAwMDAwMCk7CiAK
KwkvKiBQdXQgdGhlIEdQVSBpbnRvIDY0IGJpdCBieSBkZWZhdWx0ICovCisJZ3B1X3dyaXRlKGdw
dSwgUkVHX0E1WFhfQ1BfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVH
X0E1WFhfVlNDX0FERFJfTU9ERV9DTlRMLCAweDEpOworCWdwdV93cml0ZShncHUsIFJFR19BNVhY
X0dSQVNfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E1WFhfUkJf
QUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E1WFhfUENfQUREUl9N
T0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E1WFhfSExTUV9BRERSX01PREVf
Q05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTVYWF9WRkRfQUREUl9NT0RFX0NOVEws
IDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E1WFhfVlBDX0FERFJfTU9ERV9DTlRMLCAweDEp
OworCWdwdV93cml0ZShncHUsIFJFR19BNVhYX1VDSEVfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJ
Z3B1X3dyaXRlKGdwdSwgUkVHX0E1WFhfU1BfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dy
aXRlKGdwdSwgUkVHX0E1WFhfVFBMMV9BRERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUo
Z3B1LCBSRUdfQTVYWF9SQkJNX1NFQ1ZJRF9UU0JfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisKIAly
ZXQgPSBhZHJlbm9faHdfaW5pdChncHUpOwogCWlmIChyZXQpCiAJCXJldHVybiByZXQ7CmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jIGIvZHJpdmVycy9n
cHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYwppbmRleCBlNzRkY2U0Li4wYjBkY2Q3IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKQEAgLTM5MSw2ICszOTEsMjAgQEAgc3Rh
dGljIGludCBhNnh4X2h3X2luaXQoc3RydWN0IG1zbV9ncHUgKmdwdSkKIAkJUkVHX0E2WFhfUkJC
TV9TRUNWSURfVFNCX1RSVVNURURfQkFTRV9ISSwgMHgwMDAwMDAwMCk7CiAJZ3B1X3dyaXRlKGdw
dSwgUkVHX0E2WFhfUkJCTV9TRUNWSURfVFNCX1RSVVNURURfU0laRSwgMHgwMDAwMDAwMCk7CiAK
KwkvKiBUdXJuIG9uIDY0IGJpdCBhZGRyZXNzaW5nIGZvciBhbGwgYmxvY2tzICovCisJZ3B1X3dy
aXRlKGdwdSwgUkVHX0E2WFhfQ1BfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdw
dSwgUkVHX0E2WFhfVlNDX0FERFJfTU9ERV9DTlRMLCAweDEpOworCWdwdV93cml0ZShncHUsIFJF
R19BNlhYX0dSQVNfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E2
WFhfUkJfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E2WFhfUENf
QUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E2WFhfSExTUV9BRERS
X01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTZYWF9WRkRfQUREUl9NT0RF
X0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E2WFhfVlBDX0FERFJfTU9ERV9DTlRM
LCAweDEpOworCWdwdV93cml0ZShncHUsIFJFR19BNlhYX1VDSEVfQUREUl9NT0RFX0NOVEwsIDB4
MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E2WFhfU1BfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJ
Z3B1X3dyaXRlKGdwdSwgUkVHX0E2WFhfVFBMMV9BRERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVf
d3JpdGUoZ3B1LCBSRUdfQTZYWF9SQkJNX1NFQ1ZJRF9UU0JfQUREUl9NT0RFX0NOVEwsIDB4MSk7
CisKIAkvKiBlbmFibGUgaGFyZHdhcmUgY2xvY2tnYXRpbmcgKi8KIAlhNnh4X3NldF9od2NnKGdw
dSwgdHJ1ZSk7CiAKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
