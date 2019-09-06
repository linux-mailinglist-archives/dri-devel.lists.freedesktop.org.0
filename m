Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC9BAD3BD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2019 09:23:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9B589861;
	Mon,  9 Sep 2019 07:23:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA5DC6E2A8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 13:53:42 +0000 (UTC)
X-Originating-IP: 2.224.242.101
Received: from uno.lan (2-224-242-101.ip172.fastwebnet.it [2.224.242.101])
 (Authenticated sender: jacopo@jmondi.org)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id D5274FF816;
 Fri,  6 Sep 2019 13:53:38 +0000 (UTC)
From: Jacopo Mondi <jacopo+renesas@jmondi.org>
To: laurent.pinchart@ideasonboard.com, kieran.bingham+renesas@ideasonboard.com,
 geert@linux-m68k.org, horms@verge.net.au, uli+renesas@fpond.eu,
 VenkataRajesh.Kalakodima@in.bosch.com
Subject: [PATCH v4 6/9] drm: rcar-du: crtc: Enable and disable CMMs
Date: Fri,  6 Sep 2019 15:54:33 +0200
Message-Id: <20190906135436.10622-7-jacopo+renesas@jmondi.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
References: <20190906135436.10622-1-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 09 Sep 2019 07:23:02 +0000
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
Cc: muroya@ksk.co.jp, airlied@linux.ie, koji.matsuoka.xm@renesas.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Harsha.ManjulaMallikarjun@in.bosch.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RW5hYmxlL2Rpc2FibGUgdGhlIENNTSBhc3NvY2lhdGVkIHdpdGggYSBDUlRDIGF0IENSVEMgc3Rh
cnQgYW5kIHN0b3AKdGltZSBhbmQgZW5hYmxlIHRoZSBDTU0gdW5pdCB0aHJvdWdoIHRoZSBEaXNw
bGF5IEV4dGVuc2lvbmFsIEZ1bmN0aW9ucwpyZWdpc3RlciBhdCBncm91cCBzZXR1cCB0aW1lLgoK
UmV2aWV3ZWQtYnk6IFVscmljaCBIZWNodCA8dWxpK3JlbmVzYXNAZnBvbmQuZXU+ClJldmlld2Vk
LWJ5OiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25ib2FyZC5jb20+
ClNpZ25lZC1vZmYtYnk6IEphY29wbyBNb25kaSA8amFjb3BvK3JlbmVzYXNAam1vbmRpLm9yZz4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2NydGMuYyAgfCA3ICsrKysrKysK
IGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZ3JvdXAuYyB8IDggKysrKysrKysKIGRy
aXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfcmVncy5oICB8IDUgKysrKysKIDMgZmlsZXMg
Y2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfY3J0Yy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9j
cnRjLmMKaW5kZXggMjNmMWQ2Y2MxNzE5Li4zZGFjNjA1YzNhNjcgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfY3J0Yy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfY3J0Yy5jCkBAIC0yMSw2ICsyMSw3IEBACiAjaW5jbHVkZSA8ZHJtL2Ry
bV9wbGFuZV9oZWxwZXIuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3ZibGFuay5oPgogCisjaW5jbHVk
ZSAicmNhcl9jbW0uaCIKICNpbmNsdWRlICJyY2FyX2R1X2NydGMuaCIKICNpbmNsdWRlICJyY2Fy
X2R1X2Rydi5oIgogI2luY2x1ZGUgInJjYXJfZHVfZW5jb2Rlci5oIgpAQCAtNjE5LDYgKzYyMCw5
IEBAIHN0YXRpYyB2b2lkIHJjYXJfZHVfY3J0Y19zdG9wKHN0cnVjdCByY2FyX2R1X2NydGMgKnJj
cnRjKQogCWlmIChyY2FyX2R1X2hhcyhyY3J0Yy0+ZGV2LCBSQ0FSX0RVX0ZFQVRVUkVfVlNQMV9T
T1VSQ0UpKQogCQlyY2FyX2R1X3ZzcF9kaXNhYmxlKHJjcnRjKTsKIAorCWlmIChyY3J0Yy0+Y21t
KQorCQlyY2FyX2NtbV9kaXNhYmxlKHJjcnRjLT5jbW0pOworCiAJLyoKIAkgKiBTZWxlY3Qgc3dp
dGNoIHN5bmMgbW9kZS4gVGhpcyBzdG9wcyBkaXNwbGF5IG9wZXJhdGlvbiBhbmQgY29uZmlndXJl
cwogCSAqIHRoZSBIU1lOQyBhbmQgVlNZTkMgc2lnbmFscyBhcyBpbnB1dHMuCkBAIC02ODYsNiAr
NjkwLDkgQEAgc3RhdGljIHZvaWQgcmNhcl9kdV9jcnRjX2F0b21pY19lbmFibGUoc3RydWN0IGRy
bV9jcnRjICpjcnRjLAogCX0KIAogCXJjYXJfZHVfY3J0Y19zdGFydChyY3J0Yyk7CisKKwlpZiAo
cmNydGMtPmNtbSkKKwkJcmNhcl9jbW1fZW5hYmxlKHJjcnRjLT5jbW0pOwogfQogCiBzdGF0aWMg
dm9pZCByY2FyX2R1X2NydGNfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9jcnRjICpjcnRjLApk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jCmluZGV4IDllZWU0Nzk2OWU3Ny4u
MjVkMGZjMTI1ZDdhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2dyb3VwLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9ncm91cC5jCkBA
IC0xNDcsNiArMTQ3LDE0IEBAIHN0YXRpYyB2b2lkIHJjYXJfZHVfZ3JvdXBfc2V0dXAoc3RydWN0
IHJjYXJfZHVfZ3JvdXAgKnJncnApCiAKIAlyY2FyX2R1X2dyb3VwX3NldHVwX3BpbnMocmdycCk7
CiAKKwlpZiAocmNhcl9kdV9oYXMocmNkdSwgUkNBUl9EVV9GRUFUVVJFX0NNTSkpIHsKKwkJdTMy
IGRlZnI3ID0gREVGUjdfQ09ERQorCQkJICB8IChyZ3JwLT5jbW1zX21hc2sgJiBCSVQoMSkgPyBE
RUZSN19DTU1FMSA6IDApCisJCQkgIHwgKHJncnAtPmNtbXNfbWFzayAmIEJJVCgwKSA/IERFRlI3
X0NNTUUwIDogMCk7CisKKwkJcmNhcl9kdV9ncm91cF93cml0ZShyZ3JwLCBERUZSNywgZGVmcjcp
OworCX0KKwogCWlmIChyY2R1LT5pbmZvLT5nZW4gPj0gMikgewogCQlyY2FyX2R1X2dyb3VwX3Nl
dHVwX2RlZnI4KHJncnApOwogCQlyY2FyX2R1X2dyb3VwX3NldHVwX2RpZHNyKHJncnApOwpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmggYi9kcml2ZXJz
L2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X3JlZ3MuaAppbmRleCBiYzg3ZjA4MGIxNzAuLmZiOTk2
NDk0OTM2OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdz
LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9yZWdzLmgKQEAgLTE5Nyw2
ICsxOTcsMTEgQEAKICNkZWZpbmUgREVGUjZfTUxPUzEJCSgxIDw8IDIpCiAjZGVmaW5lIERFRlI2
X0RFRkFVTFQJCShERUZSNl9DT0RFIHwgREVGUjZfVENORTEpCiAKKyNkZWZpbmUgREVGUjcJCQkw
eDAwMGVjCisjZGVmaW5lIERFRlI3X0NPREUJCSgweDc3NzkgPDwgMTYpCisjZGVmaW5lIERFRlI3
X0NNTUUxCQlCSVQoNikKKyNkZWZpbmUgREVGUjdfQ01NRTAJCUJJVCg0KQorCiAvKiAtLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogICogUjhBNzc5MC1vbmx5IENvbnRyb2wgUmVnaXN0ZXJzCiAgKi8KLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
