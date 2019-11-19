Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ECA103035
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2019 00:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2B86EA0C;
	Tue, 19 Nov 2019 23:28:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E7186E060
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2019 14:28:06 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 6/6] gpu/drm: ingenic: Add support for the JZ4770
Date: Tue, 19 Nov 2019 15:17:36 +0100
Message-Id: <20191119141736.74607-6-paul@crapouillou.net>
In-Reply-To: <20191119141736.74607-1-paul@crapouillou.net>
References: <20191119141736.74607-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 19 Nov 2019 23:28:08 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=crapouillou.net; 
 s=mail; t=1574173076; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2UrhUYbsD3pMOWmt9KIawFCqDt6dwZ+tLHQeK8ZQBjg=;
 b=gIxkZEYi0V3r2rGBs93YvAPBXiDzGaTirC7WlymA6PdIjhBsacsRLpZG0e0FCCtW9qgDt9
 Z49FfMP17i3mebExiAN8I8C2CbJMQypOjeaMe8QZx2gjHYg1TXDA7EKDE1W0yuG6OwQ6vv
 Iuwu5ENUpaLQWkIW7zCZkZftePkfUWc=
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
Cc: Paul Cercueil <paul@crapouillou.net>, devicetree@vger.kernel.org,
 od@zcrc.me, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIExDRCBjb250cm9sbGVyIGluIHRoZSBKWjQ3NzAgc3VwcG9ydHMgdXAgdG8gNzIwcC4gV2hp
bGUgdGhlcmUgaGFzCmJlZW4gbWFueSBuZXcgZmVhdHVyZXMgYWRkZWQgc2luY2UgdGhlIG9sZCBK
WjQ3NDAsIHdoaWNoIGFyZSBub3QgeWV0CmhhbmRsZWQgaGVyZSwgdGhpcyBkcml2ZXIgc3RpbGwg
d29ya3MgZmluZS4KClNpZ25lZC1vZmYtYnk6IFBhdWwgQ2VyY3VlaWwgPHBhdWxAY3JhcG91aWxs
b3UubmV0PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pbmdlbmljL2luZ2VuaWMtZHJtLmMgfCA3ICsr
KysrKysKIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jIGIvZHJpdmVycy9ncHUvZHJtL2luZ2Vu
aWMvaW5nZW5pYy1kcm0uYwppbmRleCBkNTc4YzRjYjYwMDkuLjQ2ZDNjZTc2M2JiOSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2luZ2VuaWMvaW5nZW5pYy1kcm0uYworKysgYi9kcml2ZXJz
L2dwdS9kcm0vaW5nZW5pYy9pbmdlbmljLWRybS5jCkBAIC04MjksOSArODI5LDE2IEBAIHN0YXRp
YyBjb25zdCBzdHJ1Y3Qganpfc29jX2luZm8gano0NzI1Yl9zb2NfaW5mbyA9IHsKIAkubWF4X2hl
aWdodCA9IDYwMCwKIH07CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3Qganpfc29jX2luZm8gano0Nzcw
X3NvY19pbmZvID0geworCS5uZWVkc19kZXZfY2xrID0gZmFsc2UsCisJLm1heF93aWR0aCA9IDEy
ODAsCisJLm1heF9oZWlnaHQgPSA3MjAsCit9OworCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9mX2Rl
dmljZV9pZCBpbmdlbmljX2RybV9vZl9tYXRjaFtdID0gewogCXsgLmNvbXBhdGlibGUgPSAiaW5n
ZW5pYyxqejQ3NDAtbGNkIiwgLmRhdGEgPSAmano0NzQwX3NvY19pbmZvIH0sCiAJeyAuY29tcGF0
aWJsZSA9ICJpbmdlbmljLGp6NDcyNWItbGNkIiwgLmRhdGEgPSAmano0NzI1Yl9zb2NfaW5mbyB9
LAorCXsgLmNvbXBhdGlibGUgPSAiaW5nZW5pYyxqejQ3NzAtbGNkIiwgLmRhdGEgPSAmano0Nzcw
X3NvY19pbmZvIH0sCiAJeyAvKiBzZW50aW5lbCAqLyB9LAogfTsKIAotLSAKMi4yNC4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
