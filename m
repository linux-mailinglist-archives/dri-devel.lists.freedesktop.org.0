Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA7B61B0E
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 09:12:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59CA89AC9;
	Mon,  8 Jul 2019 07:12:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06716E375
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Jul 2019 14:07:24 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.localdomain (2-224-242-101.ip172.fastwebnet.it
 [2.224.242.101]) (Authenticated sender: jacopo@jmondi.org)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 46BC4C0005;
 Sat,  6 Jul 2019 14:07:21 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH v2 17/19] drm: rcar-du: crtc: Enable and disable CMMs
Date: Sat,  6 Jul 2019 16:07:44 +0200
Message-Id: <20190706140746.29132-18-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
References: <20190706140746.29132-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 08 Jul 2019 07:11:53 +0000
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
Cc: muroya@ksk.co.jp, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, VenkataRajesh.Kalakodima@in.bosch.com,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlL2Rpc2FibGUgdGhlIENNTSBhc3NvY2lhdGVkIHdpdGggYSBDUlRDIGF0IGNydGMgc3Rh
cnQgYW5kIHN0b3AKdGltZSBhbmQgZW5hYmxlIHRoZSBDTU0gdW5pdCB0aHJvdWdoIHRoZSBEaXNw
bGF5IEV4dGVuc2lvbmFsIEZ1bmN0aW9ucwpyZWdpc3RlciBhdCBncm91cCBzZXR1cCB0aW1lLgoK
U2lnbmVkLW9mZi1ieTogSmFjb3BvIE1vbmRpIDxqYWNvcG8rcmVuZXNhc0BqbW9uZGkub3JnPgot
LS0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jICB8IDcgKysrKysrKwog
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jIHwgOCArKysrKysrKwogZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmggIHwgNSArKysrKwogMyBmaWxlcyBj
aGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9kdV9jcnRjLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2Ny
dGMuYwppbmRleCAyM2YxZDZjYzE3MTkuLjNkYWM2MDVjM2E2NyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9jcnRjLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3Jj
YXItZHUvcmNhcl9kdV9jcnRjLmMKQEAgLTIxLDYgKzIxLDcgQEAKICNpbmNsdWRlIDxkcm0vZHJt
X3BsYW5lX2hlbHBlci5oPgogI2luY2x1ZGUgPGRybS9kcm1fdmJsYW5rLmg+CiAKKyNpbmNsdWRl
ICJyY2FyX2NtbS5oIgogI2luY2x1ZGUgInJjYXJfZHVfY3J0Yy5oIgogI2luY2x1ZGUgInJjYXJf
ZHVfZHJ2LmgiCiAjaW5jbHVkZSAicmNhcl9kdV9lbmNvZGVyLmgiCkBAIC02MTksNiArNjIwLDkg
QEAgc3RhdGljIHZvaWQgcmNhcl9kdV9jcnRjX3N0b3Aoc3RydWN0IHJjYXJfZHVfY3J0YyAqcmNy
dGMpCiAJaWYgKHJjYXJfZHVfaGFzKHJjcnRjLT5kZXYsIFJDQVJfRFVfRkVBVFVSRV9WU1AxX1NP
VVJDRSkpCiAJCXJjYXJfZHVfdnNwX2Rpc2FibGUocmNydGMpOwogCisJaWYgKHJjcnRjLT5jbW0p
CisJCXJjYXJfY21tX2Rpc2FibGUocmNydGMtPmNtbSk7CisKIAkvKgogCSAqIFNlbGVjdCBzd2l0
Y2ggc3luYyBtb2RlLiBUaGlzIHN0b3BzIGRpc3BsYXkgb3BlcmF0aW9uIGFuZCBjb25maWd1cmVz
CiAJICogdGhlIEhTWU5DIGFuZCBWU1lOQyBzaWduYWxzIGFzIGlucHV0cy4KQEAgLTY4Niw2ICs2
OTAsOSBAQCBzdGF0aWMgdm9pZCByY2FyX2R1X2NydGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJt
X2NydGMgKmNydGMsCiAJfQogCiAJcmNhcl9kdV9jcnRjX3N0YXJ0KHJjcnRjKTsKKworCWlmIChy
Y3J0Yy0+Y21tKQorCQlyY2FyX2NtbV9lbmFibGUocmNydGMtPmNtbSk7CiB9CiAKIHN0YXRpYyB2
b2lkIHJjYXJfZHVfY3J0Y19hdG9taWNfZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmNydGMsCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2dyb3VwLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2dyb3VwLmMKaW5kZXggOWVlZTQ3OTY5ZTc3Li5k
MjUyYzliYjk4MDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVf
Z3JvdXAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2dyb3VwLmMKQEAg
LTE0Nyw2ICsxNDcsMTQgQEAgc3RhdGljIHZvaWQgcmNhcl9kdV9ncm91cF9zZXR1cChzdHJ1Y3Qg
cmNhcl9kdV9ncm91cCAqcmdycCkKIAogCXJjYXJfZHVfZ3JvdXBfc2V0dXBfcGlucyhyZ3JwKTsK
IAorCWlmIChyY2FyX2R1X2hhcyhyY2R1LCBSQ0FSX0RVX0ZFQVRVUkVfQ01NKSkgeworCQl1MzIg
ZGVmcjcgPSBERUZSN19DT0RFIHwKKwkJCSAgICAocmdycC0+Y21tc19tYXNrICYgQklUKDEpID8g
REVGUjdfQ01NRTEgOiAwKSB8CisJCQkgICAgKHJncnAtPmNtbXNfbWFzayAmIEJJVCgwKSA/IERF
RlI3X0NNTUUwIDogMCk7CisKKwkJcmNhcl9kdV9ncm91cF93cml0ZShyZ3JwLCBERUZSNywgZGVm
cjcpOworCX0KKwogCWlmIChyY2R1LT5pbmZvLT5nZW4gPj0gMikgewogCQlyY2FyX2R1X2dyb3Vw
X3NldHVwX2RlZnI4KHJncnApOwogCQlyY2FyX2R1X2dyb3VwX3NldHVwX2RpZHNyKHJncnApOwpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmggYi9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3JlZ3MuaAppbmRleCBiYzg3ZjA4MGIxNzAuLmZi
OTk2NDk0OTM2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9y
ZWdzLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmgKQEAgLTE5
Nyw2ICsxOTcsMTEgQEAKICNkZWZpbmUgREVGUjZfTUxPUzEJCSgxIDw8IDIpCiAjZGVmaW5lIERF
RlI2X0RFRkFVTFQJCShERUZSNl9DT0RFIHwgREVGUjZfVENORTEpCiAKKyNkZWZpbmUgREVGUjcJ
CQkweDAwMGVjCisjZGVmaW5lIERFRlI3X0NPREUJCSgweDc3NzkgPDwgMTYpCisjZGVmaW5lIERF
RlI3X0NNTUUxCQlCSVQoNikKKyNkZWZpbmUgREVGUjdfQ01NRTAJCUJJVCg0KQorCiAvKiAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogICogUjhBNzc5MC1vbmx5IENvbnRyb2wgUmVnaXN0ZXJzCiAgKi8K
LS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
