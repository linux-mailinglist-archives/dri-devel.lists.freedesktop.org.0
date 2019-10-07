Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F16FFCEA2A
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2019 19:08:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 594CF6E612;
	Mon,  7 Oct 2019 17:08:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D026E626
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2019 17:08:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (modemcable118.64-20-96.mc.videotron.ca [96.20.64.118])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 59EFAE1D;
 Mon,  7 Oct 2019 19:08:17 +0200 (CEST)
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/panel: tpo-td028ttec1: Fix SPI alias
Date: Mon,  7 Oct 2019 20:08:00 +0300
Message-Id: <20191007170801.27647-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
References: <20191007170801.27647-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=ideasonboard.com; s=mail; t=1570468099;
 bh=DXdHuGh8L2hvuyVt4J3SlyqfqGITckjLGcMAX0Jhy5E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AWkS7D8wNuqDcGGyhIqz6tPrkGJwcfhlg/h41upSjqi3gW5GHc2SFKJ2+Ou9S85mp
 IsuIfTYYLNw3LeD9ALtdk2eSyw0iKpTlYo2h/vGgXgNCn26Zq5FkKVO63d8PTzM7tO
 GauLau72STmLetONwoRKfEg610U0Yux9rcon1t28=
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
Cc: linux-omap@vger.kernel.org, Tony Lindgren <tony@atomide.com>,
 "H. Nikolaus Schaller" <hns@goldelico.com>, Jyri Sarha <jsarha@ti.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, thierry.reding@gmail.com,
 letux-kernel@openphoenux.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIHBhbmVsLXRwby10ZDAyOHR0ZWMxIGRyaXZlciBpbmNvcnJlY3RseSBpbmNsdWRlcyB0aGUg
T0YgdmVuZG9yCnByZWZpeCBpbiBpdHMgU1BJIGFsaWFzLiBGaXggaXQuCgpGaXhlczogNDE1Yjhk
ZDA4NzExICgiZHJtL3BhbmVsOiBBZGQgZHJpdmVyIGZvciB0aGUgVG9wcG9seSBURDAyOFRURUMx
IHBhbmVsIikKUmVwb3J0ZWQtYnk6IEguIE5pa29sYXVzIFNjaGFsbGVyIDxobnNAZ29sZGVsaWNv
LmNvbT4KU2lnbmVkLW9mZi1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQw
Mjh0dGVjMS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRk
MDI4dHRlYzEuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC10cG8tdGQwMjh0dGVjMS5j
CmluZGV4IGQ3YjJlMzQ2MjZlZi4uZjJiYWZmODI3ZjUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dw
dS9kcm0vcGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYworKysgYi9kcml2ZXJzL2dwdS9kcm0v
cGFuZWwvcGFuZWwtdHBvLXRkMDI4dHRlYzEuYwpAQCAtMzc1LDggKzM3NSw3IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIHRkMDI4dHRlYzFfb2ZfbWF0Y2hbXSA9IHsKIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIHRkMDI4dHRlYzFfb2ZfbWF0Y2gpOwogCiBzdGF0aWMgY29uc3Qg
c3RydWN0IHNwaV9kZXZpY2VfaWQgdGQwMjh0dGVjMV9pZHNbXSA9IHsKLQl7ICJ0cG8sdGQwMjh0
dGVjMSIsIDB9LAotCXsgInRvcHBvbHksdGQwMjh0dGVjMSIsIDAgfSwKKwl7ICJ0ZDAyOHR0ZWMx
IiwgMCB9LAogCXsgLyogc2VudGluZWwgKi8gfQogfTsKIAotLSAKUmVnYXJkcywKCkxhdXJlbnQg
UGluY2hhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
