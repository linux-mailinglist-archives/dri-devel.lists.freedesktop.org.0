Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2918B247
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 03:39:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B2D18926A;
	Sat, 27 Apr 2019 01:39:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C658925E;
 Sat, 27 Apr 2019 01:39:41 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9ACF92146E;
 Sat, 27 Apr 2019 01:39:40 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 40/79] drm/amdgpu: amdgpu_device_recover_vram
 always failed if only one node in shadow_list
Date: Fri, 26 Apr 2019 21:37:59 -0400
Message-Id: <20190427013838.6596-40-sashal@kernel.org>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190427013838.6596-1-sashal@kernel.org>
References: <20190427013838.6596-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1556329181;
 bh=U+cyCcziatGq/08m7GKny1aPtLXVy5eQ03V9n6zg9Aw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eNL62Nf2qMByzuYP6sd4VoiUx0x5cnfS4OMxt9PO0rokKDkVuOK222TDs99tP2x6a
 187pjQ21YvjWnU1cuqtPJ7zkVlRpa7JuRlOWV4IL8toSLsB7Dl0vYcqcuVCjNyKM3G
 HVthiLFYu8CwlLLr5uFOaQWENlKUuD9hYiXmOCC4=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, wentalou <Wentao.Lou@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogd2VudGFsb3UgPFdlbnRhby5Mb3VAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29tbWl0IDE3
MTJmYjFhMmY2ODI5MTUwMDMyYWM3NmViMGUzOWI4MmE1NDljZmIgXQoKYW1kZ3B1X2JvX3Jlc3Rv
cmVfc2hhZG93IHdvdWxkIGFzc2lnbiB6ZXJvIHRvIHIgaWYgc3VjY2VlZGVkLgpyIHdvdWxkIHJl
bWFpbiB6ZXJvIGlmIHRoZXJlIGlzIG9ubHkgb25lIG5vZGUgaW4gc2hhZG93X2xpc3QuCmN1cnJl
bnQgY29kZSB3b3VsZCBhbHdheXMgcmV0dXJuIGZhaWx1cmUgd2hlbiByIDw9IDAuCnJlc3RhcnQg
dGhlIHRpbWVvdXQgZm9yIGVhY2ggd2FpdCB3YXMgYSByYXRoZXIgcHJvYmxlbWF0aWMgYnVnIGFz
IHdlbGwuClRoZSB2YWx1ZSBvZiB0bW8gU0hPVUxEIGJlIGNoYW5nZWQsIG90aGVyd2lzZSB3ZSB3
YWl0IHRtbyBqaWZmaWVzIG9uIGVhY2ggbG9vcC4KClNpZ25lZC1vZmYtYnk6IFdlbnRhbyBMb3Ug
PFdlbnRhby5Mb3VAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IENocmlzdGlhbiBLw7ZuaWcgPGNocmlz
dGlhbi5rb2VuaWdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5k
ZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2RldmljZS5j
IHwgMTMgKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRn
cHVfZGV2aWNlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZGV2aWNlLmMK
aW5kZXggN2ZmM2EyOGZjOTAzLi5kNTVkZDU3MGE3MDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9kZXZpY2UuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L2FtZGdwdS9hbWRncHVfZGV2aWNlLmMKQEAgLTMxNTgsMTEgKzMxNTgsMTYgQEAgc3RhdGljIGlu
dCBhbWRncHVfZGV2aWNlX3JlY292ZXJfdnJhbShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldikK
IAkJCWJyZWFrOwogCiAJCWlmIChmZW5jZSkgewotCQkJciA9IGRtYV9mZW5jZV93YWl0X3RpbWVv
dXQoZmVuY2UsIGZhbHNlLCB0bW8pOworCQkJdG1vID0gZG1hX2ZlbmNlX3dhaXRfdGltZW91dChm
ZW5jZSwgZmFsc2UsIHRtbyk7CiAJCQlkbWFfZmVuY2VfcHV0KGZlbmNlKTsKIAkJCWZlbmNlID0g
bmV4dDsKLQkJCWlmIChyIDw9IDApCisJCQlpZiAodG1vID09IDApIHsKKwkJCQlyID0gLUVUSU1F
RE9VVDsKIAkJCQlicmVhazsKKwkJCX0gZWxzZSBpZiAodG1vIDwgMCkgeworCQkJCXIgPSB0bW87
CisJCQkJYnJlYWs7CisJCQl9CiAJCX0gZWxzZSB7CiAJCQlmZW5jZSA9IG5leHQ7CiAJCX0KQEAg
LTMxNzMsOCArMzE3OCw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2RldmljZV9yZWNvdmVyX3ZyYW0o
c3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYpCiAJCXRtbyA9IGRtYV9mZW5jZV93YWl0X3RpbWVv
dXQoZmVuY2UsIGZhbHNlLCB0bW8pOwogCWRtYV9mZW5jZV9wdXQoZmVuY2UpOwogCi0JaWYgKHIg
PD0gMCB8fCB0bW8gPD0gMCkgewotCQlEUk1fRVJST1IoInJlY292ZXIgdnJhbSBibyBmcm9tIHNo
YWRvdyBmYWlsZWRcbiIpOworCWlmIChyIDwgMCB8fCB0bW8gPD0gMCkgeworCQlEUk1fRVJST1Io
InJlY292ZXIgdnJhbSBibyBmcm9tIHNoYWRvdyBmYWlsZWQsIHIgaXMgJWxkLCB0bW8gaXMgJWxk
XG4iLCByLCB0bW8pOwogCQlyZXR1cm4gLUVJTzsKIAl9CiAKLS0gCjIuMTkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
