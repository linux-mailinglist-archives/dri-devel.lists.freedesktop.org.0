Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2914AE9FC8
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2019 16:53:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632F26EA72;
	Wed, 30 Oct 2019 15:53:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71EAB6EA72;
 Wed, 30 Oct 2019 15:53:29 +0000 (UTC)
Received: from sasha-vm.mshome.net (100.50.158.77.rev.sfr.net [77.158.50.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C10D020856;
 Wed, 30 Oct 2019 15:53:27 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 55/81] drm/amdgpu: fix potential VM faults
Date: Wed, 30 Oct 2019 11:49:01 -0400
Message-Id: <20191030154928.9432-55-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191030154928.9432-1-sashal@kernel.org>
References: <20191030154928.9432-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1572450809;
 bh=gv1fTVcMYT3t+RNSRTZEKgmTRhHvkmvmvq7qtcg5k6w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pmI6csuYo5Pb641U/UFbSqBnr7EZ+Kbg+5lIeFcNLKi1mD/L9mbhTm0/vj+d1S/sc
 lz6Jjo/KBlQxTgIhky/s5ChUhEGpXBgb/4iL3BIdrGmvzfPSXmgxDaWAjlDivh24yb
 Y3glUtBUumHlIC8CB7vaYwhlHHdSMOE5NpCUbuSI=
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Sasha Levin <sashal@kernel.org>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgoKWyBVcHN0
cmVhbSBjb21taXQgMzEyMjA1MWVkYzdjMjdjYzA4NTM0YmU3MzBmNGM3YzE4MDkxOWI4YSBdCgpX
aGVuIHdlIGFsbG9jYXRlIG5ldyBwYWdlIHRhYmxlcyB1bmRlciBtZW1vcnkKcHJlc3N1cmUgd2Ug
c2hvdWxkIG5vdCBldmljdCBvbGQgb25lcy4KClNpZ25lZC1vZmYtYnk6IENocmlzdGlhbiBLw7Zu
aWcgPGNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbT4KQWNrZWQtYnk6IEFsZXggRGV1Y2hlciA8YWxl
eGFuZGVyLmRldWNoZXJAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4
YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFs
QGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X29iamVj
dC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmMKaW5kZXggYmVh
NmYyOThkZmRjNS4uMGZmNzg2ZGVjOGM0YSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1
L2FtZGdwdV9vYmplY3QuYwpAQCAtNDIxLDcgKzQyMSw4IEBAIHN0YXRpYyBpbnQgYW1kZ3B1X2Jv
X2RvX2NyZWF0ZShzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiwKIAkJLmludGVycnVwdGlibGUg
PSAoYnAtPnR5cGUgIT0gdHRtX2JvX3R5cGVfa2VybmVsKSwKIAkJLm5vX3dhaXRfZ3B1ID0gZmFs
c2UsCiAJCS5yZXN2ID0gYnAtPnJlc3YsCi0JCS5mbGFncyA9IFRUTV9PUFRfRkxBR19BTExPV19S
RVNfRVZJQ1QKKwkJLmZsYWdzID0gYnAtPnR5cGUgIT0gdHRtX2JvX3R5cGVfa2VybmVsID8KKwkJ
CVRUTV9PUFRfRkxBR19BTExPV19SRVNfRVZJQ1QgOiAwCiAJfTsKIAlzdHJ1Y3QgYW1kZ3B1X2Jv
ICpibzsKIAl1bnNpZ25lZCBsb25nIHBhZ2VfYWxpZ24sIHNpemUgPSBicC0+c2l6ZTsKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
