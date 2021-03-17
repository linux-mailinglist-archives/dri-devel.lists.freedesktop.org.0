Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C5F333E409
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 01:59:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC0D6E48E;
	Wed, 17 Mar 2021 00:59:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276CE6E48E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 00:59:14 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 53AB864FC7;
 Wed, 17 Mar 2021 00:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615942753;
 bh=n7t8f2l0CysmlHiuZW++Ft9mjEipInAmI5pBKnZIFSU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GYpoCJlT93Aa5+xcRJ1FqV2NQkkW/wbfwF7TOORWKUeVXjsbgI7DMFfS6znzrxQkZ
 wfjKhvU/Bb+gpcLMY1l5c/eqbVAS3BfD4rZDyH73uBg7YatJ9zs91fZFg7VXXbEyuu
 H/b4+ifRUg9Lw2OMWoH2zGvy5Q2tjL2HjcV2E4P4oQiX4bKCuEpXUosGo9EE3uPITt
 J4rMv8qjthvdxGcvr/O+0KhGfNyx5NXrhGFDU2XzB9KRBQcQLMnJiXm29kdgWjHRpg
 /tgbC/zK0TqJQtr0duPKNu5nq89zehH70XJg3ccRV+/vClfp5zfMbmC+zu65vdnsmk
 T773+6idb0dkw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 19/23] drm/radeon: fix AGP dependency
Date: Tue, 16 Mar 2021 20:58:45 -0400
Message-Id: <20210317005850.726479-19-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317005850.726479-1-sashal@kernel.org>
References: <20210317005850.726479-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgY2JhMmFmYjY1Y2IwNWMzZDE5N2QxNzMyM2ZlZTRlM2M5ZWRlZjljZCBdCgpX
aGVuIEFHUCBpcyBjb21waWxlZCBhcyBtb2R1bGUgcmFkZW9uIG11c3QgYmUgY29tcGlsZWQgYXMg
bW9kdWxlIGFzCndlbGwuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+ClJldmlld2VkLWJ5OiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5k
ZXVjaGVyQGFtZC5jb20+ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRl
dWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwu
b3JnPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyBiL2Ry
aXZlcnMvZ3B1L2RybS9LY29uZmlnCmluZGV4IGU0NGU1NjdiZDc4OS4uYTA1MGE5YWE5YTVlIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0v
S2NvbmZpZwpAQCAtMTkyLDYgKzE5Miw3IEBAIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJtL2FybS9L
Y29uZmlnIgogY29uZmlnIERSTV9SQURFT04KIAl0cmlzdGF0ZSAiQVRJIFJhZGVvbiIKIAlkZXBl
bmRzIG9uIERSTSAmJiBQQ0kgJiYgTU1VCisJZGVwZW5kcyBvbiBBR1AgfHwgIUFHUAogCXNlbGVj
dCBGV19MT0FERVIKICAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAgICAgICAgIHNlbGVj
dCBEUk1fVFRNCi0tIAoyLjMwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
