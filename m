Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02CD415909
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2019 07:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EA089CAF;
	Tue,  7 May 2019 05:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BE7F89CAF;
 Tue,  7 May 2019 05:33:23 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CF8B2206A3;
 Tue,  7 May 2019 05:33:21 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.0 23/99] drm/amd/display: extending AUX SW Timeout
Date: Tue,  7 May 2019 01:31:17 -0400
Message-Id: <20190507053235.29900-23-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190507053235.29900-1-sashal@kernel.org>
References: <20190507053235.29900-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1557207202;
 bh=ELeThrmNFHcLWssUk4KzYslzDNaYvFVj1cK3oWt+ibU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ZuaY+Jucz6170Lb6ZSeSXRfhDC+dgBKPz0DrS+5AxvkeCLQNvZu3X8Tt6Cm9b711C
 uwt04DAUqICRZ9D8o3Bn/9uR3Zl0OFngNsKisanInliEgs/oWawH7vbHLlh96sMM7W
 jh4uLfr3EzNnM17o3p/jIAMickrHbiQmYgZ0WCp0=
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
Cc: Sasha Levin <sashal@kernel.org>, Joshua Aberback <Joshua.Aberback@amd.com>,
 Leo Li <sunpeng.li@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Martin Leung <martin.leung@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Jun Lei <Jun.Lei@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWFydGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4KClsgVXBzdHJlYW0gY29t
bWl0IGY0YmJlYmY4ZTdlYjRkMjk0YjA0MGFiMmQyYmE3MWU3MGU2OWI5MzAgXQoKW1doeV0KQVVY
IHRha2VzIGxvbmdlciB0byByZXBseSB3aGVuIHVzaW5nIGFjdGl2ZSBEUC1EVkkgZG9uZ2xlIG9u
IHNvbWUgYXNpY3MKcmVzdWx0aW5nIGluIHVwIHRvIDIwMDArIHVzIGVkaWQgcmVhZCAodGltZW91
dCkuCgpbSG93XQoxLiBBZGp1c3QgQVVYIHBvbGwgdG8gbWF0Y2ggc3BlYwoyLiBFeHRlbmQgdGhl
IFNXIHRpbWVvdXQuIFRoaXMgZG9lcyBub3QgYWZmZWN0IG5vcm1hbApvcGVyYXRpb24gc2luY2Ug
d2UgZXhpdCB0aGUgbG9vcCBhcyBzb29uIGFzIEFVWCBhY2tzLgoKU2lnbmVkLW9mZi1ieTogTWFy
dGluIExldW5nIDxtYXJ0aW4ubGV1bmdAYW1kLmNvbT4KUmV2aWV3ZWQtYnk6IEp1biBMZWkgPEp1
bi5MZWlAYW1kLmNvbT4KQWNrZWQtYnk6IEpvc2h1YSBBYmVyYmFjayA8Sm9zaHVhLkFiZXJiYWNr
QGFtZC5jb20+CkFja2VkLWJ5OiBMZW8gTGkgPHN1bnBlbmcubGlAYW1kLmNvbT4KU2lnbmVkLW9m
Zi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9ncHUvZHJt
L2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMgfCA5ICsrKysrKy0tLQogZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmggfCA2ICsrKy0tLQogMiBmaWxlcyBjaGFu
Z2VkLCA5IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMgYi9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguYwppbmRleCBhYWViN2ZhYWMwYzQuLmUwZmZmNTc0
NGI1ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vf
YXV4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2VfYXV4LmMK
QEAgLTE4OSw2ICsxODksMTIgQEAgc3RhdGljIHZvaWQgc3VibWl0X2NoYW5uZWxfcmVxdWVzdCgK
IAkJCQkxLAogCQkJCTApOwogCX0KKworCVJFR19VUERBVEUoQVVYX0lOVEVSUlVQVF9DT05UUk9M
LCBBVVhfU1dfRE9ORV9BQ0ssIDEpOworCisJUkVHX1dBSVQoQVVYX1NXX1NUQVRVUywgQVVYX1NX
X0RPTkUsIDAsCisJCQkJMTAsIGF1eDExMC0+dGltZW91dF9wZXJpb2QvMTApOworCiAJLyogc2V0
IHRoZSBkZWxheSBhbmQgdGhlIG51bWJlciBvZiBieXRlcyB0byB3cml0ZSAqLwogCiAJLyogVGhl
IGxlbmd0aCBpbmNsdWRlCkBAIC0yNDEsOSArMjQ3LDYgQEAgc3RhdGljIHZvaWQgc3VibWl0X2No
YW5uZWxfcmVxdWVzdCgKIAkJfQogCX0KIAotCVJFR19VUERBVEUoQVVYX0lOVEVSUlVQVF9DT05U
Uk9MLCBBVVhfU1dfRE9ORV9BQ0ssIDEpOwotCVJFR19XQUlUKEFVWF9TV19TVEFUVVMsIEFVWF9T
V19ET05FLCAwLAotCQkJCTEwLCBhdXgxMTAtPnRpbWVvdXRfcGVyaW9kLzEwKTsKIAlSRUdfVVBE
QVRFKEFVWF9TV19DT05UUk9MLCBBVVhfU1dfR08sIDEpOwogfQogCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXguaCBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX2F1eC5oCmluZGV4IGY3Y2FhYjg1ZGM4MC4uMmM2ZjUw
YjQyNDVhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2Rj
ZV9hdXguaAorKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9hdXgu
aApAQCAtNjksMTEgKzY5LDExIEBAIGVudW0gewkvKiBUaGlzIGlzIHRoZSB0aW1lb3V0IGFzIGRl
ZmluZWQgaW4gRFAgMS4yYSwKIAkgKiBhdCBtb3N0IHdpdGhpbiB+MjQwdXNlYy4gVGhhdCBtZWFu
cywKIAkgKiBpbmNyZWFzaW5nIHRoaXMgdGltZW91dCB3aWxsIG5vdCBhZmZlY3Qgbm9ybWFsIG9w
ZXJhdGlvbiwKIAkgKiBhbmQgd2UnbGwgdGltZW91dCBhZnRlcgotCSAqIFNXX0FVWF9USU1FT1VU
X1BFUklPRF9NVUxUSVBMSUVSICogQVVYX1RJTUVPVVRfUEVSSU9EID0gMTYwMHVzZWMuCisJICog
U1dfQVVYX1RJTUVPVVRfUEVSSU9EX01VTFRJUExJRVIgKiBBVVhfVElNRU9VVF9QRVJJT0QgPSAy
NDAwdXNlYy4KIAkgKiBUaGlzIHRpbWVvdXQgaXMgZXNwZWNpYWxseSBpbXBvcnRhbnQgZm9yCi0J
ICogcmVzdW1lIGZyb20gUzMgYW5kIENUUy4KKwkgKiBjb252ZXJ0ZXJzLCByZXN1bWUgZnJvbSBT
MywgYW5kIENUUy4KIAkgKi8KLQlTV19BVVhfVElNRU9VVF9QRVJJT0RfTVVMVElQTElFUiA9IDQK
KwlTV19BVVhfVElNRU9VVF9QRVJJT0RfTVVMVElQTElFUiA9IDYKIH07CiBzdHJ1Y3QgYXV4X2Vu
Z2luZV9kY2UxMTAgewogCXN0cnVjdCBhdXhfZW5naW5lIGJhc2U7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
