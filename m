Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FA27EEDD
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 10:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E95606ED22;
	Fri,  2 Aug 2019 08:19:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com
 [210.160.252.171])
 by gabe.freedesktop.org (Postfix) with ESMTP id A585E6ECDF
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 07:40:19 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.64,337,1559487600"; d="scan'208";a="23151206"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
 by relmlie5.idc.renesas.com with ESMTP; 02 Aug 2019 16:35:16 +0900
Received: from fabrizio-dev.ree.adwin.renesas.com (unknown [10.226.36.196])
 by relmlir5.idc.renesas.com (Postfix) with ESMTP id 0EA3840078B4;
 Fri,  2 Aug 2019 16:35:13 +0900 (JST)
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH/RFC 09/12] drm: rcar-du: lvds: Fix companion's mode
Date: Fri,  2 Aug 2019 08:34:06 +0100
Message-Id: <1564731249-22671-10-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
References: <1564731249-22671-1-git-send-email-fabrizio.castro@bp.renesas.com>
X-Mailman-Approved-At: Fri, 02 Aug 2019 08:19:03 +0000
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
Cc: Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Simon Horman <horms@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIGNvbXBhbmlvbiBlbmNvZGVyIG5lZWRzIHRvIGJlIHRvbGQgdG8gdXNlIHRoZSBzYW1lCm1v
ZGUgYXMgdGhlIHByaW1hcnkgZW5jb2Rlci4KCkZpeGVzOiBlOWU4Nzk4YWI3YjggKCJkcm06IHJj
YXItZHU6IGx2ZHM6IEFkZCBzdXBwb3J0IGZvciBkdWFsLWxpbmsgbW9kZSIpClNpZ25lZC1vZmYt
Ynk6IEZhYnJpemlvIENhc3RybyA8ZmFicml6aW8uY2FzdHJvQGJwLnJlbmVzYXMuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jIHwgNiArKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vcmNhci1kdS9yY2FyX2x2ZHMuYyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfbHZkcy5jCmluZGV4IGVkZDYzZjUuLjc5NDRhZTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9yY2FyLWR1L3JjYXJfbHZkcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9yY2FyLWR1
L3JjYXJfbHZkcy5jCkBAIC00MTUsOCArNDE1LDEyIEBAIHN0YXRpYyB2b2lkIHJjYXJfbHZkc19l
bmFibGUoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSkKIAkJcmV0dXJuOwogCiAJLyogRW5hYmxl
IHRoZSBjb21wYW5pb24gTFZEUyBlbmNvZGVyIGluIGR1YWwtbGluayBtb2RlLiAqLwotCWlmIChs
dmRzLT5kdWFsX2xpbmsgJiYgbHZkcy0+Y29tcGFuaW9uKQorCWlmIChsdmRzLT5kdWFsX2xpbmsg
JiYgbHZkcy0+Y29tcGFuaW9uKSB7CisJCXN0cnVjdCByY2FyX2x2ZHMgKmNvbXBhbmlvbl9sdmRz
ID0gYnJpZGdlX3RvX3JjYXJfbHZkcygKKwkJCQkJCQlsdmRzLT5jb21wYW5pb24pOworCQljb21w
YW5pb25fbHZkcy0+bW9kZSA9IGx2ZHMtPm1vZGU7CiAJCWx2ZHMtPmNvbXBhbmlvbi0+ZnVuY3Mt
PmVuYWJsZShsdmRzLT5jb21wYW5pb24pOworCX0KIAogCS8qCiAJICogSGFyZGNvZGUgdGhlIGNo
YW5uZWxzIGFuZCBjb250cm9sIHNpZ25hbHMgcm91dGluZyBmb3Igbm93LgotLSAKMi43LjQKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
