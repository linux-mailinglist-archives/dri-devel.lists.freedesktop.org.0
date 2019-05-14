Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C40DE1E8EB
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2019 09:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C02689668;
	Wed, 15 May 2019 07:22:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.siol.net (mailoutvs31.siol.net [185.57.226.222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DACD892D2
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2019 20:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTP id 6A9F2521EE8;
 Tue, 14 May 2019 22:43:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at psrvmta09.zcs-production.pri
Received: from mail.siol.net ([127.0.0.1])
 by localhost (psrvmta09.zcs-production.pri [127.0.0.1]) (amavisd-new,
 port 10032)
 with ESMTP id an7GL3Abu5SR; Tue, 14 May 2019 22:43:50 +0200 (CEST)
Received: from mail.siol.net (localhost [127.0.0.1])
 by mail.siol.net (Postfix) with ESMTPS id 1CCDB521E08;
 Tue, 14 May 2019 22:43:50 +0200 (CEST)
Received: from localhost.localdomain (cpe-86-58-52-202.static.triera.net
 [86.58.52.202]) (Authenticated sender: 031275009)
 by mail.siol.net (Postfix) with ESMTPSA id 8202D521EE8;
 Tue, 14 May 2019 22:43:47 +0200 (CEST)
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org
Subject: [PATCH 2/2] drm/sun4i: Fix sun8i HDMI PHY configuration for > 148.5
 MHz
Date: Tue, 14 May 2019 22:43:37 +0200
Message-Id: <20190514204337.11068-3-jernej.skrabec@siol.net>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190514204337.11068-1-jernej.skrabec@siol.net>
References: <20190514204337.11068-1-jernej.skrabec@siol.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 15 May 2019 07:21:53 +0000
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 stable@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VmVuZG9yIHByb3ZpZGVkIGRvY3VtZW50YXRpb24gc2F5cyB0aGF0IEVNUCBiaXRzIHNob3VsZCBi
ZSBzZXQgdG8gMyBmb3IKcGl4ZWwgY2xvY2tzIGdyZWF0ZXIgdGhhbiAxNDguNSBNSHouCgpGaXgg
dGhhdC4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnICMgNC4xNysKRml4ZXM6IDRmODZlODE3
NDhmZSAoImRybS9zdW40aTogQWRkIHN1cHBvcnQgZm9yIEgzIEhETUkgUEhZIHZhcmlhbnQiKQpT
aWduZWQtb2ZmLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAc2lvbC5uZXQ+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2hkbWlfcGh5LmMgfCAzICsrLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9oZG1pX3BoeS5jIGIvZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjhpX2hkbWlfcGh5LmMKaW5kZXggYWZjNmQ0YTljMjBiLi40MzY0M2FkMzE3MzAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9oZG1pX3BoeS5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aV9oZG1pX3BoeS5jCkBAIC0yOTMsNyArMjkzLDggQEAg
c3RhdGljIGludCBzdW44aV9oZG1pX3BoeV9jb25maWdfaDMoc3RydWN0IGR3X2hkbWkgKmhkbWks
CiAJCQkJIFNVTjhJX0hETUlfUEhZX0FOQV9DRkcyX1JFR19CSUdTVyB8CiAJCQkJIFNVTjhJX0hE
TUlfUEhZX0FOQV9DRkcyX1JFR19TTFYoNCk7CiAJCWFuYV9jZmczX2luaXQgfD0gU1VOOElfSERN
SV9QSFlfQU5BX0NGRzNfUkVHX0FNUENLKDkpIHwKLQkJCQkgU1VOOElfSERNSV9QSFlfQU5BX0NG
RzNfUkVHX0FNUCgxMyk7CisJCQkJIFNVTjhJX0hETUlfUEhZX0FOQV9DRkczX1JFR19BTVAoMTMp
IHwKKwkJCQkgU1VOOElfSERNSV9QSFlfQU5BX0NGRzNfUkVHX0VNUCgzKTsKIAl9CiAKIAlyZWdt
YXBfdXBkYXRlX2JpdHMocGh5LT5yZWdzLCBTVU44SV9IRE1JX1BIWV9BTkFfQ0ZHMV9SRUcsCi0t
IAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
