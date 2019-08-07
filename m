Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CED85531
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2019 23:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E00B56E769;
	Wed,  7 Aug 2019 21:33:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B61CB6E49C;
 Wed,  7 Aug 2019 21:33:18 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BD4753DE02;
 Wed,  7 Aug 2019 21:33:17 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-121-222.rdu2.redhat.com
 [10.10.121.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ECA21600C6;
 Wed,  7 Aug 2019 21:33:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 0/2] drm/nouveau: CRTC Runtime PM ref tracking fixes
Date: Wed,  7 Aug 2019 17:32:59 -0400
Message-Id: <20190807213304.9255-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Wed, 07 Aug 2019 21:33:18 +0000 (UTC)
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Karol Herbst <karolherbst@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SnVzdCBzb21lIHJ1bnRpbWUgUE0gZml4ZXMgZm9yIHNvbWUgbXVjaCBsZXNzIG5vdGljZWFibGUg
cnVudGltZSBQTSByZWYKdHJhY2tpbmcgaXNzdWVzIHRoYXQgSSBnb3QgcmVtaW5kZWQgb2Ygd2hl
biBmaXhpbmcgc29tZSB1bnJlbGF0ZWQgaXNzdWVzCndpdGggbm91dmVhdS4KCkx5dWRlIFBhdWwg
KDIpOgogIGRybS9ub3V2ZWF1L2Rpc3BudjA0OiBHcmFiL3B1dCBydW50aW1lIFBNIHJlZnMgb24g
RFBNUyBvbi9vZmYKICBkcm0vbm91dmVhdS9kaXNwbnY1MDogRml4IHJ1bnRpbWUgUE0gcmVmIHRy
YWNraW5nIGZvciBub24tYmxvY2tpbmcKICAgIG1vZGVzZXRzCgogZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvZGlzcG52MDQvY3J0Yy5jIHwgMTggKysrLS0tLS0tLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgfCAzOCArKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rydi5oICAgfCAgMyAtLQogMyBmaWxlcyBj
aGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAzOCBkZWxldGlvbnMoLSkKCi0tIAoyLjIxLjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
