Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7673316FC
	for <lists+dri-devel@lfdr.de>; Sat,  1 Jun 2019 00:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB470899C4;
	Fri, 31 May 2019 22:09:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3961589AFF;
 Fri, 31 May 2019 22:09:53 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id DEE2E6087B; Fri, 31 May 2019 22:09:52 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 309D160712;
 Fri, 31 May 2019 22:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 309D160712
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/adreno: Ensure that the zap shader region is big
 enough
Date: Fri, 31 May 2019 16:09:38 -0600
Message-Id: <1559340578-11482-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559340592;
 bh=A8zDS66mjFwXp5YoMISUc0SPzfOMxvbFtRNcKwj+2ZY=;
 h=From:To:Cc:Subject:Date:From;
 b=VwKUnTRyzCqxrWkiGb0nFYnNp0wm94KgqBGzQk4TfAyOCZ36ziGZZ0gMxicjPhzO+
 2KsC16FM5D/6r20a5rRi9KZxlHq7gF3WuJyBeEo5rGCIpQ/uJBL0gNbFi/w50XG8TH
 r9fF4Y7PzjvU0LNwC8c3EhrCGiEun3FzjEvUAuuI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559340591;
 bh=A8zDS66mjFwXp5YoMISUc0SPzfOMxvbFtRNcKwj+2ZY=;
 h=From:To:Cc:Subject:Date:From;
 b=WU34CiZqbH7Vy5mC9Mv7jpghXfkOTCP5nHlG1N3qw1UyNTEcxajfVvALY+7S0xV6U
 lmGAXoHioCsmQXbl7xLpVEe5FChLTjOEoIpjQCjxEQsolowG/Yg1+5I9+xhPXh7OlA
 9ePXkP+nJfoc0SWBvx4sYPHFHPcEjJunrVYtF5tQ=
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
Cc: Douglas Anderson <dianders@chromium.org>, Kees Cook <keescook@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Sharat Masetty <smasetty@codeaurora.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, Mamta Shukla <mamtashukla555@gmail.com>,
 Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QmVmb3JlIGxvYWRpbmcgdGhlIHphcCBzaGFkZXIgd2Ugc2hvdWxkIGVuc3VyZSB0aGF0IHRoZSBy
ZXNlcnZlZCBtZW1vcnkKcmVnaW9uIGlzIGJpZyBlbm91Z2ggdG8gaG9sZCB0aGUgbG9hZGVkIGZp
bGUuCgpTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3Jn
PgotLS0KCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMgfCA4ICsrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jIGIvZHJpdmVy
cy9ncHUvZHJtL21zbS9hZHJlbm8vYWRyZW5vX2dwdS5jCmluZGV4IDZmN2Y0MTEuLjNkYjhlNDkg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2FkcmVub19ncHUuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZ3B1LmMKQEAgLTY3LDcgKzY3LDYg
QEAgc3RhdGljIGludCB6YXBfc2hhZGVyX2xvYWRfbWR0KHN0cnVjdCBtc21fZ3B1ICpncHUsIGNv
bnN0IGNoYXIgKmZ3bmFtZSwKIAkJcmV0dXJuIHJldDsKIAogCW1lbV9waHlzID0gci5zdGFydDsK
LQltZW1fc2l6ZSA9IHJlc291cmNlX3NpemUoJnIpOwogCiAJLyogUmVxdWVzdCB0aGUgTURUIGZp
bGUgZm9yIHRoZSBmaXJtd2FyZSAqLwogCWZ3ID0gYWRyZW5vX3JlcXVlc3RfZncodG9fYWRyZW5v
X2dwdShncHUpLCBmd25hbWUpOwpAQCAtODMsNiArODIsMTMgQEAgc3RhdGljIGludCB6YXBfc2hh
ZGVyX2xvYWRfbWR0KHN0cnVjdCBtc21fZ3B1ICpncHUsIGNvbnN0IGNoYXIgKmZ3bmFtZSwKIAkJ
Z290byBvdXQ7CiAJfQogCisJaWYgKG1lbV9zaXplID4gcmVzb3VyY2Vfc2l6ZSgmcikpIHsKKwkJ
RFJNX0RFVl9FUlJPUihkZXYsCisJCQkibWVtb3J5IHJlZ2lvbiBpcyB0b28gc21hbGwgdG8gbG9h
ZCB0aGUgTURUXG4iKTsKKwkJcmV0ID0gLUUyQklHOworCQlnb3RvIG91dDsKKwl9CisKIAkvKiBB
bGxvY2F0ZSBtZW1vcnkgZm9yIHRoZSBmaXJtd2FyZSBpbWFnZSAqLwogCW1lbV9yZWdpb24gPSBt
ZW1yZW1hcChtZW1fcGh5cywgbWVtX3NpemUsICBNRU1SRU1BUF9XQyk7CiAJaWYgKCFtZW1fcmVn
aW9uKSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVs
