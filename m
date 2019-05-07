Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8679D169C4
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 20:02:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71B976E817;
	Tue,  7 May 2019 18:02:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.codeaurora.org (smtp.codeaurora.org [198.145.29.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69F626E816;
 Tue,  7 May 2019 18:02:12 +0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 376A060DB6; Tue,  7 May 2019 18:02:12 +0000 (UTC)
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
 by smtp.codeaurora.org (Postfix) with ESMTPSA id CC1E160AA2;
 Tue,  7 May 2019 18:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CC1E160AA2
From: Jordan Crouse <jcrouse@codeaurora.org>
To: freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/3] drm/msm: Add dependencies for per-instance pagetables
Date: Tue,  7 May 2019 12:02:04 -0600
Message-Id: <1557252127-11145-1-git-send-email-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.7.4
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557252132;
 bh=IwYIMrt5BrwMIHRzEOkGLNPJlO73nFmvHWeK/JO4d/s=;
 h=From:To:Cc:Subject:Date:From;
 b=QBeSyFd/GACWJ2aoNE+BdSSYjZBpiaYyDANObPD7yH6hLnk+aAPatvi8mP3cbD5YE
 GPzdna/xD272+Yum0HqB4PzydyokWvn9YzGV2HqVHoh2yjJdIfKJ43Mw2QI8sogoiI
 YMSff5B7zgmV9eMtiwqycUb/wqwjOmQBD86DrAMU=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=codeaurora.org; s=default; t=1557252131;
 bh=IwYIMrt5BrwMIHRzEOkGLNPJlO73nFmvHWeK/JO4d/s=;
 h=From:To:Cc:Subject:Date:From;
 b=G7FGJSz6bupthIf01bH+AJFT1hYJBsDeNPZZZJcPjmVdtyaL8XZVcpyr06moNdWsf
 DGq9yAQlvcVQatfj4u+GG1raCB1ItDHmHBhvUx2n/FWSeRUawr9fMXI8pcQuZXKSER
 NJ37ZPFlrqyKfLVLD3SVyAZ63ZmyVrgR2qsbS6/0=
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

VGhlc2UgYXJlIGEgZmV3IHN1cHBvcnQgY2hhbmdlcyBpbiBhZHZhbmNlIG9mIHBlci1pbnN0YW5j
ZSBwYWdldGFibGVzLiBUaGVzZQpjYW4gYmUgYWRkZWQgdG8gbXNtLW5leHQgaW1tZWRpYXRlbHkg
c2luY2UgdGhleSBkb24ndCByZXF1aXJlIGFueXRoaW5nIGV4dGVybmFsCnN1cHBvcnQgYW5kIHRo
ZXkgYXJlIG1vc3RseSBiZW5pZ24gb24gdGhlaXIgb3duIHdpdGhvdXQgdGhlIG1vcmUgYWdncmVz
c2l2ZQpjaGFuZ2VzIGNvbWluZyB1cCBsYXRlci4KCkpvcmRhbiBDcm91c2UgKDMpOgogIGRybS9t
c20vYWRyZW5vOiBFbmFibGUgNjQgYml0IG1vZGUgYnkgZGVmYXVsdCBvbiBhNXh4IGFuZCBhNnh4
IHRhcmdldHMKICBkcm0vbXNtOiBQcmludCBhbGwgNjQgYml0cyBvZiB0aGUgZmF1bHRpbmcgSU9N
TVUgYWRkcmVzcwogIGRybS9tc206IFBhc3MgdGhlIE1NVSBkb21haW4gaW5kZXggaW4gc3RydWN0
IG1zbV9maWxlX3ByaXZhdGUKCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2FkcmVuby9hNXh4X2dwdS5j
IHwgMTQgKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9tc20vYWRyZW5vL2E2eHhfZ3B1
LmMgfCAxNCArKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgICAg
ICAgICB8ICAyICsrCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuaCAgICAgICAgIHwgIDEg
KwogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtLmggICAgICAgICB8ICAxICsKIGRyaXZlcnMv
Z3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQuYyAgfCAxMyArKysrKysrKy0tLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbXNtL21zbV9ncHUuYyAgICAgICAgIHwgIDUgKystLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2lvbW11LmMgICAgICAgfCAgMiArLQogOCBmaWxlcyBjaGFuZ2VkLCA0MyBpbnNl
cnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQoKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
