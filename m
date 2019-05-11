Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2283C1A992
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 23:07:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810E189BAE;
	Sat, 11 May 2019 21:07:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47E9B89ADC
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 21:07:38 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7D154D50;
 Sat, 11 May 2019 23:07:34 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/10] drm: rcar-du: Skip LVDS1 output on Gen3 when using
 dual-link LVDS mode
Date: Sun, 12 May 2019 00:06:59 +0300
Message-Id: <20190511210702.18394-8-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20190511210702.18394-1-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1557608854;
 bh=LaqJQT6TEqzcvHGeZpP78ao6L1MaaEzUsxmXK7DkUpc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UlFNRkKns+6amkU71I+chDhVQbrtu52/qwYmxZsvfG+03xaPLIJFtl33YjLJbFefJ
 sdgLFiHSJi+O0JpjOFZ2nHXKoBxRC/2MgSdYGaQoP3NWExTtOG0LVEY0klg41VpiSH
 rYdskH5LYkQvCuNtO6+fbt8tUWAZ30e0Xoq7JzIs=
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gZHVhbC1saW5rIExWRFMgbW9kZSwgdGhlIExWRFMxIGVuY29kZXIgaXMgdXNlZCBhcyBhIGNv
bXBhbmlvbiBmb3IKTFZEUzAsIGFuZCBib3RoIGVuY29kZXJzIHRyYW5zbWl0IGRhdGEgZnJvbSBE
VTAuIFRoZSBMVkRTMSBvdXRwdXQgb2YgRFUxCmNhbid0IGJlIHVzZWQgaW4gdGhhdCBjYXNlLCBk
b24ndCBjcmVhdGUgYW4gZW5jb2RlciBhbmQgY29ubmVjdG9yIGZvcgppdC4KClNpZ25lZC1vZmYt
Ynk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnQrcmVuZXNhc0BpZGVhc29uYm9h
cmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZW5jb2Rlci5jIHwg
MTIgKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jICAg
ICB8ICAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24o
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1X2VuY29kZXIu
YyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZW5jb2Rlci5jCmluZGV4IDZjOTE3
NTNhZjdiYy4uZmUwNDZkMTk0OTQ0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmNhci1k
dS9yY2FyX2R1X2VuY29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2R1
X2VuY29kZXIuYwpAQCAtMTYsNiArMTYsNyBAQAogI2luY2x1ZGUgInJjYXJfZHVfZHJ2LmgiCiAj
aW5jbHVkZSAicmNhcl9kdV9lbmNvZGVyLmgiCiAjaW5jbHVkZSAicmNhcl9kdV9rbXMuaCIKKyNp
bmNsdWRlICJyY2FyX2x2ZHMuaCIKIAogLyogLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0KICAqIEVuY29k
ZXIKQEAgLTk3LDYgKzk4LDE3IEBAIGludCByY2FyX2R1X2VuY29kZXJfaW5pdChzdHJ1Y3QgcmNh
cl9kdV9kZXZpY2UgKnJjZHUsCiAJCX0KIAl9CiAKKwkvKgorCSAqIE9uIEdlbjMgc2tpcCB0aGUg
TFZEUzEgb3V0cHV0IGlmIHRoZSBMVkRTMSBlbmNvZGVyIGlzIHVzZWQgYXMgYQorCSAqIGNvbXBh
bmlvbiBmb3IgTFZEUzAgaW4gZHVhbC1saW5rIG1vZGUuCisJICovCisJaWYgKHJjZHUtPmluZm8t
PmdlbiA+PSAzICYmIG91dHB1dCA9PSBSQ0FSX0RVX09VVFBVVF9MVkRTMSkgeworCQlpZiAoYnJp
ZGdlICYmIHJjYXJfbHZkc19kdWFsX2xpbmsoYnJpZGdlKSkgeworCQkJcmV0ID0gLUVOT0xJTks7
CisJCQlnb3RvIGRvbmU7CisJCX0KKwl9CisKIAlyZXQgPSBkcm1fZW5jb2Rlcl9pbml0KHJjZHUt
PmRkZXYsIGVuY29kZXIsICZlbmNvZGVyX2Z1bmNzLAogCQkJICAgICAgIERSTV9NT0RFX0VOQ09E
RVJfTk9ORSwgTlVMTCk7CiAJaWYgKHJldCA8IDApCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmNhci1kdS9yY2FyX2R1X2ttcy5jIGIvZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9k
dV9rbXMuYwppbmRleCBmOGY3ZmZmMzRkZmYuLjk1YzgxZTU5ZTJmMSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9rbXMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmNhci1kdS9yY2FyX2R1X2ttcy5jCkBAIC0zNzgsNyArMzc4LDcgQEAgc3RhdGljIGludCByY2Fy
X2R1X2VuY29kZXJzX2luaXRfb25lKHN0cnVjdCByY2FyX2R1X2RldmljZSAqcmNkdSwKIAl9CiAK
IAlyZXQgPSByY2FyX2R1X2VuY29kZXJfaW5pdChyY2R1LCBvdXRwdXQsIGVudGl0eSk7Ci0JaWYg
KHJldCAmJiByZXQgIT0gLUVQUk9CRV9ERUZFUikKKwlpZiAocmV0ICYmIHJldCAhPSAtRVBST0JF
X0RFRkVSICYmIHJldCAhPSAtRU5PTElOSykKIAkJZGV2X3dhcm4ocmNkdS0+ZGV2LAogCQkJICJm
YWlsZWQgdG8gaW5pdGlhbGl6ZSBlbmNvZGVyICVwT0Ygb24gb3V0cHV0ICV1ICglZCksIHNraXBw
aW5nXG4iLAogCQkJIGVudGl0eSwgb3V0cHV0LCByZXQpOwotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
