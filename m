Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2C1F41BD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 09:13:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E0376F888;
	Fri,  8 Nov 2019 08:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from condef-04.nifty.com (condef-04.nifty.com [202.248.20.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A7B6E595;
 Fri,  8 Nov 2019 05:30:02 +0000 (UTC)
Received: from conuserg-08.nifty.com ([10.126.8.71])by condef-04.nifty.com
 with ESMTP id xA85F0x6003787; Fri, 8 Nov 2019 14:15:00 +0900
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-08.nifty.com with ESMTP id xA85E4kr007705;
 Fri, 8 Nov 2019 14:14:05 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-08.nifty.com xA85E4kr007705
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915: change to_mock() to an inline function
Date: Fri,  8 Nov 2019 14:13:55 +0900
Message-Id: <20191108051356.29980-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Fri, 08 Nov 2019 08:12:31 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nifty.com; s=dec2015msa; t=1573190046;
 bh=yfawSp5OIyMMuGnL0XInEnRM8aE3vEYt+IwcZoO4q/Y=;
 h=From:To:Cc:Subject:Date:From;
 b=aNmCJr6koHmis2nuJdLfb3+XwQWcIpir1IDHuLudT0cr/gACI4RFc3IjJELzW+wrg
 a9ks+0WXkxNw8amIYzuFWHvrY8GX0fEm0NDrbtRfvkhTJm4OeI6S71j5Lv0qc576mY
 EubDXOlmfGJlzH4IjEFlHiVf3y/ZSQi99auKspI3aGlzOFNUntmkSSKXCqjZdtm358
 k0zdFx5bTPtscvMPpA9S/vODh00rPq9cSIyuoRx9Ojqy0MDVp+qFetISWVlgRG+5pR
 9qnV/2wGazP2s+zxP32BRSDWClq7E0H9SgwKcrkAmCwYlfEQdLuSnbl6xZ8d6yadGt
 O0/qw0ZxeyXOQ==
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
Cc: David Airlie <airlied@linux.ie>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

U2luY2UgdGhpcyBmdW5jdGlvbiBpcyBkZWZpbmVkIGluIGEgaGVhZGVyIGZpbGUsIGl0IHNob3Vs
ZCBiZQonc3RhdGljIGlubGluZScgaW5zdGVhZCBvZiAnc3RhdGljJy4KClNpZ25lZC1vZmYtYnk6
IE1hc2FoaXJvIFlhbWFkYSA8eWFtYWRhLm1hc2FoaXJvQHNvY2lvbmV4dC5jb20+Ci0tLQoKIGRy
aXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvbW9ja19kbWFidWYuaCB8IDIgKy0KIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvbW9ja19kbWFidWYuaCBiL2RyaXZl
cnMvZ3B1L2RybS9pOTE1L2dlbS9zZWxmdGVzdHMvbW9ja19kbWFidWYuaAppbmRleCBmMGY4YmJk
ODJkZmMuLjIyODE4YmJiMTM5ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZ2Vt
L3NlbGZ0ZXN0cy9tb2NrX2RtYWJ1Zi5oCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2dlbS9z
ZWxmdGVzdHMvbW9ja19kbWFidWYuaApAQCAtMTQsNyArMTQsNyBAQCBzdHJ1Y3QgbW9ja19kbWFi
dWYgewogCXN0cnVjdCBwYWdlICpwYWdlc1tdOwogfTsKIAotc3RhdGljIHN0cnVjdCBtb2NrX2Rt
YWJ1ZiAqdG9fbW9jayhzdHJ1Y3QgZG1hX2J1ZiAqYnVmKQorc3RhdGljIGlubGluZSBzdHJ1Y3Qg
bW9ja19kbWFidWYgKnRvX21vY2soc3RydWN0IGRtYV9idWYgKmJ1ZikKIHsKIAlyZXR1cm4gYnVm
LT5wcml2OwogfQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
