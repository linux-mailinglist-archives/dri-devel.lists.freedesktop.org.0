Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE9E16B0D
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 21:18:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A9E26E832;
	Tue,  7 May 2019 19:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001946E82D;
 Tue,  7 May 2019 19:18:17 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id D3B84611BE; Tue,  7 May 2019 19:18:17 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3544B61112;
 Tue,  7 May 2019 19:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3544B61112
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: Handle component bind failures a bit better
Date: Tue,  7 May 2019 13:18:08 -0600
Message-Id: <1557256691-25798-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256697;
 bh=D9Kd2zxAWJ5KTUC7BKdUtpmmcLWPJaFJ8dfoo6VXoG8=;
 h=From:To:Cc:Subject:Date:From;
 b=DakORPlYuaZKmQjO+kxM5s/lNWxbM499Lkw20ZDGpxjNVZ3y6PDF8vw9oA/O7IYQR
 CP/d6YI/9rn8OPubpzluMcSIP9KOc2mfbBeGSBsjmOkkovTylMD1TiMEpw6UBDSx3a
 /OAC8kwl3Ak9zf49CHXmREFdmgd32eSiGqxk8ccY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557256696;
 bh=D9Kd2zxAWJ5KTUC7BKdUtpmmcLWPJaFJ8dfoo6VXoG8=;
 h=From:To:Cc:Subject:Date:From;
 b=nSsbEPNT5XMJGYCYYKzFXWHkzfqZ1e+RCuNqOK+sg2rrZt4hD1XDRJ8mqwbnwnYpz
 vhRm2Livl9+PVbmp2kOJrlF+VyWmwUJlQ4v2mfcfhvhJ7qglf2gvEh5cRb/sSSOQQq
 5scjGJ84IOp+15GOlKd+lRKNApENzcy/5XreDRTw=
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
Cc: Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 linux-kernel@vger.kernel.org, Rajesh Yadav <ryadav@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Bruce Wang <bzwang@chromium.org>,
 Mamta Shukla <mamtashukla555@gmail.com>, Daniel Mack <daniel@zonque.org>,
 Andy Gross <andy.gross@linaro.org>, Sean Paul <sean@poorly.run>,
 Chandan Uddaraju <chandanu@codeaurora.org>, Kees Cook <keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SSBzb21ld2hhdCBhY2NpZGVudGx5IGluamVjdGVkIGFuIGVycm9yIGluIHRoZSBEUFUgS01TIGlu
aXQgdGhhdCBjYXVzZWQgaXQgdG8KZmFpbCBhbmQgYSBoYW5kZnVsIG9mIE5VTEwgZGVmZXJlbmNl
cyBhbmQgZXJyb3JzIGVuZGVkIHVwIHBvcHBpbmcgb3V0LiBIZXJlIGFyZQpzb21lIGZpeGVzIGlu
IHRoZSBpbnRlcmVzdCBvZiByb2J1c3RuZXNzLgoKSm9yZGFuIENyb3VzZSAoMyk6CiAgZHJtL21z
bS9kcHU6IEZpeCBlcnJvciByZWNvdmVyeSBhZnRlciBmYWlsaW5nIHRvIGVuYWJsZSBjbG9ja3MK
ICBkcm0vbXNtL2RwdTogQXZvaWQgYSBudWxsIGRlLXJlZiB3aGlsZSByZWNvdmVyaW5nIGZyb20g
a21zIGluaXQgZmFpbAogIGRybS9tc20vYWRyZW5vOiBDYWxsIHBtX3J1bnRpbWVfZm9yY2Vfc3Vz
cGVuZCgpIGR1cmluZyB1bmJpbmQKCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNnh4X2dt
dS5jICAgICAgIHwgNCArLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hZHJlbm9fZGV2
aWNlLmMgIHwgMiArLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2lvX3V0aWwu
YyB8IDYgKysrLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmMgICAg
IHwgOSArKysrKystLS0KIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTAgZGVs
ZXRpb25zKC0pCgotLSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbA==
