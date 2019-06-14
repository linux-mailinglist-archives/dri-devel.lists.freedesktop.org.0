Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0B645C5B
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 14:13:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362458970E;
	Fri, 14 Jun 2019 12:13:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58E7789612
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 12:13:41 +0000 (UTC)
X-Originating-IP: 90.88.23.150
Received: from localhost (aaubervilliers-681-1-81-150.w90-88.abo.wanadoo.fr
 [90.88.23.150]) (Authenticated sender: maxime.ripard@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 2655FFF80E;
 Fri, 14 Jun 2019 12:13:37 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>
Subject: [PATCH v4 03/12] drm/client: Restrict the rotation check to the
 rotation itself
Date: Fri, 14 Jun 2019 14:13:10 +0200
Message-Id: <4b1a140ab66dc31571e07c0881f9d9dc6397f403.1560514379.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
References: <cover.5fc7840dc8fb24744516c13acb8c8aa18e44c0d0.1560514379.git-series.maxime.ripard@bootlin.com>
MIME-Version: 1.0
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
Cc: eben@raspberrypi.org, dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGRybV9jbGllbnRfcm90YXRpb24gaGFzIGEgY2hlY2sgb24gdGhlIHJvdGF0aW9uIHZhbHVl
LCBidXQgdGhlCnJlZmxlY3Rpb25zIGFyZSBhbHNvIHN0b3JlZCBpbiB0aGUgc2FtZSB2YXJpYWJs
ZSwgYW5kIHRoZSBjaGVjayBkb2Vzbid0CnRha2UgdGhpcyBpbnRvIGFjY291bnQuCgpUaGVyZWZv
cmUsIGV2ZW4gdGhvdWdoIHdlIG1pZ2h0IGhhdmUgYSB2YWxpZCByb3RhdGlvbiwgaWYgd2UncmUg
YWxzbyB1c2luZwphIHJlZmxlY3Rpb24gcGFyYW1ldGVyLCB0aGUgdGVzdCB3aWxsIGZhaWwgZm9y
IG5vIHBhcnRpY3VsYXIgcmVhc29uLgoKU2lnbmVkLW9mZi1ieTogTWF4aW1lIFJpcGFyZCA8bWF4
aW1lLnJpcGFyZEBib290bGluLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2NsaWVudF9t
b2Rlc2V0LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQu
YyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwppbmRleCA4MjY0YzNhNzMy
YjAuLmI0ZTVmYjBhMTdjZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRf
bW9kZXNldC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fY2xpZW50X21vZGVzZXQuYwpAQCAt
ODQ1LDcgKzg0NSw4IEBAIGJvb2wgZHJtX2NsaWVudF9wYW5lbF9yb3RhdGlvbihzdHJ1Y3QgZHJt
X21vZGVfc2V0ICptb2Rlc2V0LCB1bnNpZ25lZCBpbnQgKnJvdGF0CiAJICogZGVwZW5kaW5nIG9u
IHRoZSBoYXJkd2FyZSB0aGlzIG1heSByZXF1aXJlIHRoZSBmcmFtZWJ1ZmZlcgogCSAqIHRvIGJl
IGluIGEgc3BlY2lmaWMgdGlsaW5nIGZvcm1hdC4KIAkgKi8KLQlpZiAoKnJvdGF0aW9uICE9IERS
TV9NT0RFX1JPVEFURV8xODAgfHwgIXBsYW5lLT5yb3RhdGlvbl9wcm9wZXJ0eSkKKwlpZiAoKCpy
b3RhdGlvbiAmIERSTV9NT0RFX1JPVEFURV9NQVNLKSAhPSBEUk1fTU9ERV9ST1RBVEVfMTgwIHx8
CisJICAgICFwbGFuZS0+cm90YXRpb25fcHJvcGVydHkpCiAJCXJldHVybiBmYWxzZTsKIAogCWZv
ciAoaSA9IDA7IGkgPCBwbGFuZS0+cm90YXRpb25fcHJvcGVydHktPm51bV92YWx1ZXM7IGkrKykK
LS0gCmdpdC1zZXJpZXMgMC45LjEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
