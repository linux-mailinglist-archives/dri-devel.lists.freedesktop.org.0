Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C766933E40D
	for <lists+dri-devel@lfdr.de>; Wed, 17 Mar 2021 01:59:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9B1D6E499;
	Wed, 17 Mar 2021 00:59:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9E66E499
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 00:59:43 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B3B7F64FBC;
 Wed, 17 Mar 2021 00:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615942783;
 bh=Hu7eLsX0xzzWq8Az1HGRu3h9HNzL7mi7VCU2Z64f044=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cB0LuZBo3+74PwFzXbpniIujspfJnMmlXfj/vgGZgOs2Nh4SYllnsZPx2HFQmaL1/
 ZdVekNeWQh6oooEgndMAy4QZhlAUorWacyQU9Ob3pdmS50gpBLbBFFN5dH7ha756Xm
 vh8kpIbHfau/lGwCFNfc6eUX1u/6i+ss7AY0b/PnM5+p3ni+AiUoU/o3edl0LTf+OO
 qx2uHiRzkrxGqDsNk5llHS3+vm/1c1D9iYsliOegwSOTfJQKMU9PSVkFzjIP8Yjx1f
 Oa9cR8I1eIqE74/tl6DSg/p2e4jjfHk2+TxkKTWizAqV484PYt2PSlwsxnaNnAV9Xh
 8WOpodbIXmIiQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 18/21] drm/radeon: fix AGP dependency
Date: Tue, 16 Mar 2021 20:59:17 -0400
Message-Id: <20210317005920.726931-18-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210317005920.726931-1-sashal@kernel.org>
References: <20210317005920.726931-1-sashal@kernel.org>
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
aXZlcnMvZ3B1L2RybS9LY29uZmlnCmluZGV4IDgzY2IyYTg4YzIwNC4uNTk1ZDBjOTZiYTg5IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0v
S2NvbmZpZwpAQCAtMTU2LDYgKzE1Niw3IEBAIHNvdXJjZSAiZHJpdmVycy9ncHUvZHJtL2FybS9L
Y29uZmlnIgogY29uZmlnIERSTV9SQURFT04KIAl0cmlzdGF0ZSAiQVRJIFJhZGVvbiIKIAlkZXBl
bmRzIG9uIERSTSAmJiBQQ0kgJiYgTU1VCisJZGVwZW5kcyBvbiBBR1AgfHwgIUFHUAogCXNlbGVj
dCBGV19MT0FERVIKICAgICAgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSCiAgICAgICAgIHNlbGVj
dCBEUk1fVFRNCi0tIAoyLjMwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
