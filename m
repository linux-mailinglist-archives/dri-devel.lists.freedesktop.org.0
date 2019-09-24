Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 836CCBCDD9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 18:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C3186EAC1;
	Tue, 24 Sep 2019 16:51:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 264A86EAC0;
 Tue, 24 Sep 2019 16:51:44 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2C0C9217D9;
 Tue, 24 Sep 2019 16:51:43 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 07/19] drm/amd/powerplay/smu7: enforce minimal
 VBITimeout (v2)
Date: Tue, 24 Sep 2019 12:51:18 -0400
Message-Id: <20190924165130.28625-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924165130.28625-1-sashal@kernel.org>
References: <20190924165130.28625-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1569343904;
 bh=cdpXAyC0QgX4B0pAmhmXYPJ+N0Wzzx+vtMzo2FD9JFw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Zc7PWrfUSqC6YxQra9P1R0DoTtx1gS3EgKAzawnR/ePaK9FcIsDDHW4GYJc/5NKJL
 b3FWnIhARYtyg3vlsK9to8VWXRCHfqqmets6Pmi/A9JDjn0RJaavSZ5bOjaS0gmwfD
 j4doMcE57KbWu77+fHcUtHT5J/Br+i9L7GGLtCVs=
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
Cc: Sasha Levin <sashal@kernel.org>, dri-devel@lists.freedesktop.org,
 Ahzo <Ahzo@tutanota.com>, amd-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, Evan Quan <evan.quan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCBmNjU5YmI2
ZGFlNThjMTEzODA1ZjkyODIyZTRjMTZkZGQzMTU2Yjc5IF0KClRoaXMgZml4ZXMgc2NyZWVuIGNv
cnJ1cHRpb24vZmxpY2tlcmluZyBvbiA3NSBIeiBkaXNwbGF5cy4KCnYyOiBtYWtlIHByaW50IHN0
YXRlbWVudCBkZWJ1ZyBvbmx5IChBbGV4KQoKQnVnemlsbGE6IGh0dHBzOi8vYnVncy5mcmVlZGVz
a3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwMjY0NgpSZXZpZXdlZC1ieTogRXZhbiBRdWFuIDxl
dmFuLnF1YW5AYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWh6byA8QWh6b0B0dXRhbm90YS5jb20+
ClNpZ25lZC1vZmYtYnk6IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3NtdTdfaHdtZ3IuYyB8IDUgKysrKysKIDEg
ZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1k
L3Bvd2VycGxheS9od21nci9zbXU3X2h3bWdyLmMKaW5kZXggMzkwNzQzOTQxN2U3Ni4uYzBkYjNi
NTdkZmU1OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvaHdtZ3Iv
c211N19od21nci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L2h3bWdyL3Nt
dTdfaHdtZ3IuYwpAQCAtMzczOSw2ICszNzM5LDExIEBAIGludCBzbXU3X3Byb2dyYW1fZGlzcGxh
eV9nYXAoc3RydWN0IHBwX2h3bWdyICpod21ncikKIAogCWRhdGEtPmZyYW1lX3RpbWVfeDIgPSBm
cmFtZV90aW1lX2luX3VzICogMiAvIDEwMDsKIAorCWlmIChkYXRhLT5mcmFtZV90aW1lX3gyIDwg
MjgwKSB7CisJCXByX2RlYnVnKCIlczogZW5mb3JjZSBtaW5pbWFsIFZCSVRpbWVvdXQ6ICVkIC0+
IDI4MFxuIiwgX19mdW5jX18sIGRhdGEtPmZyYW1lX3RpbWVfeDIpOworCQlkYXRhLT5mcmFtZV90
aW1lX3gyID0gMjgwOworCX0KKwogCWRpc3BsYXlfZ2FwMiA9IHByZV92YmlfdGltZV9pbl91cyAq
IChyZWZfY2xvY2sgLyAxMDApOwogCiAJY2dzX3dyaXRlX2luZF9yZWdpc3Rlcihod21nci0+ZGV2
aWNlLCBDR1NfSU5EX1JFR19fU01DLCBpeENHX0RJU1BMQVlfR0FQX0NOVEwyLCBkaXNwbGF5X2dh
cDIpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
