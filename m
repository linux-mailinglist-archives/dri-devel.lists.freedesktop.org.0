Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D62F46DB37
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2019 06:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FA276E528;
	Fri, 19 Jul 2019 04:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA086E527;
 Fri, 19 Jul 2019 04:08:05 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4E8B8206DD;
 Fri, 19 Jul 2019 04:08:04 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 012/101] drm/amd/display: Disable ABM before
 destroy ABM struct
Date: Fri, 19 Jul 2019 00:06:03 -0400
Message-Id: <20190719040732.17285-12-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190719040732.17285-1-sashal@kernel.org>
References: <20190719040732.17285-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1563509285;
 bh=/xHTl3zMoUagmM29NjxJWUm890kiOPGqTy99nxdmUAk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d2rK0D+pu5rCA0A43cNQxBvy0LWxFaqzMWQ8xhl1mRrgwJWd8OiJ9Hq1Q7fCdr1Hm
 xWBt/9fa894DHAG0gF9Dt358LN6i+Yf4DKGjJvr20P+EaG/bSaBF7ScRKTN9rEYynk
 mzNwerdIN2wfCBf0nTh8bYcsU249NTv7g+KrmMvQ=
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
Cc: Sasha Levin <sashal@kernel.org>, Anthony Koo <Anthony.Koo@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Paul Hsieh <paul.hsieh@amd.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUGF1bCBIc2llaCA8cGF1bC5oc2llaEBhbWQuY29tPgoKWyBVcHN0cmVhbSBjb21taXQg
MTA5MGQ1OGQ0ODE1YjFmY2Q5NWE4MDk4NzM5MTAwNmM4NjM5OGI0YyBdCgpbV2h5XQpXaGVuIGRp
c2FibGUgZHJpdmVyLCBPUyB3aWxsIHNldCBiYWNrbGlnaHQgb3B0aW1pemF0aW9uCnRoZW4gZG8g
c3RvcCBkZXZpY2UuICBCdXQgdGhpcyBmbGFnIHdpbGwgY2F1c2UgZHJpdmVyIHRvCmVuYWJsZSBB
Qk0gd2hlbiBkcml2ZXIgZGlzYWJsZWQuCgpbSG93XQpTZW5kIEFCTSBkaXNhYmxlIGNvbW1hbmQg
YmVmb3JlIGRlc3Ryb3kgQUJNIGNvbnN0cnVjdAoKU2lnbmVkLW9mZi1ieTogUGF1bCBIc2llaCA8
cGF1bC5oc2llaEBhbWQuY29tPgpSZXZpZXdlZC1ieTogQW50aG9ueSBLb28gPEFudGhvbnkuS29v
QGFtZC5jb20+CkFja2VkLWJ5OiBCaGF3YW5wcmVldCBMYWtoYSA8Qmhhd2FucHJlZXQuTGFraGFA
YW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBh
bWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMgfCAyICsrCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RjZV9hYm0uYwppbmRleCAyOTI5NGRiMWE5NmIuLjA3MGFiNTZhOGFjYSAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYWJtLmMKQEAgLTQ3
NCw2ICs0NzQsOCBAQCB2b2lkIGRjZV9hYm1fZGVzdHJveShzdHJ1Y3QgYWJtICoqYWJtKQogewog
CXN0cnVjdCBkY2VfYWJtICphYm1fZGNlID0gVE9fRENFX0FCTSgqYWJtKTsKIAorCWFibV9kY2Ut
PmJhc2UuZnVuY3MtPnNldF9hYm1faW1tZWRpYXRlX2Rpc2FibGUoKmFibSk7CisKIAlrZnJlZShh
Ym1fZGNlKTsKIAkqYWJtID0gTlVMTDsKIH0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
