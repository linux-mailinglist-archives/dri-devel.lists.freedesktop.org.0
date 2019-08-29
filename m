Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B29CCA2376
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2019 20:16:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204F16E139;
	Thu, 29 Aug 2019 18:16:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5FD96E129
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2019 18:16:07 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B7852339E;
 Thu, 29 Aug 2019 18:16:07 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 14/45] drm/mediatek: use correct device to import
 PRIME buffers
Date: Thu, 29 Aug 2019 14:15:14 -0400
Message-Id: <20190829181547.8280-14-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190829181547.8280-1-sashal@kernel.org>
References: <20190829181547.8280-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1567102567;
 bh=Dm9/IdN9xs7NLKfecqL5L55es773OzMHpCSBSHrVXCY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gzBS/khCDzLM0uDhMb/HkEmfuV0TDFDWq8h9ZUC8aPNSMALAYaIwLfSQzukJUIHs1
 7zAyq3Fd/Ikh8fkMbNhFu91lSkFR4afg4UPUVi/FhUF8S4LwD1e6TWLVD6iAaNznbd
 ApCbVeML0wtqilQHdhYbdD3IUuWzWV9cNEFJ+Okw=
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
 Alexandre Courbot <acourbot@chromium.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QGNocm9taXVtLm9yZz4KClsgVXBzdHJl
YW0gY29tbWl0IDRjNmYzMTk2ZTZlYTExMWM0NTZjNjA4NmRjM2Y1N2Q0NzA2YjBiMmQgXQoKUFJJ
TUUgYnVmZmVycyBzaG91bGQgYmUgaW1wb3J0ZWQgdXNpbmcgdGhlIERNQSBkZXZpY2UuIFRvIHRo
aXMgZW5kLCB1c2UKYSBjdXN0b20gaW1wb3J0IGZ1bmN0aW9uIHRoYXQgbWltaWNzIGRybV9nZW1f
cHJpbWVfaW1wb3J0X2RldigpLCBidXQKcGFzc2VzIHRoZSBjb3JyZWN0IGRldmljZS4KCkZpeGVz
OiAxMTlmNTE3MzYyOGFhICgiZHJtL21lZGlhdGVrOiBBZGQgRFJNIERyaXZlciBmb3IgTWVkaWF0
ZWsgU29DIE1UODE3My4iKQpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQ291cmJvdCA8YWNvdXJi
b3RAY2hyb21pdW0ub3JnPgpTaWduZWQtb2ZmLWJ5OiBDSyBIdSA8Y2suaHVAbWVkaWF0ZWsuY29t
PgpTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJp
dmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAxNCArKysrKysrKysrKysrLQog
MSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCmluZGV4IGZkODMwNDZkODM3NmIuLmZmYjk5NzQ0
MDg1MWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCkBAIC0zMjcsNiAr
MzI3LDE4IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIG10a19kcm1fZm9w
cyA9IHsKIAkuY29tcGF0X2lvY3RsID0gZHJtX2NvbXBhdF9pb2N0bCwKIH07CiAKKy8qCisgKiBX
ZSBuZWVkIHRvIG92ZXJyaWRlIHRoaXMgYmVjYXVzZSB0aGUgZGV2aWNlIHVzZWQgdG8gaW1wb3J0
IHRoZSBtZW1vcnkgaXMKKyAqIG5vdCBkZXYtPmRldiwgYXMgZHJtX2dlbV9wcmltZV9pbXBvcnQo
KSBleHBlY3RzLgorICovCitzdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKm10a19kcm1fZ2VtX3ByaW1l
X2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAorCQkJCQkJc3RydWN0IGRtYV9idWYgKmRt
YV9idWYpCit7CisJc3RydWN0IG10a19kcm1fcHJpdmF0ZSAqcHJpdmF0ZSA9IGRldi0+ZGV2X3By
aXZhdGU7CisKKwlyZXR1cm4gZHJtX2dlbV9wcmltZV9pbXBvcnRfZGV2KGRldiwgZG1hX2J1Ziwg
cHJpdmF0ZS0+ZG1hX2Rldik7Cit9CisKIHN0YXRpYyBzdHJ1Y3QgZHJtX2RyaXZlciBtdGtfZHJt
X2RyaXZlciA9IHsKIAkuZHJpdmVyX2ZlYXR1cmVzID0gRFJJVkVSX01PREVTRVQgfCBEUklWRVJf
R0VNIHwgRFJJVkVSX1BSSU1FIHwKIAkJCSAgIERSSVZFUl9BVE9NSUMsCkBAIC0zMzgsNyArMzUw
LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIG10a19kcm1fZHJpdmVyID0gewogCS5wcmlt
ZV9oYW5kbGVfdG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJpbWVfZmRf
dG9faGFuZGxlID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCiAJLmdlbV9wcmltZV9leHBv
cnQgPSBkcm1fZ2VtX3ByaW1lX2V4cG9ydCwKLQkuZ2VtX3ByaW1lX2ltcG9ydCA9IGRybV9nZW1f
cHJpbWVfaW1wb3J0LAorCS5nZW1fcHJpbWVfaW1wb3J0ID0gbXRrX2RybV9nZW1fcHJpbWVfaW1w
b3J0LAogCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlID0gbXRrX2dlbV9wcmltZV9nZXRfc2dfdGFi
bGUsCiAJLmdlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUgPSBtdGtfZ2VtX3ByaW1lX2ltcG9ydF9z
Z190YWJsZSwKIAkuZ2VtX3ByaW1lX21tYXAgPSBtdGtfZHJtX2dlbV9tbWFwX2J1ZiwKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
