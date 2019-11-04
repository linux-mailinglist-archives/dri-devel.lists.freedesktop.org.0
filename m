Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F4DEE8BE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 421146E83E;
	Mon,  4 Nov 2019 19:35:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ironport.ite.com.tw (60-251-196-230.HINET-IP.hinet.net
 [60.251.196.230])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2E33A6E196
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Nov 2019 08:44:01 +0000 (UTC)
Received: from unknown (HELO mse.ite.com.tw) ([192.168.35.30])
 by ironport.ite.com.tw with ESMTP; 04 Nov 2019 16:43:58 +0800
Received: from csbcas.internal.ite.com.tw (csbcas1.internal.ite.com.tw
 [192.168.65.46]) by mse.ite.com.tw with ESMTP id xA48hpip026781;
 Mon, 4 Nov 2019 16:43:51 +0800 (GMT-8)
 (envelope-from allen.chen@ite.com.tw)
Received: from allen-VirtualBox.internal.ite.com.tw (192.168.70.14) by
 csbcas1.internal.ite.com.tw (192.168.65.45) with Microsoft SMTP Server (TLS)
 id 14.3.352.0; Mon, 4 Nov 2019 16:43:52 +0800
From: allen <allen.chen@ite.com.tw>
To: 
Subject: [PATCH] drm/edid: fixup EDID 1.3 and 1.4 judge reduced-blanking
 timings logic
Date: Mon, 4 Nov 2019 16:42:49 +0800
Message-ID: <1572856969-12115-1-git-send-email-allen.chen@ite.com.tw>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [192.168.70.14]
X-MAIL: mse.ite.com.tw xA48hpip026781
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:10 +0000
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
Cc: Jau-Chih Tseng <Jau-Chih.Tseng@ite.com.tw>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Allen Chen <allen.chen@ite.com.tw>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, Pi-Hsun Shih <pihsun@chromium.org>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWNjb3JkaW5nIHRvIFZFU0EgRU5IQU5DRUQgRVhURU5ERUQgRElTUExBWSBJREVOVElGSUNBVElP
TiBEQVRBIFNUQU5EQVJECihEZWZpbmVzIEVESUQgU3RydWN0dXJlIFZlcnNpb24gMSwgUmV2aXNp
b24gNCkgcGFnZTogMzkKSG93IHRvIGRldGVybWluZSB3aGV0aGVyIHRoZSBtb25pdG9yIHN1cHBv
cnQgUkIgdGltaW5nIG9yIG5vdD8KRURJRCAxLjQKRmlyc3Q6ICByZWFkIGRldGFpbGVkIHRpbWlu
ZyBkZXNjcmlwdG9yIGFuZCBtYWtlIHN1cmUgYnl0ZTAgPSAwLAoJYnl0ZTEgPSAwLCBieXRlMiA9
IDAgYW5kIGJ5dGUzID0gMHhGRApTZWNvbmQ6IHJlYWQgZGV0YWlsZWQgdGltaW5nIGRlc2NyaXB0
b3IgYnl0ZTEwID0gMHgwNCBhbmQKCUVESUQgYnl0ZTE4aCBiaXQwID0gMQpUaGlyZDogIGlmIEVE
SUQgYnl0ZTE4aCBiaXQwID09IDEgJiYgYnl0ZTEwID09IDB4MDQsCgl0aGVuIHdlIGNhbiBjaGVj
ayBieXRlMTUsIGlmIGJ5dGUxNSBiaXQ0ID0xIGlzIHN1cHBvcnQgUkIKICAgICAgICBpZiBFRElE
IGJ5dGUxOGggYml0MCAhPSAxIHx8IGJ5dGUxMCAhPSAweDA0LAoJdGhlbiBieXRlMTUgY2FuIG5v
dCBiZSB1c2VkCgpUaGUgbGludXggY29kZSBpc19yYiBmdW5jdGlvbiBub3QgZm9sbG93IHRoZSBW
RVNBJ3MgcnVsZQoKRURJRCAxLjMKTENE4oCCZmxhdOKAgnBhbmVscyBkb+KAgm5vdOKAgnJlcXVp
cmXigIJsb25n4oCCYmxhbmtpbmfigIJpbnRlcnZhbHPigIJhc+KAgmHigIJyZXRyYWNlCnBlcmlv
ZCBzbyBkZWZhdWx0IHN1cHBvcnQgcmVkdWNlZC1ibGFua2luZyB0aW1pbmdzLgoKU2lnbmVkLW9m
Zi1ieTogQWxsZW4gQ2hlbiA8YWxsZW4uY2hlbkBpdGUuY29tLnR3PgpSZXBvcnRlZC1ieToga2J1
aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9l
ZGlkLmMgfCAyOCArKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MjEgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vZHJtX2VkaWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCmluZGV4IGU1ZTdl
NjUuLjliNjdiODAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC05Myw2ICs5MywxMSBAQCBzdHJ1Y3QgZGV0
YWlsZWRfbW9kZV9jbG9zdXJlIHsKIAlpbnQgbW9kZXM7CiB9OwogCitzdHJ1Y3QgZWRpZF9zdXBw
b3J0X3JiX2Nsb3N1cmUgeworCXN0cnVjdCBlZGlkICplZGlkOworCXM4IHN1cHBvcnRfcmI7Cit9
OworCiAjZGVmaW5lIExFVkVMX0RNVAkwCiAjZGVmaW5lIExFVkVMX0dURgkxCiAjZGVmaW5lIExF
VkVMX0dURjIJMgpAQCAtMjAxOCwyMiArMjAyMywzMSBAQCBzdHJ1Y3QgZHJtX2Rpc3BsYXlfbW9k
ZSAqZHJtX21vZGVfZmluZF9kbXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKIGlzX3JiKHN0cnVj
dCBkZXRhaWxlZF90aW1pbmcgKnQsIHZvaWQgKmRhdGEpCiB7CiAJdTggKnIgPSAodTggKil0Owot
CWlmIChyWzNdID09IEVESURfREVUQUlMX01PTklUT1JfUkFOR0UpCi0JCWlmIChyWzE1XSAmIDB4
MTApCi0JCQkqKGJvb2wgKilkYXRhID0gdHJ1ZTsKKwlzdHJ1Y3QgZWRpZF9zdXBwb3J0X3JiX2Ns
b3N1cmUgKmNsb3N1cmUgPSBkYXRhOworCXN0cnVjdCBlZGlkICplZGlkID0gY2xvc3VyZS0+ZWRp
ZDsKKworCWlmICghclswXSAmJiAhclsxXSAmJiAhclsyXSAmJiByWzNdID09IEVESURfREVUQUlM
X01PTklUT1JfUkFOR0UpIHsKKwkJaWYgKGVkaWQtPmZlYXR1cmVzICYgQklUKDApICYmIHJbMTBd
ID09IEJJVCgyKSkKKwkJCWNsb3N1cmUtPnN1cHBvcnRfcmIgPSAoclsxNV0gJiAweDEwKSA/IDEg
OiAwOworCX0KIH0KIAogLyogRURJRCAxLjQgZGVmaW5lcyB0aGlzIGV4cGxpY2l0bHkuICBGb3Ig
RURJRCAxLjMsIHdlIGd1ZXNzLCBiYWRseS4gKi8KIHN0YXRpYyBib29sCiBkcm1fbW9uaXRvcl9z
dXBwb3J0c19yYihzdHJ1Y3QgZWRpZCAqZWRpZCkKIHsKKwlzdHJ1Y3QgZWRpZF9zdXBwb3J0X3Ji
X2Nsb3N1cmUgY2xvc3VyZSA9IHsKKwkJLmVkaWQgPSBlZGlkLAorCQkuc3VwcG9ydF9yYiA9IC0x
LAorCX07CisKIAlpZiAoZWRpZC0+cmV2aXNpb24gPj0gNCkgewotCQlib29sIHJldCA9IGZhbHNl
OwotCQlkcm1fZm9yX2VhY2hfZGV0YWlsZWRfYmxvY2soKHU4ICopZWRpZCwgaXNfcmIsICZyZXQp
OwotCQlyZXR1cm4gcmV0OworCQlkcm1fZm9yX2VhY2hfZGV0YWlsZWRfYmxvY2soKHU4ICopZWRp
ZCwgaXNfcmIsICZjbG9zdXJlKTsKKwkJaWYgKGNsb3N1cmUuc3VwcG9ydF9yYiA+PSAwKQorCQkJ
cmV0dXJuIGNsb3N1cmUuc3VwcG9ydF9yYjsKIAl9CiAKLQlyZXR1cm4gKChlZGlkLT5pbnB1dCAm
IERSTV9FRElEX0lOUFVUX0RJR0lUQUwpICE9IDApOworCXJldHVybiB0cnVlOwogfQogCiBzdGF0
aWMgdm9pZAotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
