Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A304116B10
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 21:18:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF17E6E837;
	Tue,  7 May 2019 19:18:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D2506E833;
 Tue,  7 May 2019 19:18:20 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 44D8361213; Tue,  7 May 2019 19:18:18 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5FC3061194;
 Tue,  7 May 2019 19:18:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5FC3061194
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 1/3] drm/msm/dpu: Fix error recovery after failing to enable
 clocks
Date: Tue,  7 May 2019 13:18:09 -0600
Message-Id: <1557256691-25798-2-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
References: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256700;
 bh=Q/mJwJuOJwy/EQv6iKT7QRDV1FjoviOEpC04L2Tcpzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GXGiQMyi7VKPoUwP62hypwZmvvamlOKhee6AdOv780rokWrsitM7mxaIZXwKZy1f0
 R6/nB26BT9oJVOfnvKVlXVn3ZveLUBidWJkTSdIrfda0vQ0TlgWvUabI9CffJp6DWy
 IDSCox2rZ5OWTPaIztGctxB5FixiwE/zNa7F2OME=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256697;
 bh=Q/mJwJuOJwy/EQv6iKT7QRDV1FjoviOEpC04L2Tcpzk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eF8zL64FNZTGzDK9ZVMecOUGA2iNRn2Jc8k37M/rPgQq742AAsyBP6rCz7puQVNAY
 TYI1gGniTkn5FVCIzdmk0WaxThd4R+ipmv+dfqGdm+ihRkyWhUsp+WKM2NxtyOwsbq
 nXzAjIFCB1ZgUal4J6Ct1Er17YcC8QJnthfZL4Rw=
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
Cc: Kees Cook <keescook@chromium.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Mamta Shukla <mamtashukla555@gmail.com>, Sean Paul <sean@poorly.run>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Rajesh Yadav <ryadav@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgZW5hYmxpbmcgY2xvY2tzIGZhaWxzIGluIG1zbV9kc3NfZW5hYmxlX2NsaygpIHRoZSBjb2Rl
IHRvIHVud2luZCB0aGUKc2V0dGluZ3Mgc3RhcnRzIGF0ICdpJyB3aGljaCBpcyB0aGUgY2xvY2sg
dGhhdCBqdXN0IGZhaWxlZC4gV2hpbGUgdGhpcwppc24ndCBoYXJtZnVsIGl0IGRvZXMgcmVzdWx0
IGluIGEgbnVtYmVyIG9mIHdhcm5pbmdzIGZyb20gdGhlIGNsb2NrCnN1YnN5c3RlbSB3aGlsZSB0
cnlpbmcgdG8gdW5wcmVhcmUvZGlzYWJsZSB0aGUgdmVyeSBjbG9jayB0aGF0IGhhZApqdXN0IGZh
aWxlZCB0byBwcmVwYXJlL2VuYWJsZS4gU2tpcCB0aGUgY3VycmVudCBmYWlsZWQgY2xvY2sgZHVy
aW5nCnRoZSB1bndpbmQgdG8gdG8gYXZvaWQgdGhlIGV4dHJhIGxvZyBzcGV3LgoKU2lnbmVkLW9m
Zi1ieTogSm9yZGFuIENyb3VzZSA8amNyb3VzZUBjb2RlYXVyb3JhLm9yZz4KLS0tCgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYyB8IDYgKysrLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9pb191dGlsLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbXNtL2Rpc3AvZHB1MS9kcHVfaW9fdXRpbC5jCmluZGV4IDc4ODMzYzIuLmE0MGE2MzAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9pb191dGlsLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwuYwpAQCAtMTE0LDkg
KzExNCw5IEBAIGludCBtc21fZHNzX2VuYWJsZV9jbGsoc3RydWN0IGRzc19jbGsgKmNsa19hcnJ5
LCBpbnQgbnVtX2NsaywgaW50IGVuYWJsZSkKIAkJCQlyYyA9IC1FUEVSTTsKIAkJCX0KIAotCQkJ
aWYgKHJjKSB7Ci0JCQkJbXNtX2Rzc19lbmFibGVfY2xrKCZjbGtfYXJyeVtpXSwKLQkJCQkJaSwg
ZmFsc2UpOworCQkJaWYgKHJjICYmIGkpIHsKKwkJCQltc21fZHNzX2VuYWJsZV9jbGsoJmNsa19h
cnJ5W2kgLSAxXSwKKwkJCQkJaSAtIDEsIGZhbHNlKTsKIAkJCQlicmVhazsKIAkJCX0KIAkJfQot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
