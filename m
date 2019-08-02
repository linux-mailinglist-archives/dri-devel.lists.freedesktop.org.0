Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D52B97F867
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 15:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56EB66EE2D;
	Fri,  2 Aug 2019 13:20:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AED616EE2A;
 Fri,  2 Aug 2019 13:20:16 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 89D642173E;
 Fri,  2 Aug 2019 13:20:15 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.2 19/76] drm/amd/display: fix DMCU hang when going
 into Modern Standby
Date: Fri,  2 Aug 2019 09:18:53 -0400
Message-Id: <20190802131951.11600-19-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802131951.11600-1-sashal@kernel.org>
References: <20190802131951.11600-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1564752016;
 bh=jv1eVo24L+RI8/jG57GNMt//FucVNI5ykIC/Cwrx+a8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=zv4wlJd39KtgiQHfGXBLeic+AFwwpCPDqDy6Hyagf8DmvkQM5sPEvQel8PRPm5ntv
 IkxNANLSXleXem8Y41TR3JJoiAiz+WUOFrURjz3Niya+ArUkZ1GksDd0WYE4TLWqQv
 rIyx54XwZ069NnuETLQG//Ueg6ianIVyU+EQnJdU=
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
Cc: Sasha Levin <sashal@kernel.org>, Eric Yang <eric.yang2@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Zi Yu Liao <ziyu.liao@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Anthony Koo <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWmkgWXUgTGlhbyA8eml5dS5saWFvQGFtZC5jb20+CgpbIFVwc3RyZWFtIGNvbW1pdCAx
Y2EwNjhlZDM0ZDZiMzlkMzM2YzFiMGQ2MThlZDczYmE4ZjA0NTQ4IF0KClt3aHldCldoZW4gdGhl
IHN5c3RlbSBpcyBnb2luZyBpbnRvIHN1c3BlbmQsIHNldF9iYWNrbGlnaHQgZ2V0cyBjYWxsZWQK
YWZ0ZXIgdGhlIGVEUCBnb3QgYmxhbmtlZC4gU2luY2Ugc21vb3RoIGJyaWdodG5lc3MgaXMgZW5h
YmxlZCwKdGhlIGRyaXZlciB3aWxsIG1ha2UgYSBjYWxsIGludG8gdGhlIERNQ1UgdG8gcmFtcCB0
aGUgYnJpZ2h0bmVzcy4KVGhlIERNQ1Ugd291bGQgdHJ5IHRvIGVuYWJsZSBBQk0gdG8gZG8gc28u
IEJ1dCBzaW5jZSB0aGUgZGlzcGxheSBpcwpibGFua2VkLCB0aGlzIGVuZHMgdXAgY2F1c2luZyBB
Qk0xX0FDRV9EQlVGX1JFR19VUERBVEVfUEVORElORyB0bwpnZXQgc3R1Y2sgYXQgMSwgd2hpY2gg
cmVzdWx0cyBpbiBhIGRlYWQgbG9jayBpbiB0aGUgRE1DVSBmaXJtd2FyZS4KCltob3ddCkRpc2Fi
bGUgYnJpZ2h0bmVzcyByYW1waW5nIHdoZW4gdGhlIGVEUCBkaXNwbGF5IGlzIGJsYW5rZWQuCgpT
aWduZWQtb2ZmLWJ5OiBaaSBZdSBMaWFvIDx6aXl1LmxpYW9AYW1kLmNvbT4KUmV2aWV3ZWQtYnk6
IEVyaWMgWWFuZyA8ZXJpYy55YW5nMkBhbWQuY29tPgpBY2tlZC1ieTogQW50aG9ueSBLb28gPEFu
dGhvbnkuS29vQGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4K
U2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpT
aWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIHwgOSArKysrKysrKy0KIDEg
ZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMKaW5kZXggYTNmZjMzZmY2ZGEx
Ni4uYWRmMzllM2I4ZDI5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2NvcmUvZGNfbGluay5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjX2xpbmsuYwpAQCAtMjI4NCw3ICsyMjg0LDcgQEAgYm9vbCBkY19saW5rX3NldF9iYWNr
bGlnaHRfbGV2ZWwoY29uc3Qgc3RydWN0IGRjX2xpbmsgKmxpbmssCiAJCQlpZiAoY29yZV9kYy0+
Y3VycmVudF9zdGF0ZS0+cmVzX2N0eC5waXBlX2N0eFtpXS5zdHJlYW0pIHsKIAkJCQlpZiAoY29y
ZV9kYy0+Y3VycmVudF9zdGF0ZS0+cmVzX2N0eC4KIAkJCQkJCXBpcGVfY3R4W2ldLnN0cmVhbS0+
bGluawotCQkJCQkJPT0gbGluaykKKwkJCQkJCT09IGxpbmspIHsKIAkJCQkJLyogRE1DVSAtMSBm
b3IgYWxsIGNvbnRyb2xsZXIgaWQgdmFsdWVzLAogCQkJCQkgKiB0aGVyZWZvcmUgKzEgaGVyZQog
CQkJCQkgKi8KQEAgLTIyOTIsNiArMjI5MiwxMyBAQCBib29sIGRjX2xpbmtfc2V0X2JhY2tsaWdo
dF9sZXZlbChjb25zdCBzdHJ1Y3QgZGNfbGluayAqbGluaywKIAkJCQkJCWNvcmVfZGMtPmN1cnJl
bnRfc3RhdGUtPgogCQkJCQkJcmVzX2N0eC5waXBlX2N0eFtpXS5zdHJlYW1fcmVzLnRnLT5pbnN0
ICsKIAkJCQkJCTE7CisKKwkJCQkJLyogRGlzYWJsZSBicmlnaHRuZXNzIHJhbXBpbmcgd2hlbiB0
aGUgZGlzcGxheSBpcyBibGFua2VkCisJCQkJCSAqIGFzIGl0IGNhbiBoYW5nIHRoZSBETUNVCisJ
CQkJCSAqLworCQkJCQlpZiAoY29yZV9kYy0+Y3VycmVudF9zdGF0ZS0+cmVzX2N0eC5waXBlX2N0
eFtpXS5wbGFuZV9zdGF0ZSA9PSBOVUxMKQorCQkJCQkJZnJhbWVfcmFtcCA9IDA7CisJCQkJfQog
CQkJfQogCQl9CiAJCWFibS0+ZnVuY3MtPnNldF9iYWNrbGlnaHRfbGV2ZWxfcHdtKAotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
