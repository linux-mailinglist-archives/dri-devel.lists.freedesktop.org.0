Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B84C6169CA
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 20:02:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0B86E81D;
	Tue,  7 May 2019 18:02:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1692D6E81C;
 Tue,  7 May 2019 18:02:14 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id EBCEE61112; Tue,  7 May 2019 18:02:13 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 114AA60DAD;
 Tue,  7 May 2019 18:02:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 114AA60DAD
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v1 1/3] drm/msm/adreno: Enable 64 bit mode by default on a5xx
 and a6xx targets
Date: Tue,  7 May 2019 12:02:05 -0600
Message-Id: <1557252127-11145-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
References: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557252133;
 bh=pjkVWARAqKP7vHKxiyE4bt0dBqxi+Cc/OVI3xxslFqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jGIxGpOG+cGxzMqQfaK5QvwvQBLi5SKctnW9Fb9fQ/dKgcdTLzQ0HNVTl4uYzCzhP
 shmUohuhtyLV13HnynC00c5xgkz0hnizgeCDkTy86eomkJL/fMCDEF0Y1WP6Q4prpO
 GDsn13/AxAIx593v8PuwQaRsC20Iu849/vNMkkgQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557252133;
 bh=pjkVWARAqKP7vHKxiyE4bt0dBqxi+Cc/OVI3xxslFqI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jGIxGpOG+cGxzMqQfaK5QvwvQBLi5SKctnW9Fb9fQ/dKgcdTLzQ0HNVTl4uYzCzhP
 shmUohuhtyLV13HnynC00c5xgkz0hnizgeCDkTy86eomkJL/fMCDEF0Y1WP6Q4prpO
 GDsn13/AxAIx593v8PuwQaRsC20Iu849/vNMkkgQ=
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
Cc: Kees Cook <keescook@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mamta Shukla <mamtashukla555@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>,
 Wen Yang <wen.yang99@zte.com.cn>
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
ZXBhcmUKZm9yIHVzaW5nIGFkZHJlc3NlcyBhYm92ZSA0RyBvbiB0YXJnZXRzIHRoYXQgc3VwcG9y
dCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3Jh
Lm9yZz4KLS0tCgogZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYyB8IDE0ICsr
KysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jIHwgMTQg
KysrKysrKysrKysrKysKIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5jCmluZGV4IGU1ZmNlZmEuLjQzYTJiNGEgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E1eHhfZ3B1LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTV4eF9ncHUuYwpAQCAtNjQyLDYgKzY0MiwyMCBAQCBzdGF0
aWMgaW50IGE1eHhfaHdfaW5pdChzdHJ1Y3QgbXNtX2dwdSAqZ3B1KQogCQlSRUdfQTVYWF9SQkJN
X1NFQ1ZJRF9UU0JfVFJVU1RFRF9CQVNFX0hJLCAweDAwMDAwMDAwKTsKIAlncHVfd3JpdGUoZ3B1
LCBSRUdfQTVYWF9SQkJNX1NFQ1ZJRF9UU0JfVFJVU1RFRF9TSVpFLCAweDAwMDAwMDAwKTsKIAor
CS8qIFB1dCB0aGUgR1BVIGludG8gNjQgYml0IGJ5IGRlZmF1bHQgKi8KKwlncHVfd3JpdGUoZ3B1
LCBSRUdfQTVYWF9DUF9BRERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdf
QTVYWF9WU0NfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E1WFhf
R1JBU19BRERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTVYWF9SQl9B
RERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTVYWF9QQ19BRERSX01P
REVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTVYWF9ITFNRX0FERFJfTU9ERV9D
TlRMLCAweDEpOworCWdwdV93cml0ZShncHUsIFJFR19BNVhYX1ZGRF9BRERSX01PREVfQ05UTCwg
MHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTVYWF9WUENfQUREUl9NT0RFX0NOVEwsIDB4MSk7
CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E1WFhfVUNIRV9BRERSX01PREVfQ05UTCwgMHgxKTsKKwln
cHVfd3JpdGUoZ3B1LCBSRUdfQTVYWF9TUF9BRERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3Jp
dGUoZ3B1LCBSRUdfQTVYWF9UUEwxX0FERFJfTU9ERV9DTlRMLCAweDEpOworCWdwdV93cml0ZShn
cHUsIFJFR19BNVhYX1JCQk1fU0VDVklEX1RTQl9BRERSX01PREVfQ05UTCwgMHgxKTsKKwogCXJl
dCA9IGFkcmVub19od19pbml0KGdwdSk7CiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMgYi9kcml2ZXJzL2dw
dS9kcm0vbXNtL2FkcmVuby9hNnh4X2dwdS5jCmluZGV4IGVjMjQ1MDguLjM2MGMwNzAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1LmMKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYTZ4eF9ncHUuYwpAQCAtMzkxLDYgKzM5MSwyMCBAQCBzdGF0
aWMgaW50IGE2eHhfaHdfaW5pdChzdHJ1Y3QgbXNtX2dwdSAqZ3B1KQogCQlSRUdfQTZYWF9SQkJN
X1NFQ1ZJRF9UU0JfVFJVU1RFRF9CQVNFX0hJLCAweDAwMDAwMDAwKTsKIAlncHVfd3JpdGUoZ3B1
LCBSRUdfQTZYWF9SQkJNX1NFQ1ZJRF9UU0JfVFJVU1RFRF9TSVpFLCAweDAwMDAwMDAwKTsKIAor
CS8qIFR1cm4gb24gNjQgYml0IGFkZHJlc3NpbmcgZm9yIGFsbCBibG9ja3MgKi8KKwlncHVfd3Jp
dGUoZ3B1LCBSRUdfQTZYWF9DUF9BRERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1
LCBSRUdfQTZYWF9WU0NfQUREUl9NT0RFX0NOVEwsIDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVH
X0E2WFhfR1JBU19BRERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTZY
WF9SQl9BRERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTZYWF9QQ19B
RERSX01PREVfQ05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTZYWF9ITFNRX0FERFJf
TU9ERV9DTlRMLCAweDEpOworCWdwdV93cml0ZShncHUsIFJFR19BNlhYX1ZGRF9BRERSX01PREVf
Q05UTCwgMHgxKTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTZYWF9WUENfQUREUl9NT0RFX0NOVEws
IDB4MSk7CisJZ3B1X3dyaXRlKGdwdSwgUkVHX0E2WFhfVUNIRV9BRERSX01PREVfQ05UTCwgMHgx
KTsKKwlncHVfd3JpdGUoZ3B1LCBSRUdfQTZYWF9TUF9BRERSX01PREVfQ05UTCwgMHgxKTsKKwln
cHVfd3JpdGUoZ3B1LCBSRUdfQTZYWF9UUEwxX0FERFJfTU9ERV9DTlRMLCAweDEpOworCWdwdV93
cml0ZShncHUsIFJFR19BNlhYX1JCQk1fU0VDVklEX1RTQl9BRERSX01PREVfQ05UTCwgMHgxKTsK
KwogCS8qIGVuYWJsZSBoYXJkd2FyZSBjbG9ja2dhdGluZyAqLwogCWE2eHhfc2V0X2h3Y2coZ3B1
LCB0cnVlKTsKIAotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
