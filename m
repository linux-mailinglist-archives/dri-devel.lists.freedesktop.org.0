Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C5858FB2
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jun 2019 03:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2E8E6E870;
	Fri, 28 Jun 2019 01:26:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2DC6E3AA
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 18:21:26 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/3] DRM: ingenic: Use devm_platform_ioremap_resource
Date: Thu, 27 Jun 2019 20:21:12 +0200
Message-Id: <20190627182114.27299-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Jun 2019 01:25:51 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1561659683; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:references; bh=hxYTvnQO/eZbO0T4ZUdUxSRmfpX1wgQggO720gFQx6M=;
 b=kByL8G0YFql9ZKH6WiEaGOaw+1sMNHBgy9YTjP+eh3g32qZmd7N2ySNirSap30FnNXuGfC
 qY4HCO4iEy9lG5cU1XYddxBfE3YA9O6rnp3KpiAtzjVWRhvX80TCaxAjhQ8cwllJp9OwnU
 cOAMztb2EctpEZVeLcqrSyOSIyKkHmw=
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2ltcGxpZnkgYSBiaXQgdGhlIHByb2JlIGZ1bmN0aW9uIGJ5IHVzaW5nIHRoZSBuZXdseSBpbnRy
b2R1Y2VkCmRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNvdXJjZSgpLCBpbnN0ZWFkIG9mIGhhdmlu
ZyB0byBjYWxsCnBsYXRmb3JtX2dldF9yZXNvdXJjZSgpIGZvbGxvd2VkIGJ5IGRldm1faW9yZW1h
cF9yZXNvdXJjZSgpLgoKU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3Vp
bGxvdS5uZXQ+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYyB8IDQg
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAzIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMgYi9kcml2ZXJz
L2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCmluZGV4IGEwNjk1NzljYTc0OS4uMDJjNDc4
OGVmMWM3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMKQEAgLTU4MCw3ICs1
ODAsNiBAQCBzdGF0aWMgaW50IGluZ2VuaWNfZHJtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKnBkZXYpCiAJc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZTsKIAlzdHJ1Y3QgZHJtX3BhbmVs
ICpwYW5lbDsKIAlzdHJ1Y3QgZHJtX2RldmljZSAqZHJtOwotCXN0cnVjdCByZXNvdXJjZSAqbWVt
OwogCXZvaWQgX19pb21lbSAqYmFzZTsKIAlsb25nIHBhcmVudF9yYXRlOwogCWludCByZXQsIGly
cTsKQEAgLTYxNCw4ICs2MTMsNyBAQCBzdGF0aWMgaW50IGluZ2VuaWNfZHJtX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJZHJtLT5tb2RlX2NvbmZpZy5tYXhfaGVpZ2h0ID0g
NjAwOwogCWRybS0+bW9kZV9jb25maWcuZnVuY3MgPSAmaW5nZW5pY19kcm1fbW9kZV9jb25maWdf
ZnVuY3M7CiAKLQltZW0gPSBwbGF0Zm9ybV9nZXRfcmVzb3VyY2UocGRldiwgSU9SRVNPVVJDRV9N
RU0sIDApOwotCWJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoZGV2LCBtZW0pOworCWJhc2Ug
PSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2UocGRldiwgMCk7CiAJaWYgKElTX0VSUihi
YXNlKSkgewogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byBnZXQgbWVtb3J5IHJlc291cmNlIik7
CiAJCXJldHVybiBQVFJfRVJSKGJhc2UpOwotLSAKMi4yMS4wLjU5My5nNTExZWMzNDVlMTgKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
