Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B244A1CE
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jun 2019 15:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8E096E170;
	Tue, 18 Jun 2019 13:13:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E60746E170
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jun 2019 13:13:51 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi
 (dfj612yhrgyx302h3jwwy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:21f5:5b00:ce28:277f:58d7:3ca4])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 449C9D5;
 Tue, 18 Jun 2019 15:13:50 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Replace drm_driver GEM ops with GEM object
 functions
Date: Tue, 18 Jun 2019 16:13:29 +0300
Message-Id: <20190618131329.30336-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1560863630;
 bh=8lTmOFsGGCcA400emQjhecMfjJyqMv++H6+9NE85nd8=;
 h=From:To:Cc:Subject:Date:From;
 b=ROpD0Tf34YWgv+A5lKnd15jRpj09ocpJnvak2GVcsfXftNtgcEqPyeeYr962Rzzvn
 XKZqTRzFwl9stOPCy/CHAqPHWb3u2akY/8pRNQT1ER6LHbSoVksgjai46WouTlGqG/
 QVTgyAUdO97zqblNDJq/PqOPMG8PIin8KgFIaBSw=
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
Cc: linux-renesas-soc@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHJlY29tbWVuZGVkIHdheSB0byBzcGVjaWZ5IEdFTSBvYmplY3QgZnVuY3Rpb25zIGlzIHRv
IHByb3ZpZGUgYQpkcm1fZ2VtX29iamVjdF9mdW5jcyBzdHJ1Y3R1cmUgaW5zdGFuY2UgYW5kIHNl
dCB0aGUgR0VNIG9iamVjdCB0byBwb2ludAp0byBpdC4gVGhlIGRybV9jbWFfZ2VtX2NyZWF0ZV9v
YmplY3RfZGVmYXVsdF9mdW5jcygpIGZ1bmN0aW9uIHByb3ZpZGVkCmJ5IHRoZSBHRU0gQ01BIGhl
bHBlciBkb2VzIHNvIHdoZW4gY3JlYXRpbmcgdGhlIEdFTSBvYmplY3QsIHNpbXBsaWZ5aW5nCnRo
ZSBkcml2ZXIgaW1wbGVtZW50YXRpb24uIFN3aXRjaCB0byBpdCwgYW5kIHJlbW92ZSB0aGUgdGhl
biB1bm5lZWRlZApHRU0tcmVsYXRlZCBvcGVydGlvbnMgZnJvbSByY2FyX2R1X2RyaXZlci4KClN1
Z2dlc3RlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KU2lnbmVk
LW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydCtyZW5lc2FzQGlkZWFz
b25ib2FyZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyB8
IDggKy0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMo
LSkKCkRhbmllbCwgaXMgdGhpcyB3aGF0IHlvdSBoYWQgaW4gbWluZCA/CgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9y
Y2FyLWR1L3JjYXJfZHVfZHJ2LmMKaW5kZXggM2U1ZTgzNWVhMmI2Li40Y2JiODIwMDk5MzEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfZHVfZHJ2LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3JjYXItZHUvcmNhcl9kdV9kcnYuYwpAQCAtNDQ1LDE2ICs0NDUsMTAgQEAg
REVGSU5FX0RSTV9HRU1fQ01BX0ZPUFMocmNhcl9kdV9mb3BzKTsKIHN0YXRpYyBzdHJ1Y3QgZHJt
X2RyaXZlciByY2FyX2R1X2RyaXZlciA9IHsKIAkuZHJpdmVyX2ZlYXR1cmVzCT0gRFJJVkVSX0dF
TSB8IERSSVZFUl9NT0RFU0VUIHwgRFJJVkVSX1BSSU1FCiAJCQkJfCBEUklWRVJfQVRPTUlDLAot
CS5nZW1fZnJlZV9vYmplY3RfdW5sb2NrZWQgPSBkcm1fZ2VtX2NtYV9mcmVlX29iamVjdCwKLQku
Z2VtX3ZtX29wcwkJPSAmZHJtX2dlbV9jbWFfdm1fb3BzLAorCS5nZW1fY3JlYXRlX29iamVjdCAg
ICAgID0gZHJtX2NtYV9nZW1fY3JlYXRlX29iamVjdF9kZWZhdWx0X2Z1bmNzLAogCS5wcmltZV9o
YW5kbGVfdG9fZmQJPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJpbWVfZmRfdG9f
aGFuZGxlCT0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdlbV9wcmltZV9pbXBvcnQJ
PSBkcm1fZ2VtX3ByaW1lX2ltcG9ydCwKLQkuZ2VtX3ByaW1lX2V4cG9ydAk9IGRybV9nZW1fcHJp
bWVfZXhwb3J0LAotCS5nZW1fcHJpbWVfZ2V0X3NnX3RhYmxlCT0gZHJtX2dlbV9jbWFfcHJpbWVf
Z2V0X3NnX3RhYmxlLAogCS5nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlID0gZHJtX2dlbV9jbWFf
cHJpbWVfaW1wb3J0X3NnX3RhYmxlLAotCS5nZW1fcHJpbWVfdm1hcAkJPSBkcm1fZ2VtX2NtYV9w
cmltZV92bWFwLAotCS5nZW1fcHJpbWVfdnVubWFwCT0gZHJtX2dlbV9jbWFfcHJpbWVfdnVubWFw
LAogCS5nZW1fcHJpbWVfbW1hcAkJPSBkcm1fZ2VtX2NtYV9wcmltZV9tbWFwLAogCS5kdW1iX2Ny
ZWF0ZQkJPSByY2FyX2R1X2R1bWJfY3JlYXRlLAogCS5mb3BzCQkJPSAmcmNhcl9kdV9mb3BzLAot
LSAKUmVnYXJkcywKCkxhdXJlbnQgUGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
