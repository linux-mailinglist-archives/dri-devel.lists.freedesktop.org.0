Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD482E6C7
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 22:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681596E126;
	Wed, 29 May 2019 20:56:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B856E112;
 Wed, 29 May 2019 20:56:10 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 2A26861A6E; Wed, 29 May 2019 20:55:52 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7EAD460A63;
 Wed, 29 May 2019 20:55:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7EAD460A63
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v3 14/16] drm/msm/gpu: Add ttbr0 to the memptrs
Date: Wed, 29 May 2019 14:54:50 -0600
Message-Id: <1559163292-4792-15-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
References: <1559163292-4792-1-git-send-email-jcrouse@codeaurora.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163370;
 bh=Q7ZQd878jM/ppuJ4uNWWJeXdoWzwLS/xcQibVXy6ISg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bppks+EHwpORbMGwjz8o2TcTwSvxOBtYLm/5uE7M/D50QSlqKl03gdZNaKa5xBNWv
 hzsbK0+aV1Es8o4xIgTBPfGMPf3wk367l62PnUC6wlTafmadCx0uNdQ712PnMfOQhq
 8Av7RJLl1gTkhupDu3yIvjRDxCkM3l+A1n3Lklcw=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1559163351;
 bh=Q7ZQd878jM/ppuJ4uNWWJeXdoWzwLS/xcQibVXy6ISg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M2LzsUiEUpDhY8rHCdeqFQfHqXLFLPZdacqRZUXosKTXQTfzq5KShaUFbm1wW4qQn
 40kWnbOGOvRIHp7Gp4FTcfbqjJM2Q4mdBpTAIAtYELW1ZbcY8Wo8WivQ0hEnzih6RA
 0/QkDy4mNnOgEuNQzl2lUaH+cTbza0a1N23OSomg=
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
Cc: jean-philippe.brucker@arm.com, linux-arm-msm@vger.kernel.org,
 dianders@chromium.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 hoegsberg@google.com, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGFyZ2V0cyB0aGF0IHN1cHBvcnQgcGVyLWluc3RhbmNlIHBhZ2V0YWJsZSBzd2l0Y2hpbmcgd2ls
bCBoYXZlIHRvIGtlZXAKdHJhY2sgb2Ygd2hpY2ggcGFnZXRhYmxlIGJlbG9uZ3MgdG8gZWFjaCBp
bnN0YW5jZSB0byBiZSBhYmxlIHRvIHJlY292ZXIKZm9yIHByZWVtcHRpb24uCgpTaWduZWQtb2Zm
LWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEub3JnPgotLS0KCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9yaW5nYnVmZmVyLmggfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3JpbmdidWZm
ZXIuaCBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3JpbmdidWZmZXIuaAppbmRleCA2NDM0ZWJi
Li40OTNmYTg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9yaW5nYnVmZmVy
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fcmluZ2J1ZmZlci5oCkBAIC00MCw2ICs0
MCw3IEBAIHN0cnVjdCBtc21fZ3B1X3N1Ym1pdF9zdGF0cyB7CiBzdHJ1Y3QgbXNtX3JibWVtcHRy
cyB7CiAJdm9sYXRpbGUgdWludDMyX3QgcnB0cjsKIAl2b2xhdGlsZSB1aW50MzJfdCBmZW5jZTsK
Kwl2b2xhdGlsZSB1aW50NjRfdCB0dGJyMDsKIAogCXZvbGF0aWxlIHN0cnVjdCBtc21fZ3B1X3N1
Ym1pdF9zdGF0cyBzdGF0c1tNU01fR1BVX1NVQk1JVF9TVEFUU19DT1VOVF07CiB9OwotLSAKMi43
LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
