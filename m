Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE4BFA1A0
	for <lists+dri-devel@lfdr.de>; Wed, 13 Nov 2019 02:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28A1D6EC50;
	Wed, 13 Nov 2019 01:58:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E286B6EC50
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Nov 2019 01:58:41 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C7BA62245C;
 Wed, 13 Nov 2019 01:58:40 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 083/115] fbdev: sbuslib: integer overflow in
 sbusfb_ioctl_helper()
Date: Tue, 12 Nov 2019 20:55:50 -0500
Message-Id: <20191113015622.11592-83-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191113015622.11592-1-sashal@kernel.org>
References: <20191113015622.11592-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1573610321;
 bh=6tKVNmbw+qYOY0gZtKFGEPhIaxF5nM+KLL6j78blHzQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=L3JnJItqYYqeKBw5kgf/lQXEJmpnX3GMIvxLHgn+6eRgO9NQJWfoDiN+2d1rWytit
 dgzTuimBUlZChOwkT1XGfJQIj+SPzlas2hV/VC0VNRes8a/pmuSSQWQy/rAu1QE9Jr
 GD+IpZvtZ6uTGVDbN1AmfIrifYx3DRM44thrL+9A=
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Mathieu Malaterre <malat@debian.org>, dri-devel@lists.freedesktop.org,
 Philippe Ombredanne <pombredanne@nexb.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Peter Malone <peter.malone@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgZTUwMTc3MTZhZGI4YWE1YzAxYzUyMzg2YzFiNzQ3MDEwMWZmZTljNSBdCgpUaGUg
ImluZGV4ICsgY291bnQiIGFkZGl0aW9uIGNhbiBvdmVyZmxvdy4gIEJvdGggY29tZSBkaXJlY3Rs
eSBmcm9tIHRoZQp1c2VyLiAgVGhpcyBidWcgbGVhZHMgdG8gYW4gaW5mb3JtYXRpb24gbGVhay4K
ClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4K
Q2M6IFBldGVyIE1hbG9uZSA8cGV0ZXIubWFsb25lQGdtYWlsLmNvbT4KQ2M6IFBoaWxpcHBlIE9t
YnJlZGFubmUgPHBvbWJyZWRhbm5lQG5leGIuY29tPgpDYzogTWF0aGlldSBNYWxhdGVycmUgPG1h
bGF0QGRlYmlhbi5vcmc+ClNpZ25lZC1vZmYtYnk6IEJhcnRsb21pZWogWm9sbmllcmtpZXdpY3og
PGIuem9sbmllcmtpZUBzYW1zdW5nLmNvbT4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNh
c2hhbEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvc2J1c2xpYi5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9zYnVzbGliLmMgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L3NidXNsaWIuYwppbmRleCA5MGM1MTMzMDk2OWMyLi4wMWE3MTEwZTYxYTc2IDEwMDY0NAotLS0g
YS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L3NidXNsaWIuYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L3NidXNsaWIuYwpAQCAtMTcxLDcgKzE3MSw3IEBAIGludCBzYnVzZmJfaW9jdGxfaGVscGVyKHVu
c2lnbmVkIGxvbmcgY21kLCB1bnNpZ25lZCBsb25nIGFyZywKIAkJICAgIGdldF91c2VyKHVibHVl
LCAmYy0+Ymx1ZSkpCiAJCQlyZXR1cm4gLUVGQVVMVDsKIAotCQlpZiAoaW5kZXggKyBjb3VudCA+
IGNtYXAtPmxlbikKKwkJaWYgKGluZGV4ID4gY21hcC0+bGVuIHx8IGNvdW50ID4gY21hcC0+bGVu
IC0gaW5kZXgpCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAogCQlmb3IgKGkgPSAwOyBpIDwgY291bnQ7
IGkrKykgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
